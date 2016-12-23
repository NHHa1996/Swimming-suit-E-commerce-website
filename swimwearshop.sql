/*
Navicat MySQL Data Transfer

Source Server         : cuong
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : swimwearshop

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-12-23 10:36:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('cuongvip1295@yahoo.com.vn', 'cuong', '1234', '1');
INSERT INTO `admin` VALUES ('kimlong19951995@gmail.com', 'kim long', '2', '2');
INSERT INTO `admin` VALUES ('cuongvip1295@gmail.com', 'Do Hung Cuong', '123', '3');

-- ----------------------------
-- Table structure for `bankaccount`
-- ----------------------------
DROP TABLE IF EXISTS `bankaccount`;
CREATE TABLE `bankaccount` (
  `bankName` varchar(255) NOT NULL,
  `money` int(11) NOT NULL,
  `bankNumber` int(11) NOT NULL,
  `bankID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`bankID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bankaccount
-- ----------------------------
INSERT INTO `bankaccount` VALUES ('C9 Bank', '17102', '123', '1');
INSERT INTO `bankaccount` VALUES ('SKT Bank', '10635', '1111', '2');
INSERT INTO `bankaccount` VALUES ('CLG Bank', '8981987', '1210', '3');
INSERT INTO `bankaccount` VALUES ('TSM Bank', '0', '11111', '4');
INSERT INTO `bankaccount` VALUES ('HD Bank', '39795', '123456789', '5');
INSERT INTO `bankaccount` VALUES ('ACB Bank', '754', '987654321', '6');
INSERT INTO `bankaccount` VALUES ('RNG Bank', '48699', '5555', '7');

-- ----------------------------
-- Table structure for `bill`
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `billID` int(11) NOT NULL AUTO_INCREMENT,
  `customerID` int(11) NOT NULL,
  `payment` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `proID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`billID`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('1', '1', '3000', '2016-10-11 13:57:36', '1', '5');
INSERT INTO `bill` VALUES ('2', '1', '50000', '2016-10-12 13:58:11', '1', '6');
INSERT INTO `bill` VALUES ('3', '2', '3000', '2016-10-12 15:30:15', '3', '5');
INSERT INTO `bill` VALUES ('4', '2', '3000', '2016-10-12 15:30:15', '4', '10');
INSERT INTO `bill` VALUES ('5', '1', '500', '2016-10-11 14:53:13', '1', '3');
INSERT INTO `bill` VALUES ('6', '1', '7', '2016-10-11 15:07:43', '6', '4');
INSERT INTO `bill` VALUES ('7', '1', '160', '2016-10-11 17:53:20', '8', '3');
INSERT INTO `bill` VALUES ('8', '1', '800', '2016-10-11 17:58:00', '4', '4');
INSERT INTO `bill` VALUES ('9', '1', '224', '2016-10-11 17:59:28', '2', '5');
INSERT INTO `bill` VALUES ('10', '1', '1622', '2016-10-11 18:03:58', '2', '6');
INSERT INTO `bill` VALUES ('11', '1', '120', '2016-10-11 18:07:25', '2', '7');
INSERT INTO `bill` VALUES ('12', '1', '180', '2016-10-11 18:08:27', '5', '7');
INSERT INTO `bill` VALUES ('13', '1', '600', '2016-10-11 18:09:15', '1', '4');
INSERT INTO `bill` VALUES ('14', '1', '11', '2016-10-11 22:43:00', '6', '10');
INSERT INTO `bill` VALUES ('15', '1', '200', '2016-10-11 22:44:10', '3', '9');
INSERT INTO `bill` VALUES ('16', '1', '6', '2016-10-11 22:44:10', '6', '6');
INSERT INTO `bill` VALUES ('17', '1', '1000', '2016-10-11 23:37:55', '2', '5');
INSERT INTO `bill` VALUES ('18', '1', '200', '2016-10-11 23:37:55', '3', '5');
INSERT INTO `bill` VALUES ('19', '1', '7', '2016-10-11 23:37:55', '6', '7');
INSERT INTO `bill` VALUES ('20', '1', '15', '2016-10-11 23:40:24', '6', '15');
INSERT INTO `bill` VALUES ('21', '1', '15', '2016-10-11 23:40:24', '8', '1');
INSERT INTO `bill` VALUES ('22', '1', '80', '2016-10-11 23:42:33', '3', '2');
INSERT INTO `bill` VALUES ('23', '1', '10', '2016-10-11 23:42:33', '6', '10');
INSERT INTO `bill` VALUES ('24', '1', '60', '2016-10-11 23:42:33', '15', '3');
INSERT INTO `bill` VALUES ('25', '8', '11', '2016-10-13 13:16:14', '6', '11');
INSERT INTO `bill` VALUES ('26', '8', '90', '2016-10-13 13:17:18', '1', '5');
INSERT INTO `bill` VALUES ('27', '8', '1200', '2016-10-13 13:19:23', '2', '6');
INSERT INTO `bill` VALUES ('28', '1', '92', '2016-10-14 13:37:41', '5', '4');
INSERT INTO `bill` VALUES ('29', '1', '90', '2016-10-14 13:37:41', '8', '6');
INSERT INTO `bill` VALUES ('30', '1', '1000', '2016-10-17 10:47:22', '2', '5');
INSERT INTO `bill` VALUES ('31', '1', '160', '2016-10-17 10:47:22', '3', '4');
INSERT INTO `bill` VALUES ('32', '9', '15', '2016-10-17 10:50:58', '6', '15');
INSERT INTO `bill` VALUES ('33', '1', '160', '2016-10-19 09:41:45', '3', '4');
INSERT INTO `bill` VALUES ('34', '1', '8', '2016-10-19 09:41:45', '6', '8');
INSERT INTO `bill` VALUES ('35', '1', '4850', '2016-10-21 08:41:59', '16', '5');
INSERT INTO `bill` VALUES ('36', '13', '320', '2016-10-21 10:24:53', '3', '8');
INSERT INTO `bill` VALUES ('37', '13', '84', '2016-10-21 10:24:53', '4', '3');
INSERT INTO `bill` VALUES ('38', '1', '1800', '2016-10-22 09:31:41', '2', '9');
INSERT INTO `bill` VALUES ('39', '1', '135', '2016-10-22 09:31:41', '7', '3');
INSERT INTO `bill` VALUES ('40', '1', '108', '2016-10-22 10:31:48', '1', '6');
INSERT INTO `bill` VALUES ('41', '1', '90', '2016-10-22 10:37:56', '1', '5');
INSERT INTO `bill` VALUES ('42', '1', '800', '2016-10-22 10:37:56', '2', '4');
INSERT INTO `bill` VALUES ('43', '1', '800', '2016-10-22 10:52:01', '2', '4');
INSERT INTO `bill` VALUES ('44', '1', '5', '2016-10-22 10:52:01', '6', '5');
INSERT INTO `bill` VALUES ('45', '17', '1000', '2016-10-22 10:59:24', '2', '5');
INSERT INTO `bill` VALUES ('46', '1', '5', '2016-10-22 18:10:58', '6', '5');
INSERT INTO `bill` VALUES ('47', '14', '7', '2016-10-22 18:14:13', '6', '7');
INSERT INTO `bill` VALUES ('48', '1', '72', '2016-10-25 22:50:14', '1', '4');
INSERT INTO `bill` VALUES ('49', '1', '600', '2016-10-25 22:50:14', '2', '3');
INSERT INTO `bill` VALUES ('50', '1', '108', '2016-10-25 23:16:16', '1', '6');
INSERT INTO `bill` VALUES ('51', '1', '1000', '2016-10-25 23:16:16', '2', '5');
INSERT INTO `bill` VALUES ('52', '1', '112', '2016-10-25 23:16:39', '4', '4');
INSERT INTO `bill` VALUES ('53', '1', '8', '2016-10-25 23:16:39', '6', '8');
INSERT INTO `bill` VALUES ('54', '1', '72', '2016-10-25 23:32:34', '1', '4');
INSERT INTO `bill` VALUES ('55', '1', '600', '2016-10-25 23:32:34', '2', '3');
INSERT INTO `bill` VALUES ('56', '12', '72', '2016-11-30 15:13:35', '1', '4');
INSERT INTO `bill` VALUES ('57', '14', '200', '2016-12-12 10:55:52', '3', '5');
INSERT INTO `bill` VALUES ('58', '14', '5', '2016-12-13 13:44:58', '6', '5');
INSERT INTO `bill` VALUES ('59', '14', '1365', '2016-12-13 13:44:58', '9', '5');
INSERT INTO `bill` VALUES ('60', '14', '105', '2016-12-13 13:44:58', '11', '7');
INSERT INTO `bill` VALUES ('61', '14', '216', '2016-12-13 13:44:58', '17', '4');

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `customerID` int(11) NOT NULL,
  `proID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`customerID`,`proID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cateName` varchar(255) NOT NULL,
  `cateID` int(11) NOT NULL AUTO_INCREMENT,
  `dadCategory` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cateID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('All Clothing', '1', null);
INSERT INTO `category` VALUES ('All women Clothing', '2', null);
INSERT INTO `category` VALUES ('All men Clothing', '3', null);
INSERT INTO `category` VALUES ('All Kids', '4', null);
INSERT INTO `category` VALUES ('All', '5', 'All Clothing');
INSERT INTO `category` VALUES ('Sports', '6', 'All Clothing');
INSERT INTO `category` VALUES ('Shorts', '7', 'All Clothing');
INSERT INTO `category` VALUES ('Bikinis', '8', 'All Clothing');
INSERT INTO `category` VALUES ('Women Shorts', '9', 'All women Clothing');
INSERT INTO `category` VALUES ('Women Bikinis', '10', 'All women Clothing');
INSERT INTO `category` VALUES ('Men Sports', '11', 'All men Clothing');
INSERT INTO `category` VALUES ('Kid Shorts', '12', 'All Kids');
INSERT INTO `category` VALUES ('Kid Bikinis', '13', 'All Kids');
INSERT INTO `category` VALUES ('Men Shorts', '14', 'All men Clothing');
INSERT INTO `category` VALUES ('Women Sports', '15', 'All women Clothing');

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `customerID` int(11) NOT NULL AUTO_INCREMENT,
  `bankID` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phonenumber` varchar(255) NOT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('kimlong19951995@gmail.com', 'Huynh Kim Long', 'ititiu13170', '2', '1', '24/7', '0908998923');
INSERT INTO `customer` VALUES ('cuongvip12101995@gmail.com', 'cuong', '12101995', '10', '7', '24/7', '0908998923');
INSERT INTO `customer` VALUES ('cuongvipro1295@gmail.com', 'cuong', '12101995', '11', '2', '24/7', '0908998923');
INSERT INTO `customer` VALUES ('cuongpro1295@yahoo.com', 'cuong', '12101995', '12', '2', '24/7', '0908998923');
INSERT INTO `customer` VALUES ('cuongpro1295@gmail.com', 'cuong', '12101995', '13', '2', '24/7', '0908998923');
INSERT INTO `customer` VALUES ('cuong@123', 'cuong dep trai', '123', '14', '1', '24/7', '0908998923');
INSERT INTO `customer` VALUES ('cuongvip1295@yahoo.com.vn', 'do hung cuong', 'hungcuong12101995', '15', '7', '24/7 tran nao street', '01219823390');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `cateID` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `proID` int(11) NOT NULL AUTO_INCREMENT,
  `proName` varchar(255) NOT NULL,
  `discount` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`proID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('8', 'kid bikini 2.jpg', null, '20', '1', 'Kid Bikini 2', '10', 'Kid Bikinis', 'Nidhi Munim');
INSERT INTO `product` VALUES ('8', 'women bikini 4.jpg', null, '200', '2', 'Women Bikini 4', '0', 'Women Bikinis', 'Exclusive');
INSERT INTO `product` VALUES ('6', 'women sport 1.jpg', 'Hot women sport 2016', '50', '3', 'Women Sport 1', '20', 'Women Sports', 'Pretty Secrets');
INSERT INTO `product` VALUES ('6', 'women sport 2.jpg', null, '50', '4', 'Women Sport 2', '45', 'Women Sports', 'Pretty Secrets');
INSERT INTO `product` VALUES ('6', 'women sport 3.jpg', null, '50', '5', 'Women Sport 3', '55', 'Women Sports', 'Exclusive');
INSERT INTO `product` VALUES ('7', 'kid short 1.jpg', null, '10', '6', 'Kid Short 1', '90', 'Kid Shorts', 'Nidhi Munim');
INSERT INTO `product` VALUES ('6', 'women sport 4.jpg', '', '50', '7', 'Women Sport 4', '10', 'Women Sports', 'Pretty Secrets');
INSERT INTO `product` VALUES ('8', 'women bikini 3.jpg', null, '15', '8', 'Women Bikini 3', '5', 'Women Bikinis', 'Vero Moda');
INSERT INTO `product` VALUES ('7', 'men short 1.jpg', null, '300', '9', 'Men Short 1', '9', 'Men Shorts', 'Gold Medal');
INSERT INTO `product` VALUES ('7', 'men short 2.jpg', null, '500', '10', 'Men Shorts 2', '30', 'Men Shorts', 'Everyday');
INSERT INTO `product` VALUES ('6', 'men sport 1.jpg', null, '300', '11', 'Men Sport 1', '95', 'Men Sports', 'Vero Moda');
INSERT INTO `product` VALUES ('6', 'men sport 2.jpg', null, '600', '12', 'Men Sport 2', '10', 'Men Sports', 'Dorothy Perkins');
INSERT INTO `product` VALUES ('8', 'kid bikini 1.jpg', null, '10', '13', 'Kid Bikini 1', '65', 'Kid Bikinis', 'Pretty Secrets');
INSERT INTO `product` VALUES ('8', 'women bikini 1.jpg', 'Hot bikini 2016', '500', '14', 'Women Bikini 1', '35', 'Women Bikinis', 'Pretty Secrets');
INSERT INTO `product` VALUES ('6', 'men sport 3.jpg', null, '100', '15', 'Men Sport 3', '80', 'Men Sports', 'Everyday');
INSERT INTO `product` VALUES ('8', 'women bikini 2.jpg', 'Hot bikini 2015', '1000', '16', 'Women Bikini 2', '3', 'Women Bikinis', 'Exclusive');
INSERT INTO `product` VALUES ('7', 'women short 1.jpg', null, '80', '17', 'women short 1', '33', 'Women Shorts', 'Omana Fashion');
