/*
Navicat MySQL Data Transfer

Source Server         : cailele
Source Server Version : 50173
Source Host           : 101.1.25.90:3306
Source Database       : lecai

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2015-04-29 02:56:02
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `banks`
-- ----------------------------
DROP TABLE IF EXISTS `banks`;
CREATE TABLE `banks` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '银行ID',
  `code` varchar(10) CHARACTER SET latin1 DEFAULT NULL COMMENT '银行编码',
  `name` varchar(50) DEFAULT NULL COMMENT '行银名称',
  `sort` int(10) DEFAULT NULL COMMENT '序排',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='银行表';

-- ----------------------------
-- Records of banks
-- ----------------------------
INSERT INTO `banks` VALUES ('1', null, '工商银行', '1');
INSERT INTO `banks` VALUES ('2', null, '农业银行', '2');
INSERT INTO `banks` VALUES ('3', null, '中国银行', '3');
INSERT INTO `banks` VALUES ('4', null, '建设银行', '4');
INSERT INTO `banks` VALUES ('5', null, '交通银行', '5');
INSERT INTO `banks` VALUES ('6', null, '民生银行', '6');
INSERT INTO `banks` VALUES ('7', null, '中信银行', '7');
INSERT INTO `banks` VALUES ('8', null, '招商银行', '8');
INSERT INTO `banks` VALUES ('9', null, '浦东发展银行', '9');
INSERT INTO `banks` VALUES ('10', null, '深圳发展银行', '10');
INSERT INTO `banks` VALUES ('11', null, '光大银行', '11');
INSERT INTO `banks` VALUES ('12', null, '广东发展银行', '12');
INSERT INTO `banks` VALUES ('13', null, '华夏银行', '13');
INSERT INTO `banks` VALUES ('14', null, '花旗银行', '14');
INSERT INTO `banks` VALUES ('15', null, '汇丰银行', '15');

-- ----------------------------
-- Table structure for `chase`
-- ----------------------------
DROP TABLE IF EXISTS `chase`;
CREATE TABLE `chase` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户追号id',
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '追号开始时间',
  `user_id` int(10) DEFAULT NULL COMMENT '用户id',
  `title` varchar(100) DEFAULT '' COMMENT '追号方案标题',
  `description` varchar(1000) DEFAULT NULL COMMENT '方案描述',
  `lottery_id` int(10) DEFAULT NULL COMMENT '彩种id',
  `buy_type_id` int(10) DEFAULT NULL COMMENT '用户购彩类型id',
  `lottery_number` varchar(1000) DEFAULT NULL COMMENT '所追号码',
  `multiple` int(10) DEFAULT NULL COMMENT '追号倍数',
  `isuse_money` decimal(19,4) DEFAULT NULL COMMENT '方案金额',
  `quashed` tinyint(1) DEFAULT NULL COMMENT '是否撤销(1,是 ;2，否)',
  `auto_stop_at_win_money` decimal(19,4) DEFAULT NULL COMMENT '当所追的期号当中，中奖金额达到多少时停止追号',
  `secrecy_level` int(10) DEFAULT NULL COMMENT '方案的权限',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户追号表';

-- ----------------------------
-- Records of chase
-- ----------------------------

-- ----------------------------
-- Table structure for `chase_detail`
-- ----------------------------
DROP TABLE IF EXISTS `chase_detail`;
CREATE TABLE `chase_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '追号明细id',
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  `user_id` int(10) DEFAULT NULL COMMENT '用户id',
  `chase_id` int(10) DEFAULT NULL COMMENT '用户追号id',
  `isuse_id` int(10) DEFAULT NULL COMMENT '彩票期号信息及开奖结果表id',
  `lottery_number` varchar(1000) DEFAULT NULL COMMENT '所追的号码',
  `quashed` tinyint(1) DEFAULT NULL COMMENT '是否撤销(1,是 2，否)',
  `buyed` tinyint(1) DEFAULT NULL COMMENT '是否已出票(1,是；2否)',
  `scheme_id` int(10) DEFAULT NULL COMMENT '购彩的详细列表ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户追号明细表';

-- ----------------------------
-- Records of chase_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `city`
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(10) NOT NULL DEFAULT '0' COMMENT '城市id',
  `province_id` int(10) DEFAULT NULL COMMENT '属所省份id',
  `name` varchar(50) DEFAULT NULL COMMENT '市城名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='城市表';

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '1', '安庆');
INSERT INTO `city` VALUES ('2', '1', '蚌埠');
INSERT INTO `city` VALUES ('3', '1', '巢湖');
INSERT INTO `city` VALUES ('4', '1', '池州');
INSERT INTO `city` VALUES ('5', '1', '滁州');
INSERT INTO `city` VALUES ('6', '1', '阜阳');
INSERT INTO `city` VALUES ('7', '1', '合肥');
INSERT INTO `city` VALUES ('8', '1', '淮北');
INSERT INTO `city` VALUES ('9', '1', '淮南');
INSERT INTO `city` VALUES ('10', '1', '黄山');
INSERT INTO `city` VALUES ('11', '1', '六安');
INSERT INTO `city` VALUES ('12', '1', '马鞍山');
INSERT INTO `city` VALUES ('13', '1', '宿州');
INSERT INTO `city` VALUES ('14', '1', '铜陵');
INSERT INTO `city` VALUES ('15', '1', '芜湖');
INSERT INTO `city` VALUES ('16', '1', '宣城');
INSERT INTO `city` VALUES ('17', '1', '亳州');
INSERT INTO `city` VALUES ('18', '2', '东城区');
INSERT INTO `city` VALUES ('19', '3', '福州');
INSERT INTO `city` VALUES ('20', '3', '龙岩');
INSERT INTO `city` VALUES ('21', '3', '南平');
INSERT INTO `city` VALUES ('22', '3', '宁德');
INSERT INTO `city` VALUES ('23', '3', '莆田');
INSERT INTO `city` VALUES ('24', '3', '泉州');
INSERT INTO `city` VALUES ('25', '3', '三明');
INSERT INTO `city` VALUES ('26', '3', '厦门');
INSERT INTO `city` VALUES ('27', '3', '漳州');
INSERT INTO `city` VALUES ('28', '4', '白银');
INSERT INTO `city` VALUES ('29', '4', '定西');
INSERT INTO `city` VALUES ('30', '4', '甘南');
INSERT INTO `city` VALUES ('31', '4', '嘉峪关');
INSERT INTO `city` VALUES ('32', '4', '金昌');
INSERT INTO `city` VALUES ('33', '4', '酒泉');
INSERT INTO `city` VALUES ('34', '4', '兰州');
INSERT INTO `city` VALUES ('35', '4', '临夏');
INSERT INTO `city` VALUES ('36', '4', '陇南');
INSERT INTO `city` VALUES ('37', '4', '平凉');
INSERT INTO `city` VALUES ('38', '4', '庆阳');
INSERT INTO `city` VALUES ('39', '4', '天水');
INSERT INTO `city` VALUES ('40', '4', '武威');
INSERT INTO `city` VALUES ('41', '4', '张掖');
INSERT INTO `city` VALUES ('42', '5', '潮州');
INSERT INTO `city` VALUES ('43', '5', '东莞');
INSERT INTO `city` VALUES ('44', '5', '佛山');
INSERT INTO `city` VALUES ('45', '5', '广州');
INSERT INTO `city` VALUES ('46', '5', '河源');
INSERT INTO `city` VALUES ('47', '5', '惠州');
INSERT INTO `city` VALUES ('48', '5', '江门');
INSERT INTO `city` VALUES ('49', '5', '揭阳');
INSERT INTO `city` VALUES ('50', '5', '茂名');
INSERT INTO `city` VALUES ('51', '5', '梅州');
INSERT INTO `city` VALUES ('52', '5', '清远');
INSERT INTO `city` VALUES ('53', '5', '汕头');
INSERT INTO `city` VALUES ('54', '5', '汕尾');
INSERT INTO `city` VALUES ('55', '5', '韶关');
INSERT INTO `city` VALUES ('56', '5', '深圳');
INSERT INTO `city` VALUES ('57', '5', '阳江');
INSERT INTO `city` VALUES ('58', '5', '云浮');
INSERT INTO `city` VALUES ('59', '5', '湛江');
INSERT INTO `city` VALUES ('60', '5', '肇庆');
INSERT INTO `city` VALUES ('61', '5', '中山');
INSERT INTO `city` VALUES ('62', '5', '珠海');
INSERT INTO `city` VALUES ('63', '6', '百色');
INSERT INTO `city` VALUES ('64', '6', '北海');
INSERT INTO `city` VALUES ('65', '6', '崇左');
INSERT INTO `city` VALUES ('66', '6', '防城港');
INSERT INTO `city` VALUES ('67', '6', '桂林');
INSERT INTO `city` VALUES ('68', '6', '贵港');
INSERT INTO `city` VALUES ('69', '6', '河池');
INSERT INTO `city` VALUES ('70', '6', '贺州');
INSERT INTO `city` VALUES ('71', '6', '来宾');
INSERT INTO `city` VALUES ('72', '6', '柳州');
INSERT INTO `city` VALUES ('73', '6', '南宁');
INSERT INTO `city` VALUES ('74', '6', '钦州');
INSERT INTO `city` VALUES ('75', '6', '梧州');
INSERT INTO `city` VALUES ('76', '6', '玉林');
INSERT INTO `city` VALUES ('77', '7', '安顺');
INSERT INTO `city` VALUES ('78', '7', '毕节');
INSERT INTO `city` VALUES ('79', '7', '贵阳');
INSERT INTO `city` VALUES ('80', '7', '六盘水');
INSERT INTO `city` VALUES ('81', '7', '黔东南');
INSERT INTO `city` VALUES ('82', '7', '黔南');
INSERT INTO `city` VALUES ('83', '7', '黔西南');
INSERT INTO `city` VALUES ('84', '7', '铜仁');
INSERT INTO `city` VALUES ('85', '7', '遵义');
INSERT INTO `city` VALUES ('86', '8', '白沙');
INSERT INTO `city` VALUES ('87', '8', '保亭');
INSERT INTO `city` VALUES ('88', '8', '昌江');
INSERT INTO `city` VALUES ('89', '8', '澄迈');
INSERT INTO `city` VALUES ('90', '8', '定安');
INSERT INTO `city` VALUES ('91', '8', '东方');
INSERT INTO `city` VALUES ('92', '8', '海口');
INSERT INTO `city` VALUES ('93', '8', '乐东');
INSERT INTO `city` VALUES ('94', '8', '临高县');
INSERT INTO `city` VALUES ('95', '8', '陵水');
INSERT INTO `city` VALUES ('96', '8', '琼海');
INSERT INTO `city` VALUES ('97', '8', '琼中');
INSERT INTO `city` VALUES ('98', '8', '三亚');
INSERT INTO `city` VALUES ('99', '8', '屯昌');
INSERT INTO `city` VALUES ('100', '8', '万宁');
INSERT INTO `city` VALUES ('101', '8', '文昌');
INSERT INTO `city` VALUES ('102', '8', '五指山');
INSERT INTO `city` VALUES ('103', '8', '儋州');
INSERT INTO `city` VALUES ('104', '9', '保定');
INSERT INTO `city` VALUES ('105', '9', '沧州');
INSERT INTO `city` VALUES ('106', '9', '承德');
INSERT INTO `city` VALUES ('107', '9', '邯郸');
INSERT INTO `city` VALUES ('108', '9', '衡水');
INSERT INTO `city` VALUES ('109', '9', '廊坊');
INSERT INTO `city` VALUES ('110', '9', '秦皇岛');
INSERT INTO `city` VALUES ('111', '9', '石家庄');
INSERT INTO `city` VALUES ('112', '9', '唐山');
INSERT INTO `city` VALUES ('113', '9', '邢台');
INSERT INTO `city` VALUES ('114', '9', '张家口');
INSERT INTO `city` VALUES ('115', '10', '安阳');
INSERT INTO `city` VALUES ('116', '10', '鹤壁');
INSERT INTO `city` VALUES ('117', '10', '济源');
INSERT INTO `city` VALUES ('118', '10', '焦作');
INSERT INTO `city` VALUES ('119', '10', '开封');
INSERT INTO `city` VALUES ('120', '10', '洛阳');
INSERT INTO `city` VALUES ('121', '10', '南阳');
INSERT INTO `city` VALUES ('122', '10', '平顶山');
INSERT INTO `city` VALUES ('123', '10', '三门峡');
INSERT INTO `city` VALUES ('124', '10', '商丘');
INSERT INTO `city` VALUES ('125', '10', '新乡');
INSERT INTO `city` VALUES ('126', '10', '信阳');
INSERT INTO `city` VALUES ('127', '10', '许昌');
INSERT INTO `city` VALUES ('128', '10', '郑州');
INSERT INTO `city` VALUES ('129', '10', '周口');
INSERT INTO `city` VALUES ('130', '10', '驻马店');
INSERT INTO `city` VALUES ('131', '10', '漯河');
INSERT INTO `city` VALUES ('132', '10', '濮阳');
INSERT INTO `city` VALUES ('133', '11', '大庆');
INSERT INTO `city` VALUES ('134', '11', '大兴安岭');
INSERT INTO `city` VALUES ('135', '11', '哈尔滨');
INSERT INTO `city` VALUES ('136', '11', '鹤岗');
INSERT INTO `city` VALUES ('137', '11', '黑河');
INSERT INTO `city` VALUES ('138', '11', '鸡西');
INSERT INTO `city` VALUES ('139', '11', '佳木斯');
INSERT INTO `city` VALUES ('140', '11', '牡丹江');
INSERT INTO `city` VALUES ('141', '11', '七台河');
INSERT INTO `city` VALUES ('142', '11', '齐齐哈尔');
INSERT INTO `city` VALUES ('143', '11', '双鸭山');
INSERT INTO `city` VALUES ('144', '11', '绥化');
INSERT INTO `city` VALUES ('145', '11', '伊春');
INSERT INTO `city` VALUES ('146', '12', '鄂州');
INSERT INTO `city` VALUES ('147', '12', '恩施');
INSERT INTO `city` VALUES ('148', '12', '黄冈');
INSERT INTO `city` VALUES ('149', '12', '黄石');
INSERT INTO `city` VALUES ('150', '12', '荆门');
INSERT INTO `city` VALUES ('151', '12', '荆州');
INSERT INTO `city` VALUES ('152', '12', '潜江');
INSERT INTO `city` VALUES ('153', '12', '神农架');
INSERT INTO `city` VALUES ('154', '12', '十堰');
INSERT INTO `city` VALUES ('155', '12', '随州');
INSERT INTO `city` VALUES ('156', '12', '天门');
INSERT INTO `city` VALUES ('157', '12', '武汉');
INSERT INTO `city` VALUES ('158', '12', '仙桃');
INSERT INTO `city` VALUES ('159', '12', '咸宁');
INSERT INTO `city` VALUES ('160', '12', '襄樊');
INSERT INTO `city` VALUES ('161', '12', '孝感');
INSERT INTO `city` VALUES ('162', '12', '宜昌');
INSERT INTO `city` VALUES ('163', '13', '常德');
INSERT INTO `city` VALUES ('164', '13', '长沙');
INSERT INTO `city` VALUES ('165', '13', '郴州');
INSERT INTO `city` VALUES ('166', '13', '衡阳');
INSERT INTO `city` VALUES ('167', '13', '怀化');
INSERT INTO `city` VALUES ('168', '13', '娄底');
INSERT INTO `city` VALUES ('169', '13', '邵阳');
INSERT INTO `city` VALUES ('170', '13', '湘潭');
INSERT INTO `city` VALUES ('171', '13', '湘西');
INSERT INTO `city` VALUES ('172', '13', '益阳');
INSERT INTO `city` VALUES ('173', '13', '永州');
INSERT INTO `city` VALUES ('174', '13', '岳阳');
INSERT INTO `city` VALUES ('175', '13', '张家界');
INSERT INTO `city` VALUES ('176', '13', '株洲');
INSERT INTO `city` VALUES ('177', '14', '白城');
INSERT INTO `city` VALUES ('178', '14', '白山');
INSERT INTO `city` VALUES ('179', '14', '长春');
INSERT INTO `city` VALUES ('180', '14', '吉林');
INSERT INTO `city` VALUES ('181', '14', '辽源');
INSERT INTO `city` VALUES ('182', '14', '四平');
INSERT INTO `city` VALUES ('183', '14', '松原');
INSERT INTO `city` VALUES ('184', '14', '通化');
INSERT INTO `city` VALUES ('185', '14', '延边');
INSERT INTO `city` VALUES ('186', '15', '常州');
INSERT INTO `city` VALUES ('187', '15', '淮安');
INSERT INTO `city` VALUES ('188', '15', '连云港');
INSERT INTO `city` VALUES ('189', '15', '南京');
INSERT INTO `city` VALUES ('190', '15', '南通');
INSERT INTO `city` VALUES ('191', '15', '苏州');
INSERT INTO `city` VALUES ('192', '15', '宿迁');
INSERT INTO `city` VALUES ('193', '15', '泰州');
INSERT INTO `city` VALUES ('194', '15', '无锡');
INSERT INTO `city` VALUES ('195', '15', '徐州');
INSERT INTO `city` VALUES ('196', '15', '盐城');
INSERT INTO `city` VALUES ('197', '15', '扬州');
INSERT INTO `city` VALUES ('198', '15', '镇江');
INSERT INTO `city` VALUES ('199', '16', '抚州');
INSERT INTO `city` VALUES ('200', '16', '赣州');
INSERT INTO `city` VALUES ('201', '16', '吉安');
INSERT INTO `city` VALUES ('202', '16', '景德镇');
INSERT INTO `city` VALUES ('203', '16', '九江');
INSERT INTO `city` VALUES ('204', '16', '南昌');
INSERT INTO `city` VALUES ('205', '16', '萍乡');
INSERT INTO `city` VALUES ('206', '16', '上饶');
INSERT INTO `city` VALUES ('207', '16', '新余');
INSERT INTO `city` VALUES ('208', '16', '宜春');
INSERT INTO `city` VALUES ('209', '16', '鹰潭');
INSERT INTO `city` VALUES ('210', '17', '鞍山');
INSERT INTO `city` VALUES ('211', '17', '本溪');
INSERT INTO `city` VALUES ('212', '17', '朝阳');
INSERT INTO `city` VALUES ('213', '17', '大连');
INSERT INTO `city` VALUES ('214', '17', '丹东');
INSERT INTO `city` VALUES ('215', '17', '抚顺');
INSERT INTO `city` VALUES ('216', '17', '阜新');
INSERT INTO `city` VALUES ('217', '17', '葫芦岛');
INSERT INTO `city` VALUES ('218', '17', '锦州');
INSERT INTO `city` VALUES ('219', '17', '辽阳');
INSERT INTO `city` VALUES ('220', '17', '盘锦');
INSERT INTO `city` VALUES ('221', '17', '沈阳');
INSERT INTO `city` VALUES ('222', '17', '铁岭');
INSERT INTO `city` VALUES ('223', '17', '营口');
INSERT INTO `city` VALUES ('224', '18', '阿拉善盟');
INSERT INTO `city` VALUES ('225', '18', '巴彦淖尔盟');
INSERT INTO `city` VALUES ('226', '18', '包头');
INSERT INTO `city` VALUES ('227', '18', '赤峰');
INSERT INTO `city` VALUES ('228', '18', '鄂尔多斯');
INSERT INTO `city` VALUES ('229', '18', '呼和浩特');
INSERT INTO `city` VALUES ('230', '18', '呼伦贝尔');
INSERT INTO `city` VALUES ('231', '18', '通辽');
INSERT INTO `city` VALUES ('232', '18', '乌海');
INSERT INTO `city` VALUES ('233', '18', '乌兰察布盟');
INSERT INTO `city` VALUES ('234', '18', '锡林郭勒盟');
INSERT INTO `city` VALUES ('235', '18', '兴安盟');
INSERT INTO `city` VALUES ('236', '19', '固原');
INSERT INTO `city` VALUES ('237', '19', '石嘴山');
INSERT INTO `city` VALUES ('238', '19', '吴忠');
INSERT INTO `city` VALUES ('239', '19', '银川');
INSERT INTO `city` VALUES ('240', '20', '果洛');
INSERT INTO `city` VALUES ('241', '20', '海北');
INSERT INTO `city` VALUES ('242', '20', '海东');
INSERT INTO `city` VALUES ('243', '20', '海南');
INSERT INTO `city` VALUES ('244', '20', '海西');
INSERT INTO `city` VALUES ('245', '20', '黄南');
INSERT INTO `city` VALUES ('246', '20', '西宁');
INSERT INTO `city` VALUES ('247', '20', '玉树');
INSERT INTO `city` VALUES ('248', '21', '滨州');
INSERT INTO `city` VALUES ('249', '21', '德州');
INSERT INTO `city` VALUES ('250', '21', '东营');
INSERT INTO `city` VALUES ('251', '21', '菏泽');
INSERT INTO `city` VALUES ('252', '21', '济南');
INSERT INTO `city` VALUES ('253', '21', '济宁');
INSERT INTO `city` VALUES ('254', '21', '莱芜');
INSERT INTO `city` VALUES ('255', '21', '聊城');
INSERT INTO `city` VALUES ('256', '21', '临沂');
INSERT INTO `city` VALUES ('257', '21', '青岛');
INSERT INTO `city` VALUES ('258', '21', '日照');
INSERT INTO `city` VALUES ('259', '21', '泰安');
INSERT INTO `city` VALUES ('260', '21', '威海');
INSERT INTO `city` VALUES ('261', '21', '潍坊');
INSERT INTO `city` VALUES ('262', '21', '烟台');
INSERT INTO `city` VALUES ('263', '21', '枣庄');
INSERT INTO `city` VALUES ('264', '21', '淄博');
INSERT INTO `city` VALUES ('265', '22', '长治');
INSERT INTO `city` VALUES ('266', '22', '大同');
INSERT INTO `city` VALUES ('267', '22', '晋城');
INSERT INTO `city` VALUES ('268', '22', '晋中');
INSERT INTO `city` VALUES ('269', '22', '临汾');
INSERT INTO `city` VALUES ('270', '22', '吕梁');
INSERT INTO `city` VALUES ('271', '22', '朔州');
INSERT INTO `city` VALUES ('272', '22', '太原');
INSERT INTO `city` VALUES ('273', '22', '忻州');
INSERT INTO `city` VALUES ('274', '22', '阳泉');
INSERT INTO `city` VALUES ('275', '22', '运城');
INSERT INTO `city` VALUES ('276', '23', '安康');
INSERT INTO `city` VALUES ('277', '23', '宝鸡');
INSERT INTO `city` VALUES ('278', '23', '汉中');
INSERT INTO `city` VALUES ('279', '23', '商洛');
INSERT INTO `city` VALUES ('280', '23', '铜川');
INSERT INTO `city` VALUES ('281', '23', '渭南');
INSERT INTO `city` VALUES ('282', '23', '西安');
INSERT INTO `city` VALUES ('283', '23', '咸阳');
INSERT INTO `city` VALUES ('284', '23', '延安');
INSERT INTO `city` VALUES ('285', '23', '榆林');
INSERT INTO `city` VALUES ('286', '24', '上海');
INSERT INTO `city` VALUES ('287', '25', '阿坝');
INSERT INTO `city` VALUES ('288', '25', '巴中');
INSERT INTO `city` VALUES ('289', '25', '成都');
INSERT INTO `city` VALUES ('290', '25', '达州');
INSERT INTO `city` VALUES ('291', '25', '德阳');
INSERT INTO `city` VALUES ('292', '25', '甘孜');
INSERT INTO `city` VALUES ('293', '25', '广安');
INSERT INTO `city` VALUES ('294', '25', '广元');
INSERT INTO `city` VALUES ('295', '25', '乐山');
INSERT INTO `city` VALUES ('296', '25', '凉山');
INSERT INTO `city` VALUES ('297', '25', '眉山');
INSERT INTO `city` VALUES ('298', '25', '绵阳');
INSERT INTO `city` VALUES ('299', '25', '南充');
INSERT INTO `city` VALUES ('300', '25', '内江');
INSERT INTO `city` VALUES ('301', '25', '攀枝花');
INSERT INTO `city` VALUES ('302', '25', '遂宁');
INSERT INTO `city` VALUES ('303', '25', '雅安');
INSERT INTO `city` VALUES ('304', '25', '宜宾');
INSERT INTO `city` VALUES ('305', '25', '资阳');
INSERT INTO `city` VALUES ('306', '25', '自贡');
INSERT INTO `city` VALUES ('307', '25', '泸州');
INSERT INTO `city` VALUES ('308', '26', '天津');
INSERT INTO `city` VALUES ('309', '27', '阿里');
INSERT INTO `city` VALUES ('310', '27', '昌都');
INSERT INTO `city` VALUES ('311', '27', '拉萨');
INSERT INTO `city` VALUES ('312', '27', '林芝');
INSERT INTO `city` VALUES ('313', '27', '那曲');
INSERT INTO `city` VALUES ('314', '27', '日喀则');
INSERT INTO `city` VALUES ('315', '27', '山南');
INSERT INTO `city` VALUES ('316', '28', '阿克苏');
INSERT INTO `city` VALUES ('317', '28', '阿拉尔');
INSERT INTO `city` VALUES ('318', '28', '巴音郭楞');
INSERT INTO `city` VALUES ('319', '28', '博尔塔拉');
INSERT INTO `city` VALUES ('320', '28', '昌吉');
INSERT INTO `city` VALUES ('321', '28', '哈密');
INSERT INTO `city` VALUES ('322', '28', '和田');
INSERT INTO `city` VALUES ('323', '28', '喀什');
INSERT INTO `city` VALUES ('324', '28', '克拉玛依');
INSERT INTO `city` VALUES ('325', '28', '克孜勒苏柯尔克孜');
INSERT INTO `city` VALUES ('326', '28', '石河子');
INSERT INTO `city` VALUES ('327', '28', '图木舒克');
INSERT INTO `city` VALUES ('328', '28', '吐鲁番');
INSERT INTO `city` VALUES ('329', '28', '乌鲁木齐');
INSERT INTO `city` VALUES ('330', '28', '五家渠');
INSERT INTO `city` VALUES ('331', '28', '伊犁');
INSERT INTO `city` VALUES ('332', '29', '保山');
INSERT INTO `city` VALUES ('333', '29', '楚雄');
INSERT INTO `city` VALUES ('334', '29', '大理');
INSERT INTO `city` VALUES ('335', '29', '德宏');
INSERT INTO `city` VALUES ('336', '29', '迪庆');
INSERT INTO `city` VALUES ('337', '29', '红河');
INSERT INTO `city` VALUES ('338', '29', '昆明');
INSERT INTO `city` VALUES ('339', '29', '丽江');
INSERT INTO `city` VALUES ('340', '29', '临沧');
INSERT INTO `city` VALUES ('341', '29', '怒江');
INSERT INTO `city` VALUES ('342', '29', '曲靖');
INSERT INTO `city` VALUES ('343', '29', '思茅');
INSERT INTO `city` VALUES ('344', '29', '文山');
INSERT INTO `city` VALUES ('345', '29', '西双版纳');
INSERT INTO `city` VALUES ('346', '29', '玉溪');
INSERT INTO `city` VALUES ('347', '29', '昭通');
INSERT INTO `city` VALUES ('348', '30', '杭州');
INSERT INTO `city` VALUES ('349', '30', '湖州');
INSERT INTO `city` VALUES ('350', '30', '嘉兴');
INSERT INTO `city` VALUES ('351', '30', '金华');
INSERT INTO `city` VALUES ('352', '30', '丽水');
INSERT INTO `city` VALUES ('353', '30', '宁波');
INSERT INTO `city` VALUES ('354', '30', '绍兴');
INSERT INTO `city` VALUES ('355', '30', '台州');
INSERT INTO `city` VALUES ('356', '30', '温州');
INSERT INTO `city` VALUES ('357', '30', '舟山');
INSERT INTO `city` VALUES ('358', '30', '衢州');
INSERT INTO `city` VALUES ('359', '31', '万州区');
INSERT INTO `city` VALUES ('360', '32', '香港');
INSERT INTO `city` VALUES ('361', '33', '澳门');
INSERT INTO `city` VALUES ('362', '34', '台湾');
INSERT INTO `city` VALUES ('376', '31', '涪陵区');
INSERT INTO `city` VALUES ('377', '31', '渝中区');
INSERT INTO `city` VALUES ('378', '31', '大渡口区');
INSERT INTO `city` VALUES ('379', '31', '江北区');
INSERT INTO `city` VALUES ('380', '31', '沙坪坝区');
INSERT INTO `city` VALUES ('381', '31', '九龙坡区');
INSERT INTO `city` VALUES ('382', '31', '南岸区');
INSERT INTO `city` VALUES ('383', '31', '北碚区');
INSERT INTO `city` VALUES ('384', '31', '万盛区');
INSERT INTO `city` VALUES ('385', '31', '双桥区');
INSERT INTO `city` VALUES ('386', '31', '渝北区');
INSERT INTO `city` VALUES ('387', '31', '巴南区');
INSERT INTO `city` VALUES ('388', '31', '黔江区');
INSERT INTO `city` VALUES ('389', '31', '长寿区');
INSERT INTO `city` VALUES ('390', '31', '江津区');
INSERT INTO `city` VALUES ('391', '31', '合川区');
INSERT INTO `city` VALUES ('392', '31', '永川区');
INSERT INTO `city` VALUES ('393', '31', '南川区');
INSERT INTO `city` VALUES ('394', '31', '綦江县');
INSERT INTO `city` VALUES ('395', '31', '潼南县');
INSERT INTO `city` VALUES ('396', '31', '铜梁县');
INSERT INTO `city` VALUES ('397', '31', '大足县');
INSERT INTO `city` VALUES ('398', '31', '荣昌县');
INSERT INTO `city` VALUES ('399', '31', '璧山县');
INSERT INTO `city` VALUES ('400', '31', '梁平县');
INSERT INTO `city` VALUES ('401', '31', '城口县');
INSERT INTO `city` VALUES ('402', '31', '丰都县');
INSERT INTO `city` VALUES ('403', '31', '垫江县');
INSERT INTO `city` VALUES ('404', '31', '武隆县');
INSERT INTO `city` VALUES ('405', '31', '忠县');
INSERT INTO `city` VALUES ('406', '31', '开县');
INSERT INTO `city` VALUES ('407', '31', '云阳县');
INSERT INTO `city` VALUES ('408', '31', '奉节县');
INSERT INTO `city` VALUES ('409', '31', '巫山县');
INSERT INTO `city` VALUES ('410', '31', '巫溪县');
INSERT INTO `city` VALUES ('411', '31', '石柱土家族自治县');
INSERT INTO `city` VALUES ('412', '31', '秀山土家族苗族自治县');
INSERT INTO `city` VALUES ('413', '31', '酉阳土家族苗族自治县');
INSERT INTO `city` VALUES ('414', '31', '彭水苗族土家族自治县');
INSERT INTO `city` VALUES ('415', '2', '西城区');
INSERT INTO `city` VALUES ('416', '2', '崇文区');
INSERT INTO `city` VALUES ('417', '2', '宣武区');
INSERT INTO `city` VALUES ('418', '2', '朝阳区');
INSERT INTO `city` VALUES ('419', '2', '丰台区');
INSERT INTO `city` VALUES ('420', '2', '石景山区');
INSERT INTO `city` VALUES ('421', '2', '海淀区');
INSERT INTO `city` VALUES ('422', '2', '门头沟区');
INSERT INTO `city` VALUES ('423', '2', '房山区');
INSERT INTO `city` VALUES ('424', '2', '通州区');
INSERT INTO `city` VALUES ('425', '2', '顺义区');
INSERT INTO `city` VALUES ('426', '2', '昌平区');
INSERT INTO `city` VALUES ('427', '2', '大兴区');
INSERT INTO `city` VALUES ('428', '2', '怀柔区');
INSERT INTO `city` VALUES ('429', '2', '平谷区');
INSERT INTO `city` VALUES ('430', '2', '密云县');
INSERT INTO `city` VALUES ('431', '2', '延庆县');

-- ----------------------------
-- Table structure for `isuse`
-- ----------------------------
DROP TABLE IF EXISTS `isuse`;
CREATE TABLE `isuse` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '彩票期号id',
  `lottery_id` int(10) DEFAULT NULL COMMENT '所购彩种的ID',
  `isuse` varchar(20) DEFAULT NULL COMMENT '期号，和lottery_id组成逻辑主键（示例：重庆时时彩-20150429024， 双色球-2015049）',
  `start_datetime` timestamp NULL DEFAULT NULL COMMENT '期当开始投注时间（每期的开始时间）',
  `end_datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '当期停止投注时间（每期的结束时间）',
  `chase_executed` tinyint(1) DEFAULT NULL COMMENT '追号任务是否已经执行(1,已执行 2，未执行)',
  `win_lottery_number` varchar(100) DEFAULT '' COMMENT '开奖号码',
  `open_affiche` varchar(300) DEFAULT NULL COMMENT '开奖内容',
  `is_open` tinyint(1) DEFAULT NULL COMMENT '否是已经开奖（1，已开奖 2，未开奖）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2015042204 DEFAULT CHARSET=utf8 COMMENT='彩票期号信息及开奖结果表';

-- ----------------------------
-- Records of isuse
-- ----------------------------
INSERT INTO `isuse` VALUES ('2015042201', '3', null, '2015-04-22 23:40:20', '2015-04-22 23:38:10', null, '888888', '恭喜您，大奖啊', '1');
INSERT INTO `isuse` VALUES ('2015042202', '3', null, null, '2015-04-23 23:02:01', null, '823238', null, '1');
INSERT INTO `isuse` VALUES ('2015042203', '4', null, null, '2015-04-23 23:02:07', null, '545466', null, '1');

-- ----------------------------
-- Table structure for `login_log`
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户登陆信息id',
  `user_id` int(10) DEFAULT NULL COMMENT '户用id',
  `login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登陆时间',
  `ip` varchar(50) DEFAULT NULL COMMENT '陆登ip地址',
  `description` varchar(100) DEFAULT NULL COMMENT '述描',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='储用户登录信息表';

-- ----------------------------
-- Records of login_log
-- ----------------------------

-- ----------------------------
-- Table structure for `lottery`
-- ----------------------------
DROP TABLE IF EXISTS `lottery`;
CREATE TABLE `lottery` (
  `id` int(10) NOT NULL DEFAULT '0' COMMENT '彩票种类id',
  `name` varchar(50) DEFAULT NULL COMMENT '彩种名称',
  `code` varchar(20) DEFAULT NULL COMMENT '种彩的缩写',
  `can_chase` tinyint(1) DEFAULT NULL COMMENT '否是可以追号(1,是 2,否)',
  `is_used` tinyint(1) DEFAULT NULL COMMENT '是否使用(1,是 2，否)',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `agreement_url` varchar(100) DEFAULT NULL COMMENT '本站协议内容url',
  `explain_url` varchar(100) DEFAULT NULL COMMENT '官方规则url',
  `base_play_page_url` varchar(100) DEFAULT '' COMMENT '购彩页面url',
  `win_lottery_exemple` varchar(50) DEFAULT NULL COMMENT '开奖号码示例',
  `lottery_cycle` varchar(50) DEFAULT '' COMMENT '开奖周期',
  `lottery_type_id` int(10) DEFAULT NULL COMMENT '彩种的类别（lottery_type表的id）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='彩票种类表';

-- ----------------------------
-- Records of lottery
-- ----------------------------
INSERT INTO `lottery` VALUES ('1', '胜负彩', 'SFC', '0', '1', '101', 'x', 'x', '01,02,03,04', '31030100111301', '', '2');
INSERT INTO `lottery` VALUES ('2', '四场进球彩', 'JQC', '0', '1', '103', 'x', 'xڝWlUm٠', '01,02,03,04', '31032202', '', '2');
INSERT INTO `lottery` VALUES ('3', '七星彩', 'QXC', '1', '1', '104', 'x', 'xڭXl', '01,02,03,04', '1234567', '周2,5,7', '4');
INSERT INTO `lottery` VALUES ('4', '数字排列', 'SZPL', '1', '1', '105', 'x', 'xڭV', '01,02,03,04', '12345', '天', '4');
INSERT INTO `lottery` VALUES ('5', '双色球', 'SSQ', '1', '1', '201', 'x', 'x', '01,02,03,04', '01 02 03 04 05 06 + 01 02 03 04', '周2,4,7', '9');
INSERT INTO `lottery` VALUES ('6', '福彩3D', 'FC3D', '1', '1', '202', 'x', 'xڝWoLSW', '01,02,03,04', '123', '天', '8');
INSERT INTO `lottery` VALUES ('7', '龙江36选7', 'LJ36X7', '1', '1', '301', 'x', 'xڭ}l', '01,02,03,04', '01 02 03 04 05 06 07 + 08', '周1,3,5', '9');
INSERT INTO `lottery` VALUES ('8', '龙江P62', 'LJP62', '1', '1', '302', 'x', 'xڭYlS', '01,02,03,04', '123456+0', '周1,2,3,4,5,6', '8');
INSERT INTO `lottery` VALUES ('9', '体彩22选5', 'TC22X5', '1', '1', '106', 'x', 'xڥXL', '01,02,03,04', '01 02 03 04 05', '天', '5');
INSERT INTO `lottery` VALUES ('10', '泛珠36选7', 'FZ36X7', '1', '1', '108', 'x', 'xڵXL', '01,02,03,04', '01 02 03 04 05 06 + 07', '周1,3,5', '5');
INSERT INTO `lottery` VALUES ('11', '楚天风采32选7', 'CTFC32X7', '1', '1', '401', 'x', 'x', '01,02,03,04', '01 02 03 04 05 06 07 + 08', '周1,3,5', '9');
INSERT INTO `lottery` VALUES ('12', '楚天风采22选5', 'CTFC22X5', '1', '1', '402', 'x', 'x', '01,02,03,04', '01 02 03 04 05', '天', '9');
INSERT INTO `lottery` VALUES ('13', '七乐彩', 'QLC', '1', '1', '203', 'x', 'x', '01,02,03,04', '01 02 03 04 05 06 07 + 08', '周2,5', '9');
INSERT INTO `lottery` VALUES ('14', '体彩29选7', 'TC29X7', '1', '1', '107', 'x', 'x', '01,02,03,04', '01 02 03 04 05 06 07 + 08', '周1,4,6', '5');
INSERT INTO `lottery` VALUES ('15', '六场半全场', 'LCBQC', '0', '1', '102', 'x', 'xڵXl', '01,02,03,04', '310301001113', '', '2');
INSERT INTO `lottery` VALUES ('16', '南粤风采36选7', 'NYFC36X7', '1', '1', '501', 'x', 'x', '01,02,03,04', '01 02 03 04 05 06 + 07', '周1,3,5', '9');
INSERT INTO `lottery` VALUES ('17', '南粤风采26选5', 'NYFC26X5', '1', '1', '502', 'x', 'x', '01,02,03,04', '01 02 03 04 05', '周2,4,7', '9');
INSERT INTO `lottery` VALUES ('18', '三晋风采21选5', 'SJFC21X5', '1', '1', '601', 'x', 'xڭ\rl', '01,02,03,04', '01 02 03 04 05', '周1,2,3,4,5,6', '9');
INSERT INTO `lottery` VALUES ('19', '篮彩', 'LCDC', '0', '1', '109', 'x', 'xڭYlS', '01,02,03,04', '1234', '', '3');
INSERT INTO `lottery` VALUES ('20', '深圳风采35选7', 'SZFC35X7', '1', '1', '701', 'x', 'xڽYl', '01,02,03,04', '01 02 03 04 05 06 07 + 08', '周3', '9');
INSERT INTO `lottery` VALUES ('21', '浙江15选5', 'ZJ15X5', '1', '1', '801', 'x', 'xڭY}l[', '01,02,03,04', '01 02 03 04 05', '天', '9');
INSERT INTO `lottery` VALUES ('22', '浙江风采4+1', 'ZJFC4J1', '1', '1', '802', 'x', 'xڭYl', '01,02,03,04', '12345', '天', '8');
INSERT INTO `lottery` VALUES ('23', '湖南风采22选5', 'HNFC22X5', '1', '1', '901', 'x', 'xڵX]LSW?', '01,02,03,04', '01 02 03 04 05', '天', '9');
INSERT INTO `lottery` VALUES ('24', '东方大乐透', 'DFDLT', '1', '1', '1001', 'x', 'xڵYL', '01,02,03,04', '01 02 03 04 05 06 07 + 08', '周1,3,6', '9');
INSERT INTO `lottery` VALUES ('25', '安徽风采25选5', 'AHFC25X5', '1', '1', '1101', 'x', 'xڕYl', '01,02,03,04', '01 02 03 04 05', '天', '9');
INSERT INTO `lottery` VALUES ('26', '安徽风采15选5', 'AHFC15X5', '1', '1', '1102', 'x', 'xڥY}lS', '01,02,03,04', '01 02 03 04 05', '天', '9');
INSERT INTO `lottery` VALUES ('27', '齐鲁风采23选5', 'QLFC23X5', '1', '1', '1201', 'x', 'xڵYl', '01,02,03,04', '01 02 03 04 05', '周2,4,7', '9');
INSERT INTO `lottery` VALUES ('28', '重庆时时彩', 'CQSSC', '1', '1', '1301', 'x', 'xڵY}L[', '01,02,03,04', '12345', '分10;10:00:00;72', '10');
INSERT INTO `lottery` VALUES ('29', '上海时时乐', 'SHSSL', '1', '1', '1401', 'x', 'xڕoL', '01,02,03,04', '123', '分30;10:30:00;23', '10');
INSERT INTO `lottery` VALUES ('30', '福建风采20选5', 'FJFC20X5', '1', '1', '1501', 'x', 'xڭY}lS', '01,02,03,04', '01 02 03 04 05', '天', '9');
INSERT INTO `lottery` VALUES ('31', '安徽风采5位数', 'AHFC5WS', '1', '1', '1103', 'x', 'xڕXL', '01,02,03,04', '12345', '天', '8');
INSERT INTO `lottery` VALUES ('32', '深圳快乐8', 'SZKL8', '1', '1', '702', 'x', 'x', '01,02,01,02', '01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17', '分5;09:05:00;179', '10');
INSERT INTO `lottery` VALUES ('33', '北京快乐8', 'BJKL8', '1', '1', '1601', 'x', 'x', '01,02,01,02', '01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17', '分5;09:05:00;179', '10');
INSERT INTO `lottery` VALUES ('34', '上海Keno游戏', 'SHKeno', '1', '1', '1002', 'x', 'x', '01,02,01,02', '01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17', '分5;07:50:00;192', '10');
INSERT INTO `lottery` VALUES ('35', '福建体彩31选7', 'FJTC31X7', '1', '1', '110', 'x', 'xڕYl', '01,02,03,04', '01 02 03 04 05 06 07 + 08', '周1,3,5,7', '5');
INSERT INTO `lottery` VALUES ('36', '福建体彩36选7', 'FJTC36X7', '1', '1', '111', 'x', 'x', '01,02,03,04', '01 02 03 04 05 06 07 + 08', '周2,4,6', '5');
INSERT INTO `lottery` VALUES ('37', '福建体彩22选5', 'FJTC22X5', '1', '1', '112', 'x', 'xڅS_HSQ?.', '01,02,03,04', '01 02 03 04 05', '天', '5');
INSERT INTO `lottery` VALUES ('38', '辽宁风采35选7', 'LNFC35X7', '1', '1', '1701', 'x', 'x', '01,02,03,04', '01 02 03 04 05 06 07 + 08', '周1,3,5', '9');
INSERT INTO `lottery` VALUES ('39', '体彩超级大乐透', 'TCCJDLT', '1', '1', '113', 'x', 'x', '01,02,03,04', '01 02 03 04 05 + 01 02', '周1,3,6', '5');
INSERT INTO `lottery` VALUES ('40', '浙江体彩20选5', 'ZJTC20X5', '1', '1', '114', 'x', 'xڕWoLeˀq', '01,02,03,04', '01 02 03 04 05', '周1,2,3,4,5,6', '5');
INSERT INTO `lottery` VALUES ('41', '浙江体彩6+1', 'ZJTC6J1', '1', '1', '115', 'x', 'xڽX}L[', '01,02,03,04', '123456-1', '周2,5,7', '4');
INSERT INTO `lottery` VALUES ('42', '龙江风彩22选5', 'LJFC22X5', '1', '1', '303', 'x', 'xڝYl', '01,02,03,04', '01 02 03 04 05', '周1,2,3,4,5,6,7', '9');
INSERT INTO `lottery` VALUES ('43', '龙江体彩6+1', 'LJTC6J1', '1', '1', '304', 'x', 'xڽXolS', '01,02,03,04', '123456+1', '周2,5', '4');
INSERT INTO `lottery` VALUES ('44', '天天乐22选5', 'TTL22X5', '1', '1', '1701', 'x', 'x', '01,02,03,04', '01 02 03 04 05', '天', '9');
INSERT INTO `lottery` VALUES ('45', '足彩单场', 'ZCDC', '0', '1', '100', 'x', 'x', '01,02,03,04', '1(1,1.538)|2(0,1.538);1(1,1.538)|2(0,1.538);1(1,1.', '', '2');
INSERT INTO `lottery` VALUES ('46', '天津风采15选5', 'TJFC15X5', '1', '1', '1801', 'x', 'xڕX}L', '01,02,03,04', '01 02 03 04 05', '天', '9');

-- ----------------------------
-- Table structure for `lottery_buy_detail`
-- ----------------------------
DROP TABLE IF EXISTS `lottery_buy_detail`;
CREATE TABLE `lottery_buy_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '购彩详情id',
  `user_id` int(10) DEFAULT NULL COMMENT '户用id',
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  `scheme_id` int(10) DEFAULT NULL COMMENT '方案id',
  `share` int(10) DEFAULT NULL COMMENT '参与的份数',
  `can_quash` tinyint(1) DEFAULT NULL COMMENT '能否撤销(1,能 2，否)',
  `quashed` tinyint(1) DEFAULT NULL COMMENT '是否已撤销(1,是 2，否)',
  `win_money_no_with_tax` decimal(19,4) DEFAULT NULL COMMENT '中奖税后金额',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='购彩详情表';

-- ----------------------------
-- Records of lottery_buy_detail
-- ----------------------------
INSERT INTO `lottery_buy_detail` VALUES ('1', '1', '2015-04-23 19:37:21', null, null, null, null, null);

-- ----------------------------
-- Table structure for `lottery_played_type`
-- ----------------------------
DROP TABLE IF EXISTS `lottery_played_type`;
CREATE TABLE `lottery_played_type` (
  `id` int(10) NOT NULL DEFAULT '0' COMMENT '彩种玩法id',
  `lottery_id` int(10) DEFAULT NULL COMMENT '彩种id',
  `name` varchar(20) DEFAULT NULL COMMENT '玩法名称',
  `type` varchar(50) DEFAULT NULL COMMENT '每个彩种的详细购买方法',
  `buy_page_url` varchar(255) DEFAULT '#' COMMENT '连接购买页面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='彩种的玩法信息表';

-- ----------------------------
-- Records of lottery_played_type
-- ----------------------------
INSERT INTO `lottery_played_type` VALUES ('101', '1', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SFC_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('102', '1', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SFC_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('103', '1', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SFC_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('104', '1', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SFC_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('105', '1', '任九场单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SFC_9_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('106', '1', '任九场单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SFC_9_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('107', '1', '任九场复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SFC_9_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('108', '1', '任九场复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SFC_9_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('201', '2', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=JQC_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('202', '2', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=JQC_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('203', '2', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=JQC_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('204', '2', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=JQC_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('301', '3', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=QXC_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('302', '3', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=QXC_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('303', '3', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=QXC_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('304', '3', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=QXC_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('305', '3', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('401', '4', '排列3直选单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SZPL3_ZhiD.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('402', '4', '排列3直选单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SZPL3_ZhiD.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('403', '4', '排列3直选复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SZPL3_ZhiF.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('404', '4', '排列3直选复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SZPL3_ZhiF.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('405', '4', '排列3组选单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SZPL3_ZuD.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('406', '4', '排列3组选单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SZPL3_ZuD.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('407', '4', '排列3组选6复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SZPL3_Zu6F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('408', '4', '排列3组选6复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SZPL3_Zu6F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('409', '4', '排列3组选3复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SZPL3_Zu3F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('410', '4', '排列3组选3复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SZPL3_Zu3F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('411', '4', '排列3直选和值代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SZPL3_ZhiH.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('412', '4', '排列3直选和值合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SZPL3_ZhiH.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('413', '4', '排列3组选和值代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SZPL3_ZuH.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('414', '4', '排列3组选和值合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SZPL3_ZuH.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('415', '4', '排列5单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SZPL5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('416', '4', '排列5单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SZPL5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('417', '4', '排列5复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SZPL5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('418', '4', '排列5复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SZPL5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('419', '4', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('501', '5', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SSQ_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('502', '5', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SSQ_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('503', '5', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SSQ_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('504', '5', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SSQ_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('505', '5', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('601', '6', '直选单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FC3D_ZhiD.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('602', '6', '直选单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FC3D_ZhiD.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('603', '6', '直选复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FC3D_ZhiF.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('604', '6', '直选复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FC3D_ZhiF.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('605', '6', '组选单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FC3D_ZuD.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('606', '6', '组选单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FC3D_ZuD.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('607', '6', '组选6复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FC3D_Zu6F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('608', '6', '组选6复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FC3D_Zu6F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('609', '6', '组选3复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FC3D_Zu3F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('610', '6', '组选3复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FC3D_Zu3F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('611', '6', '直选包点代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FC3D_ZhiB.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('612', '6', '直选包点合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FC3D_ZhiB.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('613', '6', '组选包点代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FC3D_ZuB.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('614', '6', '组选包点合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FC3D_ZuB.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('615', '6', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('701', '7', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LJ36X7_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('702', '7', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LJ36X7_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('703', '7', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LJ36X7_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('704', '7', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LJ36X7_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('705', '7', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('801', '8', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LJP62_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('802', '8', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LJP62_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('803', '8', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LJP62_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('804', '8', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LJP62_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('805', '8', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('901', '9', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TC22X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('902', '9', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TC22X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('903', '9', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TC22X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('904', '9', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TC22X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('905', '9', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1001', '10', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FZ36X7_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1002', '10', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FZ36X7_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1003', '10', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FZ36X7_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1004', '10', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FZ36X7_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1005', '10', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1101', '11', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=CTFC32X7_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1102', '11', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=CTFC32X7_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1103', '11', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=CTFC32X7_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1104', '11', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=CTFC32X7_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1105', '11', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1201', '12', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=CTFC22X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1202', '12', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=CTFC22X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1203', '12', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=CTFC22X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1204', '12', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=CTFC22X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1205', '12', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1301', '13', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=QLC_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1302', '13', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=QLC_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1303', '13', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=QLC_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1304', '13', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=QLC_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1305', '13', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1401', '14', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TC29X7_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1402', '14', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TC29X7_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1403', '14', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TC29X7_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1404', '14', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TC29X7_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1405', '14', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1501', '15', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LCBQC_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1502', '15', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LCBQC_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1503', '15', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LCBQC_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1504', '15', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LCBQC_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1601', '16', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC36X7_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1602', '16', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC36X7_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1603', '16', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC36X7_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1604', '16', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC36X7_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1605', '16', '好彩一单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC36X7_HC1_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1606', '16', '好彩一单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC36X7_HC1_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1607', '16', '好彩一复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC36X7_HC1_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1608', '16', '好彩一复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC36X7_HC1_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1609', '16', '好彩二单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC36X7_HC2_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1610', '16', '好彩二单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC36X7_HC2_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1611', '16', '好彩二复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC36X7_HC2_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1612', '16', '好彩二复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC36X7_HC2_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1613', '16', '好彩三单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC36X7_HC3_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1614', '16', '好彩三单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC36X7_HC3_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1615', '16', '好彩三复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC36X7_HC3_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1616', '16', '好彩三复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC36X7_HC3_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1617', '16', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1701', '17', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC26X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1702', '17', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC26X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1703', '17', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC26X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1704', '17', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC26X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1705', '17', '好彩二单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC26X5_HC2_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1706', '17', '好彩二单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC26X5_HC2_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1707', '17', '好彩二复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC26X5_HC2_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1708', '17', '好彩二复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC26X5_HC2_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1709', '17', '好彩三单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC26X5_HC3_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1710', '17', '好彩三单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC26X5_HC3_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1711', '17', '好彩三复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC26X5_HC3_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1712', '17', '好彩三复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=NYFC26X5_HC3_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1713', '17', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1801', '18', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SJFC21X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1802', '18', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SJFC21X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1803', '18', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SJFC21X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1804', '18', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SJFC21X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1805', '18', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1901', '19', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LCDC_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1902', '19', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LCDC_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1903', '19', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LCDC_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('1904', '19', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LCDC_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2001', '20', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SZFC35X7_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2002', '20', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SZFC35X7_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2003', '20', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SZFC35X7_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2004', '20', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SZFC35X7_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2005', '20', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2101', '21', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=ZJ15X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2102', '21', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=ZJ15X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2103', '21', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=ZJ15X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2104', '21', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=ZJ15X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2105', '21', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2201', '22', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=ZJFC4J1_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2202', '22', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=ZJFC4J1_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2203', '22', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=ZJFC4J1_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2204', '22', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=ZJFC4J1_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2205', '22', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2301', '23', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=HNFC22X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2302', '23', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=HNFC22X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2303', '23', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=HNFC22X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2304', '23', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=HNFC22X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2305', '23', '好运一单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=HNFC22X5_HY1_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2306', '23', '好运一单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=HNFC22X5_HY1_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2307', '23', '好运一复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=HNFC22X5_HY1_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2308', '23', '好运一复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=HNFC22X5_HY1_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2309', '23', '好运二单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=HNFC22X5_HY2_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2310', '23', '好运二单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=HNFC22X5_HY2_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2311', '23', '好运二复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=HNFC22X5_HY2_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2312', '23', '好运二复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=HNFC22X5_HY2_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2313', '23', '好运三单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=HNFC22X5_HY3_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2314', '23', '好运三单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=HNFC22X5_HY3_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2315', '23', '好运三复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=HNFC22X5_HY3_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2316', '23', '好运三复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=HNFC22X5_HY3_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2317', '23', '好运四单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=HNFC22X5_HY4_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2318', '23', '好运四单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=HNFC22X5_HY4_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2319', '23', '好运四复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=HNFC22X5_HY4_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2320', '23', '好运四复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=HNFC22X5_HY4_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2321', '23', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2401', '24', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=DFDLT_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2402', '24', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=DFDLT_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2403', '24', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=DFDLT_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2404', '24', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=DFDLT_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2405', '24', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2501', '25', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=AHFC25X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2502', '25', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=AHFC25X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2503', '25', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=AHFC25X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2504', '25', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=AHFC25X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2505', '25', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2601', '26', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=AHFC15X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2602', '26', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=AHFC15X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2603', '26', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=AHFC15X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2604', '26', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=AHFC15X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2605', '26', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2701', '27', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=QLFC23X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2702', '27', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=QLFC23X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2703', '27', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=QLFC23X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2704', '27', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=QLFC23X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2705', '27', '好运二单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=QLFC23X5_HYC2_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2706', '27', '好运二单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=QLFC23X5_HYC2_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2707', '27', '好运二复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=QLFC23X5_HYC2_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2708', '27', '好运二复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=QLFC23X5_HYC2_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2709', '27', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2801', '28', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=CQSSC_5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2802', '28', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=CQSSC_5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2803', '28', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=CQSSC_5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2804', '28', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=CQSSC_5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2805', '28', '组合玩法代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=CQSSC_5_ZH.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2806', '28', '组合玩法合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=CQSSC_5_ZH.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2807', '28', '猜大小代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=CQSSC_DX.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2808', '28', '猜大小合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=CQSSC_DX.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2809', '28', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2901', '29', '单选3单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_ZhiD.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2902', '29', '单选3单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_ZhiD.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2903', '29', '单选3复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_ZhiF.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2904', '29', '单选3复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_ZhiF.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2905', '29', '组选6单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_Zu6D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2906', '29', '组选6单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_Zu6D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2907', '29', '组选6复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_Zu6F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2908', '29', '组选6复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_Zu6F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2909', '29', '组选3单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_Zu3D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2910', '29', '组选3单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_Zu3D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2911', '29', '组选3复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_Zu3F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2912', '29', '组选3复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_Zu3F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2913', '29', '前2单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_Q2D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2914', '29', '前2单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_Q2D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2915', '29', '前2复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_Q2F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2916', '29', '前2复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_Q2F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2917', '29', '后2单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_H2D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2918', '29', '后2单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_H2D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2919', '29', '后2复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_H2F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2920', '29', '后2复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_H2F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2921', '29', '前1单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_Q1D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2922', '29', '前1单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_Q1D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2923', '29', '前1复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_Q1F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2924', '29', '前1复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_Q1F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2925', '29', '后1单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_H1D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2926', '29', '后1单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_H1D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2927', '29', '后1复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_H1F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2928', '29', '后1复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHSSL_H1F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('2929', '29', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3001', '30', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FJFC20X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3002', '30', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FJFC20X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3003', '30', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FJFC20X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3004', '30', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FJFC20X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3005', '30', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3101', '31', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=AHFC5WS_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3102', '31', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=AHFC5WS_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3103', '31', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=AHFC5WS_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3104', '31', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=AHFC5WS_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3105', '31', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3201', '32', '代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SZKL8.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3202', '32', '合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SZKL8.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3203', '32', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3301', '33', '代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=BJKL8.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3302', '33', '合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=BJKL8.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3303', '33', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3401', '34', '代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHKeno.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3402', '34', '合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=SHKeno.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3403', '34', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3501', '35', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FJTC31X7_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3502', '35', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FJTC31X7_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3503', '35', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FJTC31X7_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3504', '35', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FJTC31X7_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3505', '35', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3601', '36', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FJTC36X7_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3602', '36', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FJTC36X7_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3603', '36', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FJTC36X7_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3604', '36', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FJTC36X7_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3605', '36', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3701', '37', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FJTC22X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3702', '37', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FJTC22X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3703', '37', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FJTC22X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3704', '37', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=FJTC22X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3705', '37', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3801', '38', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LNFC35X7_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3802', '38', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LNFC35X7_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3803', '38', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LNFC35X7_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3804', '38', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LNFC35X7_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3805', '38', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3901', '39', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TCCJDLT_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3902', '39', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TCCJDLT_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3903', '39', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TCCJDLT_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3904', '39', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TCCJDLT_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3905', '39', '追加单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TCCJDLT_ZJ_D.htm&Price=3');
INSERT INTO `lottery_played_type` VALUES ('3906', '39', '追加单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TCCJDLT_ZJ_D.htm&Price=3');
INSERT INTO `lottery_played_type` VALUES ('3907', '39', '追加复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TCCJDLT_ZJ_F.htm&Price=3');
INSERT INTO `lottery_played_type` VALUES ('3908', '39', '追加复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TCCJDLT_ZJ_F.htm&Price=3');
INSERT INTO `lottery_played_type` VALUES ('3909', '39', '12选2单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TCCJDLT_2_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3910', '39', '12选2单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TCCJDLT_2_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3911', '39', '12选2复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TCCJDLT_2_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3912', '39', '12选2复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TCCJDLT_2_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('3913', '39', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4001', '40', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=ZJTC20X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4002', '40', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=ZJTC20X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4003', '40', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=ZJTC20X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4004', '40', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=ZJTC20X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4005', '40', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4101', '41', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=ZJTC6J1_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4102', '41', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=ZJTC6J1_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4103', '41', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=ZJTC6J1_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4104', '41', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=ZJTC6J1_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4105', '41', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4201', '42', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LJFC22X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4202', '42', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LJFC22X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4203', '42', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LJFC22X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4204', '42', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LJFC22X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4205', '42', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4301', '43', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LJTC6J1_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4302', '43', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LJTC6J1_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4303', '43', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LJTC6J1_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4304', '43', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=LJTC6J1_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4305', '43', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4401', '44', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TTL22X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4402', '44', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TTL22X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4403', '44', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TTL22X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4404', '44', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TTL22X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4405', '44', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4501', '45', '胜平负', null, 'ZCDC_SPF_2.aspx');
INSERT INTO `lottery_played_type` VALUES ('4502', '45', '总进球', null, 'ZCDC_ZJQ_2.aspx');
INSERT INTO `lottery_played_type` VALUES ('4503', '45', '上下单双', null, 'ZCDC_SXDS_2.aspx');
INSERT INTO `lottery_played_type` VALUES ('4504', '45', '正确比分', null, 'ZCDC_DCBF_2.aspx');
INSERT INTO `lottery_played_type` VALUES ('4505', '45', '半全场胜平负', null, 'ZCDC_BQC_2.aspx');
INSERT INTO `lottery_played_type` VALUES ('4601', '46', '单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TJFC15X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4602', '46', '单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TJFC15X5_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4603', '46', '复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TJFC15X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4604', '46', '复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TJFC15X5_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4605', '46', '彩中3单式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TJFC15X5_3_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4606', '46', '彩中3单式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TJFC15X5_3_D.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4607', '46', '彩中3复式代购', null, 'Surrogate.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TJFC15X5_3_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4608', '46', '彩中3复式合买', null, 'Join.aspx?Lottery=[Lottery]&BuyType=[BuyType]&Page=TJFC15X5_3_F.htm&Price=2');
INSERT INTO `lottery_played_type` VALUES ('4609', '46', '追号代购', null, 'Chase.aspx?id=[ID]&Price=2');

-- ----------------------------
-- Table structure for `lottery_type`
-- ----------------------------
DROP TABLE IF EXISTS `lottery_type`;
CREATE TABLE `lottery_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '彩种分类id',
  `parent_id` int(10) DEFAULT NULL COMMENT '种分类彩父id',
  `name` varchar(50) DEFAULT NULL COMMENT '彩种分类的名称',
  `description` varchar(100) DEFAULT NULL COMMENT '种彩分类描述',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='彩种分类表';

-- ----------------------------
-- Records of lottery_type
-- ----------------------------
INSERT INTO `lottery_type` VALUES ('1', '-1', '体彩', '体育彩票', '1');
INSERT INTO `lottery_type` VALUES ('2', '1', '足彩', '足球彩票', '2');
INSERT INTO `lottery_type` VALUES ('3', '1', '篮彩', '篮球彩票', '3');
INSERT INTO `lottery_type` VALUES ('4', '1', '传统数字型', '传统数字型体育彩票', '4');
INSERT INTO `lottery_type` VALUES ('5', '1', '乐透型', '乐透型体育彩票', '5');
INSERT INTO `lottery_type` VALUES ('6', '1', '基诺型', '基诺型体育彩票', '6');
INSERT INTO `lottery_type` VALUES ('7', '-1', '福彩', '福利彩票', '101');
INSERT INTO `lottery_type` VALUES ('8', '7', '传统数字型', '传统数字型福利彩票', '102');
INSERT INTO `lottery_type` VALUES ('9', '7', '乐透型', '乐透型福利彩票', '103');
INSERT INTO `lottery_type` VALUES ('10', '7', '基诺型', '基诺型福利彩票', '104');

-- ----------------------------
-- Table structure for `lottery_win_type`
-- ----------------------------
DROP TABLE IF EXISTS `lottery_win_type`;
CREATE TABLE `lottery_win_type` (
  `id` int(10) NOT NULL COMMENT '彩种奖金等级id',
  `lottery_id` int(10) DEFAULT NULL COMMENT '种彩id',
  `name` varchar(50) DEFAULT NULL COMMENT '奖金等级名称',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `default_money` decimal(19,4) DEFAULT NULL COMMENT '税前金额',
  `default_money_no_with_tax` decimal(19,4) DEFAULT NULL COMMENT '税后金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='彩种奖金等级';

-- ----------------------------
-- Records of lottery_win_type
-- ----------------------------
INSERT INTO `lottery_win_type` VALUES ('101', '1', '一等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('102', '1', '二等奖', '2', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('103', '1', '任九场一等奖', '3', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('201', '2', '一等奖', '1', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('301', '3', '特等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('302', '3', '一等奖', '2', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('303', '3', '二等奖', '3', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('304', '3', '三等奖', '4', '300.0000', '300.0000');
INSERT INTO `lottery_win_type` VALUES ('305', '3', '四等奖', '5', '20.0000', '20.0000');
INSERT INTO `lottery_win_type` VALUES ('306', '3', '五等奖', '6', '5.0000', '5.0000');
INSERT INTO `lottery_win_type` VALUES ('401', '4', '排列3直选奖', '1', '1000.0000', '1000.0000');
INSERT INTO `lottery_win_type` VALUES ('402', '4', '排列3组选3奖', '2', '320.0000', '320.0000');
INSERT INTO `lottery_win_type` VALUES ('403', '4', '排列3组选6奖', '3', '160.0000', '160.0000');
INSERT INTO `lottery_win_type` VALUES ('404', '4', '排列5奖', '4', '100000.0000', '80000.0000');
INSERT INTO `lottery_win_type` VALUES ('501', '5', '一等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('502', '5', '二等奖', '2', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('503', '5', '三等奖', '3', '3000.0000', '3000.0000');
INSERT INTO `lottery_win_type` VALUES ('504', '5', '四等奖', '4', '200.0000', '200.0000');
INSERT INTO `lottery_win_type` VALUES ('505', '5', '五等奖', '5', '10.0000', '10.0000');
INSERT INTO `lottery_win_type` VALUES ('506', '5', '六等奖', '6', '5.0000', '5.0000');
INSERT INTO `lottery_win_type` VALUES ('507', '5', '快乐星期天', '7', '3000.0000', '3000.0000');
INSERT INTO `lottery_win_type` VALUES ('601', '6', '直选奖', '1', '1000.0000', '1000.0000');
INSERT INTO `lottery_win_type` VALUES ('602', '6', '组选3奖', '2', '320.0000', '320.0000');
INSERT INTO `lottery_win_type` VALUES ('603', '6', '组选6奖', '3', '160.0000', '160.0000');
INSERT INTO `lottery_win_type` VALUES ('701', '7', '一等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('702', '7', '二等奖', '2', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('703', '7', '三等奖', '3', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('704', '7', '四等奖', '4', '500.0000', '500.0000');
INSERT INTO `lottery_win_type` VALUES ('705', '7', '五等奖', '5', '50.0000', '50.0000');
INSERT INTO `lottery_win_type` VALUES ('706', '7', '六等奖', '6', '20.0000', '20.0000');
INSERT INTO `lottery_win_type` VALUES ('707', '7', '七等奖', '7', '10.0000', '10.0000');
INSERT INTO `lottery_win_type` VALUES ('708', '7', '八等奖', '8', '5.0000', '5.0000');
INSERT INTO `lottery_win_type` VALUES ('801', '8', '一等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('802', '8', '二等奖', '2', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('803', '8', '三等奖', '3', '2000.0000', '2000.0000');
INSERT INTO `lottery_win_type` VALUES ('804', '8', '四等奖', '4', '200.0000', '200.0000');
INSERT INTO `lottery_win_type` VALUES ('805', '8', '五等奖', '5', '20.0000', '20.0000');
INSERT INTO `lottery_win_type` VALUES ('806', '8', '六等奖', '6', '5.0000', '5.0000');
INSERT INTO `lottery_win_type` VALUES ('901', '9', '一等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('902', '9', '二等奖', '2', '50.0000', '50.0000');
INSERT INTO `lottery_win_type` VALUES ('903', '9', '三等奖', '3', '5.0000', '5.0000');
INSERT INTO `lottery_win_type` VALUES ('1001', '10', '一等奖', '1', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('1002', '10', '二等奖', '2', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('1003', '10', '三等奖', '3', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('1004', '10', '四等奖', '4', '500.0000', '500.0000');
INSERT INTO `lottery_win_type` VALUES ('1005', '10', '五等奖', '5', '100.0000', '100.0000');
INSERT INTO `lottery_win_type` VALUES ('1006', '10', '六等奖', '6', '10.0000', '10.0000');
INSERT INTO `lottery_win_type` VALUES ('1101', '11', '一等奖', '1', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('1102', '11', '二等奖', '2', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('1103', '11', '三等奖', '3', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('1104', '11', '四等奖', '4', '300.0000', '300.0000');
INSERT INTO `lottery_win_type` VALUES ('1105', '11', '五等奖', '5', '50.0000', '50.0000');
INSERT INTO `lottery_win_type` VALUES ('1106', '11', '六等奖', '6', '20.0000', '20.0000');
INSERT INTO `lottery_win_type` VALUES ('1107', '11', '七等奖', '7', '10.0000', '10.0000');
INSERT INTO `lottery_win_type` VALUES ('1108', '11', '八等奖', '8', '5.0000', '5.0000');
INSERT INTO `lottery_win_type` VALUES ('1201', '12', '一等奖', '1', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('1202', '12', '二等奖', '2', '50.0000', '50.0000');
INSERT INTO `lottery_win_type` VALUES ('1203', '12', '三等奖', '3', '6.0000', '6.0000');
INSERT INTO `lottery_win_type` VALUES ('1301', '13', '一等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('1302', '13', '二等奖', '2', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('1303', '13', '三等奖', '3', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('1304', '13', '四等奖', '4', '200.0000', '200.0000');
INSERT INTO `lottery_win_type` VALUES ('1305', '13', '五等奖', '5', '50.0000', '50.0000');
INSERT INTO `lottery_win_type` VALUES ('1306', '13', '六等奖', '6', '10.0000', '10.0000');
INSERT INTO `lottery_win_type` VALUES ('1307', '13', '七等奖', '7', '5.0000', '5.0000');
INSERT INTO `lottery_win_type` VALUES ('1401', '14', '一等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('1402', '14', '二等奖', '2', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('1403', '14', '三等奖', '3', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('1404', '14', '四等奖', '4', '200.0000', '200.0000');
INSERT INTO `lottery_win_type` VALUES ('1405', '14', '五等奖', '5', '50.0000', '50.0000');
INSERT INTO `lottery_win_type` VALUES ('1406', '14', '六等奖', '6', '10.0000', '10.0000');
INSERT INTO `lottery_win_type` VALUES ('1407', '14', '七等奖', '7', '5.0000', '5.0000');
INSERT INTO `lottery_win_type` VALUES ('1501', '15', '一等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('1601', '16', '一等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('1602', '16', '二等奖', '2', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('1603', '16', '三等奖', '3', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('1604', '16', '四等奖', '4', '500.0000', '500.0000');
INSERT INTO `lottery_win_type` VALUES ('1605', '16', '五等奖', '5', '100.0000', '100.0000');
INSERT INTO `lottery_win_type` VALUES ('1606', '16', '六等奖', '6', '10.0000', '10.0000');
INSERT INTO `lottery_win_type` VALUES ('1607', '16', '好彩一', '7', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('1608', '16', '好彩二', '8', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('1609', '16', '好彩三', '9', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('1701', '17', '一等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('1702', '17', '二等奖', '2', '50.0000', '50.0000');
INSERT INTO `lottery_win_type` VALUES ('1703', '17', '好彩二', '3', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('1704', '17', '好彩三', '4', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('1801', '18', '特等奖', '1', '1000000.0000', '800000.0000');
INSERT INTO `lottery_win_type` VALUES ('1802', '18', '一等奖', '2', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('1803', '18', '二等奖', '3', '50.0000', '50.0000');
INSERT INTO `lottery_win_type` VALUES ('1804', '18', '三等奖', '4', '5.0000', '5.0000');
INSERT INTO `lottery_win_type` VALUES ('1901', '19', '一等奖', '1', '9800.0000', '9800.0000');
INSERT INTO `lottery_win_type` VALUES ('2001', '20', '一等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('2002', '20', '二等奖', '2', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('2003', '20', '三等奖', '3', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('2004', '20', '四等奖', '4', '300.0000', '300.0000');
INSERT INTO `lottery_win_type` VALUES ('2005', '20', '五等奖', '5', '50.0000', '50.0000');
INSERT INTO `lottery_win_type` VALUES ('2006', '20', '六等奖', '6', '20.0000', '20.0000');
INSERT INTO `lottery_win_type` VALUES ('2007', '20', '七等奖', '7', '10.0000', '10.0000');
INSERT INTO `lottery_win_type` VALUES ('2008', '20', '八等奖', '8', '2.0000', '2.0000');
INSERT INTO `lottery_win_type` VALUES ('2101', '21', '特等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('2102', '21', '一等奖', '2', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('2103', '21', '二等奖', '3', '10.0000', '10.0000');
INSERT INTO `lottery_win_type` VALUES ('2201', '22', '一等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('2202', '22', '二等奖', '2', '300.0000', '300.0000');
INSERT INTO `lottery_win_type` VALUES ('2203', '22', '三等奖', '3', '20.0000', '20.0000');
INSERT INTO `lottery_win_type` VALUES ('2204', '22', '四等奖', '4', '5.0000', '5.0000');
INSERT INTO `lottery_win_type` VALUES ('2301', '23', '一等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('2302', '23', '二等奖', '2', '50.0000', '50.0000');
INSERT INTO `lottery_win_type` VALUES ('2303', '23', '三等奖', '3', '2.0000', '2.0000');
INSERT INTO `lottery_win_type` VALUES ('2304', '23', '好运一', '4', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('2305', '23', '好运二', '5', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('2306', '23', '好运三', '6', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('2307', '23', '好运四', '7', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('2401', '24', '一等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('2402', '24', '二等奖', '2', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('2403', '24', '三等奖', '3', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('2404', '24', '四等奖', '4', '1000.0000', '1000.0000');
INSERT INTO `lottery_win_type` VALUES ('2405', '24', '五等奖', '5', '100.0000', '100.0000');
INSERT INTO `lottery_win_type` VALUES ('2406', '24', '六等奖', '6', '50.0000', '50.0000');
INSERT INTO `lottery_win_type` VALUES ('2407', '24', '七等奖', '7', '5.0000', '5.0000');
INSERT INTO `lottery_win_type` VALUES ('2501', '25', '一等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('2502', '25', '二等奖', '2', '100.0000', '100.0000');
INSERT INTO `lottery_win_type` VALUES ('2503', '25', '三等奖', '3', '10.0000', '10.0000');
INSERT INTO `lottery_win_type` VALUES ('2601', '26', '一等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('2602', '26', '二等奖', '2', '10.0000', '10.0000');
INSERT INTO `lottery_win_type` VALUES ('2701', '27', '一等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('2702', '27', '二等奖', '2', '100.0000', '100.0000');
INSERT INTO `lottery_win_type` VALUES ('2703', '27', '三等奖', '3', '5.0000', '5.0000');
INSERT INTO `lottery_win_type` VALUES ('2704', '27', '好运彩2奖', '4', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('2801', '28', '5星奖', '1', '100000.0000', '80000.0000');
INSERT INTO `lottery_win_type` VALUES ('2802', '28', '3星奖', '2', '1000.0000', '1000.0000');
INSERT INTO `lottery_win_type` VALUES ('2803', '28', '2星奖', '3', '100.0000', '100.0000');
INSERT INTO `lottery_win_type` VALUES ('2804', '28', '1星奖', '4', '10.0000', '10.0000');
INSERT INTO `lottery_win_type` VALUES ('2805', '28', '猜大小奖', '5', '4.0000', '4.0000');
INSERT INTO `lottery_win_type` VALUES ('2901', '29', '单选奖', '1', '980.0000', '980.0000');
INSERT INTO `lottery_win_type` VALUES ('2902', '29', '组选6奖', '2', '160.0000', '160.0000');
INSERT INTO `lottery_win_type` VALUES ('2903', '29', '组选3奖', '3', '320.0000', '320.0000');
INSERT INTO `lottery_win_type` VALUES ('2904', '29', '前2奖', '4', '98.0000', '98.0000');
INSERT INTO `lottery_win_type` VALUES ('2905', '29', '后2奖', '5', '98.0000', '98.0000');
INSERT INTO `lottery_win_type` VALUES ('2906', '29', '前1奖', '6', '10.0000', '10.0000');
INSERT INTO `lottery_win_type` VALUES ('2907', '29', '后1奖', '7', '10.0000', '10.0000');
INSERT INTO `lottery_win_type` VALUES ('3001', '30', '一等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('3002', '30', '二等奖', '2', '50.0000', '50.0000');
INSERT INTO `lottery_win_type` VALUES ('3003', '30', '三等奖', '3', '5.0000', '5.0000');
INSERT INTO `lottery_win_type` VALUES ('3101', '31', '一等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('3102', '31', '二等奖', '2', '400.0000', '400.0000');
INSERT INTO `lottery_win_type` VALUES ('3103', '31', '三等奖', '3', '50.0000', '50.0000');
INSERT INTO `lottery_win_type` VALUES ('3104', '31', '四等奖', '4', '10.0000', '10.0000');
INSERT INTO `lottery_win_type` VALUES ('3201', '32', '选8中8奖', '1', '20000.0000', '16000.0000');
INSERT INTO `lottery_win_type` VALUES ('3202', '32', '选8中7奖', '2', '700.0000', '700.0000');
INSERT INTO `lottery_win_type` VALUES ('3203', '32', '选8中6奖', '3', '40.0000', '40.0000');
INSERT INTO `lottery_win_type` VALUES ('3204', '32', '选8中5奖', '4', '10.0000', '10.0000');
INSERT INTO `lottery_win_type` VALUES ('3205', '32', '选8中4奖', '5', '4.0000', '4.0000');
INSERT INTO `lottery_win_type` VALUES ('3206', '32', '选8中0奖', '6', '2.0000', '2.0000');
INSERT INTO `lottery_win_type` VALUES ('3207', '32', '选7中7奖', '7', '8000.0000', '8000.0000');
INSERT INTO `lottery_win_type` VALUES ('3208', '32', '选7中6奖', '8', '160.0000', '160.0000');
INSERT INTO `lottery_win_type` VALUES ('3209', '32', '选7中5奖', '9', '25.0000', '25.0000');
INSERT INTO `lottery_win_type` VALUES ('3210', '32', '选7中4奖', '10', '4.0000', '4.0000');
INSERT INTO `lottery_win_type` VALUES ('3211', '32', '选7中0奖', '11', '2.0000', '2.0000');
INSERT INTO `lottery_win_type` VALUES ('3212', '32', '选6中6奖', '12', '600.0000', '600.0000');
INSERT INTO `lottery_win_type` VALUES ('3213', '32', '选6中5奖', '13', '50.0000', '50.0000');
INSERT INTO `lottery_win_type` VALUES ('3214', '32', '选6中4奖', '14', '8.0000', '8.0000');
INSERT INTO `lottery_win_type` VALUES ('3215', '32', '选6中3奖', '15', '4.0000', '4.0000');
INSERT INTO `lottery_win_type` VALUES ('3216', '32', '选5中5奖', '16', '250.0000', '250.0000');
INSERT INTO `lottery_win_type` VALUES ('3217', '32', '选5中4奖', '17', '40.0000', '40.0000');
INSERT INTO `lottery_win_type` VALUES ('3218', '32', '选5中3奖', '18', '4.0000', '4.0000');
INSERT INTO `lottery_win_type` VALUES ('3219', '32', '选4中4奖', '19', '40.0000', '40.0000');
INSERT INTO `lottery_win_type` VALUES ('3220', '32', '选4中3奖', '20', '10.0000', '10.0000');
INSERT INTO `lottery_win_type` VALUES ('3221', '32', '选4中2奖', '21', '2.0000', '2.0000');
INSERT INTO `lottery_win_type` VALUES ('3222', '32', '选3中3奖', '22', '30.0000', '30.0000');
INSERT INTO `lottery_win_type` VALUES ('3223', '32', '选3中2奖', '23', '4.0000', '4.0000');
INSERT INTO `lottery_win_type` VALUES ('3224', '32', '选2中2奖', '24', '16.0000', '16.0000');
INSERT INTO `lottery_win_type` VALUES ('3225', '32', '选1中1奖', '25', '4.0000', '4.0000');
INSERT INTO `lottery_win_type` VALUES ('3301', '33', '选8中8奖', '1', '20000.0000', '16000.0000');
INSERT INTO `lottery_win_type` VALUES ('3302', '33', '选8中7奖', '2', '700.0000', '700.0000');
INSERT INTO `lottery_win_type` VALUES ('3303', '33', '选8中6奖', '3', '40.0000', '40.0000');
INSERT INTO `lottery_win_type` VALUES ('3304', '33', '选8中5奖', '4', '10.0000', '10.0000');
INSERT INTO `lottery_win_type` VALUES ('3305', '33', '选8中4奖', '5', '4.0000', '4.0000');
INSERT INTO `lottery_win_type` VALUES ('3306', '33', '选8中0奖', '6', '2.0000', '2.0000');
INSERT INTO `lottery_win_type` VALUES ('3307', '33', '选7中7奖', '7', '8000.0000', '8000.0000');
INSERT INTO `lottery_win_type` VALUES ('3308', '33', '选7中6奖', '8', '160.0000', '160.0000');
INSERT INTO `lottery_win_type` VALUES ('3309', '33', '选7中5奖', '9', '25.0000', '25.0000');
INSERT INTO `lottery_win_type` VALUES ('3310', '33', '选7中4奖', '10', '4.0000', '4.0000');
INSERT INTO `lottery_win_type` VALUES ('3311', '33', '选7中0奖', '11', '2.0000', '2.0000');
INSERT INTO `lottery_win_type` VALUES ('3312', '33', '选6中6奖', '12', '600.0000', '600.0000');
INSERT INTO `lottery_win_type` VALUES ('3313', '33', '选6中5奖', '13', '50.0000', '50.0000');
INSERT INTO `lottery_win_type` VALUES ('3314', '33', '选6中4奖', '14', '8.0000', '8.0000');
INSERT INTO `lottery_win_type` VALUES ('3315', '33', '选6中3奖', '15', '4.0000', '4.0000');
INSERT INTO `lottery_win_type` VALUES ('3316', '33', '选5中5奖', '16', '250.0000', '250.0000');
INSERT INTO `lottery_win_type` VALUES ('3317', '33', '选5中4奖', '17', '40.0000', '40.0000');
INSERT INTO `lottery_win_type` VALUES ('3318', '33', '选5中3奖', '18', '4.0000', '4.0000');
INSERT INTO `lottery_win_type` VALUES ('3319', '33', '选4中4奖', '19', '40.0000', '40.0000');
INSERT INTO `lottery_win_type` VALUES ('3320', '33', '选4中3奖', '20', '10.0000', '10.0000');
INSERT INTO `lottery_win_type` VALUES ('3321', '33', '选4中2奖', '21', '2.0000', '2.0000');
INSERT INTO `lottery_win_type` VALUES ('3322', '33', '选3中3奖', '22', '30.0000', '30.0000');
INSERT INTO `lottery_win_type` VALUES ('3323', '33', '选3中2奖', '23', '4.0000', '4.0000');
INSERT INTO `lottery_win_type` VALUES ('3324', '33', '选2中2奖', '24', '16.0000', '16.0000');
INSERT INTO `lottery_win_type` VALUES ('3325', '33', '选1中1奖', '25', '4.0000', '4.0000');
INSERT INTO `lottery_win_type` VALUES ('3401', '34', '选10中10奖', '1', '200000.0000', '160000.0000');
INSERT INTO `lottery_win_type` VALUES ('3402', '34', '选10中9奖', '2', '10000.0000', '8000.0000');
INSERT INTO `lottery_win_type` VALUES ('3403', '34', '选10中8奖', '3', '800.0000', '800.0000');
INSERT INTO `lottery_win_type` VALUES ('3404', '34', '选10中7奖', '4', '100.0000', '100.0000');
INSERT INTO `lottery_win_type` VALUES ('3405', '34', '选10中6奖', '5', '20.0000', '20.0000');
INSERT INTO `lottery_win_type` VALUES ('3406', '34', '选10中5奖', '6', '4.0000', '4.0000');
INSERT INTO `lottery_win_type` VALUES ('3407', '34', '选10中0奖', '7', '4.0000', '4.0000');
INSERT INTO `lottery_win_type` VALUES ('3408', '34', '选9中9奖', '8', '50000.0000', '40000.0000');
INSERT INTO `lottery_win_type` VALUES ('3409', '34', '选9中8奖', '9', '5000.0000', '5000.0000');
INSERT INTO `lottery_win_type` VALUES ('3410', '34', '选9中7奖', '10', '200.0000', '200.0000');
INSERT INTO `lottery_win_type` VALUES ('3411', '34', '选9中6奖', '11', '50.0000', '50.0000');
INSERT INTO `lottery_win_type` VALUES ('3412', '34', '选9中5奖', '12', '4.0000', '4.0000');
INSERT INTO `lottery_win_type` VALUES ('3413', '34', '选9中0奖', '13', '4.0000', '4.0000');
INSERT INTO `lottery_win_type` VALUES ('3414', '34', '选8中8奖', '14', '20000.0000', '16000.0000');
INSERT INTO `lottery_win_type` VALUES ('3415', '34', '选8中7奖', '15', '700.0000', '700.0000');
INSERT INTO `lottery_win_type` VALUES ('3416', '34', '选8中6奖', '16', '40.0000', '40.0000');
INSERT INTO `lottery_win_type` VALUES ('3417', '34', '选8中5奖', '17', '10.0000', '10.0000');
INSERT INTO `lottery_win_type` VALUES ('3418', '34', '选8中4奖', '18', '4.0000', '4.0000');
INSERT INTO `lottery_win_type` VALUES ('3419', '34', '选8中0奖', '19', '2.0000', '2.0000');
INSERT INTO `lottery_win_type` VALUES ('3420', '34', '选7中7奖', '20', '10000.0000', '8000.0000');
INSERT INTO `lottery_win_type` VALUES ('3421', '34', '选7中6奖', '21', '300.0000', '300.0000');
INSERT INTO `lottery_win_type` VALUES ('3422', '34', '选7中5奖', '22', '30.0000', '30.0000');
INSERT INTO `lottery_win_type` VALUES ('3423', '34', '选7中4奖', '23', '5.0000', '5.0000');
INSERT INTO `lottery_win_type` VALUES ('3424', '34', '选6中6奖', '24', '600.0000', '600.0000');
INSERT INTO `lottery_win_type` VALUES ('3425', '34', '选6中5奖', '25', '50.0000', '50.0000');
INSERT INTO `lottery_win_type` VALUES ('3426', '34', '选6中4奖', '26', '8.0000', '8.0000');
INSERT INTO `lottery_win_type` VALUES ('3427', '34', '选6中3奖', '27', '4.0000', '4.0000');
INSERT INTO `lottery_win_type` VALUES ('3428', '34', '选5中5奖', '28', '250.0000', '250.0000');
INSERT INTO `lottery_win_type` VALUES ('3429', '34', '选5中4奖', '29', '40.0000', '40.0000');
INSERT INTO `lottery_win_type` VALUES ('3430', '34', '选5中3奖', '30', '4.0000', '4.0000');
INSERT INTO `lottery_win_type` VALUES ('3431', '34', '选4中4奖', '31', '40.0000', '40.0000');
INSERT INTO `lottery_win_type` VALUES ('3432', '34', '选4中3奖', '32', '10.0000', '10.0000');
INSERT INTO `lottery_win_type` VALUES ('3433', '34', '选4中2奖', '33', '2.0000', '2.0000');
INSERT INTO `lottery_win_type` VALUES ('3434', '34', '选3中3奖', '34', '30.0000', '30.0000');
INSERT INTO `lottery_win_type` VALUES ('3435', '34', '选3中2奖', '35', '4.0000', '4.0000');
INSERT INTO `lottery_win_type` VALUES ('3436', '34', '选2中2奖', '36', '16.0000', '16.0000');
INSERT INTO `lottery_win_type` VALUES ('3437', '34', '选1中1奖', '37', '4.0000', '4.0000');
INSERT INTO `lottery_win_type` VALUES ('3501', '35', '幸运奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('3502', '35', '特等奖', '2', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('3503', '35', '一等奖', '3', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('3504', '35', '二等奖', '4', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('3505', '35', '三等奖', '5', '500.0000', '500.0000');
INSERT INTO `lottery_win_type` VALUES ('3506', '35', '四等奖', '6', '50.0000', '50.0000');
INSERT INTO `lottery_win_type` VALUES ('3507', '35', '五等奖', '7', '20.0000', '20.0000');
INSERT INTO `lottery_win_type` VALUES ('3508', '35', '六等奖', '8', '10.0000', '10.0000');
INSERT INTO `lottery_win_type` VALUES ('3601', '36', '幸运奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('3602', '36', '特等奖', '2', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('3603', '36', '一等奖', '3', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('3604', '36', '二等奖', '4', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('3605', '36', '三等奖', '5', '500.0000', '500.0000');
INSERT INTO `lottery_win_type` VALUES ('3606', '36', '四等奖', '6', '50.0000', '50.0000');
INSERT INTO `lottery_win_type` VALUES ('3607', '36', '五等奖', '7', '20.0000', '20.0000');
INSERT INTO `lottery_win_type` VALUES ('3608', '36', '六等奖', '8', '6.0000', '6.0000');
INSERT INTO `lottery_win_type` VALUES ('3701', '37', '特等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('3702', '37', '一等奖', '2', '50.0000', '50.0000');
INSERT INTO `lottery_win_type` VALUES ('3703', '37', '二等奖', '3', '6.0000', '6.0000');
INSERT INTO `lottery_win_type` VALUES ('3801', '38', '一等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('3802', '38', '二等奖', '2', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('3803', '38', '三等奖', '3', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('3804', '38', '四等奖', '4', '200.0000', '200.0000');
INSERT INTO `lottery_win_type` VALUES ('3805', '38', '五等奖', '5', '50.0000', '50.0000');
INSERT INTO `lottery_win_type` VALUES ('3806', '38', '六等奖', '6', '20.0000', '20.0000');
INSERT INTO `lottery_win_type` VALUES ('3807', '38', '七等奖', '7', '5.0000', '5.0000');
INSERT INTO `lottery_win_type` VALUES ('3808', '38', '八等奖', '8', '5.0000', '5.0000');
INSERT INTO `lottery_win_type` VALUES ('3901', '39', '一等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('3902', '39', '追加一等奖', '2', '8000000.0000', '6400000.0000');
INSERT INTO `lottery_win_type` VALUES ('3903', '39', '二等奖', '3', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('3904', '39', '追加二等奖', '4', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('3905', '39', '三等奖', '5', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('3906', '39', '追加三等奖', '6', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('3907', '39', '四等奖', '7', '3000.0000', '3000.0000');
INSERT INTO `lottery_win_type` VALUES ('3908', '39', '五等奖', '8', '500.0000', '500.0000');
INSERT INTO `lottery_win_type` VALUES ('3909', '39', '六等奖', '9', '200.0000', '200.0000');
INSERT INTO `lottery_win_type` VALUES ('3910', '39', '七等奖', '10', '10.0000', '10.0000');
INSERT INTO `lottery_win_type` VALUES ('3911', '39', '八等奖', '11', '5.0000', '5.0000');
INSERT INTO `lottery_win_type` VALUES ('3912', '39', '12选2一等奖', '12', '60.0000', '60.0000');
INSERT INTO `lottery_win_type` VALUES ('4001', '40', '一等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('4002', '40', '二等奖', '2', '50.0000', '50.0000');
INSERT INTO `lottery_win_type` VALUES ('4003', '40', '三等奖', '3', '5.0000', '5.0000');
INSERT INTO `lottery_win_type` VALUES ('4101', '41', '特等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('4102', '41', '一等奖', '2', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('4103', '41', '二等奖', '3', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('4104', '41', '三等奖', '4', '300.0000', '300.0000');
INSERT INTO `lottery_win_type` VALUES ('4105', '41', '四等奖', '5', '20.0000', '20.0000');
INSERT INTO `lottery_win_type` VALUES ('4106', '41', '五等奖', '6', '5.0000', '5.0000');
INSERT INTO `lottery_win_type` VALUES ('4201', '42', '一等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('4202', '42', '二等奖', '2', '50.0000', '50.0000');
INSERT INTO `lottery_win_type` VALUES ('4203', '42', '三等奖', '3', '5.0000', '5.0000');
INSERT INTO `lottery_win_type` VALUES ('4301', '43', '特等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('4302', '43', '一等奖', '2', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('4303', '43', '二等奖', '3', '0.0000', '0.0000');
INSERT INTO `lottery_win_type` VALUES ('4304', '43', '三等奖', '4', '300.0000', '300.0000');
INSERT INTO `lottery_win_type` VALUES ('4305', '43', '四等奖', '5', '20.0000', '20.0000');
INSERT INTO `lottery_win_type` VALUES ('4306', '43', '五等奖', '6', '5.0000', '5.0000');
INSERT INTO `lottery_win_type` VALUES ('4401', '44', '一等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('4402', '44', '二等奖', '2', '50.0000', '50.0000');
INSERT INTO `lottery_win_type` VALUES ('4403', '44', '三等奖', '3', '5.0000', '5.0000');
INSERT INTO `lottery_win_type` VALUES ('4601', '46', '一等奖', '1', '5000000.0000', '4000000.0000');
INSERT INTO `lottery_win_type` VALUES ('4602', '46', '二等奖', '2', '10.0000', '10.0000');
INSERT INTO `lottery_win_type` VALUES ('4603', '46', '彩中3奖', '3', '5000000.0000', '4000000.0000');

-- ----------------------------
-- Table structure for `province`
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '省份id',
  `name` varchar(50) DEFAULT NULL COMMENT '省份名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='省份表';

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES ('1', '安徽');
INSERT INTO `province` VALUES ('2', '北京');
INSERT INTO `province` VALUES ('3', '福建');
INSERT INTO `province` VALUES ('4', '甘肃');
INSERT INTO `province` VALUES ('5', '广东');
INSERT INTO `province` VALUES ('6', '广西');
INSERT INTO `province` VALUES ('7', '贵州');
INSERT INTO `province` VALUES ('8', '海南');
INSERT INTO `province` VALUES ('9', '河北');
INSERT INTO `province` VALUES ('10', '河南');
INSERT INTO `province` VALUES ('11', '黑龙江');
INSERT INTO `province` VALUES ('12', '湖北');
INSERT INTO `province` VALUES ('13', '湖南');
INSERT INTO `province` VALUES ('14', '吉林');
INSERT INTO `province` VALUES ('15', '江苏');
INSERT INTO `province` VALUES ('16', '江西');
INSERT INTO `province` VALUES ('17', '辽宁');
INSERT INTO `province` VALUES ('18', '内蒙古');
INSERT INTO `province` VALUES ('19', '宁夏');
INSERT INTO `province` VALUES ('20', '青海');
INSERT INTO `province` VALUES ('21', '山东');
INSERT INTO `province` VALUES ('22', '山西');
INSERT INTO `province` VALUES ('23', '陕西');
INSERT INTO `province` VALUES ('24', '上海');
INSERT INTO `province` VALUES ('25', '四川');
INSERT INTO `province` VALUES ('26', '天津');
INSERT INTO `province` VALUES ('27', '西藏');
INSERT INTO `province` VALUES ('28', '新疆');
INSERT INTO `province` VALUES ('29', '云南');
INSERT INTO `province` VALUES ('30', '浙江');
INSERT INTO `province` VALUES ('31', '重庆');
INSERT INTO `province` VALUES ('32', '香港');
INSERT INTO `province` VALUES ('33', '澳门');
INSERT INTO `province` VALUES ('34', '台湾');

-- ----------------------------
-- Table structure for `scheme`
-- ----------------------------
DROP TABLE IF EXISTS `scheme`;
CREATE TABLE `scheme` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '方案id',
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  `title` varchar(100) DEFAULT '' COMMENT '题标',
  `description` varchar(2000) DEFAULT NULL COMMENT '述描',
  `initiate_user_id` int(10) DEFAULT NULL COMMENT '发起人ID',
  `isuse_id` int(10) DEFAULT NULL COMMENT '期号ID',
  `lottery_id` int(10) DEFAULT NULL COMMENT '彩种ID',
  `lottery_number` varchar(2000) DEFAULT NULL COMMENT '投注号码(如果是代购这里是单注的存储，如果是合买则是多注的记录)，彩票的玩法类型存储在这里',
  `multiple` int(10) DEFAULT NULL COMMENT '倍数',
  `money` decimal(19,4) DEFAULT NULL COMMENT '金额',
  `assure_money` decimal(19,4) DEFAULT NULL COMMENT '保底金额',
  `share` int(10) DEFAULT NULL COMMENT '分成多少份',
  `can_quash` tinyint(1) DEFAULT NULL COMMENT '能否撤销(1,能 2，否)',
  `quashed` tinyint(1) DEFAULT NULL COMMENT '是否撤消(1,是 2 否)',
  `is_system_quashed` tinyint(1) DEFAULT NULL COMMENT '是否系统撤消(1,是 2，否)',
  `lottery_buyed` tinyint(1) DEFAULT NULL COMMENT '是否已出票(1,已出票 2，未出票)',
  `lottery_code` varchar(500) DEFAULT NULL COMMENT '已出票，彩票条码等标识号',
  `win_money` decimal(19,4) DEFAULT NULL COMMENT '税前奖金',
  `win_money_no_with_tax` decimal(19,4) DEFAULT NULL COMMENT '税后奖金',
  `win_commission` decimal(19,4) DEFAULT NULL COMMENT '发起人佣金',
  `Win_description` varchar(500) DEFAULT NULL COMMENT '中奖描述',
  `at_top_application` tinyint(1) DEFAULT NULL COMMENT '方案申请置顶(1,申请置顶 2，不申请置顶)',
  `at_top` tinyint(1) DEFAULT NULL COMMENT '方案是否置顶(1,置顶 2，不置顶)',
  `at_win_affiche` tinyint(1) DEFAULT NULL COMMENT '是否显示在开奖公告里(1,是 2，否)',
  `secrecy_level` int(10) DEFAULT NULL COMMENT '方案公开级别(1-公开， 2-跟单公开， 3-截止公开， 999-不公开)',
  `buy_operator_id` int(10) DEFAULT NULL COMMENT '出票员',
  `win_operator_id` int(10) DEFAULT NULL COMMENT '开奖员',
  `scheme_is_open` tinyint(1) DEFAULT NULL COMMENT '否是已经开奖(1,已开奖 2,未开奖)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='彩票购买方案表';

-- ----------------------------
-- Records of scheme
-- ----------------------------
INSERT INTO `scheme` VALUES ('1', '2015-04-23 22:59:53', '', null, '1', '2015042201', null, '23232', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `scheme` VALUES ('2', '2015-04-22 22:59:55', '', null, '1', '2015042201', null, '34345', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `scheme` VALUES ('3', '2015-04-23 23:07:58', '', null, '2', '2015042201', null, '888888', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `scheme` VALUES ('4', '2015-04-23 23:08:00', '', null, '1', '2015042201', null, '878787', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `scheme` VALUES ('5', '2015-04-23 23:08:02', '', null, '2', '2015042201', null, '888888', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `scheme` VALUES ('6', '2015-04-23 23:08:10', '', null, '1', '2015042201', null, '888888', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `scheme` VALUES ('7', '2015-04-23 23:11:35', '', null, null, '2015042202', null, '23233434', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `scheme` VALUES ('8', '2015-04-23 23:11:36', '', null, null, '2015042202', null, '232323', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `scheme` VALUES ('9', '2015-04-23 23:11:37', '', null, null, '2015042202', null, '232323', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `scheme` VALUES ('10', '2015-04-23 23:11:39', '', null, null, '2015042202', null, '232323', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `scheme` VALUES ('11', '2015-04-23 23:11:40', '', null, null, '2015042202', null, '232323', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `scheme` VALUES ('12', '2015-04-23 23:11:44', '', null, null, '2015042202', null, '2323232', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(50) DEFAULT NULL COMMENT '称昵',
  `reality_name` varchar(50) DEFAULT '' COMMENT '真实姓名',
  `password` text COMMENT '陆登密码',
  `pay_password` text COMMENT '支付密码（安全密码、投注密码）',
  `province` varchar(50) DEFAULT '' COMMENT '在所省份',
  `city` varchar(50) DEFAULT '' COMMENT '在所城市',
  `sex` char(2) DEFAULT '' COMMENT '别性',
  `birthday` timestamp NULL DEFAULT '1980-01-01 00:00:00' COMMENT '生日',
  `id_card_number` varchar(50) DEFAULT '' COMMENT '身份证号',
  `address` varchar(50) DEFAULT '' COMMENT '细地址详',
  `email` varchar(50) DEFAULT '' COMMENT '箱邮',
  `email_valid` tinyint(1) DEFAULT NULL COMMENT '邮箱是否通过验证(1,已通过 2，未通过)',
  `qq` varchar(50) DEFAULT '' COMMENT 'QQ',
  `telphone` varchar(50) DEFAULT '' COMMENT '电话码号',
  `mobile` varchar(50) DEFAULT '' COMMENT '手机号码',
  `mobile_valid` tinyint(1) DEFAULT NULL COMMENT '手机是否通过验证(1,已通过 2，未通过)',
  `privacy` tinyint(1) DEFAULT NULL COMMENT '个人资料保密(1,保密 2，公开)',
  `blacklist` tinyint(1) DEFAULT NULL COMMENT '是否进入黑名单(1,是 2，否)',
  `register_time` timestamp NULL DEFAULT NULL COMMENT '册注时间',
  `last_login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '后最登陆时间',
  `last_login_ip` varchar(50) DEFAULT '' COMMENT '后最登陆ip',
  `login_num` int(10) DEFAULT NULL COMMENT '登陆次数',
  `user_type` int(10) DEFAULT NULL COMMENT '用户类型（1-普通，2-代理）',
  `balance` decimal(19,4) DEFAULT NULL COMMENT '帐户金额',
  `freeze_money` decimal(19,4) DEFAULT NULL COMMENT '冻结金额',
  `scoring` int(10) DEFAULT NULL COMMENT '积分',
  `bank_type` varchar(50) DEFAULT '' COMMENT '提现银行类别',
  `bank_name` varchar(50) DEFAULT '' COMMENT '提现银行名字',
  `bank_card_number` varchar(50) DEFAULT '' COMMENT '提现银行卡号',
  `higher_up_id` int(10) DEFAULT NULL COMMENT '上一级推荐人（推荐人id）（上级代理用户id）',
  `rebate_rate` decimal(10,2) DEFAULT NULL COMMENT '如果用户是代理用户，则其下的普通用户投注时，按投注金额的这个比率给此代理用户返点',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', '管理员', 'N4g46C4FOE0E0EuOE0Ey', 'N4g46C4FOE0E0EuOE0Ey', '山东', '济南', '男', '1980-01-01 00:00:00', '420700XXXX1220XXX7', '广东深圳', 'xxxxx@163.com', null, '233234354', '134455656', '', '0', '1', '0', '2006-07-27 10:26:55', '2007-10-16 13:48:27', '127.0.0.1', '44', '2', '0.0000', '0.0000', '0', '工商银行', '12444444', '12342121', '-1', null);
INSERT INTO `users` VALUES ('2', 'zhangsan', '张三', null, null, '广东', '深圳', '男', '1980-01-01 00:00:00', '', '', '', null, '65657676', '13456789', '', null, null, null, null, '2015-04-23 23:12:41', '', null, null, null, null, null, '', '', '', null, null);
INSERT INTO `users` VALUES ('3', 'lisi', 'lisi', null, null, '', '', '', '1980-01-01 00:00:00', '', '', '', null, '', '', '', null, null, null, null, '2015-04-23 23:12:44', '', null, null, null, null, null, '', '', '', null, null);
INSERT INTO `users` VALUES ('4', '13688888888', null, 'C8B3746A080F49FF4D00731DC171D943', 'C8B3746A080F49FF4D00731DC171D943', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `users_distill`
-- ----------------------------
DROP TABLE IF EXISTS `users_distill`;
CREATE TABLE `users_distill` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户提现id',
  `user_id` int(10) DEFAULT NULL COMMENT '户用id',
  `datetime` timestamp NULL DEFAULT NULL COMMENT '申请时间',
  `money` decimal(19,4) DEFAULT NULL COMMENT '金额',
  `result` int(10) DEFAULT NULL COMMENT '结果(1-申请， 2-等待， 3-成功， 4-拒绝， 5-失败)',
  `accept_datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '同意时间',
  `bank_name` varchar(50) DEFAULT '' COMMENT '现提银行',
  `bank_card_number` varchar(50) DEFAULT '' COMMENT '提现卡号',
  `memo` varchar(100) DEFAULT '' COMMENT '操作说明',
  `accept_operator_id` int(10) DEFAULT NULL COMMENT '操作员ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户提现表';

-- ----------------------------
-- Records of users_distill
-- ----------------------------

-- ----------------------------
-- Table structure for `users_money_detail`
-- ----------------------------
DROP TABLE IF EXISTS `users_money_detail`;
CREATE TABLE `users_money_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '金资变动详情id',
  `user_id` int(10) DEFAULT NULL COMMENT '户用id',
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  `operator_type` tinyint(4) DEFAULT NULL COMMENT '操作类别(1-用户投注， 2-用户中奖， 3-用户充值， 4-用户提现， 5-管理员充值， 6-管理员扣费， 7-代理收入)',
  `operator_status` tinyint(4) DEFAULT NULL COMMENT '作操状态(1-成功， 2-失败)',
  `money` decimal(19,4) DEFAULT NULL COMMENT '金额',
  `commission` decimal(19,4) DEFAULT NULL COMMENT '费用/手续费/佣金',
  `account_balance` decimal(19,4) DEFAULT NULL COMMENT '操作之后的账户余额',
  `memo` varchar(100) DEFAULT '' COMMENT '操作备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户购买彩票的收入和支出的明细表';

-- ----------------------------
-- Records of users_money_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `users_pay_detail`
-- ----------------------------
DROP TABLE IF EXISTS `users_pay_detail`;
CREATE TABLE `users_pay_detail` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '用户充值id',
  `user_id` int(10) DEFAULT NULL COMMENT '户用id',
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  `pay_code` varchar(50) CHARACTER SET latin1 DEFAULT NULL COMMENT '支付编码(生成规则：日期时间+随机数)，局唯一全',
  `third_pay_code` varchar(50) CHARACTER SET latin1 DEFAULT NULL COMMENT '第三方支付编码',
  `pay_type` varchar(50) DEFAULT '' COMMENT '支付类型(1-在线支付)',
  `money` decimal(19,4) DEFAULT NULL COMMENT '金额',
  `result` int(10) DEFAULT NULL COMMENT '结果(1-成功， 2-失败， 3-待支付)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户充值表';

-- ----------------------------
-- Records of users_pay_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `users_scoring_detail`
-- ----------------------------
DROP TABLE IF EXISTS `users_scoring_detail`;
CREATE TABLE `users_scoring_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户积分详情id',
  `user_id` int(10) DEFAULT NULL COMMENT '户用id',
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '间时',
  `operator_type` int(10) DEFAULT NULL COMMENT '操作类别(1-消费， 2-入账)',
  `scoring` int(10) DEFAULT NULL COMMENT '积分',
  `scoring_balance` decimal(19,4) DEFAULT NULL COMMENT '积分余额',
  `memo` varchar(100) DEFAULT '' COMMENT '说明',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户积分详情表';

-- ----------------------------
-- Records of users_scoring_detail
-- ----------------------------
