#
# TABLE STRUCTURE FOR: students
#

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `city` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `postcode` int(11) NOT NULL,
  `date_of_birth` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (1, 'Ailn', 'Rathmouth', 'Rathmouth', '05144461974', 'Female', 'mailn0@bravesites.com', '97228 Emmalee Harbors Suite 421 South Emmet, TX 54950', 23031, '2001-12-16');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (2, 'Hounson', 'Port Lolamouth', 'Port Lolamouth', '1-136-366-9496', 'Female', 'dhounson1@slashdot.org', '62654 Hirthe Lodge Port Zeldafurt, DE 87270', 27108, '1977-01-21');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (3, 'Tison', 'Lavernastad', 'Lavernastad', '157-283-0337x872', 'Female', 'ctison2@europa.eu', '9107 Blanda Plains Apt. 476 North Burdettechester, NM 91601', 76631, '1984-03-26');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (4, 'Surmeyers', 'Ethelville', 'Ethelville', '552.496.5910', 'Male', 'msurmeyers3@nytimes.com', '0997 Gleason Rue Apt. 149 East Gretaland, GA 13633-6343', 37965, '2005-03-17');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (5, 'Bob', 'Schulistland', 'Schulistland', '895-877-0076x197', 'Male', 'scbob@opensource.org', '39405 Nicolas Walk Apt. 041 Kozeychester, AL 20566-8063', 23031, '2019-07-15');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (6, 'Holdey', 'Kennithside', 'Kennithside', '(055)403-3761', 'Female', 'aholdey5@miibeian.gov.cn', '747 Lucienne Shoal Suite 395 Runolfsdottirberg, NV 65296-7656', 23031, '1971-05-10');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (7, 'Blewmen', 'Oberbrunnerchester', 'Oberbrunnerchester', '(598)918-4548x480', 'Male', 'rblewmen6@github.com', '34720 Randi Roads Apt. 947 Kossmouth, WV 43552-7336', 24772, '2011-03-26');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (8, 'Vanacci', 'Marcoport', 'Marcoport', '013-440-6362', 'Female', 'gvanacci7@bbb.org', '044 Gaylord Corner Apt. 486 Larsonchester, MA 59370', 16, '1973-05-17');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (9, 'Marflitt', 'New Adalineton', 'New Adalineton', '1-113-016-8153x30326', 'Male', 'dmarflitt8@istockphoto.com', '1670 Bogisich Lane Apt. 874 Port Malvina, CT 60714', 89650, '2009-03-23');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (10, 'Pietesch', 'East Kayla', 'East Kayla', '(177)500-7249', 'Female', 'gpietesch9@forbes.com', '651 Mallory Centers Hoppefort, PA 46020', 45934, '2002-01-06');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (11, 'Henrique', 'Kevinmouth', 'Kevinmouth', '1-241-311-9984', 'Male', 'ghenriquea@eventbrite.com', '31480 Oscar Wells Kassulkeborough, DC 35274-5250', 7820, '2002-10-24');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (12, 'Tynan', 'North Deondreland', 'North Deondreland', '(674)474-7300', 'Male', 'dtynanb@yolasite.com', '2729 Lucienne Roads Apt. 317 Theodorafurt, SD 21614-2447', 32292, '1980-12-21');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (13, 'Pinkard', 'Port Adrianaborough', 'Port Adrianaborough', '02115446108', 'Female', 'jpinkardc@cafepress.com', '73620 Carmela Corners Apt. 609 New Litzy, DE 72732-8030', 55848, '1981-10-08');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (14, 'Haslock', 'South Hunter', 'South Hunter', '09398525252', 'Male', 'ehaslockd@jalbum.net', '65792 Celine Coves Lempibury, MT 60747', 29257, '1985-04-25');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (15, 'Rickell', 'East Breanne', 'East Breanne', '692.772.5134x95174', 'Female', 'mrickelle@wikia.com', '51665 Hermina Islands Apt. 724 East Nasirfort, CT 57320-2649', 49701, '1971-01-10');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (16, 'Bob', 'Port Thoraland', 'Port Thoraland', '1-628-108-7615', 'Male', 'pobob@ycombinator.com', '9256 Price Summit Garrickland, KY 23867', 23031, '2016-02-05');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (17, 'Boxhill', 'West Jedediahville', 'West Jedediahville', '(725)577-0459', 'Male', 'tboxhillg@forbes.com', '557 Leo Alley Suite 273 Considinestad, AL 94813', 80323, '1995-04-30');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (18, 'Leeke', 'Franeckiland', 'Franeckiland', '1-889-468-2992x930', 'Female', 'mleekeh@amazonaws.com', '1080 Orn Brook Heidenreichberg, GA 90248', 39741, '1970-01-03');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (19, 'Whale', 'Lake Clare', 'Lake Clare', '513-793-1124x98433', 'Male', 'wwhalei@creativecommons.org', '605 Rosa Mills Suite 999 West Clarkburgh, MO 74959-5620', 24982, '1978-06-23');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (20, 'Ori', 'Beattyburgh', 'Beattyburgh', '08253021064', 'Male', 'morij@twitpic.com', '6164 Spencer Meadow Apt. 689 Baumbachtown, PA 23843-5497', 7864, '1982-11-15');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (21, 'Tagg', 'Oberbrunnerport', 'Oberbrunnerport', '1-725-956-1107x13861', 'Male', 'mtaggk@1688.com', '572 Cyril Parkways Apt. 479 Murazikchester, KY 73127', 36356, '1993-11-18');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (22, 'Costerd', 'Ricofort', 'Ricofort', '096-776-9198', 'Male', 'fcosterdl@baidu.com', '96564 Cooper Corner Apt. 352 Port Floy, OR 86049', 69978, '2003-07-26');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (23, 'Corrin', 'East Graycefurt', 'East Graycefurt', '(583)403-4746', 'Male', 'tcorrinm@intel.com', '353 Israel Streets Jedediahport, GA 99481', 49614, '1988-02-29');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (24, 'Bunford', 'West Joeport', 'West Joeport', '(245)726-8274x48974', 'Female', 'nbunfordn@joomla.org', '9755 Kshlerin Brooks East Roger, ND 23843-8553', 16353, '1979-11-25');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (25, 'Lumley', 'Oceanestad', 'Oceanestad', '06965723793', 'Female', 'hlumleyo@w3.org', '9877 Kaia Village New D\'angelomouth, KS 82353-9742', 70534, '1985-06-15');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (26, 'Whiles', 'Creolashire', 'Creolashire', '800.294.1751x13357', 'Male', 'pwhilesp@amazon.co.jp', '229 Derrick Village Gayview, OR 63688-9938', 58634, '1990-09-30');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (27, 'Presdee', 'North Ernestinaton', 'North Ernestinaton', '556-111-2276x003', 'Female', 'mpresdeeq@sourceforge.net', '4353 Bayer Lights East Bentonville, GA 61468-6552', 90902, '1985-11-01');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (28, 'Bedberry', 'Jakaylaland', 'Jakaylaland', '1-078-468-7156', 'Female', 'jbedberryr@taobao.com', '51526 Stamm Garden Apt. 560 Hahnview, CA 29074-8976', 10160, '1998-09-04');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (29, 'Danilchev', 'North Esta', 'North Esta', '1-244-938-3948', 'Female', 'sdanilchevs@addtoany.com', '34989 Kuphal Inlet Suite 190 Gutkowskiville, IA 69417', 40221, '1992-10-04');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `city`, `phone`, `gender`, `email`, `address`, `postcode`, `date_of_birth`) VALUES (30, 'Whaplington', 'West Breanabury', 'West Breanabury', '1-045-399-1032x67023', 'Female', 'cwhaplingtont@cloudflare.com', '488 Martine Villages Bernadettetown, AR 39587-0766', 23031, '1998-04-05');

