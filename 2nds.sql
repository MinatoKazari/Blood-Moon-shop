/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50556
 Source Host           : localhost:3306
 Source Schema         : 2nds

 Target Server Type    : MySQL
 Target Server Version : 50556
 File Encoding         : 65001

 Date: 01/05/2020 21:33:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for rootinformation
-- ----------------------------
DROP TABLE IF EXISTS `rootinformation`;
CREATE TABLE `rootinformation`  (
  `rid` int(12) NOT NULL AUTO_INCREMENT,
  `rootID` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rootpsw` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rootName` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `age` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` datetime NULL DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rid`) USING BTREE,
  UNIQUE INDEX `rootID`(`rootID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rootinformation
-- ----------------------------
INSERT INTO `rootinformation` VALUES (1, '952794621', '123456', '琳一', '22', '男', '13625794682', '23323@outlook.com', '2019-11-11 14:45:49', '2020-04-27 14:56:50');

-- ----------------------------
-- Table structure for shopinformation
-- ----------------------------
DROP TABLE IF EXISTS `shopinformation`;
CREATE TABLE `shopinformation`  (
  `sid` int(12) NOT NULL AUTO_INCREMENT,
  `sName` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sLevel` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sRemark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sPrices` decimal(10, 0) NOT NULL,
  `sSort1` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sLocationF` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sLocationS` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sLocationT` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sDisplay` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sTransaction` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sUid` int(12) NOT NULL,
  `sUname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sImage1` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `sUid`(`sUid`) USING BTREE,
  CONSTRAINT `shopinformation_ibfk_1` FOREIGN KEY (`sUid`) REFERENCES `userinformation` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of shopinformation
-- ----------------------------
INSERT INTO `shopinformation` VALUES (5, '便携显示器', '9', '1080P', 99, '电脑配件', '广东省', '佛山市', '小布村', '通过', '线上交易', 2, 'C.C.', '005.jpg', '2020-03-15 18:34:04', '2020-04-14 18:47:47');
INSERT INTO `shopinformation` VALUES (7, 'HP无线鼠标', '8', '2.4G信号配赠电池', 10, '电脑配件', '广东省', '东莞市', '寮步镇', '通过', '支持当面交易与线上交易', 1, 'miki', '007.jpg', '2020-03-15 18:32:35', '2020-04-23 15:37:41');
INSERT INTO `shopinformation` VALUES (8, '索尼DSC-TX7卡片机', '9', '1200万像素 支持微距模式', 200, '数码相机', '广东省', '佛山市', '小布村', '通过', '仅线上交易', 4, 'Nova', '008.jpg', '2020-03-24 20:32:10', '2020-04-14 18:47:50');
INSERT INTO `shopinformation` VALUES (9, '索尼a6000微单二手', '9', '女生自用，平时保养的很好，换新的相机了，把旧的卖给适合它的主人。', 1860, '数码相机', '广东省', '', '', '通过', '仅线上交易', 9, 'opao', '009.jpg', '2020-03-24 21:20:02', '2020-04-23 15:37:34');
INSERT INTO `shopinformation` VALUES (10, '松下XT10卡片相机', '8', '1400万像素的卡片机保养的不错', 399, '数码相机', '广东省', '', '', '通过', '仅线上交易', 4, 'Nova', '002.jpg', '2020-03-25 09:11:22', '2020-04-21 14:54:13');
INSERT INTO `shopinformation` VALUES (11, '花园Serena亚克力挂件', '10', '全新亚克力装饰品', 69, '手办玩具', '广东省', '', '', '通过', '仅线上交易', 4, 'Nova', '010.jpg', '2020-04-08 01:22:11', '2020-04-23 18:32:14');
INSERT INTO `shopinformation` VALUES (12, '电脑MacBook Pro13寸', '9', '苹果MacBook Pro(ME864)笔记本13.3寸视网膜屏9成新2.4G+4G+128G\r\n', 3688, '电脑', '上海', '', '', '通过', '仅线上交易', 14, 'OUTATIME', '011.jpg', '2020-04-09 01:22:50', '2020-04-23 15:40:24');
INSERT INTO `shopinformation` VALUES (15, '索尼XPERIA 1 黑色', '9', '女生自用，因为要出XPERIA 1m2了，出掉买新的，买回来没用多久，电池损耗3%，系统是原生安卓，不会用的不要买，非质量问题不退货。', 3790, '手机', '北京', '', '', '通过', '仅线上交易', 17, 'MinatoKazari', '20200413214652Sony-Xperia_HeroSquare-6e0c86622882494aab5ac8a48121b499.jpg', '2020-04-13 21:49:17', '2020-04-15 21:38:33');
INSERT INTO `shopinformation` VALUES (17, '特安斯照度计', '10', '高精度数字照度计，量程20万Lux，高清大屏显示，功能强大', 158, '其他', '湖北', '', '', '通过', '仅线上交易', 4, 'Nova', '20200417162929.jpg', '2020-04-17 16:34:49', '2020-04-17 20:18:50');
INSERT INTO `shopinformation` VALUES (18, '爱色丽 i1 Pro', '9', '显示器校色仪，第三方软件的支持：\r\n如下产品均已测试常用的displaycal及hcfr软件，在此两款第三方软件中均可识别和使用', 1689, '电脑配件', '广东省', '广州', '', '通过', '仅线上交易', 17, 'MinatoKazari', '20200417164839shopimg.png', '2020-04-17 16:52:03', '2020-04-17 20:41:10');
INSERT INTO `shopinformation` VALUES (23, '这个商品的名字非常非常非常的长长长长长长长长长长长', '10', '审核不通过原因：（测试）', 99999, '其他', '', '北京市', '', '不通过', '仅线上交易', 1, 'miki', '202004232144400497shopimg.png', '2020-04-23 21:47:21', '2020-04-27 22:52:14');
INSERT INTO `shopinformation` VALUES (26, 'Switch 马里奥奥德赛实体游戏卡带', '9', '买回来5到6个小时打通了，这一作十分有趣，建议有能力会玩的玩家多周目游戏，更加深入挖掘游戏的乐趣。\r\n价格已包含运费，默认中通，不接受刀，谢谢。', 289, '游戏交易', '广东省', '电白县', '马踏镇', '通过', '仅线上交易', 51, 'Asuka明日香', '202004272059070755shopimg.png', '2020-04-27 21:02:05', '2020-04-27 22:49:31');
INSERT INTO `shopinformation` VALUES (27, 'NS塞尔达传说荒野之息 美版带中文', '9', '包邮，当天4点前拍下当天发货。\r\n#塞尔达传说荒野之息 #美版 #ACT动作游戏 #简体中文', 335, '游戏交易', '浙江省', '温州市', '', '通过', '仅线上交易', 51, 'Asuka明日香', '202004272122160830shopimg.png', '2020-04-27 21:08:19', '2020-04-27 22:49:54');
INSERT INTO `shopinformation` VALUES (28, '崩坏3 万氪号出售', '10', '求接盘，氪金17888元，有母猪框，全角色基本收集齐全，收藏点数10678点，登录天数少于600天，主流C位基本全部毕业，还有凭证和月卡未过期，可以上号查看装备角色和圣痕，售出不退。发货会提供帐号密码支持改密操作。', 1024, '游戏交易', '广东省', '电白县', '马踏镇', '通过', '仅线上交易', 51, 'Asuka明日香', '202004272125190179shopimg.png', '2020-04-27 21:30:34', '2020-04-27 22:51:00');
INSERT INTO `shopinformation` VALUES (29, '夏普手机 Sharp R 日版Au', '9', '自用，日本机国内用水土不服，很难受，拆封用了几天而已，基本全新，但毕竟拆封了我就当9成新卖，像我这样的良心卖家不多了，不接受刀，默认中通快递，不想包邮的可以留言，我降低15块。系统是日版的，请注意自己的运营商支不支持。', 960, '手机', '广东省', '电白县', '马踏镇', '通过', '仅线上交易', 51, 'Asuka明日香', '202004272131360957shopimg.png', '2020-04-27 21:34:46', '2020-04-27 22:51:48');
INSERT INTO `shopinformation` VALUES (30, '夏普 SharpR5G 日版SB', '10', '朋友送的，自己有苹果手机，用不惯安卓，日版软银售价7000元人民币以上，该手机性能强大，屏幕十分优秀，有10bit 2K 120HZ刷新率，10亿色彩展现图片美丽。顺丰包邮，不接受刀。', 6800, '手机', '广东省', '佛山市', '顺德区乐从镇', '通过', '仅线上交易', 61, 'ChrisxCN', '202004272140570914shopimg.png', '2020-04-27 21:44:04', '2020-04-27 22:51:40');
INSERT INTO `shopinformation` VALUES (31, 'Switch动物之森限定 欧版', '10', '全新欧版Switch动物之森限定版箱说全，是正品保证开机红带发票，只发顺丰快递。因为疫情关系，价格有小幅度上涨', 3830, '游戏交易', '广东省', '佛山市', '顺德区乐从镇', '通过', '仅线上交易', 61, 'ChrisxCN', '202004272144360432shopimg.png', '2020-04-27 21:49:12', '2020-04-27 22:51:36');
INSERT INTO `shopinformation` VALUES (32, '索尼DS4手柄 铁黑色', '7', '用了2年，所有功能正常，可以用在PS4和电脑PC上，盒子手柄都有三码合一，保证是索尼正品。默认快递申通，包邮。', 130, '其他', '广东省', '佛山市', '顺德区乐从镇', '通过', '仅线上交易', 61, 'ChrisxCN', '202004272156080440shopimg.png', '2020-04-27 21:58:59', '2020-04-27 22:51:33');
INSERT INTO `shopinformation` VALUES (33, '索尼XPERIA XZ3 红 港版', '8', '用了一年XZ3，边框有所磨损掉漆，屏幕完美屏，保护的很好，无烧屏，已校色过，sRGB下色准平均DeltaE小于1，表现十分出色，这款索尼机子的优点就是电视娱乐功能十分强大，转让给有需要的老哥。砍价勿扰，顺丰包邮。', 1588, '手机', '广东省', '佛山市', '顺德区', '待审核', '仅线上交易', 62, 'LollipopXC', '202004272203590746shopimg.png', '2020-04-27 22:06:52', '2020-04-28 10:03:13');
INSERT INTO `shopinformation` VALUES (34, 'XBOX ONE S手柄', '10', '全新未拆封，买给女朋友玩的，谁知道她有一个少女粉的，只能折点价格出售了，不接受刀，默认快递中通，不需要包邮的可以留言下，会修改价格跟信息。', 420, '其他', '广东省', '佛山市', '顺德区乐从镇', '通过', '仅线上交易', 62, 'LollipopXC', '202004272210100948shopimg.png', '2020-04-27 22:14:26', '2020-04-27 22:51:29');
INSERT INTO `shopinformation` VALUES (35, '三星 S20U', '9', '用了两个星期，保护措施做的很好，贴膜戴套都有，三星的续航不太好，120hz刷新率是挺爽的，但是不能与2K分辨率并存，所以出了，中通快递包邮，不需要包邮可以留言，我自己会降15块。', 6515, '手机', '广东省', '佛山市', '顺德区乐从镇', '通过', '仅线上交易', 62, 'LollipopXC', '202004272221360920shopimg.png', '2020-04-27 22:26:25', '2020-04-27 22:51:20');
INSERT INTO `shopinformation` VALUES (36, 'Java从入门到项目实战', '8', '自用学习java，适合编程小白，要有耐心的去学习去看，书本是正品来的，买回来的时候是50块，现在便宜出，顺带包邮。', 30, '书本', '福建省', '福州市', '鼓楼区', '通过', '仅线上交易', 48, '百合欧皇子', '202004272237130679shopimg.png', '2020-04-27 22:40:14', '2020-04-27 22:51:26');
INSERT INTO `shopinformation` VALUES (37, 'JSP实用教程 第三版', '7', '有需要的直接拍下就是了，包邮的。', 21, '书本', '福建省', '', '', '通过', '仅线上交易', 48, '百合欧皇子', '202004272241120787shopimg.png', '2020-04-27 22:42:59', '2020-04-27 22:51:23');
INSERT INTO `shopinformation` VALUES (38, '命运石之门彩本集', '7', '有需要的直接拍下，放柜子4年了，外观成色一般，包邮。', 35, '书本', '福建省', '福州市', '鼓楼区', '通过', '仅线上交易', 48, '百合欧皇子', '202004272245420043shopimg.png', '2020-04-27 22:47:00', '2020-04-27 22:56:32');
INSERT INTO `shopinformation` VALUES (39, '初音未来彩本画集', '7', '有需要的直接拍下，放柜子4年了，外观成色一般，包邮。', 35, '书本', '福建省', '福州市', '鼓楼区', '通过', '仅线上交易', 48, '百合欧皇子', '202004272247130684shopimg.png', '2020-04-27 22:47:57', '2020-04-27 22:51:09');
INSERT INTO `shopinformation` VALUES (40, '岸田梅儿画师 彩本集', '7', '有需要的直接拍下，放柜子4年了，外观成色一般，包邮。', 35, '书本', '福建省', '福州市', '鼓楼区', '通过', '仅线上交易', 48, '百合欧皇子', '202004272248120869shopimg.png', '2020-04-27 22:49:12', '2020-04-27 22:56:28');
INSERT INTO `shopinformation` VALUES (41, 'PS3游戏 FIFA2012实体游戏光盘', '8', '基本没玩，光碟成色非常好，盒子有磨痕是正常现象。包邮价格非常低了，不接受砍价行为', 65, '游戏交易', '广东省', '佛山市', '三水区', '通过', '仅线上交易', 65, '咸狼赫萝', '202004272259340772shopimg.png', '2020-04-27 23:01:20', '2020-04-27 23:05:49');
INSERT INTO `shopinformation` VALUES (42, 'PS3游戏 铁拳x街霸 实体游戏光盘', '8', '基本没玩，光碟成色非常好，盒子有磨痕是正常现象。包邮价格非常低了，不接受砍价行为', 65, '游戏交易', '广东省', '佛山市', '三水区', '通过', '仅线上交易', 65, '咸狼赫萝', '202004272301320136shopimg.png', '2020-04-27 23:02:13', '2020-04-27 23:05:45');
INSERT INTO `shopinformation` VALUES (43, 'PS3游戏 RAGE 实体游戏光盘', '8', '基本没玩，光碟成色非常好，盒子有磨痕是正常现象。包邮价格非常低了，不接受砍价行为', 65, '游戏交易', '广东省', '佛山市', '三水区', '通过', '仅线上交易', 65, '咸狼赫萝', '202004272302360656shopimg.png', '2020-04-27 23:03:01', '2020-04-27 23:05:52');
INSERT INTO `shopinformation` VALUES (44, 'PS3游戏 杀戮地带3 实体游戏光盘', '8', '基本没玩，光碟成色非常好，盒子有磨痕是正常现象。包邮价格非常低了，不接受砍价行为', 85, '游戏交易', '广东省', '佛山市', '三水区', '通过', '仅线上交易', 65, '咸狼赫萝', '202004272303250892shopimg.png', '2020-04-27 23:04:07', '2020-04-27 23:05:56');
INSERT INTO `shopinformation` VALUES (45, 'PS3游戏 阿修罗之怒 实体游戏光盘', '8', '基本没玩，光碟成色非常好，盒子有磨痕是正常现象。包邮价格非常低了，不接受砍价行为', 85, '游戏交易', '广东省', '佛山市', '三水区', '通过', '仅线上交易', 65, '咸狼赫萝', '202004272304350851shopimg.png', '2020-04-27 23:05:00', '2020-04-27 23:32:43');
INSERT INTO `shopinformation` VALUES (46, '夏普手机 Sharp R 日版Au', '9', '商品简介略！', 999, '手机', '广东省', '佛山市', '三水区', '通过', '仅线上交易', 68, '一个快乐的小天使', '202004272310420756shopimg.png', '2020-04-27 23:11:20', '2020-04-27 23:19:04');
INSERT INTO `shopinformation` VALUES (47, 'Switch动物之森限定 欧版', '10', '全新欧版Switch动物之森限定版箱说全，是正品保证开机红带发票，只发顺丰快递。因为疫情关系，价格有小幅度上涨', 3800, '游戏交易', '广东省', '佛山市', '三水区', '通过', '仅线上交易', 68, '一个快乐的小天使', '202004272312340442shopimg.png', '2020-04-27 23:13:03', '2020-04-27 23:19:17');
INSERT INTO `shopinformation` VALUES (48, '夏普 SharpR5G 日版Au', '9', '朋友送的，自己有苹果手机，用不惯安卓，日版软银售价7000元人民币以上，该手机性能强大，屏幕十分优秀，有10bit 2K 120HZ刷新率，10亿色彩展现图片美丽。顺丰包邮，不接受刀。', 6820, '手机', '广东省', '佛山市', '三水区', '待审核', '仅线上交易', 68, '一个快乐的小天使', '202004272313280268shopimg.png', '2020-04-27 23:14:53', '2020-04-27 23:14:53');
INSERT INTO `shopinformation` VALUES (49, '索尼XPERIA Z5P 港版银色', '7', '换过电池，全新3440mah容量，包邮其他信息略。', 520, '手机', '广东省', '佛山市', '三水区', '通过', '仅线上交易', 68, '一个快乐的小天使', '202004272316200371shopimg.png', '2020-04-27 23:17:32', '2020-04-28 13:59:14');
INSERT INTO `shopinformation` VALUES (50, '苹果Ipad Air2', '9', '简介略。包邮', 700, '电脑', '广东省', '佛山市', '三水区', '通过', '仅线上交易', 68, '一个快乐的小天使', '202004272318080016shopimg.png', '2020-04-27 23:18:45', '2020-04-27 23:19:13');
INSERT INTO `shopinformation` VALUES (51, '蓝光电影50G', '9', '简介略', 50, '其他', '广东省', '佛山市', '顺德区乐从镇', '待上架', '仅线上交易', 60, 'JERRY飞翔者', '202004281004510058shopimg.png', '2020-04-28 10:06:28', '2020-04-28 10:13:33');
INSERT INTO `shopinformation` VALUES (52, 'Serena酱音声全套套装', '10', '第一弹音声全套。一共包含8个语音包。[1]同居闹钟套装（包含5个）[2]内容是秘密哦（包含3个）[3]Lolina酱正在挑衅（包含3个）[4]致正在加油的中的主人（包含5个）。。。。略\r\n发货时物流信息里会提供下载链接，可以下载三次（该内容是无中文的，请注意），不需要提供QQ邮箱等信息。', 599, '其他', '', '北京市', '海淀区', '已出售', '仅线上交易', 47, '风间琉璃', '202004281351170271shopimg.png', '2020-04-28 13:56:10', '2020-04-28 15:24:03');
INSERT INTO `shopinformation` VALUES (53, 'JSP实用教程 第三版', '9', '略', 25, '书本', '广东省', '佛山市', '顺德区乐从镇', '通过', '仅线上交易', 60, 'JERRY飞翔者', '202004281528390705shopimg.png', '2020-04-28 15:30:04', '2020-04-28 15:36:40');

-- ----------------------------
-- Table structure for shopmessage
-- ----------------------------
DROP TABLE IF EXISTS `shopmessage`;
CREATE TABLE `shopmessage`  (
  `smid` int(12) NOT NULL AUTO_INCREMENT,
  `smUid` int(12) NOT NULL,
  `smSid` int(12) NOT NULL,
  `smUname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `smContext` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`smid`) USING BTREE,
  INDEX `smUid`(`smUid`) USING BTREE,
  INDEX `smSid`(`smSid`) USING BTREE,
  CONSTRAINT `shopmessage_ibfk_2` FOREIGN KEY (`smSid`) REFERENCES `shopinformation` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of shopmessage
