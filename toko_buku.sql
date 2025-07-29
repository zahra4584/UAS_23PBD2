-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2025 at 04:10 PM
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
-- Database: `toko_buku`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertNewCustomer` (IN `fname` VARCHAR(50), IN `lname` VARCHAR(50))   BEGIN
    INSERT INTO Customers (FirstName, LastName) VALUES (fname, lname);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateOrdersStatus` ()   BEGIN
    DECLARE order_count INT;
    SELECT COUNT(*) INTO order_count FROM Orders;
    
    IF order_count > 0 THEN
        UPDATE Orders SET OrderStatus = 'Processing';
    END IF;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `CalculateOrderTotal` (`order_id` INT, `quantity` INT) RETURNS DECIMAL(10,2)  BEGIN
    DECLARE unit_price DECIMAL(10,2);
    SELECT UnitPrice INTO unit_price FROM OrderDetails WHERE OrderID = order_id;
    RETURN unit_price * quantity;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `CountCustomers` () RETURNS INT(11)  BEGIN
    DECLARE customer_count INT;
    SELECT COUNT(*) INTO customer_count FROM Customers;
    RETURN customer_count;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `CountCustomers1` () RETURNS INT(11)  BEGIN
DECLARE customer_count INT;
SELECT COUNT(*) INTO customer_count FROM Customers;
RETURN customer_count;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `BookID` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Author` varchar(100) DEFAULT NULL,
  `Publisher` varchar(100) DEFAULT NULL,
  `PublicationDate` date DEFAULT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Genre` varchar(50) DEFAULT NULL,
  `AvailableStock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`BookID`, `Title`, `Author`, `Publisher`, `PublicationDate`, `ISBN`, `Price`, `Genre`, `AvailableStock`) VALUES
(1, 'Pemrograman Basis data', 'Zahra', 'Gramedia', '2012-01-01', '9786021234567', 75000.00, 'Teknologi', 20),
(2, 'Rahasia HTML', 'Windy', 'Andi', '2011-05-15', '9786022345678', 90000.00, 'Bisnis', 15),
(3, 'Menggapai M.kom', 'Najwa Shahib', 'Perpustakaan Amikom Yogyakarta', '2020-09-10', '9786023456789', 80000.00, 'Motivasi', 25),
(4, 'Sejarah Komputer', 'Alvin ', 'Perpus UPNVY', '2019-12-01', '9786024567890', 70000.00, 'Sejarah', 10),
(5, 'Panduan Database Security', 'Novi Prisma Yunita, M.Kom', 'Ando', '2018-07-20', '9786025678901', 65000.00, 'Pariwisata', 30),
(6, 'Back-end Dasar', 'Naruto', 'M.SUYANTO', '2017-04-25', '9786026789012', 55000.00, 'Fiksi', 20),
(7, 'Teknik Hewan', 'Denny Nancak', 'Universitas Indonesia', '2016-11-05', '9786027890123', 60000.00, 'Fotografi', 18),
(8, 'Kedokteran Mesin', 'Budiono Siregar', 'Andu', '2015-03-17', '9786028901234', 72000.00, 'Kesehatan', 22),
(9, 'Keajaiban Wanita', 'Aldora', 'Universitas Negeri Yogyakarta', '2014-08-09', '9786029012345', 85000.00, 'Geografi', 14),
(10, 'Tutorial Menjinakan Nuklir', 'Nauval', 'CNN', '2013-02-22', '9786020123456', 95000.00, 'Bisnis', 12),
(12, 'Bulan dan Bintang', 'Adela M.I Bria', NULL, '2025-07-29', NULL, NULL, NULL, NULL),
(13, 'How to Draw Anatomy', 's.n.Azzahra', NULL, '2025-07-29', NULL, NULL, NULL, NULL);

--
-- Triggers `books`
--
DELIMITER $$
CREATE TRIGGER `before_insert_books` BEFORE INSERT ON `books` FOR EACH ROW BEGIN
    SET NEW.PublicationDate = NOW(); -- Set PublicationDate to current date/time
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CategoryID`, `CategoryName`) VALUES
(1, 'Teknologi'),
(2, 'Bisnis'),
(3, 'Motivasi'),
(4, 'Sejarah'),
(5, 'Pariwisata'),
(6, 'BOM'),
(7, 'Fotografi'),
(8, 'Kesehatan'),
(9, 'Geografi'),
(10, 'Pembangunan');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `FirstName`, `LastName`, `Email`, `Phone`, `Address`) VALUES
(1, 'Ahmad', 'Santoso', 'ahmad.santoso@students.amiokom.ac.id', '081234567890', 'Jl. Merdeka No.1, Jakarta'),
(2, 'Budi', 'Hartono', 'budi.hartono@students.amiokom.ac.id', '082234567890', 'Jl. Jend. Sudirman No.2, Jakarta'),
(3, 'Citra', 'Puspita', 'citra.puspita@students.amiokom.ac.id', '083234567890', 'Jl. Gatot Subroto No.3, Jakarta'),
(4, 'Dewi', 'Lestari', 'dewi.lestari@students.amiokom.ac.id', '084234567890', 'Jl. Thamrin No.4, Jakarta'),
(5, 'Eko', 'Prasetyo', 'eko.prasetyo@students.amiokom.ac.id', '085234567890', 'Jl. HR Rasuna Said No.5, Jakarta'),
(6, 'Fajar', 'Maulana', 'fajar.maulana@students.amiokom.ac.id', '086234567890', 'Jl. Kuningan No.6, Jakarta'),
(7, 'Gita', 'Putri', 'gita.putri@students.amiokom.ac.id', '087234567890', 'Jl. Wahid Hasyim No.7, Jakarta'),
(8, 'Hadi', 'Setiawan', 'hadi.setiawan@students.amiokom.ac.id', '088234567890', 'Jl. Sisingamangaraja No.8, Jakarta'),
(9, 'Intan', 'Permata', 'intan.permata@students.amiokom.ac.id', '089234567890', 'Jl. MH Thamrin No.9, Jakarta'),
(10, 'Joko', 'Susanto', 'joko.susanto@students.amiokom.ac.id', '081234567891', 'Jl. Kebon Sirih No.10, Jakarta'),
(11, 'Alvin Nauval', 'Harits', 'alvinnauvalh@students.amiokom.ac.id', '0895410054856', 'Jl. Kaliurang KM 14, Yogyakarta'),
(12, 'Windy Aldora', 'Rayadhani', 'war@students.amiokom.ac.id', '082234567890', 'Jl. Anggajaya no 1001, Yogyakarta'),
(13, 'zahra', 'nugraha', 'zhhhhh@students.amiokom.ac.id', '083234567890', 'Jl. prapatan purwokerto'),
(14, 'John', 'Doe', NULL, NULL, NULL);

