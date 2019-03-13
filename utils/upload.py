#encoding:utf-8
# __author__ = 'donghao'
# __time__ = 2019/3/7 11:08
import oss2
import os, sys
from datetime import datetime

auth = oss2.Auth('xxxx','secret_key')
# 配置请看oss 文档
bucket = oss2.Bucket(auth,'oss-cn-hangzhou.aliyuncs.com','secondbook')

base_avater_url = 'https://secondbook.oss-cn-hangzhou.aliyuncs.com/avater/'
base_books_url = 'https://secondbook.oss-cn-hangzhou.aliyuncs.com/books/'

def change_filename(filename):
    dt = datetime.now()
    time = dt.strftime('%Y%m%d%H%M%S')
    filename = time+filename
    return filename

def percentage(consumed_bytes, total_bytes,id=None):
    if total_bytes:
        print('我执行了')
        rate = int(100 * (float(consumed_bytes) / float(total_bytes)))
        print('\r{0}% '.format(rate), end='')
        sys.stdout.flush()
