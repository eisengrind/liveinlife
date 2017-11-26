
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ACCOUNT_DATA`
-- ----------------------------
DROP TABLE IF EXISTS `ACCOUNT_DATA`;
CREATE TABLE `ACCOUNT_DATA` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STEAM64ID` varchar(32) NOT NULL,
  `THIRST` float(11,2) NOT NULL,
  `HUNGER` float(11,2) NOT NULL,
  `CASH` float(11,2) NOT NULL,
  `ENDURANCE` int(11) NOT NULL,
  `GEAR` text NOT NULL,
  `NPCS` text NOT NULL,
  `TIMELASTUSED` text NOT NULL,
  `TIMELASTSAVED` text NOT NULL,
  `TIMECREATE` text NOT NULL,
  `TIMELASTLOGIN` text NOT NULL,
  `NEW` int(1) NOT NULL,
  `LASTPOSITION` text NOT NULL,
  `GENDER` int(11) NOT NULL,
  `GROUP` int(11) NOT NULL DEFAULT '-1',
  `CHARISMA` int(11) NOT NULL,
  `FIRSTNAME` text NOT NULL,
  `LASTNAME` text NOT NULL,
  `_GRINDS` int(11) NOT NULL,
  `COVERED_DISTANCE` text NOT NULL,
  `STATUS` text NOT NULL,
  `BANNED` int(1) NOT NULL,
  `RESPAWNING` int(1) NOT NULL,
  `VIRTUALINVENTORY` text NOT NULL,
  `PERMISSIONS` text NOT NULL,
  `DEATHTIMEOUT` int(11) NOT NULL,
  `STATUSTIMEOUT` int(11) NOT NULL,
  `prison_waitingTime` int(11) NOT NULL,
  `prison_escapeTime` int(11) NOT NULL,
  `prison_currentPunishment` text NOT NULL,
  `prison_securityIssue` int(11) NOT NULL,
  `prison_psychatricKeeping` int(11) NOT NULL,
  `health` text NOT NULL,
  `paycheck_active` int(1) NOT NULL DEFAULT '0',
  `paycheck_bankID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_2` (`ID`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `BANK_ACCOUNT_DATA`
-- ----------------------------
DROP TABLE IF EXISTS `BANK_ACCOUNT_DATA`;
CREATE TABLE `BANK_ACCOUNT_DATA` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` text,
  `AMOUNT` int(11) DEFAULT NULL,
  `ACCOUNTID` int(11) DEFAULT NULL,
  `STATUS` int(4) DEFAULT NULL,
  `HASH` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `BANK_TRANSACTION_DATA`
-- ----------------------------
DROP TABLE IF EXISTS `BANK_TRANSACTION_DATA`;
CREATE TABLE `BANK_TRANSACTION_DATA` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FROMBANKID` int(11) DEFAULT NULL,
  `TOBANKID` int(11) DEFAULT NULL,
  `VALUE` float(11,0) DEFAULT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `economy_data`
-- ----------------------------
DROP TABLE IF EXISTS `economy_data`;
CREATE TABLE `economy_data` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(64) NOT NULL,
  `maxp` float NOT NULL,
  `minp` float NOT NULL,
  `timelastsaved` text NOT NULL,
  `shopname` varchar(64) NOT NULL,
  `sellprice` float NOT NULL,
  `buyprice` float NOT NULL,
  `sells` int(11) NOT NULL,
  `buys` int(11) NOT NULL,
  `color` varchar(256) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `t` (`classname`,`shopname`,`color`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4081 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `exchange_accounts`
-- ----------------------------
DROP TABLE IF EXISTS `exchange_accounts`;
CREATE TABLE `exchange_accounts` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `accountID` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `timestampedited` text NOT NULL,
  `exchangeName` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `exchange_logs`
-- ----------------------------
DROP TABLE IF EXISTS `exchange_logs`;
CREATE TABLE `exchange_logs` (
  `classname` text NOT NULL,
  `exchangeName` text NOT NULL,
  `type` int(11) NOT NULL,
  `timestampadded` text NOT NULL,
  `active` int(11) NOT NULL,
  `accountID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `EXCHANGE_OFFERS`
-- ----------------------------
DROP TABLE IF EXISTS `EXCHANGE_OFFERS`;
CREATE TABLE `EXCHANGE_OFFERS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classname` text NOT NULL,
  `amount` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `timestampcreated` int(11) NOT NULL,
  `accountid` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `category` text NOT NULL,
  `exchangeName` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ACCOUNTID` (`accountid`),
  CONSTRAINT `ACCOUNTID` FOREIGN KEY (`ACCOUNTID`) REFERENCES `ACCOUNT_DATA` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `exchange_storages`
-- ----------------------------
DROP TABLE IF EXISTS `exchange_storages`;
CREATE TABLE `exchange_storages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `accountID` int(11) NOT NULL,
  `exchangeName` text NOT NULL,
  `classname` text NOT NULL,
  `amount` int(11) NOT NULL,
  `timestampAdd` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `FACTION_PDA_DATA`
-- ----------------------------
DROP TABLE IF EXISTS `FACTION_PDA_DATA`;
CREATE TABLE `FACTION_PDA_DATA` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` text,
  `TITLE` text,
  `DESCRIPTION` text,
  `TIMESTAMPCREATED` text,
  `ACCOUNTID` int(11) DEFAULT NULL,
  `TARGETACCOUNTID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `FACTION_PLAYER_DATA`
-- ----------------------------
DROP TABLE IF EXISTS `FACTION_PLAYER_DATA`;
CREATE TABLE `FACTION_PLAYER_DATA` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STEAM64ID` varchar(32) DEFAULT NULL,
  `ACCOUNTID` int(11) DEFAULT NULL,
  `EQUIPMENT` text,
  `VEHICLES` text,
  `PERMISSIONS` text,
  `RANKID` int(11) DEFAULT NULL,
  `LEADER` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `FACTION_RANK_DATA`
-- ----------------------------
DROP TABLE IF EXISTS `FACTION_RANK_DATA`;
CREATE TABLE `FACTION_RANK_DATA` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FACTIONID` int(11) DEFAULT NULL,
  `NAME` text,
  `TAG` text,
  `DESCRIPTION` text,
  `VEHICLES` text,
  `EQUIPMENT` text,
  `PERMISSIONS` text,
  `PRIORITY` int(11) DEFAULT NULL,
  `INSIGNIA` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `HOUSING_DATA`
-- ----------------------------
DROP TABLE IF EXISTS `HOUSING_DATA`;
CREATE TABLE `HOUSING_DATA` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLASSNAME` text NOT NULL,
  `POSITION` text NOT NULL,
  `TIMECREATED` text NOT NULL,
  `TIMELASTUPDATE` text NOT NULL,
  `ACCOUNTID` int(11) NOT NULL,
  `STEAM64ID` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `licenses`
-- ----------------------------
DROP TABLE IF EXISTS `licenses`;
CREATE TABLE `licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license_name` text NOT NULL,
  `active` int(1) NOT NULL DEFAULT '0',
  `timestamp_added` text NOT NULL,
  `timestamp_updated` text NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `licenses_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `ACCOUNT_DATA` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `lockers`
-- ----------------------------
DROP TABLE IF EXISTS `lockers`;
CREATE TABLE `lockers` (
  `account_id` int(11) NOT NULL,
  `gear` text NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`name`,`account_id`),
  UNIQUE KEY `name, account_id` (`account_id`,`name`) USING HASH,
  CONSTRAINT `aID` FOREIGN KEY (`account_id`) REFERENCES `ACCOUNT_DATA` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `MAPENVIRONMENT`
-- ----------------------------
DROP TABLE IF EXISTS `MAPENVIRONMENT`;
CREATE TABLE `MAPENVIRONMENT` (
  `TIMELASTSAVED` varchar(64) DEFAULT NULL,
  `MAPTIME` text,
  `MAPWEATHER` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of MAPENVIRONMENT
-- ----------------------------
INSERT INTO `MAPENVIRONMENT` VALUES ('1485969117', '\"[]\"', '\"[]\"');

-- ----------------------------
-- Table structure for `OBJECT_DATA`
-- ----------------------------
DROP TABLE IF EXISTS `OBJECT_DATA`;
CREATE TABLE `OBJECT_DATA` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLASSNAME` text NOT NULL,
  `POSITION` text NOT NULL,
  `TIMECREATED` text NOT NULL,
  `TIMELASTUPDATE` text NOT NULL,
  `ACCOUNTID` int(11) NOT NULL,
  `STEAM64ID` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `PERSONALCARD_DATA`
-- ----------------------------
DROP TABLE IF EXISTS `PERSONALCARD_DATA`;
CREATE TABLE `PERSONALCARD_DATA` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ZIPCODE` int(11) NOT NULL,
  `STREET` varchar(32) NOT NULL,
  `STREETNUMBER` int(11) NOT NULL,
  `CITY` varchar(32) NOT NULL,
  `AUTHORITY` text NOT NULL,
  `PARISH` text NOT NULL,
  `BIRTHDATE` varchar(10) NOT NULL,
  `PID` varchar(32) NOT NULL,
  `ACCOUNTID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `VEHICLES_DATA`
-- ----------------------------
DROP TABLE IF EXISTS `VEHICLES_DATA`;
CREATE TABLE `VEHICLES_DATA` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACCOUNTID` int(11) NOT NULL,
  `STEAM64ID` varchar(32) NOT NULL,
  `CLASSNAME` text NOT NULL,
  `ACTIVE` tinyint(4) NOT NULL,
  `DEAD` tinyint(4) NOT NULL,
  `POSITION` text NOT NULL,
  `GEAR` text NOT NULL,
  `DAMAGE` text NOT NULL,
  `FUEL` float NOT NULL,
  `LOCK` tinyint(4) NOT NULL,
  `COLOR` text NOT NULL,
  `TYPE` tinyint(4) NOT NULL,
  `GARAGE` text NOT NULL,
  `NICKNAME` text NOT NULL,
  `PLATE` varchar(8) NOT NULL,
  `parkedAccountID` int(11) NOT NULL,
  `upgrades` text NOT NULL,
  `cracked` int(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=latin1;

DROP TRIGGER IF EXISTS `ACCOUNT_DATA_UPDATE_USED`;
DELIMITER ;;
CREATE TRIGGER `ACCOUNT_DATA_UPDATE_USED` BEFORE UPDATE ON `ACCOUNT_DATA` FOR EACH ROW SET new.TIMELASTUSED = UNIX_TIMESTAMP(NOW())
;;
DELIMITER ;
