DROP DATABASE IF EXISTS `sql_vaccine`;
CREATE DATABASE `sql_vaccine`; 
USE `sql_vaccine`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;



CREATE TABLE `Clinic` (
  `ClinicID` int(11) NOT NULL,
  `ClinicName` varchar(50) NOT NULL,
  `ClinicDistrict` varchar(50) NOT NULL,
  `ClinicRoad` varchar(50) NOT NULL,
  `ClinicBidgNo` varchar(50) NOT NULL,
  `ClinicTel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ClinicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `Clinic` VALUES (1,'HKU Shenzhen Hospital','Futian','Haiyuan 1st Road','Number 1','+86-755-8691-3333');
INSERT INTO `Clinic` VALUES (2,'PKU Shenzhen Hospital','Futian','Lianhua Road','Number 1120','+86-755-8392-3333');
INSERT INTO `Clinic` VALUES (3,"Shenzhen People's Hospital",'Luohu','Dongmen North Road','Number 1017','+86-755-2553-3018');
INSERT INTO `Clinic` VALUES (4,"Shenzhen Second People's Hospital",'Futian','Sungang West Road','Number 3002','+86-755-8336-6388');
INSERT INTO `Clinic` VALUES (5,'Shenzhen Hang Seng Hospital of SMU','Baoan','Syracuse Road','Number 315','+86-755-252-7305');
INSERT INTO `Clinic` VALUES (6,'Union Shenzhen Hospital of HUST','Nanshan','Garden Road','Number 415','+86-715-252-7305');
INSERT INTO `Clinic` VALUES (7,'Shenzhen Hospital of GUCM','Futian','Beihuan Avenue','Number 515','+86-755-8354-8611');



CREATE TABLE `Product` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(50) NOT NULL,
  `ProductPrice` decimal(9,2) NOT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `Product` VALUES (1,'AZD1222','74.55');
INSERT INTO `Product` VALUES (2,'mRNA-1273','122.45');
INSERT INTO `Product` VALUES (3,'JNJ-78436735','64.55');
INSERT INTO `Product` VALUES (4,'BNT162b2','87.45');
INSERT INTO `Product` VALUES (5,'NVX-CoV2373','134.55');
INSERT INTO `Product` VALUES (6,'Sputnik V','123.45');
INSERT INTO `Product` VALUES (7,'CoronaVac','67.55');
INSERT INTO `Product` VALUES (8,'GSK','55.45');



CREATE TABLE `Application` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerName` varchar(50) NOT NULL,
  `CustomerGender` varchar(6) NOT NULL,
  `CustomerDOB` date NOT NULL,
  `CustomerTel` varchar(50) NOT NULL,
  `CustomerOrg` varchar(50) NOT NULL,
  `CustomerDistrict` varchar(50) NOT NULL,
  `CustomerRoad` varchar(50) NOT NULL,
  `CustomerBldgNo` varchar(50) NOT NULL,
  `ApplyDate` date NOT NULL,
  `AppointmentTime` date NOT NULL,
  `ClinicID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `fk_ClinicID_idx` (`ClinicID`),
  KEY `fk_ProductID_idx` (`ProductID`),
  CONSTRAINT `fk_Application_ClientID` FOREIGN KEY (`ClinicID`) REFERENCES `Clinic` (`ClinicID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Application_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `Application` VALUES(1,'Babara','Female','1986-03-28','781-932-9754','Hospital','Futian','Garden Road','266','2020-02-12','2020-02-22',1,2);
INSERT INTO `Application` VALUES(2,'Ines','Male','1986-04-13','804-427-9456','Government','Futian','Lillian Crossing','1031','2020-06-12','2020-06-22',4,6);
INSERT INTO `Application` VALUES(3,'Freddi','Female','1985-02-07','719-724-7869','Company','Nanshan','Mosinee Center','255','2020-04-02','2020-04-22',7,4);
INSERT INTO `Application` VALUES(4,'Ambur','Male','1974-04-14','407-231-8017','Government','Nanshan','Ohio Trail','3101','2020-06-12','2020-06-22',7,8);
INSERT INTO `Application` VALUES(5,'Clemmie','Female','1973-11-07','406-231-8217','Hospital','Futian','Lawn Avenue','2','2020-04-12','2020-04-22',6,1);
INSERT INTO `Application` VALUES(6,'Elka','Male','1991-09-04','781-932-9754','Company','Baoan','Spohn Circle','1','2020-08-12','2020-08-22',3,6);
INSERT INTO `Application` VALUES(7,'Ilene','Female','1964-08-30','312-480-8498','Hospital','Baoan','Arapahoe Terrace','233','2020-09-12','2020-09-22',2,5);



CREATE TABLE `Provider` (
  `EmployeeID` int(11) NOT NULL,
  `EmployeeName` varchar(50) NOT NULL,
  `EmployeeGender` varchar(50) NOT NULL,
  `EmployeeTittle` varchar(50) NOT NULL,
  `EmployeeTel` varchar(50) NOT NULL,
  `ClinicID` int(11) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `fk_ClinicID` (`ClinicID`),
  CONSTRAINT `fk_ClientID` FOREIGN KEY (`ClinicID`) REFERENCES `Clinic` (`ClinicID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `Provider` VALUES (1,'Brushfield','Female','Executive Secretary','804-427-9456',1);
INSERT INTO `Provider` VALUES (2,'MacCaffrey','Male','Executive Secretary','781-932-9754',2);
INSERT INTO `Provider` VALUES (3,'Boagey','Female','Statistician III','719-724-7869',4);
INSERT INTO `Provider` VALUES (4,'Roseburgh','Male','Assistant Professor','407-231-8017',3);
INSERT INTO `Provider` VALUES (5,'Betchley','Female','Social Worker','312-480-8498',6);
INSERT INTO `Provider` VALUES (6,'Twiddell','Male','Financial Advisor','615-641-4759',6);
INSERT INTO `Provider` VALUES (7,'Naseby','Female','Computer Systems Analyst IV','559-181-3744',7);



CREATE TABLE `Supplier` (
  `SupplierID` int(11) NOT NULL,
  `SupplierName` varchar(50) NOT NULL,
  `SupplierCountry` varchar(50) NOT NULL,
  `SupplierTel` varchar(50) NOT NULL,
  `StockQty` int(11) NOT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `Supplier` VALUES (1,'Kexing','China','804-427-9456',12336);
INSERT INTO `Supplier` VALUES (2,'WuhanShengwu','China','312-480-8498',32455);
INSERT INTO `Supplier` VALUES (3,'Kexing','China','615-641-4759',36745);
INSERT INTO `Supplier` VALUES (4,'WuhanShengwu','China','941-527-3977',34335);
INSERT INTO `Supplier` VALUES (5,'KangXiNuo','China','804-427-9456',23325);
INSERT INTO `Supplier` VALUES (6,'Kexing','China','559-181-3744',34515);
INSERT INTO `Supplier` VALUES (7,'Kexing','China','404-246-3370',30095);



CREATE TABLE `Record` (
  `ApplyNo` int(11) NOT NULL,
  `RecordDate` date NOT NULL,
  `RecordTime` TIME NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `IfAdvReact` char(3) NOT NULL,
  PRIMARY KEY (`ApplyNo`),
  KEY `fk_ApplyNo` (`ApplyNo`),
  KEY `fk_EmployeeID` (`EmployeeID`),
  CONSTRAINT `fk_ApplyNo` FOREIGN KEY (`ApplyNo`) REFERENCES `Record` (`ApplyNo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `Provider` (`EmployeeID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `Record` VALUES (1,'2020-2-14','17:15:00',2,'No');
INSERT INTO `Record` VALUES (2,'2020-2-14','20:25:36',3,'No');
INSERT INTO `Record` VALUES (3,'2020-2-14','22:25:35',6,'No');
INSERT INTO `Record` VALUES (4,'2020-2-14','11:34:15',6,'No');
INSERT INTO `Record` VALUES (5,'2020-2-14','09:08:13',4,'No');
INSERT INTO `Record` VALUES (6,'2020-2-14','23:10:45',5,'No');
INSERT INTO `Record` VALUES (7,'2020-2-14','12:00:00',6,'No');



CREATE TABLE `Shipment` (
  `ShippingID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `SupplierID` int(11) NOT NULL,
  `DeliveryDate` date NOT NULL,
  `ReceivingDate` date NOT NULL,
  `ShippingQty` int(11) NOT NULL,
  `ShippingOrg` varchar(50) NOT NULL,
  PRIMARY KEY (`ShippingID`),
  KEY `fk_ProductID` (`ProductID`),
  KEY `fk_SupplierID` (`SupplierID`),
  CONSTRAINT `fk_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_SupplierID` FOREIGN KEY (`SupplierID`) REFERENCES `Supplier` (`SupplierID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `Shipment` VALUES (1,1,1,'2020-01-06','2021-02-22',2332,'SF');
INSERT INTO `Shipment` VALUES (2,6,2,'2020-01-08','2021-02-22',4222,'YT');
INSERT INTO `Shipment` VALUES (3,3,2,'2020-01-12','2021-02-22',2452,'EMS');
INSERT INTO `Shipment` VALUES (4,2,1,'2020-01-14','2021-02-22',4452,'JD');
INSERT INTO `Shipment` VALUES (5,3,5,'2020-01-16','2021-02-22',2562,'YT');
INSERT INTO `Shipment` VALUES (6,1,1,'2020-02-18','2021-02-22',2352,'EMS');
INSERT INTO `Shipment` VALUES (7,1,1,'2020-02-19','2021-02-22',2453,'SF');




