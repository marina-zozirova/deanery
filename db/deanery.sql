-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: deanery
-- ------------------------------------------------------
-- Server version	8.0.30-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `academicPlan`
--

DROP TABLE IF EXISTS `academicPlan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academicPlan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `speciality` varchar(255) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `form` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academicPlan`
--

LOCK TABLES `academicPlan` WRITE;
/*!40000 ALTER TABLE `academicPlan` DISABLE KEYS */;
INSERT INTO `academicPlan` VALUES (1,'Физика',2019,'Природная физика','очная');
/*!40000 ALTER TABLE `academicPlan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date`
--

DROP TABLE IF EXISTS `date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `date` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `idSubject` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idSubject` (`idSubject`),
  CONSTRAINT `date_ibfk_1` FOREIGN KEY (`idSubject`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date`
--

LOCK TABLES `date` WRITE;
/*!40000 ALTER TABLE `date` DISABLE KEYS */;
INSERT INTO `date` VALUES (2,'2022-09-07',1),(3,'2022-09-22',NULL),(4,'2022-09-19',3);
/*!40000 ALTER TABLE `date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departament`
--

DROP TABLE IF EXISTS `departament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departament` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departament`
--

LOCK TABLES `departament` WRITE;
/*!40000 ALTER TABLE `departament` DISABLE KEYS */;
INSERT INTO `departament` VALUES (1,'кафедра математического моделирования'),(2,'кафедра русского языка и литературы'),(3,'кафедра вычислительной математики и кибернетики'),(4,'кафедра экспериментальной физики');
/*!40000 ALTER TABLE `departament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal`
--

DROP TABLE IF EXISTS `journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journal` (
  `idJournal` int DEFAULT NULL,
  `idStudent` int DEFAULT NULL,
  `estimate` int DEFAULT NULL,
  `presence` char(1) DEFAULT NULL,
  KEY `idJournal` (`idJournal`),
  KEY `idStudent` (`idStudent`),
  CONSTRAINT `journal_ibfk_1` FOREIGN KEY (`idJournal`) REFERENCES `date` (`id`),
  CONSTRAINT `journal_ibfk_2` FOREIGN KEY (`idStudent`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal`
--

LOCK TABLES `journal` WRITE;
/*!40000 ALTER TABLE `journal` DISABLE KEYS */;
INSERT INTO `journal` VALUES (2,1,5,'1'),(2,2,NULL,'0'),(3,1,NULL,'0'),(3,3,3,'1'),(4,4,2,'1');
/*!40000 ALTER TABLE `journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movement`
--

DROP TABLE IF EXISTS `movement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `movement` varchar(255) DEFAULT NULL,
  `movementsDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movement`
--

LOCK TABLES `movement` WRITE;
/*!40000 ALTER TABLE `movement` DISABLE KEYS */;
INSERT INTO `movement` VALUES (1,'зачислен','2022-09-01'),(2,'отчислен','2022-06-30'),(3,'переход на следующий курс','2022-06-30'),(4,'уход в академический отпуск','2022-06-30'),(5,'перевод на другую специальность','2022-01-30'),(6,'выпуск','2022-06-10');
/*!40000 ALTER TABLE `movement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `surname` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `patronymic` varchar(255) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `course` int DEFAULT NULL,
  `idMovement` int DEFAULT NULL,
  `idStudentsGroup` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idMovement` (`idMovement`),
  KEY `idStudentsGroup` (`idStudentsGroup`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`idMovement`) REFERENCES `movement` (`id`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`idStudentsGroup`) REFERENCES `studentsGroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Иванов','Василий','Александрович','2002-08-07',4,3,3),(2,'Власов','Николай','Игоревич','2004-04-20',1,1,1),(3,'Вершкова','Анастасия','Игоревна','2003-05-06',2,3,5),(4,'Яковлева','Ирина','Николаевна','2001-09-07',4,5,3);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentsGroup`
--

DROP TABLE IF EXISTS `studentsGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentsGroup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `idAcademicPlan` int DEFAULT NULL,
  `idDepartament` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idAcademicPlan` (`idAcademicPlan`),
  KEY `idDepartament` (`idDepartament`),
  CONSTRAINT `studentsGroup_ibfk_1` FOREIGN KEY (`idAcademicPlan`) REFERENCES `academicPlan` (`id`),
  CONSTRAINT `studentsGroup_ibfk_2` FOREIGN KEY (`idDepartament`) REFERENCES `departament` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentsGroup`
--

LOCK TABLES `studentsGroup` WRITE;
/*!40000 ALTER TABLE `studentsGroup` DISABLE KEYS */;
INSERT INTO `studentsGroup` VALUES (1,'ПМИ-б-о-22-1',NULL,1),(3,'РУС-б-о-19-1',NULL,2),(4,'ФИЗ-б-о-19-1',1,4),(5,'ЛЕЧ-с-о-21-1',NULL,NULL);
/*!40000 ALTER TABLE `studentsGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `hoursPratctise` int DEFAULT NULL,
  `idAcademicPlan` int DEFAULT NULL,
  `hoursLection` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idAcademicPlan` (`idAcademicPlan`),
  CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`idAcademicPlan`) REFERENCES `academicPlan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'Механика',54,1,54),(2,'Математический анализ',108,NULL,54),(3,'Язык драматургических текстов',36,NULL,18);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-26  9:15:13
