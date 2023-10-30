-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2023 at 05:15 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `practice`
--

-- --------------------------------------------------------

--
-- Table structure for table `poll_name`
--

CREATE TABLE `poll_name` (
  `id` int(255) NOT NULL,
  `poll_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `poll_name`
--

INSERT INTO `poll_name` (`id`, `poll_name`) VALUES
(2, 'ashish'),
(5, 'gces voting'),
(10, 'test poll'),
(12, 'suman');

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `id` int(11) NOT NULL,
  `uname` varchar(40) NOT NULL,
  `uemail` varchar(40) NOT NULL,
  `upassword` varchar(40) NOT NULL,
  `poll_name` varchar(255) NOT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`id`, `uname`, `uemail`, `upassword`, `poll_name`, `image_path`) VALUES
(55, 'suman adhikari', 'adhikari', 'ceo ', 'gces', 'upload/Outdoors-man-portrait_(cropped).jpg'),
(56, 'ashish', 'paudel ', 'ashsh', 'gces', 'upload/Outdoors-man-portrait_(cropped).jpg'),
(59, 'ashish paudel ', 'ashish@gmail.com', 'sdfhalsdh', 'gces voting', 'upload/Outdoors-man-portrait_(cropped).jpg'),
(61, 'suman', 'adk', 'adg', 'test poll', 'upload/Screenshot_2023-09-30-09-41-58-926_com.instagram.android.jpg'),
(63, 'akash', 'asas', 'daadg', 'gces voting', 'upload/Screenshot_2023-09-30-10-06-11-921_com.instagram.android.jpg'),
(64, 'jj', 'uj', 'jj', 'suman', 'upload/Screenshot_2023-09-30-10-06-11-921_com.instagram.android.jpg'),
(65, 'ashish acharya ', 'achary', 'sdjfasdsadf', 'ashish', 'upload/Outdoors-man-portrait_(cropped).jpg');

-- --------------------------------------------------------

--
-- Table structure for table `voters_table`
--

CREATE TABLE `voters_table` (
  `id` int(255) NOT NULL,
  `candidate_name` varchar(255) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voters_table`
--

INSERT INTO `voters_table` (`id`, `candidate_name`, `votes`) VALUES
(1, 'jj', 4),
(4, 'ashish paudel ', 7),
(8, 'akash', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `poll_name`
--
ALTER TABLE `poll_name`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voters_table`
--
ALTER TABLE `voters_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `candidate_name` (`candidate_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `poll_name`
--
ALTER TABLE `poll_name`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `voters_table`
--
ALTER TABLE `voters_table`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
