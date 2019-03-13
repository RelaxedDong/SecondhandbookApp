#encoding:utf-8
# __author__ = 'donghao'
# __time__ = 2019/3/4 18:54
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
from flask_wtf import CSRFProtect

csrf = CSRFProtect()
mail = Mail()
db = SQLAlchemy()
