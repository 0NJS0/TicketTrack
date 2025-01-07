-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 06, 2025 at 07:52 AM
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
-- Database: `tickettrack`
--

-- --------------------------------------------------------

--
-- Table structure for table `bustable`
--

CREATE TABLE `bustable` (
  `busid` int(11) NOT NULL,
  `username` text NOT NULL,
  `bus_type` text NOT NULL,
  `startlocation` text NOT NULL,
  `endlocation` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bustable`
--

INSERT INTO `bustable` (`busid`, `username`, `bus_type`, `startlocation`, `endlocation`) VALUES
(1, 'reni', 'nonAC', 'Savar', 'Chitagong'),
(2, 'reni', 'AC', 'Pabna', 'Dhaka');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `type` text NOT NULL,
  `user_type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `question`, `answer`, `type`, `user_type`) VALUES
(1, 'How to update profile?', 'Please click on update link on the menu', 'update_profile', 'both'),
(2, 'How to Add Buses?', 'Just Click on add bus on the menu', 'management', 'operator'),
(3, 'How to book seat', 'book seat by clicking on the seats shown on the menu', 'transaction', 'traveller');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `type` text NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `message`, `type`, `time`) VALUES
(3, 'mari just registered as A Traveller', 'registration', '2025-01-04 17:40:03'),
(4, 'reesan just registered and waiting for your approval', 'registration', '2025-01-04 18:03:44'),
(5, 'yunus just registered and waiting for your approval', 'registration', '2025-01-04 18:28:58'),
(6, 'get 20% off from each seat from 7th January to 10th January', 'offer', '2025-01-05 20:49:08');

-- --------------------------------------------------------

--
-- Table structure for table `notification_status`
--

CREATE TABLE `notification_status` (
  `id` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `username` text NOT NULL,
  `status` text NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification_status`
--

INSERT INTO `notification_status` (`id`, `notification_id`, `username`, `status`, `time`) VALUES
(8, 3, 'masum', 'unread', '2025-01-04 17:40:03'),
(10, 3, 'maria', 'unread', '2025-01-04 17:40:03'),
(11, 3, 'marjia', 'unread', '2025-01-04 17:40:03'),
(12, 3, 'najmu', 'unread', '2025-01-04 17:40:03'),
(13, 4, 'shamim', 'unread', '2025-01-04 18:03:44'),
(14, 4, 'masum', 'unread', '2025-01-04 18:03:44'),
(16, 4, 'maria', 'unread', '2025-01-04 18:03:44'),
(17, 4, 'marjia', 'unread', '2025-01-04 18:03:44'),
(18, 4, 'najmu', 'unread', '2025-01-04 18:03:44'),
(19, 4, 'reesan', 'unread', '2025-01-04 18:03:44'),
(20, 5, 'shamim', 'unread', '2025-01-04 18:28:58'),
(21, 5, 'masum', 'unread', '2025-01-04 18:28:58'),
(22, 5, 'ashiq', 'unread', '2025-01-04 18:28:58'),
(23, 5, 'maria', 'unread', '2025-01-04 18:28:58'),
(24, 5, 'marjia', 'unread', '2025-01-04 18:28:58'),
(25, 5, 'najmu', 'unread', '2025-01-04 18:28:58'),
(26, 5, 'reesan', 'unread', '2025-01-04 18:28:58'),
(27, 5, 'yunus', 'unread', '2025-01-04 18:28:58'),
(28, 6, 'nisa', 'read', '2025-01-05 21:29:24'),
(29, 6, 'mari', 'unread', '2025-01-05 20:49:08');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `discount_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `title`, `description`, `start_date`, `end_date`, `discount_amount`) VALUES
(1, 'New Year Offer', 'Enjoy this new year with 50% discount on each purchase', '2025-01-05', '2025-01-11', 50);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `fullname` text NOT NULL,
  `email` text NOT NULL,
  `phone` text NOT NULL,
  `dob` text NOT NULL,
  `password` text NOT NULL,
  `security_question` text NOT NULL,
  `security_answer` text NOT NULL,
  `user_type` text NOT NULL,
  `is_approved` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `fullname`, `email`, `phone`, `dob`, `password`, `security_question`, `security_answer`, `user_type`, `is_approved`) VALUES
(2, 'shamim', 'Shamim Reza', 'shamim@gmail.com', '01703330195', '2024-10-01', 'Shamim@2000', 'sports', 'Football', 'admin', 1),
(3, 'masum', 'Masum Billa', 'masum@gmail.com', '01733091241', '2024-12-04', 'Shamim@2000', 'sports', 'F1', 'admin', 1),
(4, 'najmus', 'Najmus Saquib', 'aurko@gmail.com', '01703330192', '2025-01-20', 'Aurko@000', 'sports', 'Football', 'operator', 1),
(5, 'reni', 'Reni Hossain', 'reni@gmail.com', '01703330191', '1995-06-08', 'Aurko@000', 'sports', 'cricket', 'operator', 1),
(6, 'ashiq', 'ashiq', 'ashiq@gmail.com', '01703330198', '1989-12-01', 'Aurko@000', 'first_pet', 'cat', 'admin', 1),
(7, 'nisa', 'Nisa', 'nisa@gmail.com', '01703330197', '2025-01-01', 'Aurko@000', 'favorite_player', 'ronaldo', 'traveller', 1),
(9, 'maria', 'Maria Nawar', 'maria@gmail.com', '01703330193', '1995-01-04', 'Aurko@000', 'sports', 'f1', 'admin', 1),
(10, 'marjia', 'Marjia', 'marjia@gmail.com', '01703330187', '2000-01-04', 'Marjia@2000', 'sports', 'f1', 'admin', 1),
(11, 'najmu', 'najmu', 'najmu@gmail.com', '01712919297', '2000-01-05', 'Aurko@000', 'sports', 'f1', 'admin', 1),
(12, 'mari', 'mari', 'mari@gmail.com', '01712919296', '2001-01-17', 'Aurko@000', 'sports', 'f1', 'traveller', 1),
(13, 'reesan', 'Reesan', 'reesan@gmail.com', '01703330189', '2025-01-07', 'Aurko@000', 'first_pet', 'cat', 'admin', 1),
(14, 'yunus', 'Yunus', 'yunus@gmail.com', '01712919298', '2000-01-05', 'Aurko@000', 'first_pet', 'cat', 'admin', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bustable`
--
ALTER TABLE `bustable`
  ADD PRIMARY KEY (`busid`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_status`
--
ALTER TABLE `notification_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bustable`
--
ALTER TABLE `bustable`
  MODIFY `busid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notification_status`
--
ALTER TABLE `notification_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
