-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 01, 2025 at 04:53 PM
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
(1, 'How to update profile?', 'Please click on update link on the menu', 'update_profile', 'both');

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
(9, 'maria', 'Maria Nawar', 'maria@gmail.com', '01703330193', '1995-01-04', 'Aurko@000', 'sports', 'f1', 'admin', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