-- ----------------------------
INSERT INTO `shopmessage` VALUES (9, 4, 9, 'Nova', '你好，能再便宜一点吗？', '2020-04-13 15:04:31');
INSERT INTO `shopmessage` VALUES (10, 4, 12, 'Nova', '电脑看起来不错啊', '2020-04-13 15:45:11');
INSERT INTO `shopmessage` VALUES (11, 4, 9, 'Nova', '索尼大法好！Sony DA FA GOOD!', '2020-04-13 15:45:54');
INSERT INTO `shopmessage` VALUES (14, 4, 11, 'Nova', 'DD们买爆啊', '2020-04-13 18:08:03');
INSERT INTO `shopmessage` VALUES (15, 17, 9, 'MinatoKazari', '插眼等降价XD', '2020-04-13 21:59:09');
INSERT INTO `shopmessage` VALUES (16, 1, 15, 'miki', '21:9 4K HDR屏幕天下无敌', '2020-04-15 00:10:44');
INSERT INTO `shopmessage` VALUES (17, 17, 12, 'MinatoKazari', '13寸有点小了....不过还行', '2020-04-15 21:29:42');
INSERT INTO `shopmessage` VALUES (18, 17, 11, 'MinatoKazari', '测试中文乱码', '2020-04-17 19:37:37');
INSERT INTO `shopmessage` VALUES (19, 17, 7, 'MinatoKazari', '你好，10块钱收了。：D', '2020-04-17 19:43:03');
INSERT INTO `shopmessage` VALUES (20, 25, 11, '小猫咪qwq', '支持猫猫', '2020-04-23 14:55:23');
INSERT INTO `shopmessage` VALUES (21, 1, 17, 'miki', '淘宝卖的更加便宜，你这个是什么型号啊？', '2020-04-23 23:27:23');
INSERT INTO `shopmessage` VALUES (22, 1, 5, 'miki', '希望能描述更详细的屏幕参数：D', '2020-04-23 23:28:19');
INSERT INTO `shopmessage` VALUES (23, 4, 12, 'Nova', '留言字符长度限制多长？留言字符长度限制多长？留言字符长度限制多长？留言字符长度限制多长？留言字符长度限制多长？留言字符长度限制多长？留言字符长度限制多长？留言字', '2020-04-25 15:48:01');
INSERT INTO `shopmessage` VALUES (26, 48, 27, '百合欧皇子', '任天堂的游戏果然很保值，甚至二手都还涨价了', '2020-04-27 22:54:13');
INSERT INTO `shopmessage` VALUES (27, 60, 45, 'JERRY飞翔者', '这个是日版的呀', '2020-04-27 23:23:48');
INSERT INTO `shopmessage` VALUES (28, 60, 45, 'JERRY飞翔者', '这个价格还能接受直接拍了。', '2020-04-27 23:24:31');
INSERT INTO `shopmessage` VALUES (30, 47, 52, '风间琉璃', '无法顺利下载的可以联系我qq:156207150', '2020-04-28 13:57:27');
INSERT INTO `shopmessage` VALUES (31, 60, 52, 'JERRY飞翔者', '支持一波。', '2020-04-28 15:23:32');

