-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: gym
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,'Yoga','Easy',0),(2,'Pilates','Medium',0),(3,'Abs','High',0),(4,'HIIT','High Intensity',0),(5,'Indoor cycling','Medium',0),(6,'Boxing','High Intensity',0),(7,'Zumba','Easy',0),(8,'Zumba(Deleted class)','Deleted class',1);
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `session_id` int NOT NULL,
  `booking_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_sessions_users_idx` (`user_id`),
  KEY `fk_bookings_sessions_idx` (`session_id`),
  CONSTRAINT `fk_bookings_sessions` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bookings_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (147,12,10,'2025-03-09'),(187,10,77,'2025-03-11'),(194,10,3,'2025-03-12'),(195,10,6,'2025-03-12');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Ashgrove','Ashgrove',0),(2,'Brisbane City','Brisbane City....',0),(3,'Chermside','Chermside',0),(4,'Graceville','Graceville.....',0),(5,'Westlake','Westlake.....',0),(6,'Griffith(Deleted)','DeletedLocation',1);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` varchar(45) NOT NULL,
  `content` varchar(400) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_posts_users_idx` (`user_id`),
  CONSTRAINT `fk_posts_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (34,10,'Amazing','The equipment is pretty high.','2025-03-04'),(35,12,'Great environment','I don\'t see myself going here every single day, but definitely, definitely check it out','2025-03-05'),(36,11,'Amazing facility','Amazing facility, top equipment and great environment','2025-03-09'),(37,10,'Good service','Good service with friendly staff','2025-03-10'),(38,13,'For everyone','Super clean and comfortable gym for everyone from beginners to professional athletes','2025-03-10'),(45,10,'Amazing ','The equipment is pretty high. ','2025-03-11');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `activity_id` int NOT NULL,
  `trainer_id` int NOT NULL,
  `location_id` int NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `duration` smallint NOT NULL DEFAULT '30',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_activity_idx` (`activity_id`),
  KEY `fk_sessions_users_idx` (`trainer_id`),
  KEY `fk_sessions_locations_idx` (`location_id`),
  CONSTRAINT `fk_sessions_activities` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sessions_locations` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sessions_users` FOREIGN KEY (`trainer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (3,4,1,4,'2025-03-09','17:00:00',30),(5,6,5,4,'2025-03-11','15:00:00',30),(6,6,4,3,'2025-03-11','15:00:00',90),(8,5,3,5,'2025-03-14','12:00:00',90),(10,4,1,2,'2025-03-15','08:00:00',30),(74,1,1,1,'2025-03-22','09:00:00',40),(77,1,1,1,'2025-03-10','08:30:00',30),(80,4,1,4,'2025-03-20','05:00:00',30),(84,1,3,1,'2025-03-30','22:00:00',30),(87,1,1,1,'2025-03-22','10:00:00',30),(88,5,3,3,'2025-03-12','09:00:00',45),(89,5,44,3,'2025-03-12','08:00:00',45);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(70) NOT NULL,
  `role` enum('admin','member','trainer') NOT NULL,
  `deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_UNIQUE` (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Layla','Liam','t@t.com','$2b$10$3uzH2/S70rh/y3zXX6YMi.nBmfNPQXchJAqIR29bVeFnwRDKXul4S','trainer',0),(2,'Mick','Dean','t1@t.com','$2b$10$6nawNJC4XTRuRNFDga4jgewPeNRSQdj1xQzYA6fchax/0In9wVeoW','trainer',0),(3,'Mia','Ryan','mia@t.com','$2b$10$VT0dWpxsOrQfEU59qJzJCuFfn5DUifWAwetHoolIgauo6Si1dMYM2','trainer',0),(4,'Judy','Omar','judy@t.com','$2b$10$ArOvXZDj7VRdqKx0sO8ag.8gCOrESrJnGCKyJcIsY6qgATAtWS3IC','trainer',0),(5,'Jess','Alex','jess@t.com','$2b$10$iY29PoKIO1zhpDmkTyPOoeHYsnBxbckXG3Jm55yoD6xUZ8Oa9jZn2','trainer',0),(6,'Gemma','Andy','a@a.com','$2b$10$DfxZsrZODtTpRfHZrEyfD.Q/ii/St5H19jPqWt.qkrrtAi6uqxoaO','admin',0),(7,'Gina','Ali','a1@a.com','$2b$10$rNRlg0jONbbP6inhWVo09etvZg9WaXDxHhUOil0pBmgy2WjjjNGzy','admin',0),(8,'Jade','James','jade@a.com','$2b$10$AoAoQnwUP2DrQCKI3fV7T.pjYXgSlq.4rtdHWNQdBBpICWMbw3Eti','admin',0),(10,'Jess','John','m@m.com','$2b$10$bpnOlOgTwvUccbR98M1BSOyybxXvI.zJuTxZfU9iDn0uOf3Xen5Zu','member',0),(11,'John','Matt','John@m.com','$2b$10$rgbRGbSoBydmz9OSA7Qbqu0rX4SWXTCyadVshaOjcXFa9.kciA5Fa','member',0),(12,'Lily ','Omar','m1@m.com','$2b$10$gq6yDIQv20apubJ07aRm9.mktoiOxiDYA.WzvF9.X1.omHl0jSbuK','member',0),(13,'Bryn','Alan','Bryn@m.com','$2b$10$H9hYV6VSquUU2lTrV9QfXu3He4LgNlSjB448YCF56M/5qG8VgfDvC','member',0),(14,'Emma','Andy','ema@m.com','$2b$10$oQzL63k9Jys8k5gV1.Lcw.OlizxIa0Z5v3il4NCf6gKvblZ3VAnua','member',0),(15,'Jack','Jack','jack@m.com','$2b$10$m6/cVsqX7Wwt61x4pbrVOud9U0WNL0gpxEfwgFquQ.FaCXyrFc8VO','member',0),(37,'Emma','Jason','em@em.com','$2b$10$fmMzUFNaTyFKfLpxt7UBiu8FV6KyVZhgf.UO4CdWPMx3kPRPACzwO','admin',1),(44,'Test','Test','test@t.com','$2b$10$SBB/VyThqSor.MdvU0VyL.DHAwK60vo3L2hEjDGogYI32F7eyKMc2','trainer',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-12 23:24:55