DROP TABLE IF EXISTS `marks`;

CREATE TABLE `marks` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(9) unsigned NOT NULL,
  `mark` int(9) unsigned NOT NULL,
  `subject` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (1, 3,  23,   'Magic Survival');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (2, 4,  56,   'Planetary Geography');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (3, 9,  77,   'Foreign Evolutionary Biology');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (4, 6,  83,   'Intergallactic Relations');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (5, 9,  45,   'Grand Strategy');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (6, 7,  76,   'Foreign History');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (7, 1,  98,   'Alien Dance History');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (8, 7,  87,   'Foreign Social Skills');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (9, 8,  65,   'Alien Social Skills');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (10, 4, 76,  'Magic Music');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (11, 8, 76,  'Alien Genealogy');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (12, 4, 89,  'Magic Rituals');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (13, 1, 69,  'Planetary Ecology');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (14, 7, 79,  'Military Law');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (15, 3, 57,  'Foreign Ethics');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (16, 4, 56,  'Foreign Instrumental Music');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (17, 8, 59,  'Foreign Services');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (18, 4, 91,  'Alien Economics');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (19, 1, 91,  'Alien Ethics');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (20, 9, 23,  'Magic Arts');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (21, 6, 34,  'Alien Social Studies');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (22, 7, 54,  'Foreign Political Sciences');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (23, 8, 56,  'Terraforming');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (24, 4, 76,  'Transmutation');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (25, 1, 98,  'Space Travel');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (26, 5, 76,  'Alien Medicine');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (27, 3, 98,  'Foreign Statistics');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (28, 4, 100, 'Necromancy');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (29, 6, 00,  'Magic Music');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (30, 2, 34,  'Planetary History');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (31, 6, 58,  'Herbalism');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (32, 4, 34,  'Dimensional Manipulation');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (33, 4, 67,  'Nutrition Recognition');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (34, 3, 56,  'Foreign Pathology');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (35, 6, 88,  'Foreign Arts');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (36, 7, 80,  'Alien Bioengineering');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (37, 6, 81,  'Alien Physiology');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (38, 2, 71,  'Mathematics');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (39, 1, 72,  'Foreign Arts');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (40, 3, 84,  'Galactic History');
INSERT INTO `marks` (`id`, `student_id`, `mark`, `subject`) VALUES (41, 31, 84, 'Galactic History');