-- MySQL dump 10.13  Distrib 5.7.26, for Win64 (x86_64)
--
-- Host: localhost    Database: db_rk
-- ------------------------------------------------------
-- Server version	5.7.26

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
-- Table structure for table `tbl_arating`
--

DROP TABLE IF EXISTS `tbl_arating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_arating` (
  `arating_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `arating_name` varchar(125) NOT NULL,
  `arating_desc` text NOT NULL,
  PRIMARY KEY (`arating_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_arating`
--

LOCK TABLES `tbl_arating` WRITE;
/*!40000 ALTER TABLE `tbl_arating` DISABLE KEYS */;
INSERT INTO `tbl_arating` VALUES (1,'G','G 鈥?General Audiences\r\nAll ages admitted. Nothing that would offend parents for viewing by children. '),(2,'PG','PG 鈥?Parental Guidance Suggested\r\nSome material may not be suitable for children. Parents urged to give  	&ldquo;parental guidance&rdquo;. '),(3,'PG-13','PG-13 鈥?Parents Strongly Cautioned\r\nSome material may be inappropriate for children under 13. Parents are urged to be cautious. Some material may be inappropriate for pre-teenagers.'),(4,'R','R 鈥?Restricted\r\nUnder 17 requires accompanying parent or adult guardian. Contains some adult material. Parents are urged to learn more about the film before taking their young children with them. '),(5,'NC-17','NC-17 鈥?Adults Only\r\nNo One 17 and Under Admitted. Clearly adult. Children are not admitted. ');
/*!40000 ALTER TABLE `tbl_arating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_audio_genre`
--

DROP TABLE IF EXISTS `tbl_audio_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_audio_genre` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(25) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_audio_genre`
--

LOCK TABLES `tbl_audio_genre` WRITE;
/*!40000 ALTER TABLE `tbl_audio_genre` DISABLE KEYS */;
INSERT INTO `tbl_audio_genre` VALUES (1,'pop'),(2,'rock'),(3,'jazz'),(4,'blue');
/*!40000 ALTER TABLE `tbl_audio_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cartoon`
--

DROP TABLE IF EXISTS `tbl_cartoon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cartoon` (
  `cartoon_id` int(11) NOT NULL AUTO_INCREMENT,
  `cartoon_cover` varchar(75) NOT NULL,
  `cartoon_title` varchar(125) NOT NULL,
  `cartoon_year` varchar(5) NOT NULL,
  `cartoon_runtime` varchar(25) NOT NULL,
  `cartoon_storyline` text NOT NULL,
  `cartoon_trailer` varchar(75) NOT NULL,
  `rating` varchar(25) NOT NULL,
  `type` varchar(25) NOT NULL,
  `arating_id` int(11) NOT NULL,
  PRIMARY KEY (`cartoon_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cartoon`
--

LOCK TABLES `tbl_cartoon` WRITE;
/*!40000 ALTER TABLE `tbl_cartoon` DISABLE KEYS */;
INSERT INTO `tbl_cartoon` VALUES (1,'bullwinkle.jpg','The Adventures of Rocky and Bullwinkle and Friends','1959 ','4 seasons','The adventures of a moose and flying squirrel in Frostbite Falls, Minn.','The Rocky and Bullwinkle Show.mp4','4.6','tv',1),(2,'phooey.jpg','Hong Kong Phooey','1974','1 season','Penrod Pooch leaps into action as Hong Kong Phooey to fight villains.','phooey.mp4','4.3','tv',2),(3,'totoro.jpg','My Neighbor Totoro','1988','1h 28m','Mei and Satsuki shift to a new house to be closer to their mother who is in the hospital. They soon become friends with Totoro, a giant rabbit-like creature who is a spirit.','totoro.mp4','4.8','film',3),(4,'spirited.jpg','Spirited Away','2001',' 2h 5m','In this animated feature by noted Japanese director Hayao Miyazaki, 10-year-old Chihiro (Rumi Hiiragi) and her parents (Takashi Nait么, Yasuko Sawaguchi) stumble upon a seemingly abandoned amusement park. After her mother and father are turned into giant pigs, Chihiro meets the mysterious Haku (Miyu Irino), who explains that the park is a resort for supernatural beings who need a break from their time spent in the earthly realm, and that she must work there to free herself and her parents.','spirited.mp4','4.8','film',2);
/*!40000 ALTER TABLE `tbl_cartoon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cartoon_genre`
--

DROP TABLE IF EXISTS `tbl_cartoon_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cartoon_genre` (
  `cartoon_genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(30) NOT NULL,
  PRIMARY KEY (`cartoon_genre_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cartoon_genre`
--

LOCK TABLES `tbl_cartoon_genre` WRITE;
/*!40000 ALTER TABLE `tbl_cartoon_genre` DISABLE KEYS */;
INSERT INTO `tbl_cartoon_genre` VALUES (1,'cartoon'),(2,'Puzzle program');
/*!40000 ALTER TABLE `tbl_cartoon_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cartoon_link_genre`
--

DROP TABLE IF EXISTS `tbl_cartoon_link_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cartoon_link_genre` (
  `cartoon_genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `cartoon_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`cartoon_genre_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cartoon_link_genre`
--

LOCK TABLES `tbl_cartoon_link_genre` WRITE;
/*!40000 ALTER TABLE `tbl_cartoon_link_genre` DISABLE KEYS */;
INSERT INTO `tbl_cartoon_link_genre` VALUES (1,1,1),(2,2,1),(3,3,2),(4,4,2);
/*!40000 ALTER TABLE `tbl_cartoon_link_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cartoon_link_time`
--

DROP TABLE IF EXISTS `tbl_cartoon_link_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cartoon_link_time` (
  `cartoon_id` int(11) NOT NULL,
  `time_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cartoon_link_time`
--

LOCK TABLES `tbl_cartoon_link_time` WRITE;
/*!40000 ALTER TABLE `tbl_cartoon_link_time` DISABLE KEYS */;
INSERT INTO `tbl_cartoon_link_time` VALUES (1,1),(2,2),(3,2),(4,3);
/*!40000 ALTER TABLE `tbl_cartoon_link_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_children_music`
--

DROP TABLE IF EXISTS `tbl_children_music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_children_music` (
  `music_id` int(11) NOT NULL AUTO_INCREMENT,
  `music_cover` varchar(75) NOT NULL,
  `music_title` varchar(125) NOT NULL,
  `music_year` varchar(10) NOT NULL,
  `music_artist` varchar(75) NOT NULL,
  `music_audio` varchar(30) NOT NULL,
  `rating` varchar(20) NOT NULL,
  PRIMARY KEY (`music_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_children_music`
--

LOCK TABLES `tbl_children_music` WRITE;
/*!40000 ALTER TABLE `tbl_children_music` DISABLE KEYS */;
INSERT INTO `tbl_children_music` VALUES (1,'Shark.jpg','Baby Shark','2019','CoComelon Nursery Rhymes & Kids Songs','Shark.mp3','4.2');
/*!40000 ALTER TABLE `tbl_children_music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_children_music_time`
--

DROP TABLE IF EXISTS `tbl_children_music_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_children_music_time` (
  `music_id` int(11) NOT NULL,
  `time_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_children_music_time`
--

LOCK TABLES `tbl_children_music_time` WRITE;
/*!40000 ALTER TABLE `tbl_children_music_time` DISABLE KEYS */;
INSERT INTO `tbl_children_music_time` VALUES (1,1);
/*!40000 ALTER TABLE `tbl_children_music_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_comments`
--

DROP TABLE IF EXISTS `tbl_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `times` varchar(25) NOT NULL,
  `movies_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_comments`
--

LOCK TABLES `tbl_comments` WRITE;
/*!40000 ALTER TABLE `tbl_comments` DISABLE KEYS */;
INSERT INTO `tbl_comments` VALUES (1,1,'I love this!','10:15pm',2),(2,2,'Wowww!!!','8:19pm',2),(3,1,'oh!!like it','6:19am',0),(4,1,'tttttttttttttttt','2021-04-17 16:43:32',3),(5,27,'ccccccccccc','2021-04-17 16:44:22',3),(6,27,'qqqqqqqqqqqq','2021-04-17 16:45:39',3),(7,27,'nice movie!!!','2021-04-17 16:46:01',4),(8,28,'i dont think so?!','2021-04-17 16:46:31',4),(9,28,'nice music!!','2021-04-17 16:47:44',1),(10,28,'haha','2021-04-17 16:47:57',1);
/*!40000 ALTER TABLE `tbl_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_genre`
--

DROP TABLE IF EXISTS `tbl_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_genre` (
  `genre_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(125) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_genre`
--

LOCK TABLES `tbl_genre` WRITE;
/*!40000 ALTER TABLE `tbl_genre` DISABLE KEYS */;
INSERT INTO `tbl_genre` VALUES (1,'Action'),(2,'Adventure'),(3,'Comedy'),(4,'Crime'),(5,'Drama'),(6,'Historical'),(7,'Horror'),(8,'Musical'),(9,'Science Fiction'),(10,'War'),(11,'Sci-fi'),(12,'Animation'),(13,'Family'),(14,'Fantasy'),(15,'Romance'),(16,'Teen');
/*!40000 ALTER TABLE `tbl_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_mov_genre`
--

DROP TABLE IF EXISTS `tbl_mov_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_mov_genre` (
  `mov_genre_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `movies_id` mediumint(9) NOT NULL,
  `genre_id` mediumint(9) NOT NULL,
  PRIMARY KEY (`mov_genre_id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mov_genre`
--

LOCK TABLES `tbl_mov_genre` WRITE;
/*!40000 ALTER TABLE `tbl_mov_genre` DISABLE KEYS */;
INSERT INTO `tbl_mov_genre` VALUES (1,1,1),(2,1,2),(3,1,9),(4,2,13),(5,2,14),(6,2,8),(7,3,5),(8,3,6),(9,4,1),(10,4,2),(11,4,5),(12,5,5),(13,5,9),(14,6,2),(15,6,5),(16,7,7),(23,8,14),(22,8,11),(21,9,1),(20,9,2),(24,9,5),(25,10,5),(26,10,15),(27,11,5),(28,11,6),(29,12,15),(30,12,16),(34,13,4),(33,14,5),(35,15,3),(36,16,1),(37,16,2),(38,16,4),(39,17,7),(40,17,9),(41,17,14),(42,18,5),(43,18,15);
/*!40000 ALTER TABLE `tbl_mov_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_mov_times`
--

DROP TABLE IF EXISTS `tbl_mov_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_mov_times` (
  `mov_time_id` int(11) NOT NULL AUTO_INCREMENT,
  `movies_id` int(11) NOT NULL,
  `time_id` int(11) NOT NULL,
  PRIMARY KEY (`mov_time_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mov_times`
--

LOCK TABLES `tbl_mov_times` WRITE;
/*!40000 ALTER TABLE `tbl_mov_times` DISABLE KEYS */;
INSERT INTO `tbl_mov_times` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,2),(8,8,2),(9,9,3),(10,10,4),(11,11,4),(12,12,5),(13,13,1),(14,14,1),(15,15,2),(16,16,3),(17,17,4),(18,18,5);
/*!40000 ALTER TABLE `tbl_mov_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_movies`
--

DROP TABLE IF EXISTS `tbl_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_movies` (
  `movies_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `movies_cover` varchar(75) CHARACTER SET utf8 NOT NULL,
  `movies_title` varchar(125) CHARACTER SET utf8 NOT NULL,
  `movies_year` varchar(5) CHARACTER SET utf8 NOT NULL,
  `movies_runtime` varchar(25) CHARACTER SET utf8 NOT NULL,
  `movies_storyline` text CHARACTER SET utf8 NOT NULL,
  `movies_trailer` varchar(75) CHARACTER SET utf8 NOT NULL,
  `rating` varchar(25) CHARACTER SET utf8 NOT NULL,
  `type` varchar(25) CHARACTER SET utf8 NOT NULL,
  `arating_id` int(11) NOT NULL,
  PRIMARY KEY (`movies_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_movies`
--

LOCK TABLES `tbl_movies` WRITE;
/*!40000 ALTER TABLE `tbl_movies` DISABLE KEYS */;
INSERT INTO `tbl_movies` VALUES (1,'guardians2.jpg','Guardians of the Galaxy Vol. 2','2017','2h 16m','The Guardians must fight to keep their newfound family together as they unravel the mystery of Peter Quill&rsquo;s true parentage.','Guardians2.mp4','4','film',5),(2,'beauty.jpg','Beauty and the Beast','2017','2h 9min','An adaptation of the fairy tale about a monstrous-looking prince and a young woman who fall in love. ','Beauty.mp4','4','film',5),(3,'hacksaw.jpg','Hacksaw Ridge','2016','2h 19m','WWII American Army Medic Desmond T. Doss, who served during the Battle of Okinawa, refuses to kill people, and becomes the first man in American history to receive the Medal of Honor without firing a shot.','Hacksaw.mp4','4','film',4),(4,'revenant.jpg','The Revenant','2015','2h 36m','A frontiersman on a fur trading expedition in the 1820s fights for survival after being mauled by a bear and left for dead by members of his own hunting team.','Revenant.mp4','4.5','film',5),(5,'gravity.jpg','Gravity','2013','1h 31m','Two astronauts work together to survive after an accident which leaves them alone in space.','Gravity.mp4','5','film',4),(6,'pi.jpg','Life of Pi','2012','2h 7m','A young man who survives a disaster at sea is hurtled into an epic journey of adventure and discovery. While cast away, he forms an unexpected connection with another survivor: a fearsome Bengal tiger.','Pi.mp4','4.3','film',5),(7,'shining.jpg','The Shining','1980','2h 26m','Jack and his family move into an isolated hotel with a violent past. Living in isolation, Jack begins to lose his sanity, which affects his family members.','shining.mp4','4.2','film',4),(8,'Star.jpg','Star Wars Vintage: Caravan of Courage: An Ewok Adventure','1984','3h 10m','When a family\'s spacecraft crashes on the forest moon of planet Endor, teenage son Mace (Eric Walker) and his little sister, Cindel (Aubree Miller), find themselves separated from their parents. Soon these lost children encounter the Ewoks, the small and furry warriors who call the moon home. With the help of these adorable yet fearless natives, brother and sister set out on a quest to rescue their parents from the grip of a vicious monster known as the Gorax.','star.mp4','4.3','film',5),(9,'superman.jpg','Superman','1978','3h 8m','Scientist Jor-El rockets his infant son, Kal-El, to safety on Earth. Kal is raised as Clark Kent and develops unusual abilities and powers to become Superman who fights for truth and justice.','superman.mp4','4.6','film',4),(10,'lolita.jpg','Lolita','1962','2h 33m','With a screenplay penned by the author himself, Stanley Kubrick brings Vladimir Nabokov\'s controversial tale of forbidden love to the screen. Humbert Humbert (James Mason) is a European professor who relocates to an American suburb, renting a room from lonely widow Charlotte Haze (Shelley Winters). Humbert marries Charlotte, but only to nurture his obsession with her comely teenage daughter, Lolita (Sue Lyon). After Charlotte\'s sudden death, Humbert has Lolita all to himself -- or does he?','lolita.jpg','4.5','film',5),(11,'Cleopatra.jpg','Cleopatra','1963','5h 20m','Cleopatra, the queen of Egypt, becomes the mistress of Julius Ceaser of Rome in order to save her kingdom. However, when Ceaser is assassinated, she becomes Mark Antony\'s ally and lover.','Cleopatra.mp4','4.1','film',4),(12,'gidget.jpg','Gidget','1959','1h 35m','Gidget is a fictional character created by author Frederick Kohner (based on his teenage daughter, Kathy) in his 1957 novel, Gidget, the Little Girl with Big Ideas. The novel follows the adventures of a teenage girl and her surfing friends on the beach in Malibu.','gidget.jpg','3.5','film',5),(13,'witness.jpg','Silent Witness','1996','23 seasons','A team of exceptional forensic pathologists and scientists investigate heinous crimes and use their skills to catch the people responsible.','witness.mp4','4.6','tv',4),(14,'life.jpg','My So-Called Life','1994','1 season','\"My So-Called Life\" is a bastion of teen angst. Angela is a high schooler in constant turmoil over her exposure to boys, friends, drugs, sex ... basically the normal 1990s teen trappings. Many a plot revolves around Angela\'s crush on heartthrob Jordan Catalano.','life.mp4','4.1','tv',5),(15,'pains.jpg','Growing Pains','1985',' 7 seasons','The \"Father Knows Best\" of the 1980s, Dr. Jason Seaver is a psychiatrist who has moved his practice into his Long Island, N.Y., home so that his wife, Maggie, can resume her career. Their children are girl-crazy Mike, brainiac Carol and cute little Ben (later, precocious Chrissie was born). This series, however, tackles issues that \"Father Knows Best\" wouldn\'t have: drugs, suicide, peer pressure, alcohol. But the Seavers pull through problems with a sense of humor and usually emerge stronger than before.','pains.mp4','4.3','tv',4),(16,'protectors.jpg','The Protectors','1972','2 seasons','The Protectors are a secret society who protect the innocent and apprehend the guilty.','protectors.mp4','3.2','tv',5),(17,'twilight.jpg','The Twilight Zone','1960','5 seasons','A comprehensive collection of mystical tales where people try to solve their problems using their own unique ideas.','twilight.mp4','4.5','tv',4),(18,'guiding.jpg','Guiding Light','1952','5 seasons','The fictional Midwest town of Springfield provides the backdrop for this continuing rich tale. The Bauer, Spaulding, Lewis, Cooper and Santos families form the backbone of the community as Springfield\'s residents face life and love amid the greatest of challenges.','guiding.mp4','3.2','tv',5);
/*!40000 ALTER TABLE `tbl_movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_music`
--

DROP TABLE IF EXISTS `tbl_music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_music` (
  `music_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `music_cover` varchar(75) CHARACTER SET utf8 NOT NULL,
  `music_title` varchar(125) CHARACTER SET utf8 NOT NULL,
  `music_year` varchar(10) CHARACTER SET utf8 NOT NULL,
  `music_artist` varchar(30) CHARACTER SET utf8 NOT NULL,
  `music_audio` varchar(75) CHARACTER SET utf8 NOT NULL,
  `rating` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`music_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_music`
--

LOCK TABLES `tbl_music` WRITE;
/*!40000 ALTER TABLE `tbl_music` DISABLE KEYS */;
INSERT INTO `tbl_music` VALUES (1,'green_fields.jpg','Green Fields','1958',' Brothers Four','Greenfields.mp3','4.5'),(2,'feel_fine.jpg',' I Feel Fine','1964','The Beatles',' I Feel Fine.mp3','4.3'),(3,'yesterday_once_more.jpg','Yesterday Once More','1973','The Carpenters','Yesterday Once More.mp3','4.7'),(4,'eye_of_the_tiger.jpg','Eye Of The Tiger','1982','Survivor','Eye Of The Tiger.mp3','3'),(5,'my_heart_will_go_on.jpg','My Heart Will Go On','1997','C茅line Dion','My Heart Will Go On.mp3','5'),(6,'sowhat.jpg','So What','1959','Miles Davis','So What.mp3','4.1');
/*!40000 ALTER TABLE `tbl_music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_music_link_genre`
--

DROP TABLE IF EXISTS `tbl_music_link_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_music_link_genre` (
  `music_genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `music_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`music_genre_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_music_link_genre`
--

LOCK TABLES `tbl_music_link_genre` WRITE;
/*!40000 ALTER TABLE `tbl_music_link_genre` DISABLE KEYS */;
INSERT INTO `tbl_music_link_genre` VALUES (1,1,4),(2,2,1),(3,3,1),(4,4,2),(5,5,1),(6,6,3);
/*!40000 ALTER TABLE `tbl_music_link_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_music_link_time`
--

DROP TABLE IF EXISTS `tbl_music_link_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_music_link_time` (
  `music_id` int(11) NOT NULL,
  `time_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_music_link_time`
--

LOCK TABLES `tbl_music_link_time` WRITE;
/*!40000 ALTER TABLE `tbl_music_link_time` DISABLE KEYS */;
INSERT INTO `tbl_music_link_time` VALUES (1,1),(2,1),(3,2),(4,3),(5,4),(6,5);
/*!40000 ALTER TABLE `tbl_music_link_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_times`
--

DROP TABLE IF EXISTS `tbl_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_times` (
  `time_id` int(11) NOT NULL AUTO_INCREMENT,
  `time_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`time_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_times`
--

LOCK TABLES `tbl_times` WRITE;
/*!40000 ALTER TABLE `tbl_times` DISABLE KEYS */;
INSERT INTO `tbl_times` VALUES (1,'90\'s'),(2,'80\'s'),(3,'70\'s'),(4,'60\'s'),(5,'50\'s');
/*!40000 ALTER TABLE `tbl_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(250) NOT NULL,
  `user_pass` varchar(250) NOT NULL,
  `user_email` varchar(250) NOT NULL,
  `user_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_ip` varchar(50) NOT NULL DEFAULT 'no',
  `user_admin` tinyint(4) DEFAULT NULL,
  `user_access` tinyint(4) DEFAULT NULL,
  `user_type` varchar(50) NOT NULL,
  `avatar` varchar(50) NOT NULL,
  `main_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'user12','12345','t@t.com','2019-02-01 19:07:35','::1',1,5,'1','rhinoceros',NULL),(2,'234444','12345','t@t.com','2021-04-17 04:35:23','no',NULL,NULL,'0','crocodile',1),(26,'zzzzz123','12345','t@t.com','2021-04-17 04:49:06','no',NULL,NULL,'1','puguin',1),(27,'test6','12345','t@t.com','2021-04-17 04:50:55','no',NULL,NULL,'2','bird',1),(28,'00789','12345','t@t.com','2021-04-17 04:57:42','no',NULL,NULL,'2','rhinoceros',1),(29,'cc1111','12345','t@t.com','2021-04-17 05:13:58','no',NULL,NULL,'2','rhinoceros',1);
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-17 17:05:51
