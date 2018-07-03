/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : wm_db

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-07-03 18:33:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ny_admin
-- ----------------------------
DROP TABLE IF EXISTS `ny_admin`;
CREATE TABLE `ny_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` char(60) NOT NULL,
  `email` varchar(255) NOT NULL,
  `login_count` int(10) DEFAULT NULL,
  `login_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ny_admin
-- ----------------------------
INSERT INTO `ny_admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '15217925142@sina.cn', '69', '0');

-- ----------------------------
-- Table structure for ny_banner
-- ----------------------------
DROP TABLE IF EXISTS `ny_banner`;
CREATE TABLE `ny_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `image` varchar(255) NOT NULL COMMENT '图片路径地址',
  `link` varchar(255) NOT NULL COMMENT '链接地址',
  `desc` varchar(255) NOT NULL COMMENT '图片描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ny_banner
-- ----------------------------
INSERT INTO `ny_banner` VALUES ('1', '20180621\\8371802d7ee097a08cecd3ff6c923713.jpg', 'www.nywebcom', '文明校园');
INSERT INTO `ny_banner` VALUES ('2', '20180521\\fb85a09fd776d5a80107b775519c32af.jpg', 'www.nyweb.com', '做文明学子');
INSERT INTO `ny_banner` VALUES ('3', '20180526\\73ca52e47c865762567cd614ad259ec6.jpg', 'www.nyweb.com', '文明校园');
INSERT INTO `ny_banner` VALUES ('4', '20180526\\0712d3344d33cf0843379bd779d45cb0.jpg', 'www.nyweb.com', '文明校园');
INSERT INTO `ny_banner` VALUES ('5', '20180526\\232ba86ab5327908dd893db68cb783aa.jpg', 'www.nyweb.com', '文明校园');

-- ----------------------------
-- Table structure for ny_category
-- ----------------------------
DROP TABLE IF EXISTS `ny_category`;
CREATE TABLE `ny_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cate_name` varchar(200) NOT NULL COMMENT '分类名称',
  `cate_order` int(4) NOT NULL DEFAULT '0' COMMENT '分类排序',
  `pid` int(11) NOT NULL COMMENT '父ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ny_category
-- ----------------------------
INSERT INTO `ny_category` VALUES ('1', '校委领导', '0', '0');
INSERT INTO `ny_category` VALUES ('2', '思想道德', '0', '1');
INSERT INTO `ny_category` VALUES ('3', '学院文化', '0', '2');
INSERT INTO `ny_category` VALUES ('4', '文明礼仪', '0', '3');
INSERT INTO `ny_category` VALUES ('5', '活动阵地', '0', '4');
INSERT INTO `ny_category` VALUES ('6', '学院环境', '0', '5');

-- ----------------------------
-- Table structure for ny_news
-- ----------------------------
DROP TABLE IF EXISTS `ny_news`;
CREATE TABLE `ny_news` (
  `news_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '新闻编号',
  `news_title` varchar(50) NOT NULL COMMENT '新闻标题',
  `news_type` varchar(20) NOT NULL COMMENT '新闻类型',
  `news_tyid` int(10) NOT NULL COMMENT '新闻类型编号',
  `news_aut` varchar(10) NOT NULL COMMENT '作者',
  `create_at` int(255) NOT NULL COMMENT '创建时间',
  `update_at` int(255) NOT NULL COMMENT '更新时间',
  `news_vis` int(20) NOT NULL COMMENT '访问量',
  `news_img` varchar(50) DEFAULT NULL COMMENT '新闻主题图片',
  `news_con` text NOT NULL COMMENT '内容',
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ny_news
-- ----------------------------
INSERT INTO `ny_news` VALUES ('1', '我校举办“青春中国梦”五四晚会——表彰先进 激励前行', '学院文化', '3', 'admin', '1529146982', '1529498104', '1', '20180620\\46ac0a148fe1362319e11c1949f8e9ef.jpg', '为纪念“五四”运动，进一步弘扬“五四”爱国精神，表彰青年学生先进集体和优秀个人，发挥先进典型的模范带头作用，引导全校广大青年学生积极进取，展现南洋学子青春风采。');
INSERT INTO `ny_news` VALUES ('2', '广科学院来我校交流学生工作', '校委领导', '1', 'admin', '1529060582', '1529498126', '3', '20180620\\6ab2e36da18df642e8c37412daf61136.jpg', '5月23日下午，广东科技学院院长助理曹文文率领该校学生工作队伍一行14人来我校交流座谈。我校党委副书记、副校长岳增玲，学生发展部副部长何梦如、吴英义，各二级学院副院长、学生发展部内设机构负责人等代表学校热情接待了曹院助一行。');
INSERT INTO `ny_news` VALUES ('3', '首届“中国华服日”：校园上演“汉服热”', '学院文化', '3', 'admin', '1529211782', '1529211782', '52', '20180522/hanfu1.jpg', '校园内突然出现一批身着传统汉服赶早课的同学，他们身着不同朝代、不同款式的传统服饰，有的还头戴配套各式发髻、发冠，翩翩秀丽、古韵十足，成了校园里一道靓丽的风景线。别样的装束不仅让这群同学赢得超高了回头率，成了校道上最大的焦点，也让不少师生停下脚步拿出手机记录下校园里这特别的一幕。');
INSERT INTO `ny_news` VALUES ('8', '红色文化的生动传承 ', '活动阵地', '5', 'admin', '1529305382', '1529305382', '5', '20180619\\bc720f28a32652963216532f9b692ea0.jpg', '<span style=\"font-family:宋体;font-size:14px;text-indent:32px;\">为弘扬红色文化、传承红色基因、坚定理想信念、做好红色育人工作，</span><span style=\"margin:0px;padding:0px;font-family:宋体;font-size:14px;text-indent:32px;\">2018</span><span style=\"font-family:宋体;font-size:14px;text-indent:32px;\">年</span><span style=\"margin:0px;padding:0px;font-family:宋体;font-size:14px;text-indent:32px;\">5</span><span style=\"font-family:宋体;font-size:14px;text-indent:32px;\">月</span><span style=\"margin:0px;padding:0px;font-family:宋体;font-size:14px;text-indent:32px;\">23</span><span style=\"font-family:宋体;font-size:14px;text-indent:32px;\">日晚，通识教育部全体教师聚集在</span><span style=\"margin:0px;padding:0px;font-family:宋体;font-size:14px;text-indent:32px;\">A316</span><span style=\"font-family:宋体;font-size:14px;text-indent:32px;\">课室，聆听了广州从化区档案局赵惠局长主讲的“广州从化地区红色资源及其育人价值”的讲座。学校刘剑清常务副校长应邀出席，通识教育部叶润平主任主持讲座。</span>');
INSERT INTO `ny_news` VALUES ('9', '通识善融合 翰墨飘书香', '思想道德', '2', 'Aim', '1529391782', '1529391782', '3', '20180619\\20e226871ded3e34f40e8c04f1bd1705.jpg', '<span style=\"font-family:宋体;font-size:14px;text-indent:32px;\">“翰墨书香情”书法比赛颁奖活动于2018年5月17日晚上在爱学楼214室隆重举行。经管学院院长王厚俊教授、信息工程学院院长王正勤教授、机电与汽车学院陈友鹏副院长、建筑工程学院宋阳副院长、外国语学院王淑君副院长、通识教育部主任叶润平教授，以及通识教育部中文教研室的各位老师出席了本次颁奖活动。经过评委老师的认真评选，本次赛事共有20位同学获奖。</span>');
INSERT INTO `ny_news` VALUES ('11', '我校举办“青春中国梦”五四晚会——表彰先进 激励前行', '文明礼仪', '4', 'admin', '1529391782', '1529391782', '7', '20180619\\5e29ced11bfbffcc1abf0712711556a4.jpg', '<span style=\"margin:0px;padding:0px;list-style:none;font-family:simsum;color:#333333;letter-spacing:0.2px;text-indent:28px;background-color:#f3f3ee;font-size:16px;\">为纪念“五四”运动，进一步弘扬“五四”爱国精神，表彰青年学生先进集体和优秀个人，发挥先进典型的模范带头作用，引导全校广大青年学生积极进取，展现南洋学子青春风采。</span><span style=\"margin:0px;padding:0px;list-style:none;font-family:simsum;color:#333333;letter-spacing:0.2px;text-indent:28px;background-color:#f3f3ee;font-size:16px;\">5</span><span style=\"margin:0px;padding:0px;list-style:none;font-family:simsum;color:#333333;letter-spacing:0.2px;text-indent:28px;background-color:#f3f3ee;font-size:16px;\">月&nbsp;</span><span style=\"margin:0px;padding:0px;list-style:none;font-family:simsum;color:#333333;letter-spacing:0.2px;text-indent:28px;background-color:#f3f3ee;font-size:16px;\">15</span><span style=\"margin:0px;padding:0px;list-style:none;font-family:simsum;color:#333333;letter-spacing:0.2px;text-indent:28px;background-color:#f3f3ee;font-size:16px;\">日晚，我校举办了以“青春中国梦”为主题的五四表彰晚会。学校校长李国年、党委书记马燕霞、常务副校长刘剑清，党委副书记、副校长岳增玲，副校长胡琼妃、岳国善，校长助理杨楚校出席晚会，各二级学院正副院长、相关职能部门负责人，全体辅导员老师与广大师生一同观看了此次晚会。</span>');
INSERT INTO `ny_news` VALUES ('12', '我校开展“人才培养模式创新与实践”专题讲座', '学院环境', '6', 'koh', '1529391782', '1529391782', '0', '20180619\\a3e82710764a7a1a78628ceb058c28ef.jpg', '<span style=\"margin:0px;padding:0px;list-style:none;font-family:SimSun;color:#333333;letter-spacing:0.2px;text-indent:40px;line-height:2;font-size:14px;\">辽宁经济职业技术学院职业教育研究所所长刘明鑫教授受邀来</span><span style=\"margin:0px;padding:0px;list-style:none;font-family:SimSun;color:#333333;letter-spacing:0.2px;text-indent:40px;line-height:2;font-size:14px;\">我</span><span style=\"margin:0px;padding:0px;list-style:none;font-family:SimSun;color:#333333;letter-spacing:0.2px;text-indent:40px;line-height:2;font-size:14px;\">校开展</span><span style=\"margin:0px;padding:0px;list-style:none;font-family:SimSun;color:#333333;letter-spacing:0.2px;text-indent:40px;line-height:2;font-size:14px;\">“新时代、新经济、新职教---人才培养模式创新与实践”专题讲座。</span><span style=\"margin:0px;padding:0px;list-style:none;font-family:SimSun;color:#333333;letter-spacing:0.2px;text-indent:40px;line-height:2;font-size:14px;\">我校校长李国年、党委书记马燕霞、常务副校长刘剑清、副校长岳增玲等</span><span style=\"margin:0px;padding:0px;list-style:none;font-family:SimSun;color:#333333;letter-spacing:0.2px;text-indent:40px;line-height:2;font-size:14px;\">校领导，</span><span style=\"margin:0px;padding:0px;list-style:none;font-family:SimSun;color:#333333;letter-spacing:0.2px;text-indent:40px;line-height:2;font-size:14px;\">全体</span><span style=\"margin:0px;padding:0px;list-style:none;font-family:SimSun;color:#333333;letter-spacing:0.2px;text-indent:40px;line-height:2;font-size:14px;\">中层干部、</span><span style=\"margin:0px;padding:0px;list-style:none;font-family:SimSun;color:#333333;letter-spacing:0.2px;text-indent:40px;line-height:2;font-size:14px;\">各</span><span style=\"margin:0px;padding:0px;list-style:none;font-family:SimSun;color:#333333;letter-spacing:0.2px;text-indent:40px;line-height:2;font-size:14px;\">教研室主任、专业带头人和骨干教师等</span><span style=\"margin:0px;padding:0px;list-style:none;font-family:SimSun;color:#333333;letter-spacing:0.2px;text-indent:40px;line-height:2;font-size:14px;\">130余人聆听了讲座。讲座由</span><span style=\"margin:0px;padding:0px;list-style:none;font-family:SimSun;color:#333333;letter-spacing:0.2px;text-indent:40px;line-height:2;font-size:14px;\">李国年<span style=\"margin:0px;padding:0px;list-style:none;line-height:28px;\">校长</span></span><span style=\"margin:0px;padding:0px;list-style:none;font-family:SimSun;color:#333333;letter-spacing:0.2px;text-indent:40px;line-height:2;font-size:14px;\">主持。</span>');
INSERT INTO `ny_news` VALUES ('14', '“我是‘大咖’秀”全校学生文学作品表演大赛', '学院环境', '6', 'admin', '1529478182', '1529478182', '11', '20180619\\c6b90f8359634e24dbf737532ce48f3c.jpg', '<p class=\"MsoNormal\" style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-family:宋体;font-size:14px;\">“作品表演大舞台，南洋学子展英才。”&nbsp;<span style=\"margin:0px;padding:0px;\">2018</span>年5月23日下午，由通识教育部中文教研室举办的“我是‘大咖’秀”全校学生文学作品表演大赛在第二学术报告厅举行。共有17组节目（约110人）参加了本次赛事。</p>\r\n<p class=\"MsoNormal\" style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-family:宋体;font-size:14px;\"><span style=\"margin:0px;padding:0px;\">&nbsp; &nbsp;参赛选手在比赛中表演了形式多样的文学作品，包括中国现代话剧（如《雷雨》片段）、外国名篇（如莎士比亚戏剧——《威尼斯商人》片段）、童话故事（如《白雪公主和七个小矮人》等）、成语故事（如掩耳盗铃、孟母三迁等）、民间故事（如《牛郎织女》、《木兰从军》等）和古典名篇（如《史记》中的《鸿门宴》、《三国演义》中的《姜伯约归降孔明 武乡侯骂死王朗》及《三英战吕布》等），真可谓“你方唱罢我登场”。</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-family:宋体;font-size:14px;text-indent:24pt;\">口说无凭，有图为证，快来看看有没有你家同学或小伙伴哈。</p>');
INSERT INTO `ny_news` VALUES ('15', '概论教研室召开《毛泽东思想和中国特色社会主义理论体系概论》课程教学研讨会', '学院文化', '3', 'admin', '1529478182', '1529478182', '3', '20180619\\44ac47b0890a45217b833c2fdac946e1.jpg', '<span style=\"font-family:宋体;font-size:14px;text-indent:32px;\">为了更好地开展思政课专题教学，提高思政课的针对性、实效性，</span><span style=\"margin:0px;padding:0px;font-family:宋体;font-size:14px;text-indent:32px;\">6</span><span style=\"font-family:宋体;font-size:14px;text-indent:32px;\">月</span><span style=\"margin:0px;padding:0px;font-family:宋体;font-size:14px;text-indent:32px;\">13</span><span style=\"font-family:宋体;font-size:14px;text-indent:32px;\">日下午，通识教育部概论教研室在爱学楼</span><span style=\"margin:0px;padding:0px;font-family:宋体;font-size:14px;text-indent:32px;\">A433</span><span style=\"font-family:宋体;font-size:14px;text-indent:32px;\">召开《毛泽东思想和中国特色社会主义理论体系概论》课程教学研讨会，概论教研室全体老师参加，会议由概论教研室主任汪俊仁老师主持。</span>');
INSERT INTO `ny_news` VALUES ('17', '我校组团观摩广东省大中小学德育工作', '校委领导', '1', 'Amin', '1529478182', '1529478182', '0', '20180619\\bdbebee2d2a8e47792e6d22469c8b780.jpg', '<span style=\"margin:0px;padding:0px;list-style:none;font-family:simsum;color:#333333;letter-spacing:0.2px;text-indent:32px;line-height:2;font-size:14px;\">我校党委组织由党委组织部、党委宣传部、学生发展部、通识教育部、后勤管理中心、及各二级党组织相关负责人近</span><span style=\"margin:0px;padding:0px;list-style:none;font-family:simsum;color:#333333;letter-spacing:0.2px;text-indent:32px;line-height:2;font-size:14px;\">20</span><span style=\"margin:0px;padding:0px;list-style:none;font-family:simsum;color:#333333;letter-spacing:0.2px;text-indent:32px;line-height:2;font-size:14px;\">人组成的观摩团前往华南理工大学大学城校区体育馆观摩我省大中小学德育工作成果展。</span>');
INSERT INTO `ny_news` VALUES ('18', '关于校园', '活动阵地', '5', 'aut', '1529490598', '1529494664', '12', '20180620\\3a05c125e581b6150e31da0b526fc3f7.jpg', '网页测试试试');

-- ----------------------------
-- Table structure for ny_system
-- ----------------------------
DROP TABLE IF EXISTS `ny_system`;
CREATE TABLE `ny_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `is_close` tinyint(2) NOT NULL,
  `is_update` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ny_system
-- ----------------------------
INSERT INTO `ny_system` VALUES ('1', '创文明校园，做文明学子', '文明，励志，创新', '创文明校园，做文明学子，创造美好校园', '0', '1');
