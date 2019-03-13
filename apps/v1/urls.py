#encoding:utf-8
# __author__ = 'donghao'
# __time__ = 2019/3/4 9:54
from flask_restful import Api
from .view.user_views import (
                                Login,Regist,ActiveRegist,UserInfoPage,
                                ChangeAvatar,ChangeUsernameView,MyuploadView,
                                AddcommentView,DelcommentVIew,MycommentsView,
                                ImotionView,DeleteBookView
                              )
from .view.book_views import BookAddView,BookListView,BookDetail,BookNamesView

api = Api(prefix='/api')

#用户相关
api.add_resource(Login,'/login/',endpoint='login')
api.add_resource(Regist,'/regist/',endpoint='regist')
api.add_resource(ActiveRegist,'/active/<string:user_id>/',endpoint='active')
api.add_resource(UserInfoPage,'/userinfo/',endpoint='userinfo')
api.add_resource(ChangeAvatar,'/changeavatar/',endpoint='changeavatar')
api.add_resource(ChangeUsernameView,'/changeusername/',endpoint='changeusername')
api.add_resource(MyuploadView,'/myupload/',endpoint='myupload')
api.add_resource(AddcommentView,'/comment/',endpoint='comment')
api.add_resource(DelcommentVIew,'/delcomment/',endpoint='delcomment')
api.add_resource(MycommentsView,'/mycomments/',endpoint='mycomments')
api.add_resource(DeleteBookView,'/delbook/',endpoint='delbook')

#表情
api.add_resource(ImotionView,'/emotions/',endpoint='emotions')

#书籍相关
api.add_resource(BookAddView,'/bookadd/',endpoint='bookadd')
api.add_resource(BookListView,'/booklist/',endpoint='booklist')
api.add_resource(BookDetail,'/bookdetail/',endpoint='bookdetail')
api.add_resource(BookNamesView,'/booknames/',endpoint='booknames')