#encoding:utf-8
# __author__ = 'donghao'
# __time__ = 2019/3/4 19:06
from ext import db
from apps.v1.models import FrontUserModel
from flask_script import Manager
from flask_migrate import MigrateCommand,Migrate
from secondhandbook import create_app

app = create_app()
manager = Manager(app)

Migrate(app,db)
manager.add_command('db',MigrateCommand)


@manager.option('-u','--u',dest='username')
@manager.option('-e','--e',dest='email')
@manager.option('-p','--p',dest='password')
def add_front_user(username,email,password):
    user = FrontUserModel(username=username,email=email,password=password)
    db.session.add(user)
    db.session.commit()
    print('前台用户添加成功')


if __name__ == '__main__':
    manager.run()