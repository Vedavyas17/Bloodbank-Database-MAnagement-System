DROP DATABASE IF EXISTS `PLASMABANK`;
CREATE SCHEMA `PLASMABANK`;
USE `PLASMABANK`;


DROP TABLE IF EXISTS `BLOOD`;
CREATE TABLE `BLOOD` (
  `plasma_bag_number` int(11) NOT NULL,
  `blood_type` varchar(10) DEFAULT NULL,
  `blood_amount` varchar(10) DEFAULT NULL,
  `platelets_count` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`plasma_bag_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOCK TABLES `BLOOD` WRITE;
INSERT INTO `BLOOD` VALUES (1,'A+','23',2.20);
UNLOCK TABLES;

DROP TABLE IF EXISTS `BLOOD_COST`;
CREATE TABLE `BLOOD_COST` (
  `plasma_bag_number` int(11) NOT NULL,
  `cost` int(11) DEFAULT NULL,
  PRIMARY KEY (`plasma_bag_number`),
  CONSTRAINT `BLOOD_COST_ibfk_1` FOREIGN KEY (`plasma_bag_number`) REFERENCES `BLOOD` (`plasma_bag_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOCK TABLES `BLOOD_COST` WRITE;
INSERT INTO `BLOOD_COST` VALUES (1,50);
UNLOCK TABLES;

DROP TABLE IF EXISTS `COMPANION`;
CREATE TABLE `COMPANION` (
  `donor_id` int(11) DEFAULT NULL,
  `companion_name` varchar(10) DEFAULT NULL,
  `relationship` varchar(10) DEFAULT NULL,
  KEY `donor_id` (`donor_id`),
  CONSTRAINT `COMPANION_ibfk_1` FOREIGN KEY (`donor_id`) REFERENCES `DONORS` (`donor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOCK TABLES `COMPANION` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `DONORS`;
CREATE TABLE `DONORS` (
  `donor_id` int(11) NOT NULL,
  `date_of_donation` date NOT NULL,
  PRIMARY KEY (`donor_id`,`date_of_donation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOCK TABLES `DONORS` WRITE;
INSERT INTO `DONORS` VALUES (1,'1999-11-11');
UNLOCK TABLES;

DROP TABLE IF EXISTS `DONOR_INFO`;
CREATE TABLE `DONOR_INFO` (
  `donor_id` int(11) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lName` varchar(30) DEFAULT NULL,
  `blood_type` varchar(30) DEFAULT NULL,
  `phone_no` varchar(11) DEFAULT NULL,
  `dOB` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `address` char(30) DEFAULT NULL,
  PRIMARY KEY (`donor_id`),
  CONSTRAINT `DONOR_INFO_ibfk_1` FOREIGN KEY (`donor_id`) REFERENCES `DONORS` (`donor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOCK TABLES `DONOR_INFO` WRITE;
INSERT INTO `DONOR_INFO` VALUES (1,'Prateek','Patel','A+',1234321345,'1980-12-05',12,'M','Q01 Sarojini Nagar');
UNLOCK TABLES;

DROP TABLE IF EXISTS `PAYMENT_TRANSACTION`;
CREATE TABLE `PAYMENT_TRANSACTION` (
  `rec_id` int(11) DEFAULT NULL,
  `payment_amt` int(11) DEFAULT NULL,
  `payment_time` varchar(40) DEFAULT NULL,
  KEY `rec_id` (`rec_id`),
  CONSTRAINT `PAYMENT_TRANSACTION_ibfk_1` FOREIGN KEY (`rec_id`) REFERENCES `RECIPIENT` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOCK TABLES `PAYMENT_TRANSACTION` WRITE;
INSERT INTO `PAYMENT_TRANSACTION` VALUES (2,100,'06/10/2020 18:19:53');
UNLOCK TABLES;

DROP TABLE IF EXISTS `RECIEVES`;
CREATE TABLE `RECIEVES` (
  `emp_id` int(11) DEFAULT NULL,
  `rec_id` int(11) DEFAULT NULL,
  KEY `rec_id` (`rec_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `RECIEVES_ibfk_1` FOREIGN KEY (`rec_id`) REFERENCES `RECIPIENT` (`rec_id`),
  CONSTRAINT `RECIEVES_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `STAFF` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOCK TABLES `RECIEVES` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `RECIPIENT`;
CREATE TABLE `RECIPIENT` (
  `rec_id` int(11) NOT NULL,
  `blood_type` varchar(10) DEFAULT NULL,
  `quantity_needed` int(11) DEFAULT NULL,
  `date_of_request` date DEFAULT NULL,
  `fname` varchar(10) DEFAULT NULL,
  `lname` varchar(10) DEFAULT NULL,
  `dOB` date DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `address` char(30) DEFAULT NULL,
  PRIMARY KEY (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOCK TABLES `RECIPIENT` WRITE;
INSERT INTO `RECIPIENT` VALUES (1,'A+',23,'1999-10-10','Veeral','Agarwal','1998-10-10','M',23,'C102, Raj Vihar, Mumbai');
UNLOCK TABLES;

DROP TABLE IF EXISTS `REGISTERS`;
CREATE TABLE `REGISTERS` (
  `donor_id` int(11) DEFAULT NULL,
  `rec_id` int(11) DEFAULT NULL,
  KEY `rec_id` (`rec_id`),
  KEY `donor_id` (`donor_id`),
  CONSTRAINT `REGISTERS_ibfk_1` FOREIGN KEY (`rec_id`) REFERENCES `RECIPIENT` (`rec_id`),
  CONSTRAINT `REGISTERS_ibfk_2` FOREIGN KEY (`donor_id`) REFERENCES `DONORS` (`donor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOCK TABLES `REGISTERS` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `STAFF`;
CREATE TABLE `STAFF` (
  `emp_id` int(11) NOT NULL,
  `fname` varchar(10) DEFAULT NULL,
  `supervisor` varchar(20) DEFAULT NULL,
  `address1` varchar(10) DEFAULT NULL,
  `phone_no` int(11) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOCK TABLES `STAFF` WRITE;
INSERT INTO `STAFF` VALUES (1,'Def Gef','Sandy','23 A','1234567890',23411);
UNLOCK TABLES;