--
-- Triggers `customers`
--
DELIMITER $$
CREATE TRIGGER `before_delete_customers` BEFORE DELETE ON `customers` FOR EACH ROW BEGIN
    DELETE FROM Orders WHERE CustomerID = OLD.CustomerID; -- Cascade delete orders related to the customer
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `EmployeeID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Position` varchar(50) DEFAULT NULL,
  `HireDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`EmployeeID`, `FirstName`, `LastName`, `Email`, `Phone`, `Position`, `HireDate`) VALUES
(1, 'Siti ', 'Rokayah', 'siti.Rokayah@gmail.com', '081234567890', 'Manager', '2020-01-01'),
(2, 'Su', 'Pardi', 'supard.thi@gmail.com', '082234567890', 'Sales', '2019-02-02'),
(3, 'Susi', 'Susanto', 'susi.susanto@gmail.com', '083234567890', 'Cashier', '2018-03-03'),
(4, 'Panjul', 'Wijaya', 'panjul.wijaya@gmail.com', '084234567890', 'Warehouse', '2017-04-04'),
(5, 'Kurniawan', 'Kuriman', 'kurnik@gmail.com', '085234567890', 'Accountant', '2016-05-05'),
(6, 'Denny', 'Caknun', 'denny.caknun@gmail.com', '086234567890', 'IT', '2015-06-06'),
(7, 'Hartono', 'Pakuwon', 'hartonopakuwon@gmail.com', '087234567890', 'Customer Service', '2014-07-07'),
(8, 'Tono', 'Sugiok', 'tono.sugiok@gmail.com', '088234567890', 'Security', '2013-08-08'),
(9, 'Ratna', 'Suri', 'ratnasuri@gmail.com', '089234567890', 'Cleaning Service', '2012-09-09'),
(10, 'Supri', 'Gunawan', 'suprigunawan@gmail.com', '081234567891', 'Manager', '2011-10-10'),
(11, 'Tiwi', 'Ekspres', 'tiwiekspres@gmail.com', '081234567891', 'Manager', '2015-10-10');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `OrderDetailID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `BookID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`OrderDetailID`, `OrderID`, `BookID`, `Quantity`, `UnitPrice`) VALUES
(59, 1, 1, 2, 75000.00),
(60, 2, 2, 2, 90000.00),
(61, 3, 3, 3, 80000.00),
(62, 4, 4, 1, 70000.00),
(63, 5, 5, 3, 65000.00),
(64, 6, 6, 2, 60000.00),
(65, 7, 7, 1, 55000.00),
(66, 8, 8, 2, 72000.00),
(67, 9, 9, 3, 85000.00),
(68, 10, 10, 1, 95000.00);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `TotalAmount` decimal(10,2) DEFAULT NULL,
  `OrderStatus` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `CustomerID`, `OrderDate`, `TotalAmount`, `OrderStatus`) VALUES
(1, 1, '2023-01-01', 150000.00, 'Processing'),
(2, 2, '2023-01-02', 180000.00, 'Processing'),
(3, 3, '2023-01-03', 200000.00, 'Processing'),
(4, 4, '2023-01-04', 220000.00, 'Processing'),
(5, 5, '2023-01-05', 175000.00, 'Processing'),
(6, 6, '2023-01-06', 195000.00, 'Processing'),
(7, 7, '2023-01-07', 160000.00, 'Processing'),
(8, 8, '2023-01-08', 210000.00, 'Processing'),
(9, 9, '2023-01-09', 185000.00, 'Processing'),
(10, 10, '2023-01-10', 170000.00, 'Processing');

--
-- Triggers `orders`
--
DELIMITER $$
CREATE TRIGGER `after_update_orders` AFTER UPDATE ON `orders` FOR EACH ROW BEGIN
    IF NEW.OrderStatus = 'Completed' THEN
        INSERT INTO OrderLog (OrderID, LogMessage, LogDate) VALUES (NEW.OrderID, 'Order status updated to Completed', NOW());
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `PaymentID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `PaymentAmount` decimal(12,3) DEFAULT NULL,
  `PaymentMethod` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`PaymentID`, `OrderID`, `PaymentDate`, `PaymentAmount`, `PaymentMethod`) VALUES
