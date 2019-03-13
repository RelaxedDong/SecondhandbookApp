#encoding:utf-8
# __author__ = 'donghao'
# __time__ = 2019/3/7 21:13
from flask_restful import Resource,reqparse,marshal_with,fields,marshal
from werkzeug.datastructures import MultiDict
from flask import jsonify,request, make_response,session
from utils import restful,error_form,upload
from apps.v1.models import FrontUserModel,BookModel,ImagesModel
from ext import db
from utils import redis_cache
from werkzeug.utils import secure_filename
from apps.v1.forms import AddBookForm
import json
import config
import tasks

class BookAddView(Resource):
    def get(self):
        form = AddBookForm()
        csrf_token = form.csrf_token.current_token
        return restful.success(data=csrf_token)
    def post(self):
        myform = request.form
        token = myform.get('oldToken', None)
        form = AddBookForm(myform)
        if form.validate():
            if token:
                user = FrontUserModel.verify_auth_token(token)
                if user:
                    title = form.title.data
                    price = form.price.data
                    author = form.author.data
                    desc = form.desc.data
                    publish = form.publish.data
                    book = BookModel(name=title,price=price,author=author,desc=desc,Publishing=publish)
                    book.owner = user
                    db.session.add(book)
                    db.session.commit()
                    files = request.files
                    for file in files.values():
                        filename = upload.change_filename(secure_filename(file.filename))
                        upload.bucket.put_object('books/' + filename, file)
                        img = ImagesModel(url=upload.base_books_url+filename)
                        img.book = book
                        db.session.add(img)
                    db.session.commit()
                    redis_cache.BookCacheAdd([book])
                    return restful.success()
                else:
                    return restful.params_error(message='登陆已经失效，请重新登陆')
        else:
            return restful.params_error(message=error_form.get_error(form))

class BookListView(Resource):
    resource_fields = {
        'id': fields.String,
        'name': fields.String,
        'author': fields.String,
        'upload_time': fields.DateTime,
        'price': fields.String,
        'Publishing': fields.String,
        'desc': fields.String,
        'owner': fields.Nested({
            'username':fields.String,
            'avatar': fields.String
        }),
        'images': fields.List(fields.Nested({
            'url': fields.String
        })),
    }
    def get(self):
        start = request.args.get('start',type=int,default=0)
        cachebooks = redis_cache.cache.lrange('books', 0, -1)
        book_len = len(cachebooks)
        if start == 0:
            if book_len == config.BaseConfig.PER_PAGE:
                jsonbooks = [eval(book) for book in cachebooks]
                return restful.success(data=jsonbooks)
        end = start + config.BaseConfig.PER_PAGE
        books = BookModel.query.order_by(-BookModel.upload_time).slice(start,end).all()
        if book_len!= config.BaseConfig.PER_PAGE:
            redis_cache.cache.delete('books')
            # redis_cache.BookCacheAdd(books)
            tasks.BookCacheAdd(books)
        return marshal(books,self.resource_fields,envelope='data')

class BookDetail(Resource):
    resource_fields = {
        'id': fields.String,
        'name': fields.String,
        'upload_time': fields.String,
        'Publishing': fields.String,
        'price': fields.String,
        'comments': fields.List(fields.Nested({
            'content': fields.String,
            'id': fields.String,
            'origin_comment_id':fields.String,
            'create_time':fields.String,
            'author':fields.Nested({
                'username': fields.String,
                'id':fields.String,
                'avatar': fields.String
            }),
            'origin_comment': fields.Nested({
                'author': fields.Nested({
                    'username':fields.String
                }),
                'content':fields.String
            })
        })),
        'desc': fields.String,
        'author': fields.String,
        'owner':fields.Nested({
            'username': fields.String,
            'email': fields.String,
            'avatar': fields.String,
        }),
        'images':fields.List(fields.Nested({
            'url': fields.String
        }))
    }
    @marshal_with(resource_fields)
    def get(self):
        book_id = request.args.get('book_id')
        book = BookModel.query.get(book_id)
        if book:
            return book
        else:
            return restful.params_error(message='书籍已经不存在了哦...')

class BookNamesView(Resource):
    resource_fields = {
        'name':fields.String,
        'id': fields.String
    }
    @marshal_with(resource_fields)
    def get(self):
        book = BookModel.query.all()
        return book