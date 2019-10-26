/*
SQLyog Community v13.1.2 (64 bit)
MySQL - 5.7.24 : Database - cake_acl
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cake_acl` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `cake_acl`;

/*Table structure for table `acos` */

CREATE TABLE `acos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `foreign_key` int(10) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `lft` int(10) DEFAULT NULL,
  `rght` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_acos_lft_rght` (`lft`,`rght`),
  KEY `idx_acos_alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

/*Data for the table `acos` */

insert  into `acos`(`id`,`parent_id`,`model`,`foreign_key`,`alias`,`lft`,`rght`) values 
(1,NULL,NULL,NULL,'controllers',1,2),
(2,NULL,NULL,NULL,'controllers',3,74),
(3,2,NULL,NULL,'Groups',4,15),
(4,3,NULL,NULL,'index',5,6),
(5,3,NULL,NULL,'view',7,8),
(6,3,NULL,NULL,'add',9,10),
(7,3,NULL,NULL,'edit',11,12),
(8,3,NULL,NULL,'delete',13,14),
(9,2,NULL,NULL,'Pages',16,19),
(10,9,NULL,NULL,'display',17,18),
(11,2,NULL,NULL,'Posts',20,35),
(12,11,NULL,NULL,'index',21,22),
(13,11,NULL,NULL,'view',23,24),
(14,11,NULL,NULL,'add',25,26),
(15,11,NULL,NULL,'edit',27,28),
(16,11,NULL,NULL,'delete',29,30),
(17,11,NULL,NULL,'login',31,32),
(18,11,NULL,NULL,'logout',33,34),
(19,2,NULL,NULL,'Users',36,51),
(20,19,NULL,NULL,'index',37,38),
(21,19,NULL,NULL,'view',39,40),
(22,19,NULL,NULL,'add',41,42),
(23,19,NULL,NULL,'edit',43,44),
(24,19,NULL,NULL,'delete',45,46),
(25,19,NULL,NULL,'login',47,48),
(26,19,NULL,NULL,'logout',49,50),
(27,2,NULL,NULL,'Widgets',52,63),
(28,27,NULL,NULL,'index',53,54),
(29,27,NULL,NULL,'view',55,56),
(30,27,NULL,NULL,'add',57,58),
(31,27,NULL,NULL,'edit',59,60),
(32,27,NULL,NULL,'delete',61,62),
(33,2,NULL,NULL,'AclExtras',64,65),
(34,2,NULL,NULL,'DebugKit',66,73),
(35,34,NULL,NULL,'ToolbarAccess',67,72),
(36,35,NULL,NULL,'history_state',68,69),
(37,35,NULL,NULL,'sql_explain',70,71);

/*Table structure for table `aros` */

CREATE TABLE `aros` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `foreign_key` int(10) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `lft` int(10) DEFAULT NULL,
  `rght` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aros_lft_rght` (`lft`,`rght`),
  KEY `idx_aros_alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `aros` */

insert  into `aros`(`id`,`parent_id`,`model`,`foreign_key`,`alias`,`lft`,`rght`) values 
(1,NULL,'Group',1,NULL,1,4),
(2,NULL,'Group',2,NULL,5,8),
(3,NULL,'Group',3,NULL,9,14),
(5,1,'User',16,NULL,2,3),
(8,2,'User',19,NULL,6,7),
(9,3,'User',20,NULL,10,11),
(10,3,'User',21,NULL,12,13);

/*Table structure for table `aros_acos` */

CREATE TABLE `aros_acos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aro_id` int(10) NOT NULL,
  `aco_id` int(10) NOT NULL,
  `_create` varchar(2) NOT NULL DEFAULT '0',
  `_read` varchar(2) NOT NULL DEFAULT '0',
  `_update` varchar(2) NOT NULL DEFAULT '0',
  `_delete` varchar(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ARO_ACO_KEY` (`aro_id`,`aco_id`),
  KEY `idx_aco_id` (`aco_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `aros_acos` */

insert  into `aros_acos`(`id`,`aro_id`,`aco_id`,`_create`,`_read`,`_update`,`_delete`) values 
(1,1,2,'1','1','1','1'),
(2,2,2,'-1','-1','-1','-1'),
(3,2,11,'1','1','1','1'),
(4,2,27,'1','1','1','1'),
(5,3,2,'-1','-1','-1','-1'),
(6,3,14,'1','1','1','1'),
(7,3,15,'1','1','1','1'),
(8,3,30,'1','1','1','1'),
(9,3,31,'1','1','1','1'),
(10,3,26,'1','1','1','1');

/*Table structure for table `groups` */

CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `groups` */

insert  into `groups`(`id`,`name`,`created`,`modified`) values 
(1,'administrators','2019-10-22 18:22:53','2019-10-22 18:22:53'),
(2,'managers','2019-10-22 18:23:01','2019-10-22 18:23:01'),
(3,'users','2019-10-22 18:23:07','2019-10-22 18:23:07');

/*Table structure for table `posts` */

CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `body` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `posts` */

insert  into `posts`(`id`,`user_id`,`title`,`body`,`created`,`modified`) values 
(1,NULL,'The title','This is the post body.','2019-10-22 09:31:14',NULL),
(2,NULL,'A title once again','And the post body follows.','2019-10-22 09:31:14',NULL),
(3,NULL,'Title strikes back','This is really exciting! Not.','2019-10-22 09:31:14',NULL),
(4,NULL,'teste 3','teste2 ','2019-10-22 13:01:18','2019-10-22 17:52:50'),
(5,NULL,'testes',' tste','2019-10-25 15:07:00','2019-10-25 15:07:00');

/*Table structure for table `users` */

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `group_id` int(11) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`group_id`,`role`,`created`,`modified`) values 
(16,'admin','1a75a603206e8a86dfe56a515bb8a6b0ff3da026',1,'','2019-10-22 19:20:50','2019-10-25 14:38:34'),
(19,'manager','d2b89b6410883da48ccb909901a2cb01937a0da3',2,'','2019-10-22 19:23:35','2019-10-22 19:23:35'),
(20,'user','0f53e6bf1472f86936f70c1b0fa0d145f5c97b3f',3,'','2019-10-22 19:24:19','2019-10-25 15:05:00'),
(21,'teste','7b9f0901e4cbf3ded7c79a4b317ab98079e0ea80',3,'','2019-10-25 13:36:19','2019-10-25 13:36:19');

/*Table structure for table `widgets` */

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `part_no` varchar(12) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `widgets` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
