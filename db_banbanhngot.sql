-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3325
-- Generation Time: Apr 29, 2024 at 02:57 PM
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
-- Database: `db_banbanhngot`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'trạng thái',
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `status`, `created_at`, `updated_at`) VALUES
(52, 66, '2024-04-29', 560000, 'COD', NULL, 'Đang xử lý', '2024-04-29 10:30:47', '2024-04-29 10:30:47'),
(53, 67, '2024-04-29', 320000, 'COD', NULL, 'Đang xử lý', '2024-04-29 12:06:39', '2024-04-29 12:06:39'),
(54, 68, '2024-04-29', 770000, 'COD', NULL, 'Đang xử lý', '2024-04-29 12:07:03', '2024-04-29 12:07:03');

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(70, 52, 175, 1, 560000, '2024-04-29 10:30:47', '2024-04-29 10:30:47'),
(71, 54, 161, 1, 450000, '2024-04-29 12:07:03', '2024-04-29 12:07:03'),
(72, 54, 163, 1, 320000, '2024-04-29 12:07:03', '2024-04-29 12:07:03');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_type` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(250) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `id_type`, `name`, `description`, `created_at`, `updated_at`) VALUES
(95, 46, 'Entremet', 'Dòng bánh kem lạnh hiện đại và cao cấp của Pháp', '2024-04-28 15:20:02', '2024-04-28 15:24:11'),
(96, 36, 'Bánh Kem', 'Từ chiếc bánh kem sữa tươi nhân mứt đến bánh kem bắp thơm béo, hay bánh bento hiện đại đều sẽ mang đến bạn những trải nghiệm tuyệt vời', '2020-05-27 15:31:21', '2024-04-28 15:25:20'),
(97, 41, 'Tiramisu', 'Là dòng bánh ngọt xuất xứ từ Ý, được thực khách ưa chuộng nên đã dần quen thuộc trong các buổi tiệc sinh nhật', '2020-05-27 15:31:47', '2024-04-28 15:26:37'),
(98, 48, 'Bánh ngọt', 'Ngon lắm,  buộc mua!', '2020-05-27 15:33:29', '2024-04-28 15:29:18');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL,
  `content` varchar(2000) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `id_product`, `content`, `name`, `email`, `created_at`, `updated_at`) VALUES
(14, 158, 'Bánh ngon, ngọt thanh từ bắp, ăn không bị ngán.', 'Trang', 'vqtr', '2024-04-29 10:29:19', '2024-04-29 10:29:19');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `note` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(68, 'Nguyễn Ngọc Phát', 'nam', 'nnp@gmail.com', 'Số 65, đường 12, khu phố 3, phường Hiệp Thành, Quận 12, TP.HCM', '0341926063', NULL, '2024-04-29 12:07:03', '2024-04-29 12:07:03'),
(66, 'Vũ Quỳnh Trang', 'nữ', 'vqtrang@gmail.com', '123 Lê Văn Khương, Quận 12, TP.HCM', '0334712209', NULL, '2024-04-29 10:30:47', '2024-04-29 10:30:47'),
(55, 'Vũ Thúy Quỳnh', 'nữ', 'thuyquynhvu@gmail.com', '446 Nguyễn Thị Minh Khai, phường 5, Quận 3, TP.', '0924532721', NULL, '2024-04-29 03:07:00', '2024-04-29 03:07:00'),
(67, 'Nguyễn Ngọc Phát', 'nam', 'nnp@gmail.com', 'Số 65, đường 12, khu phố 3, phường Hiệp Thành, Quận 12, TP.HCM', '0341926063', NULL, '2024-04-29 12:06:39', '2024-04-29 12:06:39'),
(57, 'Nguyễn Thị Ý Ngân', 'nữ', 'yngannt@gmail.com', '55 Atelieruân Thủy, phường Thảo Điền, Quận Thủ Đức, TP.HCM', '0844527916', NULL, '2024-04-29 03:07:58', '2024-04-29 03:07:58'),
(58, 'Nguyễn Thanh Tùng', 'nam', 'thanhtung81@gmail.com', '1 Nguyễn Du, phường Bến Nghé, Quận 1, TP.HCM', '0335612908', NULL, '2024-04-29 03:08:30', '2024-04-29 03:08:30'),
(59, 'Lê Minh Huy', 'nam', 'lmh1122@gmail.com', 'Chung cư Cantavil An Phú, Quận Thủ Đức', '0954216075', NULL, '2024-04-29 03:09:00', '2024-04-29 03:09:00'),
(60, 'Lê Võ Ái Phương', 'nữ', 'levoaiphuong@gmail.com', '206 Nguyễn Đình Chiểu, phường 6, Quận 3, TP.', '0811942678', NULL, '2024-04-29 03:09:45', '2024-04-29 03:09:45'),
(61, 'Vũ Đức Đô', 'nam', 'ducdovu1122@gmail.com', '55 Nguyễn Du, phường Bến Nghé, Quận 1', '0846712994', NULL, '2024-04-29 03:10:09', '2024-04-29 03:10:09'),
(62, 'Trần Lê Hoàng Châu', 'nữ', 'hoangchau45@gmail.com', '201 Nguyễn Chí Thanh, phường 12, Quận 10, TP.HCM', '0962314557', NULL, '2024-04-29 03:10:49', '2024-04-29 03:10:49'),
(63, 'Nguyễn Hiền Minh Trang', 'nữ', 'minhtranghiennguyen@gmail.com', '208 Nguyễn Hữu Cảnh, phường 22, Quận Bình Thạnh, TP.', '0306781249', NULL, '2024-04-29 03:11:17', '2024-04-29 03:11:17'),
(64, 'Đinh Thanh Nhã', 'nữ', 'thanhnha.dinh@gmail.com', '414 Võ Văn Tần, phường 5, Quận 3, TP.HCM', '0842019130', NULL, '2024-04-29 03:11:52', '2024-04-29 03:11:52'),
(65, 'Tạ Hữu Chiến', 'nam', 'tahuuchien143@gmail.com', '36 Nguyễn Ư Dĩ, phường Thảo Điền, Quận Thủ Đức, TP. HCM', '0964331024', NULL, '2024-04-29 03:12:35', '2024-04-29 03:12:35');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_employees` varchar(100) NOT NULL COMMENT 'tên nhân viên',
  `email` varchar(100) NOT NULL COMMENT 'email',
  `address` varchar(250) NOT NULL COMMENT 'địa chỉ',
  `phone` varchar(20) NOT NULL COMMENT 'số điện thoại',
  `gender` varchar(10) NOT NULL COMMENT 'giới tính',
  `position` varchar(100) NOT NULL COMMENT 'chức vụ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name_employees`, `email`, `address`, `phone`, `gender`, `position`, `created_at`, `updated_at`) VALUES