-- ----------------------------
-- Table structure for userfavourite
-- ----------------------------
DROP TABLE IF EXISTS `userfavourite`;
CREATE TABLE `userfavourite`  (
  `ufid` int(12) NOT NULL AUTO_INCREMENT,
  `ufSid` int(12) NOT NULL,
  `ufSimg` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ufSname` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ufSlevel` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ufSprice` decimal(10, 0) NOT NULL,
  `ufUid` int(12) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ufid`) USING BTREE,
  INDEX `ufUid`(`ufUid`) USING BTREE,
  INDEX `ufSid`(`ufSid`) USING BTREE,
  CONSTRAINT `userfavourite_ibfk_1` FOREIGN KEY (`ufSid`) REFERENCES `shopinformation` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of userfavourite
-- ----------------------------
INSERT INTO `userfavourite` VALUES (16, 7, '007.jpg', 'HP无线鼠标', '8', 23, 9, '2020-04-13 01:47:01');
INSERT INTO `userfavourite` VALUES (23, 12, '011.jpg', '电脑MacBook Pro13寸', '9', 3688, 9, '2020-04-13 01:58:26');
INSERT INTO `userfavourite` VALUES (24, 9, '009.jpg', '索尼a6000微单二手', '9', 1860, 4, '2020-04-13 14:29:15');
INSERT INTO `userfavourite` VALUES (25, 15, '20200413214652Sony-Xperia_HeroSquare-6e0c86622882494aab5ac8a48121b499.jpg', '索尼XPERIA 1 黑色', '9', 3890, 4, '2020-04-14 16:59:27');
INSERT INTO `userfavourite` VALUES (26, 15, '20200413214652Sony-Xperia_HeroSquare-6e0c86622882494aab5ac8a48121b499.jpg', '索尼XPERIA 1 黑色', '9', 3890, 1, '2020-04-15 00:10:51');
INSERT INTO `userfavourite` VALUES (27, 12, '011.jpg', '电脑MacBook Pro13寸', '9', 3688, 17, '2020-04-15 21:29:51');
INSERT INTO `userfavourite` VALUES (34, 9, '009.jpg', '索尼a6000微单二手', '9', 1860, 1, '2020-04-23 21:51:23');
INSERT INTO `userfavourite` VALUES (36, 11, '010.jpg', '花园Serena亚克力挂件', '10', 69, 1, '2020-04-23 23:43:38');
INSERT INTO `userfavourite` VALUES (37, 36, '202004272237130679shopimg.png', 'Java从入门到项目实战', '8', 30, 60, '2020-04-27 23:34:41');
INSERT INTO `userfavourite` VALUES (38, 28, '202004272125190179shopimg.png', '崩坏3 万氪号出售', '10', 1024, 60, '2020-04-27 23:36:10');
INSERT INTO `userfavourite` VALUES (39, 47, '202004272312340442shopimg.png', 'Switch动物之森限定 欧版', '10', 3800, 60, '2020-04-27 23:36:22');
INSERT INTO `userfavourite` VALUES (40, 33, '202004272203590746shopimg.png', '索尼XPERIA XZ3 红 港版', '8', 1588, 60, '2020-04-28 09:52:27');
INSERT INTO `userfavourite` VALUES (41, 52, '202004281351170271shopimg.png', 'Serena酱音声全套套装', '10', 599, 60, '2020-04-28 15:23:18');
INSERT INTO `userfavourite` VALUES (42, 53, '202004281528390705shopimg.png', 'JSP实用教程 第三版', '9', 25, 60, '2020-04-28 15:37:11');

