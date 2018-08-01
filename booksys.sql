/*
SQLyog v10.2 
MySQL - 5.6.24 : Database - bookssys
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bookssys` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bookssys`;

/*Table structure for table `book_info` */

DROP TABLE IF EXISTS `book_info`;

CREATE TABLE `book_info` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_code` varchar(20) NOT NULL,
  `book_name` varchar(30) NOT NULL,
  `book_type` int(11) NOT NULL,
  `book_author` varchar(20) NOT NULL,
  `publish_press` varchar(30) NOT NULL COMMENT '出版社',
  `publish _date` datetime NOT NULL COMMENT '出版时间',
  `is_borrow` int(11) NOT NULL COMMENT '是否借阅',
  `createdBy` varchar(20) NOT NULL COMMENT '创建人',
  `creation_time` datetime NOT NULL COMMENT '创建时间',
  `last_updatetime` datetime NOT NULL COMMENT '最新更新时间',
  PRIMARY KEY (`book_id`),
  KEY `book_type` (`book_type`),
  CONSTRAINT `book_info_ibfk_1` FOREIGN KEY (`book_type`) REFERENCES `book_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `book_info` */

insert  into `book_info`(`book_id`,`book_code`,`book_name`,`book_type`,`book_author`,`publish_press`,`publish _date`,`is_borrow`,`createdBy`,`creation_time`,`last_updatetime`) values (1,'E123','未来已来',2,'马云','马云出版社','2018-07-16 17:03:52',2,'马云','2018-07-31 17:04:20','2018-07-31 17:04:22'),(2,'E234','遮天',4,'辰东','辰东出版社','2018-06-11 17:05:10',1,'辰东','2018-07-24 17:05:19','2018-07-31 17:05:22'),(3,'E345','Linux',1,'李纳思','Liunx','2018-06-25 17:06:18',2,'Linux','2018-07-16 17:06:25','2018-07-01 17:06:27');

/*Table structure for table `book_type` */

DROP TABLE IF EXISTS `book_type`;

CREATE TABLE `book_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `book_type` */

insert  into `book_type`(`id`,`type_name`) values (1,'科学'),(2,'未来'),(3,'古代'),(4,'玄幻');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_code` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `register_time` datetime NOT NULL COMMENT '注册时间',
  `last_logintime` datetime NOT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`user_id`,`user_code`,`password`,`email`,`gender`,`register_time`,`last_logintime`) values (1,'xcq','123','123@qq.com','1','2018-07-31 14:01:19','2018-07-31 14:01:21'),(2,'wb','123','123@qq.com','1','2018-07-31 15:21:54','2018-07-31 15:21:54'),(7,'ws','123','123@qq.com','1','2018-07-31 15:55:59','2018-07-31 15:55:59'),(8,'sa','123456','123@qq.com','1','2018-07-31 15:58:54','2018-07-31 15:58:54');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
