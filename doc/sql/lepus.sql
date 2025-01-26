/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.5.53 : Database - lepus
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`lepus` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `lepus`;

/*Table structure for table `admin_log` */

DROP TABLE IF EXISTS `admin_log`;

CREATE TABLE `admin_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` smallint(4) DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL,
  `client_ip` varchar(100) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin_log` */

/*Table structure for table `admin_menu` */

DROP TABLE IF EXISTS `admin_menu`;

CREATE TABLE `admin_menu` (
  `menu_id` smallint(4) NOT NULL AUTO_INCREMENT,
  `menu_title` varchar(30) NOT NULL,
  `menu_level` tinyint(2) NOT NULL DEFAULT '0',
  `parent_id` tinyint(2) NOT NULL,
  `menu_url` varchar(255) DEFAULT NULL,
  `menu_icon` varchar(50) DEFAULT NULL,
  `system` tinyint(2) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `display_order` smallint(4) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

/*Data for the table `admin_menu` */

insert  into `admin_menu`(`menu_id`,`menu_title`,`menu_level`,`parent_id`,`menu_url`,`menu_icon`,`system`,`status`,`display_order`,`create_time`) values 
(3,'MySQL Monitor',1,0,'lp_mysql','icon-dashboard',0,1,3,'2014-02-25 19:57:29'),
(5,'Permission System',1,0,'rabc','icon-legal',0,1,10,'2014-02-26 12:24:33'),
(6,'Health Monitor',2,3,'lp_mysql/index',' icon-list',0,1,1,'2014-02-26 12:25:15'),
(8,'Replication Monitor',2,3,'lp_mysql/replication',' icon-list',0,1,6,'2014-02-26 12:26:05'),
(9,'Slowquery Analysis',2,3,'lp_mysql/slowquery','icon-list',0,1,9,'2014-02-26 12:26:52'),
(10,'User',2,5,'user/index','',0,1,1,'2014-02-26 12:43:02'),
(11,'Role',2,5,'role/index','',0,1,2,'2014-02-26 12:43:19'),
(12,'Menu',2,5,'menu/index','',0,1,3,'2014-02-26 12:43:41'),
(13,'Privilege',2,5,'privilege/index','',0,1,4,'2014-02-26 12:45:01'),
(15,'Authorization',2,5,'auth/index','',0,1,2,'2014-03-03 22:23:28'),
(16,'Servers Configure',1,0,'server','icon-dashboard',0,1,2,'2014-03-05 18:31:17'),
(18,'MySQL',2,16,'servers_mysql/index','icon-list',0,1,3,'2014-03-05 18:33:40'),
(19,'AWR Report',2,3,'lp_mysql/awrreport','icon-list',0,1,12,'2014-03-06 13:47:17'),
(20,'Alarm Panel',1,0,'alarm','icon-dashboard',0,1,9,'2014-03-11 21:41:13'),
(21,'Alarm List',2,20,'alarm/index','',0,1,0,'2014-03-11 21:46:28'),
(22,'OS Monitor',1,0,'lp_os','icon-dashboard',0,1,8,'2014-03-24 15:33:42'),
(26,'Disk',2,22,'lp_os/disk','icon-list',0,1,4,'2014-03-24 17:46:29'),
(28,'BigTable Analysis',2,3,'lp_mysql/bigtable','icon-list',0,1,7,'2014-04-02 13:38:15'),
(29,'Key Cache Monitor',2,3,'lp_mysql/key_cache','icon-list',0,1,3,'2014-04-09 15:52:12'),
(30,'InnoDB Monitor',2,3,'lp_mysql/innodb','icon-list',0,1,4,'2014-04-09 15:54:47'),
(31,'Resource Monitor',2,3,'lp_mysql/resource','icon-list',0,1,2,'2014-04-10 13:23:06'),
(32,'MongoDB',2,16,'servers_mongodb/index','icon-list',0,1,5,'2014-04-14 12:26:35'),
(33,'MongoDB Monitor',1,0,'lp_mongodb','icon-dashboard',0,1,5,'2014-04-14 14:15:52'),
(34,'Health Montior',2,33,'lp_mongodb/index','icon-list',0,1,1,'2014-04-14 14:17:23'),
(35,'Indexes Monitor',2,33,'lp_mongodb/indexes','icon-list',0,1,2,'2014-04-14 16:25:48'),
(36,'Memory Monitor',2,33,'lp_mongodb/memory','icon-list',0,1,3,'2014-04-14 16:26:50'),
(40,'Oracle',2,16,'servers_oracle/index','icon-list',0,1,4,'2014-05-27 13:21:49'),
(43,'Health Monitor',2,22,'lp_os/index','icon-list',0,1,0,'2014-07-08 09:19:11'),
(44,'Disk IO',2,22,'lp_os/disk_io','icon-list',0,1,5,'2014-07-15 15:35:56'),
(45,'OS',2,16,'servers_os/index','icon-list',0,1,8,'2014-07-16 10:32:13'),
(46,'Settings',2,16,'settings/index','icon-list',0,1,0,'2014-08-12 15:30:54'),
(48,'Redis Monitor',1,0,'lp_redis','icon-dashboard',0,1,6,'2014-09-02 12:36:41'),
(50,'Health Monitor',2,48,'lp_redis/index','icon-list',0,1,2,'2014-09-02 12:39:58'),
(51,'Redis',2,16,'servers_redis/index','icon-list',0,1,6,'2014-09-09 17:15:41'),
(52,'Memory Monitor',2,48,'lp_redis/memory','icon-list',0,1,3,'2014-09-11 14:34:13'),
(54,'Replication Monitor',2,48,'lp_redis/replication','icon-list',0,0,5,'2014-09-11 14:37:12'),
(56,'Oracle Monitor',1,0,'lp_oracle','icon-dashboard',0,1,4,'2014-10-24 15:34:50'),
(57,'Health Montior',2,56,'lp_oracle/index','icon-list',0,1,1,'2014-10-24 15:35:47'),
(58,'Tablespace Monitor',2,56,'lp_oracle/tablespace','icon-list',0,1,2,'2014-10-24 15:37:19'),
(63,'web',2,16,'servers_web/index','icon-list',0,1,9,'2016-08-22 16:42:23'),
(64,'web Monitor',1,0,'lp_web','icon-dashboard',0,1,7,'2016-08-22 16:45:29'),
(65,'web Visit',2,64,'lp_web/visit','icon-list',0,1,1,'2016-08-22 17:40:02'),
(66,'Health Monitor',2,64,'lp_web/index','icon-list',0,1,0,'2016-08-22 17:42:38');

/*Table structure for table `admin_privilege` */

DROP TABLE IF EXISTS `admin_privilege`;

CREATE TABLE `admin_privilege` (
  `privilege_id` smallint(4) NOT NULL AUTO_INCREMENT,
  `privilege_title` varchar(30) DEFAULT NULL,
  `menu_id` smallint(4) DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL,
  `display_order` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

/*Data for the table `admin_privilege` */

insert  into `admin_privilege`(`privilege_id`,`privilege_title`,`menu_id`,`action`,`display_order`) values 
(1,'MySQL Health Monitor',6,'lp_mysql/index',1),
(3,'MySQL Replication Monitor',8,'lp_mysql/replication',2),
(4,'MySQLSlowQuery',9,'lp_mysql/slowquery',4),
(6,'Admin User View',10,'user/index',52),
(7,'Admin User Add ',10,'user/add',52),
(8,'Admin User Edit',10,'user/edit',53),
(9,'Admin User Delete',10,'user/forever_delete',54),
(10,'Admin Role View',11,'role/index',61),
(11,'Admin Role Add',11,'role/add',62),
(12,'Admin Role Edit',11,'role/edit',63),
(13,'Admin Role Delete',11,'role/forever_delete',64),
(14,'Admin Menu View',12,'menu/index',71),
(15,'Admin Menu Add',12,'menu/add',72),
(16,'Admin Menu Edit',12,'menu/edit',73),
(17,'Admin Menu Delete',12,'menu/forever_delete',74),
(18,'Admin Privilege View',13,'privilege/index',81),
(19,'Admin Privilege Add',13,'privilege/add',82),
(20,'Admin Privilege Edit',13,'privilege/edit',83),
(21,'Admin Privilege Delete',13,'privilege/forever_delete',84),
(22,'Admin Auth View',15,'auth/index',91),
(23,'Admin Role Privilege Update',15,'auth/update_role_privilege',92),
(24,'Login System',0,'index/index',0),
(25,'Admin User Role Update',13,'auth/update_user_role',93),
(31,'MySQL Servers View',18,'servers_mysql/index',36),
(32,'MySQL Servers Add',18,'servers_mysql/add',37),
(33,'MySQL Servers Edit',18,'servers_mysql/edit',38),
(34,'MySQL Servers Trash',18,'servers_mysql/trash',39),
(35,'MySQL Servers Delete',18,'servers_mysql/delete',40),
(36,'MySQLSlowQuery Detail',9,'lp_mysql/slowquery_detail',4),
(37,'MySQL AWR Report',19,'lp_mysql/awrreport',5),
(38,'MySQL Health Chart',6,'lp_mysql/chart',1),
(39,'MySQL Replication Chart',8,'lp_mysql/replication_chart',2),
(40,'Alarm View',21,'alarm/index',8),
(41,'OS Health View',43,'lp_os/index',100),
(44,'OS Disk View',26,'lp_os/disk',100),
(46,'OS Disk Chart View',26,'lp_os/disk_chart',100),
(48,'OS Health Chart View',43,'lp_os/chart',100),
(49,'MySQL BigTable Analysis',28,'lp_mysql/bigtable',8),
(50,'MySQL BigTable Analysis Chart',28,'lp_mysql/bigtable_chart',8),
(51,'MySQL Key Cache Monitor',29,'lp_mysql/key_cache',2),
(52,'MySQL InnoDB Monitor',30,'lp_mysql/innodb',2),
(53,'MySQL Resource Monitor',31,'lp_mysql/resource',2),
(54,'MongoDB Servers View',32,'servers_mongodb/index',42),
(55,'MongoDB Servers Add',32,'servers_mongodb/add',43),
(56,'MongoDB Servers Edit',32,'servers_mongodb/edit',44),
(57,'MongoDB Servers Trash',32,'servers_mongodb/trash',44),
(58,'MongoDB Servers Delete',32,'servers_mongodb/delete',44),
(59,'MongoDB Health View',34,'lp_mongodb/index',10),
(60,'MongoDB Indexes View',35,'lp_mongodb/indexes',11),
(61,'MongoDB Memory View',36,'lp_mongodb/memory',12),
(67,'Oracle Servers View',40,'servers_oracle/index',45),
(68,'Oracle Servers Add',40,'servers_oracle/add',46),
(69,'Oracle Servers Edit',40,'servers_oracle/edit',47),
(76,'Mongodb Health Chart View',34,'lp_mongodb/chart',13),
(77,'OS Disk View',44,'lp_os/disk_io',100),
(78,'OS Disk Chart View',44,'lp_os/disk_io_chart',100),
(79,'OS Servers View',45,'servers_os/index',50),
(80,'OS  Servers Add',45,'servers_os/add',50),
(81,'OS Servers Edit',45,'servers_os/edit',50),
(82,'OS Servers Delete',45,'servers_os/delete',50),
(83,'OS Servers Trash',45,'servers_os/trash',50),
(84,'OS Servers Batch Add',45,'servers_os/batch_add',50),
(85,'MongoDB Servers Batch Add',32,'servers_mongodb/batch_add',44),
(86,'MySQL Servers Batch Add',18,'servers_mysql/batch_add',40),
(87,'Settings View',46,'settings/index',30),
(92,'Redis Health View',50,'lp_redis/index',19),
(93,'Redis Health Chart View',50,'lp_redis/chart',20),
(94,'Redis Servers View',51,'servers_redis/index',51),
(95,'Redis Servers Add',51,'servers_redis/add',51),
(96,'Redis Servers Edit',51,'servers_redis/edit',51),
(97,'Redis Servers Trash',51,'servers_redis/trash',51),
(98,'Redis Servers Delete',51,'servers_redis/delete',51),
(99,'Redis Servers Batch Add',51,'servers_redis/batch_add',51),
(100,'Redis Memory View',52,'lp_redis/memory',21),
(101,'Redis Memory Chart View',52,'lp_redis/memory_chart',21),
(104,'Redis Replication View',54,'lp_redis/replication',23),
(105,'Redis Replication Chart View',54,'lp_redis/replication_chart',23),
(110,'Oracle Health Monitor',57,'lp_oracle/index',25),
(111,'Oracle Health Chart',57,'lp_oracle/chart',26),
(112,'Oracle Tablespace Monitor',58,'lp_oracle/tablespace',27),
(113,'Settings Save',46,'settings/save',31),
(114,'Oracle Servers Trash',40,'servers_oracle/trash',48),
(115,'Oracle Servers Delete',40,'servers_oracle/delete',48),
(116,'Oracle Servers Batch Add',40,'servers_oracle/batch_add',48),
(117,'web Servers Index',63,'servers_web/index',101),
(118,'web Servers Add',63,'servers_web/add',102),
(119,'web Servers Edit',63,'servers_web/edit',103),
(120,'web Servers Trash',63,'servers_web/trash',104),
(121,'web Servers Delete',63,'servers_web/delete',105),
(122,'web Health Monitor',66,'lp_web/index',106),
(123,'web Analysis',65,'lp_web/analysis',107),
(124,'web_status_chart',66,'lp_web/chart',108);

/*Table structure for table `admin_role` */

DROP TABLE IF EXISTS `admin_role`;

CREATE TABLE `admin_role` (
  `role_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `admin_role` */

insert  into `admin_role`(`role_id`,`role_name`) values 
(1,'Administrator'),
(3,'IT-DBA'),
(5,'IT-Developer'),
(7,'guest_group');

/*Table structure for table `admin_role_privilege` */

DROP TABLE IF EXISTS `admin_role_privilege`;

