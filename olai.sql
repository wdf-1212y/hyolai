/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 100119
Source Host           : localhost:3306
Source Database       : olai

Target Server Type    : MYSQL
Target Server Version : 100119
File Encoding         : 65001

Date: 2022-09-24 19:44:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `isDefault` varchar(255) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '张三', '17836205066', '山西省', '太原市', '小店区', '666号院', '1', '4');
INSERT INTO `address` VALUES ('2', '张小海', '17836205060', '北京市', '海淀区', 'xx区', '6号院', '0', '4');
INSERT INTO `address` VALUES ('3', '李四', '17836205062', '河北省', '石家庄市', 'yy区', '8号院', '0', '3');
INSERT INTO `address` VALUES ('5', '小张', '17836205055', '北京市', '市辖区', '西城区', '', 'false', '4');
INSERT INTO `address` VALUES ('6', '张宁', '13456565656', '天津市', '市辖区', '和平区', '', 'false', '4');

-- ----------------------------
-- Table structure for goods_cart
-- ----------------------------
DROP TABLE IF EXISTS `goods_cart`;
CREATE TABLE `goods_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uId` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `imgUrl` varchar(255) DEFAULT NULL,
  `pprice` varchar(255) DEFAULT NULL,
  `num` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_cart
-- ----------------------------

-- ----------------------------
-- Table structure for goods_search
-- ----------------------------
DROP TABLE IF EXISTS `goods_search`;
CREATE TABLE `goods_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgUrl` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pprice` varchar(255) DEFAULT NULL,
  `oprice` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_search
-- ----------------------------
INSERT INTO `goods_search` VALUES ('1', '../../static/img/commodity1.jpg', '绒毛衫2022秋冬季新款，爆火疯抢中，最低七折', '209', '299', '7');
INSERT INTO `goods_search` VALUES ('2', '../../static/img/commodity2.jpg', '短款绒毛大衣', '299', '499', '6');
INSERT INTO `goods_search` VALUES ('3', '../../static/img/commodity3.jpg', '短款衬衫', '224', '320', '7');
INSERT INTO `goods_search` VALUES ('4', '../../static/img/commodity4.jpg', '中长款呢子大衣', '280', '300', '7');

-- ----------------------------
-- Table structure for store_order
-- ----------------------------
DROP TABLE IF EXISTS `store_order`;
CREATE TABLE `store_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uId` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `goods_name` varchar(255) DEFAULT NULL,
  `goods_price` varchar(255) DEFAULT NULL,
  `goods_num` varchar(255) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of store_order
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `userPwd` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `imgUrl` varchar(255) DEFAULT NULL,
  `nickName` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '张三', '123456', '17836205064', '../../static/img/myheader.jpg', '祺祺怪怪', 'null');
INSERT INTO `user` VALUES ('3', '', '111111', '17836205062', '../../static/img/logo.jpg', '默认昵称', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiMTc4MzYyMDUwNjUiLCJpYXQiOjE2NjM5MzIzOTN9.Cq7fwvhch5GcHW4F3DbZKE-69LInXv8KxKUZojhaknA');
INSERT INTO `user` VALUES ('4', '', '111111', '17836205065', '../../static/img/logo.jpg', '默认昵称', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiMTc4MzYyMDUwNjUiLCJpYXQiOjE2NjM5MzU2MTV9.uhFzwnxM8vIE2n7ikZKcYmXSNYcAt6_boIryENepLNU');
