/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50521
Source Host           : localhost:3306
Source Database       : uushop

Target Server Type    : MYSQL
Target Server Version : 50521
File Encoding         : 65001

Date: 2014-01-08 20:43:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `addrDetail` varchar(60) DEFAULT NULL,
  `city` varchar(8) DEFAULT NULL,
  `consignee` varchar(30) DEFAULT NULL,
  `flag` varchar(2) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `province` varchar(8) DEFAULT NULL,
  `region` varchar(8) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `zipCode` varchar(20) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `FK1ED033D46A78291A` (`uid`),
  CONSTRAINT `FK1ED033D46A78291A` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '天津师范大学', '1', 'liaoyu', '1', '13820106356', '1', '11', '', '300387', '1');

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(20) DEFAULT NULL,
  `bname` varchar(20) NOT NULL,
  `bookInfo` longtext,
  `collect_count` int(11) DEFAULT NULL,
  `commentCount` int(11) DEFAULT NULL,
  `image` varchar(30) DEFAULT NULL,
  `inventoryCount` int(11) DEFAULT NULL,
  `online` int(11) DEFAULT NULL,
  `price` float NOT NULL,
  `publishCompany` varchar(30) DEFAULT NULL,
  `publishDate` varchar(10) DEFAULT NULL,
  `recommend` int(11) DEFAULT NULL,
  `saleCount` int(11) DEFAULT NULL,
  `typeid` int(11) NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `FK1FAF0970860BB9` (`typeid`),
  CONSTRAINT `FK1FAF0970860BB9` FOREIGN KEY (`typeid`) REFERENCES `booktype` (`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', '路遥', '平凡的世界', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">这是一部现实主义小说，也是小说化的家族史。作家高度浓缩了中国西北农村的历史变迁过程，作品达到了思想性与艺术性的高度统一，特别是主人公面对困境艰苦奋斗的精神，对今天的大学生朋友仍有启迪。这是一部全景式地表现中国当代城乡社会生活的长篇小说，本书共三部。作者在近十年问广阔背景上，通过复杂的矛盾纠葛，刻划了社会各阶层众多普通人的形象。劳动与爱情，挫折与追求，痛苦与欢乐，日常生活与巨大社会冲突，纷繁地交织在一起，深刻地展示了普通人在大时代历史进程中所走过的艰难曲折的道路。</span>', '0', '0', '20140108154038_440.jpg', '20', '0', '56.3', '北京十月文艺出版社', '2012-3-1', '0', '0', '6');
INSERT INTO `book` VALUES ('2', '路遥', '人生', '<div id=\"content\" class=\"section\" style=\"margin:0px 0px 10px;padding:0px;list-style-type:none;border:0px;color:#666666;font-family:SimSun, Arial;line-height:normal;white-space:normal;background-color:#FFFFFF;\">\r\n	<div class=\"tit\" style=\"margin:1px;padding:0px 0px 0px 17px;list-style-type:none;border:0px;background-color:#F5F5F5;font-weight:bold;height:31px;line-height:31px;color:#404040;\">\r\n		内容推荐\r\n	</div>\r\n	<div class=\"descrip\" style=\"margin:0px;padding:16px 22px 6px;list-style-type:none;border:0px;line-height:21px;\">\r\n		<span id=\"content_all\">\r\n		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;list-style-type:none;border:0px;\">\r\n			　　《人生》是路遥的一部中篇小说，发表于1982年，它以改革时期陕北高原的城乡生活为时空背景，叙述了高中毕业生高加林回到土地又离开土地，再回到土地这样人生的变化过程。高加林同农村姑娘刘巧珍、城市姑娘黄亚萍之间的感情纠葛构成了故事发展的矛盾，也正是体现那种艰难选择的悲剧。\r\n		</p>\r\n</span>\r\n	</div>\r\n</div>\r\n<div id=\"authorintro\" class=\"section\" style=\"margin:0px 0px 10px;padding:0px;list-style-type:none;border:0px;color:#666666;font-family:SimSun, Arial;line-height:normal;white-space:normal;background-color:#FFFFFF;\">\r\n	<div class=\"tit\" style=\"margin:1px;padding:0px 0px 0px 17px;list-style-type:none;border:0px;background-color:#F5F5F5;font-weight:bold;height:31px;line-height:31px;color:#404040;\">\r\n		作者简介\r\n	</div>\r\n	<div class=\"descrip\" style=\"margin:0px;padding:16px 22px 6px;list-style-type:none;border:0px;line-height:21px;\">\r\n		<span id=\"authorintro_all\">\r\n		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;list-style-type:none;border:0px;\">\r\n			　　路遥（1949—1992）原名王卫国，1949年12月3日生于陕西榆林市清涧县一个贫困的农民家庭，7岁时因为家里困难被过继给延川县农村的伯父。曾在延川县立中学学习，1969年回乡务农。这段时间里他做过许多临时性的工作，并在农村一小学中教过一年书。1973年进入延安大学中文系学习。\r\n		</p>\r\n</span>\r\n	</div>\r\n</div>', '2', '1', '20140108154445_713.jpg', '19', '0', '19.8', '北京十月文艺出版社', '2012-3-1', '0', '1', '6');
INSERT INTO `book` VALUES ('3', '三毛', '撒哈拉的故事', '<div id=\"content\" class=\"section\" style=\"margin:0px 0px 10px;padding:0px;list-style-type:none;border:0px;color:#666666;font-family:SimSun, Arial;line-height:normal;white-space:normal;background-color:#FFFFFF;\">\r\n	<div class=\"tit\" style=\"margin:1px;padding:0px 0px 0px 17px;list-style-type:none;border:0px;background-color:#F5F5F5;font-weight:bold;height:31px;line-height:31px;color:#404040;\">\r\n		内容推荐\r\n	</div>\r\n	<div class=\"descrip\" style=\"margin:0px;padding:16px 22px 6px;list-style-type:none;border:0px;line-height:21px;\">\r\n		<span id=\"content_all\">\r\n		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;list-style-type:none;border:0px;\">\r\n			　　三毛作品中最脍炙人口当属《撒哈拉的故事》，本书由十几篇精彩动人的散文结合而成，其中《沙漠中的饭店》，是三毛适应荒凉单调的沙漠生活后，重新拾笔的第一篇文章，从此之后，三毛便写出一系列以沙漠为背景的故事，倾倒了全世界的华文读者。\r\n		</p>\r\n</span>\r\n	</div>\r\n</div>\r\n<div id=\"authorintro\" class=\"section\" style=\"margin:0px 0px 10px;padding:0px;list-style-type:none;border:0px;color:#666666;font-family:SimSun, Arial;line-height:normal;white-space:normal;background-color:#FFFFFF;\">\r\n	<div class=\"tit\" style=\"margin:1px;padding:0px 0px 0px 17px;list-style-type:none;border:0px;background-color:#F5F5F5;font-weight:bold;height:31px;line-height:31px;color:#404040;\">\r\n		<a id=\"authorintro_icon\" class=\"icon icon_down\" style=\"color:#1A66B3;background-image:url(http://product.dangdang.com/images/sprite.png);display:inline-block;vertical-align:middle;outline:0px;float:right;height:11px;margin:10px 20px 0px 0px;width:9px;background-position:-142px -25px;background-repeat:no-repeat no-repeat;\"></a>作者简介\r\n	</div>\r\n	<div class=\"descrip\" style=\"margin:0px;padding:16px 22px 6px;list-style-type:none;border:0px;line-height:21px;\">\r\n		<span id=\"authorintro_show\">本名陈懋平，因为学不会写“懋＂字，就自己改名为陈平。<br />\r\n　　十三岁就跷家去小琉球玩，初中时逃学去坟墓堆读闲书。<br />\r\n　　旅行和读书是她生命中的两颗一级星，最快乐与最疼痛都夹杂其中。<br />\r\n　　她没有数字观念，不肯为金钱工作，写作之初纯粹是为了让父母开心。<br />\r\n　　她看到一张撒哈拉沙漠的照片，感应到前世的乡愁，于是决定搬去住，苦恋她的荷西也二话不说地跟着去了。<br />\r\n　　然后她和荷西在沙漠结婚了，从此写出一系列风靡无数读者的散文作品，把大漠的狂野温柔和活力四射的婚姻生活，淋漓尽致展现在大家面前，“三毛热＂迅速的从台港横扫整个华文世界，而“流浪文学＂更成为一种文化现象！<br />\r\n　　接着，安定的归属却突然急转直下，与挚爱的荷西锥心的死别，让她差点要放弃生命，直到去了一趟中南美旅游，才终于重新提笔写作。接着她尝试写剧本、填歌词，每次出手必定撼动人心。<br />\r\n　　最终，她又像儿时那样不按常理出牌，逃离到没人知道的远方，继续以自由不羁的灵魂浪迹天涯。</span>\r\n	</div>\r\n</div>', '0', '0', '20140108154735_108.jpg', '20', '0', '19', '北京十月文艺出版社', '2011-7-1', '0', '0', '6');
INSERT INTO `book` VALUES ('4', '三毛', '梦里花落知多少', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">书中先是记录了三毛与荷西在撒哈拉沙漠结婚，白手成家的生活，而此时她的文学创作生涯也随之开启；后来移居加纳利群岛后，三毛的生活渐趋安定，她的创作也达到了很高的水平；再后来，荷西在一次潜水时意外去世，三毛的心灵受到巨大创伤，人生陷入低谷。一段时间后，三毛再度出走，游历中南美洲，开始新的生活。而这段经历，也使她的文风发生了一定的转变。</span>', '0', '0', '20140108154954_407.jpg', '20', '0', '19', '北京十月文艺出版社', '2013-12-11', '0', '0', '6');
INSERT INTO `book` VALUES ('5', '三毛', '雨季不再来', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">当三毛还是二毛的时候，她写下了《雨季不再来》，这些在她17~22岁之间所发表的文字，真实地呈现出从青涩敏感的二毛，蜕变为智慧成熟的三毛的成长的过程。而《雨季不再来》中透露的纯情和美感，可以清楚地印证她传奇般性格的痕迹。</span>', '0', '0', '20140108155124_648.jpg', '20', '0', '14.4', '北京十月文艺出版社', '2013-12-1', '0', '0', '6');
INSERT INTO `book` VALUES ('6', '三毛', '万水千山走遍', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">主要记录了她在中南美洲和祖国大陆的游历见闻和感受，作为读者，我们不妨跟随她的脚步，也做一次纸上的旅行。书中叙写了墨西哥之行、洪都拉斯之行、巴拿马之行等等，旅途中的所见所闻，风土人情又将带给三毛哪些感受呢？在这部精彩的游记散文中我们将一一找到答案。</span><br />', '0', '0', '20140108155258_781.jpg', '20', '0', '16.6', '北京十月文艺出版社', '2011-7-1', '1', '0', '6');
INSERT INTO `book` VALUES ('7', '三毛', '稻草人手记', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">书中记录的是三毛定居加纳利岛后生活中的点点滴滴，语言朴实、简单，其中的情趣与无奈，朴实而谐趣，令人笑叹。也许，正是这样简简单单的生活，才给了三毛无限的创作灵感。</span>', '0', '0', '20140108155429_442.jpg', '20', '0', '13.9', '北京十月文艺出版社', '2011-7-1', '1', '0', '6');
INSERT INTO `book` VALUES ('8', '三毛', '我的宝贝', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">本书收录三毛走遍万水千山收集的86件宝贝的来历故事及全部精美照片。这些宝贝的价格也许不能用金钱来衡量，但是作者却深深地爱着它们……</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">　　所有宝贝全以彩色印刷的方式呈现给广大读者，可谓是图文并茂，活灵活现。</span>', '0', '0', '20140108155604_967.jpg', '20', '0', '19.2', '北京十月文艺出版社', '2011-9-1', '1', '0', '6');
INSERT INTO `book` VALUES ('10', '三毛', '送你一匹马', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">本书叙述的是三毛回到台湾后的事情。在台湾，三毛跟父母住在一起，更写了她与父母亲人之间的琐事，这让我们有机会近距离接触三毛的家，接触三毛的生活。可以说这一段三毛是忙碌的。总得说来，她的语言,没有华丽的辞藻,却能让我们看到一颗真挚的心，一个真实的三毛。</span>', '0', '0', '20140108155855_853.jpg', '20', '0', '16.3', '北京十月文艺出版社', '2011-9-1', '1', '0', '6');
INSERT INTO `book` VALUES ('11', '贾平凹', '废都', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">小说以历史文化悠久的古都西安当代生活为背景，记叙“闲散文人”作家庄之蝶、书法家龚靖元、画家汪希眠及艺术家阮知非“四大名人”的起居生活，展现了浓缩的西京城形形色色“废都”景观。作者以庄之蝶与几位女性情感的纠葛为主线，以阮知非等诸名士穿插叙述为辅线，笔墨浓淡相宜。在诸多女性中，唐宛儿、柳月、牛月清为他塑造最为成功也最倾心的鲜明人物。在这些充满灵性、情感聪慧而富有古典悲剧色彩的人物身上，体现出作者至高的美学理想</span>', '0', '0', '20140108160202_316.jpg', '20', '0', '24.7', '译林出版社', '2013-12-25', '1', '0', '2');
INSERT INTO `book` VALUES ('12', '鲁迅', '朝花夕拾', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">《朝花夕拾》是鲁迅先生创作生涯中惟一的一部散文集，其中包括十篇散文。前五篇写于北京，后五篇则写于厦门。这十篇散文，按照鲁迅先生的说法是“回忆的记事”，比较完整地记录了他从幼年到青年时期的生活经历和思想脉络，生动地描绘了一幅清末民初的社会风貌图，是研究鲁迅先生早期思想和生活的重要资料。这些作品，文笔深沉隽永，是中国现代散文中的经典。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">　　本书除了鲁迅先生的散文集《朝月花夕拾》之外，还收录了一部分鲁迅先生的精品杂文。杂文在鲁迅先生的笔下成为了一种自由地摹写世相、描述见闻、评说人事、言志抒情的精彩华章，其内容无所不包，被鲁迅先生赋予了思想启蒙和反抗现实的使命，从而以博大精深的思想内涵和独特完美的艺术形式，攀上了中国文学的高峰。在这些杂文中，处处体现着鲁迅先生思想和智慧的光芒，希望通过这样一种编排形式让读者更加全面地了解鲁迅先生的文学创作历程和作品风貌，深刻体悟鲁迅先生的文学精神与人文思想。</span>', '0', '0', '20140108160409_996.jpg', '20', '0', '13', '陕西师范大学出版社', '2009-4-1', '1', '0', '2');
INSERT INTO `book` VALUES ('13', '鲁迅', '狂人日记', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">本书图文并茂，选篇优良，其编修根源是一种自身对于经典的崇拜，其动力是作为一个出版人的社会责任感。在物质生活日益丰富的今天，网络文学、快餐文化如此泛滥，良莠不齐，迷惑着人们的眼界，更有甚者，直接诱骗读者的感情，也不乏些庸庸之作，一点言笑，几滴眼泪，以此来赚取大家宝贵的时间甚至生命。对于心灵及精神上的建设与维护，自是不敢说力挽狂澜，只求能尽一己绵薄之力，锄一方微圃，让路过的人能欣赏到一些花繁叶茂的风景。只是我希望，路人在一瞥的同时，能略微驻足，植叶茂于眼中，沁花香于肺腑。</span>', '0', '0', '20140108160604_464.jpg', '20', '0', '13.4', '中国画报出版社', '2012-2-1', '1', '0', '38');
INSERT INTO `book` VALUES ('14', '鲁迅', '阿Q正传', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">《阿Q正传》以辛亥革命前后的农村小镇未庄为背景，塑造了一个以“精神胜利法”为主要特征的流浪汉阿Q，描画出从物质到精神都受到严重戕害的国人的魂灵。小说生动、真实、深刻地反映了一个时代的社会现实，着重“国民性的弱点”的暴露与批判。它以深刻的思想意义和精湛的艺术技巧，代表了百年来中国中篇小说的最高成就。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">本书除中篇《阿旺传》外，还编入鲁迅有代表性的中短篇若干，是鲁迅小说的一个精选本。附录多篇中外评论，见证了鲁迅作为一个文学思想者的博大与渊深。</span>', '0', '0', '20140108160725_63.jpg', '20', '0', '9.6', '花城出版社', '2009-8-1', '1', '0', '2');
INSERT INTO `book` VALUES ('15', '鲁迅', '呐喊', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">鲁迅是中国文化革命的主将，他不但是伟大的文学家，而且是伟大的思想家和伟大的革命家。鲁迅的骨头是最硬的，他没有丝毫的奴颜和媚骨，这是殖民地和半殖民地人民最可宝贵的性格。鲁迅是在文化战线上，代表全民族的大多数，向着敌人冲锋陷阵的最正确、最勇敢、最坚决、最忠诚、最热忱的空前的民族英雄。鲁迅的方向，就是中华新文化的方向。</span>', '0', '0', '20140108160859_724.jpg', '20', '0', '13.2', '陕西师范大学出版社', '2013-7-1', '1', '0', '38');
INSERT INTO `book` VALUES ('16', '沈从文', '边城', '<div id=\"authorintro\" class=\"section\" style=\"margin:0px 0px 10px;padding:0px;list-style-type:none;border:0px;color:#666666;font-family:SimSun, Arial;line-height:normal;white-space:normal;background-color:#FFFFFF;\">\r\n	<div class=\"tit\" style=\"margin:1px;padding:0px 0px 0px 17px;list-style-type:none;border:0px;background-color:#F5F5F5;font-weight:bold;height:31px;line-height:31px;color:#404040;\">\r\n		作者简介\r\n	</div>\r\n	<div class=\"descrip\" style=\"margin:0px;padding:16px 22px 6px;list-style-type:none;border:0px;line-height:21px;\">\r\n		<span id=\"authorintro_all\">\r\n		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;list-style-type:none;border:0px;\">\r\n			　　沈从文，湘西凤凰县人．原名沈岳焕，京派小说代表人物。1923年开始用“休芸芸”这一笔名进行创作。三十年代起开始用小说构造他心中的“湘西世界”，完成一系列代表作。一生创作的结集约有80多部．是现代作家中成书最多的一个。主要著作有：小说《龙朱》、《旅店及其它》、《石子船》、《月下小景》、《边城》、《长河》，散文《从文自传》、《记丁玲》、《湘行散记》、《湘西》，文论《废邮存底》及续集、《烛虚》、《云南看云集》等\r\n		</p>\r\n</span>\r\n	</div>\r\n</div>\r\n<div id=\"catalog\" class=\"section\" style=\"margin:0px 0px 10px;padding:0px;list-style-type:none;border:0px;color:#666666;font-family:SimSun, Arial;line-height:normal;white-space:normal;background-color:#FFFFFF;\">\r\n	<div class=\"tit\" style=\"margin:1px;padding:0px 0px 0px 17px;list-style-type:none;border:0px;background-color:#F5F5F5;font-weight:bold;height:31px;line-height:31px;color:#404040;\">\r\n		<a id=\"catalog_icon\" class=\"icon icon_down\" style=\"color:#1A66B3;background-image:url(http://product.dangdang.com/images/sprite.png);display:inline-block;vertical-align:middle;outline:0px;float:right;height:11px;margin:10px 20px 0px 0px;width:9px;background-position:-142px -25px;background-repeat:no-repeat no-repeat;\"></a>目录\r\n	</div>\r\n	<div class=\"descrip\" style=\"margin:0px;padding:16px 22px 6px;list-style-type:none;border:0px;line-height:21px;\">\r\n		<span id=\"catalog_show\">小说<br />\r\n柏子<br />\r\n边城<br />\r\n萧萧<br />\r\n丈夫<br />\r\n三三<br />\r\n散文<br />\r\n一个戴水獭皮帽子的朋友<br />\r\n桃源与沅州<br />\r\n鸭窠围的夜<br />\r\n箱子岩<br />\r\n常德的船<br />\r\n沅陵的人<br />\r\n凤凰<br />\r\n我读一本小书同时又读一本大书</span>\r\n	</div>\r\n</div>', '0', '0', '20140108161053_631.jpg', '20', '0', '7.5', '北京燕山出版社', '2011-2-1', '1', '0', '38');
INSERT INTO `book` VALUES ('17', '沈从文', '中国古代服饰研', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">一、“中华现代学术名著丛书”收录晚清以迄20世纪80年代末，为中华学人所著，成就斐然、泽被学林之学术著作。入选著作以名著为主，酌量选录名篇合集。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">　&nbsp;二、入选著作内容、编次一仍其旧，唯各书卷首冠以作者照片、手迹等。卷末附作者学术年表和题解文章，诚邀专家学者撰写而成，意在介绍作者学术成就，著作成书背景、学术价值及版本流变等情况。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">&nbsp;&nbsp;&nbsp;三、人选著作率以原刊或作者修订、校阅本为底本，参校他本，正其讹误。前人引书，时有省略更改，倘不失原意，则不以原书文字改动引文；如确需校改，则出脚注说明版本依据，以“编者注”或“校者注”形式说明。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">&nbsp;&nbsp;&nbsp;四、作者自有其文字风格，各时代均有其语言习惯，故不按现行用法、写法及表现手法改动原文；原书专名(人名、地名、术语)及译名与今不统一者，亦不作改动。如确系作者笔误、排印舛误、数据计算与外文拼写错误等，则予径改。&nbsp;&nbsp;&nbsp;‘</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">&nbsp;&nbsp;&nbsp;五、原书为直(横)排繁体者，除个别特殊情况，均改作横排简体。其中原书无标点或仅有简单断句者，一律改为新式标点，专名号从略。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">&nbsp;&nbsp;&nbsp;六、除特殊情况外，原书篇后注移作脚注，双行夹注改为单行夹注。文献著录则从其原貌，稍加统一。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">&nbsp;&nbsp;&nbsp;七、原书因年代久远而字迹模糊或纸页残缺者，据所缺字数用“口”表示；字数难以确定者，则用“(下缺)”表示。</span>', '0', '0', '20140108161228_338.jpg', '20', '0', '81.9', '商务印书馆', '2011-12-1', '0', '0', '39');
INSERT INTO `book` VALUES ('18', '沈从文', '从文自传', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">《人文读与收藏·良友文学丛书：从文自传》于1932年暑假，沈从文在青岛完成，1936年由上海良友图书印刷公司出版。本书是沈从文的一部散文体自传，包括《我所生长的地方》、《我的家庭》、《我读一本小书同时又读一本大书》、《辛亥革命的一课》、《我上许多课仍然不放下那一本大书》、《预备兵的技术班》、《辰州》、《常德》、《一个大王》、《一个转机》等篇目。本书讲述了沈从文年轻时的湘西成长经历，记录了作者天真好奇的童年时代，胸怀抱负却经历坎坷的青年时代，最终选择走上文学创作的道路。沈从文曾谈到《从文自传》的写作：就个人记忆到的写下去，既可温习一下个人生命发展过程，也可让读者明白我是在怎样环境下活过来的一个人。特别是在生活陷于完全绝望中，还能充满勇气和信心始终坚持工作。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">&nbsp;&nbsp;&nbsp;&nbsp;《人文读与收藏·良友文学丛书：从文自传》并不单单只是对过去经历的一种追忆，更是对作者自我生命的反思与觉醒，在困惑、迷茫中寻找通往未来的希望之路，从而使自己得到蜕变和成长。&nbsp;</span>', '0', '0', '20140108161359_537.jpg', '20', '0', '23', '中国国际广播出版社', '2013-1-1', '0', '0', '40');
INSERT INTO `book` VALUES ('19', '汪曾祺', '汪曾祺集', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">《汪曾祺集》是一部中国当代文学大家汪曾祺作品的精美选本。该选本由北大学者倾力锤炼、打造，选目精当，选本权威。文集共分四本，《邂逅》、《受戒》为汪氏小说选本，《一辈古人》、《彩云聚散》为散文选本，装帧极其精致，是广大文学爱好者不可多得的收藏本。</span>', '0', '0', '20140108161928_809.jpg', '20', '0', '21.6', '北京十月文艺出版社', '2012-6-1', '0', '0', '1');
INSERT INTO `book` VALUES ('20', '汪曾祺 ', '大淖记事', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">本书收入了著名作家汪曾祺创作于1980年代之后的中短篇小说代表作共5篇，包括《大淖记事》、《受戒》、《陈小手》等。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">《大淖记事》和《受戒》均是以20世纪30年代作者苏北故乡为背景的乡土小说，前者讲述小锡匠十一子同挑夫的女儿巧云的爱情故事，后者描写一个小和尚和一个叫小英子的小姑娘的初恋。小说以散文的笔调，极富诗情地展现了苏北乡村的田园风光和人情风俗，在浑朴自然、清淡委婉之中，满溢和谐的意趣。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">汪曾祺自称是“一个中国式的抒情的人道者”。他笔下那些带有民俗风情的小说，撇开了政治生活的宏伟叙事，把一种久违的民族文化传统注入当代中国，对新时期小说的影响十分深远。</span>', '0', '0', '20140108162055_718.jpg', '20', '0', '7.2', '花城出版社', '2010-3-1', '0', '0', '1');
INSERT INTO `book` VALUES ('21', '张爱玲', '倾城之恋', '<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;list-style-type:none;border:0px;color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">\r\n	本书收录张爱玲于一九四三年至一九四四年创作的中短篇小说，包括《第一炉香》《第二炉香》《茉莉香片》《心经》《封锁》《倾城之恋》《琉璃瓦》《金锁记》《连环套》。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;list-style-type:none;border:0px;color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">\r\n	　　“传奇里的倾国倾城的人大抵如此。<br />\r\n　　到处都是传奇，可不见得有这么圆满的收场。胡琴咿咿哑哑拉着，在万盏灯的夜晚，拉过来又拉过去，说不尽的苍凉的故事——不问也罢！”\r\n</p>', '0', '0', '20140108162422_327.jpg', '20', '0', '21.7', '北京十月文艺出版社', '2012-6-1', '0', '0', '6');
INSERT INTO `book` VALUES ('22', '张爱玲', '红玫瑰与白玫瑰', '<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;list-style-type:none;border:0px;color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">\r\n	本书收录张爱玲于一九四四年至一九四七年创作的中短篇小说，包括《年轻的时候》《花凋》《鸿鸾禧》《红玫瑰与白玫瑰》《散戏》《殷宝滟送花楼会》《桂花蒸阿小悲秋》《等》《留情》《创世纪》《郁金香》《多少恨》。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;list-style-type:none;border:0px;color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">\r\n	　　也许每一个男子全都有过这样的两个女人，至少两个。娶了红玫瑰，久而久之，红的变了墙上的一抹蚊子血，白的还是“床前明月光”；娶了白玫瑰，白的便是衣服上沾的一粒饭黏子，红的却是心口上一颗朱砂痣。\r\n</p>', '0', '0', '20140108162558_682.jpg', '20', '0', '20.9', '北京十月文艺出版社', '2012-6-1', '0', '0', '6');
INSERT INTO `book` VALUES ('23', '张爱玲', '半生缘', '<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;list-style-type:none;border:0px;color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">\r\n	本书收录张爱玲的第一部长篇小说。初载一九五○年四月二十五日至一九五一年二月十一日《亦报》，题《十八春》，一九五一年十一月上海亦报社出版单行本；经张爱玲改写后，以《惘然记》为题连载于一九六七年二月至七月《皇冠》月刊，一九六九年七月皇冠出版社出版单行本，改名《半生缘》。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;list-style-type:none;border:0px;color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">\r\n	　　也许爱不是热情，也不是怀念，不过是岁月，年深月久成了生活的一部份。<br />\r\n　　我要你知道，这世界上有一个人是永远等着你的，不管是什么时候，不管在什么地方，反正你知道，总有这么个人。<br />\r\n　　我们回不去了。\r\n</p>', '0', '0', '20140108162729_518.jpg', '20', '0', '21.7', '北京十月文艺出版社', '2012-6-1', '0', '0', '6');
INSERT INTO `book` VALUES ('24', '张爱玲', '小团圆', '<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;list-style-type:none;border:0px;color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">\r\n	本书据张爱玲手稿整理出版。原稿共六二八页，一九七六年完成后，张爱玲寄给香港的好友宋淇邝文美夫妇，后因各方原因未能发表；二○○九年二月，经张爱玲遗产执行人宋以朗授权，皇冠出版社首次出版单行本。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;list-style-type:none;border:0px;color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">\r\n	　　过三十岁生日那天，夜里在床上看见洋台上的月光，水泥阑干像倒塌了的石碑横卧在那里，浴在晚唐的蓝色的月光中。一千多年前的月色，但是在她三十年已经太多了，墓碑一样沉重的压在心上。\r\n</p>', '0', '0', '20140108162849_480.jpg', '20', '0', '17.7', '北京十月文艺出版社', '2012-6-1', '0', '0', '6');
INSERT INTO `book` VALUES ('25', '张爱玲', '红楼梦魇', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">张爱玲于1969年在台湾发表《红楼梦未完》；1973年《初详红楼梦》刊载于台湾杂志；1975年完成英译《海上花列传》，《二详红楼梦》在台湾发表；1976年《三详红楼梦》在台湾发表；后通篇改写《三详》，此外一路写下去，1977年由台湾皇冠出版社出版《红楼梦魇》。</span>', '0', '0', '20140108163001_649.jpg', '20', '0', '21.9', '北京十月文艺出版社', '2012-7-1', '0', '0', '6');
INSERT INTO `book` VALUES ('26', '余华', '活着', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">《活着》是一部充满血泪的小说。余华通过一位中国农民的苦难生活讲述了人如何去承受巨大的苦难；讲述了眼泪的丰富和宽广；讲述了绝望的不存在：讲述了人是为了活着本身而活着……《活着》这部小说荣获意大利格林扎纳·卡佛文学奖最高奖项(1998年)，台湾《中国时报》10本好书奖(1994年)，香港“博益”15本好书奖(1990年)；并入选香港《亚洲周刊》评选的“20世纪中文小说百年百强”；入选中国百位批评家和文学编辑评选的“九十年代最有影响的10部作品 ”。</span>', '0', '0', '20140108163709_328.jpg', '20', '0', '12', '作家出版社', '2012-8-1', '0', '0', '6');
INSERT INTO `book` VALUES ('27', '东野圭吾', '白夜行', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">多年以前，大阪的一栋废弃建筑中发现一名遭利器刺死的男子。案件扑朔迷离，始终悬而未决。此后20年间，案件滋生出的恶逐渐萌芽生长，绽放出恶之花。案件相关者的人生逐渐被越来越重的阴影笼罩……</span>', '0', '0', '20140108163915_951.jpg', '20', '0', '28.5', '南海出版社', '2013-1-1', '0', '0', '9');
INSERT INTO `book` VALUES ('28', '东野圭吾', '幻夜', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">地震之后，宛如人间炼狱的断壁残垣中，水原雅也借机杀了舅舅，却被自称新海美冬的神秘女人目击。女人答应为水原终生保守秘密。他们相偕前往东京，然而等待他们的，却是从此再无一丝太阳的无边幻夜：凡是接近过她的人，都莫名消失；凡是触碰过她过去的人，都不知所踪。</span>', '0', '0', '20140108164046_135.jpg', '20', '0', '29', '南海出版社', '2013-10-1', '0', '0', '9');
INSERT INTO `book` VALUES ('29', '村上春树', '挪威的森林', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">这是一部动人心弦的、平缓舒雅的、略带感伤的、百分之百的恋爱小说。小说主人公渡边以第一人称展开他同两个女孩间的爱情纠葛。渡边的第一个恋人直子原是他高中要好同学木月的女友，后来木月自杀了。一年后渡边同直子不期而遇并开始交往。此时的直子已变得娴静腼腆，美丽晶莹的眸子里不时掠过一丝难以捕捉的阴翳。两人只是日复一日地在落叶飘零的东京街头漫无目标地或前或后或并肩行走不止。直子20岁生日的晚上两人发生了性关系，不料第二天直子便不知去向。几个月后直子来信说她住进一家远在深山里的精神疗养院。渡边前去探望时发现直子开始带有成熟女性的丰腴与娇美。晚间两人虽同处一室，但渡边约束了自己，分手前表示永远等待直子。返校不久，由于一次偶然相遇，渡边开始与低年级的绿子交往。绿子同内向的直子截然相反，“简直就像迎着春天的晨光蹦跳到世界上来的一头小鹿”。这期间，渡边内心十分苦闷彷徨。一方面念念不忘直子缠绵的病情与柔情，一方面又难以抗拒绿子大胆的表白和迷人的活力。不久传来直子自杀的噩耗，渡边失魂魄地四处徒步旅行。最后，在直子同房病友玲子的鼓励下，开始摸索此后的人生。</span>', '0', '0', '20140108164217_714.jpg', '20', '0', '19.1', '上海译文出版社', '2007-7-1', '0', '0', '9');
INSERT INTO `book` VALUES ('30', '村上春树', '国境以南 太阳以西', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">37岁的男主人公，在东京市区拥有两家兴旺的酒吧，还有娇美的妻子，可爱的女儿，他是一位真正的成功人士。但是，他的内心还是感到饥饿干渴，事业和家庭都填补不了，而让他那缺憾的部分充盈起来的，是他小学时的女友岛本。岛本不愿吐露自己的经历、身份、只希望他就这样接受眼前的自己，只把她当成小学时那个爱古典乐的女孩。然而，就在他接受了这不可能接受的条件时，两人却在箱根别墅度过了销魂的一夜。翌晨，她一去杳然、再无踪迹可寻了。</span>', '0', '0', '20140108164333_348.jpg', '20', '0', '11.7', '上海译文出版社', '2007-7-1', '0', '0', '9');
INSERT INTO `book` VALUES ('31', '村上春树', '海边的卡夫卡', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">主人公田村卡夫卡君不是随处可见的普通的十五岁少年。他幼年时被母亲抛弃，又被父亲诅咒，他决心“成为世界上最顽强的十五岁少年”。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">　　他沉浸在深深的孤独中，默默锻炼身体，辍学离家，一个人奔赴陌生的远方。无论怎么看——在日本也好，或许在中国也好——都很难说是平均线上的十五岁少年形象。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">《海边的卡夫卡》的主人公是一位自称名叫田村卡夫卡——小说始终未交代其真名——的少年。他在十五岁生日前夜独自离家出走，乘坐夜行长途巴士远赴四国。出走的原因是为了逃避父亲所作的比俄底浦斯王还要可怕的预言：尔将弑父，将与尔母、尔姐交合。卡夫卡四岁时，母亲突然失踪，带走了比卡夫卡年长四岁、其实是田村家养女的姐姐，不知何故却将亲生儿子抛弃。他从未见过母亲的照片，甚至连名字也不知道。仿佛是运命在冥冥之中引导，他偶然来到某私立图书馆，遂栖身于此。馆长佐伯女士是位四十多岁气质高雅的美妇，有着波澜曲折的神秘身世。卡夫卡疑心她是自己的生母，佐伯却对此不置可否。卡夫卡恋上了佐伯，并与之发生肉体关系。小说还另设一条副线，副线的主角是老人中田，他在二战期间读小学时，经历过一次神秘的昏迷事件，从此丧失了记忆，将学过的知识完全忘记，甚至不会认字计数，却获得了与猫对话的神秘能力。中田在神智失控的情况下杀死了一个自称焦尼·沃卡（JohnnyWalker）、打扮得酷似那著名威士忌酒商标上所画的英国绅士的狂人，一路搭车也来到此地。小说共分49章，奇数章基本上用写实手法讲述卡夫卡的故事，偶数章则用魔幻手法展现中田的奇遇。两种手法交互使用，编织出极富强烈虚构色彩的、奇幻诡诘的现代寓言。佐伯是将这两个故事联结为一体的结合点，而弑父的预言似乎最终也未能避免，因为狂人焦尼·沃卡居然是卡夫卡生父乔装改扮的，真正的凶手也并非中田……</span>', '0', '0', '20140108164753_205.jpg', '20', '0', '21.3', '上海译文出版社', '2007-7-1', '0', '0', '9');
INSERT INTO `book` VALUES ('32', '村上春树', '去中国的小船', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">在日本当代作家中，村上春树的确是个不同凡响的存在，一颗文学奇星。短短十几年时间里，他的作品便风行东瀛列岛。本书是他的又一力作。书中故事有去中国的小船、穷婶母的故事、纽约煤矿的悲剧、袋鼠通讯、下午最后的草坪、她的埋在土中的小狗等。&nbsp;</span>', '0', '0', '20140108165524_674.jpg', '20', '0', '12.6', '上海译文出版社', '2008-7-1', '0', '0', '9');
INSERT INTO `book` VALUES ('33', '（奥）茨威格', '一个陌生女人的来信', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">《一个陌生女人的来信》讲述的是一个陌生的女人，在她生命的最后时刻，饱蘸一生的痴情，写下了一封凄婉动人的长信，向一位著名的作家袒露了自己绝望的爱慕之情。小说以一名女子最痛苦的经历，写出了爱的深沉与奉献。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">　　一个男子在41岁生日当天收到一封没有署名和地址的信，这封信出自一个临死的女人，讲述了一段刻骨铭心的爱情故事，而这个故事的男主人公也就是收信的男人对此一无所知。这段一厢情愿的爱情始自18年前，她初遇男人的刹那，她还是个孩子，而后经历了少女的痴迷、青春的激情，甚而流落风尘，但未曾改变对男人的爱，直至临死前才决定告白——她躺在凄凉的命运的甲板上，雪白的泡沫把她推向了虚无……</span>', '0', '0', '20140108165751_512.jpg', '20', '0', '16', '北京燕山出版社', '2013-10-1', '0', '0', '3');
INSERT INTO `book` VALUES ('34', '钟立风', '像艳遇一样忧伤', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">　新民谣代表人物钟立风的精选文字集。包含断想篇、随想篇、访谈篇、电影的记忆、小说时间等几个部分。中国民谣代表人物周云蓬、知名乐评人李皖为其作序。作品用诗意的语言表达纷纷的情感和情绪，如流动的音乐。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">　　配合本书，作者从未发布过的单曲《像艳遇一样忧伤》，在网上同期发布，可供网友免费下载试听。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">　　文字本身很有特色，其中，断想篇很有些泰戈尔、纪伯伦哲理小诗的气息，是其平时灵光一现一闪念的会合。小说则充满了隐喻的意象和寓言。正如李皖所说，书中充满了随想、闪念、幻想、奇遇、离题、浅睡；奔跑、冲刺、跳跃、撒欢、飞翔、迷路、遗忘；短得像三分钟的凉水澡，洁净、精微、禅意，考验你的智力和趣味……不易读却奇魅隽永，像博尔赫斯一样，闪亮的、发光的、西班牙的，一个迷宫，一副散乱的纸牌，一座小径分叉的花园。理解止于理解的发端，让你放下书，发呆，思想游走到更远的远方。</span>', '0', '0', '20140108170907_334.jpg', '20', '0', '22.4', '广西师范大学出版社', '2011-4-1', '0', '0', '1');
INSERT INTO `book` VALUES ('35', '未知', 'Java编程思想', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">本书赢得了全球程序员的广泛赞誉，即使是最晦涩的概念，在BruceEckel的文字亲和力和小而直接的编程示例面前也会化解于无形。从Java的基础语法到最高级特性（深入的面向对象概念、多线程、自动项目构建、单元测试和调试等），本书都能逐步指导你轻松掌握。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">从本书获得的各项大奖以及来自世界各地的读者评论中，不难看出这是一本经典之作。本书的作者拥有多年教学经验，对C、C++以及Java语言都有独到、深入的见解，以通俗易懂及小而直接的示例解释了一个个晦涩抽象的概念。本书共22章，包括操作符、控制执行流程、访问权限控制、复用类、多态、接口、通过异常处理错误、字符串、泛型、数组、容器深入研究、JavaI/O系统、枚举类型、并发以及图形化用户界面等内容。这些丰富的内容，包含了Java语言基础语法以及高级特性，适合各个层次的Java程序员阅读，同时也是高等院校讲授面向对象程序设计语言以及Java语言的绝佳教材和参考书。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">第4版特点：</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">适合初学者与专业人员的经典的面向对象叙述方式，为更新的Java SE5/6增加了新的示例和章节。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">? 测验框架显示程序输出。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">?设计模式贯穿于众多示例中：适配器、桥接器、职责链、命令、装饰器、外观、工厂方法、享元、点名、数据传输对象、空对象、代理、单例、状态、策略、模板方法以及访问者。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">? 为数据传输引入了XML，为用户界面引入了SWT和Flash。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">? 重新撰写了有关并发的章节，有助于读者掌握线程的相关知识。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">? 专门为第4版以及Java SE5/6重写了700多个编译文件中的500多个程序。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">? 支持网站包含了所有源代码、带注解的解决方案指南、网络日志以及多媒体学习资料。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">? 覆盖了所有基础知识，同时论述了高级特性。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">? 详细地阐述了面向对象原理。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">? 在线可获得Java讲座CD，其中包含Bruce Eckel的全部多媒体讲座。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">在www.MindView.net网站上可以观看现场讲座、咨询和评论。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">专门为第4版以及Java SE5/6重写了700多个编译文件中的500多个程序。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">支持网站包含了所有源代码、带注解的解决方案指南、网络日志以及多媒体学习资料。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">覆盖了所有基础知识，同时论述了高级特性。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">详细地阐述了面向对象原理。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">在线可获得Java讲座CD，其中包含Bruce Eckel的全部多媒体讲座。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">在www.MindView.net网站上可以观看现场讲座、咨询和评论。</span>', '0', '0', '20140108171233_260.jpg', '20', '0', '73.9', '机械工业出版社', '2007-6-1', '0', '0', '21');
INSERT INTO `book` VALUES ('36', '高洪岩', 'Java EE实用开发指南', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">《JavaEE实用开发指南:基于Weblogic+EJB3+Struts2+Hibernate+Spring》：将大的软件功能一一分解成小部分，让读者消化吸收更快速！对知识点以开发的顺序进行讲解，读者跟着书的节奏可收到边学习边养成编程习惯的效果！每个技术点均以一个完整的实用技术案例进行解析，具有完整的可运行的代码项目，而并非仅仅一段片面的示例代码，让读者要看就看明白。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">《JavaEE实用开发指南:基于Weblogic+EJB3+Struts2+Hibernate+Spring》特点:</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">(1)以重量级开发技术Weblogic10.3+EJB3整合开发为引入点。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">(2)详细讲解EJB3+JPA的联合开发使用。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">(3)通过Struts2+Hibernate+Spring结合MyEclipse进行开发。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">(4)详细的ONGL语言介绍。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">(5)详细的案例教程。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">(6)详细的Struts2标签库的用法介绍。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">(7)详细的Hibernate双向一对多的解决方案介绍。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">(8)基于注解式的SSH2事务整合方案。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">(9)以实例代码为主，所以没有类似Http协议相关理论知识的介绍。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">(10)以“垂直”知识点为主，使读者更容易接受知识，学习效果明显。</span>', '0', '0', '20140108171548_66.jpg', '20', '0', '55.1', '化学工业出版社', '2011-8-1', '0', '0', '21');
INSERT INTO `book` VALUES ('37', '（美）比兹利', 'Python参考手册', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">本书是python 编程语言的权威参考指南，书中详尽解释了python 核心语言和python 库中最重要的部分，涉及类型和对象、操作符和表达式、编程结构和控制流、输入和输出、测试、调试等，也包括一些python官方文档或其他参考资料中未提及的高级主题。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">　　本书面向python 程序员，或有其他编程语言经验的开发人员。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">　　本书是权威的python语言参考指南，内容涉及核心python语言和python库的最重要部分。本书内容简洁扼要、可读性强，书中还包括了一些没有在python官方文档或其他资料中出现过的一些高级的主题。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">　　这一版在内容上进行了全面更新，介绍了python 2．6和python 3新引入的编程语言特性和库模块，同时还分析了python程序员面临的如下难题：是应继续使用现有的python代码，还是应制定计划将其移植到python 3？&nbsp;</span>', '0', '0', '20140108171721_683.jpg', '20', '0', '61.4', '人民邮电出版社', '2011-1-1', '0', '0', '23');
INSERT INTO `book` VALUES ('40', '[美]Alex Martelli', 'Python Cookbook', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">本书介绍了Python应用在各个领域中的一些使用技巧和方法，从最基本的字符、文件序列、字典和排序，到进阶的面向对象编程、数据库和数据持久化、XML处理和Web编程，再到比较高级和抽象的描述符、装饰器、元类、迭代器和生成器，均有涉及。书中还介绍了一些第三方包和库的使用，包括Twisted、GIL、PyWin32等。本书覆盖了Python应用中的很多常见问题，并提出了通用的解决方案。书中的代码和方法具有很强的实用性，可以方便地应用到实际的项目中，并产生立竿见影的效果。尤为难得的是，本书的各位作者都具有丰富的业界实践经验，因此，本书不仅给出了对各种问题的解决方案，同时还体现了很多专家的思维方式和良好的编程习惯，与具体的细节性知识相比，这部分内容无疑是本书的精华。　　本书适合具有一定Python基础的读者阅读参考。</span>', '0', '0', '20140108172001_6.jpg', '20', '0', '68.3', '人民邮电出版社', '2010-5-1', '0', '0', '23');
INSERT INTO `book` VALUES ('41', '吴亚峰', 'Android核心技术与实例详解', '<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">本书以Android应用程序的开发为主题，并结合真实的案例向读者详细介绍了Android的基本组件的使用及应用程序开发的整个流程。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">全书分为三篇共18章，第一篇以简单易懂的实例为依托，详细介绍了Android平台的基本控件、高级控件、常用界面布局及菜单对话框等相关知识；第二篇介绍了Android平台的高级知识，包括消息与广播服务、网络数据处理、手机通信功能、桌面组件、多媒体采集、Google服务及3D程序开发等；第三篇则对三个真实案例的开发步骤进行详细介绍，逐步向读者讲解Android手机应用程序的真实开发过程，同时在源代码中还包含了详细的注释，以尽量帮助读者掌握代码中的每一个细节，尽快掌握Android编程。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">本书的讲述由浅入深，从介绍Android平台的基本组件到带领读者开发大型应用程序，结构清晰、语言简洁，非常适合初学者和进阶开发者阅读参考。</span><br style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:SimSun, Arial;line-height:21px;white-space:normal;background-color:#FFFFFF;\">本书附赠DVD光盘1张，其中包含了大容量的手把手教学视频、电子教案(PPT)、实例源代码等。</span>', '0', '0', '20140108172238_740.jpg', '20', '0', '47.6', '电子工业出版社', '2010-10-1', '0', '0', '41');
INSERT INTO `book` VALUES ('43', '高继民', 'Oracle 数据库', '<div id=\"content\" class=\"section\" style=\"margin:0px 0px 10px;padding:0px;list-style-type:none;border:0px;color:#666666;font-family:SimSun, Arial;line-height:normal;white-space:normal;background-color:#FFFFFF;\">\r\n	<div class=\"descrip\" style=\"margin:0px;padding:16px 22px 6px;list-style-type:none;border:0px;line-height:21px;\">\r\n		<span id=\"content_all\">本书以通俗易懂、浅显精炼的方式介绍了Oracle 9i数据库SQL和程序设计语言PL/SQL的有关内容，这些内容是进行Oracle数据库系统管理和开发的必修内容，也是学习大型数据库的基础。本书的主要内容包括：SQL*Plus环境的使用，SQL的语法及应用，程序设计语言PL/SQL的语法和错误处理，以及游标、存储过程、函数、包和触发器等数据库程序开发技术。本书所编写的理论知识以够用为度，通过大量精选的实例、训练项目和阶段训练来培养学生的基本技能，引导学生循序渐进地学习Oracle数据库，并通过综合训练项目使学生对所学知识融会贯通。&nbsp;<br />\r\n　　本书的编写适应了职业教育的需要，充分考虑了职业教育的特点，适合于职业技术院校、专科院校用作教材，也适合于一般的Oracle数据库的初学者使用或用作Oracle技术认证的参考资料。相信通过本书的学习，能够为读者进一步学习Oracle数据库打下良好的基础。</span> \r\n	</div>\r\n</div>\r\n<div id=\"catalog\" class=\"section\" style=\"margin:0px 0px 10px;padding:0px;list-style-type:none;border:0px;color:#666666;font-family:SimSun, Arial;line-height:normal;white-space:normal;background-color:#FFFFFF;\">\r\n	<div class=\"tit\" style=\"margin:1px;padding:0px 0px 0px 17px;list-style-type:none;border:0px;background-color:#F5F5F5;font-weight:bold;height:31px;line-height:31px;color:#404040;\">\r\n		<a id=\"catalog_icon\" class=\"icon icon_down\" style=\"color:#1A66B3;background-image:url(http://product.dangdang.com/images/sprite.png);display:inline-block;vertical-align:middle;outline:0px;float:right;height:11px;margin:10px 20px 0px 0px;width:9px;background-position:-142px -25px;background-repeat:no-repeat no-repeat;\"></a>目录\r\n	</div>\r\n	<div class=\"descrip\" style=\"margin:0px;padding:16px 22px 6px;list-style-type:none;border:0px;line-height:21px;\">\r\n		<span id=\"catalog_show\">第1章 关系数据库与SQL语言环境&nbsp;<br />\r\n　1.1 关系数据库的基本概念&nbsp;<br />\r\n　　1.1.1 数据库和数据库管理系统&nbsp;<br />\r\n　　1.1.2 实体关系模型&nbsp;<br />\r\n　　1.1.3 规范化设计&nbsp;<br />\r\n　　1.1.4 物理设计&nbsp;<br />\r\n　　1.1.5 开发数据库应用系统的步骤&nbsp;<br />\r\n　1.2 SQL*Plus环境&nbsp;<br />\r\n　　1.2.1 SQL*Plus的登录和环境设置&nbsp;<br />\r\n　　1.2.2 认识表的结构&nbsp;<br />\r\n　　1.2.3 显示表的内容&nbsp;<br />\r\n　　1.2.4 SQL*Plus环境的使用&nbsp;<br />\r\n　1.3 Oracle的应用开发工具TOAD&nbsp;<br />\r\n　1.4 操作准备&nbsp;<br />\r\n　1.5 阶段训练</span> \r\n	</div>\r\n</div>', '0', '0', '20140108172453_671.jpg', '20', '0', '15.1', '西安电子科技大学出版社', '2004-6-1', '0', '0', '19');
INSERT INTO `book` VALUES ('44', '（美）拉瑟斯', '心理学', '<div id=\"content\" class=\"section\" style=\"margin:0px 0px 10px;padding:0px;list-style-type:none;border:0px;color:#666666;\">\r\n	<div class=\"tit\" style=\"margin:1px;padding:0px 0px 0px 17px;list-style-type:none;border:0px;background-color:#F5F5F5;font-weight:bold;height:31px;line-height:31px;color:#404040;\">\r\n		内容推荐\r\n	</div>\r\n	<div class=\"descrip\" style=\"margin:0px;padding:16px 22px 6px;list-style-type:none;border:0px;line-height:21px;\">\r\n		<span id=\"content_all\">\r\n		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;list-style-type:none;border:0px;\">\r\n			&nbsp;&nbsp;&nbsp;本书语言轻松活泼，概念准确，引用了心理学研究的最新成果，纵向上穿插了大量心理学发展历史上的逸闻趣事，横向上跨越身、心、灵三大心理学领域，集科学性、系统性、可读性于一体，在众多心理学入门教材中脱颖而出。本书既可选作心理学专业本科生教材，也可作为广大心理学爱好者系统掌握心理学进展、开阔视野的备选读物。\r\n		</p>\r\n</span>\r\n	</div>\r\n</div>\r\n<div id=\"catalog\" class=\"section\" style=\"margin:0px 0px 10px;padding:0px;list-style-type:none;border:0px;color:#666666;\">\r\n	<div class=\"tit\" style=\"margin:1px;padding:0px 0px 0px 17px;list-style-type:none;border:0px;background-color:#F5F5F5;font-weight:bold;height:31px;line-height:31px;color:#404040;\">\r\n		<a id=\"catalog_icon\" class=\"icon icon_down\" style=\"color:#1A66B3;background-image:url(http://product.dangdang.com/images/sprite.png);display:inline-block;vertical-align:middle;outline:0px;float:right;height:11px;margin:10px 20px 0px 0px;width:9px;background-position:-142px -25px;background-repeat:no-repeat no-repeat;\"></a>目录\r\n	</div>\r\n	<div class=\"descrip\" style=\"margin:0px;padding:16px 22px 6px;list-style-type:none;border:0px;line-height:21px;\">\r\n		<span id=\"catalog_show\" style=\"font-family:SimSun, Arial;white-space:normal;background-color:#FFFFFF;\">第一章　什么是心理学<br />\r\n第二章　生理与心理<br />\r\n第三章　生命的旅程<br />\r\n第四章　感觉与知觉<br />\r\n第五章　意识<br />\r\n第六章　学习<br />\r\n第七章　记忆<br />\r\n第八章　思维、语言和智力<br />\r\n第九章　动机与情绪<br />\r\n第十章　压力、健康与调节<br />\r\n第十一章　人格：理论与测量<br />\r\n第十二章　心理障碍<br />\r\n第十三章　心事疗法<br />\r\n第十四章　社会心理学<br />\r\n附录　统计</span><span style=\"font-family:SimSun, Arial;white-space:normal;background-color:#FFFFFF;\"></span><span style=\"font-family:SimSun, Arial;white-space:normal;background-color:#FFFFFF;\"></span><span style=\"font-family:SimSun, Arial;white-space:normal;background-color:#FFFFFF;\"></span>\r\n	</div>\r\n	<div>\r\n		<span style=\"font-family:SimSun, Arial;white-space:normal;background-color:#FFFFFF;\"><br />\r\n</span>\r\n	</div>\r\n</div>', '0', '0', '20140108172739_989.jpg', '20', '0', '34.9', '中国人民大学出版社', '2012-1-1', '0', '0', '34');

-- ----------------------------
-- Table structure for `booktype`
-- ----------------------------
DROP TABLE IF EXISTS `booktype`;
CREATE TABLE `booktype` (
  `typeid` int(11) NOT NULL AUTO_INCREMENT,
  `btype` varchar(20) DEFAULT NULL,
  `stype` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of booktype
-- ----------------------------
INSERT INTO `booktype` VALUES ('1', '文学', '散文/随笔');
INSERT INTO `booktype` VALUES ('2', '文学', '中国文学');
INSERT INTO `booktype` VALUES ('3', '文学', '外国文学');
INSERT INTO `booktype` VALUES ('4', '文学', '作品集');
INSERT INTO `booktype` VALUES ('5', '文学', '儿童文学');
INSERT INTO `booktype` VALUES ('6', '小说', '中国当代小说');
INSERT INTO `booktype` VALUES ('7', '小说', '中国古典小说');
INSERT INTO `booktype` VALUES ('8', '小说', '网络小说');
INSERT INTO `booktype` VALUES ('9', '小说', '外国小说');
INSERT INTO `booktype` VALUES ('10', '小说', '世界名著');
INSERT INTO `booktype` VALUES ('11', '小说', '乡土');
INSERT INTO `booktype` VALUES ('12', '小说', '科幻');
INSERT INTO `booktype` VALUES ('13', '青春文学', '校园');
INSERT INTO `booktype` VALUES ('14', '青春文学', '爱情/情感');
INSERT INTO `booktype` VALUES ('15', '青春文学', '叛逆/成长');
INSERT INTO `booktype` VALUES ('16', '青春文学', '娱乐/偶像');
INSERT INTO `booktype` VALUES ('17', '青春文学', '韩国青春文学');
INSERT INTO `booktype` VALUES ('18', '数据库', 'mysql');
INSERT INTO `booktype` VALUES ('19', '数据库', 'oracle');
INSERT INTO `booktype` VALUES ('20', '数据库', 'sql server');
INSERT INTO `booktype` VALUES ('21', '编程语言', 'Java');
INSERT INTO `booktype` VALUES ('22', '编程语言', 'C#');
INSERT INTO `booktype` VALUES ('23', '编程语言', 'Python');
INSERT INTO `booktype` VALUES ('24', '传记', '历史人物');
INSERT INTO `booktype` VALUES ('25', '传记', '经典传记');
INSERT INTO `booktype` VALUES ('26', '传记', '自传');
INSERT INTO `booktype` VALUES ('27', '艺术', '摄影');
INSERT INTO `booktype` VALUES ('28', '艺术', '设计');
INSERT INTO `booktype` VALUES ('29', '艺术', '绘画');
INSERT INTO `booktype` VALUES ('30', '艺术', '音乐');
INSERT INTO `booktype` VALUES ('31', '励志与成功', '经典著作');
INSERT INTO `booktype` VALUES ('32', '励志与成功', '心灵鸡汤');
INSERT INTO `booktype` VALUES ('33', '励志与成功', '演讲与口才');
INSERT INTO `booktype` VALUES ('34', '心理学', '大众心理学');
INSERT INTO `booktype` VALUES ('35', '心理学', '变态/病态心理学');
INSERT INTO `booktype` VALUES ('36', '心理学', '心理过程与心理状态');
INSERT INTO `booktype` VALUES ('38', '文学', '中国当代小说');
INSERT INTO `booktype` VALUES ('39', '历史', '文化考古');
INSERT INTO `booktype` VALUES ('40', '传记', '文学家');
INSERT INTO `booktype` VALUES ('41', '编程语言', 'android');

-- ----------------------------
-- Table structure for `collect_book`
-- ----------------------------
DROP TABLE IF EXISTS `collect_book`;
CREATE TABLE `collect_book` (
  `bid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`bid`,`uid`),
  KEY `FK60F1BCDECEE2A487` (`bid`),
  KEY `FK60F1BCDE6A78291A` (`uid`),
  CONSTRAINT `FK60F1BCDE6A78291A` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `FK60F1BCDECEE2A487` FOREIGN KEY (`bid`) REFERENCES `book` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect_book
