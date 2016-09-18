ALTER TABLE `t_banner`
ADD COLUMN `url`  varchar(255) NOT NULL AFTER `content`;

SET FOREIGN_KEY_CHECKS=0;

-- 添加经典案例
DROP TABLE IF EXISTS `t_cases`;
CREATE TABLE `t_cases` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 添加经典案例详情
DROP TABLE IF EXISTS `t_cases_detail`;
CREATE TABLE `t_cases_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cases_id` bigint(20) NOT NULL,
  `image` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cases_id` (`cases_id`),
  CONSTRAINT `t_cases_detail_ibfk_1` FOREIGN KEY (`cases_id`) REFERENCES `t_cases` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `t_cases_detail`
MODIFY COLUMN `content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `image`;

-- 添加摘要
ALTER TABLE `t_news`
MODIFY COLUMN `id`  bigint(20) NOT NULL AUTO_INCREMENT FIRST ,
MODIFY COLUMN `type`  int(4) NOT NULL COMMENT '1:公司，2行业' AFTER `id`,
CHANGE COLUMN `content` `summary`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `title`,
ADD COLUMN `content`  text NOT NULL AFTER `summary`;


