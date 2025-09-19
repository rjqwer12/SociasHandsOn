-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2025 at 08:39 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `socias_set_f`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `employeeID` varchar(25) NOT NULL,
  `date` varchar(25) NOT NULL,
  `timein` varchar(25) NOT NULL,
  `timeOut` varchar(25) NOT NULL,
  `late` varchar(25) NOT NULL,
  `overtime` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`employeeID`, `date`, `timein`, `timeOut`, `late`, `overtime`) VALUES
('0001', '9/19/25', '7:30am', '5:00pm', 'None', 'None'),
('0002', '9/19/25', '7:30am', '5:00pm', 'None', 'None');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `departmentID` varchar(25) NOT NULL,
  `name` varchar(25) NOT NULL,
  `DeptHead` varchar(25) NOT NULL,
  `OfficeLocation` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`departmentID`, `name`, `DeptHead`, `OfficeLocation`) VALUES
('0011', 'Ian', 'RJ', 'ITBuilding'),
('0012', 'Xyra', 'RJ', 'ITbuilding');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `EmployeeID` varchar(25) NOT NULL,
  `name` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `department` varchar(25) NOT NULL,
  `position` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`EmployeeID`, `name`, `lastname`, `department`, `position`, `email`, `password`) VALUES
('0001', 'RJ', 'Socias', 'IT', 'Head', 'rj@gmail.com', 'rjngani'),
('0002', 'Ace', 'Sunio', 'IT', 'Assistant', 'ace@gmail.com', 'acengani');

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE `payroll` (
  `payrollID` varchar(25) NOT NULL,
  `employeeID` varchar(25) NOT NULL,
  `salaryID` varchar(25) NOT NULL,
  `payPeriodStart` varchar(25) NOT NULL,
  `payPeriodEnd` varchar(25) NOT NULL,
  `netPay` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll`
--

INSERT INTO `payroll` (`payrollID`, `employeeID`, `salaryID`, `payPeriodStart`, `payPeriodEnd`, `netPay`) VALUES
('0001', '0001', '0001', '7:30am', '5:00pm', '200,000'),
('0002', '0002', '0002', '7:30am', '5:00pm', '150,000');

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

CREATE TABLE `salaries` (
  `salaryID` varchar(25) NOT NULL,
  `Salary` varchar(25) NOT NULL,
  `amount incentives` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salaries`
--

INSERT INTO `salaries` (`salaryID`, `Salary`, `amount incentives`) VALUES
('0001', '200,000', '50,000'),
('0002', '150,000', '25,000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`employeeID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`employeeID`),
  ADD KEY `salaryID` (`salaryID`);

--
-- Indexes for table `salaries`
--
ALTER TABLE `salaries`
  ADD UNIQUE KEY `salaryID` (`salaryID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employees` (`EmployeeID`),
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`employeeID`) REFERENCES `payroll` (`employeeID`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `attendance` (`employeeID`),
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `payroll` (`employeeID`);

--
-- Constraints for table `payroll`
--
ALTER TABLE `payroll`
  ADD CONSTRAINT `payroll_ibfk_1` FOREIGN KEY (`salaryID`) REFERENCES `salaries` (`salaryID`),
  ADD CONSTRAINT `payroll_ibfk_2` FOREIGN KEY (`employeeID`) REFERENCES `employees` (`EmployeeID`),
  ADD CONSTRAINT `payroll_ibfk_3` FOREIGN KEY (`employeeID`) REFERENCES `attendance` (`employeeID`);

--
-- Constraints for table `salaries`
--
ALTER TABLE `salaries`
  ADD CONSTRAINT `salaries_ibfk_1` FOREIGN KEY (`salaryID`) REFERENCES `payroll` (`salaryID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
