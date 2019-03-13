#encoding:utf-8
# __author__ = 'donghao'
# __time__ = 2019/3/3 21:47
from flask import render_template,views
from flask_restful import Resource,reqparse,marshal_with,fields
from werkzeug.datastructures import MultiDict
from flask import jsonify,request, make_response,session
from utils import restful,error_form,upload
import tasks
from werkzeug.utils import secure_filename
from apps.v1.models import FrontUserModel,CommentModel,BookModel,ImagesModel
from ext import db
from apps.v1.forms import LoginForm,ChangeUsernameForm
import json
from utils import redis_cache

class Login(Resource):
    def get(self):
        form = LoginForm()
        csrf_token = form.csrf_token.current_token
        return restful.success(data=csrf_token)
    def post(self):
        myform = json.loads((request.data.decode('utf-8')))
        token = myform.get('token',None)
        if token:
            token = json.loads(token).get('data')
            user = FrontUserModel.verify_auth_token(token)
            if user:
                resp = make_response(restful.success())
                resp.headers['token'] = token
                return resp
        form = LoginForm(MultiDict(myform))
        if form.validate():
            email = form.email.data
            password = form.password.data
            user = FrontUserModel.query.filter_by(email=email).first()
            if user and user.check_pwd(password):
                if user.isactive is False:
                    return restful.params_error(message='账号未激活~')
                token = user.generate_auth_token()
                resp = make_response(restful.success())
                resp.headers['token'] = token
                return resp
            if not user:
                return restful.params_error(message='邮箱不存在')
            return restful.params_error(message='密码错误')
        else:
            return restful.params_error(message=error_form.get_error(form))

class Regist(Resource):
    def get(self):
        return 'this is login view'
    def post(self):
        parse = reqparse.RequestParser()
        parse.add_argument('email',type=str,help='邮箱错误，请重新输入')
        parse.add_argument('username',type=str,help='用户名错误')
        parse.add_argument('password',type=str,help='密码，请重新输入')
        args = parse.parse_args()
        email = args.get("email")
        username = args.get("username")
        password = args.get("password")
        isExit = FrontUserModel.query.filter_by(email=email).first()
        if isExit:
            return restful.params_error(message='该邮箱已经注册，换个试试吧~')
        user = FrontUserModel(email=email,username=username,password=password)
        db.session.add(user)
        db.session.commit()
        tasks.send_mail.delay('Dohoom验证码',[email],user.id)
        return restful.success()

class ActiveRegist(Resource):
    def get(self,user_id=None):
        user = FrontUserModel.query.get(user_id)
        if user:
            user.isactive = True
            db.session.commit()
            return 'active success'
        return 'this is active user page'

class UserInfoPage(Resource):
    resource_fields = {
        'username': fields.String,
        'email': fields.String,
        'avatar': fields.String,
        'id':fields.String
    }
    @marshal_with(resource_fields)
    def post(self):
        parse = reqparse.RequestParser()
        parse.add_argument('token',type=str)
        args = parse.parse_args()
        token = json.loads(args.get('token')).get('data',None)
        user = FrontUserModel.verify_auth_token(token)
        if user:
            return user
        else:
            return restful.unauth_error(message='登陆后评论')

class ChangeAvatar(Resource):
    def post(self):
        email = MultiDict(request.form).get('email')
        user = FrontUserModel.query.filter_by(email=email).first()
        if user:
            file = request.files['file']
            filename = upload.change_filename(secure_filename(file.filename))
            upload.bucket.put_object('avater/' + filename, file,progress_callback=upload.percentage)
            user.avatar = upload.base_avater_url + filename
            db.session.commit()
            return restful.success(data=user.avatar)
        else:
            return restful.params_error(message='网络错误，请稍后再试 ~')

class ChangeUsernameView(Resource):
    def post(self):
        myform = json.loads((request.data.decode('utf-8')))
        token = myform.get('token', None)
        if token:
            user = FrontUserModel.verify_auth_token(token)
            if user:
                username = myform.get('username', None)
                if len(username)<2 or len(username)>10:
                    return restful.params_error(message='用户名为2-10个字符')
                user.username = username
                db.session.commit()
                return restful.success()
        return restful.params_error(message='网络错误，请重新登陆后再试~')

