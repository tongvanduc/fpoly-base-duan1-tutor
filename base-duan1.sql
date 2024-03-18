-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 18, 2024 at 06:36 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `base-duan1`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int NOT NULL,
  `cart_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `catalogues`
--

CREATE TABLE `catalogues` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `catalogues`
--

INSERT INTO `catalogues` (`id`, `name`) VALUES
(1, 'Điện thoại'),
(2, 'Máy tính');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `user_name` int NOT NULL,
  `user_email` int NOT NULL,
  `user_phone` int NOT NULL,
  `user_address` int NOT NULL,
  `total_bill` int NOT NULL,
  `status_delivery` int NOT NULL COMMENT 'Trang thái vận chuyển đơn hàng: \r\nDưới đây đang lấy theo trạng thái của shopee.\r\n0: chờ xác nhận\r\n1: chờ lấy hàng\r\n2: chờ giao hàng\r\n3: đã giao\r\n-1: đã hủy\r\n',
  `status_payment` int NOT NULL COMMENT 'Trạng thái thanh toán:\r\n0: chưa thanh toán\r\n1: đã thanh toán\r\n-1: đơn hàng đã hủy',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ngày tạo đơn hàng',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ngày cập nhật cuối cùng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL COMMENT 'ưu tiên lưu giá price hơn regular.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `catalogue_id` int NOT NULL COMMENT 'ID danh mục sản phẩm',
  `name` varchar(255) NOT NULL,
  `img_thumbnail` varchar(255) NOT NULL,
  `overview` varchar(255) NOT NULL COMMENT 'tổng quan',
  `price_regular` int NOT NULL COMMENT 'giá bán thường',
  `price_sale` int DEFAULT NULL COMMENT 'giá khuyến mãi',
  `content` int DEFAULT NULL COMMENT 'mô tả chi tiết sản phẩm',
  `rate` tinyint(1) NOT NULL DEFAULT '5' COMMENT 'số sao đánh giá từ 1->5',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ngày tạo sản phẩm',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ngày cập nhật mới nhất'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `catalogue_id`, `name`, `img_thumbnail`, `overview`, `price_regular`, `price_sale`, `content`, `rate`, `created_at`, `updated_at`) VALUES
(5, 2, 'Máy tính ASUS 958', '/uploads/products/maytinh.jpg', '', 15000000, NULL, NULL, 5, '2024-03-18 13:23:57', '2024-03-18 13:23:57'),
(6, 2, 'Máy tính ASUS 789', '/uploads/products/maytinh.jpg', '', 19000000, 16000000, NULL, 5, '2024-03-18 13:24:21', '2024-03-18 13:24:21'),
(7, 2, 'Máy tính ASUS A7Z', '/uploads/products/maytinh.jpg', '', 25000000, 20000000, NULL, 5, '2024-03-18 13:24:46', '2024-03-18 13:24:46'),
(8, 2, 'Máy tính ASUS A7Z', '/uploads/products/maytinh.jpg', '', 43000000, NULL, NULL, 5, '2024-03-18 13:25:10', '2024-03-18 13:25:10'),
(9, 1, 'Điện thoại IP10', '/uploads/products/dienthoai.jpg', '', 15300000, NULL, NULL, 5, '2024-03-18 13:26:20', '2024-03-18 13:26:20'),
(10, 1, 'Điện thoại IP12', '/uploads/products/dienthoai.jpg', '', 20000000, 9800000, NULL, 5, '2024-03-18 13:27:30', '2024-03-18 13:27:30'),
(11, 1, 'Điện thoại IP13', '/uploads/products/dienthoai.jpg', '', 30000000, 12500000, NULL, 5, '2024-03-18 13:27:30', '2024-03-18 13:27:30'),
(12, 1, 'Điện thoại IP14', '/uploads/products/dienthoai.jpg', '', 40000000, NULL, NULL, 5, '2024-03-18 13:27:30', '2024-03-18 13:27:30'),
(13, 1, 'Điện thoại IP15', '/uploads/products/dienthoai.jpg', '', 50000000, 43000000, NULL, 5, '2024-03-18 13:27:30', '2024-03-18 13:27:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'true(1): admin, false(0): member'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `type`) VALUES
(1, 'Admin', 'admin@gmail.com', '12345678', 1),
(2, 'Client', 'client@gmail.com', '12345678', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `catalogues`
--
ALTER TABLE `catalogues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catalogue_id` (`catalogue_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catalogues`
--
ALTER TABLE `catalogues`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`catalogue_id`) REFERENCES `catalogues` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
