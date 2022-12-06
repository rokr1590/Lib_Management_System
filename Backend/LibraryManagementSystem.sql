-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: library_management_system
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Temporary view structure for view `availablebooks`
--

DROP TABLE IF EXISTS `availablebooks`;
/*!50001 DROP VIEW IF EXISTS `availablebooks`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `availablebooks` AS SELECT 
 1 AS `ISBN`,
 1 AS `Title`,
 1 AS `Author`,
 1 AS `Price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `ISBN` int NOT NULL,
  `Title` varchar(20) NOT NULL,
  `Author` varchar(20) NOT NULL,
  `Price` int DEFAULT '0',
  `Quantity` int DEFAULT '0',
  PRIMARY KEY (`ISBN`),
  CONSTRAINT `book_chk_1` CHECK ((`Price` >= 0)),
  CONSTRAINT `book_chk_2` CHECK ((`Quantity` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Operating System','DM Dhamdere',100,6),(2,'Computer Networks','Ivan Marsic',200,8),(3,'NewBook','New Author',50,50),(5,'GG','Om Gogte',12,0),(12345,'The Great Gatsby','F.Scott',100,5);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `borrowedbooks`
--

DROP TABLE IF EXISTS `borrowedbooks`;
/*!50001 DROP VIEW IF EXISTS `borrowedbooks`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `borrowedbooks` AS SELECT 
 1 AS `SID`,
 1 AS `Name`,
 1 AS `Course`,
 1 AS `Branch`,
 1 AS `Email`,
 1 AS `ISBN`,
 1 AS `IssueDate`,
 1 AS `ReturnDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `issue_book`
--

DROP TABLE IF EXISTS `issue_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_book` (
  `ISBN` int DEFAULT NULL,
  `SID` int DEFAULT NULL,
  `IssueDate` date NOT NULL,
  KEY `Fk1` (`ISBN`),
  KEY `Fk2` (`SID`),
  CONSTRAINT `issue_book_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  CONSTRAINT `issue_book_ibfk_2` FOREIGN KEY (`SID`) REFERENCES `student` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_book`
--

LOCK TABLES `issue_book` WRITE;
/*!40000 ALTER TABLE `issue_book` DISABLE KEYS */;
INSERT INTO `issue_book` VALUES (12345,22011194,'2022-12-05');
/*!40000 ALTER TABLE `issue_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `overduebooks`
--

DROP TABLE IF EXISTS `overduebooks`;
/*!50001 DROP VIEW IF EXISTS `overduebooks`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `overduebooks` AS SELECT 
 1 AS `SID`,
 1 AS `Name`,
 1 AS `Course`,
 1 AS `Branch`,
 1 AS `Email`,
 1 AS `ISBN`,
 1 AS `IssueDate`,
 1 AS `ReturnDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record` (
  `SID` int DEFAULT NULL,
  `ISBN` int DEFAULT NULL,
  `IssueDate` date DEFAULT NULL,
  `ReturnDate` date DEFAULT NULL,
  KEY `Fk1` (`SID`),
  KEY `Fk2` (`ISBN`),
  CONSTRAINT `record_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `student` (`SID`),
  CONSTRAINT `record_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES (22011194,1,'2022-12-04','2022-12-04'),(22011194,5,'2022-12-05',NULL),(22011194,12345,'2022-12-05','2022-12-05');
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `return_book`
--

DROP TABLE IF EXISTS `return_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `return_book` (
  `SID` int DEFAULT NULL,
  `ISBN` int DEFAULT NULL,
  `ReturnDate` date NOT NULL,
  KEY `Fk1` (`SID`),
  KEY `Fk2` (`ISBN`),
  CONSTRAINT `return_book_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `student` (`SID`),
  CONSTRAINT `return_book_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return_book`
--

LOCK TABLES `return_book` WRITE;
/*!40000 ALTER TABLE `return_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `return_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `SID` int NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Course` varchar(20) NOT NULL,
  `Branch` varchar(20) NOT NULL,
  `Email` varchar(30) NOT NULL,
  PRIMARY KEY (`SID`),
  CONSTRAINT `student_chk_1` CHECK ((`Email` like _cp850'%@%.%'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (22011194,'Jatin Thakkar','T.Y.B tech','IT','jatin.22011194@viit.ac.in');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `availablebooks`
--

/*!50001 DROP VIEW IF EXISTS `availablebooks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `availablebooks` AS select `b`.`ISBN` AS `ISBN`,`b`.`Title` AS `Title`,`b`.`Author` AS `Author`,`b`.`Price` AS `Price` from `book` `b` where (`b`.`Quantity` > 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `borrowedbooks`
--

/*!50001 DROP VIEW IF EXISTS `borrowedbooks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `borrowedbooks` AS select `s`.`SID` AS `SID`,`s`.`Name` AS `Name`,`s`.`Course` AS `Course`,`s`.`Branch` AS `Branch`,`s`.`Email` AS `Email`,`r`.`ISBN` AS `ISBN`,`r`.`IssueDate` AS `IssueDate`,`r`.`ReturnDate` AS `ReturnDate` from (`record` `r` join `student` `s` on((`r`.`SID` = `s`.`SID`))) where (`r`.`ReturnDate` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `overduebooks`
--

/*!50001 DROP VIEW IF EXISTS `overduebooks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `overduebooks` AS select `s`.`SID` AS `SID`,`s`.`Name` AS `Name`,`s`.`Course` AS `Course`,`s`.`Branch` AS `Branch`,`s`.`Email` AS `Email`,`r`.`ISBN` AS `ISBN`,`r`.`IssueDate` AS `IssueDate`,`r`.`ReturnDate` AS `ReturnDate` from (`record` `r` join `student` `s` on((`r`.`SID` = `s`.`SID`))) where (`r`.`ReturnDate` > (`r`.`IssueDate` + 15)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-06 13:29:20
