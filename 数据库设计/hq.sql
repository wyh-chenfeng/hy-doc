/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50532
Source Host           : localhost:3306
Source Database       : hydb

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2016-07-23 23:02:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for m_department
-- ----------------------------
DROP TABLE IF EXISTS `m_department`;
CREATE TABLE `m_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '部门名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_department
-- ----------------------------
INSERT INTO `m_department` VALUES ('1', '市场部');
INSERT INTO `m_department` VALUES ('2', '技术部');
INSERT INTO `m_department` VALUES ('3', '综管部');

-- ----------------------------
-- Table structure for t_banner
-- ----------------------------
DROP TABLE IF EXISTS `t_banner`;
CREATE TABLE `t_banner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image` varchar(85) NOT NULL COMMENT '图片地址',
  `title` varchar(45) DEFAULT NULL COMMENT '标题',
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_banner
-- ----------------------------

-- ----------------------------
-- Table structure for t_home
-- ----------------------------
DROP TABLE IF EXISTS `t_home`;
CREATE TABLE `t_home` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(2550) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_home
-- ----------------------------
INSERT INTO `t_home` VALUES ('1', '撒旦法', '2016-07-23 23:01:58', '2016-07-23 23:01:58');

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(4) NOT NULL,
  `image` varchar(200) NOT NULL COMMENT '图片',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `content` text NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_news
-- ----------------------------

-- ----------------------------
-- Table structure for t_position
-- ----------------------------
DROP TABLE IF EXISTS `t_position`;
CREATE TABLE `t_position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `department_id` bigint(20) NOT NULL COMMENT '部门ID',
  `name` varchar(45) NOT NULL COMMENT '职位名称',
  `address` varchar(45) NOT NULL COMMENT '工作地址',
  `duty` text NOT NULL COMMENT '职责',
  `recruitment` text NOT NULL COMMENT '招聘条件',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `fk_t_position_m_department_idx` (`department_id`),
  CONSTRAINT `fk_t_position_m_department` FOREIGN KEY (`department_id`) REFERENCES `m_department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_position
-- ----------------------------
