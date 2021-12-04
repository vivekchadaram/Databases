-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2021 at 05:20 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assignement1 coursera`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `empno` varchar(5) NOT NULL,
  `empname` varchar(15) DEFAULT NULL,
  `department` varchar(15) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`empno`, `empname`, `department`, `email`, `phone`) VALUES
('E100', 'Chuck Coordinat', 'Administration', 'chuck@colorado.edu', '3-1111'),
('E101', 'Mary Manager', 'Football', 'mary@colorado.edu', '5-1111'),
('E102', 'Sally Superviso', 'Planning', 'sally@colorado.edu', '3-2222'),
('E103', 'Alan Administra', 'Administration', 'alan@colorado.edu', '3-3333');

-- --------------------------------------------------------

--
-- Table structure for table `eventplan`
--

CREATE TABLE `eventplan` (
  `planno` varchar(10) NOT NULL,
  `eventno` varchar(20) DEFAULT NULL,
  `workdate` datetime NOT NULL,
  `notes` varchar(20) NOT NULL,
  `activity` varchar(20) NOT NULL,
  `empno` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `eventplan`
--

INSERT INTO `eventplan` (`planno`, `eventno`, `workdate`, `notes`, `activity`, `empno`) VALUES
('P100', 'E100', '2018-10-25 00:00:00', 'Standard operation', 'Operation', 'E102');

-- --------------------------------------------------------

--
-- Table structure for table `eventplanline`
--

CREATE TABLE `eventplanline` (
  `planno` varchar(10) NOT NULL,
  `lineno` varchar(20) NOT NULL,
  `timestart` datetime NOT NULL,
  `timeend` datetime NOT NULL,
  `numberfld` int(11) NOT NULL,
  `locno` varchar(5) DEFAULT NULL,
  `resno` varchar(220) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `eventplanline`
--

INSERT INTO `eventplanline` (`planno`, `lineno`, `timestart`, `timeend`, `numberfld`, `locno`, `resno`) VALUES
('P100', '1', '2018-10-25 08:00:00', '2018-10-25 17:00:00', 2, 'L100', 'R100');

-- --------------------------------------------------------

--
-- Table structure for table `eventrequest`
--

CREATE TABLE `eventrequest` (
  `eventno` varchar(20) NOT NULL,
  `dateheld` datetime NOT NULL,
  `datereq` datetime NOT NULL,
  `custno` varchar(20) NOT NULL,
  `facno` varchar(20) NOT NULL,
  `dateauth` datetime NOT NULL,
  `satatus` varchar(20) DEFAULT NULL,
  `estcost` int(11) NOT NULL,
  `estaudience` int(11) NOT NULL,
  `budno` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `eventrequest`
--

INSERT INTO `eventrequest` (`eventno`, `dateheld`, `datereq`, `custno`, `facno`, `dateauth`, `satatus`, `estcost`, `estaudience`, `budno`) VALUES
('E100', '2018-10-25 00:00:00', '2018-06-06 00:00:00', 'C100', 'F100', '2018-06-08 00:00:00', 'Approved', 5000, 80000, 'B1000'),
('E101', '2018-10-26 00:00:00', '2018-07-28 00:00:00', 'C100', 'F100', '0000-00-00 00:00:00', 'Pending', 5000, 80000, 'B1000'),
('E103', '2018-09-21 00:00:00', '2018-07-28 00:00:00', 'C100', 'F100', '2018-08-01 00:00:00', 'Approved', 5000, 80000, 'B1000');

-- --------------------------------------------------------

--
-- Table structure for table `resourcetbl`
--

CREATE TABLE `resourcetbl` (
  `resno` varchar(15) NOT NULL,
  `resname` varchar(20) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `resourcetbl`
--

INSERT INTO `resourcetbl` (`resno`, `resname`, `rate`) VALUES
('R100', 'attendant', 10),
('R101', 'police', 15),
('R102', 'usher', 10),
('R103', 'nurse', 20),
('R104', 'janitor', 15),
('R105', 'food service', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`empno`);

--
-- Indexes for table `eventplan`
--
ALTER TABLE `eventplan`
  ADD PRIMARY KEY (`planno`),
  ADD KEY `eventno` (`eventno`),
  ADD KEY `empno` (`empno`);

--
-- Indexes for table `eventplanline`
--
ALTER TABLE `eventplanline`
  ADD PRIMARY KEY (`planno`,`lineno`);

--
-- Indexes for table `eventrequest`
--
ALTER TABLE `eventrequest`
  ADD PRIMARY KEY (`eventno`);

--
-- Indexes for table `resourcetbl`
--
ALTER TABLE `resourcetbl`
  ADD PRIMARY KEY (`resno`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `eventplan`
--
ALTER TABLE `eventplan`
  ADD CONSTRAINT `eventplan_ibfk_1` FOREIGN KEY (`eventno`) REFERENCES `eventrequest` (`eventno`),
  ADD CONSTRAINT `eventplan_ibfk_2` FOREIGN KEY (`empno`) REFERENCES `employee` (`empno`);

--
-- Constraints for table `eventplanline`
--
ALTER TABLE `eventplanline`
  ADD CONSTRAINT `eventplanline_ibfk_1` FOREIGN KEY (`planno`) REFERENCES `eventplan` (`planno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