class MyuploadView(Resource):
    resource_fields = {
        'books': fields.List(fields.Nested({
		    'id':fields.String,
            'name': fields.String,
            'upload_time': fields.String,
            'price': fields.String,
            'images': fields.List(fields.Nested({
                'url': fields.String
            }))
        })),
    }
    @marshal_with(resource_fields)
    def post(self):
        token = json.loads(request.data).get('token',None)
        user = FrontUserModel.verify_auth_token(token)
        return user

class AddcommentView(Resource):
    resource_fields = {
        'author':fields.Nested({
            'username':fields.String,
            'avatar':fields.String,
            'id':fields.String,
        }),
        'create_time':fields.String,
        'origin_comment':fields.Nested({
            'author':fields.Nested({
                'username': fields.String
            }),
            'content':fields.String
        }),
        'id':fields.String,
        'origin_comment_id':fields.String,
        'content':fields.String
    }
    @marshal_with(resource_fields)
    def post(self):
        parse = reqparse.RequestParser()
        parse.add_argument('token',type=str)
        parse.add_argument('comment',type=str)
        parse.add_argument('bookid',type=str)
        parse.add_argument('commentid',type=str)
        args = parse.parse_args()
        token = args.get('token')
        if token:
            user = FrontUserModel.verify_auth_token(token)
            if user:
                comment = CommentModel(origin_comment_id=args.get('commentid'),book_id=args.get('bookid'),content=args.get('comment'))
                comment.author = user
                db.session.add(comment)
                db.session.commit()
                return comment
        else:
            return restful.params_error(message='请先登录...')

class DelcommentVIew(Resource):
    def post(self):
        commentid = json.loads(request.data).get('commentid','')
        token = json.loads(request.data).get('token',None)
        if token:
            user = FrontUserModel.verify_auth_token(token)
            comment = CommentModel.query.get(commentid)
            if comment and user == comment.author:
                db.session.delete(comment)
                db.session.commit()
            return restful.success()
        else:
            return restful.params_error(message='网络错误，请稍后再试')

class MycommentsView(Resource):
    resource_data = {
        'comments': fields.List(fields.Nested({
            'content': fields.String,
            'id': fields.String,
            'book':fields.Nested({
                'id': fields.String,
                'name':fields.String,
                'price':fields.String,
                'images':fields.List(fields.Nested({
                    'url':fields.String
                }))
            }),
            'author':fields.Nested({
                'username': fields.String
            }),
            'create_time':fields.String
        }))
    }
    @marshal_with(resource_data)
    def post(self):
        token = json.loads(request.data).get('token')
        if token:
            user = FrontUserModel.verify_auth_token(token)
            if user:
                return user
        else:
            return '身份信息过期,请重新登陆'

class ImotionView(Resource):
    def get(self):
        from motion.emotion import emotions
        return restful.success(data = emotions)

class DeleteBookView(Resource):
    def post(self):
        token = json.loads(request.data).get('token',None)
        bookid = json.loads(request.data).get('bookid',None)
        if token:
            user = FrontUserModel.verify_auth_token(token)
            if user:
                book = BookModel.query.get(bookid)
                books = redis_cache.cache.lrange('books', 0, -1)
                ids = [eval(book)['id'] for book in books]
                if book.id in ids:
                    redis_cache.cache.delete('books')
                if book and book.owner == user:
                    [db.session.delete(c) for c in CommentModel.query.filter_by(book_id=book.id).all()]
                    # for img in book.images:
                    #     upload.bucket.delete_object(img.url.split('https://secondbook.oss-cn-hangzhou.aliyuncs.com/')[1])
                    [db.session.delete(c) for c in ImagesModel.query.filter_by(book_id=book.id).all()]
                    db.session.delete(book)
                    db.session.commit()
                return restful.success()
        return restful.params_error(message='认证失败')

















