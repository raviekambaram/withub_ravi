-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: withub
-- ------------------------------------------------------
-- Server version	5.7.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `MID` int(10) NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `dob` varchar(50) DEFAULT NULL,
  `doj` varchar(45) DEFAULT NULL,
  `yop` varchar(45) DEFAULT NULL,
  `current status` varchar(50) DEFAULT NULL,
  `college name` varchar(60) DEFAULT NULL,
  `occupation` varchar(45) DEFAULT NULL,
  `company` varchar(80) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `security_question` varchar(200) NOT NULL,
  `security_answer` varchar(80) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `project_description` varchar(1000) DEFAULT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `qualification` varchar(70) DEFAULT NULL,
  `expertise_areas` varchar(70) DEFAULT NULL,
  `experience` varchar(45) DEFAULT NULL,
  `salary_expected` varchar(80) DEFAULT NULL,
  `prefered_location` varchar(80) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `Profile_Pic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MID`),
  UNIQUE KEY `MID_UNIQUE` (`MID`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'saurabh','singh','ss@albany.edu','123','123456','1234','112','12345','as','AS','HOP','JKK','NN','K,','ask','ask',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'s','s','s@s.f','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'as','as',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Saurabh','Singh','saurabh.singh.sam@gmail.com','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'as','as',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'saurab','singh','saurabh.sam@gmail.com','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'as','as',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'Anshika',' Gupta','Agupta@Ucla.Edu','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ask','ask',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'Surbhi','jain','sj@gmail.com','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Mothers\' Name?','asha',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'Sneha','Shah','ssh@gmail.com','123456','5182588351',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ask','ask','united states of america',NULL,'Finance','Master of Science','Computer science','3-4 years','123456','Houston','Female',NULL),(9,'sa','ss','sas@gmail.com','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'as','as',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'manisha','Singh','manishas@gmail.com','qwerty','5188888888',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Mothers\' Name?','gajodhar','109, benson street',NULL,'Finance','Master of Science','Data Science','4-5 years','qwerty','New York','Female',NULL),(11,'Sam','Singh','sam@gmail.com','123456','5182588351',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mother\'s name','asha','United States',NULL,'Marketing','PhD','Marketing','3-4 years','','Los Angeles','Female',NULL),(12,'Padmavathi','ghdag','dhkahd','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pagal','pagala',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'C:\\\\Users\\\\Saurabh Singh\\\\workspace\\\\.metadata\\\\.plugins\\\\org.eclipse.wst.server.core\\\\tmp1\\\\wtpwebapps\\\\withub\\\\profilePic\\\\2016-09-29.png'),(13,'iyer','iyer','r@gmail.com','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'gagag','agagg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'C:\\\\Users\\\\Saurabh Singh\\\\workspace\\\\.metadata\\\\.plugins\\\\org.eclipse.wst.server.core\\\\tmp1\\\\wtpwebapps\\\\withub\\\\profilePic\\\\2016-09-29.png'),(14,'ss','mui','a@gmail.com','123456','12345678',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'as','as','wteryuio',NULL,'Data Science','PhD','Telecommunication','1-2 year','90-100 thousand','Las Vegas',NULL,'C:\\\\Users\\\\Saurabh Singh\\\\workspace\\\\.metadata\\\\.plugins\\\\org.eclipse.wst.server.core\\\\tmp1\\\\wtpwebapps\\\\withub\\\\profilePic\\\\2016-11-07.png'),(15,'asha','Singh','as@gmail.com','123456','11111111111',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'as','as','KNVN\';KN',NULL,'Business Analyst','Bachelor of Science','Data Science','1-2 year','Above 100 thousand','New York',NULL,'C:\\\\Users\\\\Saurabh Singh\\\\workspace\\\\.metadata\\\\.plugins\\\\org.eclipse.wst.server.core\\\\tmp1\\\\wtpwebapps\\\\withub\\\\profilePic\\\\2016-09-29.png'),(16,'Andy','Simon','ans@gmail.com','12356','1234567890',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ask','answer','Boston',NULL,'Information Technology','PhD','Business Analyst','1-2 year','50-60 thousand','Washington DC',NULL,'C:\\\\Users\\\\Saurabh Singh\\\\workspace\\\\.metadata\\\\.plugins\\\\org.eclipse.wst.server.core\\\\tmp1\\\\wtpwebapps\\\\withub\\\\profilePic\\\\a.jpg'),(17,'Meny','thor','mt@gmail.com','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ask','answer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'C:\\\\Users\\\\Saurabh Singh\\\\workspace\\\\.metadata\\\\.plugins\\\\org.eclipse.wst.server.core\\\\tmp1\\\\wtpwebapps\\\\withub\\\\profilePic\\\\b.jpg'),(18,'','','c / /','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),(19,'Ashaa','Singh','aasa@gmail.com','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'asd?','asd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'C:\\\\Users\\\\Saurabh Singh\\\\workspace\\\\.metadata\\\\.plugins\\\\org.eclipse.wst.server.core\\\\tmp1\\\\wtpwebapps\\\\withub\\\\profilePic\\\\a.jpg');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-09 17:41:04