(11, 1, '2023-01-02', 150.000, 'Credit Card'),
(12, 2, '2023-01-03', 180.000, 'Bank Transfer'),
(13, 3, '2023-01-04', 200.000, 'PayPal'),
(14, 4, '2023-01-05', 220.000, 'Credit Card'),
(15, 5, '2023-01-06', 170.500, 'Bank Transfer'),
(16, 6, '2023-01-07', 198.500, 'PayPal'),
(17, 7, '2023-01-08', 160.000, 'Credit Card'),
(18, 8, '2023-01-09', 219.000, 'Bank Transfer'),
(19, 9, '2023-01-10', 180.500, 'PayPal'),
(20, 10, '2023-01-11', 170.000, 'Credit Card');

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `ShipmentID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `ShipmentDate` date DEFAULT NULL,
  `ShipmentStatus` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipments`
--

INSERT INTO `shipments` (`ShipmentID`, `OrderID`, `ShipmentDate`, `ShipmentStatus`) VALUES
(11, 1, '2023-01-02', 'Delivered'),
(12, 2, '2023-01-03', 'In Transit'),
(13, 3, '2023-01-04', 'Delivered'),
(14, 4, '2023-01-05', 'Pending'),
(15, 5, '2023-01-06', 'Cancelled'),
(16, 6, '2023-01-07', 'In Transit'),
(17, 7, '2023-01-08', 'Delivered'),
(18, 8, '2023-01-09', 'In Transit'),
(19, 9, '2023-01-10', 'Delivered'),
(20, 10, '2023-01-11', 'Pending');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`BookID`),
  ADD KEY `idx_books_genre_price` (`Genre`,`Price`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`),
  ADD KEY `idx_customers_name` (`FirstName`,`LastName`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`OrderDetailID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `BookID` (`BookID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `OrderID` (`OrderID`);

--
-- Indexes for table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`ShipmentID`),
  ADD KEY `OrderID` (`OrderID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `BookID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
