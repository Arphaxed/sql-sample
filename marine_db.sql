-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: marinelifedb
-- ------------------------------------------------------
-- Server version	5.5.62

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `conservationstatus`
--

DROP TABLE IF EXISTS `conservationstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conservationstatus` (
  `StatusID` int(11) NOT NULL AUTO_INCREMENT,
  `StatusName` varchar(100) NOT NULL,
  `StatusDescription` text,
  PRIMARY KEY (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conservationstatus`
--

LOCK TABLES `conservationstatus` WRITE;
/*!40000 ALTER TABLE `conservationstatus` DISABLE KEYS */;
INSERT INTO `conservationstatus` VALUES (1,'Endangered','Species that are facing a very high risk of extinction in the wild.'),(2,'Vulnerable','Species that are likely to become endangered unless the circumstances threatening their survival and reproduction improve.'),(3,'Least Concern','Species that are widespread and abundant and have a low risk of extinction.');
/*!40000 ALTER TABLE `conservationstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedingtype`
--

DROP TABLE IF EXISTS `feedingtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedingtype` (
  `FeedingTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `FeedingTypeName` varchar(100) NOT NULL,
  PRIMARY KEY (`FeedingTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedingtype`
--

LOCK TABLES `feedingtype` WRITE;
/*!40000 ALTER TABLE `feedingtype` DISABLE KEYS */;
INSERT INTO `feedingtype` VALUES (1,'Carnivore'),(2,'Herbivore'),(3,'Omnivore'),(4,'Filter Feeder'),(5,'Scavenger');
/*!40000 ALTER TABLE `feedingtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitat`
--

DROP TABLE IF EXISTS `habitat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitat` (
  `HabitatID` int(11) NOT NULL AUTO_INCREMENT,
  `HabitatType` varchar(100) NOT NULL,
  `Description` text,
  PRIMARY KEY (`HabitatID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitat`
--

LOCK TABLES `habitat` WRITE;
/*!40000 ALTER TABLE `habitat` DISABLE KEYS */;
INSERT INTO `habitat` VALUES (1,'Ocean','The vast body of saltwater that covers most of the Earth\'s surface.'),(2,'Coral Reef','An underwater ecosystem characterized by reef-building corals.'),(3,'Deep Sea','The deepest part of the ocean where light doesn’t reach.'),(4,'Coastal Waters','Shallow waters near shore, often with a rich biodiversity.'),(5,'Polar Waters','Cold water regions around the North and South Poles.');
/*!40000 ALTER TABLE `habitat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marineanimal`
--

DROP TABLE IF EXISTS `marineanimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marineanimal` (
  `AnimalID` int(11) NOT NULL AUTO_INCREMENT,
  `CommonName` varchar(255) NOT NULL,
  `SpeciesID` int(11) NOT NULL,
  `HabitatID` int(11) NOT NULL,
  `FeedingTypeID` int(11) NOT NULL,
  `AverageLifespan` int(11) DEFAULT NULL,
  `AverageSize` decimal(10,2) DEFAULT NULL,
  `Weight` decimal(10,2) DEFAULT NULL,
  `ColorPattern` varchar(255) DEFAULT NULL,
  `Migratory` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`AnimalID`),
  KEY `SpeciesID` (`SpeciesID`),
  KEY `HabitatID` (`HabitatID`),
  KEY `FeedingTypeID` (`FeedingTypeID`),
  CONSTRAINT `marineanimal_ibfk_1` FOREIGN KEY (`SpeciesID`) REFERENCES `species` (`SpeciesID`),
  CONSTRAINT `marineanimal_ibfk_2` FOREIGN KEY (`HabitatID`) REFERENCES `habitat` (`HabitatID`),
  CONSTRAINT `marineanimal_ibfk_3` FOREIGN KEY (`FeedingTypeID`) REFERENCES `feedingtype` (`FeedingTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marineanimal`
--

LOCK TABLES `marineanimal` WRITE;
/*!40000 ALTER TABLE `marineanimal` DISABLE KEYS */;
INSERT INTO `marineanimal` VALUES (1,'Blue Whale',1,1,1,80,30.00,120000.00,'Blue with lighter underside',1),(2,'Clownfish',2,2,3,6,0.15,0.02,'Orange with white bands',1),(3,'Great White Shark',3,1,1,70,6.00,1100.00,'Gray with white belly',1),(4,'Leatherback Sea Turtle',4,3,2,50,2.91,700.00,'Dark brown with lighter spots',1),(5,'Common Dolphin',5,4,3,30,2.50,200.00,'Gray with yellowish markings',1);
/*!40000 ALTER TABLE `marineanimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `species` (
  `SpeciesID` int(11) NOT NULL AUTO_INCREMENT,
  `SpeciesName` varchar(255) NOT NULL,
  `ScientificName` varchar(255) DEFAULT NULL,
  `Family` varchar(100) DEFAULT NULL,
  `ConservationStatus` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SpeciesID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `species`
--

LOCK TABLES `species` WRITE;
/*!40000 ALTER TABLE `species` DISABLE KEYS */;
INSERT INTO `species` VALUES (1,'Blue Whale','Balaenoptera musculus','Balaenopteridae','Endangered'),(2,'Clownfish','Amphiprioninae','Pomacentridae','Least Concern'),(3,'Great White Shark','Carcharodon carcharias','Lamnidae','Vulnerable'),(4,'Sea Turtle','Chelonioidea','Cheloniidae','Endangered'),(5,'Dolphin','Delphinidae','Delphinidae','Least Concern');
/*!40000 ALTER TABLE `species` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-21  6:07:41
