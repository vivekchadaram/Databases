-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2021 at 04:41 PM
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
-- Database: `sms`
--

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studid` int(10) NOT NULL,
  `studname` varchar(50) NOT NULL,
  `class` int(3) NOT NULL,
  `section` char(3) NOT NULL,
  `rollno` int(20) NOT NULL,
  `dob` date NOT NULL,
  `schoolid` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studid`, `studname`, `class`, `section`, `rollno`, `dob`, `schoolid`) VALUES
(123, 'Anurav', 10, 'B', 1, '2006-04-06', 'DAV101'),
(124, 'Vivek', 10, 'B', 2, '2006-11-03', 'DAV101'),
(125, 'Prakash', 10, 'B', 3, '2006-11-08', 'DAV101'),
(126, 'Chari', 10, 'B', 4, '2006-12-23', 'DAV101'),
(571, 'Shriiya', 6, 'A', 1, '2010-01-03', 'DAV101'),
(572, 'Rahul', 6, 'A', 1, '2010-10-13', 'DAV101'),
(573, 'Abdul', 6, 'A', 1, '2010-07-23', 'DAV101'),
(574, 'Ram', 6, 'A', 1, '2010-04-17', 'DAV101'),
(897, 'Chankya', 3, 'A', 1, '2015-01-03', 'DAV101'),
(898, 'SriRam', 3, 'A', 2, '2015-12-30', 'DAV101'),
(899, 'Abhiram', 3, 'A', 1, '2015-07-11', 'DAV101'),
(900, 'Chankya', 3, 'A', 1, '2015-09-30', 'DAV101');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studid`),
  ADD KEY `schoolid` (`schoolid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`schoolid`) REFERENCES `school` (`schoolid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