-- ----------------------------
INSERT INTO `collect_book` VALUES ('2', '1');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `bdate` varchar(20) DEFAULT NULL,
  `content` varchar(250) NOT NULL,
  `pdate` varchar(20) DEFAULT NULL,
  `bid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `FK9BDE863FCEE2A487` (`bid`),
  KEY `FK9BDE863F6A78291A` (`uid`),
  CONSTRAINT `FK9BDE863F6A78291A` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `FK9BDE863FCEE2A487` FOREIGN KEY (`bid`) REFERENCES `book` (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '2014-1-8 19:44:47', '<span style=\"color:#003399;\">我的人生导师噢</span>', '2014-1-8 19:45:27', '2', '1');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `n_content` varchar(250) NOT NULL,
  `n_time` varchar(20) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '<span style=\"white-space:nowrap;\">这是由liaoyu开发的优优图书商城的后台系统</span><br />\n<span style=\"white-space:nowrap;\">联系我:liaoyu753@163.com</span><br />', '2014-1-8 14:41:49');

-- ----------------------------
-- Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) DEFAULT NULL,
  `product_name` varchar(20) DEFAULT NULL,
  `product_price` float DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FK60163F61578E2E79` (`order_id`),
  CONSTRAINT `FK60163F61578E2E79` FOREIGN KEY (`order_id`) REFERENCES `order_table` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('1', '2', '人生', '19.8', '2', '1');

