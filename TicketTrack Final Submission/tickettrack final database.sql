-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2025 at 04:51 PM
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
-- Table structure for table `availablebus`
--

CREATE TABLE `availablebus` (
  `id` int(11) DEFAULT NULL,
  `time` datetime(6) NOT NULL,
  `bustype` varchar(50) NOT NULL,
  `price` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `availablebus`
--

INSERT INTO `availablebus` (`id`, `time`, `bustype`, `price`) VALUES
(NULL, '2025-01-15 08:00:00.541000', 'ac', 800),
(NULL, '2025-01-15 09:00:00.541000', 'nonac', 550),
(NULL, '2025-01-15 10:00:00.541000', 'ac', 800);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `busId` varchar(50) NOT NULL,
  `passengerName` varchar(100) NOT NULL,
  `bookingDate` date NOT NULL,
  `contactNumber` varchar(15) NOT NULL,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `busId`, `passengerName`, `bookingDate`, `contactNumber`, `username`) VALUES
(1, '101', 'bishal', '2025-01-01', '0147852', 'bb'),
(2, '101', 'pal', '2025-01-02', '0112336', 'bb'),
(3, '102', 'bp', '2025-01-01', '015963', 'bishal'),
(1, '101', 'bishal', '2025-01-01', '0147852', 'bb'),
(2, '101', 'pal', '2025-01-02', '0112336', 'bb'),
(3, '102', 'bp', '2025-01-01', '015963', 'bishal');

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `busId` int(11) NOT NULL,
  `busType` varchar(100) NOT NULL,
  `startLocation` varchar(100) NOT NULL,
  `endLocation` varchar(100) NOT NULL,
  `totalSeats` int(11) NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `pricePerSeat` int(11) NOT NULL,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`busId`, `busType`, `startLocation`, `endLocation`, `totalSeats`, `startTime`, `endTime`, `pricePerSeat`, `username`) VALUES
(101, 'ac', 'dhaka', 'ctg', 30, '07:40:00', '12:00:00', 1000, 'bb'),
(102, 'nonAc', 'abc', 'asd', 30, '20:05:00', '08:05:00', 300, 'bishal'),
(103, 'nonAc', 'mirpur', 'mym', 50, '00:17:00', '13:18:00', 300, 'bishal'),
(104, 'Seater', 'khulna', 'dhaka', 50, '16:10:00', '22:16:00', 500, 'bishal'),
(105, 'Sleeper', 'Dhaka', 'Cox Bazar', 30, '21:18:00', '07:16:00', 2200, 'bishal'),
(101, 'ac', 'dhaka', 'ctg', 30, '07:40:00', '12:00:00', 1000, 'bb'),
(102, 'nonAc', 'abc', 'asd', 30, '20:05:00', '08:05:00', 300, 'bishal'),
(103, 'nonAc', 'mirpur', 'mym', 50, '00:17:00', '13:18:00', 300, 'bishal'),
(104, 'Seater', 'khulna', 'dhaka', 50, '16:10:00', '22:16:00', 500, 'bishal'),
(105, 'Sleeper', 'Dhaka', 'Cox Bazar', 30, '21:18:00', '07:16:00', 2200, 'bishal');

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
-- Table structure for table `earnings_summary`
--

CREATE TABLE `earnings_summary` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `busId` varchar(50) NOT NULL,
  `riders` int(11) NOT NULL,
  `grossEarnings` decimal(10,2) NOT NULL,
  `commission` decimal(10,2) NOT NULL,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `earnings_summary`
--