CREATE TABLE `admin_role_privilege` (
  `role_id` smallint(4) NOT NULL,
  `privilege_id` smallint(4) NOT NULL,
  PRIMARY KEY (`role_id`,`privilege_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin_role_privilege` */

insert  into `admin_role_privilege`(`role_id`,`privilege_id`) values 
(1,1),
(1,3),
(1,4),
(1,6),
(1,7),
(1,8),
(1,9),
(1,10),
(1,11),
(1,12),
(1,13),
(1,14),
(1,15),
(1,16),
(1,17),
(1,18),
(1,19),
(1,20),
(1,21),
(1,22),
(1,23),
(1,24),
(1,25),
(1,31),
(1,32),
(1,33),
(1,34),
(1,35),
(1,36),
(1,37),
(1,38),
(1,39),
(1,40),
(1,41),
(1,44),
(1,46),
(1,48),
(1,49),
(1,50),
(1,51),
(1,52),
(1,53),
(1,77),
(1,78),
(1,79),
(1,80),
(1,81),
(1,82),
(1,83),
(1,84),
(1,86),
(1,87),
(1,92),
(1,93),
(1,94),
(1,95),
(1,96),
(1,97),
(1,98),
(1,99),
(1,100),
(1,101),
(1,104),
(1,105),
(1,113),
(1,117),
(1,118),
(1,119),
(1,120),
(1,121),
(1,122),
(1,123),
(1,124),
(2,4),
(3,1),
(3,2),
(3,3),
(3,4),
(3,6),
(3,7),
(3,8),
(3,9),
(3,10),
(3,11),
(3,12),
(3,13),
(3,14),
(3,15),
(3,16),
(3,17),
(3,18),
(3,19),
(3,20),
(3,21),
(3,22),
(3,23),
(3,24),
(3,25),
(3,26),
(3,27),
(3,28),
(3,29),
(3,30),
(3,31),
(3,32),
(3,33),
(3,34),
(3,35),
(3,36),
(3,37),
(3,38),
(3,39),
(3,40),
(3,41),
(3,42),
(3,43),
(3,44),
(3,46),
(3,47),
(3,48),
(3,49),
(3,50),
(3,51),
(3,52),
(3,53),
(3,54),
(3,55),
(3,56),
(3,57),
(3,58),
(3,59),
(3,60),
(3,61),
(3,67),
(3,68),
(3,69),
(3,70),
(3,71),
(3,72),
(3,74),
(3,75),
(3,76),
(3,77),
(3,78),
(3,79),
(3,80),
(3,81),
(3,82),
(3,83),
(3,84),
(3,85),
(3,86),
(3,87),
(3,88),
(3,89),
(3,90),
(5,1),
(5,3),
(5,4),
(5,24),
(5,36),
(5,38),
(5,39),
(5,42),
(5,43),
(5,44),
(5,46),
(5,47),
(5,48),
(5,59),
(5,60),
(5,61),
(5,74),
(5,75),
(5,76),
(5,77),
(5,78),
(5,88),
(5,89),
(5,90),
(7,1),
(7,3),
(7,4),
(7,6),
(7,10),
(7,14),
(7,18),
(7,22),
(7,24),
(7,36),
(7,37),
(7,38),
(7,39),
(7,40),
(7,41),
(7,44),
(7,46),
(7,48),
(7,49),
(7,50),
(7,51),
(7,52),
(7,53),
(7,59),
(7,60),
(7,61),
(7,76),
(7,77),
(7,78),
(7,87),
(7,92),
(7,93),
(7,100),
(7,101),
(7,104),
(7,105),
(7,110),
(7,111),
(7,112);

/*Table structure for table `admin_user` */

DROP TABLE IF EXISTS `admin_user`;

CREATE TABLE `admin_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `login_count` int(11) DEFAULT '0',
  `last_login_ip` varchar(100) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `status` tinyint(2) DEFAULT '1',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `admin_user` */

insert  into `admin_user`(`user_id`,`username`,`password`,`realname`,`email`,`mobile`,`login_count`,`last_login_ip`,`last_login_time`,`status`,`create_time`) values 
(1,'admin','a906449d5769fa7361d7ecc6aa3f6d28','Administrator','admin@mail.com','',7,'10.39.35.251','2017-11-04 12:33:23',1,'2013-12-25 15:58:34'),
(8,'guest','e10adc3949ba59abbe56e057f20f883e','Guest','','',624,'114.86.1.166','2015-02-09 13:39:57',1,'2014-03-12 17:06:36');

/*Table structure for table `admin_user_role` */

DROP TABLE IF EXISTS `admin_user_role`;

CREATE TABLE `admin_user_role` (
  `user_id` int(10) NOT NULL,
  `role_id` smallint(4) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin_user_role` */

insert  into `admin_user_role`(`user_id`,`role_id`) values 
(1,1),
(2,1),
(2,2),
(2,3),
(2,5),
(8,7),
(9,3);

/*Table structure for table `alarm` */

DROP TABLE IF EXISTS `alarm`;

CREATE TABLE `alarm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` smallint(4) NOT NULL DEFAULT '0',
  `tags` varchar(50) DEFAULT NULL,
  `host` varchar(128) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `db_type` varchar(30) DEFAULT NULL,
  `alarm_item` varchar(50) DEFAULT NULL,
  `alarm_value` varchar(50) DEFAULT NULL,
  `level` varchar(50) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '',
  `send_mail` tinyint(2) NOT NULL,
  `send_mail_to_list` varchar(255) NOT NULL DEFAULT '',
  `send_sms` tinyint(2) DEFAULT NULL,
  `send_sms_to_list` varchar(255) NOT NULL DEFAULT '',
  `attach` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3349627 DEFAULT CHARSET=utf8;

/*Data for the table `alarm` */

/*Table structure for table `alarm_history` */

DROP TABLE IF EXISTS `alarm_history`;

CREATE TABLE `alarm_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` smallint(4) NOT NULL DEFAULT '0',
  `tags` varchar(50) DEFAULT NULL,
  `host` varchar(128) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `db_type` varchar(30) DEFAULT NULL,
  `alarm_item` varchar(50) DEFAULT NULL,
  `alarm_value` varchar(50) DEFAULT NULL,
  `level` varchar(50) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `send_mail` tinyint(2) DEFAULT NULL,
  `send_mail_to_list` varchar(255) DEFAULT NULL,
  `send_sms` tinyint(2) DEFAULT NULL,
  `send_sms_to_list` varchar(255) DEFAULT NULL,
  `send_mail_status` tinyint(2) NOT NULL DEFAULT '0',
  `send_sms_status` tinyint(2) NOT NULL DEFAULT '0',
  `attach` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_server_id` (`server_id`),
  KEY `idx_host` (`host`),
  KEY `idx_alarm_type` (`alarm_item`),
  KEY `idx_level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `alarm_history` */

/*Table structure for table `alarm_temp` */

DROP TABLE IF EXISTS `alarm_temp`;

CREATE TABLE `alarm_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `server_id` smallint(4) NOT NULL DEFAULT '0',
  `ip` varchar(50) DEFAULT NULL,
  `db_type` varchar(30) DEFAULT NULL,
  `alarm_item` varchar(50) DEFAULT NULL,
  `alarm_type` varchar(30) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `alarm_temp` */

/*Table structure for table `db_servers_mongodb` */

DROP TABLE IF EXISTS `db_servers_mongodb`;

CREATE TABLE `db_servers_mongodb` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `host` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `port` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `monitor` tinyint(2) DEFAULT '1',
  `send_mail` tinyint(2) DEFAULT '1',
  `send_mail_to_list` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `send_sms` tinyint(2) DEFAULT '0',
  `send_sms_to_list` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alarm_connections_current` tinyint(2) NOT NULL DEFAULT '1',
  `alarm_active_clients` tinyint(2) NOT NULL DEFAULT '1',
  `alarm_current_queue` tinyint(2) NOT NULL DEFAULT '1',
  `threshold_warning_connections_current` int(10) NOT NULL DEFAULT '1000',
  `threshold_warning_active_clients` smallint(4) NOT NULL DEFAULT '10',
  `threshold_warning_current_queue` smallint(4) NOT NULL DEFAULT '5',
  `threshold_critical_connections_current` int(10) NOT NULL DEFAULT '3000',
  `threshold_critical_active_clients` smallint(4) NOT NULL DEFAULT '30',
  `threshold_critical_current_queue` smallint(4) NOT NULL DEFAULT '15',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `display_order` smallint(4) NOT NULL DEFAULT '0',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_host` (`host`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `db_servers_mongodb` */

/*Table structure for table `db_servers_mysql` */

DROP TABLE IF EXISTS `db_servers_mysql`;

CREATE TABLE `db_servers_mysql` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `host` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `port` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `monitor` tinyint(2) DEFAULT '1' COMMENT '1:ç›‘æŽ§ 0ï¼šä¸ç›‘æŽ§',
  `send_mail` tinyint(2) DEFAULT '1',
  `send_mail_to_list` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `send_sms` tinyint(2) DEFAULT '0',
  `send_sms_to_list` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `send_slowquery_to_list` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alarm_threads_connected` tinyint(2) DEFAULT '1',
  `alarm_threads_running` tinyint(2) DEFAULT '1',
  `alarm_threads_waits` tinyint(2) DEFAULT '1',
  `alarm_repl_status` tinyint(2) DEFAULT '1',
  `alarm_repl_delay` tinyint(2) DEFAULT '1',
  `threshold_warning_threads_connected` int(10) DEFAULT '1000',
  `threshold_warning_threads_running` int(10) DEFAULT '10',
  `threshold_warning_threads_waits` int(10) DEFAULT '5',
  `threshold_warning_repl_delay` int(10) DEFAULT '60',
  `threshold_critical_threads_connected` int(10) DEFAULT '3000',
  `threshold_critical_threads_running` int(10) DEFAULT '30',
  `threshold_critical_threads_waits` int(10) DEFAULT '15',
  `threshold_critical_repl_delay` int(10) DEFAULT '600',
  `slow_query` tinyint(2) NOT NULL DEFAULT '0',
  `binlog_auto_purge` tinyint(1) NOT NULL DEFAULT '0',
  `binlog_store_days` smallint(4) NOT NULL DEFAULT '30',
  `bigtable_monitor` tinyint(1) NOT NULL DEFAULT '0',
  `bigtable_size` int(10) NOT NULL DEFAULT '50',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `display_order` smallint(4) NOT NULL DEFAULT '0',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_host` (`host`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `db_servers_mysql` */

/*Table structure for table `db_servers_oracle` */

DROP TABLE IF EXISTS `db_servers_oracle`;

CREATE TABLE `db_servers_oracle` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `host` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `port` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dsn` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `monitor` tinyint(2) DEFAULT '1',
  `send_mail` tinyint(2) DEFAULT '0',
  `send_mail_to_list` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `send_sms` tinyint(2) DEFAULT '0',
  `send_sms_to_list` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alarm_session_total` tinyint(2) NOT NULL DEFAULT '1',
  `alarm_session_actives` tinyint(2) NOT NULL DEFAULT '1',
  `alarm_session_waits` tinyint(2) NOT NULL DEFAULT '1',
  `alarm_tablespace` tinyint(2) NOT NULL DEFAULT '1',
  `threshold_warning_session_total` smallint(4) NOT NULL DEFAULT '1000',
  `threshold_warning_session_actives` smallint(4) NOT NULL DEFAULT '10',
  `threshold_warning_session_waits` tinyint(4) NOT NULL DEFAULT '5',
  `threshold_warning_tablespace` smallint(10) NOT NULL DEFAULT '85',
  `threshold_critical_session_total` smallint(4) NOT NULL DEFAULT '3000',
  `threshold_critical_session_actives` smallint(4) NOT NULL DEFAULT '30',
  `threshold_critical_session_waits` smallint(4) NOT NULL DEFAULT '15',
  `threshold_critical_tablespace` smallint(4) NOT NULL DEFAULT '95',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `display_order` smallint(4) NOT NULL DEFAULT '0',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_host` (`host`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `db_servers_oracle` */

/*Table structure for table `db_servers_os` */

DROP TABLE IF EXISTS `db_servers_os`;

CREATE TABLE `db_servers_os` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `level_2_id` int(10) unsigned NOT NULL DEFAULT '0',
  `level_2_name` varchar(100) DEFAULT '',
  `level_3_id` int(10) NOT NULL DEFAULT '0',
  `level_3_name` varchar(100) NOT NULL DEFAULT '',
  `level_4_id` int(10) NOT NULL DEFAULT '0',
  `level_4_name` varchar(100) NOT NULL DEFAULT '',
  `host` varchar(128) DEFAULT NULL,
  `port` int(5) NOT NULL DEFAULT '22',
  `user` varchar(100) NOT NULL DEFAULT '',
  `rsa` text,
  `password` varchar(100) DEFAULT '',
  `community` varchar(50) DEFAULT NULL,
  `tags` varchar(30) DEFAULT NULL,
  `monitor` tinyint(2) DEFAULT '0',
  `exclude_start_time` int(11) unsigned NOT NULL DEFAULT '0',
  `exclude_end_time` int(11) unsigned NOT NULL DEFAULT '0',
  `send_mail` tinyint(2) DEFAULT '0',
  `send_mail_to_list` varchar(255) DEFAULT NULL,
  `send_sms` tinyint(2) DEFAULT '0',
  `send_sms_to_list` varchar(255) DEFAULT NULL,
  `alarm_os_process` tinyint(1) NOT NULL DEFAULT '1',
  `alarm_os_load` tinyint(1) NOT NULL DEFAULT '1',
  `alarm_os_cpu` tinyint(1) NOT NULL DEFAULT '1',
  `alarm_os_network` tinyint(1) NOT NULL DEFAULT '1',
  `alarm_os_disk` tinyint(1) NOT NULL DEFAULT '1',
  `alarm_os_memory` tinyint(1) NOT NULL DEFAULT '1',
  `threshold_warning_os_process` int(10) NOT NULL DEFAULT '300',
  `threshold_warning_os_load` int(10) NOT NULL DEFAULT '3',
  `threshold_warning_os_cpu` int(10) NOT NULL DEFAULT '80',
  `threshold_warning_os_network` int(10) NOT NULL DEFAULT '2',
  `threshold_warning_os_disk` int(10) NOT NULL DEFAULT '75',
  `threshold_warning_os_memory` int(10) NOT NULL DEFAULT '85',
  `threshold_critical_os_process` int(10) NOT NULL DEFAULT '500',
  `threshold_critical_os_load` int(10) NOT NULL DEFAULT '10',
  `threshold_critical_os_cpu` int(10) NOT NULL DEFAULT '40',
  `threshold_critical_os_network` int(10) NOT NULL DEFAULT '10',
  `threshold_critical_os_disk` int(10) NOT NULL DEFAULT '90',
  `threshold_critical_os_memory` tinyint(10) NOT NULL DEFAULT '95',
  `filter_os_disk` varchar(100) DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `display_order` smallint(4) NOT NULL DEFAULT '0',
  `remark` varchar(1000) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_host` (`host`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;

/*Data for the table `db_servers_os` */

insert  into `db_servers_os`(`id`,`level_2_id`,`level_2_name`,`level_3_id`,`level_3_name`,`level_4_id`,`level_4_name`,`host`,`port`,`user`,`rsa`,`password`,`community`,`tags`,`monitor`,`exclude_start_time`,`exclude_end_time`,`send_mail`,`send_mail_to_list`,`send_sms`,`send_sms_to_list`,`alarm_os_process`,`alarm_os_load`,`alarm_os_cpu`,`alarm_os_network`,`alarm_os_disk`,`alarm_os_memory`,`threshold_warning_os_process`,`threshold_warning_os_load`,`threshold_warning_os_cpu`,`threshold_warning_os_network`,`threshold_warning_os_disk`,`threshold_warning_os_memory`,`threshold_critical_os_process`,`threshold_critical_os_load`,`threshold_critical_os_cpu`,`threshold_critical_os_network`,`threshold_critical_os_disk`,`threshold_critical_os_memory`,`filter_os_disk`,`is_delete`,`display_order`,`remark`,`create_time`) values 
(167,9,'办公内网',0,'',0,'','10.39.35.248',22,'root','','123abc','public','os_248',1,0,0,1,'',1,'',1,1,1,1,1,1,300,3,70,10,85,85,500,10,90,20,90,95,'0',0,0,NULL,'2017-11-03 14:43:54'),
(168,9,'办公内网',0,'',0,'','10.39.35.249',22,'root','0','123abc','public','os_249',1,0,0,1,'zhouz10@vanke.com',1,'',1,1,1,1,1,1,300,3,70,10,85,85,500,10,90,20,90,95,'0',0,0,NULL,'2017-11-03 16:44:05');

/*Table structure for table `db_servers_redis` */

DROP TABLE IF EXISTS `db_servers_redis`;

CREATE TABLE `db_servers_redis` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `host` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `port` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `monitor` tinyint(2) DEFAULT '1',
  `send_mail` tinyint(2) DEFAULT '1',
  `send_mail_to_list` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `send_sms` tinyint(2) DEFAULT '0',
  `send_sms_to_list` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alarm_connected_clients` tinyint(2) NOT NULL DEFAULT '1',
  `alarm_command_processed` tinyint(2) NOT NULL DEFAULT '1',
  `alarm_blocked_clients` tinyint(2) NOT NULL DEFAULT '1',
  `threshold_warning_connected_clients` smallint(4) NOT NULL DEFAULT '1000',
  `threshold_warning_command_processed` smallint(4) NOT NULL DEFAULT '10',
  `threshold_warning_blocked_clients` smallint(4) NOT NULL DEFAULT '5',
  `threshold_critical_connected_clients` smallint(4) NOT NULL DEFAULT '3000',
  `threshold_critical_command_processed` smallint(4) NOT NULL DEFAULT '30',
  `threshold_critical_blocked_clients` smallint(4) NOT NULL DEFAULT '15',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `display_order` smallint(4) NOT NULL DEFAULT '0',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_host` (`host`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `db_servers_redis` */

/*Table structure for table `db_servers_web` */

DROP TABLE IF EXISTS `db_servers_web`;

CREATE TABLE `db_servers_web` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `os_id` int(10) unsigned NOT NULL COMMENT 'db_servers_os表id',
  `web_port` tinyint(4) NOT NULL DEFAULT '80',
  `tags` char(20) NOT NULL DEFAULT '',
  `frequency_monitor` int(10) unsigned NOT NULL,
  `web_name` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1:apache 2:nginx 3:tomcat',
  `domain` char(32) NOT NULL DEFAULT '',
  `web_access_path` varchar(32) NOT NULL DEFAULT '',
  `web_access_name` char(32) NOT NULL DEFAULT '',
  `web_log_rules` char(10) NOT NULL DEFAULT '',
  `log_extend_name` char(5) NOT NULL DEFAULT '',
  `web_error_path` varchar(32) NOT NULL DEFAULT '',
  `web_error_name` char(32) NOT NULL DEFAULT '',
  `web_error_log_rules` char(10) NOT NULL DEFAULT '',
  `log_error_extend_name` char(10) NOT NULL DEFAULT '',
  `monitor` smallint(2) NOT NULL,
  `send_mail` tinyint(2) unsigned DEFAULT '0',
  `send_mail_to_list` varchar(255) DEFAULT NULL,
  `send_sms` tinyint(2) DEFAULT '0',
  `send_sms_to_list` varchar(255) DEFAULT NULL,
  `alarm_process` int(10) unsigned NOT NULL DEFAULT '0',
  `alarm_process_mem` int(3) unsigned NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `display_order` smallint(4) NOT NULL DEFAULT '0',
  `remark` varchar(1000) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `os_id` (`os_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `db_servers_web` */

insert  into `db_servers_web`(`id`,`os_id`,`web_port`,`tags`,`frequency_monitor`,`web_name`,`domain`,`web_access_path`,`web_access_name`,`web_log_rules`,`log_extend_name`,`web_error_path`,`web_error_name`,`web_error_log_rules`,`log_error_extend_name`,`monitor`,`send_mail`,`send_mail_to_list`,`send_sms`,`send_sms_to_list`,`alarm_process`,`alarm_process_mem`,`is_delete`,`display_order`,`remark`,`create_time`) values 
(1,168,80,'nginx_249',86400,2,'10.39.35.249','/var/log/nginx/','access-','%Y-%m-%d','.log','/var/log/nginx/','error','','.log',1,1,'zhouz10@vanke.com',1,'17017511656',200,100,0,0,NULL,'2017-11-03 19:31:25');

/*Table structure for table `db_status` */

DROP TABLE IF EXISTS `db_status`;

CREATE TABLE `db_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_id` smallint(4) NOT NULL DEFAULT '0',
  `host` varchar(128) NOT NULL DEFAULT '',
  `port` varchar(10) NOT NULL DEFAULT '',
  `db_type` varchar(10) NOT NULL DEFAULT '',
  `db_type_sort` tinyint(2) NOT NULL DEFAULT '0',
  `tags` varchar(50) NOT NULL DEFAULT '-1',
  `role` varchar(30) NOT NULL DEFAULT '-1',
  `version` varchar(30) NOT NULL DEFAULT '-1',
  `connect` tinyint(2) NOT NULL DEFAULT '-1',
  `connect_tips` varchar(500) NOT NULL DEFAULT 'no_data',
  `sessions` tinyint(2) NOT NULL DEFAULT '-1',
  `sessions_tips` varchar(500) NOT NULL DEFAULT 'no_data',
  `actives` tinyint(2) NOT NULL DEFAULT '-1',
  `actives_tips` varchar(500) NOT NULL DEFAULT 'no_data',
  `waits` tinyint(2) NOT NULL DEFAULT '-1',
  `waits_tips` varchar(500) NOT NULL DEFAULT 'no_data',
  `repl` tinyint(2) NOT NULL DEFAULT '-1',
  `repl_tips` varchar(500) NOT NULL DEFAULT 'no_data',
  `repl_delay` tinyint(2) NOT NULL DEFAULT '-1',
  `repl_delay_tips` varchar(500) NOT NULL DEFAULT 'no_data',
  `tablespace` tinyint(2) NOT NULL DEFAULT '-1',
  `tablespace_tips` varchar(500) NOT NULL DEFAULT '-1',
  `snmp` tinyint(2) NOT NULL DEFAULT '-1',
  `snmp_tips` varchar(500) NOT NULL DEFAULT 'no_data',
  `process` tinyint(2) NOT NULL DEFAULT '-1',
  `process_tips` varchar(500) NOT NULL DEFAULT 'no_data',
  `load_1` tinyint(2) NOT NULL DEFAULT '-1',
  `load_1_tips` varchar(500) NOT NULL DEFAULT 'no_data',
  `cpu` tinyint(2) NOT NULL DEFAULT '-1',
  `cpu_tips` varchar(500) NOT NULL DEFAULT 'no_data',
  `network` tinyint(2) NOT NULL DEFAULT '-1',
  `network_tips` varchar(500) NOT NULL DEFAULT 'no_data',
  `memory` tinyint(2) NOT NULL DEFAULT '-1',
  `memory_tips` varchar(500) NOT NULL DEFAULT 'no_data',
  `disk` tinyint(2) NOT NULL DEFAULT '-1',
  `disk_tips` varchar(500) NOT NULL DEFAULT 'no_data',
  `uptime_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8;

/*Data for the table `db_status` */

/*Table structure for table `lepus_status` */

DROP TABLE IF EXISTS `lepus_status`;

CREATE TABLE `lepus_status` (
  `lepus_variables` varchar(255) NOT NULL,
  `lepus_value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `lepus_status` */

insert  into `lepus_status`(`lepus_variables`,`lepus_value`) values 
('lepus_running','1'),
('lepus_version','3.7'),
('lepus_checktime','2017-11-04 19:10:27');

/*Table structure for table `mongodb_status` */

DROP TABLE IF EXISTS `mongodb_status`;

CREATE TABLE `mongodb_status` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `server_id` smallint(4) NOT NULL DEFAULT '0',
  `host` varchar(50) NOT NULL,
  `port` varchar(30) NOT NULL,
  `tags` varchar(50) DEFAULT NULL,
  `connect` smallint(6) NOT NULL DEFAULT '0',
  `replset` smallint(2) NOT NULL DEFAULT '-1',
  `repl_role` varchar(30) NOT NULL DEFAULT '-1',
  `ok` tinyint(2) NOT NULL DEFAULT '-1',
  `uptime` int(11) NOT NULL DEFAULT '-1',
  `version` varchar(50) NOT NULL DEFAULT '-1',
  `connections_current` int(10) NOT NULL DEFAULT '-1',
  `connections_available` int(10) NOT NULL DEFAULT '-1',
  `globalLock_currentQueue` smallint(4) NOT NULL DEFAULT '-1',
  `globalLock_activeClients` smallint(4) NOT NULL DEFAULT '-1',
  `indexCounters_accesses` bigint(18) NOT NULL DEFAULT '-1',
  `indexCounters_hits` bigint(18) NOT NULL DEFAULT '-1',
  `indexCounters_misses` bigint(18) NOT NULL DEFAULT '-1',
  `indexCounters_resets` int(10) NOT NULL DEFAULT '-1',
  `indexCounters_missRatio` char(10) NOT NULL DEFAULT '-1',
  `cursors_totalOpen` smallint(4) NOT NULL DEFAULT '-1',
  `cursors_timeOut` int(10) NOT NULL DEFAULT '-1',
  `dur_commits` smallint(4) NOT NULL DEFAULT '-1',
  `dur_journaledMB` varchar(30) NOT NULL DEFAULT '-1',
  `dur_writeToDataFilesMB` varchar(30) NOT NULL DEFAULT '-1',
  `dur_compression` varchar(30) NOT NULL DEFAULT '-1',
  `dur_commitsInWriteLock` smallint(4) NOT NULL DEFAULT '-1',
  `dur_earlyCommits` smallint(4) NOT NULL DEFAULT '-1',
  `dur_timeMs_dt` smallint(4) NOT NULL DEFAULT '-1',
  `dur_timeMs_prepLogBuffer` smallint(4) NOT NULL DEFAULT '-1',
  `dur_timeMs_writeToJournal` smallint(4) NOT NULL DEFAULT '-1',
  `dur_timeMs_writeToDataFiles` smallint(4) NOT NULL DEFAULT '-1',
  `dur_timeMs_remapPrivateView` smallint(4) NOT NULL DEFAULT '-1',
  `mem_bits` smallint(4) NOT NULL DEFAULT '-1',
  `mem_resident` int(10) NOT NULL DEFAULT '-1',
  `mem_virtual` int(10) NOT NULL DEFAULT '-1',
  `mem_supported` varchar(10) NOT NULL DEFAULT '-1',
  `mem_mapped` int(10) NOT NULL DEFAULT '-1',
  `mem_mappedWithJournal` int(10) NOT NULL DEFAULT '-1',
  `network_bytesIn_persecond` int(10) NOT NULL DEFAULT '-1',
  `network_bytesOut_persecond` int(10) NOT NULL DEFAULT '-1',
  `network_numRequests_persecond` int(10) NOT NULL DEFAULT '-1',
  `opcounters_insert_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `opcounters_query_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `opcounters_update_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `opcounters_delete_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `opcounters_command_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_server_id` (`server_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=267286 DEFAULT CHARSET=utf8;

/*Data for the table `mongodb_status` */

/*Table structure for table `mongodb_status_history` */

DROP TABLE IF EXISTS `mongodb_status_history`;

CREATE TABLE `mongodb_status_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `server_id` smallint(4) NOT NULL DEFAULT '0',
  `host` varchar(50) NOT NULL,
  `port` varchar(30) NOT NULL,
  `tags` varchar(50) DEFAULT NULL,
  `connect` smallint(6) NOT NULL DEFAULT '0',
  `replset` tinyint(2) NOT NULL DEFAULT '-1',
  `repl_role` varchar(30) NOT NULL DEFAULT '-1',
  `ok` tinyint(2) NOT NULL DEFAULT '-1',
  `uptime` int(11) NOT NULL DEFAULT '-1',
  `version` varchar(50) NOT NULL DEFAULT '-1',
  `connections_current` int(10) NOT NULL DEFAULT '-1',
  `connections_available` int(10) NOT NULL DEFAULT '-1',
  `globalLock_currentQueue` smallint(4) NOT NULL DEFAULT '-1',
  `globalLock_activeClients` smallint(4) NOT NULL DEFAULT '-1',
  `indexCounters_accesses` bigint(18) NOT NULL DEFAULT '-1',
  `indexCounters_hits` bigint(18) NOT NULL DEFAULT '-1',
  `indexCounters_misses` bigint(18) NOT NULL DEFAULT '-1',
  `indexCounters_resets` int(10) NOT NULL DEFAULT '-1',
  `indexCounters_missRatio` char(10) NOT NULL DEFAULT '-1',
  `cursors_totalOpen` smallint(4) NOT NULL DEFAULT '-1',
  `cursors_timeOut` int(10) NOT NULL DEFAULT '-1',
  `dur_commits` smallint(4) NOT NULL DEFAULT '-1',
  `dur_journaledMB` varchar(30) NOT NULL DEFAULT '-1',
  `dur_writeToDataFilesMB` varchar(30) NOT NULL DEFAULT '-1',
  `dur_compression` varchar(30) NOT NULL DEFAULT '-1',
  `dur_commitsInWriteLock` smallint(4) NOT NULL DEFAULT '-1',
  `dur_earlyCommits` smallint(4) NOT NULL DEFAULT '-1',
  `dur_timeMs_dt` smallint(4) NOT NULL DEFAULT '-1',
  `dur_timeMs_prepLogBuffer` smallint(4) NOT NULL DEFAULT '-1',
  `dur_timeMs_writeToJournal` smallint(4) NOT NULL DEFAULT '-1',
  `dur_timeMs_writeToDataFiles` smallint(4) NOT NULL DEFAULT '-1',
  `dur_timeMs_remapPrivateView` smallint(4) NOT NULL DEFAULT '-1',
  `mem_bits` smallint(4) NOT NULL DEFAULT '-1',
  `mem_resident` int(10) NOT NULL DEFAULT '-1',
  `mem_virtual` int(10) NOT NULL DEFAULT '-1',
  `mem_supported` varchar(10) NOT NULL DEFAULT '-1',
  `mem_mapped` int(10) NOT NULL DEFAULT '-1',
  `mem_mappedWithJournal` int(10) NOT NULL DEFAULT '-1',
  `network_bytesIn_persecond` int(10) NOT NULL DEFAULT '-1',
  `network_bytesOut_persecond` int(10) NOT NULL DEFAULT '-1',
  `network_numRequests_persecond` int(10) NOT NULL DEFAULT '-1',
  `opcounters_insert_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `opcounters_query_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `opcounters_update_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `opcounters_delete_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `opcounters_command_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `YmdHi` bigint(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_serverid_ymdhi` (`server_id`,`YmdHi`) USING BTREE,
  KEY `idx_ymdhi` (`YmdHi`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=267285 DEFAULT CHARSET=utf8;

/*Data for the table `mongodb_status_history` */

/*Table structure for table `mysql_bigtable` */

DROP TABLE IF EXISTS `mysql_bigtable`;

CREATE TABLE `mysql_bigtable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_id` smallint(4) DEFAULT NULL,
  `host` varchar(128) NOT NULL,
  `port` varchar(10) NOT NULL,
  `tags` varchar(50) NOT NULL DEFAULT '',
  `db_name` varchar(50) DEFAULT NULL,
  `table_name` varchar(100) DEFAULT NULL,
  `table_size` decimal(10,2) DEFAULT NULL,
  `table_comment` varchar(200) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_server_id` (`server_id`) USING BTREE,
  KEY `idx_table_size` (`table_size`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1855 DEFAULT CHARSET=utf8;

/*Data for the table `mysql_bigtable` */

/*Table structure for table `mysql_bigtable_history` */

DROP TABLE IF EXISTS `mysql_bigtable_history`;

CREATE TABLE `mysql_bigtable_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_id` smallint(4) DEFAULT NULL,
  `host` varchar(128) NOT NULL,
  `port` varchar(10) NOT NULL,
  `tags` varchar(50) NOT NULL DEFAULT '',
  `db_name` varchar(50) DEFAULT NULL,
  `table_name` varchar(100) DEFAULT NULL,
  `table_size` decimal(10,2) DEFAULT NULL,
  `table_comment` varchar(200) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Ymd` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_create_time` (`create_time`) USING BTREE,
  KEY `idx_server_id_tablename_ymd` (`server_id`,`table_name`,`Ymd`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1829 DEFAULT CHARSET=utf8;

/*Data for the table `mysql_bigtable_history` */

/*Table structure for table `mysql_connected` */

DROP TABLE IF EXISTS `mysql_connected`;

CREATE TABLE `mysql_connected` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `server_id` smallint(4) NOT NULL,
  `host` varchar(128) NOT NULL,
  `port` varchar(10) NOT NULL,
  `tags` varchar(50) NOT NULL DEFAULT '',
  `connect_server` varchar(100) NOT NULL,
  `connect_user` varchar(50) DEFAULT NULL,
  `connect_db` varchar(50) DEFAULT NULL,
  `connect_count` int(10) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43215471 DEFAULT CHARSET=utf8;

/*Data for the table `mysql_connected` */

/*Table structure for table `mysql_processlist` */

DROP TABLE IF EXISTS `mysql_processlist`;

CREATE TABLE `mysql_processlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_id` smallint(4) DEFAULT NULL,
  `host` varchar(128) NOT NULL,
  `port` varchar(10) NOT NULL,
  `tags` varchar(50) NOT NULL DEFAULT '',
  `pid` int(10) DEFAULT NULL,
  `p_user` varchar(50) DEFAULT NULL,
  `p_host` varchar(50) DEFAULT NULL,
  `p_db` varchar(30) DEFAULT NULL,
  `command` varchar(30) DEFAULT NULL,
  `time` varchar(200) NOT NULL DEFAULT '0',
  `status` varchar(50) DEFAULT NULL,
  `info` text,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_create_time` (`create_time`) USING BTREE,
  KEY `idx_server_id` (`server_id`) USING BTREE,
  KEY `idx_application_id` (`tags`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=892428 DEFAULT CHARSET=utf8;

/*Data for the table `mysql_processlist` */

/*Table structure for table `mysql_replication` */

DROP TABLE IF EXISTS `mysql_replication`;

CREATE TABLE `mysql_replication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_id` smallint(4) DEFAULT NULL,
  `tags` varchar(50) NOT NULL DEFAULT '',
  `host` varchar(128) DEFAULT NULL,
  `port` varchar(20) DEFAULT NULL,
  `is_master` tinyint(2) DEFAULT '0',
  `is_slave` tinyint(2) unsigned DEFAULT '0',
  `read_only` varchar(10) DEFAULT NULL,
  `gtid_mode` varchar(10) DEFAULT NULL,
  `master_server` varchar(30) DEFAULT NULL,
  `master_port` varchar(20) DEFAULT NULL,
  `slave_io_run` varchar(20) DEFAULT NULL,
  `slave_sql_run` varchar(20) DEFAULT NULL,
  `delay` varchar(20) DEFAULT NULL,
  `current_binlog_file` varchar(30) DEFAULT NULL,
  `current_binlog_pos` varchar(30) DEFAULT NULL,
  `master_binlog_file` varchar(30) DEFAULT NULL,
  `master_binlog_pos` varchar(30) DEFAULT NULL,
  `master_binlog_space` bigint(18) NOT NULL DEFAULT '0',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1390197 DEFAULT CHARSET=utf8;

/*Data for the table `mysql_replication` */

/*Table structure for table `mysql_replication_history` */

DROP TABLE IF EXISTS `mysql_replication_history`;

CREATE TABLE `mysql_replication_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_id` smallint(4) NOT NULL,
  `tags` varchar(50) NOT NULL DEFAULT '',
  `host` varchar(128) DEFAULT NULL,
  `port` varchar(20) DEFAULT NULL,
  `is_master` tinyint(2) DEFAULT '0',
  `is_slave` tinyint(2) DEFAULT '0',
  `read_only` varchar(10) DEFAULT NULL,
  `gtid_mode` varchar(10) DEFAULT NULL,
  `master_server` varchar(30) DEFAULT NULL,
  `master_port` varchar(20) DEFAULT NULL,
  `slave_io_run` varchar(20) DEFAULT NULL,
  `slave_sql_run` varchar(20) DEFAULT NULL,
  `delay` varchar(20) DEFAULT NULL,
  `current_binlog_file` varchar(30) DEFAULT NULL,
  `current_binlog_pos` varchar(30) DEFAULT NULL,
  `master_binlog_file` varchar(30) DEFAULT NULL,
  `master_binlog_pos` varchar(30) DEFAULT NULL,
  `master_binlog_space` bigint(18) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `YmdHi` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_application_id` (`tags`),
  KEY `idx_create_time` (`create_time`),
  KEY `idx_union_1` (`server_id`,`YmdHi`) USING BTREE,
  KEY `idx_ymdhi` (`YmdHi`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1390192 DEFAULT CHARSET=utf8;

/*Data for the table `mysql_replication_history` */

/*Table structure for table `mysql_slow_query_review` */

DROP TABLE IF EXISTS `mysql_slow_query_review`;

CREATE TABLE `mysql_slow_query_review` (
  `checksum` bigint(20) unsigned NOT NULL,
  `fingerprint` text NOT NULL,
  `sample` text NOT NULL,
  `first_seen` datetime DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `reviewed_by` varchar(20) DEFAULT NULL,
  `reviewed_on` datetime DEFAULT NULL,
  `comments` text,
  PRIMARY KEY (`checksum`),
  KEY `idx_checksum` (`checksum`) USING BTREE,
  KEY `idx_last_seen` (`last_seen`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `mysql_slow_query_review` */

/*Table structure for table `mysql_slow_query_review_history` */

DROP TABLE IF EXISTS `mysql_slow_query_review_history`;

CREATE TABLE `mysql_slow_query_review_history` (
  `serverid_max` smallint(4) NOT NULL DEFAULT '0',
  `db_max` varchar(100) DEFAULT NULL,
  `user_max` varchar(100) DEFAULT NULL,
  `checksum` bigint(20) unsigned NOT NULL,
  `sample` text NOT NULL,
  `ts_min` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ts_max` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ts_cnt` float DEFAULT NULL,
  `Query_time_sum` float DEFAULT NULL,
  `Query_time_min` float DEFAULT NULL,
  `Query_time_max` float DEFAULT NULL,
  `Query_time_pct_95` float DEFAULT NULL,
  `Query_time_stddev` float DEFAULT NULL,
  `Query_time_median` float DEFAULT NULL,
  `Lock_time_sum` float DEFAULT NULL,
  `Lock_time_min` float DEFAULT NULL,
  `Lock_time_max` float DEFAULT NULL,
  `Lock_time_pct_95` float DEFAULT NULL,
  `Lock_time_stddev` float DEFAULT NULL,
  `Lock_time_median` float DEFAULT NULL,
  `Rows_sent_sum` float DEFAULT NULL,
  `Rows_sent_min` float DEFAULT NULL,
  `Rows_sent_max` float DEFAULT NULL,
  `Rows_sent_pct_95` float DEFAULT NULL,
  `Rows_sent_stddev` float DEFAULT NULL,
  `Rows_sent_median` float DEFAULT NULL,
  `Rows_examined_sum` float DEFAULT NULL,
  `Rows_examined_min` float DEFAULT NULL,
  `Rows_examined_max` float DEFAULT NULL,
  `Rows_examined_pct_95` float DEFAULT NULL,
  `Rows_examined_stddev` float DEFAULT NULL,
  `Rows_examined_median` float DEFAULT NULL,
  `Rows_affected_sum` float DEFAULT NULL,
  `Rows_affected_min` float DEFAULT NULL,
  `Rows_affected_max` float DEFAULT NULL,
  `Rows_affected_pct_95` float DEFAULT NULL,
  `Rows_affected_stddev` float DEFAULT NULL,
  `Rows_affected_median` float DEFAULT NULL,
  `Rows_read_sum` float DEFAULT NULL,
  `Rows_read_min` float DEFAULT NULL,
  `Rows_read_max` float DEFAULT NULL,
  `Rows_read_pct_95` float DEFAULT NULL,
  `Rows_read_stddev` float DEFAULT NULL,
  `Rows_read_median` float DEFAULT NULL,
  `Merge_passes_sum` float DEFAULT NULL,
  `Merge_passes_min` float DEFAULT NULL,
  `Merge_passes_max` float DEFAULT NULL,
  `Merge_passes_pct_95` float DEFAULT NULL,
  `Merge_passes_stddev` float DEFAULT NULL,
  `Merge_passes_median` float DEFAULT NULL,
  `InnoDB_IO_r_ops_min` float DEFAULT NULL,
  `InnoDB_IO_r_ops_max` float DEFAULT NULL,
  `InnoDB_IO_r_ops_pct_95` float DEFAULT NULL,
  `InnoDB_IO_r_ops_stddev` float DEFAULT NULL,
  `InnoDB_IO_r_ops_median` float DEFAULT NULL,
  `InnoDB_IO_r_bytes_min` float DEFAULT NULL,
  `InnoDB_IO_r_bytes_max` float DEFAULT NULL,
  `InnoDB_IO_r_bytes_pct_95` float DEFAULT NULL,
  `InnoDB_IO_r_bytes_stddev` float DEFAULT NULL,
  `InnoDB_IO_r_bytes_median` float DEFAULT NULL,
  `InnoDB_IO_r_wait_min` float DEFAULT NULL,
  `InnoDB_IO_r_wait_max` float DEFAULT NULL,
  `InnoDB_IO_r_wait_pct_95` float DEFAULT NULL,
  `InnoDB_IO_r_wait_stddev` float DEFAULT NULL,
  `InnoDB_IO_r_wait_median` float DEFAULT NULL,
  `InnoDB_rec_lock_wait_min` float DEFAULT NULL,
  `InnoDB_rec_lock_wait_max` float DEFAULT NULL,
  `InnoDB_rec_lock_wait_pct_95` float DEFAULT NULL,
  `InnoDB_rec_lock_wait_stddev` float DEFAULT NULL,
  `InnoDB_rec_lock_wait_median` float DEFAULT NULL,
  `InnoDB_queue_wait_min` float DEFAULT NULL,
  `InnoDB_queue_wait_max` float DEFAULT NULL,
  `InnoDB_queue_wait_pct_95` float DEFAULT NULL,
  `InnoDB_queue_wait_stddev` float DEFAULT NULL,
  `InnoDB_queue_wait_median` float DEFAULT NULL,
  `InnoDB_pages_distinct_min` float DEFAULT NULL,
  `InnoDB_pages_distinct_max` float DEFAULT NULL,
  `InnoDB_pages_distinct_pct_95` float DEFAULT NULL,
  `InnoDB_pages_distinct_stddev` float DEFAULT NULL,
  `InnoDB_pages_distinct_median` float DEFAULT NULL,
  `QC_Hit_cnt` float DEFAULT NULL,
  `QC_Hit_sum` float DEFAULT NULL,
  `Full_scan_cnt` float DEFAULT NULL,
  `Full_scan_sum` float DEFAULT NULL,
  `Full_join_cnt` float DEFAULT NULL,
  `Full_join_sum` float DEFAULT NULL,
  `Tmp_table_cnt` float DEFAULT NULL,
  `Tmp_table_sum` float DEFAULT NULL,
  `Tmp_table_on_disk_cnt` float DEFAULT NULL,
  `Tmp_table_on_disk_sum` float DEFAULT NULL,
  `Filesort_cnt` float DEFAULT NULL,
  `Filesort_sum` float DEFAULT NULL,
  `Filesort_on_disk_cnt` float DEFAULT NULL,
  `Filesort_on_disk_sum` float DEFAULT NULL,
  PRIMARY KEY (`checksum`,`ts_min`,`ts_max`),
  KEY `idx_serverid_max` (`serverid_max`) USING BTREE,
  KEY `idx_checksum` (`checksum`) USING BTREE,
  KEY `idx_query_time_max` (`Query_time_max`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `mysql_slow_query_review_history` */

/*Table structure for table `mysql_slow_query_sendmail_log` */

DROP TABLE IF EXISTS `mysql_slow_query_sendmail_log`;

CREATE TABLE `mysql_slow_query_sendmail_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `server_id` smallint(4) NOT NULL,
  `sendmail_status` tinyint(2) NOT NULL DEFAULT '0',
  `sendmail_info` varchar(50) DEFAULT NULL,
  `sendmail_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_sendmail_time` (`sendmail_time`) USING BTREE,
  KEY `idx_server_id` (`server_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `mysql_slow_query_sendmail_log` */

/*Table structure for table `mysql_status` */

DROP TABLE IF EXISTS `mysql_status`;

CREATE TABLE `mysql_status` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `server_id` smallint(4) NOT NULL DEFAULT '0',
  `host` varchar(128) NOT NULL,
  `port` varchar(10) NOT NULL,
  `tags` varchar(50) NOT NULL DEFAULT '',
  `connect` smallint(4) NOT NULL DEFAULT '0',
  `role` varchar(30) NOT NULL DEFAULT '-1',
  `uptime` int(11) NOT NULL DEFAULT '-1',
  `version` varchar(50) NOT NULL DEFAULT '-1',
  `max_connections` smallint(4) NOT NULL DEFAULT '-1',
  `max_connect_errors` smallint(4) NOT NULL DEFAULT '-1',
  `open_files_limit` int(10) NOT NULL DEFAULT '-1',
  `open_files` smallint(4) NOT NULL DEFAULT '-1',
  `table_open_cache` smallint(4) NOT NULL DEFAULT '-1',
  `open_tables` smallint(4) NOT NULL DEFAULT '-1',
  `max_tmp_tables` smallint(4) NOT NULL DEFAULT '-1',
  `max_heap_table_size` int(10) NOT NULL DEFAULT '-1',
  `max_allowed_packet` int(10) NOT NULL DEFAULT '-1',
  `threads_connected` int(10) NOT NULL DEFAULT '-1',
  `threads_running` int(10) NOT NULL DEFAULT '-1',
  `threads_waits` int(10) NOT NULL DEFAULT '-1',
  `threads_created` int(10) NOT NULL DEFAULT '-1',
  `threads_cached` int(10) NOT NULL DEFAULT '-1',
  `connections` int(10) NOT NULL DEFAULT '-1',
  `aborted_clients` int(10) NOT NULL DEFAULT '-1',
  `aborted_connects` int(10) NOT NULL DEFAULT '-1',
  `connections_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `bytes_received_persecond` int(10) NOT NULL DEFAULT '-1',
  `bytes_sent_persecond` int(10) NOT NULL DEFAULT '-1',
  `com_select_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `com_insert_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `com_update_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `com_delete_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `com_commit_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `com_rollback_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `questions_persecond` int(10) NOT NULL DEFAULT '-1',
  `queries_persecond` int(10) NOT NULL DEFAULT '-1',
  `transaction_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `created_tmp_tables_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `created_tmp_disk_tables_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `created_tmp_files_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `table_locks_immediate_persecond` int(4) NOT NULL DEFAULT '-1',
  `table_locks_waited_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `key_buffer_size` bigint(18) NOT NULL DEFAULT '-1',
  `sort_buffer_size` int(10) NOT NULL DEFAULT '-1',
  `join_buffer_size` int(10) NOT NULL DEFAULT '-1',
  `key_blocks_not_flushed` int(10) NOT NULL DEFAULT '-1',
  `key_blocks_unused` int(10) NOT NULL DEFAULT '-1',
  `key_blocks_used` int(10) NOT NULL DEFAULT '-1',
  `key_read_requests_persecond` int(10) NOT NULL DEFAULT '-1',
  `key_reads_persecond` int(10) NOT NULL DEFAULT '-1',
  `key_write_requests_persecond` int(10) NOT NULL DEFAULT '-1',
  `key_writes_persecond` int(10) NOT NULL DEFAULT '-1',
  `innodb_version` varchar(30) NOT NULL DEFAULT '-1',
  `innodb_buffer_pool_instances` smallint(4) NOT NULL DEFAULT '-1',
  `innodb_buffer_pool_size` bigint(18) NOT NULL DEFAULT '-1',
  `innodb_doublewrite` char(10) NOT NULL DEFAULT '-1',
  `innodb_file_per_table` char(10) NOT NULL DEFAULT '-1',
  `innodb_flush_log_at_trx_commit` tinyint(2) NOT NULL DEFAULT '-1',
  `innodb_flush_method` varchar(30) NOT NULL DEFAULT '-1',
  `innodb_force_recovery` tinyint(2) NOT NULL DEFAULT '-1',
  `innodb_io_capacity` int(10) NOT NULL DEFAULT '-1',
  `innodb_read_io_threads` tinyint(2) NOT NULL DEFAULT '-1',
  `innodb_write_io_threads` tinyint(2) NOT NULL DEFAULT '-1',
  `innodb_buffer_pool_pages_total` int(10) NOT NULL DEFAULT '-1' COMMENT '页总数目',
  `innodb_buffer_pool_pages_data` int(10) NOT NULL DEFAULT '-1' COMMENT '缓存池中包含数据的页的数目，包括脏页,单位page',
  `innodb_buffer_pool_pages_dirty` int(10) NOT NULL DEFAULT '-1' COMMENT '缓存池中脏页的数目-单位page',
  `innodb_buffer_pool_pages_flushed` bigint(18) NOT NULL DEFAULT '-1' COMMENT '缓存池中刷新页请求的数目-单位page',
  `innodb_buffer_pool_pages_free` int(10) NOT NULL DEFAULT '-1' COMMENT '剩余的页数目-单位是page',
  `innodb_buffer_pool_pages_misc` int(10) NOT NULL DEFAULT '-1' COMMENT '缓存池中当前已经被用作管理用途或hash index而不能用作为普通数据页的数目',
  `innodb_page_size` int(10) NOT NULL DEFAULT '-1',
  `innodb_pages_created` bigint(18) NOT NULL DEFAULT '-1',
  `innodb_pages_read` bigint(18) NOT NULL DEFAULT '-1',
  `innodb_pages_written` bigint(18) NOT NULL DEFAULT '-1',
  `innodb_row_lock_current_waits` varchar(100) NOT NULL DEFAULT '-1',
  `innodb_buffer_pool_pages_flushed_persecond` int(10) NOT NULL DEFAULT '-1',
  `innodb_buffer_pool_read_requests_persecond` int(10) NOT NULL DEFAULT '-1',
  `innodb_buffer_pool_reads_persecond` int(10) NOT NULL DEFAULT '-1',
  `innodb_buffer_pool_write_requests_persecond` int(10) NOT NULL DEFAULT '-1',
  `innodb_rows_read_persecond` int(10) NOT NULL DEFAULT '-1',
  `innodb_rows_inserted_persecond` int(10) NOT NULL DEFAULT '-1',
  `innodb_rows_updated_persecond` int(10) NOT NULL DEFAULT '-1',
  `innodb_rows_deleted_persecond` int(10) NOT NULL DEFAULT '-1',
  `query_cache_hitrate` varchar(10) NOT NULL DEFAULT '-1',
  `thread_cache_hitrate` varchar(10) NOT NULL DEFAULT '-1',
  `key_buffer_read_rate` varchar(10) NOT NULL DEFAULT '-1',
  `key_buffer_write_rate` varchar(10) NOT NULL DEFAULT '-1',
  `key_blocks_used_rate` varchar(10) NOT NULL DEFAULT '-1',
  `created_tmp_disk_tables_rate` varchar(10) NOT NULL DEFAULT '-1',
  `connections_usage_rate` varchar(10) NOT NULL DEFAULT '-1',
  `open_files_usage_rate` varchar(10) NOT NULL DEFAULT '-1',
  `open_tables_usage_rate` varchar(10) NOT NULL DEFAULT '-1',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_connections` (`threads_connected`) USING BTREE,
  KEY `idx_active` (`threads_running`) USING BTREE,
  KEY `idx_server_id` (`server_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1659296 DEFAULT CHARSET=utf8;

/*Data for the table `mysql_status` */

/*Table structure for table `mysql_status_history` */

DROP TABLE IF EXISTS `mysql_status_history`;

CREATE TABLE `mysql_status_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `server_id` smallint(4) NOT NULL DEFAULT '0',
  `host` varchar(128) NOT NULL,
  `port` varchar(10) NOT NULL,
  `tags` varchar(50) NOT NULL DEFAULT '',
  `connect` smallint(4) NOT NULL DEFAULT '0',
  `role` varchar(30) NOT NULL DEFAULT '-1',
  `uptime` int(11) NOT NULL DEFAULT '-1',
  `version` varchar(50) NOT NULL DEFAULT '-1',
  `max_connections` smallint(4) NOT NULL DEFAULT '-1',
  `max_connect_errors` smallint(4) NOT NULL DEFAULT '-1',
  `open_files_limit` int(10) NOT NULL DEFAULT '-1',
  `open_files` smallint(4) NOT NULL DEFAULT '-1',
  `table_open_cache` smallint(4) NOT NULL DEFAULT '-1',
  `open_tables` smallint(4) NOT NULL DEFAULT '-1',
  `max_tmp_tables` smallint(4) NOT NULL DEFAULT '-1',
  `max_heap_table_size` int(10) NOT NULL DEFAULT '-1',
  `max_allowed_packet` int(10) NOT NULL DEFAULT '-1',
  `threads_connected` int(10) NOT NULL DEFAULT '-1',
  `threads_running` int(10) NOT NULL DEFAULT '-1',
  `threads_waits` int(10) NOT NULL DEFAULT '-1',
  `threads_created` int(10) NOT NULL DEFAULT '-1',
  `threads_cached` int(10) NOT NULL DEFAULT '-1',
  `connections` int(10) NOT NULL DEFAULT '-1',
  `aborted_clients` int(10) NOT NULL DEFAULT '-1',
  `aborted_connects` int(10) NOT NULL DEFAULT '-1',
  `connections_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `bytes_received_persecond` int(10) NOT NULL DEFAULT '-1',
  `bytes_sent_persecond` int(10) NOT NULL DEFAULT '-1',
  `com_select_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `com_insert_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `com_update_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `com_delete_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `com_commit_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `com_rollback_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `questions_persecond` int(10) NOT NULL DEFAULT '-1',
  `queries_persecond` int(10) NOT NULL DEFAULT '-1',
  `transaction_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `created_tmp_tables_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `created_tmp_disk_tables_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `created_tmp_files_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `table_locks_immediate_persecond` int(4) NOT NULL DEFAULT '-1',
  `table_locks_waited_persecond` smallint(4) NOT NULL DEFAULT '-1',
  `key_buffer_size` bigint(18) NOT NULL DEFAULT '-1',
  `sort_buffer_size` int(10) NOT NULL DEFAULT '-1',
  `join_buffer_size` int(10) NOT NULL DEFAULT '-1',
  `key_blocks_not_flushed` int(10) NOT NULL DEFAULT '-1',
  `key_blocks_unused` int(10) NOT NULL DEFAULT '-1',
  `key_blocks_used` int(10) NOT NULL DEFAULT '-1',
  `key_read_requests_persecond` int(10) NOT NULL DEFAULT '-1',
  `key_reads_persecond` int(10) NOT NULL DEFAULT '-1',
  `key_write_requests_persecond` int(10) NOT NULL DEFAULT '-1',
  `key_writes_persecond` int(10) NOT NULL DEFAULT '-1',
  `innodb_version` varchar(30) NOT NULL DEFAULT '-1',
  `innodb_buffer_pool_instances` smallint(4) NOT NULL DEFAULT '-1',
  `innodb_buffer_pool_size` bigint(18) NOT NULL DEFAULT '-1',
  `innodb_doublewrite` char(10) NOT NULL DEFAULT '-1',
  `innodb_file_per_table` char(10) NOT NULL DEFAULT '-1',
  `innodb_flush_log_at_trx_commit` tinyint(2) NOT NULL DEFAULT '-1',
  `innodb_flush_method` varchar(30) NOT NULL DEFAULT '-1',
  `innodb_force_recovery` tinyint(2) NOT NULL DEFAULT '-1',
  `innodb_io_capacity` int(10) NOT NULL DEFAULT '-1',
  `innodb_read_io_threads` tinyint(2) NOT NULL DEFAULT '-1',
  `innodb_write_io_threads` tinyint(2) NOT NULL DEFAULT '-1',
  `innodb_buffer_pool_pages_total` int(10) NOT NULL DEFAULT '-1' COMMENT '页总数目',
  `innodb_buffer_pool_pages_data` int(10) NOT NULL DEFAULT '-1' COMMENT '缓存池中包含数据的页的数目，包括脏页,单位page',
  `innodb_buffer_pool_pages_dirty` int(10) NOT NULL DEFAULT '-1' COMMENT '缓存池中脏页的数目-单位page',
  `innodb_buffer_pool_pages_flushed` bigint(18) NOT NULL DEFAULT '-1' COMMENT '缓存池中刷新页请求的数目-单位page',
  `innodb_buffer_pool_pages_free` int(10) NOT NULL DEFAULT '-1' COMMENT '剩余的页数目-单位是page',
  `innodb_buffer_pool_pages_misc` int(10) NOT NULL DEFAULT '-1' COMMENT '缓存池中当前已经被用作管理用途或hash index而不能用作为普通数据页的数目',
  `innodb_page_size` int(10) NOT NULL DEFAULT '-1',
  `innodb_pages_created` bigint(18) NOT NULL DEFAULT '-1',
  `innodb_pages_read` bigint(18) NOT NULL DEFAULT '-1',
  `innodb_pages_written` bigint(18) NOT NULL DEFAULT '-1',
  `innodb_row_lock_current_waits` varchar(100) NOT NULL DEFAULT '-1',
  `innodb_buffer_pool_pages_flushed_persecond` int(10) NOT NULL DEFAULT '-1',
  `innodb_buffer_pool_read_requests_persecond` int(10) NOT NULL DEFAULT '-1',
  `innodb_buffer_pool_reads_persecond` int(10) NOT NULL DEFAULT '-1',
  `innodb_buffer_pool_write_requests_persecond` int(10) NOT NULL DEFAULT '-1',
  `innodb_rows_read_persecond` int(10) NOT NULL DEFAULT '-1',
  `innodb_rows_inserted_persecond` int(10) NOT NULL DEFAULT '-1',
  `innodb_rows_updated_persecond` int(10) NOT NULL DEFAULT '-1',
  `innodb_rows_deleted_persecond` int(10) NOT NULL DEFAULT '-1',
  `query_cache_hitrate` varchar(10) NOT NULL DEFAULT '-1',
  `thread_cache_hitrate` varchar(10) NOT NULL DEFAULT '-1',
  `key_buffer_read_rate` varchar(10) NOT NULL DEFAULT '-1',
  `key_buffer_write_rate` varchar(10) NOT NULL DEFAULT '-1',
  `key_blocks_used_rate` varchar(10) NOT NULL DEFAULT '-1',
  `created_tmp_disk_tables_rate` varchar(10) NOT NULL DEFAULT '-1',
  `connections_usage_rate` varchar(10) NOT NULL DEFAULT '-1',
  `open_files_usage_rate` varchar(10) NOT NULL DEFAULT '-1',
  `open_tables_usage_rate` varchar(10) NOT NULL DEFAULT '-1',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `YmdHi` bigint(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_connections` (`threads_connected`) USING BTREE,
  KEY `idx_active` (`threads_running`) USING BTREE,
  KEY `idx_server_id_ymdhi` (`server_id`,`YmdHi`) USING BTREE,
  KEY `idx_application_id` (`tags`) USING BTREE,
  KEY `idx_create_time` (`create_time`) USING BTREE,
  KEY `idx_yhdmi` (`YmdHi`)
) ENGINE=InnoDB AUTO_INCREMENT=1659296 DEFAULT CHARSET=utf8;

/*Data for the table `mysql_status_history` */

/*Table structure for table `options` */

DROP TABLE IF EXISTS `options`;

CREATE TABLE `options` (
  `name` varchar(50) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  KEY `idx_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `options` */

insert  into `options`(`name`,`value`,`description`) values 
('monitor','1','是否开启全局监控,此项如果关闭则所有项目都不会被监控，下面监控选项都失效'),
('monitor_mysql','1','是否开启MySQL状态监控'),
('send_alarm_mail','1','是否发送报警邮件'),
('send_mail_to_list','284851470@qq.com','报警邮件通知人员'),
('monitor_os','1','是否开启OS监控'),
('monitor_mongodb','0','是否监控MongoDB'),
('alarm','1','是否开启告警'),
('send_mail_max_count','1','发送邮件最大次数'),
('report_mail_to_list','','报告邮件推送接收人员'),
('frequency_monitor','60','监控频率'),
('send_mail_sleep_time','15','发送邮件休眠时间(分钟)'),
('mailtype','html','邮件发送配置:邮件类型'),
('mailprotocol','smtp','邮件发送配置:邮件协议'),
('smtp_host','smtp.163.com','邮件发送配置:邮件主机'),
('smtp_port','465','邮件发送配置:邮件端口'),
('smtp_user','zhouz10','邮件发送配置:用户'),
('smtp_pass','zhouz10','邮件发送配置:密码'),
('smtp_timeout','10','邮件发送配置:超时时间'),
('mailfrom','zhouz10@163.com','邮件发送配置:发件人'),
('monitor_redis','1','是否监控Redis'),
('monitor_oracle','0','是否监控Oracle'),
('send_alarm_sms','1','是否发生短信'),
('send_sms_to_list','17017511656','短信收件人列表'),
('send_sms_max_count','1','发送短信最大次数'),
('send_sms_sleep_time','15','发送短信休眠时间(分钟)'),
('sms_fetion_user','','飞信发送短信账号'),
('sms_fetion_pass','','飞信发送短信密码'),
('smstype','api','发送短信方式：fetion/api'),
('monitor_web','1','是否开启web状态监控'),
('sms_api_url','','短信接口平台URL');

/*Table structure for table `oracle_status` */

DROP TABLE IF EXISTS `oracle_status`;

CREATE TABLE `oracle_status` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `server_id` smallint(4) NOT NULL DEFAULT '0',
  `host` varchar(50) NOT NULL,
  `port` varchar(10) NOT NULL,
  `tags` varchar(100) DEFAULT '',
  `connect` tinyint(2) NOT NULL DEFAULT '0',
  `instance_name` varchar(30) NOT NULL DEFAULT '-1',
  `instance_role` varchar(50) NOT NULL DEFAULT '-1',
  `instance_status` varchar(50) NOT NULL DEFAULT '-1',
  `database_role` varchar(50) NOT NULL DEFAULT '-1',
  `open_mode` varchar(30) NOT NULL DEFAULT '-1',
  `protection_mode` varchar(30) NOT NULL DEFAULT '-1',
  `host_name` varchar(50) NOT NULL DEFAULT '-1',
  `database_status` varchar(30) NOT NULL DEFAULT '-1',
  `startup_time` varchar(100) NOT NULL DEFAULT '-1',
  `uptime` varchar(100) NOT NULL DEFAULT '-1',
  `version` varchar(50) NOT NULL DEFAULT '-1',
  `archiver` varchar(50) NOT NULL DEFAULT '-1',
  `session_total` int(10) NOT NULL DEFAULT '-1',
  `session_actives` smallint(4) NOT NULL DEFAULT '-1',
  `session_waits` smallint(4) NOT NULL DEFAULT '-1',
  `dg_stats` varchar(255) NOT NULL DEFAULT '-1',
  `dg_delay` int(10) NOT NULL DEFAULT '-1',
  `processes` int(10) NOT NULL DEFAULT '-1',
  `session_logical_reads_persecond` int(10) NOT NULL DEFAULT '-1',
  `physical_reads_persecond` int(10) NOT NULL DEFAULT '-1',
  `physical_writes_persecond` int(10) NOT NULL DEFAULT '-1',
  `physical_read_io_requests_persecond` int(10) NOT NULL DEFAULT '-1',
  `physical_write_io_requests_persecond` int(10) NOT NULL DEFAULT '-1',
  `db_block_changes_persecond` int(10) NOT NULL DEFAULT '-1',
  `os_cpu_wait_time` int(10) NOT NULL DEFAULT '-1',
  `logons_persecond` int(10) NOT NULL DEFAULT '-1',
  `logons_current` int(10) NOT NULL DEFAULT '-1',
  `opened_cursors_persecond` int(10) NOT NULL DEFAULT '-1',
  `opened_cursors_current` int(10) NOT NULL DEFAULT '-1',
  `user_commits_persecond` int(10) NOT NULL DEFAULT '-1',
  `user_rollbacks_persecond` int(10) NOT NULL DEFAULT '-1',
  `user_calls_persecond` int(10) NOT NULL DEFAULT '-1',
  `db_block_gets_persecond` int(10) NOT NULL DEFAULT '-1',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_server_id` (`server_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=440226 DEFAULT CHARSET=utf8;

/*Data for the table `oracle_status` */

/*Table structure for table `oracle_status_history` */

DROP TABLE IF EXISTS `oracle_status_history`;

CREATE TABLE `oracle_status_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `server_id` smallint(4) NOT NULL DEFAULT '0',
  `host` varchar(50) NOT NULL,
  `port` varchar(10) NOT NULL,
  `tags` varchar(100) DEFAULT '',
  `connect` tinyint(2) NOT NULL DEFAULT '0',
  `instance_name` varchar(30) NOT NULL DEFAULT '-1',
  `instance_role` varchar(50) NOT NULL DEFAULT '-1',
  `instance_status` varchar(50) NOT NULL DEFAULT '-1',
  `database_role` varchar(50) NOT NULL DEFAULT '-1',
  `open_mode` varchar(30) NOT NULL DEFAULT '-1',
  `protection_mode` varchar(30) NOT NULL DEFAULT '-1',
  `host_name` varchar(50) NOT NULL DEFAULT '-1',
  `database_status` varchar(30) NOT NULL DEFAULT '-1',
  `startup_time` varchar(100) NOT NULL DEFAULT '-1',
  `uptime` varchar(100) NOT NULL DEFAULT '-1',
  `version` varchar(50) NOT NULL DEFAULT '-1',
  `archiver` varchar(50) NOT NULL DEFAULT '-1',
  `session_total` int(10) NOT NULL DEFAULT '-1',
  `session_actives` smallint(4) NOT NULL DEFAULT '-1',
  `session_waits` smallint(4) NOT NULL DEFAULT '-1',
  `dg_stats` varchar(255) NOT NULL DEFAULT '-1',
  `dg_delay` int(10) NOT NULL DEFAULT '-1',
  `processes` int(10) NOT NULL DEFAULT '-1',
  `session_logical_reads_persecond` int(10) NOT NULL DEFAULT '-1',
  `physical_reads_persecond` int(10) NOT NULL DEFAULT '-1',
  `physical_writes_persecond` int(10) NOT NULL DEFAULT '-1',
  `physical_read_io_requests_persecond` int(10) NOT NULL DEFAULT '-1',
  `physical_write_io_requests_persecond` int(10) NOT NULL DEFAULT '-1',
  `db_block_changes_persecond` int(10) NOT NULL DEFAULT '-1',
  `os_cpu_wait_time` int(10) NOT NULL DEFAULT '-1',
  `logons_persecond` int(10) NOT NULL DEFAULT '-1',
  `logons_current` int(10) NOT NULL DEFAULT '-1',
  `opened_cursors_persecond` int(10) NOT NULL DEFAULT '-1',
  `opened_cursors_current` int(10) NOT NULL DEFAULT '-1',
  `user_commits_persecond` int(10) NOT NULL DEFAULT '-1',
  `user_rollbacks_persecond` int(10) NOT NULL DEFAULT '-1',
  `user_calls_persecond` int(10) NOT NULL DEFAULT '-1',
  `db_block_gets_persecond` int(10) NOT NULL DEFAULT '-1',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ymdhi` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_server_id` (`server_id`) USING BTREE,
  KEY `idx_ymdhi` (`ymdhi`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=440225 DEFAULT CHARSET=utf8;

/*Data for the table `oracle_status_history` */

/*Table structure for table `oracle_tablespace` */

DROP TABLE IF EXISTS `oracle_tablespace`;

CREATE TABLE `oracle_tablespace` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `server_id` smallint(4) NOT NULL DEFAULT '0',
  `host` varchar(50) NOT NULL DEFAULT '0',
  `port` varchar(30) NOT NULL DEFAULT '0',
  `tags` varchar(50) NOT NULL DEFAULT '',
  `tablespace_name` varchar(100) NOT NULL,
  `total_size` bigint(18) NOT NULL DEFAULT '0',
  `used_size` bigint(18) NOT NULL DEFAULT '0',
  `avail_size` bigint(18) NOT NULL DEFAULT '0',
  `used_rate` varchar(255) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_server_id` (`server_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2986229 DEFAULT CHARSET=utf8;

/*Data for the table `oracle_tablespace` */

/*Table structure for table `oracle_tablespace_history` */

DROP TABLE IF EXISTS `oracle_tablespace_history`;

CREATE TABLE `oracle_tablespace_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `server_id` smallint(4) NOT NULL DEFAULT '0',
  `host` varchar(50) NOT NULL DEFAULT '0',
  `port` varchar(30) NOT NULL DEFAULT '0',
  `tags` varchar(50) NOT NULL DEFAULT '',
  `tablespace_name` varchar(100) NOT NULL,
  `total_size` bigint(18) NOT NULL DEFAULT '0',
  `used_size` bigint(18) NOT NULL DEFAULT '0',
  `avail_size` bigint(18) NOT NULL DEFAULT '0',
  `used_rate` varchar(255) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ymdhi` bigint(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_server_id` (`server_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2986224 DEFAULT CHARSET=utf8;

/*Data for the table `oracle_tablespace_history` */

/*Table structure for table `os_disk` */

DROP TABLE IF EXISTS `os_disk`;

CREATE TABLE `os_disk` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) NOT NULL,
  `tags` varchar(100) DEFAULT NULL,
  `mounted` varchar(50) NOT NULL DEFAULT '0',
  `total_size` bigint(18) NOT NULL DEFAULT '0',
  `used_size` bigint(18) NOT NULL DEFAULT '0',
  `avail_size` bigint(18) NOT NULL DEFAULT '0',
  `used_rate` varchar(255) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_ip` (`ip`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1382425 DEFAULT CHARSET=utf8;

/*Data for the table `os_disk` */

insert  into `os_disk`(`id`,`ip`,`tags`,`mounted`,`total_size`,`used_size`,`avail_size`,`used_rate`,`create_time`) values 
(1382424,'10.39.35.249','os_249','/run',499972,13128,486844,'2%','2017-11-04 19:04:03');

/*Table structure for table `os_disk_history` */

DROP TABLE IF EXISTS `os_disk_history`;

CREATE TABLE `os_disk_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) NOT NULL,
  `tags` varchar(100) DEFAULT NULL,
  `mounted` varchar(50) NOT NULL DEFAULT '0',
  `total_size` bigint(18) NOT NULL DEFAULT '0',
  `used_size` bigint(18) NOT NULL DEFAULT '0',
  `avail_size` bigint(18) NOT NULL DEFAULT '0',
  `used_rate` varchar(255) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `YmdHi` bigint(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ip` (`ip`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1382424 DEFAULT CHARSET=utf8;

/*Data for the table `os_disk_history` */

insert  into `os_disk_history`(`id`,`ip`,`tags`,`mounted`,`total_size`,`used_size`,`avail_size`,`used_rate`,`create_time`,`YmdHi`) values 
(1382420,'10.39.35.249','os_249','/run',499972,13128,486844,'2%','2017-11-04 16:19:06',201711041619),
(1382421,'10.39.35.249','os_249','/run',499972,13128,486844,'2%','2017-11-04 16:20:15',201711041620),
(1382422,'10.39.35.249','os_249','/run',499972,13128,486844,'2%','2017-11-04 19:01:45',201711041901),
(1382423,'10.39.35.249','os_249','/run',499972,13128,486844,'2%','2017-11-04 19:02:54',201711041902);

/*Table structure for table `os_diskio` */

DROP TABLE IF EXISTS `os_diskio`;

CREATE TABLE `os_diskio` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) NOT NULL,
  `tags` varchar(100) DEFAULT NULL,
  `fdisk` varchar(50) NOT NULL DEFAULT '0',
  `disk_io_reads` bigint(18) NOT NULL DEFAULT '0',
  `disk_io_writes` bigint(18) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3502473 DEFAULT CHARSET=utf8;

/*Data for the table `os_diskio` */

insert  into `os_diskio`(`id`,`ip`,`tags`,`fdisk`,`disk_io_reads`,`disk_io_writes`,`create_time`) values 
(3502467,'10.39.35.249','os_249','sda',0,0,'2017-11-04 19:04:04'),
(3502468,'10.39.35.249','os_249','sda1',0,0,'2017-11-04 19:04:05'),
(3502469,'10.39.35.249','os_249','sda2',0,0,'2017-11-04 19:04:07'),
(3502470,'10.39.35.249','os_249','sr0',0,0,'2017-11-04 19:04:08'),
(3502471,'10.39.35.249','os_249','dm-0',0,0,'2017-11-04 19:04:09'),
(3502472,'10.39.35.249','os_249','dm-1',0,0,'2017-11-04 19:04:10');

/*Table structure for table `os_diskio_history` */

DROP TABLE IF EXISTS `os_diskio_history`;

CREATE TABLE `os_diskio_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) NOT NULL,
  `tags` varchar(100) DEFAULT NULL,
  `fdisk` varchar(50) NOT NULL DEFAULT '0',
  `disk_io_reads` bigint(18) NOT NULL DEFAULT '0',
  `disk_io_writes` bigint(18) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `YmdHi` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ymdhi` (`YmdHi`) USING BTREE,
  KEY `idx_ip_ymdhi` (`ip`,`YmdHi`),
  KEY `idx_io_reads` (`disk_io_reads`),
  KEY `idx_io_writes` (`disk_io_writes`)
) ENGINE=InnoDB AUTO_INCREMENT=3502467 DEFAULT CHARSET=utf8;

/*Data for the table `os_diskio_history` */

insert  into `os_diskio_history`(`id`,`ip`,`tags`,`fdisk`,`disk_io_reads`,`disk_io_writes`,`create_time`,`YmdHi`) values 
(3502353,'10.39.35.249','os_249','sda',0,0,'2017-11-03 20:04:41',201711032004),
(3502354,'10.39.35.249','os_249','sda1',0,0,'2017-11-03 20:04:42',201711032004),
(3502355,'10.39.35.249','os_249','sda2',0,0,'2017-11-03 20:04:43',201711032004),
(3502356,'10.39.35.249','os_249','sr0',0,0,'2017-11-03 20:04:44',201711032004),
(3502357,'10.39.35.249','os_249','dm-0',0,0,'2017-11-03 20:04:46',201711032004),
(3502358,'10.39.35.249','os_249','dm-1',0,0,'2017-11-03 20:04:47',201711032004),
(3502359,'10.39.35.249','os_249','sda',0,0,'2017-11-03 20:11:03',201711032011),
(3502360,'10.39.35.249','os_249','sda1',0,0,'2017-11-03 20:11:04',201711032011),
(3502361,'10.39.35.249','os_249','sda2',0,0,'2017-11-03 20:11:05',201711032011),
(3502362,'10.39.35.249','os_249','sr0',0,0,'2017-11-03 20:11:07',201711032011),
(3502363,'10.39.35.249','os_249','dm-0',0,0,'2017-11-03 20:11:08',201711032011),
(3502364,'10.39.35.249','os_249','dm-1',0,0,'2017-11-03 20:11:09',201711032011),
(3502365,'10.39.35.249','os_249','sda',0,0,'2017-11-04 10:39:14',201711041039),
(3502366,'10.39.35.249','os_249','sda1',0,0,'2017-11-04 10:39:15',201711041039),
(3502367,'10.39.35.249','os_249','sda2',0,0,'2017-11-04 10:39:16',201711041039),
(3502368,'10.39.35.249','os_249','sr0',0,0,'2017-11-04 10:39:17',201711041039),
(3502369,'10.39.35.249','os_249','dm-0',0,0,'2017-11-04 10:39:18',201711041039),
(3502370,'10.39.35.249','os_249','dm-1',0,0,'2017-11-04 10:39:19',201711041039),
(3502371,'10.39.35.249','os_249','sda',0,0,'2017-11-04 16:05:20',201711041605),
(3502372,'10.39.35.249','os_249','sda1',0,0,'2017-11-04 16:05:21',201711041605),
(3502373,'10.39.35.249','os_249','sda2',0,3,'2017-11-04 16:05:22',201711041605),
(3502374,'10.39.35.249','os_249','sr0',0,0,'2017-11-04 16:05:24',201711041605),
(3502375,'10.39.35.249','os_249','dm-0',0,0,'2017-11-04 16:05:25',201711041605),
(3502376,'10.39.35.249','os_249','dm-1',0,0,'2017-11-04 16:05:26',201711041605),
(3502377,'10.39.35.249','os_249','sda',0,0,'2017-11-04 16:06:29',201711041606),
(3502378,'10.39.35.249','os_249','sda1',0,0,'2017-11-04 16:06:30',201711041606),
(3502379,'10.39.35.249','os_249','sda2',0,0,'2017-11-04 16:06:31',201711041606),
(3502380,'10.39.35.249','os_249','sr0',0,0,'2017-11-04 16:06:33',201711041606),
(3502381,'10.39.35.249','os_249','dm-0',0,0,'2017-11-04 16:06:34',201711041606),
(3502382,'10.39.35.249','os_249','dm-1',0,0,'2017-11-04 16:06:35',201711041606),
(3502383,'10.39.35.249','os_249','sda',0,0,'2017-11-04 16:07:38',201711041607),
(3502384,'10.39.35.249','os_249','sda1',0,0,'2017-11-04 16:07:39',201711041607),
(3502385,'10.39.35.249','os_249','sda2',0,0,'2017-11-04 16:07:40',201711041607),
(3502386,'10.39.35.249','os_249','sr0',0,0,'2017-11-04 16:07:41',201711041607),
(3502387,'10.39.35.249','os_249','dm-0',0,0,'2017-11-04 16:07:42',201711041607),
(3502388,'10.39.35.249','os_249','dm-1',0,0,'2017-11-04 16:07:44',201711041607),
(3502389,'10.39.35.249','os_249','sda',0,0,'2017-11-04 16:08:47',201711041608),
(3502390,'10.39.35.249','os_249','sda1',0,0,'2017-11-04 16:08:48',201711041608),
(3502391,'10.39.35.249','os_249','sda2',0,0,'2017-11-04 16:08:49',201711041608),
(3502392,'10.39.35.249','os_249','sr0',0,0,'2017-11-04 16:08:50',201711041608),
(3502393,'10.39.35.249','os_249','dm-0',0,0,'2017-11-04 16:08:51',201711041608),
(3502394,'10.39.35.249','os_249','dm-1',0,0,'2017-11-04 16:08:53',201711041608),
(3502395,'10.39.35.249','os_249','sda',0,0,'2017-11-04 16:09:56',201711041609),
(3502396,'10.39.35.249','os_249','sda1',0,0,'2017-11-04 16:09:57',201711041609),
(3502397,'10.39.35.249','os_249','sda2',0,0,'2017-11-04 16:09:58',201711041609),
(3502398,'10.39.35.249','os_249','sr0',0,0,'2017-11-04 16:09:59',201711041609),
(3502399,'10.39.35.249','os_249','dm-0',0,0,'2017-11-04 16:10:00',201711041610),
(3502400,'10.39.35.249','os_249','dm-1',0,0,'2017-11-04 16:10:01',201711041610),
(3502401,'10.39.35.249','os_249','sda',0,2,'2017-11-04 16:11:04',201711041611),
(3502402,'10.39.35.249','os_249','sda1',0,0,'2017-11-04 16:11:06',201711041611),
(3502403,'10.39.35.249','os_249','sda2',0,0,'2017-11-04 16:11:07',201711041611),
(3502404,'10.39.35.249','os_249','sr0',0,0,'2017-11-04 16:11:08',201711041611),
(3502405,'10.39.35.249','os_249','dm-0',0,0,'2017-11-04 16:11:09',201711041611),
(3502406,'10.39.35.249','os_249','dm-1',0,0,'2017-11-04 16:11:10',201711041611),
(3502407,'10.39.35.249','os_249','sda',0,0,'2017-11-04 16:12:13',201711041612),
(3502408,'10.39.35.249','os_249','sda1',0,0,'2017-11-04 16:12:15',201711041612),
(3502409,'10.39.35.249','os_249','sda2',0,0,'2017-11-04 16:12:16',201711041612),
(3502410,'10.39.35.249','os_249','sr0',0,0,'2017-11-04 16:12:17',201711041612),
(3502411,'10.39.35.249','os_249','dm-0',0,0,'2017-11-04 16:12:18',201711041612),
(3502412,'10.39.35.249','os_249','dm-1',0,0,'2017-11-04 16:12:19',201711041612),
(3502413,'10.39.35.249','os_249','sda',0,0,'2017-11-04 16:13:23',201711041613),
(3502414,'10.39.35.249','os_249','sda1',0,0,'2017-11-04 16:13:24',201711041613),
(3502415,'10.39.35.249','os_249','sda2',0,0,'2017-11-04 16:13:25',201711041613),
(3502416,'10.39.35.249','os_249','sr0',0,0,'2017-11-04 16:13:26',201711041613),
(3502417,'10.39.35.249','os_249','dm-0',0,0,'2017-11-04 16:13:27',201711041613),
(3502418,'10.39.35.249','os_249','dm-1',0,0,'2017-11-04 16:13:28',201711041613),
(3502419,'10.39.35.249','os_249','sda',0,0,'2017-11-04 16:14:31',201711041614),
(3502420,'10.39.35.249','os_249','sda1',0,0,'2017-11-04 16:14:33',201711041614),
(3502421,'10.39.35.249','os_249','sda2',0,1,'2017-11-04 16:14:34',201711041614),
(3502422,'10.39.35.249','os_249','sr0',0,0,'2017-11-04 16:14:35',201711041614),
(3502423,'10.39.35.249','os_249','dm-0',0,0,'2017-11-04 16:14:36',201711041614),
(3502424,'10.39.35.249','os_249','dm-1',0,0,'2017-11-04 16:14:37',201711041614),
(3502425,'10.39.35.249','os_249','sda',0,1,'2017-11-04 16:15:40',201711041615),
(3502426,'10.39.35.249','os_249','sda1',0,0,'2017-11-04 16:15:41',201711041615),
(3502427,'10.39.35.249','os_249','sda2',0,0,'2017-11-04 16:15:43',201711041615),
(3502428,'10.39.35.249','os_249','sr0',0,0,'2017-11-04 16:15:44',201711041615),
(3502429,'10.39.35.249','os_249','dm-0',0,0,'2017-11-04 16:15:45',201711041615),
(3502430,'10.39.35.249','os_249','dm-1',0,0,'2017-11-04 16:15:46',201711041615),
(3502431,'10.39.35.249','os_249','sda',0,0,'2017-11-04 16:16:49',201711041616),
(3502432,'10.39.35.249','os_249','sda1',0,0,'2017-11-04 16:16:51',201711041616),
(3502433,'10.39.35.249','os_249','sda2',0,0,'2017-11-04 16:16:52',201711041616),
(3502434,'10.39.35.249','os_249','sr0',0,0,'2017-11-04 16:16:53',201711041616),
(3502435,'10.39.35.249','os_249','dm-0',0,0,'2017-11-04 16:16:54',201711041616),
(3502436,'10.39.35.249','os_249','dm-1',0,0,'2017-11-04 16:16:55',201711041616),
(3502437,'10.39.35.249','os_249','sda',0,0,'2017-11-04 16:17:58',201711041617),
(3502438,'10.39.35.249','os_249','sda1',0,0,'2017-11-04 16:17:59',201711041617),
(3502439,'10.39.35.249','os_249','sda2',0,0,'2017-11-04 16:18:01',201711041618),
(3502440,'10.39.35.249','os_249','sr0',0,0,'2017-11-04 16:18:02',201711041618),
(3502441,'10.39.35.249','os_249','dm-0',0,0,'2017-11-04 16:18:03',201711041618),
(3502442,'10.39.35.249','os_249','dm-1',0,0,'2017-11-04 16:18:04',201711041618),
(3502443,'10.39.35.249','os_249','sda',0,0,'2017-11-04 16:19:07',201711041619),
(3502444,'10.39.35.249','os_249','sda1',0,0,'2017-11-04 16:19:08',201711041619),
(3502445,'10.39.35.249','os_249','sda2',0,0,'2017-11-04 16:19:09',201711041619),
(3502446,'10.39.35.249','os_249','sr0',0,0,'2017-11-04 16:19:10',201711041619),
(3502447,'10.39.35.249','os_249','dm-0',0,0,'2017-11-04 16:19:12',201711041619),
(3502448,'10.39.35.249','os_249','dm-1',0,0,'2017-11-04 16:19:13',201711041619),
(3502449,'10.39.35.249','os_249','sda',0,0,'2017-11-04 16:20:16',201711041620),
(3502450,'10.39.35.249','os_249','sda1',0,0,'2017-11-04 16:20:17',201711041620),
(3502451,'10.39.35.249','os_249','sda2',0,0,'2017-11-04 16:20:18',201711041620),
(3502452,'10.39.35.249','os_249','sr0',0,0,'2017-11-04 16:20:20',201711041620),
(3502453,'10.39.35.249','os_249','dm-0',0,0,'2017-11-04 16:20:21',201711041620),
(3502454,'10.39.35.249','os_249','dm-1',0,0,'2017-11-04 16:20:22',201711041620),
(3502455,'10.39.35.249','os_249','sda',0,0,'2017-11-04 19:01:46',201711041901),
(3502456,'10.39.35.249','os_249','sda1',0,0,'2017-11-04 19:01:48',201711041901),
(3502457,'10.39.35.249','os_249','sda2',0,14,'2017-11-04 19:01:49',201711041901),
(3502458,'10.39.35.249','os_249','sr0',0,0,'2017-11-04 19:01:50',201711041901),
(3502459,'10.39.35.249','os_249','dm-0',0,0,'2017-11-04 19:01:51',201711041901),
(3502460,'10.39.35.249','os_249','dm-1',0,0,'2017-11-04 19:01:52',201711041901),
(3502461,'10.39.35.249','os_249','sda',0,0,'2017-11-04 19:02:55',201711041902),
(3502462,'10.39.35.249','os_249','sda1',0,0,'2017-11-04 19:02:57',201711041902),
(3502463,'10.39.35.249','os_249','sda2',0,0,'2017-11-04 19:02:58',201711041902),
(3502464,'10.39.35.249','os_249','sr0',0,0,'2017-11-04 19:02:59',201711041902),
(3502465,'10.39.35.249','os_249','dm-0',0,0,'2017-11-04 19:03:00',201711041903),
(3502466,'10.39.35.249','os_249','dm-1',0,20,'2017-11-04 19:03:01',201711041903);

/*Table structure for table `os_net` */

DROP TABLE IF EXISTS `os_net`;

CREATE TABLE `os_net` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) NOT NULL,
  `tags` varchar(100) DEFAULT NULL,
  `if_descr` varchar(50) NOT NULL DEFAULT '0',
  `in_bytes` bigint(18) NOT NULL DEFAULT '0',
  `out_bytes` bigint(18) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_ip` (`ip`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2318810 DEFAULT CHARSET=utf8;

/*Data for the table `os_net` */

insert  into `os_net`(`id`,`ip`,`tags`,`if_descr`,`in_bytes`,`out_bytes`,`create_time`) values 
(2318809,'10.39.35.249','os_249','eno16777736',3511,2468,'2017-11-04 19:04:11');

/*Table structure for table `os_net_history` */

DROP TABLE IF EXISTS `os_net_history`;

CREATE TABLE `os_net_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) NOT NULL,
  `tags` varchar(100) DEFAULT NULL,
  `if_descr` varchar(50) NOT NULL DEFAULT '0',
  `in_bytes` bigint(18) NOT NULL DEFAULT '0',
  `out_bytes` bigint(18) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `YmdHi` bigint(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ip` (`ip`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2318809 DEFAULT CHARSET=utf8;

/*Data for the table `os_net_history` */

insert  into `os_net_history`(`id`,`ip`,`tags`,`if_descr`,`in_bytes`,`out_bytes`,`create_time`,`YmdHi`) values 
(2318790,'10.39.35.249','os_249','eno16777736',0,0,'2017-11-03 20:04:48',201711032004),
(2318791,'10.39.35.249','os_249','eno16777736',1868,1793,'2017-11-03 20:11:10',201711032011),
(2318792,'10.39.35.249','os_249','eno16777736',0,0,'2017-11-04 10:39:20',201711041039),
(2318793,'10.39.35.249','os_249','eno16777736',0,0,'2017-11-04 16:05:27',201711041605),
(2318794,'10.39.35.249','os_249','eno16777736',0,0,'2017-11-04 16:06:36',201711041606),
(2318795,'10.39.35.249','os_249','eno16777736',0,0,'2017-11-04 16:07:45',201711041607),
(2318796,'10.39.35.249','os_249','eno16777736',0,0,'2017-11-04 16:08:54',201711041608),
(2318797,'10.39.35.249','os_249','eno16777736',0,0,'2017-11-04 16:10:03',201711041610),
(2318798,'10.39.35.249','os_249','eno16777736',0,0,'2017-11-04 16:11:11',201711041611),
(2318799,'10.39.35.249','os_249','eno16777736',0,0,'2017-11-04 16:12:20',201711041612),
(2318800,'10.39.35.249','os_249','eno16777736',0,0,'2017-11-04 16:13:29',201711041613),
(2318801,'10.39.35.249','os_249','eno16777736',0,0,'2017-11-04 16:14:38',201711041614),
(2318802,'10.39.35.249','os_249','eno16777736',0,0,'2017-11-04 16:15:47',201711041615),
(2318803,'10.39.35.249','os_249','eno16777736',0,0,'2017-11-04 16:16:56',201711041616),
(2318804,'10.39.35.249','os_249','eno16777736',0,0,'2017-11-04 16:18:05',201711041618),
(2318805,'10.39.35.249','os_249','eno16777736',3255,2468,'2017-11-04 16:19:14',201711041619),
(2318806,'10.39.35.249','os_249','eno16777736',0,0,'2017-11-04 16:20:23',201711041620),
(2318807,'10.39.35.249','os_249','eno16777736',3316,2468,'2017-11-04 19:01:53',201711041901),
(2318808,'10.39.35.249','os_249','eno16777736',2648,2468,'2017-11-04 19:03:02',201711041903);

/*Table structure for table `os_status` */

DROP TABLE IF EXISTS `os_status`;

CREATE TABLE `os_status` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) NOT NULL,
  `snmp` tinyint(2) NOT NULL DEFAULT '0',
  `tags` varchar(100) DEFAULT NULL,
  `hostname` varchar(100) NOT NULL DEFAULT '-1',
  `kernel` varchar(50) NOT NULL DEFAULT '-1',
  `system_date` varchar(50) NOT NULL DEFAULT '-1',
  `system_uptime` varchar(50) NOT NULL DEFAULT '-1',
  `process` smallint(4) NOT NULL DEFAULT '-1',
  `load_1` decimal(4,2) NOT NULL DEFAULT '-1.00',
  `load_5` decimal(4,2) NOT NULL DEFAULT '-1.00',
  `load_15` decimal(4,2) NOT NULL DEFAULT '-1.00',
  `cpu_user_time` tinyint(4) NOT NULL DEFAULT '-1',
  `cpu_system_time` tinyint(4) NOT NULL DEFAULT '-1',
  `cpu_idle_time` tinyint(4) NOT NULL DEFAULT '-1',
  `swap_total` int(11) NOT NULL DEFAULT '-1',
  `swap_avail` int(11) NOT NULL DEFAULT '-1',
  `mem_total` int(11) NOT NULL DEFAULT '-1',
  `mem_used` int(11) NOT NULL DEFAULT '-1',
  `mem_free` int(11) NOT NULL DEFAULT '-1',
  `mem_shared` int(11) NOT NULL DEFAULT '-1',
  `mem_buffered` int(11) NOT NULL DEFAULT '-1',
  `mem_cached` int(11) NOT NULL DEFAULT '-1',
  `mem_usage_rate` varchar(50) NOT NULL DEFAULT '-1',
  `mem_available` varchar(50) NOT NULL DEFAULT '-1',
  `disk_io_reads_total` int(10) NOT NULL DEFAULT '-1',
  `disk_io_writes_total` int(10) NOT NULL DEFAULT '-1',
  `net_in_bytes_total` bigint(18) NOT NULL DEFAULT '-1',
  `net_out_bytes_total` bigint(18) NOT NULL DEFAULT '-1',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_ip_create_time` (`ip`,`create_time`) USING BTREE,
  KEY `idx_create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=75650 DEFAULT CHARSET=utf8;

/*Data for the table `os_status` */

insert  into `os_status`(`id`,`ip`,`snmp`,`tags`,`hostname`,`kernel`,`system_date`,`system_uptime`,`process`,`load_1`,`load_5`,`load_15`,`cpu_user_time`,`cpu_system_time`,`cpu_idle_time`,`swap_total`,`swap_avail`,`mem_total`,`mem_used`,`mem_free`,`mem_shared`,`mem_buffered`,`mem_cached`,`mem_usage_rate`,`mem_available`,`disk_io_reads_total`,`disk_io_writes_total`,`net_in_bytes_total`,`net_out_bytes_total`,`create_time`) values 
(75649,'10.39.35.249',1,'os_249','localhost.localdomain','Linux 3.10.0-514.26.2.el7.x86_64 x86_64','2017-11-4,19:4:1.0,+8:0',' 17:54:55.68',130,0.03,0.02,0.05,0,0,99,1081340,1078464,999948,642708,80236,10264,0,277004,'64%','357240',0,0,3511,2468,'2017-11-04 19:04:11');

/*Table structure for table `os_status_history` */

DROP TABLE IF EXISTS `os_status_history`;

CREATE TABLE `os_status_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) NOT NULL,
  `snmp` tinyint(2) NOT NULL DEFAULT '0',
  `tags` varchar(100) DEFAULT NULL,
  `hostname` varchar(100) NOT NULL DEFAULT '-1',
  `kernel` varchar(50) NOT NULL DEFAULT '-1',
  `system_date` varchar(50) NOT NULL DEFAULT '-1',
  `system_uptime` varchar(50) NOT NULL DEFAULT '-1',
  `process` smallint(4) NOT NULL DEFAULT '-1',
  `load_1` decimal(4,2) NOT NULL DEFAULT '-1.00',
  `load_5` decimal(4,2) NOT NULL DEFAULT '-1.00',
  `load_15` decimal(4,2) NOT NULL DEFAULT '-1.00',
  `cpu_user_time` tinyint(4) NOT NULL DEFAULT '-1',
  `cpu_system_time` tinyint(4) NOT NULL DEFAULT '-1',
  `cpu_idle_time` tinyint(4) NOT NULL DEFAULT '-1',
  `swap_total` int(11) NOT NULL DEFAULT '-1',
  `swap_avail` int(11) NOT NULL DEFAULT '-1',
  `mem_total` int(11) NOT NULL DEFAULT '-1',
  `mem_used` int(11) NOT NULL DEFAULT '-1',
  `mem_free` int(11) NOT NULL DEFAULT '-1',
  `mem_shared` int(11) NOT NULL DEFAULT '-1',
  `mem_buffered` int(11) NOT NULL DEFAULT '-1',
  `mem_cached` int(11) NOT NULL DEFAULT '-1',
  `mem_usage_rate` varchar(50) NOT NULL DEFAULT '-1',
  `mem_available` varchar(50) NOT NULL DEFAULT '-1',
  `disk_io_reads_total` int(10) NOT NULL DEFAULT '-1',
  `disk_io_writes_total` int(10) NOT NULL DEFAULT '-1',
  `net_in_bytes_total` bigint(18) NOT NULL DEFAULT '-1',
  `net_out_bytes_total` bigint(18) NOT NULL DEFAULT '-1',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `YmdHi` bigint(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_host_ymdhi` (`ip`,`YmdHi`),
  KEY `idx_ymdhi` (`YmdHi`) USING BTREE,
  KEY `idx_createtime` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=75649 DEFAULT CHARSET=utf8;

/*Data for the table `os_status_history` */

insert  into `os_status_history`(`id`,`ip`,`snmp`,`tags`,`hostname`,`kernel`,`system_date`,`system_uptime`,`process`,`load_1`,`load_5`,`load_15`,`cpu_user_time`,`cpu_system_time`,`cpu_idle_time`,`swap_total`,`swap_avail`,`mem_total`,`mem_used`,`mem_free`,`mem_shared`,`mem_buffered`,`mem_cached`,`mem_usage_rate`,`mem_available`,`disk_io_reads_total`,`disk_io_writes_total`,`net_in_bytes_total`,`net_out_bytes_total`,`create_time`,`YmdHi`) values 
(75613,'10.39.35.248',0,'os_248','-1','-1','-1','-1',-1,-1.00,-1.00,-1.00,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'-1','-1',-1,-1,-1,-1,'2017-11-03 20:04:44',201711032004),
(75614,'10.39.35.249',1,'os_249','localhost.localdomain','Linux 3.10.0-514.26.2.el7.x86_64 x86_64','2017-11-3,20:4:39.0,+8:0',' 2:28:53.24',130,0.00,0.01,0.05,0,0,99,1081340,1081268,999948,582816,131332,6808,108,285692,'58%','417132',0,0,0,0,'2017-11-03 20:04:48',201711032004),
(75615,'10.39.35.248',0,'os_248','-1','-1','-1','-1',-1,-1.00,-1.00,-1.00,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'-1','-1',-1,-1,-1,-1,'2017-11-03 20:11:07',201711032011),
(75616,'10.39.35.249',1,'os_249','localhost.localdomain','Linux 3.10.0-514.26.2.el7.x86_64 x86_64','2017-11-3,20:11:2.0,+8:0',' 2:35:16.10',128,0.00,0.01,0.05,0,0,99,1081340,1081268,999948,582876,131268,6808,108,285696,'58%','417072',0,0,1868,1793,'2017-11-03 20:11:10',201711032011),
(75617,'10.39.35.248',0,'os_248','-1','-1','-1','-1',-1,-1.00,-1.00,-1.00,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'-1','-1',-1,-1,-1,-1,'2017-11-04 10:39:17',201711041039),
(75618,'10.39.35.249',1,'os_249','localhost.localdomain','Linux 3.10.0-514.26.2.el7.x86_64 x86_64','2017-11-4,3:4:26.0,+8:0',' 9:28:40.52',137,0.00,0.01,0.05,0,0,99,1081340,1078600,999948,599180,135460,4296,0,265308,'59%','400768',0,0,0,0,'2017-11-04 10:39:20',201711041039),
(75619,'10.39.35.248',0,'os_248','-1','-1','-1','-1',-1,-1.00,-1.00,-1.00,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'-1','-1',-1,-1,-1,-1,'2017-11-04 16:05:24',201711041605),
(75620,'10.39.35.249',1,'os_249','localhost.localdomain','Linux 3.10.0-514.26.2.el7.x86_64 x86_64','2017-11-4,16:5:17.0,+8:0',' 14:56:11.71',128,0.00,0.01,0.05,0,0,99,1081340,1078968,999948,641572,75420,4516,0,282956,'64%','358376',0,3,0,0,'2017-11-04 16:05:27',201711041605),
(75621,'10.39.35.248',0,'os_248','-1','-1','-1','-1',-1,-1.00,-1.00,-1.00,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'-1','-1',-1,-1,-1,-1,'2017-11-04 16:06:33',201711041606),
(75622,'10.39.35.249',1,'os_249','localhost.localdomain','Linux 3.10.0-514.26.2.el7.x86_64 x86_64','2017-11-4,16:6:26.0,+8:0',' 14:57:20.87',128,0.15,0.05,0.06,0,0,99,1081340,1078968,999948,642420,74560,4516,0,282968,'64%','357528',0,0,0,0,'2017-11-04 16:06:36',201711041606),
(75623,'10.39.35.248',0,'os_248','-1','-1','-1','-1',-1,-1.00,-1.00,-1.00,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'-1','-1',-1,-1,-1,-1,'2017-11-04 16:07:42',201711041607),
(75624,'10.39.35.249',1,'os_249','localhost.localdomain','Linux 3.10.0-514.26.2.el7.x86_64 x86_64','2017-11-4,16:7:35.0,+8:0',' 14:58:29.91',128,0.05,0.04,0.05,0,0,99,1081340,1078968,999948,642380,74592,4516,0,282976,'64%','357568',0,0,0,0,'2017-11-04 16:07:45',201711041607),
(75625,'10.39.35.248',0,'os_248','-1','-1','-1','-1',-1,-1.00,-1.00,-1.00,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'-1','-1',-1,-1,-1,-1,'2017-11-04 16:08:51',201711041608),
(75626,'10.39.35.249',1,'os_249','localhost.localdomain','Linux 3.10.0-514.26.2.el7.x86_64 x86_64','2017-11-4,16:8:44.0,+8:0',' 14:59:38.69',128,0.02,0.03,0.05,0,0,99,1081340,1078968,999948,642040,74924,4516,0,282984,'64%','357908',0,0,0,0,'2017-11-04 16:08:54',201711041608),
(75627,'10.39.35.248',0,'os_248','-1','-1','-1','-1',-1,-1.00,-1.00,-1.00,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'-1','-1',-1,-1,-1,-1,'2017-11-04 16:10:00',201711041610),
(75628,'10.39.35.249',1,'os_249','localhost.localdomain','Linux 3.10.0-514.26.2.el7.x86_64 x86_64','2017-11-4,16:9:53.0,+8:0',' 15:00:47.56',128,0.00,0.03,0.05,0,0,99,1081340,1078968,999948,641820,75140,4516,0,282988,'64%','358128',0,0,0,0,'2017-11-04 16:10:03',201711041610),
(75629,'10.39.35.248',0,'os_248','-1','-1','-1','-1',-1,-1.00,-1.00,-1.00,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'-1','-1',-1,-1,-1,-1,'2017-11-04 16:11:09',201711041611),
(75630,'10.39.35.249',1,'os_249','localhost.localdomain','Linux 3.10.0-514.26.2.el7.x86_64 x86_64','2017-11-4,16:11:2.0,+8:0',' 15:01:56.46',128,0.00,0.02,0.05,0,0,99,1081340,1078968,999948,642108,74836,4516,0,283004,'64%','357840',0,2,0,0,'2017-11-04 16:11:12',201711041611),
(75631,'10.39.35.248',0,'os_248','-1','-1','-1','-1',-1,-1.00,-1.00,-1.00,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'-1','-1',-1,-1,-1,-1,'2017-11-04 16:12:18',201711041612),
(75632,'10.39.35.249',1,'os_249','localhost.localdomain','Linux 3.10.0-514.26.2.el7.x86_64 x86_64','2017-11-4,16:12:11.0,+8:0',' 15:03:05.38',129,0.00,0.01,0.05,0,0,99,1081340,1078988,999948,642128,74760,4536,0,283060,'64%','357820',0,0,0,0,'2017-11-04 16:12:20',201711041612),
(75633,'10.39.35.248',0,'os_248','-1','-1','-1','-1',-1,-1.00,-1.00,-1.00,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'-1','-1',-1,-1,-1,-1,'2017-11-04 16:13:27',201711041613),
(75634,'10.39.35.249',1,'os_249','localhost.localdomain','Linux 3.10.0-514.26.2.el7.x86_64 x86_64','2017-11-4,16:13:20.0,+8:0',' 15:04:14.43',129,0.00,0.01,0.05,0,0,99,1081340,1078996,999948,642576,74300,4544,0,283072,'64%','357372',0,0,0,0,'2017-11-04 16:13:29',201711041613),
(75635,'10.39.35.248',0,'os_248','-1','-1','-1','-1',-1,-1.00,-1.00,-1.00,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'-1','-1',-1,-1,-1,-1,'2017-11-04 16:14:36',201711041614),
(75636,'10.39.35.249',1,'os_249','localhost.localdomain','Linux 3.10.0-514.26.2.el7.x86_64 x86_64','2017-11-4,16:14:29.0,+8:0',' 15:05:23.31',131,0.06,0.03,0.05,0,0,99,1081340,1079080,999948,642000,74724,4628,0,283224,'64%','357948',0,1,0,0,'2017-11-04 16:14:38',201711041614),
(75637,'10.39.35.248',0,'os_248','-1','-1','-1','-1',-1,-1.00,-1.00,-1.00,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'-1','-1',-1,-1,-1,-1,'2017-11-04 16:15:45',201711041615),
(75638,'10.39.35.249',1,'os_249','localhost.localdomain','Linux 3.10.0-514.26.2.el7.x86_64 x86_64','2017-11-4,16:15:38.0,+8:0',' 15:06:32.22',131,0.02,0.02,0.05,0,0,99,1081340,1079136,999948,642608,73992,4684,0,283348,'64%','357340',0,1,0,0,'2017-11-04 16:15:47',201711041615),
(75639,'10.39.35.248',0,'os_248','-1','-1','-1','-1',-1,-1.00,-1.00,-1.00,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'-1','-1',-1,-1,-1,-1,'2017-11-04 16:16:54',201711041616),
(75640,'10.39.35.249',1,'os_249','localhost.localdomain','Linux 3.10.0-514.26.2.el7.x86_64 x86_64','2017-11-4,16:16:47.0,+8:0',' 15:07:41.15',130,0.32,0.10,0.07,0,0,99,1081340,1079204,999948,641964,74504,4752,0,283480,'64%','357984',0,0,0,0,'2017-11-04 16:16:56',201711041616),
(75641,'10.39.35.248',0,'os_248','-1','-1','-1','-1',-1,-1.00,-1.00,-1.00,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'-1','-1',-1,-1,-1,-1,'2017-11-04 16:18:03',201711041618),
(75642,'10.39.35.249',1,'os_249','localhost.localdomain','Linux 3.10.0-514.26.2.el7.x86_64 x86_64','2017-11-4,16:17:56.0,+8:0',' 15:08:50.21',130,0.11,0.08,0.06,0,0,99,1081340,1079256,999948,642860,73496,4804,0,283592,'64%','357088',0,0,0,0,'2017-11-04 16:18:05',201711041618),
(75643,'10.39.35.248',0,'os_248','-1','-1','-1','-1',-1,-1.00,-1.00,-1.00,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'-1','-1',-1,-1,-1,-1,'2017-11-04 16:19:12',201711041619),
(75644,'10.39.35.249',1,'os_249','localhost.localdomain','Linux 3.10.0-514.26.2.el7.x86_64 x86_64','2017-11-4,16:19:5.0,+8:0',' 15:09:58.99',130,0.03,0.06,0.06,0,0,99,1081340,1079300,999948,642124,67868,11100,0,289956,'64%','357824',0,0,3255,2468,'2017-11-04 16:19:14',201711041619),
(75645,'10.39.35.248',0,'os_248','-1','-1','-1','-1',-1,-1.00,-1.00,-1.00,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'-1','-1',-1,-1,-1,-1,'2017-11-04 16:20:20',201711041620),
(75646,'10.39.35.249',1,'os_249','localhost.localdomain','Linux 3.10.0-514.26.2.el7.x86_64 x86_64','2017-11-4,16:20:13.0,+8:0',' 15:11:07.70',128,0.05,0.06,0.06,0,0,99,1081340,1079300,999948,642812,67120,11100,0,290016,'64%','357136',0,0,0,0,'2017-11-04 16:20:23',201711041620),
(75647,'10.39.35.249',1,'os_249','localhost.localdomain','Linux 3.10.0-514.26.2.el7.x86_64 x86_64','2017-11-4,19:1:43.0,+8:0',' 17:52:37.75',128,0.00,0.01,0.05,0,0,99,1081340,1079300,999948,642196,67520,11100,0,290232,'64%','357752',0,14,3316,2468,'2017-11-04 19:01:53',201711041901),
(75648,'10.39.35.249',1,'os_249','localhost.localdomain','Linux 3.10.0-514.26.2.el7.x86_64 x86_64','2017-11-4,19:2:52.0,+8:0',' 17:53:46.82',129,0.08,0.03,0.05,0,0,99,1081340,1078464,999948,642388,80624,10264,0,276936,'64%','357560',0,20,2648,2468,'2017-11-04 19:03:02',201711041903);

/*Table structure for table `redis_replication` */

DROP TABLE IF EXISTS `redis_replication`;

CREATE TABLE `redis_replication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_id` smallint(4) NOT NULL DEFAULT '0',
  `tags` varchar(50) NOT NULL DEFAULT '',
  `host` varchar(128) DEFAULT '0',
  `port` smallint(4) DEFAULT '0',
  `role` varchar(20) DEFAULT '0',
  `master_server_id` smallint(4) NOT NULL DEFAULT '0',
  `master_host` varchar(20) DEFAULT '0',
  `master_port` varchar(20) DEFAULT '0',
  `master_link_status` varchar(20) DEFAULT '0',
  `master_last_io_seconds_ago` varchar(20) DEFAULT '0',
  `master_sync_in_progress` varchar(20) DEFAULT '0',
  `slave_priority` varchar(20) DEFAULT '0',
  `slave_read_only` varchar(20) DEFAULT '0',
  `connected_slaves` smallint(4) DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `redis_replication` */

/*Table structure for table `redis_replication_history` */

DROP TABLE IF EXISTS `redis_replication_history`;

CREATE TABLE `redis_replication_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_id` smallint(4) NOT NULL DEFAULT '0',
  `tags` varchar(50) NOT NULL DEFAULT '',
  `host` varchar(20) DEFAULT '0',
  `port` smallint(4) DEFAULT '0',
  `role` varchar(20) DEFAULT '0',
  `master_server_id` smallint(4) NOT NULL DEFAULT '0',
  `master_host` varchar(20) DEFAULT '0',
  `master_port` varchar(20) DEFAULT '0',
  `master_link_status` varchar(20) DEFAULT '0',
  `master_last_io_seconds_ago` varchar(20) DEFAULT '0',
  `master_sync_in_progress` varchar(20) DEFAULT '0',
  `slave_priority` varchar(20) DEFAULT '0',
  `slave_read_only` varchar(20) DEFAULT '0',
  `connected_slaves` smallint(4) DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ymdhi` bigint(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `redis_replication_history` */

/*Table structure for table `redis_status` */

DROP TABLE IF EXISTS `redis_status`;

CREATE TABLE `redis_status` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `server_id` smallint(4) NOT NULL DEFAULT '0',
  `host` varchar(128) NOT NULL,
  `port` varchar(10) NOT NULL,
  `tags` varchar(50) NOT NULL DEFAULT '',
  `connect` smallint(4) NOT NULL DEFAULT '0',
  `redis_role` varchar(30) NOT NULL DEFAULT '-1',
  `redis_version` varchar(50) NOT NULL DEFAULT '-1',
  `redis_git_sha1` varchar(255) NOT NULL DEFAULT '-1',
  `redis_git_dirty` varchar(255) NOT NULL DEFAULT '-1',
  `redis_mode` varchar(255) NOT NULL DEFAULT '-1',
  `os` varchar(255) NOT NULL DEFAULT '-1',
  `arch_bits` varchar(10) NOT NULL DEFAULT '-1',
  `multiplexing_api` varchar(20) NOT NULL DEFAULT '-1',
  `gcc_version` varchar(20) NOT NULL DEFAULT '-1',
  `process_id` int(10) NOT NULL DEFAULT '-1',
  `run_id` varchar(255) NOT NULL DEFAULT '-1',
  `tcp_port` int(11) NOT NULL DEFAULT '-1',
  `uptime_in_seconds` int(11) NOT NULL DEFAULT '-1',
  `uptime_in_days` int(11) NOT NULL DEFAULT '-1',
  `hz` int(11) NOT NULL DEFAULT '-1',
  `lru_clock` bigint(20) NOT NULL DEFAULT '-1',
  `connected_clients` smallint(4) NOT NULL DEFAULT '-1',
  `client_longest_output_list` smallint(4) NOT NULL DEFAULT '-1',
  `client_biggest_input_buf` smallint(4) NOT NULL DEFAULT '-1',
  `blocked_clients` smallint(4) NOT NULL DEFAULT '-1',
  `used_memory` bigint(10) NOT NULL DEFAULT '-1',
  `used_memory_human` varchar(50) NOT NULL DEFAULT '-1',
  `used_memory_rss` varchar(50) NOT NULL DEFAULT '-1',
  `used_memory_peak` varchar(50) NOT NULL DEFAULT '-1',
  `used_memory_peak_human` varchar(50) NOT NULL DEFAULT '-1',
  `used_memory_lua` varchar(50) NOT NULL DEFAULT '-1',
  `mem_fragmentation_ratio` varchar(50) NOT NULL DEFAULT '-1',
  `mem_allocator` varchar(50) NOT NULL DEFAULT '-1',
  `loading` smallint(4) NOT NULL DEFAULT '-1',
  `rdb_changes_since_last_save` smallint(4) NOT NULL DEFAULT '-1',
  `rdb_bgsave_in_progress` smallint(4) NOT NULL DEFAULT '-1',
  `rdb_last_save_time` bigint(18) NOT NULL DEFAULT '-1',
  `rdb_last_bgsave_status` varchar(10) NOT NULL DEFAULT '-1',
  `rdb_last_bgsave_time_sec` smallint(4) NOT NULL DEFAULT '-1',
  `rdb_current_bgsave_time_sec` smallint(4) NOT NULL DEFAULT '-1',
  `aof_enabled` smallint(4) NOT NULL DEFAULT '-1',
  `aof_rewrite_in_progress` smallint(4) NOT NULL DEFAULT '-1',
  `aof_rewrite_scheduled` smallint(4) NOT NULL DEFAULT '-1',
  `aof_last_rewrite_time_sec` smallint(4) NOT NULL DEFAULT '-1',
  `aof_current_rewrite_time_sec` smallint(4) NOT NULL DEFAULT '-1',
  `aof_last_bgrewrite_status` varchar(10) NOT NULL DEFAULT '-1',
  `total_connections_received` bigint(18) NOT NULL DEFAULT '-1',
  `total_commands_processed` bigint(18) NOT NULL DEFAULT '-1',
  `current_commands_processed` smallint(4) NOT NULL DEFAULT '-1',
  `instantaneous_ops_per_sec` smallint(4) NOT NULL DEFAULT '-1',
  `rejected_connections` smallint(4) NOT NULL DEFAULT '-1',
  `expired_keys` int(10) NOT NULL DEFAULT '-1',
  `evicted_keys` int(10) NOT NULL DEFAULT '-1',
  `keyspace_hits` int(10) NOT NULL DEFAULT '-1',
  `keyspace_misses` int(10) NOT NULL DEFAULT '-1',
  `pubsub_channels` int(10) NOT NULL DEFAULT '-1',
  `pubsub_patterns` int(10) NOT NULL DEFAULT '-1',
  `latest_fork_usec` int(10) NOT NULL DEFAULT '-1',
  `used_cpu_sys` decimal(10,2) NOT NULL DEFAULT '-1.00',
  `used_cpu_user` double(10,2) NOT NULL DEFAULT '-1.00',
  `used_cpu_sys_children` int(10) NOT NULL DEFAULT '-1',
  `used_cpu_user_children` int(10) NOT NULL DEFAULT '-1',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_server_id` (`server_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=528742 DEFAULT CHARSET=utf8;

/*Data for the table `redis_status` */

/*Table structure for table `redis_status_history` */

DROP TABLE IF EXISTS `redis_status_history`;

CREATE TABLE `redis_status_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `server_id` smallint(4) NOT NULL DEFAULT '0',
  `host` varchar(128) NOT NULL,
  `port` varchar(10) NOT NULL,
  `tags` varchar(50) NOT NULL DEFAULT '',
  `connect` smallint(4) NOT NULL DEFAULT '0',
  `redis_role` varchar(30) NOT NULL DEFAULT '-1',
  `redis_version` varchar(50) NOT NULL DEFAULT '0',
  `redis_git_sha1` varchar(255) NOT NULL DEFAULT '-1',
  `redis_git_dirty` varchar(255) NOT NULL DEFAULT '-1',
  `redis_mode` varchar(255) NOT NULL DEFAULT '-1',
  `os` varchar(255) NOT NULL DEFAULT '-1',
  `arch_bits` varchar(10) NOT NULL DEFAULT '-1',
  `multiplexing_api` varchar(20) NOT NULL DEFAULT '-1',
  `gcc_version` varchar(20) NOT NULL DEFAULT '-1',
  `process_id` int(10) NOT NULL DEFAULT '-1',
  `run_id` varchar(255) NOT NULL DEFAULT '-1',
  `tcp_port` int(11) NOT NULL DEFAULT '-1',
  `uptime_in_seconds` int(11) NOT NULL DEFAULT '-1',
  `uptime_in_days` int(11) NOT NULL DEFAULT '-1',
  `hz` int(11) NOT NULL DEFAULT '-1',
  `lru_clock` bigint(20) NOT NULL DEFAULT '-1',
  `connected_clients` smallint(4) NOT NULL DEFAULT '-1',
  `client_longest_output_list` smallint(4) NOT NULL DEFAULT '-1',
  `client_biggest_input_buf` smallint(4) NOT NULL DEFAULT '-1',
  `blocked_clients` smallint(4) NOT NULL DEFAULT '-1',
  `used_memory` bigint(10) NOT NULL DEFAULT '-1',
  `used_memory_human` varchar(50) NOT NULL DEFAULT '-1',
  `used_memory_rss` varchar(50) NOT NULL DEFAULT '-1',
  `used_memory_peak` varchar(50) NOT NULL DEFAULT '-1',
  `used_memory_peak_human` varchar(50) NOT NULL DEFAULT '-1',
  `used_memory_lua` varchar(50) NOT NULL DEFAULT '-1',
  `mem_fragmentation_ratio` varchar(50) NOT NULL DEFAULT '-1',
  `mem_allocator` varchar(50) NOT NULL DEFAULT '-1',
  `loading` smallint(4) NOT NULL DEFAULT '-1',
  `rdb_changes_since_last_save` smallint(4) NOT NULL DEFAULT '-1',
  `rdb_bgsave_in_progress` smallint(4) NOT NULL DEFAULT '-1',
  `rdb_last_save_time` bigint(18) NOT NULL DEFAULT '-1',
  `rdb_last_bgsave_status` varchar(10) NOT NULL DEFAULT '-1',
  `rdb_last_bgsave_time_sec` smallint(4) NOT NULL DEFAULT '-1',
  `rdb_current_bgsave_time_sec` smallint(4) NOT NULL DEFAULT '-1',
  `aof_enabled` smallint(4) NOT NULL DEFAULT '-1',
  `aof_rewrite_in_progress` smallint(4) NOT NULL DEFAULT '-1',
  `aof_rewrite_scheduled` smallint(4) NOT NULL DEFAULT '-1',
  `aof_last_rewrite_time_sec` smallint(4) NOT NULL DEFAULT '-1',
  `aof_current_rewrite_time_sec` smallint(4) NOT NULL DEFAULT '-1',
  `aof_last_bgrewrite_status` varchar(10) NOT NULL DEFAULT '-1',
  `total_connections_received` bigint(18) NOT NULL DEFAULT '-1',
  `total_commands_processed` bigint(18) NOT NULL DEFAULT '-1',
  `current_commands_processed` smallint(4) NOT NULL DEFAULT '-1',
  `instantaneous_ops_per_sec` smallint(4) NOT NULL DEFAULT '-1',
  `rejected_connections` smallint(4) NOT NULL DEFAULT '-1',
  `expired_keys` int(10) NOT NULL DEFAULT '-1',
  `evicted_keys` int(10) NOT NULL DEFAULT '-1',
  `keyspace_hits` int(10) NOT NULL DEFAULT '-1',
  `keyspace_misses` int(10) NOT NULL DEFAULT '-1',
  `pubsub_channels` int(10) NOT NULL DEFAULT '-1',
  `pubsub_patterns` int(10) NOT NULL DEFAULT '-1',
  `latest_fork_usec` int(10) NOT NULL DEFAULT '-1',
  `used_cpu_sys` decimal(10,2) NOT NULL DEFAULT '-1.00',
  `used_cpu_user` double(10,2) NOT NULL DEFAULT '-1.00',
  `used_cpu_sys_children` int(10) NOT NULL DEFAULT '-1',
  `used_cpu_user_children` int(10) NOT NULL DEFAULT '-1',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ymdhi` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_server_id` (`server_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=528736 DEFAULT CHARSET=utf8;

/*Data for the table `redis_status_history` */

/*Table structure for table `servers_os_tree` */

DROP TABLE IF EXISTS `servers_os_tree`;

CREATE TABLE `servers_os_tree` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL DEFAULT '' COMMENT '树名称',
  `tree_level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '树级别1-4是父级 5是os_id 6是web、mysql等应用服务',
  `pId` int(20) unsigned NOT NULL DEFAULT '0' COMMENT '父节点',
  `is_parent` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否父节点',
  `os_id` int(20) DEFAULT '0' COMMENT 'db_servers_os表id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `servers_os_tree` */

insert  into `servers_os_tree`(`id`,`name`,`tree_level`,`pId`,`is_parent`,`os_id`) values 
(1,'服务器资源',1,0,1,0),
(8,'阿里云',2,1,1,0),
(9,'办公内网',2,1,1,0),
(10,'采购',3,8,1,0),
(11,'WEB',4,10,1,0),
(12,'1.1.1.1',5,11,1,0),
(13,'DB',4,10,1,0),
(15,'10.39.35.248',5,9,0,167),
(16,'new_nodes1',5,13,1,0),
(17,'10.39.35.249',5,9,0,168);

/*Table structure for table `web_daily_pv` */

DROP TABLE IF EXISTS `web_daily_pv`;

CREATE TABLE `web_daily_pv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` char(30) DEFAULT NULL COMMENT '域名',
  `pv` int(10) DEFAULT NULL,
  `uv` int(10) DEFAULT NULL,
  `ip` int(10) DEFAULT NULL,
  `cur_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `web_daily_pv` */

/*Table structure for table `web_log` */

DROP TABLE IF EXISTS `web_log`;

CREATE TABLE `web_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `web_id` int(10) unsigned DEFAULT NULL COMMENT 'db_servers_web表id',
  `ip` char(15) DEFAULT '',
  `uv` char(32) DEFAULT '',
  `url` varchar(64) NOT NULL DEFAULT '',
  `response_time` datetime NOT NULL,
  `cur_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `web_log` */

/*Table structure for table `web_status` */

DROP TABLE IF EXISTS `web_status`;

CREATE TABLE `web_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `web_id` int(10) unsigned DEFAULT NULL,
  `process_num` varchar(32) DEFAULT NULL,
  `listen` int(4) DEFAULT NULL,
  `established` int(4) DEFAULT NULL,
  `time_wait` int(4) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `remark` text,
  `attach` text NOT NULL,
  `is_alarm` smallint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `web_status` */

/*Table structure for table `web_status_history` */

DROP TABLE IF EXISTS `web_status_history`;

CREATE TABLE `web_status_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `web_id` int(10) unsigned DEFAULT NULL,
  `process_num` varchar(32) DEFAULT NULL,
  `listen` int(4) DEFAULT NULL,
  `established` int(4) DEFAULT NULL,
  `time_wait` int(4) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `remark` text,
  `attach` text,
  `is_alarm` smallint(2) DEFAULT NULL,
  `ymdhi` bigint(18) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `web_status_history` */

/*Table structure for table `web_view` */

DROP TABLE IF EXISTS `web_view`;

CREATE TABLE `web_view` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(10) unsigned DEFAULT NULL,
  `domain` varchar(32) DEFAULT NULL,
  `ip` char(25) DEFAULT NULL,
  `uv` int(10) unsigned NOT NULL,
  `pv` int(10) unsigned NOT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `web_view` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
