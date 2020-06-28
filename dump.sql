-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ligths
-- ------------------------------------------------------
-- Server version	10.4.13-MariaDB-1:10.4.13+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ampoules`
--

DROP TABLE IF EXISTS `ampoules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ampoules` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `marque` varchar(20) NOT NULL,
  `puissance` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ampoules`
--

LOCK TABLES `ampoules` WRITE;
/*!40000 ALTER TABLE `ampoules` DISABLE KEYS */;
INSERT INTO `ampoules` VALUES (1,'Philips','15W'),(2,'Sylvania','20W'),(3,'Osram','25W'),(4,'GE-Lighting','20W');
/*!40000 ALTER TABLE `ampoules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appartments`
--

DROP TABLE IF EXISTS `appartments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appartments` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `etage` varchar(2) NOT NULL,
  `position` varchar(10) NOT NULL,
  `changement` date NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appartments`
--

LOCK TABLES `appartments` WRITE;
/*!40000 ALTER TABLE `appartments` DISABLE KEYS */;
INSERT INTO `appartments` VALUES (1,'0','gauche','2020-03-03'),(2,'0','droite','2019-12-02'),(3,'1','gauche','2020-03-21'),(4,'1','droite','2020-06-03'),(5,'2','fond','2019-07-07'),(6,'2','gauche','2020-06-05'),(7,'3','gauche','2020-06-21'),(8,'3','droite','2020-03-09'),(9,'3','fond','2020-06-01'),(10,'4','droite','2020-02-06'),(11,'4','gauche','2020-04-06'),(12,'4','fond','2019-10-10');
/*!40000 ALTER TABLE `appartments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proprietaires`
--

DROP TABLE IF EXISTS `proprietaires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proprietaires` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `appartment_id` int(9) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `proprietaires_ibfk_1` FOREIGN KEY (`appartment_id`) REFERENCES `appartments` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proprietaires`
--

LOCK TABLES `proprietaires` WRITE;
/*!40000 ALTER TABLE `proprietaires` DISABLE KEYS */;
INSERT INTO `proprietaires` VALUES (3,'Tesla','Nikolas',1),(4,'Einstein','Albert',2),(5,'de Lavoisier','Antoine',3),(6,'Pascal','Blaise',4),(7,'Mendeleiev','Dimitri',5),(8,'Schrodinger','Erwin',6),(9,'Galilée','Galiléo',9),(10,'Newton','Isaac',8);
/*!40000 ALTER TABLE `proprietaires` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-26  8:57:00