INSERT INTO `earnings_summary` (`id`, `date`, `busId`, `riders`, `grossEarnings`, `commission`, `username`) VALUES
(1, '2025-01-01', '101', 25, 5000.00, 1000.00, 'bb'),
(2, '2025-01-02', '101', 30, 6000.00, 1500.00, 'bb'),
(3, '2025-01-01', '102', 20, 4000.00, 500.00, 'bishal'),
(4, '2025-01-02', '101', 25, 5000.00, 500.00, 'bb'),
(5, '2025-01-02', '102', 25, 5000.00, 500.00, 'bishal'),
(6, '2025-01-05', '102', 20, 4000.00, 500.00, 'bishal'),
(7, '2025-01-04', '103', 30, 6000.00, 1000.00, 'bishal');

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
(3, 'How to book seat', 'book seat by clicking on the seats shown on the menu', 'transaction', 'traveller'),
(4, 'How to Book Ticket', 'Just press on seat no then go for transaction', 'transaction', 'traveller'),
(5, 'How to Search For Bus?', 'Just click on Search bus link on navigation bar', 'transaction', 'both'),
(6, 'How to see Previous Earnings?', 'PRess on show earnings Tab', 'transaction', 'operator');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `rate_service` text NOT NULL,
  `like_service` text NOT NULL,
  `suggestion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`rate_service`, `like_service`, `suggestion`) VALUES
('Excellent', 'Driver', 'keep water bottle!'),
('Excellent', '', 'ghhj'),
('Excellent', '', 'ghhj'),
('Excellent', 'Ride', 'ghhj'),
('Excellent', 'Ride', 'ghhj'),
('Excellent', 'Ride', 'ghhj'),
('Not Good', 'Driver', 'gggg'),
('Good', '', 'fghhjhj'),
('Good', '', 'fghhjhj'),
('Good', 'Array', 'fghhjhj'),
('Good', 'Bus', 'fghhjhj'),
('Good', 'Other', 'keep water.'),
('Excellent', 'Driver', 'nice '),
('Average', 'Driver', 'take water bottle'),
('', '', '12'),
('Excellent', 'Driver', 'thee'),
('Excellent', 'Driver', '12344'),
('Not Good', 'Driver', 'hi'),
('Excellent', 'Driver', 'hhhffgggh'),
('Excellent', 'Driver', 'uuuu'),
('Excellent', 'Driver', 'plz keep the environment fresh'),
('Excellent', 'Driver', 'plz keep the environment fresh'),
('Excellent', 'Driver', 'plz keep the environment fresh'),
('Excellent', 'Driver', 'plz keep the water next'),
('', '', ''),
('Excellent', 'Driver', ''),
('Excellent', 'Driver', 'hhh'),
('Excellent', 'Driver', 'hhh'),
('Excellent', 'Driver', 'hhh'),
('Excellent', 'Driver', 'keep boootttle'),
('Excellent', 'Driver', ''),
('Excellent', 'Driver', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz'),
('Excellent', 'Driver', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz'),
('Excellent', 'Driver', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz'),
('Excellent', 'Driver', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz'),
('Excellent', 'Driver', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz'),
('Excellent', 'Driver', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz'),
('Excellent', 'Driver', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz'),
('Excellent', 'Driver', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz'),
('Excellent', 'Driver', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz'),
('Excellent', 'Driver', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz'),
('Excellent', 'Driver', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz'),
('Excellent', 'Driver', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz'),
('Excellent', 'Driver', '\r\n\r\n\r\n\r\n'),
('Excellent', 'Driver', '  hhggg'),
('Excellent', 'Driver', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz'),
('Excellent', 'Driver', ''),
('Excellent', 'Driver', '  niceeeeeeeeeeeeeeeeeeee'),
('Excellent', 'Driver', '  '),
('Excellent', 'Driver', '  '),
('Excellent', 'Driver', '  '),
('Excellent', 'Driver', '  1223'),
('Excellent', 'Driver', '  '),
('Excellent', 'Driver', ''),
('Excellent', 'Driver', ''),
('', '', ''),
('Excellent', 'Driver', ''),
('', '', ''),
('', '', ''),
('', '', ''),
('', '', ''),
('Excellent', 'Driver', 'doing ...'),
('Excellent', 'Driver', 'doing ...'),
('', '', 'hhhhh'),
('Excellent', 'Driver', 'hhh'),
('Excellent', 'Driver', 'h'),
('Good', 'Driver', 'a'),
('Worst', 'Driver', 'z'),
('Good', 'Driver', 'h'),
('Good', 'Driver', 'h'),
('Excellent', 'Driver', 'h'),
('Excellent', 'Driver', 'g'),
('Not Good', 'Driver', 'finally'),
('Excellent', 'Driver', 'hhh'),
('Excellent', 'Driver', 'hhh'),
('Good', 'Driver', 'hello'),
('Excellent', 'Driver', 'hhhhh'),
('Worst', 'Other', 'yyyyyyyyyyyyyyyy'),
('Worst', 'Other', 'no'),
('Average', 'Ride', 'yyyyyyyyy'),
('Excellent', 'Driver', 'hhhhh'),
('Excellent', 'Driver', 'nice'),
('Worst', 'Ride', 'hhh'),
('Worst', 'Ride', 'ever'),
('Worst', 'Ride', 'nice'),
('Excellent', 'Driver', 'ever'),
('Excellent', 'Driver', '100'),
('Good', 'Ride', 'ok'),
('Worst', 'Ride', 'ww'),
('Excellent', 'Driver', 'okkkkkkk'),
('Worst', 'Other', 'improve more in environment'),
('Good', 'Driver', 'oooooooooo'),
('Excellent', 'Driver', 'e'),
('Good', 'Bus', 'good'),
('Average', 'Ride', 'well'),
('Good', 'Bus', 'asdfasfgasdfga'),
('Good', 'Bus', 'fafasdfasdfsda'),
('Excellent', 'Ride', 'asdfafsadfas');

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
(17, 'samin just registered and waiting for your approval', 'registration', '2025-01-17 16:04:40'),
(18, 'bangla just registered and waiting for your approval', 'registration', '2025-01-18 21:28:50'),
(19, 'sami just registered and waiting for your approval', 'registration', '2025-01-18 21:31:37'),
(20, 'nazi just registered and waiting for your approval', 'registration', '2025-01-18 21:36:44'),
(21, 'ami just registered and waiting for your approval', 'registration', '2025-01-18 21:51:32'),
(22, 'rani just registered and waiting for your approval', 'registration', '2025-01-18 21:55:41'),
(23, 'sani just registered and waiting for your approval', 'registration', '2025-01-18 21:59:19'),
(24, 'gami just registered and waiting for your approval', 'registration', '2025-01-18 22:03:10'),
(25, 'pao just registered and waiting for your approval', 'registration', '2025-01-18 22:04:51'),
(26, 'nam just registered and waiting for your approval', 'registration', '2025-01-18 22:14:04'),
(27, 'Get 50% off from all booking', 'offer', '2025-01-18 22:35:58'),
(28, 'axz just registered and waiting for your approval', 'registration', '2025-01-18 23:04:29'),
(29, 'sadasd just registered and is awaiting approval.', 'registration', '2025-01-19 02:19:42'),
(30, 'sadas just registered as a Traveller.', 'registration', '2025-01-19 02:39:21'),
(31, 'sada just registered as a Traveller.', 'registration', '2025-01-19 02:56:39'),
(32, 'ghfh just registered as a Traveller.', 'registration', '2025-01-19 03:02:20'),
(33, 'gfaf just registered as a Traveller.', 'registration', '2025-01-19 03:05:54'),
(34, 'gfa just registered as a Traveller.', 'registration', '2025-01-19 03:07:13'),
(35, 'gf just registered as a Traveller.', 'registration', '2025-01-19 03:10:35'),
(36, 'ggf just registered as a Traveller.', 'registration', '2025-01-19 03:11:07'),
(37, 'ggfh just registered as a Traveller.', 'registration', '2025-01-19 03:17:04'),
(38, 'ggfha just registered as a Traveller.', 'registration', '2025-01-19 03:19:34'),
(39, 'areful just registered as a Traveller.', 'registration', '2025-01-19 03:21:29'),
(40, 'bishal just registered as a Traveller.', 'registration', '2025-01-19 16:24:24'),
(41, 'samo just registered and is waiting for approval.', 'registration', '2025-01-19 18:15:38'),
(42, 'asdas just registered and is waiting for approval.', 'registration', '2025-01-19 19:26:20'),
(43, 'reni just registered and is waiting for approval.', 'registration', '2025-01-20 00:21:12'),
(44, 'Enjoy 50% off in every booking in this Ramadan', 'offer', '2025-01-20 02:19:11'),
(45, 'Enjoy 50% off in every booking in this Ramadan', 'offer', '2025-01-20 02:19:17'),
(46, 'Enjoy 50% off in every booking in this Ramadan', 'offer', '2025-01-20 02:23:21'),
(47, 'dasdasd', 'offer', '2025-01-20 02:24:02'),
(48, 'asdasd', 'offer', '2025-01-20 02:26:57'),
(49, 'dasdas', 'offer', '2025-01-20 02:31:46'),
(50, 'dasd', 'offer', '2025-01-20 02:35:24'),
(51, 'dsadas', 'offer', '2025-01-20 02:35:45'),
(52, 'asdasdas', 'offer', '2025-01-20 02:37:39'),
(53, 'Enjoy 50% off in every booking in this Ramadan', 'offer', '2025-01-20 02:38:19');

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
(135, 17, 'samin', 'unread', '2025-01-17 16:04:40'),
(136, 18, 'masum', 'unread', '2025-01-18 21:28:50'),
(137, 18, 'ashiq', 'read', '2025-01-18 21:29:00'),
(138, 18, 'maria', 'unread', '2025-01-18 21:28:50'),
(139, 18, 'marjia', 'unread', '2025-01-18 21:28:50'),
(140, 18, 'reesan', 'unread', '2025-01-18 21:28:50'),
(141, 18, 'yunus', 'unread', '2025-01-18 21:28:50'),
(142, 18, 'bishal', 'unread', '2025-01-18 21:28:50'),
(143, 18, 'azwad', 'unread', '2025-01-18 21:28:50'),
(144, 18, 'samin', 'unread', '2025-01-18 21:28:50'),
(145, 18, 'bangla', 'unread', '2025-01-18 21:28:50'),
(146, 19, 'masum', 'unread', '2025-01-18 21:31:37'),
(147, 19, 'ashiq', 'read', '2025-01-18 21:31:49'),
(148, 19, 'maria', 'unread', '2025-01-18 21:31:37'),
(149, 19, 'marjia', 'unread', '2025-01-18 21:31:37'),
(150, 19, 'reesan', 'unread', '2025-01-18 21:31:37'),
(151, 19, 'yunus', 'unread', '2025-01-18 21:31:37'),
(152, 19, 'bishal', 'unread', '2025-01-18 21:31:37'),
(153, 19, 'azwad', 'unread', '2025-01-18 21:31:37'),
(154, 19, 'samin', 'unread', '2025-01-18 21:31:37'),
(155, 19, 'bangla', 'unread', '2025-01-18 21:31:37'),
(156, 19, 'sami', 'unread', '2025-01-18 21:31:37'),
(157, 20, 'masum', 'unread', '2025-01-18 21:36:44'),
(158, 20, 'ashiq', 'read', '2025-01-18 21:48:56'),
(159, 20, 'maria', 'unread', '2025-01-18 21:36:44'),
(160, 20, 'marjia', 'unread', '2025-01-18 21:36:44'),
(161, 20, 'reesan', 'unread', '2025-01-18 21:36:44'),
(162, 20, 'yunus', 'unread', '2025-01-18 21:36:44'),
(163, 20, 'bishal', 'unread', '2025-01-18 21:36:44'),
(164, 20, 'azwad', 'unread', '2025-01-18 21:36:44'),
(165, 20, 'samin', 'unread', '2025-01-18 21:36:44'),
(166, 20, 'bangla', 'unread', '2025-01-18 21:36:44'),
(167, 20, 'sami', 'unread', '2025-01-18 21:36:44'),
(168, 20, 'nazi', 'unread', '2025-01-18 21:36:44'),
(169, 21, 'masum', 'unread', '2025-01-18 21:51:32'),
(170, 21, 'ashiq', 'read', '2025-01-18 21:51:40'),
(171, 21, 'maria', 'unread', '2025-01-18 21:51:32'),
(172, 21, 'marjia', 'unread', '2025-01-18 21:51:32'),
(173, 21, 'reesan', 'unread', '2025-01-18 21:51:32'),
(174, 21, 'yunus', 'unread', '2025-01-18 21:51:32'),
(175, 21, 'bishal', 'unread', '2025-01-18 21:51:32'),
(176, 21, 'azwad', 'unread', '2025-01-18 21:51:32'),
(177, 21, 'samin', 'unread', '2025-01-18 21:51:32'),
(178, 21, 'bangla', 'unread', '2025-01-18 21:51:32'),
(179, 21, 'sami', 'unread', '2025-01-18 21:51:32'),
(180, 21, 'nazi', 'unread', '2025-01-18 21:51:32'),
(181, 21, 'ami', 'unread', '2025-01-18 21:51:32'),
(182, 22, 'masum', 'unread', '2025-01-18 21:55:41'),
(183, 22, 'ashiq', 'read', '2025-01-18 21:55:52'),
(184, 22, 'maria', 'unread', '2025-01-18 21:55:41'),
(185, 22, 'marjia', 'unread', '2025-01-18 21:55:41'),
(186, 22, 'reesan', 'unread', '2025-01-18 21:55:41'),
(187, 22, 'yunus', 'unread', '2025-01-18 21:55:41'),
(188, 22, 'bishal', 'unread', '2025-01-18 21:55:41'),
(189, 22, 'azwad', 'unread', '2025-01-18 21:55:41'),
(190, 22, 'samin', 'unread', '2025-01-18 21:55:41'),
(191, 22, 'bangla', 'unread', '2025-01-18 21:55:41'),
(192, 22, 'sami', 'unread', '2025-01-18 21:55:41'),
(193, 22, 'nazi', 'unread', '2025-01-18 21:55:41'),
(194, 22, 'ami', 'unread', '2025-01-18 21:55:41'),
(195, 22, 'rani', 'unread', '2025-01-18 21:55:41'),
(196, 23, 'masum', 'unread', '2025-01-18 21:59:19'),
(197, 23, 'ashiq', 'read', '2025-01-18 22:01:22'),
(198, 23, 'maria', 'unread', '2025-01-18 21:59:19'),
(199, 23, 'marjia', 'unread', '2025-01-18 21:59:19'),
(200, 23, 'reesan', 'unread', '2025-01-18 21:59:19'),
(201, 23, 'yunus', 'unread', '2025-01-18 21:59:19'),
(202, 23, 'bishal', 'unread', '2025-01-18 21:59:19'),
(203, 23, 'azwad', 'unread', '2025-01-18 21:59:19'),
(204, 23, 'samin', 'unread', '2025-01-18 21:59:19'),
(205, 23, 'bangla', 'unread', '2025-01-18 21:59:19'),
(206, 23, 'sami', 'unread', '2025-01-18 21:59:19'),
(207, 23, 'nazi', 'unread', '2025-01-18 21:59:19'),
(208, 23, 'ami', 'unread', '2025-01-18 21:59:19'),
(209, 23, 'rani', 'unread', '2025-01-18 21:59:19'),
(210, 23, 'sani', 'unread', '2025-01-18 21:59:19'),
(211, 24, 'masum', 'unread', '2025-01-18 22:03:10'),
(212, 24, 'ashiq', 'read', '2025-01-18 22:03:17'),
(213, 24, 'maria', 'unread', '2025-01-18 22:03:10'),
(214, 24, 'marjia', 'unread', '2025-01-18 22:03:10'),
(215, 24, 'reesan', 'unread', '2025-01-18 22:03:10'),
(216, 24, 'yunus', 'unread', '2025-01-18 22:03:10'),
(217, 24, 'bishal', 'unread', '2025-01-18 22:03:10'),
(218, 24, 'azwad', 'unread', '2025-01-18 22:03:10'),
(219, 24, 'samin', 'unread', '2025-01-18 22:03:10'),
(220, 24, 'bangla', 'unread', '2025-01-18 22:03:10'),
(221, 24, 'sami', 'unread', '2025-01-18 22:03:10'),
(222, 24, 'nazi', 'unread', '2025-01-18 22:03:10'),
(223, 24, 'ami', 'unread', '2025-01-18 22:03:10'),
(224, 24, 'rani', 'unread', '2025-01-18 22:03:10'),
(225, 24, 'sani', 'unread', '2025-01-18 22:03:10'),
(226, 24, 'gami', 'unread', '2025-01-18 22:03:10'),
(227, 25, 'masum', 'unread', '2025-01-18 22:04:51'),
(229, 25, 'maria', 'unread', '2025-01-18 22:04:51'),
(230, 25, 'marjia', 'unread', '2025-01-18 22:04:51'),
(231, 25, 'reesan', 'unread', '2025-01-18 22:04:51'),
(232, 25, 'yunus', 'unread', '2025-01-18 22:04:51'),
(233, 25, 'bishal', 'unread', '2025-01-18 22:04:51'),
(234, 25, 'azwad', 'unread', '2025-01-18 22:04:51'),
(235, 25, 'samin', 'unread', '2025-01-18 22:04:51'),
(236, 25, 'bangla', 'unread', '2025-01-18 22:04:51'),
(237, 25, 'sami', 'unread', '2025-01-18 22:04:51'),
(238, 25, 'nazi', 'unread', '2025-01-18 22:04:51'),
(239, 25, 'ami', 'unread', '2025-01-18 22:04:51'),
(240, 25, 'rani', 'unread', '2025-01-18 22:04:51'),
(241, 25, 'sani', 'unread', '2025-01-18 22:04:51'),
(242, 25, 'gami', 'unread', '2025-01-18 22:04:51'),
(243, 25, 'pao', 'unread', '2025-01-18 22:04:51'),
(244, 26, 'masum', 'unread', '2025-01-18 22:14:04'),
(245, 26, 'ashiq', 'read', '2025-01-19 14:14:16'),
(246, 26, 'maria', 'unread', '2025-01-18 22:14:04'),
(247, 26, 'marjia', 'unread', '2025-01-18 22:14:04'),
(248, 26, 'reesan', 'unread', '2025-01-18 22:14:04'),
(249, 26, 'yunus', 'unread', '2025-01-18 22:14:04'),
(250, 26, 'bishal', 'unread', '2025-01-18 22:14:04'),
(251, 26, 'azwad', 'unread', '2025-01-18 22:14:04'),
(252, 26, 'samin', 'unread', '2025-01-18 22:14:04'),
(253, 26, 'bangla', 'unread', '2025-01-18 22:14:04'),
(254, 26, 'sami', 'unread', '2025-01-18 22:14:04'),
(255, 26, 'nazi', 'unread', '2025-01-18 22:14:04'),
(256, 26, 'ami', 'unread', '2025-01-18 22:14:04'),
(257, 26, 'rani', 'unread', '2025-01-18 22:14:04'),
(258, 26, 'sani', 'unread', '2025-01-18 22:14:04'),
(259, 26, 'gami', 'unread', '2025-01-18 22:14:04'),
(260, 26, 'pao', 'unread', '2025-01-18 22:14:04'),
(261, 26, 'nam', 'read', '2025-01-18 22:18:34'),
(262, 27, 'jawad', 'unread', '2025-01-18 22:35:58'),
(263, 27, 'amin', 'unread', '2025-01-18 22:35:58'),
(264, 28, 'masum', 'unread', '2025-01-18 23:04:29'),
(265, 28, 'ashiq', 'unread', '2025-01-18 23:04:29'),
(266, 28, 'maria', 'unread', '2025-01-18 23:04:29'),
(267, 28, 'marjia', 'unread', '2025-01-18 23:04:29'),
(268, 28, 'reesan', 'unread', '2025-01-18 23:04:29'),
(269, 28, 'yunus', 'unread', '2025-01-18 23:04:29'),
(270, 28, 'bishal', 'unread', '2025-01-18 23:04:29'),
(271, 28, 'azwad', 'unread', '2025-01-18 23:04:29'),
(272, 28, 'samin', 'unread', '2025-01-18 23:04:29'),
(273, 28, 'bangla', 'unread', '2025-01-18 23:04:29'),
(274, 28, 'sami', 'unread', '2025-01-18 23:04:29'),
(275, 28, 'nazi', 'unread', '2025-01-18 23:04:29'),
(276, 28, 'ami', 'unread', '2025-01-18 23:04:29'),
(277, 28, 'rani', 'unread', '2025-01-18 23:04:29'),
(278, 28, 'sani', 'unread', '2025-01-18 23:04:29'),
(279, 28, 'pao', 'unread', '2025-01-18 23:04:29'),
(280, 28, 'nam', 'unread', '2025-01-18 23:04:29'),
(281, 28, 'axz', 'unread', '2025-01-18 23:04:29'),
(282, 29, 'masum', 'unread', '2025-01-19 02:19:42'),
(283, 29, 'ashiq', 'unread', '2025-01-19 02:19:42'),
(284, 29, 'maria', 'unread', '2025-01-19 02:19:42'),
(285, 29, 'marjia', 'unread', '2025-01-19 02:19:42'),
(286, 29, 'reesan', 'unread', '2025-01-19 02:19:42'),
(287, 29, 'yunus', 'unread', '2025-01-19 02:19:42'),
(288, 29, 'bishal', 'unread', '2025-01-19 02:19:42'),
(289, 29, 'azwad', 'unread', '2025-01-19 02:19:42'),
(290, 29, 'samin', 'unread', '2025-01-19 02:19:42'),
(291, 29, 'bangla', 'unread', '2025-01-19 02:19:42'),
(292, 29, 'sami', 'unread', '2025-01-19 02:19:42'),
(293, 29, 'nazi', 'unread', '2025-01-19 02:19:42'),
(294, 29, 'ami', 'unread', '2025-01-19 02:19:42'),
(295, 29, 'rani', 'unread', '2025-01-19 02:19:42'),
(296, 29, 'sani', 'unread', '2025-01-19 02:19:42'),
(297, 29, 'pao', 'unread', '2025-01-19 02:19:42'),
(298, 29, 'nam', 'unread', '2025-01-19 02:19:42'),
(299, 29, 'sadasd', 'unread', '2025-01-19 02:19:42'),
(300, 30, 'masum', 'unread', '2025-01-19 02:39:21'),
(301, 30, 'ashiq', 'unread', '2025-01-19 02:39:21'),
(302, 30, 'maria', 'unread', '2025-01-19 02:39:21'),
(303, 30, 'marjia', 'unread', '2025-01-19 02:39:21'),
(304, 30, 'reesan', 'unread', '2025-01-19 02:39:21'),
(305, 30, 'yunus', 'unread', '2025-01-19 02:39:21'),
(306, 30, 'bishal', 'unread', '2025-01-19 02:39:21'),
(307, 30, 'azwad', 'unread', '2025-01-19 02:39:21'),
(308, 30, 'samin', 'unread', '2025-01-19 02:39:21'),
(309, 30, 'bangla', 'unread', '2025-01-19 02:39:21'),
(310, 30, 'sami', 'unread', '2025-01-19 02:39:21'),
(311, 30, 'nazi', 'unread', '2025-01-19 02:39:21'),
(312, 30, 'ami', 'unread', '2025-01-19 02:39:21'),
(313, 30, 'rani', 'unread', '2025-01-19 02:39:21'),
(314, 30, 'sani', 'unread', '2025-01-19 02:39:21'),
(315, 30, 'pao', 'unread', '2025-01-19 02:39:21'),
(316, 30, 'nam', 'unread', '2025-01-19 02:39:21'),
(317, 30, 'sadasd', 'unread', '2025-01-19 02:39:21'),
(318, 31, 'masum', 'unread', '2025-01-19 02:56:39'),
(319, 31, 'ashiq', 'read', '2025-01-19 15:22:47'),
(320, 31, 'maria', 'unread', '2025-01-19 02:56:39'),
(321, 31, 'marjia', 'unread', '2025-01-19 02:56:39'),
(322, 31, 'reesan', 'unread', '2025-01-19 02:56:39'),
(323, 31, 'yunus', 'unread', '2025-01-19 02:56:39'),
(324, 31, 'bishal', 'unread', '2025-01-19 02:56:39'),
(325, 31, 'azwad', 'unread', '2025-01-19 02:56:39'),
(326, 31, 'samin', 'unread', '2025-01-19 02:56:39'),
(327, 31, 'bangla', 'unread', '2025-01-19 02:56:39'),
(328, 31, 'sami', 'unread', '2025-01-19 02:56:39'),
(329, 31, 'nazi', 'unread', '2025-01-19 02:56:39'),
(330, 31, 'ami', 'unread', '2025-01-19 02:56:39'),
(331, 31, 'rani', 'unread', '2025-01-19 02:56:39'),
(332, 31, 'sani', 'unread', '2025-01-19 02:56:39'),
(333, 31, 'pao', 'unread', '2025-01-19 02:56:39'),
(334, 31, 'nam', 'unread', '2025-01-19 02:56:39'),
(335, 31, 'sadasd', 'unread', '2025-01-19 02:56:39'),
(336, 31, 'sada', 'unread', '2025-01-19 02:56:39'),
(337, 32, 'masum', 'unread', '2025-01-19 03:02:20'),
(338, 32, 'ashiq', 'unread', '2025-01-19 03:02:20'),
(339, 32, 'maria', 'unread', '2025-01-19 03:02:20'),
(340, 32, 'marjia', 'unread', '2025-01-19 03:02:20'),
(341, 32, 'reesan', 'unread', '2025-01-19 03:02:20'),
(342, 32, 'yunus', 'unread', '2025-01-19 03:02:20'),
(343, 32, 'bishal', 'unread', '2025-01-19 03:02:20'),
(344, 32, 'azwad', 'unread', '2025-01-19 03:02:20'),
(345, 32, 'samin', 'unread', '2025-01-19 03:02:20'),
(346, 32, 'bangla', 'unread', '2025-01-19 03:02:20'),
(347, 32, 'sami', 'unread', '2025-01-19 03:02:20'),
(348, 32, 'nazi', 'unread', '2025-01-19 03:02:20'),
(349, 32, 'ami', 'unread', '2025-01-19 03:02:20'),
(350, 32, 'rani', 'unread', '2025-01-19 03:02:20'),
(351, 32, 'sani', 'unread', '2025-01-19 03:02:20'),
(352, 32, 'pao', 'unread', '2025-01-19 03:02:20'),
(353, 32, 'nam', 'unread', '2025-01-19 03:02:20'),
(354, 32, 'sadasd', 'unread', '2025-01-19 03:02:20'),
(355, 32, 'sada', 'unread', '2025-01-19 03:02:20'),
(356, 33, 'masum', 'unread', '2025-01-19 03:05:54'),
(357, 33, 'ashiq', 'unread', '2025-01-19 03:05:54'),
(358, 33, 'maria', 'unread', '2025-01-19 03:05:54'),
(359, 33, 'marjia', 'unread', '2025-01-19 03:05:54'),
(360, 33, 'reesan', 'unread', '2025-01-19 03:05:54'),
(361, 33, 'yunus', 'unread', '2025-01-19 03:05:54'),
(362, 33, 'bishal', 'unread', '2025-01-19 03:05:54'),
(363, 33, 'azwad', 'unread', '2025-01-19 03:05:54'),
(364, 33, 'samin', 'unread', '2025-01-19 03:05:55'),
(365, 33, 'bangla', 'unread', '2025-01-19 03:05:55'),
(366, 33, 'sami', 'unread', '2025-01-19 03:05:55'),
(367, 33, 'nazi', 'unread', '2025-01-19 03:05:55'),
(368, 33, 'ami', 'unread', '2025-01-19 03:05:55'),
(369, 33, 'rani', 'unread', '2025-01-19 03:05:55'),
(370, 33, 'sani', 'unread', '2025-01-19 03:05:55'),
(371, 33, 'pao', 'unread', '2025-01-19 03:05:55'),
(372, 33, 'nam', 'unread', '2025-01-19 03:05:55'),
(373, 33, 'sadasd', 'unread', '2025-01-19 03:05:55'),
(374, 33, 'sada', 'unread', '2025-01-19 03:05:55'),
(375, 34, 'masum', 'unread', '2025-01-19 03:07:13'),
(376, 34, 'ashiq', 'unread', '2025-01-19 03:07:13'),
(377, 34, 'maria', 'unread', '2025-01-19 03:07:13'),
(378, 34, 'marjia', 'unread', '2025-01-19 03:07:13'),
(379, 34, 'reesan', 'unread', '2025-01-19 03:07:13'),
(380, 34, 'yunus', 'unread', '2025-01-19 03:07:13'),
(381, 34, 'bishal', 'unread', '2025-01-19 03:07:13'),
(382, 34, 'azwad', 'unread', '2025-01-19 03:07:13'),
(383, 34, 'samin', 'unread', '2025-01-19 03:07:13'),
(384, 34, 'bangla', 'unread', '2025-01-19 03:07:13'),
(385, 34, 'sami', 'unread', '2025-01-19 03:07:13'),
(386, 34, 'nazi', 'unread', '2025-01-19 03:07:13'),
(387, 34, 'ami', 'unread', '2025-01-19 03:07:13'),
(388, 34, 'rani', 'unread', '2025-01-19 03:07:13'),
(389, 34, 'sani', 'unread', '2025-01-19 03:07:13'),
(390, 34, 'pao', 'unread', '2025-01-19 03:07:13'),
(391, 34, 'nam', 'unread', '2025-01-19 03:07:13'),
(392, 34, 'sadasd', 'unread', '2025-01-19 03:07:13'),
(393, 34, 'sada', 'unread', '2025-01-19 03:07:13'),
(394, 35, 'masum', 'unread', '2025-01-19 03:10:35'),
(396, 35, 'maria', 'unread', '2025-01-19 03:10:35'),
(397, 35, 'marjia', 'unread', '2025-01-19 03:10:35'),
(398, 35, 'reesan', 'unread', '2025-01-19 03:10:35'),
(399, 35, 'yunus', 'unread', '2025-01-19 03:10:35'),
(400, 35, 'bishal', 'unread', '2025-01-19 03:10:35'),
(401, 35, 'azwad', 'unread', '2025-01-19 03:10:35'),
(402, 35, 'samin', 'unread', '2025-01-19 03:10:35'),
(403, 35, 'bangla', 'unread', '2025-01-19 03:10:35'),
(404, 35, 'sami', 'unread', '2025-01-19 03:10:35'),
(405, 35, 'nazi', 'unread', '2025-01-19 03:10:35'),
(406, 35, 'ami', 'unread', '2025-01-19 03:10:35'),
(407, 35, 'rani', 'unread', '2025-01-19 03:10:35'),
(408, 35, 'sani', 'unread', '2025-01-19 03:10:35'),
(409, 35, 'pao', 'unread', '2025-01-19 03:10:35'),
(410, 35, 'nam', 'unread', '2025-01-19 03:10:35'),
(411, 35, 'sadasd', 'unread', '2025-01-19 03:10:35'),
(412, 35, 'sada', 'unread', '2025-01-19 03:10:35'),
(413, 36, 'masum', 'unread', '2025-01-19 03:11:07'),
(414, 36, 'ashiq', 'unread', '2025-01-19 03:11:07'),
(415, 36, 'maria', 'unread', '2025-01-19 03:11:07'),
(416, 36, 'marjia', 'unread', '2025-01-19 03:11:07'),
(417, 36, 'reesan', 'unread', '2025-01-19 03:11:07'),
(418, 36, 'yunus', 'unread', '2025-01-19 03:11:07'),
(419, 36, 'bishal', 'unread', '2025-01-19 03:11:07'),
(420, 36, 'azwad', 'unread', '2025-01-19 03:11:07'),
(421, 36, 'samin', 'unread', '2025-01-19 03:11:07'),
(422, 36, 'bangla', 'unread', '2025-01-19 03:11:07'),
(423, 36, 'sami', 'unread', '2025-01-19 03:11:07'),
(424, 36, 'nazi', 'unread', '2025-01-19 03:11:07'),
(425, 36, 'ami', 'unread', '2025-01-19 03:11:07'),
(426, 36, 'rani', 'unread', '2025-01-19 03:11:07'),
(427, 36, 'sani', 'unread', '2025-01-19 03:11:07'),
(428, 36, 'pao', 'unread', '2025-01-19 03:11:07'),
(429, 36, 'nam', 'unread', '2025-01-19 03:11:07'),
(430, 36, 'sadasd', 'unread', '2025-01-19 03:11:07'),
(431, 36, 'sada', 'unread', '2025-01-19 03:11:07'),
(432, 37, 'masum', 'unread', '2025-01-19 03:17:04'),
(433, 37, 'ashiq', 'read', '2025-01-19 16:13:17'),
(434, 37, 'maria', 'unread', '2025-01-19 03:17:04'),
(435, 37, 'marjia', 'unread', '2025-01-19 03:17:04'),
(436, 37, 'reesan', 'unread', '2025-01-19 03:17:04'),
(437, 37, 'yunus', 'unread', '2025-01-19 03:17:04'),
(438, 37, 'bishal', 'read', '2025-01-19 13:30:04'),
(439, 37, 'azwad', 'unread', '2025-01-19 03:17:04'),
(440, 37, 'samin', 'unread', '2025-01-19 03:17:04'),
(441, 37, 'bangla', 'unread', '2025-01-19 03:17:04'),
(442, 37, 'sami', 'unread', '2025-01-19 03:17:04'),
(443, 37, 'nazi', 'unread', '2025-01-19 03:17:04'),
(444, 37, 'ami', 'unread', '2025-01-19 03:17:04'),
(445, 37, 'rani', 'unread', '2025-01-19 03:17:04'),
(446, 37, 'sani', 'unread', '2025-01-19 03:17:04'),
(447, 37, 'pao', 'unread', '2025-01-19 03:17:04'),
(448, 37, 'nam', 'unread', '2025-01-19 03:17:04'),
(449, 37, 'sadasd', 'unread', '2025-01-19 03:17:04'),
(450, 37, 'sada', 'unread', '2025-01-19 03:17:04'),
(451, 38, 'masum', 'unread', '2025-01-19 03:19:34'),
(453, 38, 'maria', 'unread', '2025-01-19 03:19:34'),
(454, 38, 'marjia', 'unread', '2025-01-19 03:19:34'),
(455, 38, 'reesan', 'unread', '2025-01-19 03:19:34'),
(456, 38, 'yunus', 'unread', '2025-01-19 03:19:34'),
(457, 38, 'bishal', 'read', '2025-01-19 13:47:10'),
(458, 38, 'azwad', 'unread', '2025-01-19 03:19:34'),
(459, 38, 'samin', 'unread', '2025-01-19 03:19:34'),
(460, 38, 'bangla', 'unread', '2025-01-19 03:19:34'),
(461, 38, 'sami', 'unread', '2025-01-19 03:19:34'),
(462, 38, 'nazi', 'unread', '2025-01-19 03:19:34'),
(463, 38, 'ami', 'unread', '2025-01-19 03:19:34'),
(464, 38, 'rani', 'unread', '2025-01-19 03:19:34'),
(465, 38, 'sani', 'unread', '2025-01-19 03:19:34'),
(466, 38, 'pao', 'unread', '2025-01-19 03:19:34'),
(467, 38, 'nam', 'unread', '2025-01-19 03:19:34'),
(468, 38, 'sadasd', 'unread', '2025-01-19 03:19:34'),
(469, 38, 'sada', 'unread', '2025-01-19 03:19:34'),
(470, 39, 'masum', 'unread', '2025-01-19 03:21:29'),
(472, 39, 'maria', 'unread', '2025-01-19 03:21:29'),
(473, 39, 'marjia', 'unread', '2025-01-19 03:21:29'),
(474, 39, 'reesan', 'unread', '2025-01-19 03:21:29'),
(475, 39, 'yunus', 'unread', '2025-01-19 03:21:29'),
(476, 39, 'bishal', 'read', '2025-01-19 13:30:00'),
(477, 39, 'azwad', 'unread', '2025-01-19 03:21:29'),
(478, 39, 'samin', 'unread', '2025-01-19 03:21:29'),
(479, 39, 'bangla', 'unread', '2025-01-19 03:21:29'),
(480, 39, 'sami', 'unread', '2025-01-19 03:21:29'),
(481, 39, 'nazi', 'unread', '2025-01-19 03:21:29'),
(482, 39, 'ami', 'unread', '2025-01-19 03:21:29'),
(483, 39, 'rani', 'unread', '2025-01-19 03:21:29'),
(484, 39, 'sani', 'unread', '2025-01-19 03:21:29'),
(485, 39, 'pao', 'unread', '2025-01-19 03:21:29'),
(486, 39, 'nam', 'unread', '2025-01-19 03:21:29'),
(487, 39, 'sadasd', 'unread', '2025-01-19 03:21:29'),
(488, 39, 'sada', 'unread', '2025-01-19 03:21:29'),
(489, 39, 'areful', 'read', '2025-01-20 00:18:34'),
(490, 40, 'masum', 'unread', '2025-01-19 16:24:24'),
(491, 40, 'ashiq', 'unread', '2025-01-19 16:24:24'),
(492, 40, 'maria', 'unread', '2025-01-19 16:24:24'),
(493, 40, 'marjia', 'unread', '2025-01-19 16:24:24'),
(494, 40, 'reesan', 'unread', '2025-01-19 16:24:24'),
(495, 40, 'yunus', 'unread', '2025-01-19 16:24:24'),
(496, 40, 'azwad', 'unread', '2025-01-19 16:24:24'),
(497, 40, 'samin', 'unread', '2025-01-19 16:24:24'),
(498, 40, 'bangla', 'unread', '2025-01-19 16:24:24'),
(499, 40, 'sami', 'unread', '2025-01-19 16:24:24'),
(500, 40, 'nazi', 'unread', '2025-01-19 16:24:24'),
(501, 40, 'ami', 'unread', '2025-01-19 16:24:24'),
(502, 40, 'rani', 'unread', '2025-01-19 16:24:24'),
(503, 40, 'nam', 'unread', '2025-01-19 16:24:24'),
(504, 40, 'areful', 'read', '2025-01-19 23:39:02'),
(505, 41, 'masum', 'unread', '2025-01-19 18:15:38'),
(506, 41, 'ashiq', 'unread', '2025-01-19 18:15:38'),
(507, 41, 'maria', 'unread', '2025-01-19 18:15:38'),
(508, 41, 'marjia', 'unread', '2025-01-19 18:15:38'),
(509, 41, 'reesan', 'unread', '2025-01-19 18:15:38'),
(510, 41, 'yunus', 'unread', '2025-01-19 18:15:38'),
(511, 41, 'azwad', 'unread', '2025-01-19 18:15:38'),
(512, 41, 'samin', 'unread', '2025-01-19 18:15:38'),
(513, 41, 'bangla', 'unread', '2025-01-19 18:15:38'),
(514, 41, 'sami', 'unread', '2025-01-19 18:15:38'),
(515, 41, 'nazi', 'unread', '2025-01-19 18:15:38'),
(516, 41, 'ami', 'unread', '2025-01-19 18:15:38'),
(517, 41, 'rani', 'unread', '2025-01-19 18:15:38'),
(518, 41, 'nam', 'unread', '2025-01-19 18:15:38'),
(519, 41, 'areful', 'read', '2025-01-19 23:34:21'),
(520, 41, 'samo', 'unread', '2025-01-19 18:15:38'),
(521, 42, 'masum', 'unread', '2025-01-19 19:26:20'),
(522, 42, 'ashiq', 'unread', '2025-01-19 19:26:20'),
(524, 42, 'marjia', 'unread', '2025-01-19 19:26:20'),
(525, 42, 'reesan', 'unread', '2025-01-19 19:26:20'),
(526, 42, 'yunus', 'unread', '2025-01-19 19:26:20'),
(528, 42, 'samin', 'unread', '2025-01-19 19:26:20'),
(529, 42, 'bangla', 'unread', '2025-01-19 19:26:20'),
(530, 42, 'sami', 'unread', '2025-01-19 19:26:20'),
(531, 42, 'nazi', 'unread', '2025-01-19 19:26:20'),
(532, 42, 'ami', 'unread', '2025-01-19 19:26:20'),
(533, 42, 'rani', 'unread', '2025-01-19 19:26:20'),
(534, 42, 'nam', 'unread', '2025-01-19 19:26:20'),
(535, 42, 'areful', 'read', '2025-01-19 23:33:12'),
(536, 42, 'samo', 'unread', '2025-01-19 19:26:20'),
(537, 42, 'asdas', 'unread', '2025-01-19 19:26:20'),
(538, 43, 'masuma', 'unread', '2025-01-20 00:21:12'),
(539, 43, 'maria', 'unread', '2025-01-20 00:21:12'),
(540, 43, 'marjia', 'unread', '2025-01-20 00:21:12'),
(541, 43, 'reesan', 'unread', '2025-01-20 00:21:12'),
(542, 43, 'yunus', 'unread', '2025-01-20 00:21:12'),
(543, 43, 'azwad', 'unread', '2025-01-20 00:21:12'),
(544, 43, 'samin', 'unread', '2025-01-20 00:21:12'),
(545, 43, 'bangla', 'unread', '2025-01-20 00:21:12'),
(546, 43, 'sami', 'unread', '2025-01-20 00:21:12'),
(547, 43, 'nazi', 'unread', '2025-01-20 00:21:12'),
(548, 43, 'ami', 'unread', '2025-01-20 00:21:12'),
(549, 43, 'rani', 'unread', '2025-01-20 00:21:12'),
(550, 43, 'nam', 'unread', '2025-01-20 00:21:12'),
(551, 43, 'areful', 'unread', '2025-01-20 00:21:12'),
(552, 43, 'samo', 'unread', '2025-01-20 00:21:12'),
(553, 43, 'reni', 'unread', '2025-01-20 00:21:12'),
(554, 44, 'jawad', 'unread', '2025-01-20 02:19:11'),
(555, 44, 'amin', 'unread', '2025-01-20 02:19:11'),
(556, 45, 'jawad', 'unread', '2025-01-20 02:19:17'),
(557, 45, 'amin', 'unread', '2025-01-20 02:19:17'),
(558, 46, 'jawad', 'unread', '2025-01-20 02:23:21'),
(559, 46, 'amin', 'unread', '2025-01-20 02:23:21'),
(560, 47, 'jawad', 'unread', '2025-01-20 02:24:02'),
(561, 47, 'amin', 'unread', '2025-01-20 02:24:02'),
(562, 48, 'jawad', 'unread', '2025-01-20 02:26:57'),
(563, 48, 'amin', 'unread', '2025-01-20 02:26:57'),
(564, 49, 'jawad', 'unread', '2025-01-20 02:31:46'),
(565, 49, 'amin', 'unread', '2025-01-20 02:31:46'),
(566, 50, 'jawad', 'unread', '2025-01-20 02:35:24'),
(567, 50, 'amin', 'unread', '2025-01-20 02:35:24'),
(568, 51, 'jawad', 'unread', '2025-01-20 02:35:45'),
(569, 51, 'amin', 'unread', '2025-01-20 02:35:45'),
(570, 52, 'jawad', 'unread', '2025-01-20 02:37:39'),
(571, 52, 'amin', 'unread', '2025-01-20 02:37:39'),
(572, 53, 'jawad', 'unread', '2025-01-20 02:38:19'),
(573, 53, 'amin', 'unread', '2025-01-20 02:38:19');

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
(12, 'Ramadan Offer!', 'Enjoy 50% off in every booking in this Ramadan', '2025-01-20', '2025-01-30', 50);

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `refund_policy` text NOT NULL,
  `amount` float NOT NULL,
  `deduct_percentage` float NOT NULL,
  `refund_amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `refunds`
