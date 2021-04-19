-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 19, 2021 at 10:09 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_rk`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_arating`
--

DROP TABLE IF EXISTS `tbl_arating`;
CREATE TABLE IF NOT EXISTS `tbl_arating` (
  `arating_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `arating_name` varchar(125) NOT NULL,
  `arating_desc` text NOT NULL,
  PRIMARY KEY (`arating_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_arating`
--

INSERT INTO `tbl_arating` (`arating_id`, `arating_name`, `arating_desc`) VALUES
(1, 'G', 'G – General Audiences\r\nAll ages admitted. Nothing that would offend parents for viewing by children. '),
(2, 'PG', 'PG – Parental Guidance Suggested\r\nSome material may not be suitable for children. Parents urged to give  	&ldquo;parental guidance&rdquo;. '),
(3, 'PG-13', 'PG-13 – Parents Strongly Cautioned\r\nSome material may be inappropriate for children under 13. Parents are urged to be cautious. Some material may be inappropriate for pre-teenagers.'),
(4, 'R', 'R – Restricted\r\nUnder 17 requires accompanying parent or adult guardian. Contains some adult material. Parents are urged to learn more about the film before taking their young children with them. '),
(5, 'NC-17', 'NC-17 – Adults Only\r\nNo One 17 and Under Admitted. Clearly adult. Children are not admitted. ');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_audio_genre`
--

DROP TABLE IF EXISTS `tbl_audio_genre`;
CREATE TABLE IF NOT EXISTS `tbl_audio_genre` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(25) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_audio_genre`
--

INSERT INTO `tbl_audio_genre` (`genre_id`, `genre_name`) VALUES
(1, 'pop'),
(2, 'rock'),
(3, 'jazz'),
(4, 'blue');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cartoon`
--

DROP TABLE IF EXISTS `tbl_cartoon`;
CREATE TABLE IF NOT EXISTS `tbl_cartoon` (
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cartoon`
--

INSERT INTO `tbl_cartoon` (`cartoon_id`, `cartoon_cover`, `cartoon_title`, `cartoon_year`, `cartoon_runtime`, `cartoon_storyline`, `cartoon_trailer`, `rating`, `type`, `arating_id`) VALUES
(1, 'bullwinkle.jpg', 'The Adventures of Rocky and Bullwinkle and Friends', '1959 ', '4 seasons', 'The adventures of a moose and flying squirrel in Frostbite Falls, Minn.', 'The Rocky and Bullwinkle Show.mp4', '4.6', 'tv', 2),
(2, 'phooey.jpg', 'Hong Kong Phooey', '1974', '1 season', 'Penrod Pooch leaps into action as Hong Kong Phooey to fight villains.', 'phooey.mp4', '4.3', 'tv', 1),
(3, 'totoro.jpg', 'My Neighbor Totoro', '1988', '1h 28m', 'Mei and Satsuki shift to a new house to be closer to their mother who is in the hospital. They soon become friends with Totoro, a giant rabbit-like creature who is a spirit.', 'totoro.mp4', '4.8', 'film', 1),
(4, 'spirited.jpg', 'Spirited Away', '1999', ' 2h 5m', 'In this animated feature by noted Japanese director Hayao Miyazaki, 10-year-old Chihiro (Rumi Hiiragi) and her parents (Takashi Naitô, Yasuko Sawaguchi) stumble upon a seemingly abandoned amusement park. After her mother and father are turned into giant pigs, Chihiro meets the mysterious Haku (Miyu Irino), who explains that the park is a resort for supernatural beings who need a break from their time spent in the earthly realm, and that she must work there to free herself and her parents.', 'spirited.mp4', '4.8', 'film', 1),
(5, '101.jpg', '101 Dalmatians', '1961', '1h 19m', 'Cruella de Vil, an evil heiress, wants to make a fur coat for herself out of the skins of a hundred and one Dalmatian puppies. She makes an effort to kidnap them by hiring a group of thugs.', '101.mp4', '4.8', 'film', 1),
(6, 'mermaid.jpg', 'The Little Mermaid', '1979', '1h 25m', 'Ursula, the sea witch, makes a devious deal with Princess Ariel allowing her to meet Eric, the human prince she loves. Unaware of her true intentions, Ariel lands herself in trouble.', 'mermaid.mp4', '4.4', 'film', 1),
(7, 'peter.jpg', 'Peter Pan', '1953', '1h 17m', 'Peter Pan and his friend Tinker Bell, a fairy, whisk away siblings Wendy, John and Michael to the island of Never Land, where Captain Hook seeks vengeance against Peter for cutting off his hand.', 'peter.mp4', '4.4', 'film', 1),
(8, 'gorilla.jpg', 'The Magilla Gorilla Show', '1964', '2 seasons', '\"Magilla Gorilla\" tells the story of the title gorilla who is for sale in a pet shop run by Melvin Peebles. Eager to get rid of the animal, Peebles typically marks down his price and eventually sells him. But the buyers inevitably return Magilla, forcing Peebles to refund their money and leaving Magilla to be purchased again in the next episode. Other segments of short cartoons on the program feature characters including hillbilly cat-and-mouse pair Punkin\' Puss and Mushmouse as well as Hoop N\' Holler sheriff Ricochet Rabbit and his deputy, Droop-a-Long Coyote.', 'gorilla.mp4', '4.3', 'tv', 1),
(9, 'thundarr.jpg', 'Thundarr the Barbarian', '1980', '2 seasons', 'An escaped slave battles the forces of evil.', 'thundarr.mp4', '3.75', 'tv', 2),
(10, 'girls.jpg', 'The Powerpuff Girls', '1998', '6 seasons', 'Blossom, Bubbles and Buttercup have many adventures while protecting the world from mad scientists, bank robbers and aliens with the help of their special powers.', 'girls.mp4', '4.7', 'tv', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cartoon_genre`
--

DROP TABLE IF EXISTS `tbl_cartoon_genre`;
CREATE TABLE IF NOT EXISTS `tbl_cartoon_genre` (
  `cartoon_genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(30) NOT NULL,
  PRIMARY KEY (`cartoon_genre_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cartoon_genre`
--

INSERT INTO `tbl_cartoon_genre` (`cartoon_genre_id`, `genre_name`) VALUES
(1, 'cartoon'),
(2, 'Puzzle program');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cartoon_link_genre`
--

DROP TABLE IF EXISTS `tbl_cartoon_link_genre`;
CREATE TABLE IF NOT EXISTS `tbl_cartoon_link_genre` (
  `cartoon_genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `cartoon_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`cartoon_genre_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cartoon_link_genre`
--

INSERT INTO `tbl_cartoon_link_genre` (`cartoon_genre_id`, `cartoon_id`, `genre_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cartoon_link_time`
--

DROP TABLE IF EXISTS `tbl_cartoon_link_time`;
CREATE TABLE IF NOT EXISTS `tbl_cartoon_link_time` (
  `cartoon_id` int(11) NOT NULL,
  `time_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cartoon_link_time`
--

INSERT INTO `tbl_cartoon_link_time` (`cartoon_id`, `time_id`) VALUES
(1, 5),
(2, 3),
(3, 2),
(4, 1),
(5, 4),
(6, 3),
(7, 5),
(8, 4),
(9, 2),
(10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_children_music`
--

DROP TABLE IF EXISTS `tbl_children_music`;
CREATE TABLE IF NOT EXISTS `tbl_children_music` (
  `music_id` int(11) NOT NULL AUTO_INCREMENT,
  `music_cover` varchar(75) NOT NULL,
  `music_title` varchar(125) NOT NULL,
  `music_year` varchar(10) NOT NULL,
  `music_artist` varchar(75) NOT NULL,
  `music_audio` varchar(30) NOT NULL,
  `rating` varchar(20) NOT NULL,
  PRIMARY KEY (`music_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_children_music`
--

INSERT INTO `tbl_children_music` (`music_id`, `music_cover`, `music_title`, `music_year`, `music_artist`, `music_audio`, `rating`) VALUES
(1, 'Shark.jpg', 'Baby Shark', '1999', 'CoComelon Nursery Rhymes & Kids Songs', 'Shark.mp3', '4.2'),
(2, 'wheelsonthebus.jpg', 'Wheels On The Bus', '1989', 'Black Lace', 'bus.mp3', '4.9'),
(3, 'duckie.jpg', 'Ernie and his Rubber Duckie', '1970', 'Sesame Street', 'duckie.mp3', '3.2'),
(4, 'lucy.jpg', 'Linus And Lucy', '1964', 'Vince Guaraldi Trio', 'lucy.mp3', '3.5'),
(5, 'runner.jpg', 'Road Runner Show TV Theme Original Opening', '1950', 'Barbara Cameron', 'runner.mp3', '4');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_children_music_time`
--

DROP TABLE IF EXISTS `tbl_children_music_time`;
CREATE TABLE IF NOT EXISTS `tbl_children_music_time` (
  `music_id` int(11) NOT NULL,
  `time_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_children_music_time`
--

INSERT INTO `tbl_children_music_time` (`music_id`, `time_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comments`
--

DROP TABLE IF EXISTS `tbl_comments`;
CREATE TABLE IF NOT EXISTS `tbl_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `times` varchar(25) NOT NULL,
  `movies_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_comments`
--

INSERT INTO `tbl_comments` (`id`, `user_id`, `comment`, `times`, `movies_id`) VALUES
(1, 1, 'I love this!', '2021-04-17 16:43:32', 2),
(2, 2, 'Wowww!!!', '2021-04-17 16:44:22', 3),
(3, 1, 'oh!!like it', '2021-04-17 16:47:44', 1),
(4, 2, 'wow', '2021-04-17 14:56:08', 1),
(5, 2, 'aaa', '2021-04-17 15:04:26', 1),
(6, 2, 'so funny', '2021-04-17 17:45:10', 5),
(7, 2, 'my fav', '2021-04-17 18:20:25', 4),
(8, 1, 'ohhhh', '2021-04-17 18:27:57', 14),
(9, 2, 'like this song', '2021-04-17 18:31:18', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_genre`
--

DROP TABLE IF EXISTS `tbl_genre`;
CREATE TABLE IF NOT EXISTS `tbl_genre` (
  `genre_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(125) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_genre`
--

INSERT INTO `tbl_genre` (`genre_id`, `genre_name`) VALUES
(1, 'Action'),
(2, 'Adventure'),
(3, 'Comedy'),
(4, 'Crime'),
(5, 'Drama'),
(6, 'Historical'),
(7, 'Horror'),
(8, 'Musical'),
(9, 'Science Fiction'),
(10, 'War'),
(11, 'Sci-fi'),
(12, 'Animation'),
(13, 'Family'),
(14, 'Fantasy'),
(15, 'Romance'),
(16, 'Teen');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_movies`
--

DROP TABLE IF EXISTS `tbl_movies`;
CREATE TABLE IF NOT EXISTS `tbl_movies` (
  `movies_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
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

--
-- Dumping data for table `tbl_movies`
--

INSERT INTO `tbl_movies` (`movies_id`, `movies_cover`, `movies_title`, `movies_year`, `movies_runtime`, `movies_storyline`, `movies_trailer`, `rating`, `type`, `arating_id`) VALUES
(1, 'guardians2.jpg', 'Guardians of the Galaxy Vol. 2', '2017', '2h 16m', 'The Guardians must fight to keep their newfound family together as they unravel the mystery of Peter Quill&rsquo;s true parentage.', 'Guardians2.mp4', '4', 'film', 4),
(2, 'beauty.jpg', 'Beauty and the Beast', '2017', '2h 9min', 'An adaptation of the fairy tale about a monstrous-looking prince and a young woman who fall in love. ', 'Beauty.mp4', '4', 'film', 4),
(3, 'hacksaw.jpg', 'Hacksaw Ridge', '2016', '2h 19m', 'WWII American Army Medic Desmond T. Doss, who served during the Battle of Okinawa, refuses to kill people, and becomes the first man in American history to receive the Medal of Honor without firing a shot.', 'Hacksaw.mp4', '4', 'film', 5),
(4, 'revenant.jpg', 'The Revenant', '2015', '2h 36m', 'A frontiersman on a fur trading expedition in the 1820s fights for survival after being mauled by a bear and left for dead by members of his own hunting team.', 'Revenant.mp4', '4.5', 'film', 4),
(5, 'gravity.jpg', 'Gravity', '2013', '1h 31m', 'Two astronauts work together to survive after an accident which leaves them alone in space.', 'Gravity.mp4', '5', 'film', 3),
(6, 'pi.jpg', 'Life of Pi', '2012', '2h 7m', 'A young man who survives a disaster at sea is hurtled into an epic journey of adventure and discovery. While cast away, he forms an unexpected connection with another survivor: a fearsome Bengal tiger.', 'Pi.mp4', '4.3', 'film', 3),
(7, 'shining.jpg', 'The Shining', '1980', '2h 26m', 'Jack and his family move into an isolated hotel with a violent past. Living in isolation, Jack begins to lose his sanity, which affects his family members.', 'shining.mp4', '4.2', 'film', 5),
(8, 'Star.jpg', 'Star Wars Vintage: Caravan of Courage: An Ewok Adventure', '1984', '3h 10m', 'When a family\'s spacecraft crashes on the forest moon of planet Endor, teenage son Mace (Eric Walker) and his little sister, Cindel (Aubree Miller), find themselves separated from their parents. Soon these lost children encounter the Ewoks, the small and furry warriors who call the moon home. With the help of these adorable yet fearless natives, brother and sister set out on a quest to rescue their parents from the grip of a vicious monster known as the Gorax.', 'star.mp4', '4.3', 'film', 4),
(9, 'superman.jpg', 'Superman', '1978', '3h 8m', 'Scientist Jor-El rockets his infant son, Kal-El, to safety on Earth. Kal is raised as Clark Kent and develops unusual abilities and powers to become Superman who fights for truth and justice.', 'superman.mp4', '4.6', 'film', 2),
(10, 'lolita.jpg', 'Lolita', '1962', '2h 33m', 'With a screenplay penned by the author himself, Stanley Kubrick brings Vladimir Nabokov\'s controversial tale of forbidden love to the screen. Humbert Humbert (James Mason) is a European professor who relocates to an American suburb, renting a room from lonely widow Charlotte Haze (Shelley Winters). Humbert marries Charlotte, but only to nurture his obsession with her comely teenage daughter, Lolita (Sue Lyon). After Charlotte\'s sudden death, Humbert has Lolita all to himself -- or does he?', 'lolita.jpg', '4.5', 'film', 5),
(11, 'Cleopatra.jpg', 'Cleopatra', '1963', '5h 20m', 'Cleopatra, the queen of Egypt, becomes the mistress of Julius Ceaser of Rome in order to save her kingdom. However, when Ceaser is assassinated, she becomes Mark Antony\'s ally and lover.', 'Cleopatra.mp4', '4.1', 'film', 5),
(12, 'gidget.jpg', 'Gidget', '1959', '1h 35m', 'Gidget is a fictional character created by author Frederick Kohner (based on his teenage daughter, Kathy) in his 1957 novel, Gidget, the Little Girl with Big Ideas. The novel follows the adventures of a teenage girl and her surfing friends on the beach in Malibu.', 'gidget.jpg', '3.5', 'film', 4),
(13, 'witness.jpg', 'Silent Witness', '1996', '23 seasons', 'A team of exceptional forensic pathologists and scientists investigate heinous crimes and use their skills to catch the people responsible.', 'witness.mp4', '4.6', 'tv', 4),
(14, 'life.jpg', 'My So-Called Life', '1994', '1 season', '\"My So-Called Life\" is a bastion of teen angst. Angela is a high schooler in constant turmoil over her exposure to boys, friends, drugs, sex ... basically the normal 1990s teen trappings. Many a plot revolves around Angela\'s crush on heartthrob Jordan Catalano.', 'life.mp4', '4.1', 'tv', 3),
(15, 'pains.jpg', 'Growing Pains', '1985', ' 7 seasons', 'The \"Father Knows Best\" of the 1980s, Dr. Jason Seaver is a psychiatrist who has moved his practice into his Long Island, N.Y., home so that his wife, Maggie, can resume her career. Their children are girl-crazy Mike, brainiac Carol and cute little Ben (later, precocious Chrissie was born). This series, however, tackles issues that \"Father Knows Best\" wouldn\'t have: drugs, suicide, peer pressure, alcohol. But the Seavers pull through problems with a sense of humor and usually emerge stronger than before.', 'pains.mp4', '4.3', 'tv', 5),
(16, 'protectors.jpg', 'The Protectors', '1972', '2 seasons', 'The Protectors are a secret society who protect the innocent and apprehend the guilty.', 'protectors.mp4', '3.2', 'tv', 4),
(17, 'twilight.jpg', 'The Twilight Zone', '1960', '5 seasons', 'A comprehensive collection of mystical tales where people try to solve their problems using their own unique ideas.', 'twilight.mp4', '4.5', 'tv', 3),
(18, 'guiding.jpg', 'Guiding Light', '1952', '5 seasons', 'The fictional Midwest town of Springfield provides the backdrop for this continuing rich tale. The Bauer, Spaulding, Lewis, Cooper and Santos families form the backbone of the community as Springfield\'s residents face life and love amid the greatest of challenges.', 'guiding.mp4', '3.2', 'tv', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mov_genre`
--

DROP TABLE IF EXISTS `tbl_mov_genre`;
CREATE TABLE IF NOT EXISTS `tbl_mov_genre` (
  `mov_genre_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `movies_id` mediumint(9) NOT NULL,
  `genre_id` mediumint(9) NOT NULL,
  PRIMARY KEY (`mov_genre_id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_mov_genre`
--

INSERT INTO `tbl_mov_genre` (`mov_genre_id`, `movies_id`, `genre_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 9),
(4, 2, 13),
(5, 2, 14),
(6, 2, 8),
(7, 3, 5),
(8, 3, 6),
(9, 4, 1),
(10, 4, 2),
(11, 4, 5),
(12, 5, 5),
(13, 5, 9),
(14, 6, 2),
(15, 6, 5),
(16, 7, 7),
(23, 8, 14),
(22, 8, 11),
(21, 9, 1),
(20, 9, 2),
(24, 9, 5),
(25, 10, 5),
(26, 10, 15),
(27, 11, 5),
(28, 11, 6),
(29, 12, 15),
(30, 12, 16),
(34, 13, 4),
(33, 14, 5),
(35, 15, 3),
(36, 16, 1),
(37, 16, 2),
(38, 16, 4),
(39, 17, 7),
(40, 17, 9),
(41, 17, 14),
(42, 18, 5),
(43, 18, 15);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mov_times`
--

DROP TABLE IF EXISTS `tbl_mov_times`;
CREATE TABLE IF NOT EXISTS `tbl_mov_times` (
  `mov_time_id` int(11) NOT NULL AUTO_INCREMENT,
  `movies_id` int(11) NOT NULL,
  `time_id` int(11) NOT NULL,
  PRIMARY KEY (`mov_time_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_mov_times`
--

INSERT INTO `tbl_mov_times` (`mov_time_id`, `movies_id`, `time_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 2),
(8, 8, 2),
(9, 9, 3),
(10, 10, 4),
(11, 11, 4),
(12, 12, 5),
(13, 13, 1),
(14, 14, 1),
(15, 15, 2),
(16, 16, 3),
(17, 17, 4),
(18, 18, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_music`
--

DROP TABLE IF EXISTS `tbl_music`;
CREATE TABLE IF NOT EXISTS `tbl_music` (
  `music_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `music_cover` varchar(75) CHARACTER SET utf8 NOT NULL,
  `music_title` varchar(125) CHARACTER SET utf8 NOT NULL,
  `music_year` varchar(10) CHARACTER SET utf8 NOT NULL,
  `music_artist` varchar(30) CHARACTER SET utf8 NOT NULL,
  `music_audio` varchar(75) CHARACTER SET utf8 NOT NULL,
  `rating` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`music_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_music`
--

INSERT INTO `tbl_music` (`music_id`, `music_cover`, `music_title`, `music_year`, `music_artist`, `music_audio`, `rating`) VALUES
(1, 'green_fields.jpg', 'Green Fields', '1958', ' Brothers Four', 'Greenfields.mp3', '4.5'),
(2, 'feel_fine.jpg', ' I Feel Fine', '1964', 'The Beatles', ' I Feel Fine.mp3', '4.3'),
(3, 'yesterday_once_more.jpg', 'Yesterday Once More', '1973', 'The Carpenters', 'Yesterday Once More.mp3', '4.7'),
(4, 'eye_of_the_tiger.jpg', 'Eye Of The Tiger', '1982', 'Survivor', 'Eye Of The Tiger.mp3', '3'),
(5, 'my_heart_will_go_on.jpg', 'My Heart Will Go On', '1997', 'Céline Dion', 'My Heart Will Go On.mp3', '5'),
(6, 'sowhat.jpg', 'So What', '1959', 'Miles Davis', 'So What.mp3', '4.1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_music_link_genre`
--

DROP TABLE IF EXISTS `tbl_music_link_genre`;
CREATE TABLE IF NOT EXISTS `tbl_music_link_genre` (
  `music_genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `music_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`music_genre_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_music_link_genre`
--

INSERT INTO `tbl_music_link_genre` (`music_genre_id`, `music_id`, `genre_id`) VALUES
(1, 1, 4),
(2, 2, 1),
(3, 3, 1),
(4, 4, 2),
(5, 5, 1),
(6, 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_music_link_time`
--

DROP TABLE IF EXISTS `tbl_music_link_time`;
CREATE TABLE IF NOT EXISTS `tbl_music_link_time` (
  `music_id` int(11) NOT NULL,
  `time_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_music_link_time`
--

INSERT INTO `tbl_music_link_time` (`music_id`, `time_id`) VALUES
(1, 5),
(2, 4),
(3, 3),
(4, 2),
(5, 1),
(6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_times`
--

DROP TABLE IF EXISTS `tbl_times`;
CREATE TABLE IF NOT EXISTS `tbl_times` (
  `time_id` int(11) NOT NULL AUTO_INCREMENT,
  `time_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`time_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_times`
--

INSERT INTO `tbl_times` (`time_id`, `time_name`) VALUES
(1, '90\'s'),
(2, '80\'s'),
(3, '70\'s'),
(4, '60\'s'),
(5, '50\'s');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `user_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `user_pass`, `user_email`, `user_date`, `user_ip`, `user_admin`, `user_access`, `user_type`, `avatar`, `main_user_id`) VALUES
(1, 'user12', '12345', 't@t.com', '2019-02-01 19:07:35', '::1', 1, 5, '1', 'rhinoceros', NULL),
(2, '234444', '12345', 't@t.com', '2021-04-17 11:35:23', 'no', NULL, NULL, '0', 'crocodile', 1),
(3, 'zzzzz123', '12345', 't@t.com', '2021-04-17 11:49:06', 'no', NULL, NULL, '1', 'puguin', 1),
(4, 'test6', '12345', 't@t.com', '2021-04-17 11:50:55', 'no', NULL, NULL, '2', 'bird', 1),
(5, 'xindi', '12345', 't@t.com', '2021-04-18 00:32:42', 'no', NULL, NULL, '2', 'puguin', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