-- ----------------------------
-- Table structure for usergoodorder
-- ----------------------------
DROP TABLE IF EXISTS `usergoodorder`;
CREATE TABLE `usergoodorder`  (
  `ugoid` int(12) NOT NULL AUTO_INCREMENT,
  `ugosid` int(12) NOT NULL,
  `ugoUidb` int(12) NOT NULL,
  `ugoUids` int(12) NOT NULL,
  `ugoSname` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ugoPrices` decimal(10, 0) NOT NULL,
  `ugoAddress` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ugodealinfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ugoState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ugoid`) USING BTREE,
  INDEX `ugoUidb`(`ugoUidb`) USING BTREE,
  INDEX `ugoUids`(`ugoUids`) USING BTREE,
  INDEX `ugoSid`(`ugoSname`) USING BTREE,
  CONSTRAINT `usergoodorder_ibfk_1` FOREIGN KEY (`ugoUidb`) REFERENCES `userinformation` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `usergoodorder_ibfk_2` FOREIGN KEY (`ugoUids`) REFERENCES `userinformation` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of usergoodorder
-- ----------------------------
INSERT INTO `usergoodorder` VALUES (1, 0, 2, 1, '星巴克牌遇热变色马克杯', 100, 'test', 'null', '交易完成', '2020-04-01 16:46:42', '2020-04-12 13:09:15');
INSERT INTO `usergoodorder` VALUES (2, 0, 2, 1, 'mbp pro', 100, 'test', '测试', '已发货', '2020-04-01 16:46:42', '2020-04-12 19:20:00');
INSERT INTO `usergoodorder` VALUES (3, 7, 4, 1, 'HP无线鼠标', 23, '广东省佛山市顺德区乐从镇老人大学', '测试', '交易完成', '2020-04-12 16:52:42', '2020-04-21 15:58:59');
INSERT INTO `usergoodorder` VALUES (4, 12, 4, 14, '电脑MacBook Pro13寸', 3688, '广东省佛山市顺德区乐从镇爱心幼儿园', '测试（已填写物流信息）', '交易完成', '2020-04-12 16:22:10', '2020-04-21 16:20:56');
INSERT INTO `usergoodorder` VALUES (5, 9, 4, 9, '索尼a6000微单二手', 1860, '广东省佛山市顺德区乐从新隆', '0987-xxxxxxxxx-10091', '交易完成', '2020-04-13 21:18:10', '2020-04-25 17:37:34');
INSERT INTO `usergoodorder` VALUES (6, 12, 4, 14, '电脑MacBook Pro13寸', 3688, '广东省佛山市顺德区乐从小布村', '(请卖家填写物流信息)', '已发货', '2020-04-13 11:20:03', '2020-04-25 17:57:36');
INSERT INTO `usergoodorder` VALUES (9, 15, 1, 17, '索尼XPERIA 1 黑色', 3890, '广东省佛山市顺德区乐从镇红棉小学', '0987-xxxxxxxxx-10091', '交易完成', '2020-04-15 00:14:00', '2020-04-21 15:58:42');
INSERT INTO `usergoodorder` VALUES (10, 12, 17, 14, '电脑MacBook Pro13寸', 3688, '测试地址', '(请卖家填写物流信息)', '付款完成', '2020-04-15 21:30:15', '2020-04-21 16:20:53');
INSERT INTO `usergoodorder` VALUES (11, 11, 17, 4, '花园Serena亚克力挂件', 69, '广东省佛山市顺德区乐从镇爱心幼儿园', '(请卖家填写物流信息)', '付款完成', '2020-04-17 19:38:12', '2020-04-21 15:58:33');
INSERT INTO `usergoodorder` VALUES (12, 7, 17, 1, 'HP无线鼠标', 10, '广东省佛山市顺德区乐从镇爱心幼儿园', '0987-xxxxxxxxx-10091', '交易完成', '2020-04-17 19:50:37', '2020-04-21 15:58:23');
INSERT INTO `usergoodorder` VALUES (13, 45, 60, 65, 'PS3游戏 阿修罗之怒 实体游戏光盘', 85, '广东省佛山市顺德区乐从镇金威郦都6座604', '（测试发货填写物流信息）', '交易完成', '2020-04-27 23:26:00', '2020-04-27 23:29:23');
INSERT INTO `usergoodorder` VALUES (14, 33, 60, 62, '索尼XPERIA XZ3 红 港版', 1588, '广东省佛山市顺德区乐从镇金威郦都6座604', '（测试发货填写物流信息）', '交易完成', '2020-04-28 09:53:31', '2020-04-28 09:59:08');
INSERT INTO `usergoodorder` VALUES (15, 52, 60, 47, 'Serena酱音声全套套装', 599, '广东省佛山市顺德区乐从镇金威郦都6座604', '（测试发货填写物流信息）', '交易完成', '2020-04-28 15:24:03', '2020-04-28 15:26:05');