--

INSERT INTO `refunds` (`refund_policy`, `amount`, `deduct_percentage`, `refund_amount`) VALUES
('Refund cannot be accepted before 1 day of bus departure!', 100, 10, 90),
('Refund cannot be accepted before 1 day of bus departure!', 111, 10, 99.9),
('Refund cannot be accepted before 1 day of bus departure!', 1000, 10, 900),
('Refund cannot be accepted before 1 day of bus departure!', 1000, 10, 900),
('Refund cannot be accepted before 1 day of bus departure!', 100, 10, 90),
('Refund cannot be accepted before 1 day of bus departure!', 100, 10, 90),
('Refund cannot be accepted before 1 day of bus departure!', 1000, 10, 900),
('Refund cannot be accepted before 1 day of bus departure!', 1000, 10, 900),
('Refund cannot be accepted before 1 day of bus departure!', 1200, 10, 1080),
('Refund cannot be accepted before 1 day of bus departure!', 400, 10, 360),
('Refund cannot be accepted before 1 day of bus departure!', 0, 10, 0),
('Refund cannot be accepted before 1 day of bus departure!', 1000, 10, 900),
('Refund cannot be accepted before 1 day of bus departure!', 10, 10, 9),
('Refund cannot be accepted before 1 day of bus departure!', 10, 10, 9),
('Refund cannot be accepted before 1 day of bus departure!', 10, 10, 9),
('Refund cannot be accepted before 1 day of bus departure!', 10, 10, 9),
('Refund cannot be accepted before 1 day of bus departure!', 10, 10, 9),
('Refund cannot be accepted before 1 day of bus departure!', 10000, 10, 9000),
('Refund cannot be accepted before 1 day of bus departure!', 10, 10, 9),
('Refund cannot be accepted before 1 day of bus departure!', 150, 10, 135),
('Refund cannot be accepted before 1 day of bus departure!', 140, 10, 126),
('Refund cannot be accepted before 1 day of bus departure!', 130, 10, 117),
('Refund cannot be accepted before 1 day of bus departure!', 140, 10, 126),
('Refund cannot be accepted before 1 day of bus departure!', 150, 10, 135),
('Refund cannot be accepted before 1 day of bus departure!', 160, 10, 144),
('Refund cannot be accepted before 1 day of bus departure!', 160, 10, 144),
('Refund cannot be accepted before 1 day of bus departure!', 170, 10, 153),
('Refund cannot be accepted before 1 day of bus departure!', 170, 10, 153),
('Refund cannot be accepted before 1 day of bus departure!', 180, 10, 162),
('Refund cannot be accepted before 1 day of bus departure!', 190, 10, 171),
('Refund cannot be accepted before 1 day of bus departure!', 190, 10, 171),
('Refund cannot be accepted before 1 day of bus departure!', 200, 10, 180),
('Refund cannot be accepted before 1 day of bus departure!', 200, 10, 180),
('Refund cannot be accepted before 1 day of bus departure!', 1000, 10, 900),
('Refund cannot be accepted before 1 day of bus departure!', 10000000000, 10, 9000000000),
('Refund cannot be accepted before 1 day of bus departure!', 195, 10, 175.5),
('Refund cannot be accepted before 1 day of bus departure!', 1000, 10, 900),
('Refund cannot be accepted before 1 day of bus departure!', 101, 10, 90.9),
('Refund cannot be accepted before 1 day of bus departure!', 102, 10, 91.8),
('Refund cannot be accepted before 1 day of bus departure!', 102, 10, 91.8),
('Refund cannot be accepted before 1 day of bus departure!', 103, 10, 92.7),
('Refund cannot be accepted before 1 day of bus departure!', 100, 10, 90),
('Refund cannot be accepted before 1 day of bus departure!', 100, 10, 90),
('Refund cannot be accepted before 1 day of bus departure!', 100, 10, 90),
('Refund cannot be accepted before 1 day of bus departure!', 100, 10, 90),
('Refund cannot be accepted before 1 day of bus departure!', 100, 10, 90),
('Refund cannot be accepted before 1 day of bus departure!', 102, 10, 91.8),
('Refund cannot be accepted before 1 day of bus departure!', 102, 10, 91.8),
('Refund cannot be accepted before 1 day of bus departure!', 102, 10, 91.8),
('Refund cannot be accepted before 1 day of bus departure!', 110, 10, 99),
('Refund cannot be accepted before 1 day of bus departure!', 110, 10, 99),
('Refund cannot be accepted before 1 day of bus departure!', 112, 10, 100.8),
('Refund cannot be accepted before 1 day of bus departure!', 110, 10, 99),
('Refund cannot be accepted before 1 day of bus departure!', 113, 10, 101.7),
('Refund cannot be accepted before 1 day of bus departure!', 110, 10, 99),
('Refund cannot be accepted before 1 day of bus departure!', 112, 10, 100.8),
('Refund cannot be accepted before 1 day of bus departure!', 112, 10, 100.8),
('Refund cannot be accepted before 1 day of bus departure!', 11111100000, 10, 10000000000),
('Refund cannot be accepted before 1 day of bus departure!', 11111100000, 10, 10000000000),
('Refund cannot be accepted before 1 day of bus departure!', 111, 10, 99.9),
('Refund cannot be accepted before 1 day of bus departure!', 1002, 10, 901.8),
('Refund cannot be accepted before 1 day of bus departure!', 111, 10, 99.9),
('Refund cannot be accepted before 1 day of bus departure!', 111, 10, 99.9),
('Refund cannot be accepted before 1 day of bus departure!', 1000, 10, 900),
('Refund cannot be accepted before 1 day of bus departure!', 500, 10, 450),
('Refund cannot be accepted before 1 day of bus departure!', 500, 10, 450),
('Refund cannot be accepted before 1 day of bus departure!', 500, 10, 450),
('Refund cannot be accepted before 1 day of bus departure!', 400, 10, 360),
('Refund cannot be accepted before 1 day of bus departure!', 600, 10, 540),
('Refund cannot be accepted before 1 day of bus departure!', 50, 10, 45),
('Refund cannot be accepted before 1 day of bus departure!', 50, 10, 45),
('Refund cannot be accepted before 1 day of bus departure!', 50, 10, 45),
('Refund cannot be accepted before 1 day of bus departure!', 50, 10, 45),
('Refund cannot be accepted before 1 day of bus departure!', 50, 10, 45),
('Refund cannot be accepted before 1 day of bus departure!', 1000, 10, 900),
('Refund cannot be accepted before 1 day of bus departure!', 100, 10, 90),
('Refund cannot be accepted before 1 day of bus departure!', 0, 10, 0),
('Refund cannot be accepted before 1 day of bus departure!', 100, 10, 90),
('Refund cannot be accepted before 1 day of bus departure!', 0, 10, 0),
('Refund cannot be accepted before 1 day of bus departure!', 50, 10, 45),
('Refund cannot be accepted before 1 day of bus departure!', 0, 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `email` text NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`email`, `comment`) VALUES
('arefulamin2000@gmail.com', 's'),
('arefulamin2000@gmail.com', 's'),
('arefulamin2000@gmail.com', 's'),
('arefulamin2000@gmail.com', 'good'),
('mehedihasanadipto@gmail.com', 'joss'),
('shamim2033@gmail.com', 'omi'),
('njsaurko@gmail.com', 'asdasfasdfasdf');

