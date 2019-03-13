#encoding:utf-8
# __author__ = 'donghao'
# __time__ = 2019/3/12 9:47
import requests
from apps.v1.models import BookModel,ImagesModel
from ext import db
from secondhandbook import create_app

app = create_app()
from lxml import etree
header = {
    'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'
}

result = requests.get(url='https://www.jiushujie.com/home',headers=header)
text = result.text
html = etree.HTML(text)
hrefs = html.xpath('//div[@class="book_list"]/ul/li/a/@href')
for url in hrefs:
    result = requests.get('https://www.jiushujie.com'+url)
    text = result.text
    html = etree.HTML(text)
    title = html.xpath('//div[@class="info"]/h2/text()')[0]
    detail = html.xpath('//div[@class="detail"]/text()')
    desc = ''
    try:
        desc = html.xpath('//div[@class="book_introduction_container"]/text()')[0]
    except Exception as e:
        print(e)
    img = html.xpath('//img[@class="book_pic"]/@src')[0]
    publish =detail[1].strip().split('/')[0]
    author =detail[1].strip().split('/')[1]
    price = 5
    try:
        price = detail[3].strip().split('￥')[1]
    except Exception as e:
        print(e)


    with app.app_context():
        book = BookModel(name=title,price=price,author=author,Publishing=publish,desc=desc,owner_id='Y2J4WnRqxNBMCS4YphzmyC')
        book.images.append(ImagesModel(url=img))
        db.session.add(book)
        db.session.commit()
        print(title,'保存成功')
