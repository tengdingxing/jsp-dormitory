/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50562
Source Host           : localhost:3306
Source Database       : dormitory

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2021-01-25 21:34:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `admin_userid` tinyint(10) NOT NULL AUTO_INCREMENT,
  `admin_name` char(20) NOT NULL,
  `admin_password` char(20) NOT NULL,
  PRIMARY KEY (`admin_userid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf32;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('1', 'admin', '123456');
INSERT INTO `admin_user` VALUES ('2', 'zhangsan', '123456');

-- ----------------------------
-- Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` tinyint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `url` varchar(20) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- ----------------------------
-- Records of permission
-- ----------------------------

-- ----------------------------
-- Table structure for `permission_role`
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `id` tinyint(10) NOT NULL AUTO_INCREMENT,
  `role_id` tinyint(10) DEFAULT NULL,
  `permission_id` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- ----------------------------
-- Records of permission_role
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` tinyint(10) NOT NULL AUTO_INCREMENT,
  `role_name` char(20) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf32;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'ROLE_admin');
INSERT INTO `role` VALUES ('2', 'ROLE_user');

-- ----------------------------
-- Table structure for `role_admin`
-- ----------------------------
DROP TABLE IF EXISTS `role_admin`;
CREATE TABLE `role_admin` (
  `id` tinyint(10) NOT NULL AUTO_INCREMENT,
  `admin_userid` tinyint(10) NOT NULL,
  `role_id` tinyint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf32;

-- ----------------------------
-- Records of role_admin
-- ----------------------------
INSERT INTO `role_admin` VALUES ('1', '1', '1');
INSERT INTO `role_admin` VALUES ('2', '2', '2');

-- ----------------------------
-- Table structure for `t_bed`
-- ----------------------------
DROP TABLE IF EXISTS `t_bed`;
CREATE TABLE `t_bed` (
  `bed_id` tinyint(10) NOT NULL AUTO_INCREMENT,
  `bed_name` char(20) NOT NULL,
  `room_name` varchar(20) NOT NULL,
  `flag` char(2) NOT NULL,
  PRIMARY KEY (`bed_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf32;

-- ----------------------------
-- Records of t_bed
-- ----------------------------
INSERT INTO `t_bed` VALUES ('20', 'A上', '5b604', '1');
INSERT INTO `t_bed` VALUES ('21', 'A下', '5B604', '1');
INSERT INTO `t_bed` VALUES ('22', 'B上', '5b604', '0');

-- ----------------------------
-- Table structure for `t_class`
-- ----------------------------
DROP TABLE IF EXISTS `t_class`;
CREATE TABLE `t_class` (
  `class_id` tinyint(10) NOT NULL AUTO_INCREMENT,
  `class_name` char(20) NOT NULL,
  `major_id` tinyint(10) NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf32;

-- ----------------------------
-- Records of t_class
-- ----------------------------
INSERT INTO `t_class` VALUES ('1', '计科17-1班', '1');
INSERT INTO `t_class` VALUES ('2', '计科17-2班', '1');
INSERT INTO `t_class` VALUES ('3', '网营17-1班', '2');

-- ----------------------------
-- Table structure for `t_major`
-- ----------------------------
DROP TABLE IF EXISTS `t_major`;
CREATE TABLE `t_major` (
  `major_id` tinyint(10) NOT NULL AUTO_INCREMENT,
  `major_name` char(20) NOT NULL,
  PRIMARY KEY (`major_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf32;

-- ----------------------------
-- Records of t_major
-- ----------------------------
INSERT INTO `t_major` VALUES ('1', '计算机科学与技术');
INSERT INTO `t_major` VALUES ('2', '网络营销');
INSERT INTO `t_major` VALUES ('3', '通讯工程');
INSERT INTO `t_major` VALUES ('4', '冶金工艺与制造');

-- ----------------------------
-- Table structure for `t_reason`
-- ----------------------------
DROP TABLE IF EXISTS `t_reason`;
CREATE TABLE `t_reason` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `reason` varchar(100) NOT NULL,
  `number` char(20) NOT NULL,
  `flag` char(5) NOT NULL,
  `name` char(20) NOT NULL,
  `majorid` int(20) NOT NULL,
  `classid` int(20) NOT NULL,
  `roomid` int(20) NOT NULL,
  `bedid` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32;

-- ----------------------------
-- Records of t_reason
-- ----------------------------
INSERT INTO `t_reason` VALUES ('1', '申请换宿舍', '5171912133', '0', '林菲菲', '1', '1', '5', '20');

-- ----------------------------
-- Table structure for `t_room`
-- ----------------------------
DROP TABLE IF EXISTS `t_room`;
CREATE TABLE `t_room` (
  `room_id` tinyint(10) NOT NULL AUTO_INCREMENT,
  `room_name` char(20) NOT NULL,
  `flag` char(5) NOT NULL,
  `bedcount` tinyint(5) NOT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf32;

-- ----------------------------
-- Records of t_room
-- ----------------------------
INSERT INTO `t_room` VALUES ('5', '5b604', '0', '8');
INSERT INTO `t_room` VALUES ('6', '5b605', '0', '6');

-- ----------------------------
-- Table structure for `t_student`
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `id` tinyint(10) NOT NULL AUTO_INCREMENT,
  `student_number` char(20) NOT NULL,
  `student_name` char(20) NOT NULL,
  `sex` char(5) NOT NULL,
  `major_id` tinyint(10) NOT NULL,
  `class_id` tinyint(10) NOT NULL,
  `room_id` tinyint(10) NOT NULL,
  `bed_id` tinyint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf32;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('2', '5171912136', 'msq', '女', '1', '1', '5', '21');
INSERT INTO `t_student` VALUES ('3', '5171912133', '林菲菲', '女', '1', '1', '5', '20');