-- ----------------------------
-- Table structure for userinformation
-- ----------------------------
DROP TABLE IF EXISTS `userinformation`;
CREATE TABLE `userinformation`  (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `realname` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fpwdcode` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LocationA` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LocationB` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LocationC` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LocationD` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `用户名`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of userinformation
-- ----------------------------
INSERT INTO `userinformation` VALUES (1, 'miki', '123456', 'MikiFrian', '17', '女', '15625794682', '123@qq.com', '20200414170747~)5UO93ADGXZGH}W00YFX{R.png', '2020-03-17 15:51:50', '2020-04-23 21:37:29', 'AS109', '', '北京市', '', '');
INSERT INTO `userinformation` VALUES (2, 'CkCI', '123456', 'LION', '16', '男', '15225794682', 'AA23@qq.com', 'static.jpg', '2020-03-17 15:51:50', '2020-04-25 19:19:48', 'AS109', NULL, NULL, NULL, NULL);
INSERT INTO `userinformation` VALUES (3, 'W9WC', '123456', 'XYZONE', '19', '女', '13325794682', '1EXA@qq.com', 'static.jpg', '2020-03-17 15:51:50', '2020-04-25 19:36:16', 'AS109', NULL, NULL, NULL, NULL);
INSERT INTO `userinformation` VALUES (4, 'Nova', '123456', 'LamaliCotanalim', '20', '男', '15628964098', '123011A3@qq.com', '004.jpg', '2020-03-17 15:51:50', '2020-04-25 18:19:47', 'AS109', '广东省', '佛山市', '三水区', '三水中心医院');
INSERT INTO `userinformation` VALUES (5, 'SIMPLE', '123456', 'CKTeam', '21', '女', '19925794682', '1ASDGG@qq.com', 'static.jpg', '2020-03-17 15:51:50', '2020-04-13 00:27:06', 'AS109', NULL, NULL, NULL, NULL);
INSERT INTO `userinformation` VALUES (6, 'LiXYANG', '123456', 'Chrees', '21', '男', '19925777682', '19985DGG@qq.com', 'static.jpg', '2020-03-17 15:51:50', '2020-04-13 00:27:09', 'AS109', NULL, NULL, NULL, NULL);
INSERT INTO `userinformation` VALUES (8, 'RX78', '123456', 'uukla', '21', '男', '15627464682', '111@qq.com', 'static.jpg', '2020-03-17 15:51:50', '2020-04-25 19:19:53', 'AS109', NULL, NULL, NULL, NULL);
INSERT INTO `userinformation` VALUES (9, 'opao', '123456', 'CLAMA', '16', '男', '16895794682', '097158@qq.com', 'static.jpg', '2020-03-17 16:23:29', '2020-04-13 00:27:12', 'AS109', NULL, NULL, NULL, NULL);
INSERT INTO `userinformation` VALUES (10, 'OPAZIA8', '123456', 'oaxbi', '18', '男', '16840094682', '012358@qq.com', 'static.jpg', '2020-03-17 16:27:50', '2020-04-13 00:27:14', 'AS109', NULL, NULL, NULL, NULL);
INSERT INTO `userinformation` VALUES (11, 'YOUISA', '123456', 'pybak', '22', '男', '10933394682', '19782@qq.com', 'static.jpg', '2020-03-17 00:00:00', '2020-04-13 00:27:16', 'AS109', NULL, NULL, NULL, NULL);
INSERT INTO `userinformation` VALUES (12, 'IUOAH', '123456', 'YQUAVL', '22', '男', '11526394682', '156107@qq.com', 'static.jpg', '2020-03-17 00:00:00', '2020-04-13 00:27:18', 'AS109', NULL, NULL, NULL, NULL);
INSERT INTO `userinformation` VALUES (13, 'TQANL', '123456', 'JKJAAL', '22', '男', '16895794683', '098127@qq.com', 'static.jpg', '2020-03-17 00:00:00', '2020-04-13 00:27:19', 'AS109', NULL, NULL, NULL, NULL);
INSERT INTO `userinformation` VALUES (14, 'OUTATIME', '123456', 'maketime', '23', '男', '18946936196', 'play166@qq.com', 'static.jpg', '2020-03-24 00:00:00', '2020-04-13 00:27:23', 'AS109', NULL, NULL, NULL, NULL);
INSERT INTO `userinformation` VALUES (15, 'TerimOS', '123456', 'TerimOS', '20', '男', '19800647894', 'kyals@gmail.com', 'static.jpg', '2020-04-13 00:00:00', '2020-04-13 00:32:07', 'AS109', NULL, NULL, NULL, NULL);
INSERT INTO `userinformation` VALUES (16, 'QI902', '123456', 'MAZAQ', '25', '男', '19856794682', 'PASDN@outlook.com', 'static.jpg', '2020-04-13 00:00:00', '2020-04-21 15:12:28', 'AS109', NULL, NULL, '', NULL);
INSERT INTO `userinformation` VALUES (17, 'MinatoKazari', '123456', 'KiriKri', '23', '男', '19812160982', '156207150@qq.com', 'static.jpg', '2020-04-13 00:00:00', '2020-04-23 15:46:00', 'AS109', '', '北京市', '', '');
INSERT INTO `userinformation` VALUES (18, 'Soyi', '123456', '韩国小狐狸', '16', '女', '19874794682', 'ANLY@gmail.com', 'static.jpg', '2020-04-15 00:30:02', '2020-04-25 19:19:58', 'AS109', NULL, NULL, NULL, NULL);
INSERT INTO `userinformation` VALUES (19, '孤独的影子', '123456', '李小明', '16', '男', '19872256412', 'aepp07150@qq.com', 'static.jpg', '2020-04-23 11:54:32', '2020-04-23 11:56:05', 'AS109', NULL, NULL, NULL, NULL);
INSERT INTO `userinformation` VALUES (20, '明月说', '123456', '明月说', '16', '女', '13705794682', 'aaxc@qq.com', 'static.jpg', '2020-04-23 12:01:00', '2020-04-23 12:01:00', 'AS109', NULL, NULL, NULL, NULL);
INSERT INTO `userinformation` VALUES (23, '破灭三十三重天', '123456', '陈柏树', '20', '男', '13650994682', 'klacy@163.com', 'static.jpg', '2020-04-23 12:15:12', '2020-04-23 12:15:12', 'AS109', NULL, NULL, NULL, NULL);
INSERT INTO `userinformation` VALUES (24, '愤怒的小回123', '123456', '月明风', '16', '男', '19875794682', 'A7150@163.com', 'static.jpg', '2020-04-23 12:17:32', '2020-04-23 12:18:44', 'AS109', NULL, NULL, NULL, NULL);
INSERT INTO `userinformation` VALUES (25, '小猫咪qwq', '123456', '青海铭', '21', '男', '13662794682', '1091haz@qq.com', 'static.jpg', '2020-04-23 12:30:45', '2020-04-23 15:30:03', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (27, 'ASP0916', '123456', '杨澤林', '26', '男', '13756108123', 'oxe6207150@qq.com', 'static.jpg', '2020-04-23 12:49:24', '2020-04-23 15:03:55', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (29, 'YellowDong', '123456', '黄小妞', '16', '女', '13946808466', 'vekmgnuc@265.com', 'static.jpg', '2020-04-25 19:50:05', '2020-04-27 15:12:33', 'AS109', '广东省', '惠来县', '靖海镇', '东大街22之3号');
INSERT INTO `userinformation` VALUES (30, 'AlexHams', '123456', '黄炳强', '16', '男', '13004129997', 'dktvpbbsntkihre@56.com', 'static.jpg', '2020-04-27 17:11:39', '2020-04-27 17:11:39', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (31, '鲲鲲是带明星', '123456', '何镜华', '16', '男', '13004129941', 'b8510@citiz.com', 'static.jpg', '2020-04-27 17:13:40', '2020-04-27 17:13:40', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (32, '岗板日村', '123456', '胡凤华', '16', '女', '13004129912', 'k65168340487@qq.com', 'static.jpg', '2020-04-27 17:14:50', '2020-04-27 17:14:50', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (33, '悠悠岁月如一梦', '123456', '王大成', '16', '男', '13004129876', 'b4360035@163.com', 'static.jpg', '2020-04-27 17:15:34', '2020-04-27 17:16:30', 'AS109', '广东省', '东莞市', '城区', '勒竹围公路站宿舍2座201号');
INSERT INTO `userinformation` VALUES (34, '电竞邓紫棋', '123456', '梁泉', '16', '男', '13004129831', 'i64021511666308@163.com', 'static.jpg', '2020-04-27 17:18:55', '2020-04-27 17:18:55', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (35, 'passersby', '123456', '陈楷武', '16', '男', '13004129865', 'p2247@email.com.cn', 'static.jpg', '2020-04-27 17:20:37', '2020-04-27 17:20:37', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (36, '白一身素安', '123456', '张劲帆', '16', '女', '13004129816', 'eremiu283@etang.com', 'static.jpg', '2020-04-27 17:21:45', '2020-04-27 17:21:45', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (37, 'LURENJIA', '123456', '顾钦进', '16', '男', '13004129940', 'tupjt@265.com', 'static.jpg', '2020-04-27 17:22:35', '2020-04-27 17:22:35', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (38, '月下冰层', '123456', '张敏芳', '16', '女', '13004129739', 'kvr@msn.com', 'static.jpg', '2020-04-27 17:25:53', '2020-04-27 17:26:30', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (39, 'MinneOhara', '123456', '张晓光', '16', '男', '13004129841', 'qjphukcugfhvvb6@sina.com', 'static.jpg', '2020-04-27 17:28:11', '2020-04-27 17:28:11', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (40, '不曾想过有你', '123456', '邓勇华', '16', '男', '13004129575', 'wmkidtvbbjf@email.com.cn', 'static.jpg', '2020-04-27 17:29:27', '2020-04-27 17:29:27', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (41, 'CrackBerry', '123456', '郑祖潮', '16', '男', '13004129743', 'miobtjosblrk@citiz.com', 'static.jpg', '2020-04-27 17:30:05', '2020-04-27 17:30:06', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (42, '逍遥小神仙', '123456', '万剑亮', '19', '男', '13004129534', 'mvonvavwitpgw@enet.com.cn', 'static.jpg', '2020-04-27 17:32:42', '2020-04-27 17:32:42', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (43, '那糖微甜', '123456', '骆芳', '25', '女', '13004129586', 'v45@263.net', 'static.jpg', '2020-04-27 17:34:48', '2020-04-27 17:34:48', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (44, 'Dewblay', '123456', '黄巨文', '22', '男', '13004129679', 'tupet6@sogou.com', 'static.jpg', '2020-04-27 17:36:47', '2020-04-27 17:36:47', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (45, 'RatmanRebel', '123456', '刘金迷', '21', '男', '13004129750', 'llpgjheweufkbfk@etang.com', 'static.jpg', '2020-04-27 17:37:43', '2020-04-27 17:37:43', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (46, '热狗小汉堡', '123456', '王丽虹', '20', '女', '13004129796', 'fawovot@sogou.com', 'static.jpg', '2020-04-27 17:40:12', '2020-04-27 17:40:12', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (47, '风间琉璃', '123456', '陈燕明', '29', '男', '13004129680', 'jsdgrteeqn444@china.com', 'static.jpg', '2020-04-27 17:40:57', '2020-04-28 13:47:54', 'AS109', '', '北京市', '海淀区', '清华大学');
INSERT INTO `userinformation` VALUES (48, '百合欧皇子', '123456', '尹沛霖', '16', '女', '13004129679', 'uaefafkqv@163.com', '202004272236500734userimg.png', '2020-04-27 17:43:24', '2020-04-27 22:44:24', 'AS109', '福建省', '福州市', '鼓楼区', '上司源乡农胜村2组52号');
INSERT INTO `userinformation` VALUES (49, '原子能研究机构', '123456', '黄志坚', '16', '男', '13004129678', 'b515@netease.com', 'static.jpg', '2020-04-27 17:45:26', '2020-04-27 17:45:26', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (50, 'mar1592', '123456', '石野', '16', '男', '13004129677', 'ociwaltlb@56.com', 'static.jpg', '2020-04-27 17:46:21', '2020-04-27 17:46:22', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (51, 'Asuka明日香', '123456', '黎志雄', '19', '男', '13000549992', 'tolcajowkr@china.com', '202004272054270870userimg.png', '2020-04-27 17:48:15', '2020-04-27 20:54:29', 'AS109', '广东省', '电白县', '马踏镇', '黄姜九色岭村');
INSERT INTO `userinformation` VALUES (52, '钉钉项目规划组', '123456', '黄坤强', '26', '男', '13000549994', 'uaefafkqv@163.com', 'static.jpg', '2020-04-27 17:49:15', '2020-04-27 17:49:15', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (53, '梦星辰5G', '123456', '刘铁民', '22', '男', '13000549995', 'b515@netease.com', 'static.jpg', '2020-04-27 17:50:00', '2020-04-27 17:50:00', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (54, '贝塔Cat', '123456', '张立华', '26', '男', '13000549996', 'cdgtuds@126.com', 'static.jpg', '2020-04-27 17:50:51', '2020-04-27 17:50:51', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (55, '柠檬小分队', '123456', '陈忠凡', '22', '男', '13000549997', 'h24448@eyou.com', 'static.jpg', '2020-04-27 17:52:36', '2020-04-27 17:52:36', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (56, '百年陶碧华', '123456', '古伟康', '26', '男', '13000549998', 'ukdfblb16@qq.com', 'static.jpg', '2020-04-27 17:54:26', '2020-04-27 17:54:26', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (57, '大力金刚腿', '123456', '曾庆龙', '27', '男', '13000549999', 'kpqegsclmwtar@263.net', 'static.jpg', '2020-04-27 17:59:36', '2020-04-27 17:59:36', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (58, 'Yukiryo', '123456', '陈锐良', '29', '男', '13000549990', 'wvehs@netease.com', 'static.jpg', '2020-04-27 18:03:39', '2020-04-27 18:03:39', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (59, 'Gravesi', '123456', '徐雪锋', '19', '男', '13000549989', 'orhq51@netease.com', 'static.jpg', '2020-04-27 18:05:58', '2020-04-27 18:05:58', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (60, 'JERRY飞翔者', '123456', '腾云', '17', '男', '13000549988', 'knkkknpsi@yahoo.com.cn', '202004281015440837userimg.png', '2020-04-27 18:10:49', '2020-04-28 10:15:45', 'AS109', '广东省', '佛山市', '顺德区乐从镇', '金威郦都6座604');
INSERT INTO `userinformation` VALUES (61, 'ChrisxCN', '123456', '岑浩杨', '22', '男', '15625794682', 'cen156207150@gmail.com', '202004272138430484userimg.png', '2020-04-27 18:13:44', '2020-04-27 21:38:45', 'AS109', '广东省', '佛山市', '顺德区乐从镇', '顺联北区2座A12号');
INSERT INTO `userinformation` VALUES (62, 'LollipopXC', 'acog5201314', 'CenHY', '22', '男', '18666540292', 'dmc156207150@Outlook.com', '202004272209110960userimg.png', '2020-04-27 18:15:00', '2020-04-27 22:09:13', 'AS109', '广东省', '佛山市', '顺德区乐从镇', '荔南路公交站莲塘路一街20号');
INSERT INTO `userinformation` VALUES (63, '飞翔的小胖子', '123456', '吴广得', '26', '男', '13000549987', 'gtpiqknr008823@163.net', 'static.jpg', '2020-04-27 18:16:25', '2020-04-27 18:16:25', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (64, '飞翔的公鹿', '123456', '好提吴', '21', '女', '13000549986', 'focdmj2338@netease.com', 'static.jpg', '2020-04-27 18:17:41', '2020-04-27 18:17:41', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (65, '咸狼赫萝', '123456', '夜刀神十香', '16', '男', '13202834167', 'p421@sohu.com', '202004272258350440userimg.png', '2020-04-27 18:20:02', '2020-04-27 22:59:07', 'AS109', '广东省', '佛山市', '三水区', '三水中心幼儿园');
INSERT INTO `userinformation` VALUES (66, '国家java攻城狮', '123456', '李兴华', '32', '男', '13000549985', 'qvaiaghanusfw6@netease.co', 'static.jpg', '2020-04-27 18:21:16', '2020-04-27 18:21:16', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (67, '任天堂天下第一', '123456', '霍英涛', '23', '男', '15112983458', 'cajgn716@eyou.com', 'static.jpg', '2020-04-27 18:24:04', '2020-04-27 18:24:04', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (68, '一个快乐的小天使', '123456', '徐暖暖', '18', '女', '13000549984', 'lwchwbsg08@citiz.com', '202004272310110866userimg.png', '2020-04-27 18:25:18', '2020-04-27 23:10:11', 'AS109', '广东省', '佛山市', '三水区', '后街12号');
INSERT INTO `userinformation` VALUES (69, 'SaltedFISSH', '123456', '曹先生', '24', '男', '13000549983', 'jwbjrannuagd@hotmail.com', 'static.jpg', '2020-04-27 18:27:38', '2020-04-27 18:27:38', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (70, 'gojtukia', '123456', '小丹丹', '18', '女', '13318343833', 'jbn@eastday.com', 'static.jpg', '2020-04-27 18:32:32', '2020-04-27 18:32:32', 'AS109', '', '', '', '(未填写)');
INSERT INTO `userinformation` VALUES (71, 'FlyBird', '123456', '', '19', '', '13000549972', 'pfbpg@eastday.com', 'static.jpg', '2020-04-28 10:23:47', '2020-04-28 10:23:47', 'AS109', '', '', '', '(未填写)');

-- ----------------------------
-- Table structure for useropinion
-- ----------------------------
DROP TABLE IF EXISTS `useropinion`;
CREATE TABLE `useropinion`  (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `uid` int(12) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `context` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `useropinion_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `userinformation` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of useropinion
-- ----------------------------
INSERT INTO `useropinion` VALUES (1, 4, 'Nova', '希望能增加更多有趣实用的功能。', '2019-11-10 23:16:47');
INSERT INTO `useropinion` VALUES (4, 4, 'Nova', 'test', '2020-04-13 21:40:51');
INSERT INTO `useropinion` VALUES (5, 4, 'Nova', '需要更多的商品更多的用户！', '2020-04-14 16:54:06');
INSERT INTO `useropinion` VALUES (6, 17, 'MinatoKazari', '希望网站越做越好', '2020-04-15 21:30:59');
INSERT INTO `useropinion` VALUES (7, 60, 'JERRY飞翔者', '还需要更努力，添加更多的功能，更美的用户界面', '2020-04-27 23:31:52');

SET FOREIGN_KEY_CHECKS = 1;
