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
-- Table structure for table `chatdetails`
--

DROP TABLE IF EXISTS `chatdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chatdetails` (
  `Chat_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Role` varchar(20) DEFAULT NULL,
  `Comment_Box` varchar(255) DEFAULT NULL,
  `Current_Date_Time` varchar(100) DEFAULT NULL,
  `MID` int(11) DEFAULT NULL,
  `Recipient` int(11) DEFAULT NULL,
  PRIMARY KEY (`Chat_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatdetails`
--

LOCK TABLES `chatdetails` WRITE;
/*!40000 ALTER TABLE `chatdetails` DISABLE KEYS */;
INSERT INTO `chatdetails` VALUES (1,'mentee','hello','11-15-2016 14:26:32',14,13),(2,'mentor','Hi.. How are u..','11-15-2016 14:27:39',13,14),(3,'mentee','hello','11-15-2016 14:27:46',14,13),(4,'mentor','Hi.. How are u..','11-15-2016 14:28:00',13,14),(5,'mentor','f;j;','11-15-2016 14:34:20',13,14),(6,'mentor','f;j;','11-15-2016 14:34:23',13,14),(7,'mentee','hey..!','11-15-2016 14:46:00',14,13),(8,'mentee','kjhfkhg','11-17-2016 12:08:12',14,13),(9,'mentee','hello\r\n','11-17-2016 12:21:11',14,15),(10,'mentor','erret','11-17-2016 12:24:00',15,14),(11,'mentor','erret','11-17-2016 12:24:04',15,14),(12,'mentee','Hi!!','11-17-2016 12:43:37',14,15),(13,'mentee','Project works','11-17-2016 12:44:10',14,15),(14,'mentor','yaah','11-17-2016 12:45:05',15,14),(15,'mentor','good\r\n','11-17-2016 12:45:10',15,14),(16,'mentee','Hello Andy','11-17-2016 14:17:16',14,16),(17,'mentor','Hi.. How are you','11-17-2016 14:18:28',16,14),(18,'mentee','','12-06-2016 11:04:33',14,17),(19,'mentee','Hello I am intrested in Robotics','12-06-2016 11:04:55',14,17),(20,'mentee','Hello','12-06-2016 13:52:16',14,19);
/*!40000 ALTER TABLE `chatdetails` ENABLE KEYS */;
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
