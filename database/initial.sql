create database questioner;
grant all privileges on questioner.* to 'qmso'@'localhost';
use questioner;
CREATE TABLE `student` (
	  `id` bigint(20) NOT NULL AUTO_INCREMENT,
	  `dateOfBirth` datetime NOT NULL,
	  `emailAddress` varchar(255) NOT NULL,
	  `firstName` varchar(255) NOT NULL,
	  `lastName` varchar(255) NOT NULL,
	  `password` varchar(8) NOT NULL,
	  `userName` varchar(20) NOT NULL,
	  PRIMARY KEY (`id`)
	) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;