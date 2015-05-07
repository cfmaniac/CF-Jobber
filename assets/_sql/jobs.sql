/*
Navicat MySQL Data Transfer

Source Server         : Localhost.com
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : cf-jobber

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2014-10-10 13:49:48
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
  `speak_english` bit(1) NOT NULL DEFAULT b'1',
  `speak_others` bit(1) NOT NULL DEFAULT b'0',
  `speak_others_list` varchar(255) NOT NULL DEFAULT '',
  `salary_doe` bit(1) NOT NULL DEFAULT b'0',
  `salary_min` int(10) NOT NULL,
  `salary_max` int(10) NOT NULL,
  `salary_annual` bit(1) NOT NULL DEFAULT b'1',
  `spotlight` bit(1) NOT NULL,
  `apply_online` bit(1) NOT NULL DEFAULT b'1',
  `created_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `views_count` int(11) NOT NULL DEFAULT '0',
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  `is_temp` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

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
-- Table structure for jobs_applications
-- ----------------------------
DROP TABLE IF EXISTS `jobs_applications`;
CREATE TABLE `jobs_applications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jobs_id` int(10) unsigned NOT NULL,
  `user_id` int(10) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `cv_path` varchar(255) DEFAULT NULL,
  `message` text,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(15) NOT NULL,
  `reviewed` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `jobs_id` (`jobs_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jobs_categories
-- ----------------------------
DROP TABLE IF EXISTS `jobs_categories`;
CREATE TABLE `jobs_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `var_name` varchar(32) NOT NULL,
  `title` text,
  `description` text,
  `keywords` text,
  `category_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_order` (`category_order`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='programming/design/admin/etc.';

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
-- Table structure for jobs_hits
-- ----------------------------
DROP TABLE IF EXISTS `jobs_hits`;
CREATE TABLE `jobs_hits` (
  `jobs_id` int(10) unsigned NOT NULL,
  `created_on` datetime NOT NULL,
  `ip` varchar(15) NOT NULL,
  KEY `jobs_id` (`jobs_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
-- Table structure for jobs_subscribers
-- ----------------------------
DROP TABLE IF EXISTS `jobs_subscribers`;
CREATE TABLE `jobs_subscribers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `is_active` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
-- Table structure for jobs_subscriptions
-- ----------------------------
DROP TABLE IF EXISTS `jobs_subscriptions`;
CREATE TABLE `jobs_subscriptions` (
  `subscriber_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  UNIQUE KEY `subscriber_id` (`subscriber_id`,`category_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
-- Table structure for systemloggedin
-- ----------------------------
DROP TABLE IF EXISTS `systemloggedin`;
CREATE TABLE `systemloggedin` (
  `userid` int(11) NOT NULL DEFAULT '0',
  `expdate` datetime DEFAULT NULL,
  `userinfo` varchar(6000) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
