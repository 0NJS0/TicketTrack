-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2025 at 03:29 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

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
(6, 'get 20% off from each seat from 7th January to 10th January', 'offer', '2025-01-05 20:49:08'),
(7, 'bishal just registered and waiting for your approval', 'registration', '2025-01-07 22:26:24'),
(8, 'jawad just registered as A Traveller', 'registration', '2025-01-10 14:42:30'),
(9, 'aaa just registered and waiting for your approval', 'registration', '2025-01-12 19:54:29'),
(10, 'amin just registered as A Traveller', 'registration', '2025-01-12 19:58:19'),
(11, 'masud just registered as A Traveller', 'registration', '2025-01-12 20:23:00'),
(12, 'bisshah just registered and waiting for your approval', 'registration', '2025-01-17 15:35:55'),
(13, 'azwad just registered and waiting for your approval', 'registration', '2025-01-17 15:47:14'),
(14, 'saccha just registered and waiting for your approval', 'registration', '2025-01-17 15:52:04'),
(15, 'jamil just registered and waiting for your approval', 'registration', '2025-01-17 15:56:19'),
(16, 'jamil just registered and waiting for your approval', 'registration', '2025-01-17 15:58:47'),
(17, 'samin just registered and waiting for your approval', 'registration', '2025-01-17 16:04:40');

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
(23, 5, 'maria', 'unread', '2025-01-04 18:28:58'),
(24, 5, 'marjia', 'unread', '2025-01-04 18:28:58'),
(25, 5, 'najmu', 'unread', '2025-01-04 18:28:58'),
(26, 5, 'reesan', 'unread', '2025-01-04 18:28:58'),
(27, 5, 'yunus', 'unread', '2025-01-04 18:28:58'),
(28, 6, 'nisa', 'read', '2025-01-05 21:29:24'),
(29, 6, 'mari', 'unread', '2025-01-05 20:49:08'),
(30, 7, 'shamim', 'unread', '2025-01-07 22:26:24'),
(31, 7, 'masum', 'unread', '2025-01-07 22:26:24'),
(33, 7, 'maria', 'unread', '2025-01-07 22:26:24'),
(34, 7, 'marjia', 'unread', '2025-01-07 22:26:24'),
(35, 7, 'najmu', 'unread', '2025-01-07 22:26:24'),
(36, 7, 'reesan', 'unread', '2025-01-07 22:26:24'),
(37, 7, 'yunus', 'unread', '2025-01-07 22:26:24'),
(38, 7, 'bishal', 'unread', '2025-01-07 22:26:24'),
(39, 8, 'shamim', 'unread', '2025-01-10 14:42:30'),
(40, 8, 'masum', 'unread', '2025-01-10 14:42:30'),
(42, 8, 'maria', 'unread', '2025-01-10 14:42:30'),
(43, 8, 'marjia', 'unread', '2025-01-10 14:42:30'),
(44, 8, 'najmu', 'unread', '2025-01-10 14:42:30'),
(45, 8, 'reesan', 'unread', '2025-01-10 14:42:30'),
(46, 8, 'yunus', 'unread', '2025-01-10 14:42:30'),
(47, 8, 'bishal', 'unread', '2025-01-10 14:42:30'),
(48, 9, 'shamim', 'unread', '2025-01-12 19:54:29'),
(49, 9, 'masum', 'unread', '2025-01-12 19:54:29'),
(51, 9, 'maria', 'unread', '2025-01-12 19:54:29'),
(52, 9, 'marjia', 'unread', '2025-01-12 19:54:29'),
(53, 9, 'najmu', 'unread', '2025-01-12 19:54:29'),
(54, 9, 'reesan', 'unread', '2025-01-12 19:54:29'),
(55, 9, 'yunus', 'unread', '2025-01-12 19:54:29'),
(56, 9, 'bishal', 'unread', '2025-01-12 19:54:29'),
(57, 9, 'aaa', 'unread', '2025-01-12 19:54:29'),
(58, 10, 'shamim', 'unread', '2025-01-12 19:58:19'),
(59, 10, 'masum', 'unread', '2025-01-12 19:58:19'),
(60, 10, 'ashiq', 'read', '2025-01-17 14:59:44'),
(61, 10, 'maria', 'unread', '2025-01-12 19:58:19'),
(62, 10, 'marjia', 'unread', '2025-01-12 19:58:19'),
(63, 10, 'najmu', 'unread', '2025-01-12 19:58:19'),
(64, 10, 'reesan', 'unread', '2025-01-12 19:58:19'),
(65, 10, 'yunus', 'unread', '2025-01-12 19:58:19'),
(66, 10, 'bishal', 'unread', '2025-01-12 19:58:19'),
(67, 10, 'aaa', 'unread', '2025-01-12 19:58:19'),
(68, 11, 'shamim', 'unread', '2025-01-12 20:23:00'),
(69, 11, 'masum', 'unread', '2025-01-12 20:23:00'),
(70, 11, 'ashiq', 'read', '2025-01-17 14:59:45'),
(71, 11, 'maria', 'unread', '2025-01-12 20:23:00'),
(72, 11, 'marjia', 'unread', '2025-01-12 20:23:00'),
(73, 11, 'najmu', 'unread', '2025-01-12 20:23:00'),
(74, 11, 'reesan', 'unread', '2025-01-12 20:23:00'),
(75, 11, 'yunus', 'unread', '2025-01-12 20:23:00'),
(76, 11, 'bishal', 'unread', '2025-01-12 20:23:00'),
(77, 11, 'aaa', 'unread', '2025-01-12 20:23:00'),
(78, 12, 'masum', 'unread', '2025-01-17 15:35:55'),
(79, 12, 'ashiq', 'read', '2025-01-17 19:18:55'),
(80, 12, 'maria', 'unread', '2025-01-17 15:35:55'),
(81, 12, 'marjia', 'unread', '2025-01-17 15:35:55'),
(82, 12, 'najmu', 'unread', '2025-01-17 15:35:55'),
(83, 12, 'reesan', 'unread', '2025-01-17 15:35:55'),
(84, 12, 'yunus', 'unread', '2025-01-17 15:35:55'),
(85, 12, 'bishal', 'unread', '2025-01-17 15:35:55'),
(86, 12, 'bisshah', 'unread', '2025-01-17 15:35:55'),
(87, 13, 'masum', 'unread', '2025-01-17 15:47:14'),
(88, 13, 'ashiq', 'read', '2025-01-17 18:35:47'),
(89, 13, 'maria', 'unread', '2025-01-17 15:47:14'),
(90, 13, 'marjia', 'unread', '2025-01-17 15:47:14'),
(91, 13, 'najmu', 'unread', '2025-01-17 15:47:14'),
(92, 13, 'reesan', 'unread', '2025-01-17 15:47:14'),
(93, 13, 'yunus', 'unread', '2025-01-17 15:47:14'),
(94, 13, 'bishal', 'unread', '2025-01-17 15:47:14'),
(95, 13, 'bisshah', 'unread', '2025-01-17 15:47:14'),
(96, 13, 'azwad', 'unread', '2025-01-17 15:47:14'),
(97, 14, 'masum', 'unread', '2025-01-17 15:52:04'),
(98, 14, 'ashiq', 'read', '2025-01-17 18:34:07'),
(99, 14, 'maria', 'unread', '2025-01-17 15:52:04'),
(100, 14, 'marjia', 'unread', '2025-01-17 15:52:04'),
(101, 14, 'najmu', 'unread', '2025-01-17 15:52:04'),
(102, 14, 'reesan', 'unread', '2025-01-17 15:52:04'),
(103, 14, 'yunus', 'unread', '2025-01-17 15:52:04'),
(104, 14, 'bishal', 'unread', '2025-01-17 15:52:04'),
(105, 14, 'bisshah', 'unread', '2025-01-17 15:52:04'),
(106, 14, 'azwad', 'unread', '2025-01-17 15:52:04'),
(107, 14, 'saccha', 'unread', '2025-01-17 15:52:04'),
(108, 15, 'masum', 'unread', '2025-01-17 15:56:19'),
(109, 15, 'ashiq', 'read', '2025-01-17 18:34:04'),
(110, 15, 'maria', 'unread', '2025-01-17 15:56:19'),
(111, 15, 'marjia', 'unread', '2025-01-17 15:56:19'),
(112, 15, 'reesan', 'unread', '2025-01-17 15:56:19'),
(113, 15, 'yunus', 'unread', '2025-01-17 15:56:19'),
(114, 15, 'bishal', 'unread', '2025-01-17 15:56:19'),
(115, 15, 'azwad', 'unread', '2025-01-17 15:56:19'),
(116, 15, 'jamil', 'unread', '2025-01-17 15:56:19'),
(117, 16, 'masum', 'unread', '2025-01-17 15:58:47'),
(118, 16, 'ashiq', 'read', '2025-01-17 18:33:27'),
(119, 16, 'maria', 'unread', '2025-01-17 15:58:47'),
(120, 16, 'marjia', 'unread', '2025-01-17 15:58:47'),
(121, 16, 'reesan', 'unread', '2025-01-17 15:58:47'),
(122, 16, 'yunus', 'unread', '2025-01-17 15:58:47'),
(123, 16, 'bishal', 'unread', '2025-01-17 15:58:47'),
(124, 16, 'azwad', 'unread', '2025-01-17 15:58:47'),
(125, 16, 'jamil', 'unread', '2025-01-17 15:58:47'),
(126, 17, 'masum', 'unread', '2025-01-17 16:04:40'),
(127, 17, 'ashiq', 'read', '2025-01-17 19:18:50'),
(128, 17, 'maria', 'unread', '2025-01-17 16:04:40'),
(129, 17, 'marjia', 'unread', '2025-01-17 16:04:40'),
(130, 17, 'reesan', 'unread', '2025-01-17 16:04:40'),
(131, 17, 'yunus', 'unread', '2025-01-17 16:04:40'),
(132, 17, 'bishal', 'unread', '2025-01-17 16:04:40'),
(133, 17, 'azwad', 'unread', '2025-01-17 16:04:40'),
(134, 17, 'jamil', 'unread', '2025-01-17 16:04:40'),
(135, 17, 'samin', 'unread', '2025-01-17 16:04:40');

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
(3, 'masum', 'Masum Billa', 'masum@gmail.com', '01733091241', '2024-12-04', 'Shamim@2000', 'sports', 'F1', 'admin', 1),
(5, 'reni', 'Reni Hossain', 'reni@gmail.com', '01703330191', '1995-06-08', 'Aurko@000', 'sports', 'cricket', 'operator', 1),
(6, 'ashiq', 'ashiq', 'ashiq@gmail.com', '01703330198', '1989-12-01', 'Aurko@000', 'first_pet', 'cat', 'admin', 1),
(9, 'maria', 'Maria Nawar', 'maria@gmail.com', '01703330193', '1995-01-04', 'Aurko@000', 'sports', 'f1', 'admin', 1),
(10, 'marjia', 'Marjia', 'marjia@gmail.com', '01703330187', '2000-01-04', 'Marjia@2000', 'sports', 'f1', 'admin', 1),
(13, 'reesan', 'Reesan', 'reesan@gmail.com', '01703330189', '2025-01-07', 'Aurko@000', 'first_pet', 'cat', 'admin', 1),
(14, 'yunus', 'Yunus', 'yunus@gmail.com', '01712919298', '2000-01-05', 'Aurko@000', 'first_pet', 'cat', 'admin', 1),
(15, 'bishal', 'Bishal', 'bishal@gmail.com', '01712919290', '2025-01-08', 'Aurko@000', 'favorite_player', 'ar', 'admin', 1),
(16, 'jawad', 'Jawad', 'jawad@gmail.com', '01703330184', '2012-01-01', 'Aurko@000', 'sports', 'f1', 'traveller', 1),
(18, 'amin', 'Amin', 'amin@gmail.com', '01703330173', '2011-12-07', 'Aurko@000', 'sports', 'f1', 'traveller', 1),
(21, 'azwad', 'Azwad Islam', 'azwad@gmail.com', '01824502912', '2007-01-17', 'Aurko@000', 'first_pet', 'cat', 'admin', 1),
(25, 'samin', 'Samin', 'samin@gmail.com', '01987654234', '2008-01-09', 'Aurko@000', 'sports', 'f1', 'admin', 0);

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `notification_status`
--
ALTER TABLE `notification_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
