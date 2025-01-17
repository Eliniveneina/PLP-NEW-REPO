-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 07, 2015 at 07:11 PM
-- Server version: 5.5.16
-- PHP Version: 5.4.0beta2-dev

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `business`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `accID` int(2) NOT NULL AUTO_INCREMENT,
  `BusinessAccount` decimal(16,2) DEFAULT '0.00',
  `MainAccount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `DeptAccount` decimal(16,2) DEFAULT '0.00',
  PRIMARY KEY (`accID`),
  UNIQUE KEY `accID` (`accID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `deptspayments`
--

CREATE TABLE IF NOT EXISTS `deptspayments` (
  `deptPayID` int(5) NOT NULL AUTO_INCREMENT,
  `deptID` int(5) DEFAULT NULL,
  `Amount` decimal(16,2) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`deptPayID`),
  UNIQUE KEY `deptPayID` (`deptPayID`),
  KEY `deptID` (`deptID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `deptsrecords`
--

CREATE TABLE IF NOT EXISTS `deptsrecords` (
  `deptID` int(5) NOT NULL AUTO_INCREMENT,
  `itemID` int(5) DEFAULT NULL,
  `Quantity` int(3) NOT NULL,
  `Amount` decimal(16,2) DEFAULT NULL,
  `Debtor` varchar(50) NOT NULL,
  `DateTime` datetime DEFAULT NULL,
  `AmountRemain` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`deptID`),
  UNIQUE KEY `deptID` (`deptID`),
  KEY `itemID` (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `expenditure`
--

CREATE TABLE IF NOT EXISTS `expenditure` (
  `expID` int(10) NOT NULL AUTO_INCREMENT,
  `Amount` decimal(10,2) DEFAULT NULL,
  `Description` varchar(255) NOT NULL,
  `staffID` int(2) DEFAULT NULL,
  `DateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`expID`),
  UNIQUE KEY `expID` (`expID`),
  KEY `staffID` (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `incomeflow`
--

CREATE TABLE IF NOT EXISTS `incomeflow` (
  `incFloID` int(5) NOT NULL AUTO_INCREMENT,
  `Amount` decimal(16,2) DEFAULT NULL,
  `Source` varchar(50) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`incFloID`),
  UNIQUE KEY `incFloID` (`incFloID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `itemID` int(5) NOT NULL AUTO_INCREMENT,
  `ItemName` varchar(50) NOT NULL,
  `Quantity` int(3) DEFAULT NULL,
  `Unit` varchar(20) DEFAULT NULL,
  `Mini_Quantity` int(3) NOT NULL,
  `BuyingPrice` decimal(9,2) NOT NULL,
  `SellingPrice` decimal(9,2) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`itemID`),
  UNIQUE KEY `itemID` (`itemID`),
  UNIQUE KEY `ItemName` (`ItemName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `monthlyexpenditure`
--

CREATE TABLE IF NOT EXISTS `monthlyexpenditure` (
  `monExpID` int(10) NOT NULL AUTO_INCREMENT,
  `Amount` decimal(12,2) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`monExpID`),
  UNIQUE KEY `monExpID` (`monExpID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `monthlytransaction`
--

CREATE TABLE IF NOT EXISTS `monthlytransaction` (
  `monIncID` int(10) NOT NULL AUTO_INCREMENT,
  `Amount` decimal(12,2) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`monIncID`),
  UNIQUE KEY `monIncID` (`monIncID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `monthlytransaction`
--

INSERT INTO `monthlytransaction` (`monIncID`, `Amount`, `Date`) VALUES
(1, '60000.00', '2015-09-24'),
(2, '2625300.00', '2015-09-25');

-- --------------------------------------------------------

--
-- Table structure for table `outgoflow`
--

CREATE TABLE IF NOT EXISTS `outgoflow` (
  `outFloID` int(5) NOT NULL AUTO_INCREMENT,
  `Amount` decimal(16,2) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`outFloID`),
  UNIQUE KEY `outFloID` (`outFloID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE IF NOT EXISTS `staffs` (
  `staffID` int(2) NOT NULL AUTO_INCREMENT,
  `StaffName` varchar(100) NOT NULL,
  `Mobile` varchar(20) DEFAULT NULL,
  `Position` varchar(30) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Password` varchar(50) NOT NULL,
  PRIMARY KEY (`staffID`),
  UNIQUE KEY `staffID` (`staffID`),
  UNIQUE KEY `StaffName` (`StaffName`),
  UNIQUE KEY `Password` (`Password`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`staffID`, `StaffName`, `Mobile`, `Position`, `Username`, `Password`) VALUES
(1, 'ELIVONOIYA POUL MGUU', '0712792861', 'Administrator', 'Admin', 'cc5838bd2b7122dad93b7ae517a582d112a7ec15');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE IF NOT EXISTS `transaction` (
  `transID` int(10) NOT NULL AUTO_INCREMENT,
  `itemID` int(5) DEFAULT NULL,
  `Quantity` int(2) NOT NULL,
  `Price` decimal(9,2) NOT NULL,
  `Verification_Method` varchar(10) DEFAULT NULL,
  `Invo_Memo_No` varchar(20) DEFAULT NULL,
  `staffID` int(2) DEFAULT NULL,
  `DateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`transID`),
  UNIQUE KEY `transID` (`transID`),
  KEY `itemID` (`itemID`),
  KEY `staffID` (`staffID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deptspayments`
--
ALTER TABLE `deptspayments`
  ADD CONSTRAINT `deptspayments_ibfk_1` FOREIGN KEY (`deptID`) REFERENCES `deptsrecords` (`deptID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `deptsrecords`
--
ALTER TABLE `deptsrecords`
  ADD CONSTRAINT `deptsrecords_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `items` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expenditure`
--
ALTER TABLE `expenditure`
  ADD CONSTRAINT `expenditure_ibfk_1` FOREIGN KEY (`staffID`) REFERENCES `staffs` (`staffID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `items` (`itemID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`staffID`) REFERENCES `staffs` (`staffID`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
