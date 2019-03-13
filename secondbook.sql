/*
Navicat MySQL Data Transfer

Source Server         : donghao
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : secondbook

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-03-13 10:33:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for alembic_version
-- ----------------------------
DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alembic_version
-- ----------------------------
INSERT INTO `alembic_version` VALUES ('6760a4ac77d0');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `upload_time` datetime DEFAULT NULL,
  `author` varchar(100) NOT NULL,
  `Publishing` varchar(100) NOT NULL,
  `price` varchar(50) DEFAULT NULL,
  `desc` text,
  `owner_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `front_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('27bMSBedhuq3T5JvnJobFh', '古典经济学', '2019-03-12 14:12:52', ' 晏智杰', '北京大学出版社 ', '6.00', '      ', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('2Lk9FnoqgAeJoMh77DSeBZ', '外国文化史', '2019-03-12 14:12:50', ' 孟昭毅,曾艳兵', '北京大学出版社 ', '13.00', '《外国文化史》定名为“外国文化史”，一是表明它的相对性和学理立场，即相对“中国文化史”而言，只以它为论述的参照系，不包括中国文化史的内容；二是全书既大量描述了外国文化的千姿百态，深入梳理了外国文化的发展脉络，又简洁明了、重点突出，尽可能为读者创造一个非常明晰、舒适的阅读空间，给他们一种史论结合的阅读快感。应该说，学习这种外国文化史对于当前共同生活在地球村上的人来说，是面对政治全球化、经济一体化的转型期社会最佳的文化选择。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('2NXNJFEfg2VkSidLXH7e8R', '悲伤逆流成河', '2019-03-12 14:12:41', ' 郭敬明', '湖南文艺出版社 ', '5.00', '少女易遥在17岁时爱上不良少年后怀孕，和她比邻而居的齐铭则生活在完全不一样的世界里——老师的宠儿，父母的掌中宝。两人之间产生了某种介于爱情和友情之间，或者说是凌驾于爱情与友谊之上的微妙情感。直到顾森湘和顾森西姐弟俩出现在他们的生活中，齐铭和顾森湘自然而然地相爱，大人们眼中的“坏孩子”顾森西对易遥产生了好感，当易遥与齐铭各自有了感情归属、彼此渐行渐远时，易遥却因无意中给顾森湘转发了一条短信，间接害死了她……', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('4GYfVefMWPrjwY9m7GoNUn', '公主公主', '2019-03-12 14:12:49', ' 苏苏', '江苏文艺 ', '16.68', '', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('4pVoZUutSYt7JWifxe3j5d', '21世纪大学实用英语综合教程', '2019-03-12 14:12:44', ' 翟象俊', '复旦大学 ', '5', '《21世纪大学实用英语:综合教程(第1册)》为《综合教程》第一册，共8个单元，每个单元均包括听说、读写和实用技能训练三大板块的内容。听说部分围绕每单元的主题，并结合高职高专学生学习生活和毕业后工作实际需要，进行听力与口语方面的专门训练。读写板块包括Text A（精读）， Text B（泛读）和Text C（扩展阅读），并配有相应的练习。实用技能训练部分根据高职高专教育的特点，提供以提高职业技能和素质为目标的实用训练，包括Grammar Review, Practical Writing和Basic Reading Skills等内容。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('4u6wTCbM9it8SpttwLcj66', 'Oracle 10g简明教程', '2019-03-12 14:12:46', ' 王彬', '第1版 (2006年10月1日) ', '5', '《Oracle10g简明教程》既可以作为Oracle 10g的初学者、Oracle 10g数据库管理人员、应用开发人员和网络管理员的技术参考书，也可以作为高等院校相关专业自学或培训教材。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('6uAJPCyH4vtQYjPK5PoDhJ', '厚黑学', '2019-03-12 14:12:39', ' 李宗吾', '线装书局 ', '15.00', '《厚黑学》的作者自读书识字以来，就想为英雄豪杰，求之四书五经，茫无所所，求之诸子百家，与夫廿四史，仍无所得，以为古之为英雄豪杰者，必有不传之秘，不过吾人生性愚鲁，寻他不出罢了。穷萦冥搜，忘寝废食，如是者有年，一日偶然想起三国时几个人物，不觉恍然大悟曰：得之矣，得之矣，古之为英雄豪杰者，不过面厚心黑而已。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('7R9pHaXAYnjKtBDswtp2fR', 'Java程序设计实用教程', '2019-03-12 14:12:47', ' unknown', 'unknown ', '5', '《Java程序设计实用教程》适合作为高等院校计算机相关专业“Java语言程序设计”以及“面向对象语言”课程的教材。Java语言具有面向对象、与平台无关、安全、稳定、多线程等优良特性，是目前软件设计中极为强大的编程语言。《Java 程序设计实用教程》注重结合实例，循序渐进地向读者介绍了Java语言的重要知识点，特别强调Java面向对象编程的思想。全书分为16章，分别讲解了简单数据类型、运算符、表达式和语句、类与对象、子类与继承、接口与多态、数组与枚举、内部类与异常类、常用实用类、Java输入输出流、JDBC数据库操作、泛型与集合框架、Java多线程机制、Java网络基础、图形用户界面设计、Java Applet程序等内容。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('9RgxhK68CvXTqw4wcVFV94', '历年考研英语真题解析及复习思路', '2019-03-12 14:12:54', ' 曾鸣,张剑,刘京霄', '世界图书出版公司 ', '12.00', '（1）语篇分析。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('a8oZq5c7uR7XN64JDtNEC7', '银河帝国 ：基地', '2019-03-12 14:12:41', ' 叶李华', '江苏凤凰文艺出版社 ', '5.00', '人类蜗居在银河系的一个小角落——太阳系，在围绕太阳旋转的第三颗 行星上，生 活了十多万年之久。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('AaTjiqawysBkMVDVgPLVaX', '外国近现代建筑史', '2019-03-12 14:12:51', ' 同济大学,东南大学,清华大学,天津大学', '中国建筑工业出版社 ', '8.00', '罗小未编著的《外国近现代建筑史》为普通高等教育土建学科“十五”规划教材。本教材对1982年第一版《外国近现代建筑史》一书进行了全面地修订和重新编写，大大地补充和增加了新的内容，并尽可能地反映了国外自18世纪中叶工业革命至今两百余年来的建筑文化发展概况，以适应新暑期的教学需要。具体内容体现在以下六个方面：一、18世纪下半叶至19世纪下半叶欧洲与欧洲与美国的建筑；二、19世纪下半叶至20世纪初对新建筑的探求；三、新建筑运动的高潮—现代建筑派及其代表人物；四、第二次世界大战后的城市建设与建筑活动；五、战后40～70年代的建筑思想—现代建筑派的普及与发展；六、现代主义之后的建筑思潮等。    《外国近现代建筑史》适合建筑学、城市规划专业使用，也可供土建及相关专业人员学习与工作参考。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('Abmkdjp6Xqw9rz2JZWbFYE', '被窝是青春的坟墓', '2019-03-12 14:12:54', ' 七堇年', '长江文艺出版社 ', '15.00', '《被窝是青春的坟墓》是七堇年的首部随笔集，全书共分为两部分，惊蛰与清明，寓意成长与写作路途上的不同阶段；收录曾经发表在杂志上的部分中短篇作品，并加入了大部分最新创作的散文等作品。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('acErAxnz36ATHSrxRhatc8', '摆渡人2重返荒原', '2019-03-12 14:12:41', ' 付强', '百花洲文艺出版社 ', '5.00', '在上一部中，单亲女孩迪伦，15岁的她，世界却一片狼藉：与母亲总是无话可说，在学校里经常受到同学的捉弄，唯一谈得来的好友也因为转学离开了。这一切都让迪伦感到无比痛苦。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('ANYUHLydH8GSkNwJQMGX3S', '总要习惯一个人', '2019-03-12 14:12:42', ' 蕊希', '湖南文艺出版社 ', '5.00', '治愈千万人的电台主持人×作家蕊希诚意新作。 19篇成长故事，25岁也有悲喜交织的人生。这一年做过的抗争，经历的幸福，这一年发生的变化和行走过的地方，蕊希用全部的真心与赤诚将这本书完成。 蕊希在序言中写道： “我知道，我们一定有着不同的关于这个世界的想法， 我也知道，我们一定都各自怀揣着对于旧时与来日的心愿。 但我依旧满心欢喜地邀请你来我的故事里做客，看看我心爱的人和事，看看他们平凡却又了不起的人生。” 希望岁月赐予你我如同往昔不变的明日，哪怕历经沧桑，也依然保持可爱与纯良。愿你善待自己年轻的皮囊，也愿你拥有不会陈旧的有趣的灵魂。愿你活在当下，即使深陷泥沼，也能活完一生的天真与骄傲。愿，年岁渐长，但你仍如今日般无惧岁月风霜。 本书写给每一个爱过哭过失去过，但依然在用力成长的你。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('b6JfQ3xrXKZStEtiqrTEVE', '货币战争', '2019-03-12 14:12:46', ' 宋鸿兵 编著', '中信出版社 ', '5', '为什么你不知道美联储是私有的中央银行？', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('b9NBm2uNqREBbh3SEAEM58', '工程制图', '2019-03-12 14:12:46', ' 王晓红', '华东大学出版社 ', '5', '本教材分三篇：工程图学基础，计算制图基本操作，资源篇。第一篇共九章：三维实体图示示法概述，平面图形的绘制，点、直线、平面的投影，基本体，组合体，图样的基本表示法，图校的特殊表示法，零件图，装配图。第二篇含八个模块：零件建模的流程，平面图形的绘制，基本体的建模，组合体的建模，视图、剖视图的生成，装配体的建模，零件图的绘制，装配的绘制。第三篇有八个附录，摘录了制图时应遵守的相关国家标准和本教材的参考文献。另编《工程制图习题集》，配合本教材使用。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('BawYEnEW5dbnLDjSbeKVDV', '麦田里的守望者', '2019-03-12 14:12:41', ' 施咸荣', '译林出版社 ', '5.99', '《麦田里的守望者》的主人公，１６岁的中学生霍尔顿·考尔菲德是当代美国文学中最早出现的反英雄形象之一。霍尔顿出身在纽约一个富裕的中产阶级的家庭。学校里的老师和自己的家长强迫他好好读书，为的是“出人头地，而他看不惯周围的一切，根本没心思用功读书，因而老是挨罚。他的内心又十分苦闷、彷徨，这种精神上无法调和的极度矛盾最终令他彻底崩溃，躺倒在精神病院里。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('Bp5GkENeoMGWrUHuBbuDWW', '活着', '2019-03-12 14:12:56', ' 余华', '作家出版社 ', '10.00', '《活着(新版)》讲述了农村人福贵悲惨的人生遭遇。福贵本是个阔少爷，可他嗜赌如命，终于赌光了家业，一贫如洗。他的父亲被他活活气死，母亲则在穷困中患了重病，福贵前去求药，却在途中被国民党抓去当壮丁。经过几番波折回到家里，才知道母亲早已去世，妻子家珍含辛茹苦地养大两个儿女。此后更加悲惨的命运一次又一次降临到福贵身上，他的妻子、儿女和孙子相继死去，最后只剩福贵和一头老牛相依为命，但老人依旧活着，仿佛比往日更加洒脱与坚强。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('ButJvpLZ8aCbZeo3B9oMWK', '弟子规', '2019-03-12 14:12:53', ' 【清】李毓秀  编,张志萍   注评', '上海古籍出版社 ', '5', '《弟子规》是我国著名的传统蒙学教材中的一种，相对于更为著名的“三百干”（《三字经》、《百家姓》、《干字文》），它的生成年代晚了很多。《弟子规》的作者一般认为是清朝的李毓秀，这是一个生活在康熙到乾隆年间的山西秀才，没有功名，在学术上也没有特别的著述成就，所以关于他并没有很丰富的资料以资考证，根据臆测，大约可以估计他的工作之一就是教书，为此自编了这样一种教材。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('c7JXEdTFGhjqq53vEjUpGU', 'Python Cookbook', '2019-03-12 14:12:49', ' 高铁军', '人民邮电出版社 ', '25.00', '本书介绍了Python应用在各个领域中的一些使用技巧和方法，从最基本的字符、文件序列、字典和排序，到进阶的面向对象编程、数据库和数据持久化、 XML处理和Web编程，再到比较高级和抽象的描述符、装饰器、元类、迭代器和生成器，均有涉及。书中还介绍了一些第三方包和库的使用，包括 Twisted、GIL、PyWin32等。本书覆盖了Python应用中的很多常见问题，并提出了通用的解决方案。书中的代码和方法具有很强的实用性，可以方便地应用到实际的项目中，并产生立竿见影的效果。尤为难得的是，本书的各位作者都具有丰富的业界实践经验，因此，本书不仅给出了对各种问题的解决方案，同时还体现了很多专家的思维方式和良好的编程习惯，与具体的细节性知识相比，这部分内容无疑是本书的精华。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('CgtrDfxkbBUxGuAv4FCUb2', '我在未来等你', '2019-03-12 14:12:42', ' 刘同', '北京联合出版公司 ', '7.00', '你会不会偶尔产生那种“如果能回到那一年就好了”的念头？觉得回到那一年，以我们当下的见识和心态，很多事都能被改变。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('D2rBFSUbHYKe5NSnrM2mYL', '新闻采访教程', '2019-03-12 14:12:48', ' 刘海贵', '复旦大学出版社 ', '5', '《新闻采访教程》是一本新闻采访学的新编教材。它系统讲授了新闻采访的特点以及所必备的知识、方法，阐述了新闻工作的要求、条件，介绍了新闻采访在实施和运作过程中的种种策略和应变手段。作者还结合新闻实践的变化，对近年来媒体频频出现的连续报道、深度报道、批评性报道、预测性报道、精确性报道等，作了精彩的讲评。其对于新闻采访不断适应新的时代和新的变动中的国际新闻传播，培养创新性新闻传播人才，都是十分有益的。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('D8Sq2vnHKrroGnUnaN9WX5', '文化苦旅', '2019-03-12 14:12:43', ' 余秋雨', '长江文艺出版社 ', '7.00', '《文化苦旅》一书于1992年首次出版，是余秋雨先生1980年代在海内外讲学和考察途中写下的作品，是他的第一部文化散文集。全书主要包括两部分，一部分为历史、文化散文，另一部分为回忆散文。甫一面世，该书就以文采飞扬、知识丰厚、见解独到而备受万千读者喜爱。由此开创“历史大散文”一代文风，令世人重拾中华文化价值。他的散文别具一格，见常人所未见，思常人所未思，善于在美妙的文字中一步步将读者带入历史文化长河，启迪哲思，引发情致，具有极高的审美价值和史学、文化价值。书中多篇文章后入选中学教材。但由于此书的重大影响，在为余秋雨先生带来无数光环和拥趸的同时，也带来了数之不尽的麻烦和盗版。誉满天下，“谤”亦随身。余秋雨先生在身心俱疲之下，决定亲自修订、重编此书。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('dKu3m5xH8TbCN53erd78kZ', '我是猫', '2019-03-12 14:12:51', ' 曹曼', '浙江文艺出版社 ', '13.00', '《我是猫》是日本“国民大师”夏目漱石的代表成名作，对日本文学有着极深远的影响。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('eDUA5x2S5eS7WSXBfF5RU8', '幸福地做老师', '2019-03-12 14:12:45', ' 荆志强', '江苏人民出版社,凤凰出版传媒集团 ', '5', '', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('EhjUXM8cDuRTynKbLDmLFb', '康熙大帝（全四册）', '2019-03-12 14:12:50', ' 二月河', '长江文艺出版社 ', '18.00', '康熙大帝　夺宫初政', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('F5gCFTYzg3diqB68uSbEv3', '故事', '2019-03-12 14:12:49', ' 周铁东', '天津人民出版社 ', '20.00', '【内容简介】', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('FrUpVwLhTSYNuFQhCG2MrJ', '审美学', '2019-03-12 14:12:43', ' 胡家祥', '北京大学出版社 ', '5', '审美学（修订版），ISBN：9787301170281，作者：胡家祥 著', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('HEUCx6k2HtSTTUVB7EqtHW', '新闻学概论', '2019-03-12 14:12:43', ' 李良荣', '复旦大学 ', '5', '《新闻学概论(第3版)(新世纪版)》是《新闻学概论》被教育部列为“十一五”国家级规划教材，并被评为国家级精品课程后，作者进行修订后的第3版。《新闻学概论》着重总结和阐述人类新闻活动，主要是新闻事业的基本规律即新闻学的基本概念和知识，为进一步掌握新闻业务、探索新闻理论、研究新闻史提供了必不可少的系统基础知识。作者20多年来先后写过5部“新闻学概论”方面的专著和教材，《新闻学概论(第3版)(新世纪版)》是其最新研究成果的结晶。本次修订主要包括：', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('jD8NC3xGzMhK4736tQgGST', '股票作手回忆录', '2019-03-12 14:12:45', ' 邢红梅', '新世界出版社 ', '5', '', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('jmEh4mzSAXgHog9VE2uJmQ', '哈佛商学院管理与MBA案例全书', '2019-03-12 14:12:53', ' 《哈佛商学院管理与MBA案例全书》编写组', '中央编译出版社 ', '16.00', '哈佛商学院，商业神话中的圣殿，商界的梵蒂冈。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('jqWWjPFhbMcAVnhLpWuZbU', 'C++ Primer Plus', '2019-03-12 14:12:52', ' 张海龙,袁国忠', '人民邮电出版社 ', '35.00', 'C++是在C语言基础上开发的一种集面向对象编程、通用编程和传统的过程化编程于一体的编程语言，是C语言的超集。本书是根据2003年的ISO/ANSI C++标准编写的。通过大量短小精悍的程序详细而全面地阐述了C++的基本概念和技术。全书分为18章和10个附录，分别介绍了C++程序的运行方式、基本数据类型、复合数据类型、循环和关系表达式、分支语句和逻辑操作符、函数重载和函数模板、内存模型和名称空间、类的设计和使用、多态、虚函数、动态内存分配、继承、代码重用、友元、异常处理技术、string类和标准模板库、输入/输出等内容。本书针对C++初学者，从C语言基础知识开始介绍，然后在此基础上详细阐述C++新增的特性，因此不要求读者有较多C语言方面的背景知识。本书可以作为高等院校C++课程的教材，也可以供初学者自学C++时使用。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('K8nhu3FNweiZWVBfpRMNkb', '21世纪大学实用英语综合教程·第二册', '2019-03-12 14:12:44', ' 翟象俊', '复旦大学 ', '5', '《21世纪大学实用英语综合教程(附光盘2)》由翟象俊、陈永捷、余建中、梁正溜主编，本书为《综合教程》第二册，共8个单元，每个单元均包括听说、读写和实用技能训练三大板块的内容。听说部分围绕每单元的主题，并结合高职高专学生学习生活和毕业后实际工作的需要，进行听力与口语方面的专门训练。读写板块包括Text A(精读)，Text B(泛读)和Text c(扩展阅读)，并配有相应的练习。实用技能训练部分根据高职高专教育的特点，提供以提高职业技能和素质为目标的实用训练，包括Grammar Review，Practical writing和Basic Reading skills等内容。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('KfgXHjyL43ChownF4bResd', '表演艺术教程', '2019-03-12 14:12:44', ' 林洪桐', '北京广播学院出版社 ', '5', '《表演艺术教程演员学习手册》是第一部系统论述表演艺术的教程，第一部以表演基础理论与表演教学实践相结合进行阐释的表演专著。《表演艺术教程演员学习手册》融表演实践与理论；教学与创作；传统与现代；基础与创新；话剧表演与电影表演；中国表演教学与前苏联表演教学；以及英美表演教学体系为一体。具有深广的理论覆盖面与读者覆盖面。既适合于院校正规教学，也适合于各种层次的社会办学；既适合于教员备课，也适合于学员、自学成才者，表演爱好者学习；亦可作为专业演员学习表演，理论研究者研究表演的参考书目。著名电影理论家，斯坦尼斯拉夫斯基表演体系研究专家郑雪来在序中评论《表演艺术教程演员学习手册》“教程较之国内外同类著作更系统、更具有学术价值与实践指导意义”。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('KG8dsh4PuRcq7HEKdVa7Q5', '云边有个小卖部', '2019-03-12 14:12:39', ' 张嘉佳', '湖南文艺出版社 ', '15.00', '云边镇少年刘十三的成长故事。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('kNF63VZmvooF5EQm8Ep8bR', '影视剪辑实训教材', '2019-03-12 14:12:47', ' 李琳', 'unknown ', '5', '《影视艺术实训系列教程•影视剪辑实训教材》内容简介：剪辑对于影视创作是至关重要的，而实践练习是提高剪辑水平的必由之路。没有实践，空谈理论就变成了纸上谈兵，无法解决实际问题。影视剪辑的任务从本质上讲，一是对镜头的裁剪，二是对镜头进行排列。镜头的裁剪在单镜头内进行，同样的镜头通过裁剪可以取得不同的效果。镜头的排列分为三个层次：第一层次，两两镜头的组接；第二层次，镜头句子之间的组接；第三层次，段落之间的组接。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('KTpivSDXfdTaWMdXVdvZyb', '书籍库无相关信息 - 商业银行信用风险资本管理', '2019-03-12 14:12:54', ' 陈德胜', '世界图书出版社 ', '100.00', '', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('KZNHdmdyNq4He75TVHfdbg', '张剑考研英语黄皮书·', '2019-03-12 14:12:56', ' 曾鸣,张剑,刘京霄', '世界图书出版公司北京公司 ', '20.00', '由“词汇”开始，进而到“句子”、“段落”、最后到“全篇”，对历年英语真题文章进行了深入的分析与解读，并以精简概括的语言对命题思路进行了深入地剖，对解析技巧进行了系统地传授。是熟悉考研“章法”（所选文章的题材、篇章结构、语言特征等）“题法”（命题思路及解题方向）的必备法宝。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('LityBZbXrgLKe5GqZjZCJc', '活着', '2019-03-12 14:12:41', ' 余华', '作家出版社 ', '4.00', '《活着(新版)》讲述了农村人福贵悲惨的人生遭遇。福贵本是个阔少爷，可他嗜赌如命，终于赌光了家业，一贫如洗。他的父亲被他活活气死，母亲则在穷困中患了重病，福贵前去求药，却在途中被国民党抓去当壮丁。经过几番波折回到家里，才知道母亲早已去世，妻子家珍含辛茹苦地养大两个儿女。此后更加悲惨的命运一次又一次降临到福贵身上，他的妻子、儿女和孙子相继死去，最后只剩福贵和一头老牛相依为命，但老人依旧活着，仿佛比往日更加洒脱与坚强。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('LwLyvreHKH2vCJ4BDGZqaH', '中药药理学', '2019-03-12 14:12:44', ' 吴清和', '高等教育 ', '5', '《全国高等中医药院校规划教材•中药药理学》收集了62味中药，23个复方。分总论与各论，总论部分包括绪论、中药药效学、中药药物代谢动力学、中药毒理学、中药药理的研究方法。各论按中药学传统分类法分类，包括导学、概述、常用中药、常用复方和思考题。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('Md3S2XgVFSWXdYTZ25wRz8', '百变小樱魔术卡', '2019-03-12 14:12:56', ' 陈荟敏', '少年儿童出版社 ', '2.00', '国家新闻出版总署批准出版，日本讲谈社独家授权小樱—荣膺“日本最受欢迎的漫画人物”称号。 风靡日本、韩国、法国、美国、巴西等16个国家全球销量1.38亿册。书中女主角木之本樱是日本友枝小学四年级的学生，无意之中解开了库洛卡的封印，从此，她的生活被改变--受封印小兽小可的委托，小樱成了“库洛魔法使”，要把拥有魔力、到处作乱的库洛卡降服。小樱的身边有很多的好朋友，在他们的帮助下，小樱最终把库洛卡一一收服，并把它们全部转换成小樱卡。 　　 ', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('ntAdMxpuSiEDmWwz3txkX2', '文化苦旅', '2019-03-12 14:12:57', ' 余秋雨', '长江文艺出版社 ', '20.00', '《文化苦旅》一书于1992年首次出版，是余秋雨先生1980年代在海内外讲学和考察途中写下的作品，是他的第一部文化散文集。全书主要包括两部分，一部分为历史、文化散文，另一部分为回忆散文。甫一面世，该书就以文采飞扬、知识丰厚、见解独到而备受万千读者喜爱。由此开创“历史大散文”一代文风，令世人重拾中华文化价值。他的散文别具一格，见常人所未见，思常人所未思，善于在美妙的文字中一步步将读者带入历史文化长河，启迪哲思，引发情致，具有极高的审美价值和史学、文化价值。书中多篇文章后入选中学教材。但由于此书的重大影响，在为余秋雨先生带来无数光环和拥趸的同时，也带来了数之不尽的麻烦和盗版。誉满天下，“谤”亦随身。余秋雨先生在身心俱疲之下，决定亲自修订、重编此书。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('NWiYK6AYrUoyPt6WruozMT', '公共管理学', '2019-03-12 14:12:49', ' 陈振明', '人民大学 ', '18.80', '《公共管理学》(研究生教学用书)是为研究生设计的教科书。由教育部学位管理与研究生教育司推荐。具有一定的权威性。全书内容丰富，共分十二章，涉及公共组织理论、政府改革与治理、政府间关系、政府作用、公共政策绩效管理、人力资源管理、公共经济管理、第三部门管理、战略管理、公共管理伦理、政府工具等。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('nwxRUKAjW754eBdm5astHM', '人性的弱点全集', '2019-03-12 14:12:45', ' 袁玲', '中国发展出版社 ', '5', '《人性的弱点全集》汇集了卡耐基的思想精华和最激动人心的内容，是作者最成功的励志经典，出版后立即获得了广大读者的欢迎，成为西方世界最持久的人文畅销书。主要内容包括：与人相处的基本技巧、平安快乐的要诀、如何使人喜欢你、如何赢得他人的赞同、如何更好地说服他人、让你的家庭生活幸福快乐等十篇。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('ouP9pDeSt2UChBCB6Mt7EN', '偷影子的人', '2019-03-12 14:12:39', ' 段韵灵', '湖南文艺出版社 ', '12.00', '一个老是受班上同学欺负的瘦弱小男孩，因为拥有一种特殊能力而强大：他能“偷别人的影子”，因而能看见他人心事，听见人们心中不愿意说出口的秘密。他开始成为需要帮助者的心灵伙伴，为每个偷来的影子找到点亮生命的小小光芒。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('p8263hGpdciWi7Z25oWr3h', '美学其实很好玩', '2019-03-12 14:12:47', ' 陈韵鹦,高婧 插图', '湖南文艺出版社 ', '5', '《美学其实很好玩》内容简介：电风扇为什么没有红色的？昨天看的画展是什么流派的？小区里的雕塑有什么寓意呢？血型怎样影响了你的穿衣风格？昨天的面试你穿对衣服了吗？……其实，美学离我们并不遥远，生活本身就是一堂美学课，无时无刻不在考验我们的美感力。《美学其实很好玩》从传统美学知识中提炼出大量有趣实用的小知识，加以百幅原创手绘漫画生动图解，集实用性、知识性、科学性、趣味性于一体，迅速提升你的美感力，让你变身为生活中的美学达人。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('QJyxK6mfRE9sG2328xMaTU', '金融学', '2019-03-12 14:12:53', ' 黄达', '中国人民大学出版社 ', '9.90', '', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('qytakygcpMMSp6SzzWMH7Q', '树木学', '2019-03-12 14:12:48', ' 张志翔', 'unknown ', '22.00', '《全国高等农林院校教材•树木学(北方本)(第2版)》由张志翔主编，共分为3篇。第1篇分6个部分，主要是使学生建立树木学的基本概念；理解和掌握树木的分类、命名、鉴定、形态、变异、特性、中国森林树种资源和分布区等知识；第2篇为各论部分，分裸子植物和被子植物，主要介绍树种的形态、特性、分布和用途，以及对树种的评价；第3篇为中国森林树种地理分布概述，重点介绍中国各森林分布区重要森林树种和所组成的森林类型，总体上让学习者了解中国的森林资源和分布。树种选择以中国北方树种为主，兼顾中国南方的重要森林树种、经济树种和世界性重要树种。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('QzGVScnk7PjXoT3iBpwmyE', '四大名著(共8册)', '2019-03-12 14:12:50', ' (明)吴承恩', '江苏文艺 ', '32.00', '', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('r2jmxxXSPrSM2u3UqgoVcG', '岛上书店', '2019-03-12 14:12:42', ' 孙仲旭,李玉瑶', '江苏凤凰文艺出版社 ', '5.00', '岛上书店是间维多利亚风格的小屋，门廊上挂着褪色的招牌，上面写着： 没有谁是一座孤岛，每本书都是一个世界 A．J．费克里，人近中年，在一座与世隔绝的小岛上，经营一家书店。 命运从未眷顾过他，爱妻去世，书店危机，就连唯一值钱的宝贝也遭窃。他的人生陷入僵局，他的内心沦为荒岛。 就在此时，一个神秘的包袱出现在书店中，意外地拯救了陷于孤独绝境中的A．J．，成为了连接他和妻姐伊斯梅、警长兰比亚斯、出版社女业务员阿米莉娅之间的纽带，为他的生活带来了转机。 小岛上的几个生命紧紧相依，走出了人生的困境，而所有对书和生活的热爱都周而复始，愈加汹涌。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('RARB8ZxaxJncDKmJZMYyQf', '书籍库无相关信息 - 散文诗', '2019-03-12 14:12:55', ' 未知', '未知 ', '10.00', '', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('rMbUQJy2WjYS2XMSSLrrAM', '肆无忌惮', '2019-03-12 14:12:52', ' 林采宜', '机械工业出版社 ', '40.00', '', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('SSPoShJWKUJB5C9mrQDZZC', '系统解剖学', '2019-03-12 14:12:51', ' 徐达传 编', 'unknown ', '20.00', '《普通高等教育\"十一五\"国家级规划教材•全国高等学校医学规划教材:系统解剖学(第3版)(供临床•基础•预防•护理•检验•口腔•药学等专业用)》由中国工程院院士、南方医科大学钟世镇教授任名誉主编，南方医科大学徐达传教授任主编，全国16所高校19位教授共同编写。《普通高等教育\"十一五\"国家级规划教材•全国高等学校医学规划教材:系统解剖学(第3版)(供临床•基础•预防•护理•检验•口腔•药学等专业用)》按人体的器官功能系统阐述，包括绪论、运动系统、内脏学、脉管学、感觉器官、神经系统和内分泌系统。《普通高等教育\"十一五\"国家级规划教材•全国高等学校医学规划教材:系统解剖学(第3版)(供临床•基础•预防•护理•检验•口腔•药学等专业用)》紧密结合临床：以“临床意义”介绍解剖与临床的关系及有关新进展。形态学特点突出：特别重视图的表达效果，安排了大量的彩色图，还选用了部分形态逼真精美的铸型标本。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('teoyXwNCqbCuMbqzooTDRa', '乌合之众', '2019-03-12 14:12:50', ' 胡小跃', '浙江文艺出版社 ', '5', '《乌合之众》是群体心理学的奠基之作。深刻影响了弗洛伊德、荣格、托克维尔等学者，和罗斯福、丘吉尔、戴高乐等政治人物。2010年,法国《世界报》与弗拉马里翁出版社联合推出了“改变世界的20本书”,其中就有《乌合之众》。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('tnMjC5idEEQ8URkEiQZeaD', '李鸿章', '2019-03-12 14:12:51', ' 张鸿福', '长江文艺出版社 ', '49.00', '第一册内容简介：', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('tUj9MkheShgmXdUwT8VoBA', '单片微机原理与接口技术', '2019-03-12 14:12:58', ' 丁向荣 编', 'unknown ', '15.00', 'STC15系列增强型8051单片机集成了上电复位电路与高精准R/C振荡器，给单片机芯片加上电源就可跑程序；集成了大容量的程序存储器、数据存储器以及EEPRM，集成了A/D、PWM、SPI等高功能接口部件，可大大地简化单片机应用系统的外围电路，使单片机应用系统的设计更加简捷，系统性能更加高效、可靠。本教材以STC15F2K60S2单片机为主线，系统地介绍了STC15F2K60S2单片机的硬件结构、指令系统与应用编程，单片机应用系统的开发流程与接口设计，同时提出多种实践模式：Keil C集成开发环境、Proteus仿真软件以及实物运行开发环境，使得单片机的学习与应用变得更简单、更清晰。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('TV3sdCPYQMFXBo5CNdqCc9', '解忧杂货店', '2019-03-12 14:12:42', ' 李盈春', '南海出版公司 ', '5.00', '现代人内心流失的东西，这家杂货店能帮你找回——', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('Udc7oREqKmpVhNohoNkxqR', '我在雨中等你', '2019-03-12 14:12:57', ' 加思•斯坦', '南海出版社 ', '12.00', '我叫恩佐。我老以为自己是人，也一直觉得我和其他狗不一样。我只是被塞进狗的身体，里面的灵魂才是真实的我。这里记录着我和主人丹尼相依度过的风雨悲欢：当妻子凄凉死去，当岳父母和他反目成仇，当他镣铐加身被突然逮捕，唯有我知道真相。可是，我只是一只狗，我无法发音，不能说话……现在我老了，即将离开这个世界。我想与你分李我的故事，如果你愿意，就翻开书，我在故事里等你……', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('UvVDpFTNMN8RyXseXSZs5e', '狼牙', '2019-03-12 14:12:40', ' 刘猛', '大众文艺出版社 ', '5.00', '墨绿的油彩、冷竣的双眼、幽灵般的身影、他们是魔鬼的化身，他们的出现意味着死亡！他们是来自地狱的人！自古才子配佳人，宝剑赠英雄，子弹无情人有情，他们是铁打的高手，心中却有柔情万种，这是一部全景展示中国特种部队成长内幕的小说，在国际社会军旅小说中掀起狂澜。《狼牙》以真实的笔触刻画了立体的中国军人形象，刻画了立体的军人家庭情况，让读者在作者娟娟溪流的文字中感受着那种激情燃烧的岁月。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('UZC95CHXPah7QisJCMCx7S', '社会心理学', '2019-03-12 14:12:56', ' 侯玉波', '北京大学 ', '10.00', '《北京大学心理学教材•社会心理学(第2版)》主要内容为：社会心理学是现代心理学的支柱之一，它与人格心理学、实验心理学和认知心理学一起构成了现代心理学的基本结构。《社会心理学》在介绍社会心理学的历史、理论、方法、研究的基础上，选取了社会心理学的几个主要研究领域，并从理论和实际上对其加以分析。这些领域包括：社会认知，社会行为，社会态度，人际关系，社会交换与影响，团体与组织心理，以及最新受到重视的文化心理学和健康心理学。在对这些领域的知识进行分析的时候，作者力图使其与我们所生活的时代联系在一起，从而使社会心理学的理论和知识对我们的生活有所帮助。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('vkx2CwNPKMgHWHMaeCZpML', '外科学（第9版）', '2019-03-12 14:12:52', ' unknown', '人民卫生出版社 ', '45.00', '', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('VLej8PuLZ5zeyzFeiKsRGM', '围城', '2019-03-12 14:12:40', ' 钱钟书', '人民文学出版社 ', '12.00', '《围城》三十年来横贯常销畅销小说之首。《围城》是钱钟书唯一的一部长篇小说，堪称中国现当代长篇小说的经典。小说塑造了抗战开初一类知识分子的群像，生动反映了在国家特定时期，特殊人群的行为操守、以及困惑。从另一个角度记述了当时的情景、氛围。虽然有具体的历史背景，但这部小说揭示的只是人群的弱点，在今天依然能够引起人们的共鸣。第一版于1947年由上海晨光出版公司出版。《围城》是中国现代文学史上一部风格独特的讽刺小说。被誉为“新儒林外史”。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('w2sUfEbeMurzYxzCGMg2y8', '别让情绪失控害了你', '2019-03-12 14:12:46', ' 陈玮', '中华工商联合出版社 ', '5', '《别让情绪失控害了你》从情商培养、情绪管理着手，旨在让人们深刻认识焦虑、紧张、愤怒、沮丧、悲伤、痛苦等负面情绪，将心理产生的消极倾向尽力弱 化，维持生活的正常进行。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('wMaaE9reRxkJgBXwd9svGA', '文艺犯', '2019-03-12 14:12:40', ' 王恺', '中国言实出版社 ', '10.00', '本书是作者社会报道本行之外的闲散文章结集，话题涉及美食、影视、旅游、人文地理诸多方面，以深沉广阔的文艺眼光俯瞰人间、书写世界，故名为“文艺犯”，“犯”乃“范”的谐音，亦为不务正业的自嘲之谓。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('WrrS36qVaZko85rSS9QrrK', '从你的全世界路过', '2019-03-12 14:12:40', ' 张嘉佳', '湖南文艺出版社 ', '6.99', '《从你的全世界路过》是微博上最会写故事的人张嘉佳献给你的心动故事。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('ws3HojCzuXiC9LqNDnP88o', 'SQL Server数据库原理及应用教程', '2019-03-12 14:12:45', ' 王强,董莉,张莉,赵文', '清华大学 ', '5', '本书选用以网络环境为背景而广泛使用的SQL Server 2000关系型数据库管理系统作为数据库系统平台，全面系统地介绍了数据库技术的基础理论、数据库系统设计方法、现代数据库系统开发应用等。介绍了 Transact-SQL编程、网络数据库系统安全、面向对象数据库技术、并行数据库系统和分布式数据库系统、数据仓库、数据挖掘，以及以SQL Server 2000作为网络编程的后台数据库，通过ODBC和ADO数据库访问技术，把ASP技术或JSP技术制作的Web网页与数据库之间连接起来等。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('x8fnru557WYH9b4eFJi5RK', '恋情的终结', '2019-03-12 14:12:38', ' 柯平', '江苏凤凰文艺出版社 ', '15.00', '二战期间的英国伦敦，作家莫里斯爱上公务员亨利的妻子萨拉。一次意外事件导致萨拉不辞而别， 莫里斯在恨和嫉妒中度过了两年。两年后 ，他们再次相遇，当初那段感情中炙热的 爱、恨、猜疑、嫉妒、信仰，再度折磨着莫里斯。这段恋情最终如莫里斯所言：变成了一桩有开始也有结束的风流韵事。莫里斯记述了爱情开始的时刻，以及最后的时刻。这本书里有狂热的爱、狂热的恨、狂热的猜疑、狂热的嫉妒、狂热的信仰，有爱情中所有狂热的情感。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('y78KwGaPQhM6C2aiWZFma5', '演绎生动：Excel图表', '2019-03-12 14:12:55', ' 杜龙', '电子工业出版社 ', '45.00', '是一本旨在帮助大家有效利用Excel制作图表的书籍，内容涵盖Excel图表制作的方方面面。将Excel2003、2007、2010三个版本图表融会贯通讲解，并且给出多版本混用时代具体对策建议的图表书籍。内附大量经典案例，侧重以正确的理念指导图表制作，以浅显易懂的方式循序渐进讲解Excel图表制作技巧。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('yCRmxxwVHNNUsDqEwAFcBe', '旅游文化学', '2019-03-12 14:12:48', ' 文彤', 'unknown ', '2.00', '《旅游文化学》，本书共有十二章，从“人一人”、“人一地”的新视角对旅游文化体系进行了新的认识。一方面，从人与人的角度探讨了旅游过程中旅游者、居民、政府、企业及员工、非营利组织等相关群体之间的文化关系与文化交流；另一方面，从人与地的角度解析了旅游活动给目的地、客源地、旅游产品带来的影响效应和发展动力。除此之外，本书还对文化影响、跨文化交流、文化休闲、可持续发展等旅游文化发展新动向、新趋势进行了论述。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('YsFAcapTwfVkUtEmd6HX93', '社会性动物', '2019-03-12 14:12:51', ' 邢占军', '华东师范大学出版社 ', '19.00', '《社会性动物》是“美国社会心理学的《圣经》”（Revue des Questions Scientifiques的评价），“仍然是最好的……是一部杰作”（Contemporary Psychology的评价）。本书从1972年出版第一版以来，在世界范围内畅销数千万册，是社会心理学领域内最具影响的著作。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('yysSC7ZrxH3fFLN5nVcMjZ', '新东方·恋练有词', '2019-03-12 14:12:57', ' 朱伟,唐迟', '群言出版社 ', '10.00', '', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('yZhGLPqxbMoP6VSxNQjmL6', '亲爱的安德烈', '2019-03-12 14:12:54', ' 龙应台,安德烈', '广西师范大学出版社 ', '15.00', '编辑推荐', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('yzzFB88dgKyuvRU9L44UCG', '物权法', '2019-03-12 14:12:53', ' 梁慧星', '中国法律图书有限公司 ', '15.00', '本书是教育部普通高等教育“十一五”国家级规划教材之一。作者不仅是学界权威，更是中国物权法立法进程的引领者，全程参与我国物权法的制定过程。本次新版充分汲取了我国《物权法》的新成果，详释了《物权法》确立的新制度，并对《物权法》作出了独到的评析；同时，结合大陆法系新近物权法的理论研究动向及我国物权法司法实践，对物权法的内容作了全景式的阐述。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('Z3Bjj9DW5Fe6VKAmntgEjC', '21世纪大学实用英语综合教程（第三册）', '2019-03-12 14:12:47', ' unknown', '复旦大学 ', '5', '《21世纪大学实用英语综合教程(第3册)》为《综合教程》第三册，共8个单元，每个单元均包括听说、读写和实用技能训练三大板块的内容。听说部分围绕每单元的主题，并结合高职高专学生学习生活和毕业后实际工作的需要，进行听力与口语方面的专门训练。读写板块包括Text A（精读），Text B（泛读）和Text C（扩展阅读），并配有相应的练习。实用技能训练部分根据高职高专教育的特点，提供以提高职业技能和素质为目标的实用训练，包括Grammar Review，Practical Writing和Basic Reading Skills等内容。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('ZFrAdKZ2qhTVMrp93sevf9', '我是猫', '2019-03-12 14:12:39', ' 曹曼', '浙江文艺出版社 ', '13.00', '《我是猫》是日本“国民大师”夏目漱石的代表成名作，对日本文学有着极深远的影响。', 'Y2J4WnRqxNBMCS4YphzmyC');
INSERT INTO `book` VALUES ('zv7FoBH9TqDofN9dfDJAR4', '外国文学教程', '2019-03-12 14:12:48', ' 成良臣 编', '四川大学出版社 ', '5', '你对外国文学时间跨度大，涉及范围广而感到精疲力竭吗？你对外国文学思潮复杂多变，经典名著汗牛充栋而头痛不已吗？《外国文学教程》是一本针对专科学生的实际而编写的教材，相信通过学习这本书，对掌握外国文学的基本知识，提高理解、鉴赏、分析外国文学作品的能力将大有裨益。', 'Y2J4WnRqxNBMCS4YphzmyC');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `book_id` varchar(100) DEFAULT NULL,
  `author_id` varchar(100) DEFAULT NULL,
  `origin_comment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `book_id` (`book_id`),
  KEY `origin_comment_id` (`origin_comment_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `front_user` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`origin_comment_id`) REFERENCES `comment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=446 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('445', '12', '2019-03-13 08:56:06', 'tUj9MkheShgmXdUwT8VoBA', 'z6dezWhNpiYMvD4WkrBSpW', null);

-- ----------------------------
-- Table structure for front_user
-- ----------------------------
DROP TABLE IF EXISTS `front_user`;
CREATE TABLE `front_user` (
  `id` varchar(100) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `_password` varchar(150) NOT NULL,
  `join_time` datetime DEFAULT NULL,
  `nickname` varchar(150) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of front_user
-- ----------------------------
INSERT INTO `front_user` VALUES ('Y2J4WnRqxNBMCS4YphzmyC', '哈哈', '1417766861@qq.com', 'https://secondbook.oss-cn-hangzhou.aliyuncs.com/avater/20190313000341-3ab86a7d768a572.jpg', 'pbkdf2:sha256:50000$hF7Vki70$0756ad14974834eecf413b2d99a12db668d389a61eb216eb21408cfcc1f06352', '2019-03-05 20:50:47', null, '1');
INSERT INTO `front_user` VALUES ('z6dezWhNpiYMvD4WkrBSpW', '大喵', '1228903468@qq.com', 'https://secondbook.oss-cn-hangzhou.aliyuncs.com/avater/20190308211521mao.jpg', 'pbkdf2:sha256:50000$T4NHerwr$6c496013e95b6e5621a9b460d500c4e6cc00f2866bd771d605c32ff39886086f', '2019-03-06 21:53:08', null, '1');

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(150) DEFAULT NULL,
  `book_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('91', 'https://ubookmall.b0.upaiyun.com/isbn/539/979/9787539979410_03.jpg!w600', 'x8fnru557WYH9b4eFJi5RK');
INSERT INTO `image` VALUES ('92', 'https://ubookmall.b0.upaiyun.com/isbn/533/942/9787533942236_81.jpg!w600', 'ZFrAdKZ2qhTVMrp93sevf9');
INSERT INTO `image` VALUES ('93', 'https://ubookmall.b0.upaiyun.com/isbn/801/067/9787801067784_41.jpg!w600', '6uAJPCyH4vtQYjPK5PoDhJ');
INSERT INTO `image` VALUES ('94', 'https://ubookmall.b0.upaiyun.com/isbn/540/455/9787540455958_91.jpg!w600', 'ouP9pDeSt2UChBCB6Mt7EN');
INSERT INTO `image` VALUES ('95', 'https://ubookmall.b0.upaiyun.com/isbn/540/487/9787540487645_44.jpg!w600', 'KG8dsh4PuRcq7HEKdVa7Q5');
INSERT INTO `image` VALUES ('96', 'https://ubookmall.b0.upaiyun.com/isbn/020/098/9787020098095_98.jpg!w600', 'VLej8PuLZ5zeyzFeiKsRGM');
INSERT INTO `image` VALUES ('97', 'https://ubookmall.b0.upaiyun.com/isbn/802/501/9787802501775_37.jpg!w600', 'wMaaE9reRxkJgBXwd9svGA');
INSERT INTO `image` VALUES ('98', 'https://ubookmall.b0.upaiyun.com/isbn/801/716/9787801716576_86.jpg!w600', 'UvVDpFTNMN8RyXseXSZs5e');
INSERT INTO `image` VALUES ('99', 'https://ubookmall.b0.upaiyun.com/isbn/540/458/9787540458027_48.jpg!w600', 'WrrS36qVaZko85rSS9QrrK');
INSERT INTO `image` VALUES ('100', 'https://ubookmall.b0.upaiyun.com/isbn/544/703/9787544703987_05.jpg!w600', 'BawYEnEW5dbnLDjSbeKVDV');
INSERT INTO `image` VALUES ('101', 'https://ubookmall.b0.upaiyun.com/isbn/539/983/9787539983295_88.jpg!w600', 'a8oZq5c7uR7XN64JDtNEC7');
INSERT INTO `image` VALUES ('102', 'https://ubookmall.b0.upaiyun.com/isbn/540/475/9787540475475_92.jpg!w600', '2NXNJFEfg2VkSidLXH7e8R');
INSERT INTO `image` VALUES ('103', 'https://ubookmall.b0.upaiyun.com/isbn/506/365/9787506365437_44.jpg!w600', 'LityBZbXrgLKe5GqZjZCJc');
INSERT INTO `image` VALUES ('104', 'https://ubookmall.b0.upaiyun.com/isbn/550/024/9787550024212_79.jpg!w600', 'acErAxnz36ATHSrxRhatc8');
INSERT INTO `image` VALUES ('105', 'https://ubookmall.b0.upaiyun.com/isbn/540/487/9787540487676_67.jpg!w600', 'ANYUHLydH8GSkNwJQMGX3S');
INSERT INTO `image` VALUES ('106', 'https://ubookmall.b0.upaiyun.com/isbn/559/608/9787559608949_01.jpg!w600', 'CgtrDfxkbBUxGuAv4FCUb2');
INSERT INTO `image` VALUES ('107', 'https://ubookmall.b0.upaiyun.com/isbn/544/270/9787544270878_97.jpg!w600', 'TV3sdCPYQMFXBo5CNdqCc9');
INSERT INTO `image` VALUES ('108', 'https://ubookmall.b0.upaiyun.com/isbn/539/971/9787539971810_73.jpg!w600', 'r2jmxxXSPrSM2u3UqgoVcG');
INSERT INTO `image` VALUES ('110', 'https://ubookmall.b0.upaiyun.com/isbn/535/447/9787535447340_32.jpg!w600', 'D8Sq2vnHKrroGnUnaN9WX5');
INSERT INTO `image` VALUES ('111', 'https://ubookmall.b0.upaiyun.com/isbn/301/170/9787301170281_76.jpg!w600', 'FrUpVwLhTSYNuFQhCG2MrJ');
INSERT INTO `image` VALUES ('112', 'https://ubookmall.b0.upaiyun.com/isbn/309/064/9787309064513_80.jpg!w600', 'HEUCx6k2HtSTTUVB7EqtHW');
INSERT INTO `image` VALUES ('113', 'https://ubookmall.b0.upaiyun.com/isbn/810/048/9787810048293_11.jpg!w600', 'KfgXHjyL43ChownF4bResd');
INSERT INTO `image` VALUES ('114', 'https://ubookmall.b0.upaiyun.com/isbn/309/040/9787309040210_77.jpg!w600', 'K8nhu3FNweiZWVBfpRMNkb');
INSERT INTO `image` VALUES ('115', 'https://ubookmall.b0.upaiyun.com/isbn/309/039/9787309039900_75.jpg!w600', '4pVoZUutSYt7JWifxe3j5d');
INSERT INTO `image` VALUES ('116', 'https://ubookmall.b0.upaiyun.com/isbn/040/221/9787040221961_37.jpg!w600', 'LwLyvreHKH2vCJ4BDGZqaH');
INSERT INTO `image` VALUES ('117', 'https://ubookmall.b0.upaiyun.com/isbn/800/875/9787800875830_99.jpg!w600', 'nwxRUKAjW754eBdm5astHM');
INSERT INTO `image` VALUES ('118', 'https://ubookmall.b0.upaiyun.com/isbn/214/080/9787214080356_72.jpg!w600', 'eDUA5x2S5eS7WSXBfF5RU8');
INSERT INTO `image` VALUES ('119', 'https://ubookmall.b0.upaiyun.com/isbn/302/061/9787302061236_89.jpg!w600', 'ws3HojCzuXiC9LqNDnP88o');
INSERT INTO `image` VALUES ('120', 'https://ubookmall.b0.upaiyun.com/isbn/510/461/9787510461880_32.jpg!w600', 'jD8NC3xGzMhK4736tQgGST');
INSERT INTO `image` VALUES ('121', 'https://ubookmall.b0.upaiyun.com/isbn/302/138/9787302138006_67.jpg!w600', '4u6wTCbM9it8SpttwLcj66');
INSERT INTO `image` VALUES ('122', 'https://ubookmall.b0.upaiyun.com/isbn/810/382/9787810382250_19.jpg!w600', 'b9NBm2uNqREBbh3SEAEM58');
INSERT INTO `image` VALUES ('123', 'https://ubookmall.b0.upaiyun.com/isbn/515/809/9787515809236_76.jpg!w600', 'w2sUfEbeMurzYxzCGMg2y8');
INSERT INTO `image` VALUES ('124', 'https://ubookmall.b0.upaiyun.com/isbn/508/608/9787508608686_09.jpg!w600', 'b6JfQ3xrXKZStEtiqrTEVE');
INSERT INTO `image` VALUES ('125', 'https://ubookmall.b0.upaiyun.com/isbn/115/220/9787115220240_61.jpg!w600', '7R9pHaXAYnjKtBDswtp2fR');
INSERT INTO `image` VALUES ('126', 'https://ubookmall.b0.upaiyun.com/isbn/309/042/9787309042696_32.jpg!w600', 'Z3Bjj9DW5Fe6VKAmntgEjC');
INSERT INTO `image` VALUES ('127', 'https://ubookmall.b0.upaiyun.com/isbn/540/448/9787540448462_96.jpg!w600', 'p8263hGpdciWi7Z25oWr3h');
INSERT INTO `image` VALUES ('128', 'https://ubookmall.b0.upaiyun.com/isbn/504/359/9787504359117_28.jpg!w600', 'kNF63VZmvooF5EQm8Ep8bR');
INSERT INTO `image` VALUES ('129', 'https://ubookmall.b0.upaiyun.com/isbn/561/423/9787561423806_98.jpg!w600', 'zv7FoBH9TqDofN9dfDJAR4');
INSERT INTO `image` VALUES ('130', 'https://ubookmall.b0.upaiyun.com/isbn/309/031/9787309031164_24.jpg!w600', 'D2rBFSUbHYKe5NSnrM2mYL');
INSERT INTO `image` VALUES ('131', 'https://ubookmall.b0.upaiyun.com/isbn/503/850/9787503850103_96.jpg!w600', 'qytakygcpMMSp6SzzWMH7Q');
INSERT INTO `image` VALUES ('132', 'https://ubookmall.b0.upaiyun.com/book/2017/06/25/0299562240_1498365865.jpg!w600', 'yCRmxxwVHNNUsDqEwAFcBe');
INSERT INTO `image` VALUES ('133', 'https://ubookmall.b0.upaiyun.com/book/2017/11/21/13/19123956_54pszf912h32bgap.jpg!w600', '4GYfVefMWPrjwY9m7GoNUn');
INSERT INTO `image` VALUES ('134', 'https://ubookmall.b0.upaiyun.com/book/2018/01/13/1502166532_1515776165.jpg!w600', 'F5gCFTYzg3diqB68uSbEv3');
INSERT INTO `image` VALUES ('135', 'https://ubookmall.b0.upaiyun.com/book/2017/07/18/6997378639_1500311740.jpg!w600', 'NWiYK6AYrUoyPt6WruozMT');
INSERT INTO `image` VALUES ('136', 'https://ubookmall.b0.upaiyun.com/book/2018/09/02/0570100810_1535864618.jpg!w600', 'c7JXEdTFGhjqq53vEjUpGU');
INSERT INTO `image` VALUES ('137', 'https://ubookmall.b0.upaiyun.com/book/2018/10/11/3109000011_1539250931.jpg!w600', 'EhjUXM8cDuRTynKbLDmLFb');
INSERT INTO `image` VALUES ('138', 'https://ubookmall.b0.upaiyun.com/book/2018/11/01/7194086614_1541032521.jpg!w600', 'QzGVScnk7PjXoT3iBpwmyE');
INSERT INTO `image` VALUES ('139', 'https://ubookmall.b0.upaiyun.com/book/2018/11/26/5416255404_1543232341.jpg!w600', '2Lk9FnoqgAeJoMh77DSeBZ');
INSERT INTO `image` VALUES ('140', 'https://ubookmall.b0.upaiyun.com/book/2018/12/20/08/22333097_8et9nu6gzdmcqpys.jpg!w600', 'teoyXwNCqbCuMbqzooTDRa');
INSERT INTO `image` VALUES ('141', 'https://ubookmall.b0.upaiyun.com/book/2019/02/25/10/22999780_4ijqzjlhv8302k7y.jpg!w600', 'SSPoShJWKUJB5C9mrQDZZC');
INSERT INTO `image` VALUES ('142', 'https://ubookmall.b0.upaiyun.com/book/2019/02/27/3729191847_1551282986.jpg!w600', 'AaTjiqawysBkMVDVgPLVaX');
INSERT INTO `image` VALUES ('143', 'https://ubookmall.b0.upaiyun.com/book/2019/03/01/8222819696_1551429813.jpg!w600', 'tnMjC5idEEQ8URkEiQZeaD');
INSERT INTO `image` VALUES ('144', 'https://ubookmall.b0.upaiyun.com/book/2019/03/01/1779298281_1551430333.jpg!w600', 'YsFAcapTwfVkUtEmd6HX93');
INSERT INTO `image` VALUES ('145', 'https://ubookmall.b0.upaiyun.com/isbn/533/942/9787533942236_81.jpg!w600', 'dKu3m5xH8TbCN53erd78kZ');
INSERT INTO `image` VALUES ('146', 'https://ubookmall.b0.upaiyun.com/isbn/117/266/9787117266390_33.jpg!w600', 'vkx2CwNPKMgHWHMaeCZpML');
INSERT INTO `image` VALUES ('147', 'https://ubookmall.b0.upaiyun.com/isbn/301/036/9787301036891_30.jpg!w600', '27bMSBedhuq3T5JvnJobFh');
INSERT INTO `image` VALUES ('148', 'https://ubookmall.b0.upaiyun.com/isbn/115/279/9787115279460_10.jpg!w600', 'jqWWjPFhbMcAVnhLpWuZbU');
INSERT INTO `image` VALUES ('149', 'https://ubookmall.b0.upaiyun.com/isbn/111/482/9787111482253_43.jpg!w600', 'rMbUQJy2WjYS2XMSSLrrAM');
INSERT INTO `image` VALUES ('150', 'https://ubookmall.b0.upaiyun.com/book/isbntest/511/733/9787511733443_59.jpg!w600', 'jmEh4mzSAXgHog9VE2uJmQ');
INSERT INTO `image` VALUES ('151', 'https://ubookmall.b0.upaiyun.com/book/2014/03/01/2276057326_1393661405.jpg!w600', 'yzzFB88dgKyuvRU9L44UCG');
INSERT INTO `image` VALUES ('152', 'https://ubookmall.b0.upaiyun.com/book/2015/09/13/6123176606_1442142039.jpg!w600', 'QJyxK6mfRE9sG2328xMaTU');
INSERT INTO `image` VALUES ('153', 'https://ubookmall.b0.upaiyun.com/book/2015/10/17/3289178397_1445059921.jpg!w600', 'ButJvpLZ8aCbZeo3B9oMWK');
INSERT INTO `image` VALUES ('154', 'https://ubookmall.b0.upaiyun.com/book/2015/12/11/2307221022_1449834684.jpg!w600', 'KTpivSDXfdTaWMdXVdvZyb');
INSERT INTO `image` VALUES ('155', 'https://ubookmall.b0.upaiyun.com/book/2016/01/04/0538028411_1451872494.jpg!w600', '9RgxhK68CvXTqw4wcVFV94');
INSERT INTO `image` VALUES ('156', 'https://ubookmall.b0.upaiyun.com/book/2016/01/26/1619428721_1453782041.jpg!w600', 'Abmkdjp6Xqw9rz2JZWbFYE');
INSERT INTO `image` VALUES ('157', 'https://ubookmall.b0.upaiyun.com/book/2016/02/18/8839457785_1455769567.jpg!w600', 'yZhGLPqxbMoP6VSxNQjmL6');
INSERT INTO `image` VALUES ('158', 'https://ubookmall.b0.upaiyun.com/book/2016/02/18/4876206852_1455803021.jpg!w600', 'RARB8ZxaxJncDKmJZMYyQf');
INSERT INTO `image` VALUES ('159', 'https://ubookmall.b0.upaiyun.com/book/2016/02/27/4736080618_1456556567.jpg!w600', 'y78KwGaPQhM6C2aiWZFma5');
INSERT INTO `image` VALUES ('160', 'https://ubookmall.b0.upaiyun.com/book/2016/03/05/7352712205_1457174304.jpg!w600', 'UZC95CHXPah7QisJCMCx7S');
INSERT INTO `image` VALUES ('161', 'https://ubookmall.b0.upaiyun.com/book/2016/03/21/3893958929_1458493503.jpg!w600', 'Md3S2XgVFSWXdYTZ25wRz8');
INSERT INTO `image` VALUES ('162', 'https://ubookmall.b0.upaiyun.com/book/2016/04/08/2745675414_1460105826.jpg!w600', 'Bp5GkENeoMGWrUHuBbuDWW');
INSERT INTO `image` VALUES ('163', 'https://ubookmall.b0.upaiyun.com/book/2016/04/09/6186284436_1460202023.jpg!w600', 'KZNHdmdyNq4He75TVHfdbg');
INSERT INTO `image` VALUES ('164', 'https://ubookmall.b0.upaiyun.com/book/2016/04/28/4729483771_1461856694.jpg!w600', 'ntAdMxpuSiEDmWwz3txkX2');
INSERT INTO `image` VALUES ('166', 'https://ubookmall.b0.upaiyun.com/book/2016/05/26/6493857360_1464267615.jpg!w600', 'Udc7oREqKmpVhNohoNkxqR');
INSERT INTO `image` VALUES ('167', 'https://ubookmall.b0.upaiyun.com/book/2016/05/31/8424010554_1464651548.jpg!w600', 'yysSC7ZrxH3fFLN5nVcMjZ');
INSERT INTO `image` VALUES ('170', 'https://ubookmall.b0.upaiyun.com/book/2016/06/13/6543705945_1465782515.jpg!w600', 'tUj9MkheShgmXdUwT8VoBA');