-- --------------------------------------------------------

--
-- Table structure for table `search_bus_route`
--

CREATE TABLE `search_bus_route` (
  `Pickup_Location` text NOT NULL,
  `Destination_location` text NOT NULL,
  `Bus_Class` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `search_bus_route`
--

INSERT INTO `search_bus_route` (`Pickup_Location`, `Destination_location`, `Bus_Class`) VALUES
('Dhaka', 'Dhaka', 'Ac_Business'),
('Dhaka', 'Dhaka', 'Ac_Business'),
('Dhaka', 'Dhaka', 'Ac_Business'),
('Dhaka', 'Dhaka', 'Ac_Business'),
('Coxbazar', 'Dhaka', 'Ac_Sleeper'),
('Dhaka', 'Dhaka', 'Ac_Business'),
('Chittagong', 'Coxbazar', 'Ac_Sleeper'),
('Dhaka', 'Dhaka', 'Ac_Business'),
('Dhaka', 'Dhaka', 'Ac_Business'),
('Dhaka', 'Dhaka', 'Ac_Business'),
('Dhaka', 'Dhaka', 'Ac_Business'),
('', '', ''),
('', '', ''),
('', '', ''),
('', '', ''),
('', '', ''),
('', '', ''),
('', '', ''),
('', '', ''),
('', '', ''),
('', '', ''),
('', '', ''),
('', '', ''),
('', '', 'Ac_Business'),
('', '', 'Non-Ac'),
('', '', 'Non-Ac'),
('Sylhet', 'Sylhet', 'Non-Ac'),
('Sylhet', 'Sylhet', 'Ac_Sleeper'),
('Sylhet', 'Sylhet', 'Non-Ac'),
('Sylhet', 'Rangamati', 'Ac_Business'),
('Dhaka', 'Sylhet', 'Ac_Sleeper'),
('Chittagong', 'Coxbazar', 'Ac_Business'),
('Dhaka', 'Chittagong', 'Ac_Business'),
('Sylhet', 'Rangamati', 'Ac_Business'),
('Coxbazar', 'Rangamati', 'Non-Ac'),
('Coxbazar', 'Sylhet', 'Ac_Business'),
('Rangamati', 'Coxbazar', 'Ac_Seater'),
('Sylhet', 'Coxbazar', 'Ac_Business'),
('Chittagong', 'Coxbazar', 'Ac_Sleeper'),
('Chittagong', 'Coxbazar', 'Ac_Sleeper'),
('Chittagong', 'Coxbazar', 'Ac_Sleeper'),
('Chittagong', 'Rangamati', 'Ac_Sleeper'),
('Chittagong', 'Sylhet', 'Ac_Sleeper'),
('Chittagong', 'Rangamati', 'Ac_Sleeper'),
('Rangamati', 'Chittagong', 'Ac_Sleeper'),
('Chittagong', 'Sylhet', 'Ac_Sleeper'),
('Chittagong', 'Sylhet', 'Ac_Sleeper'),
('Dhaka', 'Chittagong', 'Ac_Business'),
('Dhaka', 'Chittagong', 'Ac_Business'),
('Coxbazar', 'Chittagong', 'Ac_Sleeper'),
('Chittagong', 'Dhaka', 'Ac_Sleeper'),
('Dhaka', 'Chittagong', 'Ac_Business'),
('Dhaka', 'Chittagong', 'Ac_Business'),
('Dhaka', 'Chittagong', 'Ac_Business'),
('Dhaka', 'Chittagong', 'Ac_Business'),
('Dhaka', 'Chittagong', 'Ac_Business'),
('Dhaka', 'Chittagong', 'Ac_Business'),
('Dhaka', 'Chittagong', 'Ac_Business'),
('Dhaka', 'Chittagong', 'Ac_Business'),
('Chittagong', 'Coxbazar', 'Ac_Business'),
('Chittagong', 'Coxbazar', 'Ac_Business'),
('dhaka', 'Cox Bazar', 'Ac_Business');

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

CREATE TABLE `seat` (
  `ticket_quantity` text NOT NULL,
  `ticket_price` text NOT NULL,
  `seat_numbers` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seat`
--

INSERT INTO `seat` (`ticket_quantity`, `ticket_price`, `seat_numbers`) VALUES
('2', '1000', '1,2'),
('0', '0', ''),
('0', '0', ''),
('2', '1000', '1,6'),
('2', '1000', '1,6'),
('1', '500', '1'),
('4', '2000', '39,19,14,22'),
('4', '2000', '1,2,40,39'),
('4', '2000', '17,18,20,28');

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
(6, 'masuma', 'Ashqiue', 'ashiq@gmail.com', '01733091241', '1992-12-23', 'Aurko@000', 'first_pet', 'cat', 'admin', 1),
(9, 'maria', 'Maria Nawar', 'maria@gmail.com', '01703330193', '1995-01-04', 'Aurko@000', 'sports', 'f1', 'admin', 1),
(10, 'marjia', 'Marjia', 'marjia@gmail.com', '01703330187', '2000-01-04', 'Marjia@2000', 'sports', 'f1', 'admin', 1),
(13, 'reesan', 'Reesan', 'reesan@gmail.com', '01703330189', '2025-01-07', 'Aurko@000', 'first_pet', 'cat', 'admin', 1),
(14, 'yunus', 'Yunus', 'yunus@gmail.com', '01712919298', '2000-01-05', 'Aurko@000', 'first_pet', 'cat', 'admin', 1),
(16, 'jawad', 'Jawad', 'jawad@gmail.com', '01703330184', '2012-01-01', 'Aurko@000', 'sports', 'f1', 'traveller', 1),
(18, 'amin', 'Amin', 'amin@gmail.com', '01703330173', '2011-12-07', 'Aurko@000', 'sports', 'f1', 'traveller', 1),
(21, 'azwad', 'Azwad Islam', 'azwad@gmail.com', '01824502912', '2007-01-17', 'Aurko@000', 'first_pet', 'cat', 'admin', 1),
(25, 'samin', 'Samin', 'samin@gmail.com', '01987654234', '2008-01-09', 'Aurko@000', 'sports', 'f1', 'admin', 1),
(26, 'bangla', 'Bangla', 'bangla@gmail.com', '01709876543', '2008-01-02', 'Aurko@000', 'first_pet', 'cat', 'admin', 1),
(27, 'sami', 'sami', 'sami@gmail.com', '01987659043', '1999-01-06', 'Aurko@000', 'sports', 'f1', 'admin', 1),
(28, 'nazi', 'nazi', 'nazi@gmail.com', '01798765435', '1992-12-09', 'Aurko@000', 'sports', 'f1', 'admin', 1),
(29, 'ami', 'ami', 'ami@gmail.com', '01976908765', '1996-01-17', 'Aurko@000', 'sports', 'fq', 'admin', 1),
(30, 'rani', 'rani', 'rani@gmail.com', '01987659032', '2007-01-19', 'Aurko@000', 'sports', 'f1', 'admin', 1),
(34, 'nam', 'nam', 'nam@gmail.com', '01809839412', '1996-01-11', 'Aurko@000', 'first_pet', 'fa', 'admin', 1),
(46, 'areful', 'fghf', 'njsaurko@gmail.com', '01706660933', '2003-01-01', 'Aurko@000', 'first_pet', 'da', 'admin', 1),
(47, 'bishal', 'bishal', 'bishal@gmail.com', '01703330987', '2000-01-20', 'Aurko@000', 'sports', 'f1', 'operator', 1),
(48, 'samo', 'samo', 'samo@gmail.com', '01703330192', '2001-01-17', 'Aurko@000', 'favorite_player', 'rolando', 'admin', 1),
(50, 'reni', 'Reni Hossain', 'reni@gmail.com', '01709993042', '2000-01-20', 'Aurko@000', 'sports', 'f1', 'admin', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `earnings_summary`
--
ALTER TABLE `earnings_summary`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `earnings_summary`
--
ALTER TABLE `earnings_summary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `notification_status`
--
ALTER TABLE `notification_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=574;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
