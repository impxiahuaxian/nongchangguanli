/*
Navicat MySQL Data Transfer

Source Server         : Distance
Source Server Version : 50718
Source Host           : 140.143.181.108:10028
Source Database       : farm_sys

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2020-03-10 12:21:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for assignment
-- ----------------------------
DROP TABLE IF EXISTS `assignment`;
CREATE TABLE `assignment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `assi_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '任务状态',
  `assi_type` varchar(255) NOT NULL COMMENT '任务类型',
  `assi_data` varchar(255) NOT NULL COMMENT '任务数据',
  `assi_nickname` varchar(255) DEFAULT NULL COMMENT '用户名',
  `assi_createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assignment
-- ----------------------------
INSERT INTO `assignment` VALUES ('1', '1', '播种', '1号菜地', '杨先生', '2020-03-04 11:29:04');
INSERT INTO `assignment` VALUES ('2', '1', '翻耕', '2号菜地', '袁小姐', '2020-03-04 11:33:53');
INSERT INTO `assignment` VALUES ('3', '1', '除草', '2号菜地', '邢小姐', '2020-03-04 11:34:24');
INSERT INTO `assignment` VALUES ('4', '1', '杀虫', '1号菜地', '徐先生', '2020-03-04 13:47:58');

-- ----------------------------
-- Table structure for consumerinfo
-- ----------------------------
DROP TABLE IF EXISTS `consumerinfo`;
CREATE TABLE `consumerinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `con_phone` varchar(255) NOT NULL COMMENT '手机号',
  `con_name` varchar(255) DEFAULT NULL COMMENT '客户名',
  `con_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consumerinfo
-- ----------------------------
INSERT INTO `consumerinfo` VALUES ('1', '1893927089', '杨先生', '1');
INSERT INTO `consumerinfo` VALUES ('2', '18253800317', '袁小姐', '1');
INSERT INTO `consumerinfo` VALUES ('3', '13455680324', '徐先生', '1');
INSERT INTO `consumerinfo` VALUES ('4', '18253800313', '邢小姐', '1');
INSERT INTO `consumerinfo` VALUES ('5', '13588532209', '陈先生', '1');

-- ----------------------------
-- Table structure for crops
-- ----------------------------
DROP TABLE IF EXISTS `crops`;
CREATE TABLE `crops` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cropsName` varchar(200) NOT NULL COMMENT '作物名称',
  `area` float DEFAULT NULL COMMENT '每棵所需面积',
  `profit` float DEFAULT NULL COMMENT '每棵的净收益',
  `cropsTime` int(10) DEFAULT NULL COMMENT '种植时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='农作物信息表';

-- ----------------------------
-- Records of crops
-- ----------------------------
INSERT INTO `crops` VALUES ('1', '玉米', '0.8835', '0.3177', '3');
INSERT INTO `crops` VALUES ('2', '水稻', '0.0077', '0.0036', '3');
INSERT INTO `crops` VALUES ('3', '大豆', '0.0444', '0.0119', '4');
INSERT INTO `crops` VALUES ('4', '小麦', '0.01', '0.0025', '7');
INSERT INTO `crops` VALUES ('5', '棉花', '0.0606', '0.0353', '4');
INSERT INTO `crops` VALUES ('6', '花生', '0.0833', '0.0683', '4');
INSERT INTO `crops` VALUES ('7', '油菜籽', '0.0444', '0.0121', '7');
INSERT INTO `crops` VALUES ('8', '甘蔗', '0.3333', '0.3007', '4');
INSERT INTO `crops` VALUES ('9', '柑橘', '6.6667', '3.2616', '6');

-- ----------------------------
-- Table structure for field
-- ----------------------------
DROP TABLE IF EXISTS `field`;
CREATE TABLE `field` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `area` float NOT NULL COMMENT '面积',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '起始时间',
  `time` int(3) NOT NULL DEFAULT '12' COMMENT '种植时长',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `total` float DEFAULT '0' COMMENT '菜地总收益',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='菜地信息表';

-- ----------------------------
-- Records of field
-- ----------------------------
INSERT INTO `field` VALUES ('1', '500', '杨先生', '2020-03-10 10:51:44', '12', '1', '60.248');
INSERT INTO `field` VALUES ('2', '800', '袁小姐', '2020-03-04 11:33:21', '36', '1', '658.37');
INSERT INTO `field` VALUES ('3', '450', '邢小姐', '2020-03-04 11:31:39', '24', '1', '1304.64');

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品名称',
  `quantity` int(10) DEFAULT NULL COMMENT '商品数量',
  `unit_price` float NOT NULL COMMENT '商品单价',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '商品状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES ('1', '玉米', '7000', '1.28', '1');
INSERT INTO `items` VALUES ('2', '水稻', '50000', '0.33', '1');
INSERT INTO `items` VALUES ('3', '大豆', '6542', '0.73', '1');
INSERT INTO `items` VALUES ('4', '小麦', '65240', '0.38', '1');
INSERT INTO `items` VALUES ('5', '棉花', '50000', '0.42', '1');
INSERT INTO `items` VALUES ('6', '花生', '40000', '0.55', '1');
INSERT INTO `items` VALUES ('7', '油菜籽', '88820', '0.49', '1');
INSERT INTO `items` VALUES ('8', '甘蔗', '6500', '2.1', '1');
INSERT INTO `items` VALUES ('9', '柑橘', '89200', '3.2', '1');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(255) NOT NULL COMMENT '类名',
  `method` varchar(255) NOT NULL COMMENT '方法名',
  `status_code` int(11) NOT NULL COMMENT '状态码',
  `error_msg` varchar(255) DEFAULT NULL COMMENT '错误信息',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间记录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', 'com.farm.web.FieldController', 'saveField', '0', '', '2019-12-23 00:10:41');
INSERT INTO `log` VALUES ('2', 'com.farm.web.FieldController', 'saveField', '0', '', '2019-12-23 00:14:54');
INSERT INTO `log` VALUES ('3', 'com.farm.web.FieldController', 'saveField', '0', '', '2019-12-23 17:58:01');
INSERT INTO `log` VALUES ('4', 'com.farm.web.FieldController', 'saveField', '0', '', '2019-12-23 17:58:05');
INSERT INTO `log` VALUES ('5', 'com.farm.web.UserController', 'signUp', '0', '', '2019-12-23 21:04:04');
INSERT INTO `log` VALUES ('6', 'com.farm.web.UserController', 'signIn', '0', '', '2019-12-23 21:04:11');
INSERT INTO `log` VALUES ('7', 'com.farm.web.UserController', 'changeStatus', '0', '', '2019-12-23 22:27:00');
INSERT INTO `log` VALUES ('8', 'com.farm.web.UserController', 'changeStatus', '0', '', '2019-12-23 22:27:02');
INSERT INTO `log` VALUES ('9', 'com.farm.web.UserController', 'signIn', '0', '', '2019-12-27 20:01:50');
INSERT INTO `log` VALUES ('10', 'com.farm.web.UserController', 'changeStatus', '0', '', '2019-12-27 21:00:00');
INSERT INTO `log` VALUES ('11', 'com.farm.web.AssignmentController', 'saveAssignment', '0', '', '2020-01-04 21:33:53');
INSERT INTO `log` VALUES ('12', 'com.farm.web.AssignmentController', 'saveAssignment', '0', '', '2020-01-04 21:36:59');
INSERT INTO `log` VALUES ('13', 'com.farm.web.AssignmentController', 'deleteAssignment', '0', '', '2020-01-04 21:40:05');
INSERT INTO `log` VALUES ('14', 'com.farm.web.AssignmentController', 'deleteAssignment', '0', '', '2020-01-04 21:40:10');
INSERT INTO `log` VALUES ('15', 'com.farm.web.FieldController', 'updateField', '0', '', '2020-01-05 11:41:48');
INSERT INTO `log` VALUES ('16', 'com.farm.web.FieldController', 'updateField', '0', '', '2020-01-05 11:41:48');
INSERT INTO `log` VALUES ('17', 'com.farm.web.FieldController', 'updateField', '0', '', '2020-01-05 11:41:55');
INSERT INTO `log` VALUES ('18', 'com.farm.web.FieldController', 'updateField', '0', '', '2020-01-05 11:41:55');
INSERT INTO `log` VALUES ('19', 'com.farm.web.FieldController', 'updateField', '0', '', '2020-01-05 11:41:55');
INSERT INTO `log` VALUES ('20', 'com.farm.web.UserController', 'signIn', '0', '', '2020-01-07 19:37:46');
INSERT INTO `log` VALUES ('21', 'com.farm.web.UserController', 'signIn', '0', '', '2020-01-07 20:54:22');
INSERT INTO `log` VALUES ('22', 'com.farm.web.UserController', 'signIn', '0', '', '2020-01-07 20:58:06');
INSERT INTO `log` VALUES ('23', 'com.farm.web.UserController', 'signIn', '0', '', '2020-01-07 21:00:07');
INSERT INTO `log` VALUES ('24', 'com.farm.web.UserController', 'signIn', '0', '', '2020-01-07 21:09:21');
INSERT INTO `log` VALUES ('25', 'com.farm.web.UserController', 'signIn', '0', '', '2020-01-07 21:17:16');
INSERT INTO `log` VALUES ('26', 'com.farm.web.UserController', 'signOut', '0', '', '2020-01-07 21:17:27');
INSERT INTO `log` VALUES ('27', 'com.farm.web.UserController', 'signOut', '0', '', '2020-01-07 21:17:37');
INSERT INTO `log` VALUES ('28', 'com.farm.web.SellerInfoController', 'updateSeller', '0', '', '2020-01-08 00:36:33');
INSERT INTO `log` VALUES ('29', 'com.farm.web.SellerInfoController', 'updateSeller', '0', '', '2020-01-08 00:36:33');
INSERT INTO `log` VALUES ('30', 'com.farm.web.SellerInfoController', 'updateSeller', '0', '', '2020-01-09 23:48:11');
INSERT INTO `log` VALUES ('31', 'com.farm.web.SellerInfoController', 'updateSeller', '0', '', '2020-01-09 23:48:11');
INSERT INTO `log` VALUES ('32', 'com.farm.web.SellerInfoController', 'updateSeller', '0', '', '2020-01-09 23:48:16');
INSERT INTO `log` VALUES ('33', 'com.farm.web.SellerInfoController', 'updateSeller', '0', '', '2020-01-09 23:48:16');
INSERT INTO `log` VALUES ('34', 'com.farm.web.SellerInfoController', 'updateSeller', '0', '', '2020-01-09 23:48:16');
INSERT INTO `log` VALUES ('35', 'com.farm.web.SellerInfoController', 'updateSeller', '0', '', '2020-01-09 23:48:56');
INSERT INTO `log` VALUES ('36', 'com.farm.web.SellerInfoController', 'updateSeller', '0', '', '2020-01-09 23:48:56');
INSERT INTO `log` VALUES ('37', 'com.farm.web.SellerInfoController', 'updateSeller', '0', '', '2020-01-09 23:48:56');
INSERT INTO `log` VALUES ('38', 'com.farm.web.SellerInfoController', 'updateSeller', '0', '', '2020-01-09 23:48:57');
INSERT INTO `log` VALUES ('39', 'com.farm.web.SellerInfoController', 'updateSeller', '0', '', '2020-01-09 23:50:42');
INSERT INTO `log` VALUES ('40', 'com.farm.web.SellerInfoController', 'updateSeller', '0', '', '2020-01-09 23:50:42');
INSERT INTO `log` VALUES ('41', 'com.farm.web.UserController', 'signOut', '0', '', '2020-01-10 19:31:06');
INSERT INTO `log` VALUES ('42', 'com.farm.web.UserController', 'signIn', '-1', 'com.farm.exception.DataExistException: 用户不存在', '2020-10-10 19:31:22');
INSERT INTO `log` VALUES ('43', 'com.farm.controller.FieldController', 'recommendPlan', '0', '', '2020-01-14 13:47:10');
INSERT INTO `log` VALUES ('44', 'com.farm.controller.FieldController', 'recommendPlan', '0', '', '2020-01-14 13:47:13');
INSERT INTO `log` VALUES ('45', 'com.farm.controller.FieldController', 'recommendPlan', '0', '', '2020-01-14 13:47:17');
INSERT INTO `log` VALUES ('46', 'com.farm.controller.PlantController', 'savaPlant', '0', '', '2020-01-14 13:48:30');
INSERT INTO `log` VALUES ('47', 'com.farm.controller.PlantController', 'savaPlant', '0', '', '2020-01-14 13:48:59');
INSERT INTO `log` VALUES ('48', 'com.farm.controller.PlantController', 'savaPlant', '0', '', '2020-01-14 13:49:20');
INSERT INTO `log` VALUES ('49', 'com.farm.controller.UserController', 'changeStatus', '0', '', '2020-01-14 13:52:02');

-- ----------------------------
-- Table structure for ordertable
-- ----------------------------
DROP TABLE IF EXISTS `ordertable`;
CREATE TABLE `ordertable` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL COMMENT '客户名',
  `item_name` varchar(255) NOT NULL COMMENT '商品名',
  `quantity` int(10) NOT NULL COMMENT '数量',
  `total` float DEFAULT NULL COMMENT '合计',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态',
  PRIMARY KEY (`id`),
  KEY `fk_order_user_1` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ordertable
-- ----------------------------
INSERT INTO `ordertable` VALUES ('1', '杨先生', '玉米', '557', '712.96', '2020-03-10 12:13:28', '0');
INSERT INTO `ordertable` VALUES ('2', '袁小姐', '柑橘', '123', '393.6', '2020-03-04 13:50:03', '1');
INSERT INTO `ordertable` VALUES ('3', '邢小姐', '花生', '630', '346.5', '2020-03-04 11:28:04', '0');
INSERT INTO `ordertable` VALUES ('4', '陈先生', '油菜籽', '1333', '653.17', '2020-03-04 13:49:45', '0');

-- ----------------------------
-- Table structure for plant
-- ----------------------------
DROP TABLE IF EXISTS `plant`;
CREATE TABLE `plant` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fid` int(11) NOT NULL COMMENT '菜地ID',
  `cname` varchar(255) DEFAULT NULL COMMENT '农作物名',
  `cprofit` float DEFAULT NULL COMMENT '农作物单株利润',
  `quantity` int(10) NOT NULL COMMENT '种植数量',
  `total` float DEFAULT NULL COMMENT '合计',
  `time` int(3) DEFAULT NULL COMMENT '种植时长',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plant
-- ----------------------------
INSERT INTO `plant` VALUES ('1', '1', '水稻', '0.0036', '30', '0.108', '3', '1');
INSERT INTO `plant` VALUES ('2', '1', '甘蔗', '0.3007', '200', '60.14', '4', '1');
INSERT INTO `plant` VALUES ('3', '3', '柑橘', '3.2616', '400', '1304.64', '6', '1');
INSERT INTO `plant` VALUES ('4', '2', '油菜籽', '0.0121', '500', '6.05', '7', '1');
INSERT INTO `plant` VALUES ('5', '2', '柑橘', '3.2616', '200', '652.32', '6', '1');

-- ----------------------------
-- Table structure for sellerinfo
-- ----------------------------
DROP TABLE IF EXISTS `sellerinfo`;
CREATE TABLE `sellerinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_phone` varchar(255) NOT NULL COMMENT '电话',
  `seller_name` varchar(255) NOT NULL COMMENT '商家名',
  `seller_company_name` varchar(255) NOT NULL COMMENT '公司名',
  `seller_add` varchar(255) NOT NULL COMMENT '地址',
  `seller_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `seller_alipaynum` varchar(255) NOT NULL COMMENT '支付宝',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sellerinfo
-- ----------------------------
INSERT INTO `sellerinfo` VALUES ('1', '400-118-590', '王经理', '青岛富景农业开发股份有限公司', '上海市嘉定区嘉怡路296号4137室', '1', '18232342797');
INSERT INTO `sellerinfo` VALUES ('2', '028-85765219', '陈经理', '成都优鲜农业科技有限公司', '成都天府新区华阳南湖西路168号', '1', '13423425247');
INSERT INTO `sellerinfo` VALUES ('3', '028-87975326', '陈经理', '成都蜀源农业开发有限公司', '成都市郫县新民场镇现代化都市农业园', '1', '13728734533');
INSERT INTO `sellerinfo` VALUES ('4', '028-82460160', '吴经理', '成都市花中花农业发展有限责任公司', '成都市新津县花桥镇长绍街5号', '1', '18876436333');
INSERT INTO `sellerinfo` VALUES ('5', '18228512493', '苟先生', '成都无化农业有限公司', '四川省成都市锦江区三圣街道', '1', '18228512493');

-- ----------------------------
-- Table structure for usertable
-- ----------------------------
DROP TABLE IF EXISTS `usertable`;
CREATE TABLE `usertable` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `user_pass` varchar(20) NOT NULL COMMENT '用户密码',
  `user_email` varchar(20) NOT NULL COMMENT '用户邮箱',
  `register_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '账户状态',
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`user_name`) USING HASH,
  UNIQUE KEY `email` (`user_email`) USING HASH,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of usertable
-- ----------------------------
INSERT INTO `usertable` VALUES ('1', 'admin', '123456', 'admin@qq.com', '2020-03-10 11:43:06', '1', '管理员');
INSERT INTO `usertable` VALUES ('2', 'yuanmeng', '123456', 'yuanmeng8797@163.com', '2020-03-10 11:43:08', '1', '用户');
INSERT INTO `usertable` VALUES ('3', 'xiaofeng', '123456', '123456@qq.com', '2020-03-10 11:52:59', '1', '用户');
