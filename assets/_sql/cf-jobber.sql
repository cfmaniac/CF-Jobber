/*
Navicat MySQL Data Transfer

Source Server         : Localhost.com
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : cf-jobber

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2014-10-08 10:39:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `company` varchar(150) DEFAULT '',
  `industry` varchar(255) DEFAULT NULL,
  `title` varchar(100) DEFAULT '',
  `summary` varchar(255) DEFAULT NULL,
  `description` text,
  `reqs_skills` text,
  `reqs_responsibilities` text,
  `reqs_education` text NOT NULL,
  `reqs_additional` text,
  `years_experience` int(10) DEFAULT NULL,
  `career_level` varchar(255) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `outside_location` varchar(150) NOT NULL,
  `poster_email` varchar(100) NOT NULL,
  `speak_english` bit(1) DEFAULT NULL,
  `speak_others` bit(1) DEFAULT NULL,
  `speak_others_list` varchar(255) DEFAULT NULL,
  `salary_doe` bit(1) NOT NULL DEFAULT b'0',
  `salary_min` int(10) DEFAULT NULL,
  `salary_max` int(10) DEFAULT NULL,
  `salary_annual` bit(1) NOT NULL DEFAULT b'1',
  `spotlight` bit(1) NOT NULL,
  `apply_online` bit(1) NOT NULL DEFAULT b'1',
  `created_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `views_count` int(11) DEFAULT '0',
  `is_active` tinyint(4) NOT NULL,
  `is_temp` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  KEY `category_id` (`category_id`),
  KEY `city_id` (`city_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobs
-- ----------------------------
INSERT INTO `jobs` VALUES ('1', '1', '1', 'Mount Pleasant Water Works', 'Field Staff', 'web developer', null, 'We\\\'re a startup searching for a cool web developer that masters following technologies:\r\n* php, mysql\r\n* javascript, dom, ajax\r\n* html, css\r\n\r\nPerson should also have a good sense of user behavior.\r\n\r\nExcellent payment! ;)', null, null, '', null, '5', 'Mid-Career', null, '', 'sss', 'jobs@fooinc.com', '', '\0', null, '\0', '35000', '39000', '', '', '', '2014-04-14 07:48:26', '18', '1', '0');
INSERT INTO `jobs` VALUES ('2', '3', '2', 'Mount Pleasant Water Works', 'Office / Administrative', 'Illustrator/Photoshop expert', null, 'Could you redraw in Illustrator da Vinci\\\'s Gioconda, blindfolded?\r\nLet us know! :)', null, null, '', null, '4', 'Middle Management', null, '', '', 'jobs@unrealexpectations.com', '', '\0', null, '\0', '45000', '65000', '', '\0', '', '2014-04-14 07:48:26', '6', '1', '0');
INSERT INTO `jobs` VALUES ('4', '1', '1', 'Mount Pleasant Water Works', 'Field Staff', 'web developer 3', null, 'We\\\'re a startup searching for a cool web developer that masters following technologies:\r\n* php, mysql\r\n* javascript, dom, ajax\r\n* html, css\r\n\r\nPerson should also have a good sense of user behavior.\r\n\r\nExcellent payment! ;)', null, null, '', null, '3', 'JourneyMan', null, '', 'London, UK', 'jobs@fooinc.com', '', '\0', null, '\0', '35000', '39000', '', '', '', '2014-04-14 07:48:26', '8', '1', '0');
INSERT INTO `jobs` VALUES ('5', '1', '1', 'Mount Pleasant Water Works', 'Field Staff', 'web developer 2', null, 'We\\\'re a startup searching for a cool web developer that masters following technologies:\r\n* php, mysql\r\n* javascript, dom, ajax\r\n* html, css\r\n\r\nPerson should also have a good sense of user behavior.\r\n\r\nExcellent payment! ;)', null, null, '', null, '10', 'Manager', null, '', 'London, UK', 'jobs@fooinc.com', '', '', 'Spanish, Portugese, Arabic', '\0', '65000', '80000', '', '\0', '', '2014-04-14 07:48:26', '6', '1', '0');
INSERT INTO `jobs` VALUES ('11', '1', '3', 'Mount Pleasant Water Works', 'General', 'nice developer needed', null, 'asdfsd', null, null, '', null, null, 'Digital Diety', '1', '', '', 'jobs@fooinc.com', '', '\0', null, '', null, null, '', '', '', '2014-04-14 07:48:26', '2', '1', '0');

-- ----------------------------
-- Table structure for jobs_admin
-- ----------------------------
DROP TABLE IF EXISTS `jobs_admin`;
CREATE TABLE `jobs_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobs_admin
-- ----------------------------
INSERT INTO `jobs_admin` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- ----------------------------
-- Table structure for jobs_applications
-- ----------------------------
DROP TABLE IF EXISTS `jobs_applications`;
CREATE TABLE `jobs_applications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jobs_id` int(10) unsigned NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `cv_path` varchar(255) DEFAULT NULL,
  `message` text,
  `created_on` datetime NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_id` (`jobs_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobs_applications
-- ----------------------------

-- ----------------------------
-- Table structure for jobs_categories
-- ----------------------------
DROP TABLE IF EXISTS `jobs_categories`;
CREATE TABLE `jobs_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `var_name` varchar(32) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `keywords` text NOT NULL,
  `category_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_order` (`category_order`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='programming/design/admin/etc.';

-- ----------------------------
-- Records of jobs_categories
-- ----------------------------
INSERT INTO `jobs_categories` VALUES ('1', 'Programmers', 'programmers', '', '', '', '7');
INSERT INTO `jobs_categories` VALUES ('2', 'Designers', 'designers', '', '', '', '3');
INSERT INTO `jobs_categories` VALUES ('3', 'Administrators', 'administrators', '', '', '', '0');
INSERT INTO `jobs_categories` VALUES ('7', 'Marketers', 'marketers', '', '', '', '2');
INSERT INTO `jobs_categories` VALUES ('5', 'Testers', 'testers', '', '', '', '5');
INSERT INTO `jobs_categories` VALUES ('6', 'Editors', 'editors', '', '', '', '1');
INSERT INTO `jobs_categories` VALUES ('8', 'Managers', 'managers', '', '', '', '4');
INSERT INTO `jobs_categories` VALUES ('9', 'Consultants', 'consultants', '', '', '', '6');

-- ----------------------------
-- Table structure for jobs_cities
-- ----------------------------
DROP TABLE IF EXISTS `jobs_cities`;
CREATE TABLE `jobs_cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `ascii_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobs_cities
-- ----------------------------
INSERT INTO `jobs_cities` VALUES ('1', 'London', 'London');
INSERT INTO `jobs_cities` VALUES ('2', 'Buenos Aires', 'Buenos-Aires');
INSERT INTO `jobs_cities` VALUES ('3', 'New York', 'New-York');
INSERT INTO `jobs_cities` VALUES ('4', 'Tokyo', 'Tokyo');
INSERT INTO `jobs_cities` VALUES ('5', 'Cairo', 'Cairo');

-- ----------------------------
-- Table structure for jobs_hits
-- ----------------------------
DROP TABLE IF EXISTS `jobs_hits`;
CREATE TABLE `jobs_hits` (
  `jobs_id` int(10) unsigned NOT NULL,
  `created_on` datetime NOT NULL,
  `ip` varchar(15) NOT NULL,
  KEY `jobs_id` (`jobs_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobs_hits
-- ----------------------------
INSERT INTO `jobs_hits` VALUES ('1', '2014-04-14 08:46:00', '127.0.0.1');

-- ----------------------------
-- Table structure for jobs_searches
-- ----------------------------
DROP TABLE IF EXISTS `jobs_searches`;
CREATE TABLE `jobs_searches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keywords` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobs_searches
-- ----------------------------

-- ----------------------------
-- Table structure for jobs_subscribers
-- ----------------------------
DROP TABLE IF EXISTS `jobs_subscribers`;
CREATE TABLE `jobs_subscribers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `auth` varchar(32) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobs_subscribers
-- ----------------------------

-- ----------------------------
-- Table structure for jobs_subscriber_mail_log
-- ----------------------------
DROP TABLE IF EXISTS `jobs_subscriber_mail_log`;
CREATE TABLE `jobs_subscriber_mail_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `jobs_id` int(11) NOT NULL,
  `jobs_title` varchar(100) NOT NULL,
  `jobs_summary` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobs_subscriber_mail_log
-- ----------------------------

-- ----------------------------
-- Table structure for jobs_subscriptions
-- ----------------------------
DROP TABLE IF EXISTS `jobs_subscriptions`;
CREATE TABLE `jobs_subscriptions` (
  `subscriber_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  UNIQUE KEY `subscriber_id` (`subscriber_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobs_subscriptions
-- ----------------------------

-- ----------------------------
-- Table structure for jobs_types
-- ----------------------------
DROP TABLE IF EXISTS `jobs_types`;
CREATE TABLE `jobs_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `var_name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='full-time/freelance';

-- ----------------------------
-- Records of jobs_types
-- ----------------------------
INSERT INTO `jobs_types` VALUES ('1', 'Full-time', 'fulltime');
INSERT INTO `jobs_types` VALUES ('2', 'Part-time', 'parttime');
INSERT INTO `jobs_types` VALUES ('3', 'Freelance', 'freelance');
