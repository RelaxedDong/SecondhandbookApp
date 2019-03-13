#encoding:utf-8
# __author__ = 'donghao'
# __time__ = 2019/3/5 19:20
from celery import Celery
from utils import redis_cache
from flask import Flask,render_template
from flask_mail import Message
import config

from ext import mail
app = Flask(__name__)
app.config.from_object(config.BaseConfig)
mail.init_app(app)

def make_celery(app):
    celery = Celery(app.import_name, broker=app.config['CELERY_BROKER_URL'])
    celery.conf.update(app.config)
    TaskBase = celery.Task
    class ContextTask(TaskBase):
        abstract = True
        def __call__(self, *args, **kwargs):
            with app.app_context():
                return TaskBase.__call__(self, *args, **kwargs)
    celery.Task = ContextTask
    return celery

celery = make_celery(app)

@celery.task
def send_mail(subject,recipients,user_id):
    print(recipients,user_id)
    message = Message(subject=subject,recipients=recipients)
    content = {
        'user_id': user_id
    }
    message.html = render_template('email_temp.html',**content)
    mail.send(message)
    print('发送成功')



@celery.task
def BookCacheAdd(books):
    for book in books:
        datime = str(book.upload_time)
        redis_cache.cache.rpush('books', {
            "id": book.id,
            "name": book.name,
            "author": book.author,
            "upload_time": datime,
            "price": book.price,
            "Publishing": book.Publishing,
            "desc": book.desc,
            "owner": {
                "username": book.owner.username,
                "avatar": book.owner.avatar
            },
            "images": [{
                "url": book.images[0].url
            }]
        })
        redis_cache.cache.expire('books',6000)
    print('缓存添加成功')