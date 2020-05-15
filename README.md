# flask+vue 完成的一个二手书app

***欢迎   star***

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190313160005145.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMjM5NTIw,size_16,color_FFFFFF,t_70)

***效果展示***
***知识点总结***
https://blog.csdn.net/qq_42239520/article/details/88534955


***使用***
1. 创建数据库：secondbook
2. 导入数据： source .../secondbook.sql
3. 配置邮箱 config.py 可以参考我的文章：https://www.cnblogs.com/donghaoblogs/p/10389674.html
4. 配置 对象存储oss(存储书籍) utils/upload.py    AccessKeyID和AccessKeySecret  可参考：https://help.aliyun.com/document_detail/88426.html?spm=a2c4g.11186623.6.711.28d37815yFzJg5
5. 启动redis，启动celery（邮件发送，数据异步缓存到redis这两个任务）即可。
5. python run.py