(4, 'Kiều Phương Nhàn', 'kpnhan.a@gmail.com', '12/9, Võ Văn Ngân, Linh Trung, Thủ Đức', '0972658332', 'nam', 'quản lý', '2024-04-29 03:14:49', '2024-04-29 03:14:49'),
(5, 'Nguyễn Ngọc Phát', 'nnp@gmail.com', '123 Lê Văn Khương, Hiệp Thành, Quận 12, TP.HCM', '0341926063', 'nam', 'quản lý', '2024-04-29 03:15:22', '2024-04-29 03:15:22'),
(6, 'Nguyễn Hoàng An', 'nh.an76@gmail.com', '1230/A, Lê Quang Định, Quận Bình Thạnh, TP.HCM', '0842134686', 'nam', 'nhân viên bán hàng', '2024-04-29 03:16:22', '2024-04-29 03:16:22'),
(7, 'Nguyễn Minh Bách', 'nmbach@gmail.com', '76/32/18/3B, Nguyễn Trãi, Bến Nghé, Quận 1, TP.HCM', '0819775054', 'nam', 'nhân viên bán hàng', '2024-04-29 03:17:23', '2024-04-29 03:17:23'),
(8, 'Hoàng Thị Kim Chi', 'chihtk@gmail.com', '414 Võ Văn Tần, phường 5, Quận 3, TP.HCM', '0966420071', 'nữ', 'nhân viên bán hàng', '2024-04-29 03:18:10', '2024-04-29 03:18:10'),
(9, 'Vũ Gia Khang', 'zakhang@gmail.com', '90/1A, Lê Văn Việt, Trường Thọ, Quận Thủ Đức, TP.HCM', '0351923857', 'nam', 'nhân viên bán hàng', '2024-04-29 03:19:05', '2024-04-29 03:19:05'),
(10, 'Bùi Nguyễn Kim Ngân', 'bnkngan@gmail.com', '124/89, Cách Mạng Tháng 8, phường 12, Quận 3, TP.HCM', '0846712778', 'nữ', 'nhân viên bán hàng', '2024-04-29 03:20:19', '2024-04-29 03:20:19'),
(11, 'Vũ Quỳnh Trang', 'vqtrang@gmail.com', '123 Lê', '0334712209', 'nữ', 'nhân viên bán hàng', '2024-04-29 03:21:02', '2024-04-29 03:21:02'),
(12, 'Lê Thị Tâm', 'tamlt34@gmail.com', 'Trống', '0914362448', 'nữ', 'nhân viên bán hàng', '2024-04-29 03:21:35', '2024-04-29 03:21:35'),
(13, 'tructn@gmail.com', 'tructn@gmail.com', 'Chưa cập nhật', '0368772501', 'nữ', 'nhân viên bán hàng', '2024-04-29 03:22:13', '2024-04-29 03:22:13');

-- --------------------------------------------------------

--
-- Table structure for table `import_bill`
--