-- ----------------------------
-- Table structure for `order_table`
-- ----------------------------
DROP TABLE IF EXISTS `order_table`;
CREATE TABLE `order_table` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` varchar(50) DEFAULT NULL,
  `deliver_fee` float DEFAULT NULL,
  `deliver_way` int(11) DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL,
  `order_status` int(11) DEFAULT NULL,
  `payablefee` float DEFAULT NULL,
  `payment_way` int(11) DEFAULT NULL,
  `product_price` float DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `address_id` int(11) NOT NULL,
  `buy_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK75A2F39D3BE7EFDB` (`address_id`),
  KEY `FK75A2F39D185A823E` (`buy_id`),
  CONSTRAINT `FK75A2F39D185A823E` FOREIGN KEY (`buy_id`) REFERENCES `user` (`uid`),
  CONSTRAINT `FK75A2F39D3BE7EFDB` FOREIGN KEY (`address_id`) REFERENCES `address` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_table
-- ----------------------------
INSERT INTO `order_table` VALUES ('1', '2014-1-8 19:44:47', '5', '0', '', '5', '44.6', '0', '39.6', '44.6', '1', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) NOT NULL,
  `message_count` int(11) DEFAULT NULL,
  `nickname` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `photo` varchar(30) DEFAULT NULL,
  `points_count` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'liaoyu753@163.com', '0', 'liaoyu753', '82f061637d40aac85f8522bf8aae5507', '20140108145305_148.jpg', '0', '0', 'MANAGER');
INSERT INTO `user` VALUES ('2', 'liaoyu@qq.com', '0', 'liaoyu', '1d0258c2440a8d19e716292b231e3190', 'default.jpg', '0', '0', 'GENERAL');
INSERT INTO `user` VALUES ('3', 'liaoyu@gmail.com', '0', 'liaoyu', 'b74ab688ae5df3c2dc06f0405f2e0a2f', 'default.jpg', '0', '0', 'GENERAL');
INSERT INTO `user` VALUES ('4', 'uvonne@gmail.com', '0', 'uvonne', '057ecaa954b74e8be9b573a046a0bad3', 'default.jpg', '0', '0', 'GENERAL');
