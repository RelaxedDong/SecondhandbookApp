#encoding:utf-8
from flask import Flask
import config
from ext import db,mail,csrf
from apps.v1.urls import api
from flask_cors import CORS

def  create_app():
    app = Flask(__name__)
    app.config.from_object(config.DevelopmentConfig)
    api.init_app(app)
    db.init_app(app)
    mail.init_app(app)
    CORS(app)
    return app