CREATE TABLE `import_bill` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_import_bill_detail` int(10) UNSIGNED NOT NULL,
  `total_price` float NOT NULL,
  `id_employees` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `import_bill_detail`
--

CREATE TABLE `import_bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL COMMENT 'mã sản phẩm',
  `id_type_product` int(10) UNSIGNED NOT NULL COMMENT 'mã loại sp',
  `id_category` int(10) UNSIGNED NOT NULL COMMENT 'mã danh mục',
  `id_supplier` int(10) UNSIGNED NOT NULL COMMENT 'mã nhà cung cấp',
  `quantity` int(10) NOT NULL COMMENT 'số lượng',
  `unit_price` float NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lienhe`
--

CREATE TABLE `lienhe` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` int(20) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lienhe`
--

INSERT INTO `lienhe` (`id`, `name`, `email`, `phone`, `message`, `created_at`, `updated_at`) VALUES
(3, 'Vũ Thúy Quỳnh', 'thuyquynhvu@gmail.com', 924532721, 'Cảm ơn Atelier Cake', '2024-04-25 15:22:52', '2024-04-25 15:22:52'),
(4, 'Lê Minh Huy', '', 954216075, 'Em chào ad ạ, Ad cho em hỏi bánh mình cần đặt trước mấy ngày mới có ạ?', '2024-04-16 11:23:46', '2024-04-16 11:23:46');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'tiêu đề',
  `summary` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tóm tắt',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'nội dung',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'hình',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `summary`, `content`, `image`, `created_at`, `updated_at`) VALUES
(11, '<h3><b><strong>Khám phá</strong></b></h3>', '<h3><tt><em><strong>Thế giới B&aacute;nh Entremet</strong></em></tt></h3>', '<h3 style=\"text-align:justify\"><samp>H&ocirc;m nay, ch&uacute;ng ta sẽ kh&aacute;m ph&aacute; một loại b&aacute;nh đặc biệt v&agrave; tuyệt vời - B&aacute;nh Entremet tại tiệm b&aacute;nh Minty. Nếu bạn l&agrave; người y&ecirc;u th&iacute;ch hương vị h&agrave;i h&ograve;a, h&igrave;nh dạng tinh tế v&agrave; trải nghiệm ẩm thực độc đ&aacute;o, h&atilde;y c&ugrave;ng Atelier kh&aacute;m ph&aacute; những điều th&uacute; vị của loại b&aacute;nh ngọt ng&agrave;o n&agrave;y nh&eacute;! </samp></h3>\r\n\r\n<h3 style=\"text-align:justify\"><samp><strong>Một sự kết hợp ho&agrave;n hảo:</strong> </samp></h3>\r\n\r\n<h3 style=\"text-align:justify\"><samp>B&aacute;nh Entremet l&agrave; sự kết hợp tuyệt vời giữa nhiều lớp b&aacute;nh, kem, mousse v&agrave; hương vị. Tại tiệm b&aacute;nh Atelier, những đầu bếp t&agrave;i ba đ&atilde; tạo ra những t&aacute;c phẩm nghệ thuật ẩm thực với những hương vị v&agrave; trang tr&iacute; hấp dẫn. Mỗi lớp b&aacute;nh được chế tạo v&agrave; kết hợp như một thước phim ngọt ng&agrave;o, tạo ra một trải nghiệm thị gi&aacute;c v&agrave; khẩu vị đ&aacute;ng nhớ. </samp></h3>\r\n\r\n<h3 style=\"text-align:justify\"><samp><strong>Hương vị đa dạng:</strong> </samp></h3>\r\n\r\n<h3 style=\"text-align:justify\"><samp>B&aacute;nh Entremet tại tiệm b&aacute;nh Minty đưa bạn v&agrave;o một cuộc phi&ecirc;u lưu với đủ c&aacute;c hương vị đa dạng. Từ s&ocirc; c&ocirc; la đắng ngọt, tr&aacute;i c&acirc;y tươi m&aacute;t, đến hương vị kem dịu nhẹ, mỗi lớp b&aacute;nh mang đến một trải nghiệm hương vị độc đ&aacute;o. Bạn c&oacute; thể kh&aacute;m ph&aacute; c&aacute;c loại b&aacute;nh Entremet như Lily&#39;s Valley, Daisy Sparkle, Heart to Heart, Gentle Blend,Choco Therapy, Whisper White - mỗi m&oacute;n đều c&oacute; một sự kết hợp hương vị tuyệt vời. </samp></h3>\r\n\r\n<h3 style=\"text-align:justify\"><samp><strong>H&igrave;nh dạng v&agrave; trang tr&iacute; tinh tế: </strong></samp></h3>\r\n\r\n<h3 style=\"text-align:justify\"><samp>B&aacute;nh Entremet kh&ocirc;ng chỉ quyến rũ về hương vị, m&agrave; c&ograve;n với h&igrave;nh dạng v&agrave; trang tr&iacute; tinh tế. Tại tiệm b&aacute;nh Atelier, những chiếc b&aacute;nh Entremet được chế tạo với sự tinh tế v&agrave; kh&eacute;o l&eacute;o. Những đường cong mềm mại, m&agrave;u sắc s&aacute;ng tạo v&agrave; c&aacute;c chi tiết trang tr&iacute; tinh tế&nbsp;tạo n&ecirc;n một t&aacute;c phẩm nghệ thuật ẩm thực tuyệt đẹp. Bạn sẽ kh&ocirc;ng chỉ muốn thưởng thức, m&agrave; c&ograve;n muốn ngắm nh&igrave;n những t&aacute;c phẩm n&agrave;y trước khi ch&uacute;ng tan chảy trong miệng. </samp></h3>\r\n\r\n<h3 style=\"text-align:justify\"><samp><strong>Đẳng cấp v&agrave; sự chuy&ecirc;n nghiệp:</strong> </samp></h3>\r\n\r\n<h3 style=\"text-align:justify\"><samp>Tiệm b&aacute;nh Atelier đ&atilde; tạo n&ecirc;n một thương hiệu đẳng cấp v&agrave; sự chuy&ecirc;n nghiệp trong việc l&agrave;m b&aacute;nh Entremet. Những đầu bếp tại đ&acirc;y kh&ocirc;ng chỉ l&agrave; những nghệ nh&acirc;n l&agrave;m b&aacute;nh t&agrave;i ba m&agrave; c&ograve;n l&agrave; những người nghệ sĩ. Họ đảm bảo từng chi tiết của b&aacute;nh ho&agrave;n hảo v&agrave; tỉ mỉ, v&agrave; sự chất lượng được đặt l&ecirc;n h&agrave;ng đầu. Khi bạn thưởng thức một chiếc b&aacute;nh Entremet tại Minty, bạn sẽ cảm nhận được sự tỉ mỉ v&agrave; t&acirc;m huyết m&agrave; đội ngũ đầu bếp đ&atilde; đặt v&agrave;o mỗi chiếc b&aacute;nh. </samp></h3>\r\n\r\n<h3 style=\"text-align:justify\"><samp><strong>Trải nghiệm độc đ&aacute;o:</strong> </samp></h3>\r\n\r\n<h3 style=\"text-align:justify\"><samp>B&aacute;nh Entremet kh&ocirc;ng chỉ l&agrave; một m&oacute;n tr&aacute;ng miệng th&ocirc;ng thường, m&agrave; l&agrave; một trải nghiệm độc đ&aacute;o m&agrave; bạn sẽ kh&ocirc;ng thể qu&ecirc;n. Từ việc cắt một miếng b&aacute;nh để kh&aacute;m ph&aacute; từng lớp hương vị cho đến việc thưởng thức sự kết hợp ho&agrave;n hảo của c&aacute;c th&agrave;nh phần, bạn sẽ được đắm ch&igrave;m trong một thế giới của sự ngọt ng&agrave;o v&agrave; h&agrave;i h&ograve;a. B&aacute;nh Entremet tại Atelier kh&ocirc;ng chỉ l&agrave; một m&oacute;n tr&aacute;ng miệng, m&agrave; l&agrave; một t&aacute;c phẩm nghệ thuật ẩm thực. </samp></h3>\r\n\r\n<h3 style=\"text-align:justify\"><samp><strong>Lựa chọn phong ph&uacute;:</strong> </samp></h3>\r\n\r\n<h3 style=\"text-align:justify\"><samp>Tiệm b&aacute;nh Atelier cung cấp một loạt c&aacute;c lựa chọn b&aacute;nh Entremet ph&ugrave; hợp với mọi khẩu vị v&agrave; sở th&iacute;ch. Bạn c&oacute; thể t&igrave;m thấy những b&aacute;nh với hương vị tr&aacute;i c&acirc;y tươi m&aacute;t, những b&aacute;nh s&ocirc; c&ocirc; la đậm đ&agrave;, hay những b&aacute;nh với hương vị truyền thống hoặc hiện đại. Với sự đa dạng n&agrave;y, bạn c&oacute; thể kh&aacute;m ph&aacute; v&agrave; tận hưởng những hương vị mới mẻ v&agrave; th&uacute; vị. </samp></h3>\r\n\r\n<h3 style=\"text-align:justify\"><samp>B&aacute;nh Entremet tại tiệm b&aacute;nh Atelier l&agrave; một trải nghiệm ngọt ng&agrave;o v&agrave; độc đ&aacute;o m&agrave; bạn kh&ocirc;ng thể bỏ qua. Với sự kết hợp ho&agrave;n hảo của hương vị đa dạng, h&igrave;nh dạng tinh tế v&agrave; sự chuy&ecirc;n nghiệp, mỗi chiếc b&aacute;nh Entremet l&agrave; một t&aacute;c phẩm nghệ thuật ẩm thực. </samp></h3>\r\n\r\n<h3 style=\"text-align:justify\"><samp>H&atilde;y gh&eacute; thăm tiệm b&aacute;nh Atelier v&agrave; kh&aacute;m ph&aacute; thế giới ngọt ng&agrave;o của b&aacute;nh Entremet ngay h&ocirc;m nay!</samp></h3>', 'heart2heart.jpg', '2024-04-29 09:59:25', '2024-04-29 09:59:25'),
(12, '<h2 style=\"color:#aaaaaa; font-style:italic\"><span style=\"color:#000000\"><strong><tt>Kỳ quan Tiramisu</tt></strong></span></h2>', '<h3><em><strong><tt>Tận hưởng hương vị &Yacute;</tt></strong></em></h3>', '<h3 style=\"text-align:justify\"><samp>Tiệm b&aacute;nh Atelier h&acirc;n hạnh giới thiệu đến qu&yacute; kh&aacute;ch h&agrave;ng si&ecirc;u phẩm b&aacute;nh mới: </samp></h3>\r\n\r\n<h3 style=\"text-align:justify\"><samp><strong>B&aacute;nh kem Tiramisu:&nbsp;</strong>Với những phi&ecirc;n bản độc đ&aacute;o v&agrave; hấp dẫn, Atelier mang đến cho bạn những trải nghiệm hương vị v&ocirc; c&ugrave;ng th&uacute; vị. H&atilde;y c&ugrave;ng m&igrave;nh kh&aacute;m ph&aacute; v&agrave; thưởng thức những loại b&aacute;nh Tiramisu tuyệt ngon n&agrave;y! </samp></h3>\r\n\r\n<h3 style=\"text-align:justify\"><samp><strong>Tiramisu truyền thống:</strong> Hương vị cổ điển đậm đ&agrave; Kh&aacute;m ph&aacute; hương vị cổ điển với Tiramisu truyền thống tại Atelier. B&aacute;nh được l&agrave;m từ lớp b&aacute;nh Savoiardi nh&uacute;ng c&agrave; ph&ecirc; thơm ngon, kem ph&ocirc; mai Mascarpone mềm mịn v&agrave; một ch&uacute;t hương vani tinh tế. Kết hợp tuyệt vời n&agrave;y tạo n&ecirc;n một trải nghiệm hương vị đậm đ&agrave; v&agrave; thỏa m&atilde;n những ai y&ecirc;u th&iacute;ch Tiramisu truyền thống. </samp></h3>\r\n\r\n<h3 style=\"text-align:justify\"><samp><strong>Tiramisu Chocolate:</strong> H&ograve;a quyện socola đắm say Nếu bạn l&agrave; một người y&ecirc;u th&iacute;ch s&ocirc;c&ocirc;la, h&atilde;y thử Tiramisu Chocolate tại Atelier. Với sự kết hợp tuyệt vời giữa lớp b&aacute;nh Savoiardi, kem s&ocirc; c&ocirc; la lạnh v&agrave; s&ocirc; c&ocirc; la đắng ngọt, Tiramisu Chocolate mang đến một trải nghiệm hương vị độc đ&aacute;o v&agrave; đậm đ&agrave; cho những t&iacute;n đồ s&ocirc;c&ocirc;la. </samp></h3>\r\n\r\n<h3 style=\"text-align:justify\"><samp><strong>Tiramisu Matcha:</strong> Hương vị tr&agrave; xanh tinh tế Đối với những người y&ecirc;u th&iacute;ch hương vị tr&agrave; xanh, Tiramisu Matcha l&agrave; một lựa chọn ho&agrave;n hảo. B&aacute;nh c&oacute; lớp b&aacute;nh Savoiardi nh&uacute;ng tr&agrave; xanh, kem ph&ocirc; mai Mascarpone v&agrave; bột tr&agrave; xanh tinh tế. Vị tr&agrave; xanh thơm ngon v&agrave; hương vị Tiramisu truyền thống h&ograve;a quyện th&agrave;nh một, mang đến một trải nghiệm hương vị độc đ&aacute;o cho những người y&ecirc;u th&iacute;ch tr&agrave; xanh. Nếu bạn muốn chia sẻ niềm vui v&agrave; hương vị Tiramisu Matcha với nhiều người hơn, h&atilde;y thử Tiramisu Matcha với k&iacute;ch thước 20cm. Với b&aacute;nh lớn hơn, bạn c&oacute; thể tận hưởng hương vị tuyệt vời c&ugrave;ng gia đ&igrave;nh v&agrave; bạn b&egrave; trong những dịp đặc biệt. </samp></h3>\r\n\r\n<h3 style=\"text-align:justify\"><samp>Atelier kh&ocirc;ng chỉ đảm bảo chất lượng v&agrave; sự tỉ mỉ trong từng chi tiết, m&agrave; c&ograve;n mang đến cho bạn một trải nghiệm &Yacute; đ&iacute;ch thực th&ocirc;ng qua c&aacute;c loại b&aacute;nh Tiramisu độc đ&aacute;o. Với sự s&aacute;ng tạo v&agrave; t&acirc;m huyết, Atelier đ&atilde; tạo ra những phi&ecirc;n bản Tiramisu độc đ&aacute;o v&agrave; th&uacute; vị. Từ Tiramisu truyền thống đậm đ&agrave;, Tiramisu Chocolate đắm say s&ocirc;c&ocirc;la, đến Tiramisu Matcha tinh tế d&agrave;nh cho c&aacute;c dịp đặc biệt, bạn sẽ t&igrave;m thấy những lựa chọn ph&ugrave; hợp với khẩu vị của m&igrave;nh tại Atelier. H&atilde;y gh&eacute; thăm tiệm b&aacute;nh Atelier ngay h&ocirc;m nay v&agrave; thưởng thức những chiếc b&aacute;nh Tiramisu thượng hạng độc đ&aacute;o v&agrave; ngon l&agrave;nh!</samp></h3>', '1e607c03a5d60b9a58d886a7c17b6f25.jpg', '2024-04-29 09:59:49', '2024-04-29 09:59:49');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `id_category` int(10) UNSIGNED DEFAULT NULL,
  `id_supplier` int(11) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `unit_price` float DEFAULT NULL COMMENT 'giá gốc',
  `promotion_price` float DEFAULT NULL COMMENT 'giá sale',
  `image` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL COMMENT 'đơn vị',
  `new` tinyint(4) DEFAULT 0,
  `status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `id_category`, `id_supplier`, `description`, `unit_price`, `promotion_price`, `image`, `unit`, `new`, `status`, `created_at`, `updated_at`) VALUES
