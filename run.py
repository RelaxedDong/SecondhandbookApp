#encoding:utf-8
# __author__ = 'donghao'
# __time__ = 2019/3/3 21:37

from secondhandbook import create_app
from flask import render_template
app = create_app()

# celery 指令：
# celery -A tasks.celery worker --pool=eventlet --loglevel=info

# 目录：
# E:\flask_web开发实战\DAY11\secondhandbook
@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(threaded=True,host='0.0.0.0')