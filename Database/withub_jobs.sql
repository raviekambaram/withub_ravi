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
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `jobID` int(10) NOT NULL AUTO_INCREMENT,
  `jname` varchar(50) NOT NULL,
  `jdesc` varchar(500) NOT NULL,
  `application_count` varchar(50) DEFAULT NULL,
  `employer` varchar(100) NOT NULL,
  `job_requirement` varchar(1000) DEFAULT NULL,
  `deadline` varchar(1000) DEFAULT NULL,
  `job_location` varchar(1000) DEFAULT NULL,
  `contact_details` varchar(1000) DEFAULT NULL,
  `detailed_job_description` varchar(1000) DEFAULT NULL,
  `empID` varchar(10) DEFAULT NULL,
  `applicantID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`jobID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'Software Developer','Hi this is a software deleoper job','1','QWE','','','','','','3','2|1'),(2,'web Developer','Hi this is a web deleoper job','1','ASD','','','','','','3','2|18'),(3,'Developer','Hi this is a deleoper job','1','ZXC','','','','','','4',''),(4,'software developer','software jobs','0','QAZ','','','','','','4','4|1|3'),(5,'developer','jobs','0','QAZ','','','','','','4','4|5'),(7,'python developer','Python jobs','0','QAZ','Savings her pleased are several started females met. Short her not among being any. Thing of judge fruit charm views do','','Albany','tc@gmail.com','Now seven world think timed while her. Spoil large oh he rooms on since an. Am up unwilling eagerness perceived incommode. Are not windows set luckily musical hundred can. Collecting if sympathize middletons be of of reasonably. Horrible so kindness at thoughts exercise no weddings subjects. The mrs gay removed towards journey chapter females offered not. Led distrusts otherwise who may newspaper but. Last he dull am none he mile hold as. \n\nDo so written as raising parlors spirits mr elderly. Made late in of high left hold. Carried females of up highest calling. Limits marked led silent dining her she far. Sir but elegance marriage dwelling likewise position old pleasure men. Dissimilar themselves simplicity no of contrasted as. Delay great day hours men. Stuff front to do allow to asked he.','3','18'),(8,'asd','tyhn','','tycvhb','dygjhgb','','trchgvb','ytfhjb','fghbvnb','3','1|3|18'),(9,'hgffj','tyfvbkjbkh','','jnkn','TFGVKJKJB','','jbhbkb','yhnnk','yghbkbj','3','');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
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