(151, 'Bánh mousse chanh dây', 37, 95, NULL, '<h3>Đang cập nhật.</h3>', 60000, NULL, 'Mousse 2.jpeg', 'chiếc', 1, '', '2024-04-25 07:45:23', '2024-04-25 05:39:00'),
(153, 'Red Velvet', 37, 98, NULL, '<h3>Đang cập nhật.</h3>', 640000, 600000, 'red velvet.jpg', 'chiếc', 1, '', '2024-04-25 07:45:23', '2024-04-29 06:18:45'),
(155, 'Bánh su kem', 37, 98, NULL, '<h3>6 c&aacute;i/h&ocirc;p.</h3>', 40000, NULL, 'su kem.jpg', 'chiếc', 1, '', '2024-04-25 07:45:23', '2024-04-29 06:16:18'),
(156, 'Bánh su dai Singapore', 37, 98, NULL, '<h3>5 c&aacute;i/hộp</h3>', 55000, NULL, 'su dai.jpg', 'chiếc', 0, '', '2024-04-25 07:45:23', '2024-04-29 06:15:50'),
(157, 'Tiramisu', 37, 98, NULL, '<h3>Đang cập nhật.</h3>', 90000, NULL, 'tiramisu.jpg', 'chiếc', 1, '', '2024-04-25 07:45:23', '2024-04-29 06:01:32'),
(158, 'Bánh kem bắp mini', 36, 96, NULL, '<h3>Đang cập nhật.</h3>', 90000, NULL, 'bắp mini.jpg', 'chiếc', 1, '', '2024-04-25 07:45:23', '2024-04-29 06:02:44'),
(159, 'Bánh bento 10cm', 36, 96, NULL, '<h3>Đang cập nhật.</h3>', 160000, NULL, 'cake-ocean-1087469.jpg', 'chiếc', 1, '', '2024-04-25 07:45:23', '2024-04-29 05:40:37'),
(160, 'Bánh kem truyền thống 20cm', 36, 96, NULL, '<p>Đang cập nhật.</p>', 400000, NULL, 'Bánh kem 20cm.webp', 'chiếc', 1, '', '2024-04-25 07:45:23', '2024-04-29 05:56:51'),
(161, 'Bánh kem bắp 20cm', 36, 96, NULL, '<h3>Đang cập nhật.</h3>', 450000, NULL, 'Bắp 20cm .jpg', 'chiếc', 1, '', '2024-04-25 07:45:23', '2024-04-29 05:49:20'),
(162, 'Bánh kem truyền thống 16cm', 36, 96, NULL, '<h3>Tu&ocirc;ỉ mới vui vẻ</h3>', 300000, NULL, 'bánh kem 16cm.png', 'chiếc', 1, '', '2024-04-25 07:45:23', '2024-04-29 05:40:15'),
(163, 'Bánh kem bắp 16cm', 36, 96, NULL, '<h3>Đang cập nhật.</h3>', 320000, NULL, 'Kem bắp.webp', 'chiếc', 1, '', '2024-04-25 07:45:23', '2024-04-29 05:36:03'),
(164, 'Tiramisu Matcha 20cm', 37, 95, NULL, '<h3>Đang cập nhật.</h3>', 450000, NULL, 'tiramisu matcha.jpg', 'chiếc', 1, '', '2024-04-25 07:45:23', '2024-04-29 07:06:10'),
(165, 'Tiramisu Matcha 16cm', 37, 95, NULL, '<h3>Đang cập nhật.</h3>', 350000, NULL, 'Matcha 3.webp', 'chiếc', 1, '', '2024-04-25 07:45:23', '2024-04-29 05:35:01'),
(166, 'Tiramisu Chocolate 20cm', 46, 95, NULL, '<h3>Tiramisu Chocolate 20cm</h3>', 490000, NULL, 'Tiramisu choco.jpg', 'chiếc', 1, '', '2024-04-25 07:45:23', '2024-04-29 05:34:18'),
(167, 'Tiramisu Chocolate 16cm', 46, 95, NULL, '<h3>Đang cập nhật.</h3>', 390000, NULL, 'Tiramisu choco.jpg', 'chiếc', 1, '', '2024-04-25 07:45:23', '2024-04-29 05:33:55'),
(168, 'Tiramisu truyền thống 20cm', 41, 97, NULL, '<h3>Đang cập nhật.</h3>', 450000, NULL, 'Tiramisu truyền thống.jpg', 'chiếc', 1, '', '2024-04-25 07:45:23', '2024-04-29 05:33:31'),
(169, 'Tiramisu truyền thống 16cm', 41, 97, NULL, '<p>Đang cập nhật.</p>', 350000, NULL, 'Tiramisu truyền thống.jpg', 'chiếc', 1, '', '2024-04-25 07:45:23', '2024-04-29 05:33:14'),
(170, 'Whisper White', 36, 95, NULL, '<p>Nguy&ecirc;n liệu: Tr&agrave; b&aacute; tước, Cam v&agrave; Chocolate</p>', 540000, NULL, 'Whisper White 1.webp', 'chiếc', 1, '', '2024-04-25 07:45:23', '2024-04-29 05:32:31'),
(171, 'Choco Therapy', 36, 95, NULL, '<p>Nội dung đang cập nhật.</p>', 600000, NULL, 'Choco Therapy 1.webp', 'chiếc', 1, '', '2024-04-25 07:45:23', '2024-04-29 05:31:58'),
(172, 'Gentle Blend', 46, 95, NULL, '<p>Nguy&ecirc;n liệu: C&agrave; ph&ecirc; v&agrave; cốt dừa.</p>', 500000, NULL, 'Gentle Blend 1.webp', 'chiếc', 1, '', '2024-04-25 07:45:23', '2024-04-29 05:37:15'),
(173, 'Heart to Heart', 46, 95, NULL, '<p>Nguy&ecirc;n liệu:&nbsp;Chocolate, d&acirc;u rừng v&agrave; Vani</p>\r\n\r\n<p>&nbsp;</p>', 430000, NULL, 'heart2heart.jpg', 'chiếc', 1, '', '2024-04-25 07:45:23', '2024-04-29 05:37:33'),
(174, 'Daisy Sparkle', 37, 95, NULL, '<p>Nguy&ecirc;n liệu:&nbsp;Dừa, Ateliero&agrave;i v&agrave; chanh d&acirc;y</p>', 500000, NULL, 'Daisy 1.webp', 'chiếc', 0, '', '2024-04-25 07:45:23', '2024-04-29 05:37:59'),
(175, 'Lily\'s Valley', 48, 98, NULL, '<p>Nguy&ecirc;n liệu: Vani, anh đ&agrave;o v&agrave; d&acirc;u t&acirc;y</p>', 560000, NULL, 'Lily 1.webp', 'chiếc', 1, '', '2024-04-25 07:45:23', '2024-04-29 05:38:29');

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `link` varchar(100) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) UNSIGNED NOT NULL,
  `name_supplier` varchar(250) NOT NULL,
  `image` varchar(2000) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_1`
--

CREATE TABLE `supplier_1` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `phone` int(20) NOT NULL,
  `email` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(36, 'Bánh sinh nhật', 'Bánh sinh nhật với hương vị đặc trưng nồng nàn và ngọt ngào sẽ là món quà vô cùng thú vị và hấp dẫn để dành tặng những người mà bạn thương yêu nhân dịp sinh nhật hay những ngày lễ kỷ niệm.', NULL, '2024-04-27 15:25:34', '2024-04-28 17:11:12'),
(37, 'Bánh ngọt', 'Trong cuộc đời mỗi người đều trải qua những khoảnh khắc, những sự kiện khác nhau, mỗi một cột mốc là một dấu ấn kỷ niệm ta có mặt trên thế giới này. Banhngot.vn hân hạnh cùng bạn ghi lại những khoảnh khắc thú vị của hành trình cuộc sống qua những chiếc bánh kem sự kiện thơm ngon ngọt ngào nhất.', NULL, '2024-04-27 15:25:34', '2024-04-28 17:11:53'),
(41, 'Bánh trang trí theo yêu cầu', NULL, NULL, '2024-04-27 15:25:34', '2024-04-28 17:12:55'),
(46, 'Dịp tặng', NULL, NULL, '2024-04-27 15:25:34', '2020-05-27 15:29:56'),
(48, 'Tặng khách hàng', NULL, NULL, '2024-04-27 15:25:34', '2020-05-27 15:30:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `level` int(3) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `level`, `remember_token`, `created_at`, `updated_at`) VALUES
(17, 'Vũ Quỳnh Trang', 'vqtrang@gmail.com', '$2a$12$NIXIh1tAOZdHmv7h3iHhHO9EyiX0cI83EJvq70skoAIGk0CwtuukO', '0334712209', '123 Lê Văn Khương, Quận 12, TP.HCM', 1, '307t0h2Jvv9y1EoY340tSGSEJe2x5jhLbDtiw9Gx0SXBxodGVVcjk5Yvbq4S', '2024-04-17 12:37:00', '2020-01-11 12:37:00'),
(19, 'Nguyễn Ngọc Phát', 'nnp@gmail.com', '$2y$10$xW6Vz8Ei73hFGuPOQBsfeu.6Ovwspm7gG3tlkh6YRoPEsI5o69vra', '0341926063', 'Số 65, đường 12, khu phố 3, phường Hiệp Thành, Quận 12, TP.HCM', 1, 'pg9uQIEiULXOVdo9F7eNfDOoLQ8EvdIu9G6DIe4YoOjUGSb5BwgYeNHNMIpT', '2024-04-28 15:19:16', '2024-04-29 03:23:04'),
(20, 'Kiều Phương Nhàn', 'kpnhan.a@gmail.com', '$2y$10$tkTWqw/vDz/HIzdZF36g5efBOWwGmJGM6BBWgib867JtyA8KP6i7q', '0972658332', '12/9, Võ Văn Ngân, Linh Trung, Thủ Đức', 1, NULL, '2024-04-29 03:23:40', '2024-04-29 03:23:40'),
(21, 'Đinh Thanh Nhã', 'thanhnha.dinh@gmail.com', '$2y$10$4e5X3VRAGisiJICyF.wDqesTookXvgXaJAIHE.71f.ssqv90Ein9K', '0842019130', '414 Võ Văn Tần, phường 5, Quận 3, TP.HCM', 0, NULL, '2024-04-29 03:24:53', '2024-04-29 03:24:53'),
(22, 'Vũ Gia Khang', 'zakhang@gmail.com', '$2y$10$En9kg8072joLRIsSaz0YZOXPgLaIqILE6X9/R3n7OshsAFawumOzG', '0351923857', '90/1A, Lê Văn Việt, Trường Thọ, Quận Thủ Đức, TP.HCM', 1, NULL, '2024-04-29 03:25:19', '2024-04-29 03:25:19'),
(23, 'Hoàng Thị Kim Chi', 'chihtk@gmail.com', '$2y$10$QG/n46KA5TNU/eJp8l2vreJ4bb84BCiL378gJdeM6CfhBLmHt7JJa', '0966420071', '414 Võ Văn Tần, phường 5, Quận 3, TP.HCM', 1, NULL, '2024-04-29 03:25:50', '2024-04-29 03:25:50'),
(24, 'Nguyễn Minh Bách', 'nmbach@gmail.com', '$2y$10$Qgoq.foHhfAQ.WJmA3O/re26ePbxitizT.j1vs9eyNIXiB93HcSvq', '0819775054', '76/32/18/3B, Nguyễn Trãi, Bến Nghé, Quận 1, TP.HCM', 1, NULL, '2024-04-29 03:26:17', '2024-04-29 03:26:17'),
(25, 'Tạ Hữu Chiến', 'tahuuchien143@gmail.com', '$2y$10$o43ca41u3fZcDbJR/uzWnOFcX850oWrZwoUq3EnWOY/T6Ysfcq0/u', '0964331024', '36 Nguyễn Ư Dĩ, phường Thảo Điền, Quận Thủ Đức, TP. HCM', 0, NULL, '2024-04-29 03:26:45', '2024-04-29 03:26:45'),
(26, 'Nguyễn Hoàng An', 'nh.an76@gmail.com', '$2y$10$U6XwnaNJiDIKq5SopFgwEOo6stZxsLHY/EV65LpF5cHi54INrr5sC', '0842134686', '1230/A, Lê Quang Định, Quận Bình Thạnh, TP.HCM', 1, NULL, '2024-04-29 03:27:09', '2024-04-29 03:27:09'),
(27, 'Bùi Nguyễn Kim Ngân', 'bnkngan@gmail.com', '$2y$10$DDkrRENk3mHpuOFuiny2POwzz58W7j0nnvb47n92Q6pY160KOleHO', '0846712778', '124/89, Cách Mạng Tháng 8, phường 12, Quận 3, TP.HCM', 1, NULL, '2024-04-29 03:27:37', '2024-04-29 03:27:37'),
(28, 'Lê Thị Tâm', 'tamlt34@gmail.com', '$2y$10$VNtIzEnUT8V7Zjl4rkiS5OhmyKIqy3n5eMFgPCXuojn0.hga39B42', '0914362448', 'Trống', 1, NULL, '2024-04-29 03:28:09', '2024-04-29 03:28:09'),
(29, 'Trần Lê Hoàng Châu', 'hoangchau45@gmail.com', '$2y$10$5oVWCCqLfIFKnkEBc8RXe.kr/8wCsem0uNh/JsmVIUuPc7YcAuH2K', '0962314557', '201 Nguyễn Chí Thanh, phường 12, Quận 10, TP.HCM', 0, NULL, '2024-04-29 03:28:40', '2024-04-29 03:28:40'),
(30, 'Trần Ngọc Trúc', 'tructn@gmail.com', '$2y$10$03v3As1gWttdYfSxFGqtx.mAzb4Z1i8vw83Qqa8JTuXADKowBcIFm', '0368772501', '12/93/8, Võ Văn Ngân, Linh Trung, Thủ Đức', 1, NULL, '2024-04-29 03:29:46', '2024-04-29 03:29:46'),
(31, 'Vũ Đức Đô', 'ducdovu1122@gmail.com', '$2y$10$zpNzGzhIo4TuQ99pE9s3FuFwVvWo7Ij5ZB23BvZWI16EthYI2m3l.', '0846712994', '55 Nguyễn Du, phường Bến Nghé, Quận 1', 0, NULL, '2024-04-29 03:30:29', '2024-04-29 03:30:29'),
(32, 'Vũ Thúy Quỳnh', 'thuyquynhvu@gmail.com', '$2y$10$thjynCiaQfLzbcSKufnRdOifJJUv6i8kO50gESxKf5rfu98balqYC', '0924532721', '446 Nguyễn Thị Minh Khai, phường 5, Quận 3, TP.', 0, NULL, '2024-04-29 03:30:59', '2024-04-29 03:30:59'),
(33, 'Nguyễn Thị Ý Ngân', 'yngannt@gmail.com', '$2y$10$vT3gfrDrejAibsAECpPnUuw0/w8KVr8REQPz1qPTZwqBmpkLVVvO2', '0844527916', '55 Atelieruân Thủy, phường Thảo Điền, Quận Thủ Đức, TP.HCM', 0, NULL, '2024-04-29 03:31:41', '2024-04-29 03:31:41'),
(34, 'Lê Minh Huy', 'lmh1122@gmail.com', '$2y$10$RTy79u46qabtQp40biGrtOH06esXdIJikjjOc6loMlYfV93pgtZTi', '0954216075', 'Chung cư Cantavil An Phú, Quận Thủ Đức', 0, NULL, '2024-04-29 03:32:14', '2024-04-29 03:32:14'),
(35, 'Nguyễn Hiền Minh Trang', 'minhtranghiennguyen@gmail.com', '$2y$10$mq3GKrToTklMiBtbsmX8o.TuNb6wIhe9d1oEcenwPf.8Ik3o8I6Oq', '0306781249', '208 Nguyễn Hữu Cảnh, phường 22, Quận Bình Thạnh, TP.', 0, NULL, '2024-04-29 03:32:54', '2024-04-29 03:32:54'),
(36, 'Lê Võ Ái Phương', 'levoaiphuong@gmail.com', '$2y$10$C8CqTceHcfZCQ6XuoOue0OGFrp7ogkyTxAci9a1uq/VLwaTej02Wy', '0811942678', '206 Nguyễn Đình Chiểu, phường 6, Quận 3, TP.', 0, NULL, '2024-04-29 03:33:23', '2024-04-29 03:33:23'),
(37, 'Nguyễn Thanh', 'thanhtung81@gmail.com', '$2y$10$LTuMJKPd9WPiid5nMzBIn.KvAYGWfu3bYLiqkci2VgDa8V31P/l9q', '0335612908', '1 Nguyễn Du, phường Bến Nghé, Quận 1, TP.HCM', 0, NULL, '2024-04-29 03:35:37', '2024-04-29 03:35:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_type` (`id_type`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `import_bill`
--
ALTER TABLE `import_bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_employees` (`id_employees`),
  ADD KEY `id_import_bill_detail` (`id_import_bill_detail`);

--
-- Indexes for table `import_bill_detail`
--
ALTER TABLE `import_bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_type_product` (`id_type_product`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indexes for table `lienhe`
--
ALTER TABLE `lienhe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indexes for table `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_1`
--
ALTER TABLE `supplier_1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `import_bill`
--
ALTER TABLE `import_bill`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `import_bill_detail`
--
ALTER TABLE `import_bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lienhe`
--
ALTER TABLE `lienhe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `supplier_1`
--
ALTER TABLE `supplier_1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
