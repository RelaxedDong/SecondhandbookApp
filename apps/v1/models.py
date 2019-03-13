#encoding:utf-8
# __author__ = 'donghao'
# __time__ = 2019/3/4 18:54
import shortuuid
from datetime import datetime
from werkzeug.security import generate_password_hash,check_password_hash
from ext import db
from itsdangerous import TimedJSONWebSignatureSerializer as Serializer
import config
from sqlalchemy.orm import backref

class FrontUserModel(db.Model):
    __tablename__ = 'front_user'
    id = db.Column(db.String(100),primary_key=True,default=shortuuid.uuid)
    username = db.Column(db.String(50))
    email = db.Column(db.String(50),unique=True,nullable=False)
    avatar = db.Column(db.String(200))
    _password = db.Column(db.String(150),nullable=False)
    join_time = db.Column(db.DateTime,default=datetime.now)
    nickname = db.Column(db.String(150))
    isactive = db.Column(db.Boolean,default=False)

    def __init__(self,*args,**kwargs):
        if 'password' in kwargs:
            self.password = kwargs.get('password')
            kwargs.pop('password')
        super(FrontUserModel, self).__init__(*args,**kwargs)

    @property
    def password(self):
        return self._password

    @password.setter
    def password(self,raw_password):
        self._password = generate_password_hash(raw_password)

    def check_pwd(self,raw_password):
        result = check_password_hash(self.password,raw_password)
        return result

    def generate_auth_token(self,expiration=172800):#两天过期
        s = Serializer(config.BaseConfig.SECRET_KEY,expires_in=expiration)
        return s.dumps({'id':self.id})

    @staticmethod
    def verify_auth_token(token):
        s = Serializer(config.BaseConfig.SECRET_KEY)
        try:
            data = s.loads(token)
        except Exception as e:
            return None
        user = FrontUserModel.query.get(data['id'])
        return user

class BookModel(db.Model):
    __tablename__ = 'book'
    id = db.Column(db.String(100), primary_key=True, default=shortuuid.uuid)
    name = db.Column(db.String(100),nullable=False)
    upload_time = db.Column(db.DateTime,default=datetime.now)
    author = db.Column(db.String(100),nullable=False)
    Publishing = db.Column(db.String(100),nullable=False)
    price = db.Column(db.String(50),default='未填写')
    desc = db.Column(db.Text)
    owner_id = db.Column(db.String(100), db.ForeignKey("front_user.id"))
    owner = db.relationship("FrontUserModel", backref='books')
    __mapper_args__ = {
    "order_by": upload_time.desc()
    }

class ImagesModel(db.Model):
    __tablename__ = 'image'
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    url = db.Column(db.String(150))

    book_id = db.Column(db.String(100),db.ForeignKey("book.id"))
    book = db.relationship("BookModel",backref='images')



class CommentModel(db.Model):
    __tablename__ = 'comment'
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    content = db.Column(db.Text,nullable=False)
    create_time = db.Column(db.DateTime,default=datetime.now)
    book_id = db.Column(db.String(100),db.ForeignKey("book.id"))
    author_id = db.Column(db.String(100),db.ForeignKey("front_user.id"))
    origin_comment_id = db.Column(db.Integer,db.ForeignKey("comment.id",ondelete='CASCADE'))

    book = db.relationship("BookModel",backref="comments")
    author = db.relationship("FrontUserModel",backref="comments")
    origin_comment = db.relationship("CommentModel",backref=backref("replys",cascade="all, delete-orphan"),remote_side =[id])

    __mapper_args__ = {
    "order_by": create_time.desc()
    }