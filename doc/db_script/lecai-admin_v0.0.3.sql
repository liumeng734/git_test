/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50600
Source Host           : localhost:3306
Source Database       : simple

Target Server Type    : MYSQL
Target Server Version : 50600
File Encoding         : 65001

Date: 2015-05-06 23:32:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `pub_authorities`
-- ----------------------------
DROP TABLE IF EXISTS `pub_authorities`;
CREATE TABLE `pub_authorities` (
  `authority_id` varchar(32) NOT NULL,
  `authority_name` varchar(64) NOT NULL,
  `authority_desc` varchar(128) DEFAULT NULL,
  `enable` char(1) NOT NULL,
  `is_sys` char(1) NOT NULL,
  PRIMARY KEY (`authority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pub_authorities
-- ----------------------------
INSERT INTO `pub_authorities` VALUES ('AUTH_1377925254409', '机构管理', '', '1', '1');
INSERT INTO `pub_authorities` VALUES ('AUTH_1377925320407', '用户管理', '', '1', '1');
INSERT INTO `pub_authorities` VALUES ('AUTH_1377925329991', '角色管理', '', '1', '1');
INSERT INTO `pub_authorities` VALUES ('AUTH_1377925337277', '权限管理', '', '1', '1');
INSERT INTO `pub_authorities` VALUES ('AUTH_1377925344384', '资源管理', '', '1', '1');
INSERT INTO `pub_authorities` VALUES ('AUTH_1377925351603', '菜单管理', '', '1', '1');
INSERT INTO `pub_authorities` VALUES ('AUTH_1385021957879', '参数管理', '', '1', '1');
INSERT INTO `pub_authorities` VALUES ('AUTH_1429715430922', '客户一览表', '', '1', '1');
INSERT INTO `pub_authorities` VALUES ('AUTH_1429924043380', '客户账户明细', '', '1', '1');
INSERT INTO `pub_authorities` VALUES ('AUTH_1429926827774', '客户账户充值', '', '1', '1');
INSERT INTO `pub_authorities` VALUES ('AUTH_1429927118773', '客户登陆日志', '', '1', '1');
INSERT INTO `pub_authorities` VALUES ('AUTH_1429934573893', '各玩法时间设置', '', '1', '1');
INSERT INTO `pub_authorities` VALUES ('AUTH_1430648860265', '处理用户充值问题', '', '1', '1');
INSERT INTO `pub_authorities` VALUES ('AUTH_1430826476666', '处理用户提款申请', '', '1', '1');
INSERT INTO `pub_authorities` VALUES ('AUTH_1430912297429', '期号管理', '', '1', '1');

-- ----------------------------
-- Table structure for `pub_authorities_resources`
-- ----------------------------
DROP TABLE IF EXISTS `pub_authorities_resources`;
CREATE TABLE `pub_authorities_resources` (
  `id` varchar(32) NOT NULL,
  `authority_id` varchar(32) NOT NULL,
  `resource_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pub_authorities_resources
-- ----------------------------
INSERT INTO `pub_authorities_resources` VALUES ('0099a3b5347e45218817a0ff4dac94c7', 'AUTH_1377925344384', 'res1377893518122');
INSERT INTO `pub_authorities_resources` VALUES ('01f4463eb1124cb1937015f52b94ff8f', 'AUTH_1377925344384', 'res1377893560233');
INSERT INTO `pub_authorities_resources` VALUES ('0289313ed04e40b1a73ee4a660dc625a', 'AUTH_1377925329991', 'res1377893281414');
INSERT INTO `pub_authorities_resources` VALUES ('05853765dcd6444794dc4579f8969e06', 'AUTH_1377925337277', 'res1377893378977');
INSERT INTO `pub_authorities_resources` VALUES ('059ce2ca191a4c5db7f1e457f4853284', 'AUTH_1385021957879', 'res1385021795181');
INSERT INTO `pub_authorities_resources` VALUES ('0e76695f30f447e5be1c30e1d83ece10', 'AUTH_1430648860265', 'res1430648844663');
INSERT INTO `pub_authorities_resources` VALUES ('1f337c5805a44b7da68c6fadb1d65e69', 'AUTH_1377925351603', 'res1377893867720');
INSERT INTO `pub_authorities_resources` VALUES ('22c74a64eedd4d63919cbd3e1ebf8080', 'AUTH_1377925329991', 'res1377949463024');
INSERT INTO `pub_authorities_resources` VALUES ('25ea67a4c3304a7abd5ad2be0542ead7', 'AUTH_1377925320407', 'res1377948474223');
INSERT INTO `pub_authorities_resources` VALUES ('40ecd640bece4cf3b2eb4f75320c3b5d', 'AUTH_1385021957879', 'res1385021651938');
INSERT INTO `pub_authorities_resources` VALUES ('42967d96553044e0bd278d0e25ce086c', 'AUTH_1430912297429', 'res1430912262972');
INSERT INTO `pub_authorities_resources` VALUES ('47d3928b61fd4fbe8bcc66c2e71c3c06', 'AUTH_1377925351603', 'res1377953767306');
INSERT INTO `pub_authorities_resources` VALUES ('48d9b3510eea4db888f1ab8520fcb77c', 'AUTH_1429934573893', 'res1429934501589');
INSERT INTO `pub_authorities_resources` VALUES ('49c84f5e44c74ba4b16d3e63c2d088b2', 'AUTH_1377925337277', 'res1377893364765');
INSERT INTO `pub_authorities_resources` VALUES ('49fdd037627f42f5a34bfcd306d0268f', 'AUTH_1429924043380', 'res1429923850983');
INSERT INTO `pub_authorities_resources` VALUES ('4d6c7b2ca903477fb61c35d2032bafdd', 'AUTH_1377925320407', 'res1377893155400');
INSERT INTO `pub_authorities_resources` VALUES ('4f26944594974e8fb3cd94a13cb61294', 'AUTH_1377925254409', 'res1377947996512');
INSERT INTO `pub_authorities_resources` VALUES ('4fc574c4a16a4159bba0d1cf2e8b68c2', 'AUTH_1377925329991', 'res1377893296002');
INSERT INTO `pub_authorities_resources` VALUES ('5e35b4e70f794ed7825dba11edb0af7a', 'AUTH_1377925254409', 'res1377877933606');
INSERT INTO `pub_authorities_resources` VALUES ('5fc7b5884d12498896dd030c976a1421', 'AUTH_1377925344384', 'res1377953618390');
INSERT INTO `pub_authorities_resources` VALUES ('61fdd7a93ace4f24bf04c59428acece3', 'AUTH_1377925344384', 'res1377893532098');
INSERT INTO `pub_authorities_resources` VALUES ('633ddbe974cd4061bdf0cbc36825c2a4', 'AUTH_1385021957879', 'res1385021889459');
INSERT INTO `pub_authorities_resources` VALUES ('6a06c189ffb344178e0e7211665cd0e3', 'AUTH_1377925337277', 'res1377953461190');
INSERT INTO `pub_authorities_resources` VALUES ('7132b6880be8405d9045ef5d5562fd63', 'AUTH_1377925337277', 'res1377893444246');
INSERT INTO `pub_authorities_resources` VALUES ('7e78d1c29177407f9e9077280c4a97a7', 'AUTH_1377925337277', 'res1377893396054');
INSERT INTO `pub_authorities_resources` VALUES ('8790ab9f47b844af9cb8c07f25fbf153', 'AUTH_1430826476666', 'res1430826461716');
INSERT INTO `pub_authorities_resources` VALUES ('9816c91e7bc04758a65557a4bb37f483', 'AUTH_1377925320407', 'res1377893137228');
INSERT INTO `pub_authorities_resources` VALUES ('9b6efbd3aa514c8eb4b98b65429c4d7e', 'AUTH_1377925320407', 'res1377948503153');
INSERT INTO `pub_authorities_resources` VALUES ('9ded854025244edaa41fa1f956a4810d', 'AUTH_1377925344384', 'res1377893503853');
INSERT INTO `pub_authorities_resources` VALUES ('a0aedfdc2b3d47f3bb32effbe6304ef4', 'AUTH_1377925351603', 'res1377893881340');
INSERT INTO `pub_authorities_resources` VALUES ('a6bb020168564291bd23cee20e426756', 'AUTH_1429926827774', 'res1429926786992');
INSERT INTO `pub_authorities_resources` VALUES ('a83e4006c550451c9a42ede32f425cac', 'AUTH_1377925320407', 'res1377893215540');
INSERT INTO `pub_authorities_resources` VALUES ('ad1e29ec67b7449a98bc35d88247e4c6', 'AUTH_1377925254409', 'res1377868722342');
INSERT INTO `pub_authorities_resources` VALUES ('b37b576c994b4be8a72fe65741ebe170', 'AUTH_1377925320407', 'res1377893170111');
INSERT INTO `pub_authorities_resources` VALUES ('bcf4b06a0fba4542b80b791654df85d3', 'AUTH_1385021957879', 'res1385022438821');
INSERT INTO `pub_authorities_resources` VALUES ('be259ebc3c5946b9afb20b44f14916b0', 'AUTH_1377925329991', 'res1377949502269');
INSERT INTO `pub_authorities_resources` VALUES ('be6cf531102848da982cbeb86953ae85', 'AUTH_1377925254409', 'res1377868741129');
INSERT INTO `pub_authorities_resources` VALUES ('bf53f5de3c1c46be8676ca72c0d0bdbd', 'AUTH_1377925329991', 'res1377893316245');
INSERT INTO `pub_authorities_resources` VALUES ('c458f485a755493ab7249ee834ac510a', 'AUTH_1377925344384', 'res1377893577864');
INSERT INTO `pub_authorities_resources` VALUES ('cc3f25353e534cb0a24ec18f7937a41f', 'AUTH_1429927118773', 'res1429927102292');
INSERT INTO `pub_authorities_resources` VALUES ('cfcd5ce61c5940adad97c537cc5ed158', 'AUTH_1377925254409', 'res1377768638475');
INSERT INTO `pub_authorities_resources` VALUES ('d164c779aa8244f7992788cffe5793f4', 'AUTH_1377925344384', 'res1377953645526');
INSERT INTO `pub_authorities_resources` VALUES ('d2b2320337a44c6aa808396af83ead0c', 'AUTH_1429715430922', 'res1429715405514');
INSERT INTO `pub_authorities_resources` VALUES ('d87ad76f30fe48a3bedc91e4af085dd9', 'AUTH_1377925351603', 'res1377893896653');
INSERT INTO `pub_authorities_resources` VALUES ('ebed278bd78e4d3e8cfd70ac2b0841c2', 'AUTH_1385021957879', 'res1385021674643');
INSERT INTO `pub_authorities_resources` VALUES ('f1416ed2026c40838f9c2a90c8e3ff56', 'AUTH_1377925337277', 'res1377953535482');
INSERT INTO `pub_authorities_resources` VALUES ('f1cdb12f5a604dd5a75074a54c898fb2', 'AUTH_1377925329991', 'res1377893266799');
INSERT INTO `pub_authorities_resources` VALUES ('f4329c3ffb20495d882a9a7baa710adc', 'AUTH_1377925254409', 'res1377947959118');

-- ----------------------------
-- Table structure for `pub_menu`
-- ----------------------------
DROP TABLE IF EXISTS `pub_menu`;
CREATE TABLE `pub_menu` (
  `menu_id` varchar(32) NOT NULL,
  `menu_name` varchar(64) DEFAULT NULL,
  `menu_url` varchar(64) DEFAULT NULL,
  `menu_type` char(1) DEFAULT NULL,
  `menu_pid` varchar(32) DEFAULT NULL,
  `menu_desc` varchar(64) DEFAULT NULL,
  `open_type` char(1) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pub_menu
-- ----------------------------
INSERT INTO `pub_menu` VALUES ('00', '系统菜单', null, '1', '0', '00', '');
INSERT INTO `pub_menu` VALUES ('0000', '系统管理', '', '1', '00', '01', '');
INSERT INTO `pub_menu` VALUES ('000001', '用户管理', '/user', '0', '0000', '0102', 'a');
INSERT INTO `pub_menu` VALUES ('000002', '角色管理', '/role', '0', '0000', '0103', 'a');
INSERT INTO `pub_menu` VALUES ('000003', '权限管理', '/authority', '0', '0000', '0104', 'a');
INSERT INTO `pub_menu` VALUES ('000004', '资源管理', '/resource', '0', '0000', '0105', 'a');
INSERT INTO `pub_menu` VALUES ('000005', '菜单管理', '/menu', '0', '0000', '0106', 'a');
INSERT INTO `pub_menu` VALUES ('000006', '参数管理', '/sysparam', '0', '0000', '0107', 'a');
INSERT INTO `pub_menu` VALUES ('0001', '客户管理', '', '1', '00', '02', '');
INSERT INTO `pub_menu` VALUES ('000100', '客户一览表', '/customerInfo', '0', '0001', '0201', 'a');
INSERT INTO `pub_menu` VALUES ('000101', '客户账户明细', '/customer/queryCustomerAccountInfo', '0', '0001', '0202', 'a');
INSERT INTO `pub_menu` VALUES ('000102', '客户账户充值', '/customer/customerRechargeInfo', '0', '0001', '0203', 'a');
INSERT INTO `pub_menu` VALUES ('000103', '客户登录日志', '/customer/queryCustomerLog', '0', '0001', '0204', 'a');
INSERT INTO `pub_menu` VALUES ('0002', '彩票业务中心', '', '1', '00', '03', '');
INSERT INTO `pub_menu` VALUES ('000200', '各玩法时间设置', '/lottery/playTimeSetting', '0', '0002', '0301', 'a');
INSERT INTO `pub_menu` VALUES ('000201', '期号管理', '/lottery/issueManager', '0', '0002', '0302', 'a');
INSERT INTO `pub_menu` VALUES ('0003', '服务与支持中心', '', '1', '00', '04', '');
INSERT INTO `pub_menu` VALUES ('000300', '处理用户提款申请', '/server/customerDistill', '0', '0003', '0401', 'a');
INSERT INTO `pub_menu` VALUES ('000301', '处理用户充值问题', '/server/showHandleUserRecharge', '0', '0003', '0402', 'a');

-- ----------------------------
-- Table structure for `pub_org`
-- ----------------------------
DROP TABLE IF EXISTS `pub_org`;
CREATE TABLE `pub_org` (
  `org_id` varchar(32) NOT NULL,
  `org_code` varchar(32) DEFAULT NULL,
  `org_name` varchar(64) DEFAULT NULL,
  `enable` char(1) DEFAULT NULL,
  `org_address` varchar(100) DEFAULT NULL,
  `org_desc` varchar(64) DEFAULT NULL,
  `org_reserve1` varchar(32) DEFAULT NULL,
  `org_reserve2` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pub_org
-- ----------------------------
INSERT INTO `pub_org` VALUES ('org0000', '', '中国', '1', '', '', '', '');
INSERT INTO `pub_org` VALUES ('org1377746313760', '', '山东省', '1', '', '', '', '');
INSERT INTO `pub_org` VALUES ('org1377746725690', '', '河北省', '1', '', '', '', '');
INSERT INTO `pub_org` VALUES ('org1377754762767', '', '济南市', '1', '', '', '', '');
INSERT INTO `pub_org` VALUES ('org1377934856542', '', '廊坊市', '1', '', '', '', '');
INSERT INTO `pub_org` VALUES ('org1378820235899', '', '青岛市', '1', '', '', '', '');

-- ----------------------------
-- Table structure for `pub_org_desc`
-- ----------------------------
DROP TABLE IF EXISTS `pub_org_desc`;
CREATE TABLE `pub_org_desc` (
  `id` varchar(32) NOT NULL,
  `org_id` varchar(32) NOT NULL,
  `org_level` varchar(2) NOT NULL,
  `parent_id` varchar(32) NOT NULL,
  `is_parent` char(1) NOT NULL,
  `open` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pub_org_desc
-- ----------------------------
INSERT INTO `pub_org_desc` VALUES ('0000', 'org0000', '1', '0', '1', '0');
INSERT INTO `pub_org_desc` VALUES ('00000000', 'org1377746313760', '2', '0000', '1', '0');
INSERT INTO `pub_org_desc` VALUES ('000000000000', 'org1377754762767', '3', '00000000', '1', '0');
INSERT INTO `pub_org_desc` VALUES ('000000000001', 'org1378820235899', '3', '00000000', '1', '0');
INSERT INTO `pub_org_desc` VALUES ('00000001', 'org1377746725690', '2', '0000', '1', '0');
INSERT INTO `pub_org_desc` VALUES ('000000010000', 'org1377934856542', '3', '00000001', '1', '0');

-- ----------------------------
-- Table structure for `pub_resources`
-- ----------------------------
DROP TABLE IF EXISTS `pub_resources`;
CREATE TABLE `pub_resources` (
  `resource_id` varchar(32) NOT NULL,
  `resource_name` varchar(64) NOT NULL,
  `resource_type` varchar(32) NOT NULL,
  `priority` int(11) NOT NULL,
  `resource_string` varchar(128) NOT NULL,
  `resource_desc` varchar(128) DEFAULT NULL,
  `enable` char(1) NOT NULL,
  `is_sys` char(1) NOT NULL,
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pub_resources
-- ----------------------------
INSERT INTO `pub_resources` VALUES ('res1377768638475', '机构增加', 'b', '0', '/org/addPopWin', '', '1', '0');
INSERT INTO `pub_resources` VALUES ('res1377868722342', '机构修改', 'b', '0', '/org/updatePopWin', '', '1', '0');
INSERT INTO `pub_resources` VALUES ('res1377868741129', '机构删除', 'b', '0', '/org/delOrgs', '', '1', '0');
INSERT INTO `pub_resources` VALUES ('res1377877933606', '机构树查看', 'b', '0', '/org/treePopWin', '', '1', '0');
INSERT INTO `pub_resources` VALUES ('res1377893137228', '用户增加', 'b', '0', '/user/addPopWin', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377893155400', '用户修改', 'b', '0', '/user/updatePopWin', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377893170111', '用户删除', 'b', '0', '/user/delUsers', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377893215540', '用户角色', 'b', '0', '/user/updateRolePopWin', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377893266799', '角色增加', 'b', '0', '/role/addPopWin', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377893281414', '角色修改', 'b', '0', '/role/updatePopWin', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377893296002', '角色删除', 'b', '0', '/role/delRoles', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377893316245', '角色权限', 'b', '0', '/role/updateAuthPopWin', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377893364765', '权限增加', 'b', '0', '/authority/addPopWin', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377893378977', '权限修改', 'b', '0', '/authority/updatePopWin', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377893396054', '权限删除', 'b', '0', '/authority/delAuthorities', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377893444246', '权限资源', 'b', '0', '/authority/updateResPopWin', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377893503853', '资源增加', 'b', '0', '/resource/addPopWin', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377893518122', '资源修改', 'b', '0', '/resource/updatePopWin', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377893532098', '资源删除', 'b', '0', '/resource/delResources', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377893560233', '资源注册', 'b', '0', '/resource/regResPopWin', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377893577864', '资源查看', 'b', '0', '/resource/resTreePopWin', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377893867720', '菜单添加', 'b', '0', '/menu/addMenu', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377893881340', '菜单修改', 'b', '0', '/menu/updateMenu', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377893896653', '菜单删除', 'b', '0', '/menu/delMenu', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377937279687', '系统登录', 'b', '0', '/welcome', '', '1', '0');
INSERT INTO `pub_resources` VALUES ('res1377947959118', '机构菜单', 'b', '0', '/org', '', '1', '0');
INSERT INTO `pub_resources` VALUES ('res1377947996512', '机构查询', 'b', '0', '/org/queryList', '', '1', '0');
INSERT INTO `pub_resources` VALUES ('res1377948474223', '用户菜单', 'b', '0', '/user', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377948503153', '用户查询', 'b', '0', '/user/queryList', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377949463024', '角色菜单', 'b', '0', '/role', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377949502269', '角色查询', 'b', '0', '/role/queryList', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377953461190', '权限菜单', 'b', '0', '/authority', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377953535482', '权限查询', 'b', '0', '/authority/queryList', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377953618390', '资源菜单', 'b', '0', '/resource', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377953645526', '资源查询', 'b', '0', '/resource/queryList', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1377953767306', '菜单导航', 'b', '0', '/menu', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1385021651938', '参数菜单', 'b', '0', '/sysparam', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1385021674643', '参数查询', 'b', '0', '/sysparam/queryList', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1385021795181', '参数增加', 'b', '0', '/sysparam/addPopWin', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1385021889459', '参数修改', 'b', '0', '/sysparam/updatePopWin', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1385022438821', '资源删除', 'b', '0', '/sysparam/delSysParams', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1429715405514', '客户一览表', 'b', '0', '/customerInfo', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1429923850983', '客户账户明细', 'b', '0', '/customer/queryCustomerAccountInfo', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1429926786992', '用户账户充值', 'b', '0', '/customer/customerRechargeInfo', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1429927102292', '客户登录日志', 'b', '0', '/customer/queryCustomerLog', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1429934501589', '各玩法设置', 'b', '0', '/lottery/playTimeSetting', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1430648844663', '处理用户充值问题', 'b', '0', '/server/showHandleUserRecharge', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1430826461716', '处理用户提款申请', 'b', '0', '/server/customerDistill', '', '1', '1');
INSERT INTO `pub_resources` VALUES ('res1430912262972', '期号管理', 'b', '0', '/lottery/issueManager', '', '1', '1');

-- ----------------------------
-- Table structure for `pub_resources_menus`
-- ----------------------------
DROP TABLE IF EXISTS `pub_resources_menus`;
CREATE TABLE `pub_resources_menus` (
  `id` varchar(32) NOT NULL,
  `resource_id` varchar(32) DEFAULT NULL,
  `menu_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pub_resources_menus
-- ----------------------------
INSERT INTO `pub_resources_menus` VALUES ('05297cbb771541b99e15a374cdcf43fe', 'res1385021651938', '000006');
INSERT INTO `pub_resources_menus` VALUES ('1017f91ef78c48e8b86e64dc60f1b076', 'res1377893518122', '000004');
INSERT INTO `pub_resources_menus` VALUES ('10a643b1870c4dda88709aab3595cee4', 'res1377953461190', '000003');
INSERT INTO `pub_resources_menus` VALUES ('133d5e23bea444bebfd13bc7fddab2b0', 'res1377953618390', '000004');
INSERT INTO `pub_resources_menus` VALUES ('1a139cd715b94c348f73689ecbed73a6', 'res1377893378977', '000003');
INSERT INTO `pub_resources_menus` VALUES ('267803e85a7a4820aaa8cc7b4b273408', 'res1430826461716', '000300');
INSERT INTO `pub_resources_menus` VALUES ('29fbacec85cc4b4a974b7870b5fd23cc', 'res1377893316245', '000002');
INSERT INTO `pub_resources_menus` VALUES ('2a401dd8de774a12a5b13967b831db01', 'res1377893503853', '000004');
INSERT INTO `pub_resources_menus` VALUES ('32328e52f69d422fb07b02b7c93ff220', 'res1377893444246', '000003');
INSERT INTO `pub_resources_menus` VALUES ('341a08ef4a0f4beda523701a134141a2', 'res1377953767306', '000005');
INSERT INTO `pub_resources_menus` VALUES ('381a48058f2b436fafc197fd65b09b2f', 'res1377893881340', '000005');
INSERT INTO `pub_resources_menus` VALUES ('38bc66a323884a1086ffaf1e13c301c4', 'res1377893215540', '000001');
INSERT INTO `pub_resources_menus` VALUES ('391a1094ffb04bc59321fe3e59013dc9', 'res1377949502269', '000002');
INSERT INTO `pub_resources_menus` VALUES ('391f0f29494344dcb0644cbaef4cbc89', 'res1385021889459', '000006');
INSERT INTO `pub_resources_menus` VALUES ('3b690c95c28b4c29bb5688d159b545b6', 'res1385022438821', '000006');
INSERT INTO `pub_resources_menus` VALUES ('40aeae4308e14286aee18d10924f3c7a', 'res1377893155400', '000001');
INSERT INTO `pub_resources_menus` VALUES ('4387282f0ca144318fdfd9ccd89b02b5', 'res1429923850983', '000101');
INSERT INTO `pub_resources_menus` VALUES ('46ddcd57c3db4046ba0af43325734c7a', 'res1377893170111', '000001');
INSERT INTO `pub_resources_menus` VALUES ('4c5b3693a504407b963025a21aed1b56', 'res1377893577864', '000004');
INSERT INTO `pub_resources_menus` VALUES ('4f4ae37480e240689a452d1dd6bbb3fb', 'res1377953645526', '000004');
INSERT INTO `pub_resources_menus` VALUES ('5394ede9c5974d9381fdf639bf74069a', 'res1377893364765', '000003');
INSERT INTO `pub_resources_menus` VALUES ('5695c7ae42ca4e19a18b69de733beff6', 'res1385021674643', '000006');
INSERT INTO `pub_resources_menus` VALUES ('5b8ed07a391c4775926a9415c9c3c4ff', 'res1377893867720', '000005');
INSERT INTO `pub_resources_menus` VALUES ('72a8e36652f34864adbe6520c0b9793a', 'res1377893396054', '000003');
INSERT INTO `pub_resources_menus` VALUES ('80504f29de1e42388428011283b647eb', 'res1385021795181', '000006');
INSERT INTO `pub_resources_menus` VALUES ('8181eeb68d64474b94468bfb0e360597', 'res1377893296002', '000002');
INSERT INTO `pub_resources_menus` VALUES ('8b4a355b62d8490092aa7483b462e5fa', 'res1429926786992', '000102');
INSERT INTO `pub_resources_menus` VALUES ('8e8408c3d2184ebbbad102fb387b8017', 'res1430912262972', '000201');
INSERT INTO `pub_resources_menus` VALUES ('939c8fae9f6a43b49f1cd04806f42013', 'res1430648844663', '000301');
INSERT INTO `pub_resources_menus` VALUES ('94bd90b243084d6db72b756d787ecc35', 'res1377893281414', '000002');
INSERT INTO `pub_resources_menus` VALUES ('a297fe37331e4a48a193963148a90ac6', 'res1377893266799', '000002');
INSERT INTO `pub_resources_menus` VALUES ('b774ddc7fabc4592a721128d10f168a7', 'res1377893560233', '000004');
INSERT INTO `pub_resources_menus` VALUES ('bbd46333c01645a486ce9af499e2bfd8', 'res1429927102292', '000103');
INSERT INTO `pub_resources_menus` VALUES ('c8fbec680bb54c3cb56b1b1fe5221fd8', 'res1377893137228', '000001');
INSERT INTO `pub_resources_menus` VALUES ('d2bbb8c688fa441b8d7b9f77a68ceeda', 'res1377893896653', '000005');
INSERT INTO `pub_resources_menus` VALUES ('d3c8d40386d245edaf0d3e7101d7e5d1', 'res1429934501589', '000200');
INSERT INTO `pub_resources_menus` VALUES ('e0801dc197284936931daa66501c1c5f', 'res1429715405514', '000100');
INSERT INTO `pub_resources_menus` VALUES ('e5bef012fd6149d5b20eafb98230baf2', 'res1377948503153', '000001');
INSERT INTO `pub_resources_menus` VALUES ('f33237026a5848efa13dae9ca85836a6', 'res1377893532098', '000004');
INSERT INTO `pub_resources_menus` VALUES ('f6895e9f4157470f838e49b34da22966', 'res1377948474223', '000001');
INSERT INTO `pub_resources_menus` VALUES ('fbfc555c23974241b103cd3013098a34', 'res1377953535482', '000003');
INSERT INTO `pub_resources_menus` VALUES ('fd44ac71777047558a10cf55ca5c2cba', 'res1377949463024', '000002');

-- ----------------------------
-- Table structure for `pub_roles`
-- ----------------------------
DROP TABLE IF EXISTS `pub_roles`;
CREATE TABLE `pub_roles` (
  `role_id` varchar(32) NOT NULL,
  `role_name` varchar(64) NOT NULL,
  `role_desc` varchar(128) DEFAULT NULL,
  `enable` char(1) NOT NULL,
  `is_sys` char(1) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pub_roles
-- ----------------------------
INSERT INTO `pub_roles` VALUES ('role1377351043380', '超级管理员', '', '1', '1');

-- ----------------------------
-- Table structure for `pub_roles_authorities`
-- ----------------------------
DROP TABLE IF EXISTS `pub_roles_authorities`;
CREATE TABLE `pub_roles_authorities` (
  `id` varchar(32) NOT NULL,
  `role_id` varchar(32) NOT NULL,
  `authority_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pub_roles_authorities
-- ----------------------------
INSERT INTO `pub_roles_authorities` VALUES ('03345f28645045419866340a22b47345', 'role1377351043380', 'AUTH_1430648860265');
INSERT INTO `pub_roles_authorities` VALUES ('14f24a67ae2749679790539a0f7079a4', 'role1377351043380', 'AUTH_1377925344384');
INSERT INTO `pub_roles_authorities` VALUES ('343bf9213da24a8aa009774e8ace8fcd', 'role1377351043380', 'AUTH_1429715430922');
INSERT INTO `pub_roles_authorities` VALUES ('347def67d26d4e8c8d371e6ce6d641ff', 'role1377351043380', 'AUTH_1430912297429');
INSERT INTO `pub_roles_authorities` VALUES ('40794cf326e54124a9edb3cd18ef0c44', 'role1377351043380', 'AUTH_1429927118773');
INSERT INTO `pub_roles_authorities` VALUES ('4ee844646ff941e0bc2fff3d2dabca0c', 'role1377351043380', 'AUTH_1429934573893');
INSERT INTO `pub_roles_authorities` VALUES ('5204ebbb093746fe9ed622e9f7e77c0d', 'role1377351043380', 'AUTH_1377925254409');
INSERT INTO `pub_roles_authorities` VALUES ('52ad469e8e2445d69e12f5fab1a2edb1', 'role1377351043380', 'AUTH_1429924043380');
INSERT INTO `pub_roles_authorities` VALUES ('5e935e6c9eeb49a78615a9bd6deeceed', 'role1377351043380', 'AUTH_1429924043380');
INSERT INTO `pub_roles_authorities` VALUES ('74e98f1d049747e7a6c14e1ec7d315b4', 'role1377351043380', 'AUTH_1430912297429');
INSERT INTO `pub_roles_authorities` VALUES ('7b776a7c3f5a4acba6a531671f1f42b3', 'role1377351043380', 'AUTH_1429924043380');
INSERT INTO `pub_roles_authorities` VALUES ('a28cc9523b62411d9192862a8ce09c9d', 'role1377351043380', 'AUTH_1377925351603');
INSERT INTO `pub_roles_authorities` VALUES ('b0193651811a427cbba5f744a005713b', 'role1377351043380', 'AUTH_1377925329991');
INSERT INTO `pub_roles_authorities` VALUES ('b38a167c0abe4627b7a172bc21173464', 'role1377351043380', 'AUTH_1429926827774');
INSERT INTO `pub_roles_authorities` VALUES ('b440531b67f246eaba856a75b58f1b72', 'role1377351043380', 'AUTH_1377925320407');
INSERT INTO `pub_roles_authorities` VALUES ('bcf106fdec3b4b8ab80d72f53066b7cb', 'role1377351043380', 'AUTH_1429926827774');
INSERT INTO `pub_roles_authorities` VALUES ('bdf7424aff4b4549a1e95e615479cff9', 'role1377351043380', 'AUTH_1429934573893');
INSERT INTO `pub_roles_authorities` VALUES ('cdfb27e78207435592bafa85fa2705a4', 'role1377351043380', 'AUTH_1385021957879');
INSERT INTO `pub_roles_authorities` VALUES ('cf623305bbc74a3fbbd92fe096aee72b', 'role1377351043380', 'AUTH_1429715430922');
INSERT INTO `pub_roles_authorities` VALUES ('cf9ed9d6ea8f4b2098a76a0f383e33e8', 'role1377351043380', 'AUTH_1377925351603');
INSERT INTO `pub_roles_authorities` VALUES ('dc6e3a0efa654098b09ad695089609f0', 'role1377351043380', 'AUTH_1429934573893');
INSERT INTO `pub_roles_authorities` VALUES ('ec83fc207723461cb5b5b1959c1b50d8', 'role1377351043380', 'AUTH_1430826476666');
INSERT INTO `pub_roles_authorities` VALUES ('f1978c2b01364372a6e60b4c3b35d961', 'role1377351043380', 'AUTH_1377925337277');
INSERT INTO `pub_roles_authorities` VALUES ('f9598aa1b6fe44c191ebcdf7318c9b76', 'role1377351043380', 'AUTH_1430648860265');
INSERT INTO `pub_roles_authorities` VALUES ('fc5954134df64e26ae08934246253954', 'role1377351043380', 'AUTH_1377925329991');

-- ----------------------------
-- Table structure for `pub_sys_param`
-- ----------------------------
DROP TABLE IF EXISTS `pub_sys_param`;
CREATE TABLE `pub_sys_param` (
  `param_id` varchar(32) NOT NULL,
  `param_code` varchar(32) NOT NULL,
  `param_name` varchar(64) NOT NULL,
  `param_value` varchar(64) DEFAULT NULL,
  `param_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`param_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pub_sys_param
-- ----------------------------
INSERT INTO `pub_sys_param` VALUES ('186d6188e1214489aad9e02f737beafb', 'API-KEY', '短信密钥', 'b832f01bb37905df13affa7a93350b31', '1');
INSERT INTO `pub_sys_param` VALUES ('fcfaefbef57a417fa4623959b47f50b5', 'SOCK-KEY', '通信加密密钥', '1234567890abcdef0abcdef123456789', '1');

-- ----------------------------
-- Table structure for `pub_users`
-- ----------------------------
DROP TABLE IF EXISTS `pub_users`;
CREATE TABLE `pub_users` (
  `user_id` varchar(32) NOT NULL,
  `user_account` varchar(32) NOT NULL,
  `user_name` varchar(64) DEFAULT NULL,
  `user_password` varchar(32) NOT NULL,
  `user_gender` char(1) DEFAULT NULL,
  `user_birthday` varchar(12) DEFAULT NULL,
  `user_org` varchar(32) DEFAULT NULL,
  `user_duty` varchar(32) DEFAULT NULL,
  `user_telephone` varchar(20) DEFAULT NULL,
  `mail` varchar(64) DEFAULT NULL,
  `qq_weixin` varchar(32) DEFAULT NULL,
  `user_desc` varchar(128) DEFAULT NULL,
  `enable` char(1) NOT NULL,
  `is_sys` char(1) NOT NULL,
  `err_times` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pub_users
-- ----------------------------
INSERT INTO `pub_users` VALUES ('u0001', 'admin', '管理员', 'c3ce8345d3599ab8a4c337d9fb0d0d93', null, null, 'org0000', '项目经理', '10086', '', '', '测试用户', '1', '1', '0');
INSERT INTO `pub_users` VALUES ('user1429693403808', '12121', 'admin', 'ccdbe2cc374d1a8825f745349c834f5c', null, null, '0rg0000', '1', '1', '1', '1', '1', '1', '1', null);

-- ----------------------------
-- Table structure for `pub_users_roles`
-- ----------------------------
DROP TABLE IF EXISTS `pub_users_roles`;
CREATE TABLE `pub_users_roles` (
  `id` varchar(32) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  `role_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pub_users_roles
-- ----------------------------
INSERT INTO `pub_users_roles` VALUES ('8e6167710c414db5b295582b6390b00e', 'u0001', 'role1377351043380');
