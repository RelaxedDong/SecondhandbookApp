#encoding:utf-8
# __author__ = 'donghao'
# __time__ = 2019/3/12 9:29
import redis,configparser


cache = redis.StrictRedis(host='127.0.0.1',port=6379,db=0,decode_responses=True)


# 书籍添加

def BookCacheAdd(books):
    for book in books:
        datime = str(book.upload_time)
        cache.rpush('books', {
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
        cache.expire('books',6000)
    print('缓存添加成功')


