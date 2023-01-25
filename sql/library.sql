-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2023 at 11:31 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biblioteka`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `admin_user_id` int(11) NOT NULL,
  `admin_user_accountName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `rating` int(2) NOT NULL DEFAULT 1,
  `genre` varchar(50) NOT NULL,
  `quantity` int(4) NOT NULL,
  `yearOfPublication` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `istaken`
--

CREATE TABLE `istaken` (
  `id` int(11) NOT NULL,
  `isTaken_user_id` int(11) NOT NULL,
  `isTaken_user_accountName` varchar(50) NOT NULL,
  `isTaken_book_id` int(11) NOT NULL,
  `isTaken_book_name` varchar(50) NOT NULL,
  `isTaken_book_quantity` int(4) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `id` int(11) NOT NULL,
  `membership_user_id` int(11) NOT NULL,
  `membership_user_accountName` varchar(50) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `isActive` binary(1) NOT NULL DEFAULT '\0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `moderator`
--

CREATE TABLE `moderator` (
  `id` int(11) NOT NULL,
  `mod_user_id` int(11) NOT NULL,
  `mod_user_accountName` varchar(50) NOT NULL,
  `status` binary(1) NOT NULL DEFAULT '\0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `res_book_id` int(11) NOT NULL,
  `res_book_name` varchar(50) NOT NULL,
  `res_member_user_id` int(11) NOT NULL,
  `res_member_user_accountName` varchar(50) NOT NULL,
  `quantity` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `accountName` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gmail` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `regDate` datetime NOT NULL,
  `lastLog` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`admin_user_id`),
  ADD UNIQUE KEY `user_accName` (`admin_user_accountName`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_name` (`name`),
  ADD KEY `book_quantity` (`quantity`) USING BTREE;

--
-- Indexes for table `istaken`
--
ALTER TABLE `istaken`
  ADD PRIMARY KEY (`id`),
  ADD KEY `isTaken_user_id` (`isTaken_user_id`),
  ADD KEY `isTaken_user_accName` (`isTaken_user_accountName`),
  ADD KEY `isTaken_book_id` (`isTaken_book_id`),
  ADD KEY `isTaken_book_name` (`isTaken_book_name`),
  ADD KEY `isTaken_book_quantity` (`isTaken_book_quantity`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_accountName` (`membership_user_accountName`),
  ADD KEY `user_id` (`membership_user_id`);

--
-- Indexes for table `moderator`
--
ALTER TABLE `moderator`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`mod_user_id`),
  ADD UNIQUE KEY `user_accName` (`mod_user_accountName`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`res_book_id`),
  ADD KEY `user_id` (`res_member_user_id`),
  ADD KEY `user_accName` (`res_member_user_accountName`),
  ADD KEY `res_book_id` (`res_book_id`),
  ADD KEY `res_book_name` (`res_book_name`),
  ADD KEY `res_member_user_id` (`res_member_user_id`),
  ADD KEY `res_member_user_accName` (`res_member_user_accountName`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accountName` (`accountName`),
  ADD UNIQUE KEY `gmail` (`gmail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `istaken`
--
ALTER TABLE `istaken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderator`
--
ALTER TABLE `moderator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `FK_admin_user_accName` FOREIGN KEY (`admin_user_accountName`) REFERENCES `user` (`accountName`),
  ADD CONSTRAINT `FK_admin_user_id` FOREIGN KEY (`admin_user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `istaken`
--
ALTER TABLE `istaken`
  ADD CONSTRAINT `FK_isT_book_id` FOREIGN KEY (`isTaken_book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_isT_book_name` FOREIGN KEY (`isTaken_book_name`) REFERENCES `book` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_isT_book_quantity` FOREIGN KEY (`isTaken_book_quantity`) REFERENCES `book` (`quantity`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_isT_user_accName` FOREIGN KEY (`isTaken_user_accountName`) REFERENCES `user` (`accountName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_isT_user_id` FOREIGN KEY (`isTaken_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `membership`
--
ALTER TABLE `membership`
  ADD CONSTRAINT `FK_memberShip_user_accName` FOREIGN KEY (`membership_user_accountName`) REFERENCES `user` (`accountName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_memberShip_user_id` FOREIGN KEY (`membership_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `moderator`
--
ALTER TABLE `moderator`
  ADD CONSTRAINT `FK_mod_user_accName` FOREIGN KEY (`mod_user_accountName`) REFERENCES `user` (`accountName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_mod_user_id` FOREIGN KEY (`mod_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK_res_book_id` FOREIGN KEY (`res_book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_res_book_name` FOREIGN KEY (`res_book_name`) REFERENCES `book` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_res_member_user_accName` FOREIGN KEY (`res_member_user_accountName`) REFERENCES `membership` (`membership_user_accountName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_res_member_user_id` FOREIGN KEY (`res_member_user_id`) REFERENCES `membership` (`membership_user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
