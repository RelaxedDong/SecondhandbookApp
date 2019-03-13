#encoding:utf-8
# __author__ = 'donghao'
# __time__ = 2019/3/3 21:42

class BaseConfig(object):
    DEBUG = True
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:root@127.0.0.1:3306/secondbook?charset=utf8'
    SECRET_KEY = 'secret'
    # 邮箱
    MAIL_SERVER = "smtp.qq.com"
    MAIL_PORT = "587"
    MAIL_USE_TLS = True
    MAIL_USERNAME = "pepper.hot@qq.com"
    MAIL_PASSWORD = "saermqhvzvavgfda"
    MAIL_DEFAULT_SENDER = "pepper.hot@qq.com"
    CELERY_BROKER_URL = 'redis://127.0.0.1:6379/1'
    PER_PAGE = 10
class DevelopmentConfig(BaseConfig):
    PORT = 5000

class OnlineConfig(BaseConfig):
    DEBUG = False