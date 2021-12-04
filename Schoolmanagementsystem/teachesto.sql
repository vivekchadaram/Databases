-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2021 at 04:46 PM
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
-- Table structure for table `teachesto`
--

CREATE TABLE `teachesto` (
  `facid` int(10) NOT NULL,
  `studid` int(10) NOT NULL,
  `course` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teachesto`
--

INSERT INTO `teachesto` (`facid`, `studid`, `course`) VALUES
(101, 123, 'Aptitude'),
(101, 123, 'Maths'),
(101, 124, 'Aptitude'),
(101, 124, 'Maths'),
(101, 125, 'Aptitude'),
(101, 125, 'Maths'),
(101, 126, 'Aptitude'),
(101, 126, 'Maths'),
(102, 571, 'Science'),
(102, 572, 'Science'),
(102, 573, 'Science'),
(102, 574, 'Science'),
(103, 123, 'English'),
(103, 124, 'English'),
(103, 125, 'English'),
(104, 897, 'Maths'),
(104, 898, 'Maths'),
(104, 899, 'Maths'),
(104, 900, 'Maths'),
(105, 574, 'English'),
(105, 897, 'English'),
(105, 900, 'English');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `teachesto`
--
ALTER TABLE `teachesto`
  ADD PRIMARY KEY (`facid`,`studid`,`course`),
  ADD KEY `studid` (`studid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `teachesto`
--
ALTER TABLE `teachesto`
  ADD CONSTRAINT `teachesto_ibfk_1` FOREIGN KEY (`facid`) REFERENCES `faculty` (`facid`) ON DELETE CASCADE,
  ADD CONSTRAINT `teachesto_ibfk_2` FOREIGN KEY (`studid`) REFERENCES `student` (`studid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
