-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.30-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema digital_wallet_logs
--

CREATE DATABASE IF NOT EXISTS digital_wallet_logs;
USE digital_wallet_logs;

--
-- Definition of table `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user_type` int(11) DEFAULT NULL,
  `from_user_acc_no` varchar(45) DEFAULT NULL,
  `to_user_type` int(11) DEFAULT NULL,
  `to_user_acc_no` varchar(45) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `transaction_amount` decimal(10,2) DEFAULT NULL,
  `transaction_type` int(11) DEFAULT NULL,
  `success_status` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` (`id`,`from_user_type`,`from_user_acc_no`,`to_user_type`,`to_user_acc_no`,`date_time`,`transaction_amount`,`transaction_type`,`success_status`) VALUES 
 (1,1,'1234543',2,'56432fg3','2020-10-06 17:02:01','1000.00',2,'success'),
 (2,4,'87654hgf',3,'56432fdc','2020-10-06 17:02:01','350.00',2,'success'),
 (3,3,'73643',2,'dugyfu7','2020-10-07 14:09:58','9999.00',9,'pending'),
 (4,3,'20001',2,'10001','2020-10-07 14:12:03','299.00',9,'pending');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
