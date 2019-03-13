#encoding:utf-8
# __author__ = 'donghao'
# __time__ = 2019/3/6 17:59
from flask_wtf import FlaskForm
from wtforms import StringField,TextField,IntegerField
from wtforms.validators import Length,InputRequired,NumberRange,Email

class LoginForm(FlaskForm):
    email = StringField('email',validators=[Email(message='邮箱格式错误')])
    password = StringField('password',validators=[Length(min=6,max=12,message='密码长度错误')])

class ChangeUsernameForm(FlaskForm):
    username = StringField('username',validators=[Length(min=2,max=10,message='用户名为2-10个字符')])



class AddBookForm(FlaskForm):
    desc = TextField('desc', validators=[InputRequired(message='请输入简介'), Length(max=1000,
                                                                                message='简介最多1000个字符')])
    publish = StringField('publish',validators=[InputRequired(message='请输入出版社')])
    price = IntegerField('price',validators=[InputRequired(message='请输入价格'),NumberRange(min=1,max=100,message='书籍价格为1-100之间')])
    author = StringField('author', validators=[InputRequired(message='请输入作者')])
    title = StringField('title',validators=[Length(min=1,max=20,message='标题1-20个字符'),InputRequired(message='请输入书名')])


