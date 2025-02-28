-- CREATE DATABASE `chris_citibike` /*!40100 DEFAULT CHARACTER SET latin1 */;
use chris_citibike;

CREATE TABLE `user` (
  `bikeid` int(11) NOT NULL,
  `usertype` varchar(45) DEFAULT NULL,
  `birth_year` year(4) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=46201 DEFAULT CHARSET=latin1;

CREATE TABLE `station` (
      `station_id` int(11) NOT NULL,
      `name` varchar(45) NOT NULL,
      `latitude` decimal(20,10) NOT NULL,
      `longitude` decimal(20,10) NOT NULL,
      PRIMARY KEY (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Trip` (
      `idTrip` int(10) unsigned NOT NULL,
      `the_geom` varchar(45) DEFAULT NULL,
      `tripduration` int(11) DEFAULT NULL,
      `starttime` datetime DEFAULT NULL,
      `stoptime` datetime DEFAULT NULL,
      `start_station` int(11) DEFAULT NULL,
      `end_station` int(11) DEFAULT NULL,
      PRIMARY KEY (`idTrip`),
      UNIQUE KEY `idTrip_UNIQUE` (`idTrip`),
      KEY `start_station_id_idx` (`start_station`),
      KEY `end_station_id_idx` (`end_station`),
      CONSTRAINT `end_station_id` FOREIGN KEY (`end_station`) REFERENCES `station` (`station_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
      CONSTRAINT `start_station_id` FOREIGN KEY (`start_station`) REFERENCES `station` (`station_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- For data cleaning --
CREATE TABLE `cleaned_station` (
  `station_id` int(11) NOT NULL,
  `name` varchar(90) NOT NULL,
  `latitude` decimal(20,10) DEFAULT '0.0000000000',
  `longitude` decimal(20,10) DEFAULT '0.0000000000',
  `cleaned_station_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cleaned_station_id`),
  UNIQUE KEY `station_id_UNIQUE` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `raw_data` (
  `cartodb_id` int(11) NOT NULL,
  `the_geom` varchar(45) DEFAULT NULL,
  `tripduration` int(11) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `stoptime` datetime DEFAULT NULL,
  `start_station_id` int(11) NOT NULL,
  `start_station_name` varchar(45) DEFAULT NULL,
  `start_station_latitude` decimal(20,10) DEFAULT NULL,
  `start_station_longitude` decimal(20,10) DEFAULT NULL,
  `end_station_id` int(11) DEFAULT NULL,
  `end_station_name` varchar(45) DEFAULT NULL,
  `end_station_latitude` decimal(20,10) DEFAULT NULL,
  `end_station_longitude` decimal(20,10) DEFAULT NULL,
  `bikeid` int(11) NOT NULL,
  `usertype` varchar(45) DEFAULT NULL,
  `birth_year` year(4) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
