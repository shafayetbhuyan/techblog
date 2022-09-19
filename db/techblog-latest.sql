/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.22 : Database - techblog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`techblog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `techblog`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(150) NOT NULL,
  `admin_password` varchar(100) NOT NULL,
  `admin_gender` varchar(100) NOT NULL,
  `admin_about` varchar(500) DEFAULT 'I am Admin of this Website.',
  `admin_rdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `admin_profile` varchar(200) DEFAULT 'default.png',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `admin` */

insert  into `admin`(`admin_id`,`admin_name`,`admin_email`,`admin_password`,`admin_gender`,`admin_about`,`admin_rdate`,`admin_profile`) values 
(1,'Abir Bhuyan','admin@abir.com','1230','MALE','I am Admin of this Website.','2020-08-14 20:48:06','default.png');

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `c_id` int NOT NULL AUTO_INCREMENT,
  `c_name` varchar(100) NOT NULL,
  `c_description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `categories` */

insert  into `categories`(`c_id`,`c_name`,`c_description`) values 
(1,'Java Programming','Java is one of the most powerfull programming Language.'),
(2,'Python Programming','Python is the most popular programming language in 2020.'),
(3,'Web Technology','Used mostly for websites and webappication\'s.');

/*Table structure for table `liked` */

DROP TABLE IF EXISTS `liked`;

CREATE TABLE `liked` (
  `lid` int NOT NULL AUTO_INCREMENT,
  `post_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`lid`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `liked_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `liked_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `liked` */

insert  into `liked`(`lid`,`post_id`,`user_id`) values 
(1,4,6),
(6,2,6),
(8,3,6),
(9,3,6),
(10,3,6),
(11,3,1),
(12,3,1),
(13,3,1),
(14,3,1),
(15,3,1),
(16,3,1),
(17,3,1),
(18,3,1),
(19,3,1),
(20,3,1),
(21,3,1),
(22,4,6),
(23,4,6),
(24,4,6),
(25,5,6);

/*Table structure for table `posts` */

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `p_id` int NOT NULL AUTO_INCREMENT,
  `p_title` varchar(150) NOT NULL,
  `p_content` longtext,
  `p_code` longtext,
  `p_pic` varchar(100) DEFAULT NULL,
  `p_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `c_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`p_id`),
  KEY `c_id` (`c_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `categories` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `posts` */

insert  into `posts`(`p_id`,`p_title`,`p_content`,`p_code`,`p_pic`,`p_date`,`c_id`,`user_id`) values 
(1,'What is java programming?','Java is a object oriented language. this is the most powerfull language in the world.  more than 3 billion device run on java.','public class FirstJavaCode{\r\npublic static void main(String []args){\r\nSystem.out.println(\"Hello World\");\r\n}','oops.png','2020-07-08 00:35:08',1,6),
(2,'What is Python?','Python is the most popular language in the world for machine lerning.','#code','oops.png','2020-07-08 01:23:34',2,17),
(3,'HTML','HTML - Hyper Text Markup Language. it is the mendatory markup language for internet browser.','<html>\r\n<head></head>\r\n\r\n<body></body\r\n</html>','h.jpg','2020-07-08 09:16:19',3,8),
(4,'What is java best for?','java is  best for so many different tasks. java was mainly developed for streaming services.','#code','C9085E77-527A-44BE-BC48-DAE51C3ED1EA.jpg','2020-07-08 20:48:34',1,6),
(5,'Advantage of Web Technology','Administrator Access is defined as a level of access above that of a normal user.  This definition is intentionally vague to allow the flexibility to accommodate varying systems and authentication mechanisms.  In a traditional Microsoft Windows environment, members of the Power Users, Local Administrators, Domain Administrators and Enterprise Administrators groups would all be considered to have Administrator Access.  In a traditional UNIX or Linux environment, users with root level access or the ability to sudo would be considered to have Administrator Access.  In an application environment, users with âsuper-userâ or system administrator roles and responsibilities would be considered to have Administrator ','function ClickChangeButton(){\r\n  alert(\'clicked button this is JS File\')\r\n}\r\n\r\n\r\nfunction ClickConfirmButton(){\r\n  var text;\r\n  var con = confirm(\"Do you want to press OK??? \") \r\n  if(con==ture)\r\n  {\r\n    text= (\"You pressed OK\")\r\n  }\r\n  else\r\n    {\r\n      text= ( \"You Cancle the request\")\r\n    }\r\n}\r\n','IMG_6304.JPG','2020-07-18 16:29:38',3,6),
(6,'Biggner python programming','new way to learn python programming','#Python','IMG_8369.JPG','2020-07-22 22:04:50',2,19),
(7,'Advance Python','Advance python programming mostly used in machine learning. \r\n','#code','460a12e9cc61bbb1d9c84030b5f482c6--kajol-vintage-bollywood.jpg','2020-07-25 22:08:37',2,17);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `about` varchar(1000) DEFAULT '''Heyy... !I am Using Tech Blog''',
  `rdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `profile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'default.png',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`email`,`password`,`gender`,`about`,`rdate`,`profile`) values 
(1,' Al Shafayet Bhuyan','abdullahalshafayet@abir.com','1230','male','I personally very ambisious person.\r\nalso hard worker. also lazy','2020-07-04 10:11:30','13FCBC73-2EA6-4B56-AB6F-4CB4A909A08D.jpg'),
(3,'Nushrat Jahan','nushratjahan@abir.com','1230','male','Socialist','2020-07-04 10:18:44','default.png'),
(4,'Tanzil','tanzil@abir.com','1230','female','Having Fun','2020-07-04 10:40:33','default.png'),
(5,'Sumiya','sumiya@abir.com','1230','female','Having Fun','2020-07-04 10:42:29','default.png'),
(6,'Metu Bhuyan','metu@abir.com','1230','female','Having Fun','2020-07-04 10:45:17','IMG.JPG'),
(7,'Husna','husna@gmail.com','1230','female','Housewife','2020-07-04 11:04:20','default.png'),
(8,'Khurshid','khurshid@abir.com','1230','male','House head','2020-07-04 11:06:35','default.png'),
(9,'rahad','rahad@gmail.com','1230','male','Overseas','2020-07-04 11:14:38','default.png'),
(10,'Afsar','Afsar@gmail.com','1230','male','proud person','2020-07-04 11:26:37','default.png'),
(12,'Bhuyan','bhuyan@abir.com','1230','male','what','2020-07-04 11:29:50','default.png'),
(14,'Saminur Disha','disha@abir.com','1230','female','I am beautyfull.','2020-07-04 20:22:07','default.png'),
(16,'Tasniya','tasniya@abir.com','1230','female','I am claver.','2020-07-04 20:24:53','default.png'),
(17,'Ural pakhi','ural@gmail.com','1230','male','what about me?','2020-07-04 20:26:05','default.png'),
(19,'Efan','efan@abir.com','1230','male','Yoooo.......','2020-07-22 21:57:44','Abir 3.jpg');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
