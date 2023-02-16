-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2023-02-16 17:17:24
-- 伺服器版本： 10.4.25-MariaDB
-- PHP 版本： 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `housetune`
--

-- --------------------------------------------------------

--
-- 資料表結構 `category_product`
--

CREATE TABLE `category_product` (
  `id` int(3) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `category_product`
--

INSERT INTO `category_product` (`id`, `name`) VALUES
(1, 'Sofa'),
(2, 'Chair'),
(3, 'Table'),
(4, 'Storage'),
(5, 'Bed'),
(6, 'Lighting'),
(7, 'Textile'),
(8, 'Decor'),
(9, 'Kitchenware'),
(10, 'Bathroomset');

-- --------------------------------------------------------

--
-- 資料表結構 `category_room`
--

CREATE TABLE `category_room` (
  `id` int(3) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `category_room`
--

INSERT INTO `category_room` (`id`, `name`) VALUES
(1, 'Livingroom'),
(2, 'Kitchen'),
(3, 'Bedroom'),
(4, 'Bathroom');

-- --------------------------------------------------------

--
-- 資料表結構 `chat_room`
--

CREATE TABLE `chat_room` (
  `chat_id` int(6) UNSIGNED NOT NULL,
  `reciever_id` int(6) NOT NULL,
  `sender_id` int(6) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `chat_room`
--

INSERT INTO `chat_room` (`chat_id`, `reciever_id`, `sender_id`, `timestamp`, `message`, `status`) VALUES
(10, 2, 3, '2023-02-06 23:26:37', '想請問', 1),
(11, 3, 2, '2023-02-06 23:28:01', '要問商品嗎', 1),
(12, 2, 3, '2023-02-06 23:28:49', '是的請問幾成新', 1),
(13, 3, 2, '2023-02-06 23:29:04', '大概九成', 1),
(14, 2, 3, '2023-02-06 23:29:19', '了解', 1),
(15, 1, 2, '2023-02-07 23:35:30', '你好', 1),
(16, 2, 1, '2023-02-07 23:35:44', '您好 請問需要什麼服務', 1),
(17, 1, 2, '2023-02-07 23:36:06', '想請問有關二手商場的問題', 1),
(18, 2, 1, '2023-02-07 23:36:17', '好的這邊幫您查詢', 1),
(19, 1, 2, '2023-02-07 23:36:58', '謝謝', 1),
(20, 2, 1, '2023-02-07 23:37:10', '不會 有需要再提問', 1),
(21, 2, 3, '2023-02-07 23:38:08', '請問還有存貨嗎', 1),
(22, 2, 4, '2023-02-07 23:38:49', '您好請問那個就沙發還有嗎', 1),
(23, 4, 2, '2023-02-07 23:39:00', '有的 有需要嗎', 1),
(24, 2, 4, '2023-02-07 23:39:10', '想請問價格可以商量嗎', 1),
(46, 2, 5, '2023-02-08 01:58:25', 'hello', 1),
(47, 5, 2, '2023-02-08 01:58:37', '你好呀', 1),
(54, 4, 3, '2023-02-09 22:50:07', '不好意思打擾', 1),
(55, 3, 4, '2023-02-09 22:50:25', '您好 請問有什麼事嗎', 1),
(56, 4, 3, '2023-02-09 22:50:38', '想問我之前訂的二手沙發出貨了嗎', 1),
(57, 3, 6, '2023-02-09 22:51:48', '你今天下班後有事嗎', 1),
(58, 6, 3, '2023-02-09 22:52:08', '有約了耶抱歉', 1),
(65, 26, 2, '2023-02-14 13:30:06', 'hello', 1),
(66, 1, 2, '2023-02-14 13:30:27', 'hi', 1),
(67, 2, 1, '2023-02-14 13:30:34', 'what', 1),
(68, 2, 3, '2023-02-14 13:30:54', 'aloha', 1),
(69, 2, 6, '2023-02-14 13:31:18', 'hey', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `coupon`
--

CREATE TABLE `coupon` (
  `coup_id` int(3) UNSIGNED NOT NULL,
  `coupon_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` int(6) NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_expense` int(6) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `valid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `coupon`
--

INSERT INTO `coupon` (`coup_id`, `coupon_name`, `discount`, `type`, `min_expense`, `start_date`, `end_date`, `valid`) VALUES
(1, 'HAPPYYEIN', 200, '滿額折扣', 20000, '2022-11-04 09:47:00', '2023-03-02 15:00:00', 1),
(2, 'HAPPYYEIN2', 2000, '滿額折扣', 8000, '2023-02-02 15:00:00', '2023-03-08 00:00:00', 1),
(3, 'GIFT', 1000, '滿額折扣', 30000, '2023-02-03 15:00:00', '2023-03-05 15:00:00', 1),
(4, 'FORU', 400, '滿額折扣', 30000, '2022-11-09 10:06:00', '2022-11-30 10:06:00', 1),
(5, 'FIRSTONCE', 500, '滿額折扣', 5000, '2022-11-15 10:07:00', '2022-11-18 10:07:00', 1),
(6, '1111', 1111, '滿額折扣', 30000, '2022-11-15 10:10:00', '2023-01-26 10:10:00', 1),
(7, 'HAPPYIAN', 3000, '滿額折扣', 50000, '2022-11-04 11:18:00', '2022-11-30 11:18:00', 1),
(8, '1234', 1234, '滿額折扣', 8000, '2022-11-09 03:19:00', '2022-11-30 15:23:00', 1),
(9, 'FIRSTONCE2', 1000, '滿額折扣', 20000, '2022-11-08 14:03:00', '2022-11-30 14:03:00', 1),
(10, '5566', 222, '', 5566, '2022-11-15 14:05:00', '2022-11-30 14:05:00', 1),
(11, 'FIRSTONCE3', 300, '滿額折扣', 3000, '2022-11-08 14:12:00', '2022-11-30 14:11:00', 1),
(12, '5678', 5678, '滿額折扣', 55555, '2022-11-16 14:34:00', '2022-11-30 14:35:00', 1),
(13, 'FIRST', 1111, '滿額折扣', 10000, '2022-11-15 10:30:00', '2022-12-08 10:30:00', 1),
(14, 'test123', 300, '滿額折扣', 30000, '2022-11-15 14:11:00', '2022-11-16 14:11:00', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `inspiration`
--

CREATE TABLE `inspiration` (
  `insp_id` int(6) UNSIGNED NOT NULL,
  `img` varchar(30) NOT NULL,
  `description` mediumtext NOT NULL,
  `link` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `inspiration`
--

INSERT INTO `inspiration` (`insp_id`, `img`, `description`, `link`) VALUES
(1, 'images/00.jpeg', '小小冒險家的航海風臥室', '/inspiration/detail1'),
(2, 'images/01.jpeg', '為創意孩子打造完美臥室', '/inspiration/detail2'),
(3, 'images/02.jpeg', '小小夢想家的海洋主題臥室', '/inspiration/detail3'),
(4, 'images/03.jpeg', '輕鬆又容易一起用餐', '/inspiration/detali4'),
(5, 'images/04.jpeg', '古典公寓裡的時尚廚房', '/inspiration/detail5'),
(6, 'images/05.jpeg', 'FROJERED淺竹色廚房指南', '/inspiration/detail6'),
(7, 'images/06.jpeg', 'JARSTA土耳其藍廚房指南', '/inspiration/detail7'),
(8, 'images/07.jpeg', '城市青少年的藏身窩', '/inspiration/detail8'),
(9, 'images/08.jpeg', '藏身在美麗老公寓的現代浴室', '/inspiration/detail9');

-- --------------------------------------------------------

--
-- 資料表結構 `order_detail`
--

CREATE TABLE `order_detail` (
  `ordD_id` int(6) UNSIGNED NOT NULL,
  `order_list_id` int(6) NOT NULL,
  `product_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`product_id`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `order_detail`
--

INSERT INTO `order_detail` (`ordD_id`, `order_list_id`, `product_id`) VALUES
(14, 2023000166, '{\"0\":{\"prod_id\":8,\"quantity\":9,\"shape\":\"藍色 Blue\",\"imgs\":\"Asger-1.avif,Asger-2.avif\",\"total\":17550,\"name\":\"Asger 電視櫃\",\"categoryR_name\":\"Livingroom\"}}'),
(15, 2023000167, '{\"0\":{\"prod_id\":8,\"quantity\":9,\"shape\":\"木質 Wood\",\"imgs\":\"Asger-1.avif,Asger-2.avif\",\"total\":17550,\"name\":\"Asger 電視櫃\",\"categoryR_name\":\"Livingroom\"}}'),
(16, 2023000168, '{\"0\":{\"prod_id\":19,\"quantity\":5,\"shape\":\"藍色 Blue\",\"imgs\":\"Connelly-1.avif,Connelly-2.avif\",\"total\":37500,\"name\":\"Connelly 擱架\",\"categoryR_name\":\"Livingroom\"}}'),
(17, 2023000169, '{\"0\":{\"prod_id\":9,\"quantity\":6,\"shape\":\"綠色Green\",\"imgs\":\"Aula-1.avif,Aula-2.avif\",\"total\":2400,\"name\":\"Aula 控制台桌\",\"categoryR_name\":\"Livingroom\"},\"1\":{\"prod_id\":11,\"quantity\":4,\"shape\":\"藍色 Blue\",\"imgs\":\"Belfast-1.avif,Belfast-2.avif\",\"total\":2600,\"name\":\"Belfast 擱架\",\"categoryR_name\":\"Livingroom\"}}'),
(19, 2023000172, '{\"0\":{\"quantity\":1,\"imgs\":\"Bingsta.jpg\",\"total\":2000,\"name\":\"Bingsta椅\",\"seller_id\":3},\"1\":{\"quantity\":1,\"imgs\":\"Borgeby.jpg\",\"total\":1200,\"name\":\"Borgeby桌\",\"seller_id\":3}}'),
(20, 2023000173, '{\"0\":{\"quantity\":1,\"imgs\":\"Bingsta.jpg\",\"total\":2000,\"name\":\"Bingsta椅\",\"seller_id\":3,\"seller_name\":\"李小美\"},\"1\":{\"quantity\":1,\"imgs\":\"Borgeby.jpg\",\"total\":1200,\"name\":\"Borgeby桌\",\"seller_id\":3,\"seller_name\":\"李小美\"}}'),
(22, 2023000175, '{\"0\":{\"prod_id\":2,\"quantity\":3,\"shape\":\"綠色Green\",\"imgs\":\"Abbon-1.avif,Abbon-2.avif\",\"total\":1650,\"name\":\"Abbon 儲物櫃\",\"categoryR_name\":\"Livingroom\",\"seller_id\":\"1\",\"seller_name\":\"\"},\"1\":{\"prod_id\":186,\"quantity\":3,\"shape\":\"藍色 Blue\",\"imgs\":\"Sakari-1.avif,Sakari-2.avif\",\"total\":9600,\"name\":\"Sakari 牆鉤\",\"categoryR_name\":\"Bathroom\",\"seller_id\":\"1\",\"seller_name\":\"\"}}'),
(23, 2023000176, '{\"0\":{\"prod_id\":102,\"quantity\":5,\"shape\":\"綠色Green\",\"imgs\":\"Adria-1.avif,Adria-2.avif\",\"total\":8000,\"name\":\"Adria 牆鏡\",\"categoryR_name\":\"Bedroom\",\"seller_id\":\"1\",\"seller_name\":\"\"},\"1\":{\"prod_id\":104,\"quantity\":1,\"shape\":\"藍色 Blue\",\"imgs\":\"Alana-1.avif,Alana-2.avif\",\"total\":4750,\"name\":\"Alana 全身鏡\",\"categoryR_name\":\"Bedroom\",\"seller_id\":\"1\",\"seller_name\":\"\"}}'),
(24, 2023000177, '{\"0\":{\"quantity\":1,\"imgs\":\"Bingsta.jpg\",\"total\":2000,\"name\":\"Bingsta椅\",\"seller_id\":3,\"seller_name\":\"李小美\"},\"1\":{\"quantity\":1,\"imgs\":\"Borgeby.jpg\",\"total\":1200,\"name\":\"Borgeby桌\",\"seller_id\":3,\"seller_name\":\"李小美\"},\"2\":{\"quantity\":1,\"imgs\":\"Tofteryd.jpg\",\"total\":3500,\"name\":\"Tofteryd桌\",\"seller_id\":3,\"seller_name\":\"李小美\"}}'),
(25, 2023000178, '{\"0\":{\"prod_id\":1,\"quantity\":1,\"shape\":\"藍色 Blue\",\"imgs\":\"2LG-1.avif,2LG-2.avif\",\"total\":4750,\"name\":\"2LG 扶手椅\",\"categoryR_name\":\"Livingroom\",\"seller_id\":\"1\",\"seller_name\":\"\"},\"1\":{\"prod_id\":14,\"quantity\":1,\"shape\":\"藍色 Blue\",\"imgs\":\"Branagh-1.avif,Branagh-2.avif\",\"total\":30000,\"name\":\"Branagh 沙發\",\"categoryR_name\":\"Livingroom\",\"seller_id\":\"1\",\"seller_name\":\"\"},\"2\":{\"prod_id\":17,\"quantity\":1,\"shape\":\"藍色 Blue\",\"imgs\":\"Camden-1.avif,Camden-2.avif\",\"total\":1300,\"name\":\"Camden 地墊\",\"categoryR_name\":\"Livingroom\",\"seller_id\":\"1\",\"seller_name\":\"\"}}'),
(28, 2023000181, '{\"0\":{\"quantity\":1,\"imgs\":\"Hol.jpg\",\"total\":1000,\"name\":\"Hol桌\",\"seller_id\":8,\"seller_name\":\"溫辛迪\"},\"1\":{\"quantity\":1,\"imgs\":\"Hemnes.jpg\",\"total\":4000,\"name\":\"Hemnes桌\",\"seller_id\":8,\"seller_name\":\"\"}}'),
(29, 2023000350, '{\"0\":{\"prod_id\":19,\"quantity\":1,\"shape\":\"藍色 Blue\",\"imgs\":\"Connelly-1.avif,Connelly-2.avif\",\"total\":7500,\"name\":\"Connelly 擱架\",\"categoryR_name\":\"Livingroom\",\"seller_id\":\"1\",\"seller_name\":\"\"},\"1\":{\"prod_id\":21,\"quantity\":1,\"shape\":\"藍色 Blue\",\"imgs\":\"Dione-1.avif,Dione-2.avif\",\"total\":650,\"name\":\"Dione 壁掛置物架\",\"categoryR_name\":\"Livingroom\",\"seller_id\":\"1\",\"seller_name\":\"\"}}'),
(30, 2023000351, '{\"0\":{\"quantity\":1,\"imgs\":\"Bingsta.jpg\",\"total\":2000,\"name\":\"Bingsta椅\",\"seller_id\":3,\"seller_name\":\"李小美\"},\"1\":{\"quantity\":1,\"imgs\":\"Ekero.jpg\",\"total\":5000,\"name\":\"Ekero椅\",\"seller_id\":3,\"seller_name\":\"李小美\"}}'),
(31, 2023000352, '{\"0\":{\"prod_id\":20,\"quantity\":1,\"shape\":\"藍色 Blue\",\"imgs\":\"Damien-1.avif,Damien-2.avif\",\"total\":3250,\"name\":\"Damien 櫥櫃\",\"categoryR_name\":\"Livingroom\",\"seller_id\":\"1\",\"seller_name\":\"\"},\"1\":{\"prod_id\":21,\"quantity\":1,\"shape\":\"藍色 Blue\",\"imgs\":\"Dione-1.avif,Dione-2.avif\",\"total\":650,\"name\":\"Dione 壁掛置物架\",\"categoryR_name\":\"Livingroom\",\"seller_id\":\"1\",\"seller_name\":\"\"}}'),
(32, 2023000353, '{\"0\":{\"prod_id\":10,\"quantity\":1,\"shape\":\"藍色 Blue\",\"imgs\":\"Bedford-1.avif,Bedford-2.avif\",\"total\":9250,\"name\":\"Bedford 扶手椅\",\"categoryR_name\":\"Livingroom\",\"seller_id\":\"1\",\"seller_name\":\"\"},\"1\":{\"prod_id\":14,\"quantity\":1,\"shape\":\"藍色 Blue\",\"imgs\":\"Branagh-1.avif,Branagh-2.avif\",\"total\":30000,\"name\":\"Branagh 沙發\",\"categoryR_name\":\"Livingroom\",\"seller_id\":\"1\",\"seller_name\":\"\"}}'),
(33, 2023000354, '{\"0\":{\"prod_id\":2003,\"quantity\":1,\"imgs\":\"Bingsta.jpg\",\"total\":2000,\"name\":\"Bingsta椅\",\"seller_id\":3,\"seller_name\":\"李小美\"},\"1\":{\"prod_id\":2004,\"quantity\":1,\"imgs\":\"Borgeby.jpg\",\"total\":1200,\"name\":\"Borgeby桌\",\"seller_id\":3,\"seller_name\":\"李小美\"}}'),
(34, 2023000355, '{\"0\":{\"prod_id\":5,\"quantity\":6,\"shape\":\"綠色Green\",\"imgs\":\"Anderson-1.avif,Anderson-2.avif\",\"total\":6000,\"name\":\"Anderson 櫥櫃\",\"categoryR_name\":\"Livingroom\",\"seller_id\":\"1\",\"seller_name\":\"\"},\"1\":{\"prod_id\":10,\"quantity\":1,\"shape\":\"藍色 Blue\",\"imgs\":\"Bedford-1.avif,Bedford-2.avif\",\"total\":9250,\"name\":\"Bedford 扶手椅\",\"categoryR_name\":\"Livingroom\",\"seller_id\":\"1\",\"seller_name\":\"\"}}'),
(35, 2023000356, '{\"0\":{\"prod_id\":5,\"quantity\":1,\"shape\":\"藍色 Blue\",\"imgs\":\"Anderson-1.avif,Anderson-2.avif\",\"total\":1000,\"name\":\"Anderson 櫥櫃\",\"categoryR_name\":\"Livingroom\",\"seller_id\":\"1\",\"seller_name\":\"\"},\"1\":{\"prod_id\":7,\"quantity\":1,\"shape\":\"藍色 Blue\",\"imgs\":\"Ankhara-1.avif,Ankhara-2.avif\",\"total\":980,\"name\":\"Ankhara 邊桌\",\"categoryR_name\":\"Livingroom\",\"seller_id\":\"1\",\"seller_name\":\"\"},\"2\":{\"prod_id\":8,\"quantity\":1,\"shape\":\"藍色 Blue\",\"imgs\":\"Asger-1.avif,Asger-2.avif\",\"total\":1950,\"name\":\"Asger 電視櫃\",\"categoryR_name\":\"Livingroom\",\"seller_id\":\"1\",\"seller_name\":\"\"}}'),
(36, 2023000357, '{\"0\":{\"prod_id\":10,\"quantity\":1,\"shape\":\"深灰色Gray\",\"imgs\":\"Bedford-1.avif,Bedford-2.avif\",\"total\":9250,\"name\":\"Bedford 扶手椅\",\"categoryR_name\":\"Livingroom\",\"seller_id\":\"1\",\"seller_name\":\"\"},\"1\":{\"prod_id\":16,\"quantity\":1,\"shape\":\"深灰色Gray\",\"imgs\":\"Caixa-1.avif,Caixa-2.avif\",\"total\":1400,\"name\":\"Caixa 地墊\",\"categoryR_name\":\"Livingroom\",\"seller_id\":\"1\",\"seller_name\":\"\"}}'),
(37, 2023000358, '{\"0\":{\"prod_id\":2015,\"quantity\":1,\"imgs\":\"Poang.jpg\",\"total\":7000,\"name\":\"Poang椅\",\"seller_id\":14,\"seller_name\":\"小可愛\"}}'),
(38, 2023000359, '{\"0\":{\"prod_id\":10,\"quantity\":1,\"shape\":\"深灰色Gray\",\"imgs\":\"Bedford-1.avif,Bedford-2.avif\",\"total\":9250,\"name\":\"Bedford 扶手椅\",\"categoryR_name\":\"Livingroom\",\"seller_id\":\"1\",\"seller_name\":\"\"}}'),
(39, 2023000360, '{\"0\":{\"prod_id\":2009,\"quantity\":1,\"imgs\":\"Hemnes.jpg\",\"total\":4000,\"name\":\"Hemnes桌\",\"seller_id\":8,\"seller_name\":\"溫辛迪\"},\"1\":{\"prod_id\":2010,\"quantity\":1,\"imgs\":\"Hol.jpg\",\"total\":1000,\"name\":\"Hol桌\",\"seller_id\":8,\"seller_name\":\"溫辛迪\"}}'),
(40, 2023000361, '{\"0\":{\"prod_id\":2001,\"quantity\":1,\"imgs\":\"Havbeg.jpg\",\"total\":1000,\"name\":\"Havbeg椅\",\"seller_id\":2,\"seller_name\":\"王小明\"}}'),
(41, 2023000362, '{\"0\":{\"prod_id\":2002,\"quantity\":1,\"imgs\":\"Arlk.jpg\",\"total\":2000,\"name\":\"Arlk桌\",\"seller_id\":2,\"seller_name\":\"王小明\"},\"1\":{\"prod_id\":2003,\"quantity\":1,\"imgs\":\"Bingsta.jpg\",\"total\":2000,\"name\":\"Bingsta椅\",\"seller_id\":2,\"seller_name\":\"王小明\"}}'),
(42, 2023000363, '{\"0\":{\"prod_id\":2004,\"quantity\":1,\"imgs\":\"Borgeby.jpg\",\"total\":1200,\"name\":\"Borgeby桌\",\"seller_id\":2,\"seller_name\":\"王小明\"}}'),
(43, 2023000364, '{\"0\":{\"prod_id\":2005,\"quantity\":1,\"imgs\":\"Ekero.jpg\",\"total\":5000,\"name\":\"Ekero椅\",\"seller_id\":2,\"seller_name\":\"王小明\"},\"1\":{\"prod_id\":2006,\"quantity\":1,\"imgs\":\"Gallnas.jpg\",\"total\":7000,\"name\":\"Gallnas椅\",\"seller_id\":2,\"seller_name\":\"王小明\"}}'),
(44, 2023000365, '{\"0\":{\"prod_id\":2011,\"quantity\":1,\"imgs\":\"Kivik.jpg\",\"total\":8000,\"name\":\"Kivik沙發\",\"seller_id\":2,\"seller_name\":\"王小明\"}}'),
(45, 2023000366, '{\"0\":{\"prod_id\":18,\"quantity\":1,\"shape\":\"深灰色Gray\",\"imgs\":\"Carlo-1.avif,Carlo-2.avif\",\"total\":27500,\"name\":\"Carlo 沙發床\",\"categoryR_name\":\"Livingroom\",\"seller_id\":\"1\",\"seller_name\":\"\"}}'),
(46, 2023000367, '{\"0\":{\"prod_id\":2030,\"quantity\":1,\"imgs\":\"Soderhamn.jpg\",\"total\":8000,\"name\":\"Soderhamn椅\",\"seller_id\":7,\"seller_name\":\"郝斯頓\"}}'),
(47, 2023000368, '{\"0\":{\"prod_id\":2029,\"quantity\":1,\"imgs\":\"Ekolsund.jpg\",\"total\":4000,\"name\":\"Ekolsund椅\",\"seller_id\":6,\"seller_name\":\"邱小傑\"}}'),
(48, 2023000369, '{\"0\":{\"prod_id\":1,\"quantity\":1,\"shape\":\"藍色 Blue\",\"imgs\":\"2LG-1.avif,2LG-2.avif\",\"total\":4750,\"name\":\"2LG 扶手椅\",\"categoryR_name\":\"Livingroom\",\"seller_id\":\"1\",\"seller_name\":\"\"},\"1\":{\"prod_id\":9,\"quantity\":1,\"shape\":\"藍色 Blue\",\"imgs\":\"Aula-1.avif,Aula-2.avif\",\"total\":400,\"name\":\"Aula 控制台桌\",\"categoryR_name\":\"Livingroom\",\"seller_id\":\"1\",\"seller_name\":\"\"}}'),
(49, 2023000370, '{\"0\":{\"prod_id\":10,\"quantity\":1,\"shape\":\"深灰色Gray\",\"imgs\":\"Bedford-1.avif,Bedford-2.avif\",\"total\":9250,\"name\":\"Bedford 扶手椅\",\"categoryR_name\":\"Livingroom\",\"seller_id\":\"1\",\"seller_name\":\"\"}}'),
(50, 2023000371, '{\"0\":{\"prod_id\":2029,\"quantity\":1,\"imgs\":\"Ekolsund.jpg\",\"total\":4000,\"name\":\"Ekolsund椅\",\"seller_id\":6,\"seller_name\":\"邱小傑\"}}');

-- --------------------------------------------------------

--
-- 資料表結構 `order_list`
--

CREATE TABLE `order_list` (
  `ordL_id` int(15) UNSIGNED NOT NULL,
  `seller_id` int(6) UNSIGNED NOT NULL,
  `user_id` int(6) NOT NULL,
  `price` int(6) NOT NULL,
  `couponInfo` longtext NOT NULL,
  `shippingFee` int(5) UNSIGNED NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `address` varchar(40) NOT NULL,
  `state` tinyint(2) NOT NULL,
  `note` mediumtext NOT NULL,
  `valid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `order_list`
--

INSERT INTO `order_list` (`ordL_id`, `seller_id`, `user_id`, `price`, `couponInfo`, `shippingFee`, `order_date`, `address`, `state`, `note`, `valid`) VALUES
(2023000166, 1, 2, 17350, '[{\"coup_id\":1,\"coupon_name\":\"HAPPYYEIN\",\"discount\":200,\"type\":\"滿額折扣\",\"min_expense\":20000,\"start_date\":\"2022-11-04 09:47:00\",\"end_date\":\"2022-11-30 15:00:00\",\"valid\":1}]', 0, '2023-02-04 14:51:42', '萬華區中華路二段51號,381台北市,台灣', 1, '', 1),
(2023000167, 1, 2, 17350, '[{\"coup_id\":1,\"coupon_name\":\"HAPPYYEIN\",\"discount\":200,\"type\":\"滿額折扣\",\"min_expense\":20000,\"start_date\":\"2022-11-04 09:47:00\",\"end_date\":\"2022-11-30 15:00:00\",\"valid\":1}]', 0, '2023-02-04 14:54:11', '萬華區中華路二段51號,381台北市,台灣', 3, '', 1),
(2023000168, 1, 2, 35500, '[{\"coup_id\":2,\"coupon_name\":\"HAPPYYEIN2\",\"discount\":2000,\"type\":\"滿額折扣\",\"min_expense\":8000,\"start_date\":\"2022-11-08 15:06:00\",\"end_date\":\"2022-12-22 09:48:00\",\"valid\":1}]', 0, '2023-02-04 14:54:11', '萬華區中華路二段51號,381台北市,台灣', 3, '', 1),
(2023000169, 1, 2, 5000, '[{}]', 0, '2023-02-07 22:55:51', '萬華區中華路二段51號,381台北市,台灣', 3, '', 1),
(2023000172, 3, 2, 3200, '[{\"coup_id\":1,\"coupon_name\":\"HAPPYYEIN\",\"discount\":200,\"type\":\"滿額折扣\",\"min_expense\":20000,\"start_date\":\"2022-11-04 09:47:00\",\"end_date\":\"2022-11-30 15:00:00\",\"valid\":1}]', 0, '2023-02-07 23:43:22', '萬華區中華路二段51號,381台北市,台灣', 1, '', 1),
(2023000173, 3, 2, 3200, '[{}]', 0, '2023-02-07 23:43:22', '萬華區中華路二段51號,381台北市,台灣', 1, '', 1),
(2023000175, 1, 2, 11250, '[{}]', 0, '2023-02-07 23:43:22', '萬華區中華路二段51號,381台北市,台灣', 3, '', 1),
(2023000176, 1, 2, 12550, '[{\"coup_id\":1,\"coupon_name\":\"HAPPYYEIN\",\"discount\":200,\"type\":\"滿額折扣\",\"min_expense\":20000,\"start_date\":\"2022-11-04 09:47:00\",\"end_date\":\"2022-11-30 15:00:00\",\"valid\":1}]', 0, '2023-02-07 23:43:22', '萬華區中華路二段51號,381台北市,台灣', 3, '', 1),
(2023000177, 3, 2, 6500, '[{\"coup_id\":1,\"coupon_name\":\"HAPPYYEIN\",\"discount\":200,\"type\":\"滿額折扣\",\"min_expense\":20000,\"start_date\":\"2022-11-04 09:47:00\",\"end_date\":\"2022-11-30 15:00:00\",\"valid\":1}]', 0, '2023-02-07 23:43:22', '萬華區中華路二段51號,381台北市,台灣', 1, '', 1),
(2023000178, 1, 2, 34050, '[{\"coup_id\":2,\"coupon_name\":\"HAPPYYEIN2\",\"discount\":2000,\"type\":\"滿額折扣\",\"min_expense\":8000,\"start_date\":\"2022-11-08 15:06:00\",\"end_date\":\"2022-12-22 09:48:00\",\"valid\":1}]', 0, '2023-02-10 14:38:59', '中壢區新生路二段156號,123桃園市,台灣', 1, '', 1),
(2023000181, 8, 2, 5000, '[{}]', 0, '2023-02-10 16:00:11', '中壢區新生路3段120號,312桃園市,台灣', 1, '', 1),
(2023000350, 1, 4, 6150, '[{\"coup_id\":2,\"coupon_name\":\"HAPPYYEIN2\",\"discount\":2000,\"type\":\"滿額折扣\",\"min_expense\":8000,\"start_date\":\"2022-11-08 15:06:00\",\"end_date\":\"2022-12-22 09:48:00\",\"valid\":1}]', 0, '2023-02-10 16:00:11', '中壢區新生路3段120號,312桃園市,台灣', 2, '', 1),
(2023000351, 3, 4, 7000, '[{}]', 0, '2023-02-10 16:16:54', '中壢區新生路3段120號,312桃園市,台灣', 2, '', 1),
(2023000352, 1, 4, 3900, '[{}]', 0, '2023-02-10 16:46:35', '中壢區新生路2段,321桃園市,台灣', 1, '', 1),
(2023000353, 1, 4, 39250, '[{}]', 0, '2023-02-10 16:46:35', '中壢區新生路2段,321桃園市,台灣', 2, '', 1),
(2023000354, 3, 2, 3000, '[{\"coup_id\":1,\"coupon_name\":\"HAPPYYEIN\",\"discount\":200,\"type\":\"滿額折扣\",\"min_expense\":20000,\"start_date\":\"2022-11-04 09:47:00\",\"end_date\":\"2023-03-02 15:00:00\",\"valid\":1}]', 0, '2023-02-11 18:00:17', '龜山區大寶路150號3段,123桃園市,台灣', 1, '', 1),
(2023000355, 1, 2, 15250, '[{}]', 0, '2023-02-11 18:34:37', '龜山區大寶路150號3段,123桃園市,台灣', 1, '', 1),
(2023000356, 1, 2, 3930, '[{}]', 0, '2023-02-11 18:34:37', '龜山區大寶路150號3段,123桃園市,台灣', 2, '', 1),
(2023000357, 1, 3, 8650, '[{\"coup_id\":2,\"coupon_name\":\"HAPPYYEIN2\",\"discount\":2000,\"type\":\"滿額折扣\",\"min_expense\":8000,\"start_date\":\"2023-02-02 15:00:00\",\"end_date\":\"2023-03-08 00:00:00\",\"valid\":1}]', 0, '2023-02-12 16:08:25', '中壢區新生路2段,123桃園市,台灣', 2, '', 1),
(2023000358, 14, 3, 7000, '[{}]', 0, '2023-02-12 16:08:25', '中壢區新生路2段,123桃園市,台灣', 1, '', 1),
(2023000359, 1, 2, 9050, '[{\"coup_id\":1,\"coupon_name\":\"HAPPYYEIN\",\"discount\":200,\"type\":\"滿額折扣\",\"min_expense\":20000,\"start_date\":\"2022-11-04 09:47:00\",\"end_date\":\"2023-03-02 15:00:00\",\"valid\":1}]', 0, '2023-02-12 21:04:42', '龜山區大寶路150號3段,123桃園市,台灣', 2, '', 1),
(2023000360, 8, 2, 5000, '[{}]', 0, '2023-02-12 21:04:42', '龜山區大寶路150號3段,123桃園市,台灣', 1, '', 1),
(2023000361, 2, 3, 1000, '[{}]', 0, '2023-02-12 23:41:18', ',,台灣', 1, '', 1),
(2023000362, 2, 3, 4000, '[{}]', 0, '2023-02-12 23:41:18', ',,台灣', 2, '', 1),
(2023000363, 2, 3, 1200, '[{}]', 0, '2023-02-12 23:41:18', ',,台灣', 3, '', 1),
(2023000364, 2, 3, 12000, '[{}]', 0, '2023-02-12 23:41:18', ',,台灣', 4, '', 1),
(2023000365, 2, 4, 8000, '[{}]', 0, '2023-02-12 23:41:18', ',,台灣', 4, '', 1),
(2023000366, 1, 3, 27300, '[{\"coup_id\":1,\"coupon_name\":\"HAPPYYEIN\",\"discount\":200,\"type\":\"滿額折扣\",\"min_expense\":20000,\"start_date\":\"2022-11-04 09:47:00\",\"end_date\":\"2023-03-02 15:00:00\",\"valid\":1}]', 0, '2023-02-13 09:43:01', '中立區新生路,123桃園市,台灣', 2, '', 1),
(2023000367, 7, 3, 8000, '[{}]', 0, '2023-02-13 09:43:01', '中立區新生路,123桃園市,台灣', 1, '', 1),
(2023000368, 6, 2, 4000, '[{}]', 0, '2023-02-14 09:30:06', '中立區新生路,123桃園市,台灣', 1, '', 1),
(2023000369, 1, 2, 4950, '[{\"coup_id\":1,\"coupon_name\":\"HAPPYYEIN\",\"discount\":200,\"type\":\"滿額折扣\",\"min_expense\":20000,\"start_date\":\"2022-11-04 09:47:00\",\"end_date\":\"2023-03-02 15:00:00\",\"valid\":1}]', 0, '2023-02-14 09:30:06', '中立區新生路,123桃園市,台灣', 2, '', 1),
(2023000370, 1, 2, 8250, '[{\"coup_id\":3,\"coupon_name\":\"GIFT\",\"discount\":1000,\"type\":\"滿額折扣\",\"min_expense\":30000,\"start_date\":\"2023-02-03 15:00:00\",\"end_date\":\"2023-03-05 15:00:00\",\"valid\":1}]', 0, '2023-02-14 09:30:06', '中立區新生路,123桃園市,台灣', 2, '', 1),
(2023000371, 6, 2, 4000, '[{}]', 0, '2023-02-14 09:30:06', '中立區新生路,123桃園市,台灣', 1, '', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `prod_id` int(5) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_room` int(3) NOT NULL,
  `category_product` int(3) NOT NULL,
  `style` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(3) NOT NULL,
  `price` int(6) UNSIGNED NOT NULL,
  `img` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` float(1,1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `valid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`prod_id`, `name`, `category_room`, `category_product`, `style`, `amount`, `price`, `img`, `description`, `rating`, `created_at`, `updated_at`, `valid`) VALUES
(1, '2LG 扶手椅', 1, 2, NULL, 5, 4750, '2LG-1.avif,2LG-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 20:25:11', '2022-11-17 13:56:02', 1),
(2, 'Abbon 儲物櫃', 1, 4, NULL, 0, 550, 'Abbon-1.avif,Abbon-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 20:25:24', '2022-11-17 11:56:20', 1),
(3, 'Alisma 咖啡桌', 1, 3, NULL, 10, 2050, 'Alisma-1.avif,Alisma-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 20:25:33', '2022-11-17 11:56:29', 0),
(4, 'Amrita 扶手椅', 1, 2, NULL, 8, 7500, 'Amrita-1.avif,Amrita-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 20:25:38', '2022-11-17 11:56:33', 0),
(5, 'Anderson 櫥櫃', 1, 4, NULL, 10, 1000, 'Anderson-1.avif,Anderson-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:06', '2022-11-17 11:56:40', 1),
(6, 'Angus 展示櫃', 1, 4, NULL, 0, 6250, 'Angus-1.avif,Angus-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:06', '2022-11-17 11:56:45', 1),
(7, 'Ankhara 邊桌', 1, 3, NULL, 10, 980, 'Ankhara-1.avif,Ankhara-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:31', '2022-11-17 11:56:50', 1),
(8, 'Asger 電視櫃', 1, 4, NULL, 10, 1950, 'Asger-1.avif,Asger-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:56:54', 1),
(9, 'Aula 控制台桌', 1, 3, NULL, 10, 400, 'Aula-1.avif,Aula-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:57:00', 1),
(10, 'Bedford 扶手椅', 1, 2, NULL, 10, 9250, 'Bedford-1.avif,Bedford-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:57:04', 1),
(11, 'Belfast 擱架', 1, 4, NULL, 10, 650, 'Belfast-1.avif,Belfast-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:57:09', 1),
(12, 'Betula 圖形壁架', 1, 4, NULL, 10, 1000, 'Betula-1.avif,Betula-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:57:13', 1),
(13, 'Bonnie 腳凳', 1, 2, NULL, 10, 2650, 'Bonnie-1.avif,Bonnie-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:57:17', 1),
(14, 'Branagh 沙發', 1, 1, NULL, 10, 30000, 'Branagh-1.avif,Branagh-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:57:21', 1),
(15, 'Brayla 沙發', 1, 1, NULL, 10, 6750, 'Brayla-1.avif,Brayla-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:57:24', 1),
(16, 'Caixa 地墊', 1, 8, NULL, 10, 1400, 'Caixa-1.avif,Caixa-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:57:32', 1),
(17, 'Camden 地墊', 1, 8, NULL, 10, 1300, 'Camden-1.avif,Camden-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:57:36', 1),
(18, 'Carlo 沙發床', 1, 1, NULL, 10, 27500, 'Carlo-1.avif,Carlo-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:57:39', 1),
(19, 'Connelly 擱架', 1, 4, NULL, 10, 7500, 'Connelly-1.avif,Connelly-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:57:47', 1),
(20, 'Damien 櫥櫃', 1, 4, NULL, 10, 3250, 'Damien-1.avif,Damien-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:57:42', 1),
(21, 'Dione 壁掛置物架', 1, 4, NULL, 10, 650, 'Dione-1.avif,Dione-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:58:05', 1),
(22, 'Drax 地墊', 1, 8, NULL, 10, 850, 'Drax-1.avif,Drax-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:58:20', 1),
(23, 'Elian 坐墊凳', 1, 2, NULL, 10, 1500, 'Elian-1.avif,Elian-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:58:29', 1),
(24, 'Elvi 扶手椅', 1, 2, NULL, 10, 5500, 'Elvi-1.avif,Elvi-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:58:36', 1),
(25, 'Emil 沙發床', 1, 1, NULL, 10, 11000, 'Emil-1.avif,Emil-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:58:47', 1),
(26, 'Emmi 櫥櫃', 1, 4, NULL, 10, 3250, 'Emmi-1.avif,Emmi-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:59:10', 1),
(27, 'Epicoco 地墊', 1, 8, NULL, 10, 1300, 'Epicoco-1.jpg,Epicoco-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:59:17', 1),
(28, 'Esben 沙發床', 1, 1, NULL, 10, 14000, 'Esben-1.avif,Esben-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:59:21', 1),
(29, 'Fallyn 沙發', 1, 1, NULL, 10, 18000, 'Fallyn-1.avif,Fallyn-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:59:25', 1),
(30, 'Fowler 擱架', 1, 4, NULL, 10, 4750, 'Fowler-1.avif,Fowler-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:59:28', 1),
(31, 'Frame 扶手椅', 1, 2, NULL, 10, 6750, 'Frame-1.avif,Frame-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:59:32', 1),
(32, 'Freda 地墊', 1, 8, NULL, 10, 850, 'Freda-1.avif,Freda-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:59:35', 1),
(33, 'Frederik 沙發', 1, 1, NULL, 10, 9250, 'Frederik-1.avif,Frederik-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:59:43', 1),
(34, 'Giselle 沙發', 1, 1, NULL, 10, 3190, 'Giselle-1.avif,Giselle-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:59:46', 1),
(35, 'Gus 邊角座椅', 1, 2, NULL, 10, 4250, 'Gus-1.avif,Gus-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:59:49', 1),
(36, 'Haines 電視櫃', 1, 4, NULL, 10, 8750, 'Haines-1.avif,Haines-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:59:53', 1),
(37, 'Harlow 沙發', 1, 1, NULL, 10, 17000, 'Harlow-1.avif,Harlow-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 11:59:57', 1),
(38, 'Heaton 電視櫃', 1, 4, NULL, 10, 1000, 'Heaton-1.avif,Heaton-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 12:00:01', 1),
(39, 'Herman 沙發', 1, 1, NULL, 10, 4250, 'Herman-1.avif,Herman-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 12:00:05', 1),
(40, 'Herton 沙發', 1, 1, NULL, 10, 9250, 'Herton-1.avif,Herton-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 12:00:08', 1),
(41, 'Hopkins 櫥櫃', 1, 4, NULL, 10, 3250, 'Hopkins-1.avif,Hopkins-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 12:00:12', 1),
(42, 'Irving 壁掛置物架', 1, 4, NULL, 10, 1600, 'Irving-1.avif,Irving-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 12:00:16', 1),
(43, 'Isadora 扶手椅', 1, 2, NULL, 10, 9000, 'Isadora-1.avif,Isadora-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 12:00:19', 1),
(44, 'Jacklin 邊角扶手椅', 1, 2, NULL, 10, 13000, 'Jacklin-1.jpg,Jacklin-2.jpg', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 12:00:22', 1),
(45, 'Jenson 咖啡桌', 1, 3, NULL, 10, 3500, 'Jenson-1.avif,Jenson-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 12:00:25', 1),
(46, 'Julianne 沙發', 1, 1, NULL, 10, 19950, 'Julianne-1.avif,Julianne-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 12:00:28', 1),
(47, 'Kalaspel 櫥櫃', 1, 4, NULL, 10, 12000, 'Kalaspel-1.avif,Kalaspel-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 12:00:31', 1),
(48, 'Kameli 地墊', 1, 8, NULL, 10, 420, 'Kameli-1.avif,Kameli-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 12:00:35', 1),
(49, 'Kasiani 沙發', 1, 1, NULL, 10, 18000, 'Kasiani-1.avif,Kasiani-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 12:00:38', 1),
(50, 'Tobias 扶手椅', 1, 2, NULL, 10, 12000, 'Tobias-1.avif,Tobias-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 21:42:16', '2022-11-17 12:00:41', 1),
(51, 'Acelyn 餐盤套裝', 2, 9, NULL, 10, 1600, 'Acelyn-1.avif,Acelyn-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:00:47', 1),
(52, 'Araluen 馬克杯', 2, 9, NULL, 10, 500, 'Araluen-1.avif,Araluen-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:00:51', 1),
(53, 'Areaware 桌墊', 2, 9, NULL, 10, 200, 'Areaware-1.avif,Areaware-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:00:55', 1),
(54, 'Bethan 餐盤套裝', 2, 9, NULL, 10, 1600, 'Bethan-1.avif,Bethan-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:00:59', 1),
(55, 'BigHug 圓形砧板', 2, 9, NULL, 10, 320, 'BigHug-1.avif,BigHug-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:01:03', 1),
(56, 'BOX-IT 麵包盒', 2, 9, NULL, 10, 650, 'BOX-IT-1.avif,BOX-IT-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:01:07', 1),
(57, 'Caeser 扇貝邊餐具', 2, 9, NULL, 10, 1100, 'Caeser-1.avif,Caeser-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:01:10', 1),
(58, 'Clover 相思木碗', 2, 9, NULL, 10, 500, 'Clover-1.avif,Clover-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:01:14', 1),
(59, 'Colter 垃圾桶', 2, 9, NULL, 10, 1300, 'Colter-1.avif,Colter-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:01:17', 1),
(60, 'Coombe 瀝水器', 2, 9, NULL, 10, 450, 'Coombe-1.avif,Coombe-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:01:21', 1),
(61, 'Dae 洗衣車', 2, 9, NULL, 10, 750, 'Dae-1.avif,Dae-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:01:24', 1),
(62, 'Dagget 玻璃杯', 2, 9, NULL, 10, 500, 'Dagget-1.avif,Dagget-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:01:28', 1),
(63, 'Eli 長盤', 2, 9, NULL, 10, 390, 'Eli-1.avif,Eli-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:01:31', 1),
(64, 'Enso 餐具套裝', 2, 9, NULL, 10, 1290, 'Enso-1.avif,Enso-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:01:37', 1),
(65, 'Gastro 餐盤', 2, 9, NULL, 10, 990, 'Gastro-1.avif,Gastro-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:01:45', 1),
(66, 'Grod 沙拉碗', 2, 9, NULL, 10, 450, 'Grod-1.avif,Grod-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:01:48', 1),
(67, 'Hai 餐具套裝', 2, 9, NULL, 10, 1900, 'Hai-1.avif,Hai-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:01:51', 1),
(68, 'Heather 圓形餐盤', 2, 9, NULL, 10, 490, 'Heather-1.avif,Heather-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:01:55', 1),
(69, 'Hollie 玻璃杯', 2, 9, NULL, 10, 500, 'Hollie-1.avif,Hollie-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:01:58', 1),
(70, 'Jessyka 餐盤套裝', 2, 9, NULL, 10, 1500, 'Jessyka-1.avif,Jessyka-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:02:01', 1),
(71, 'Josefina 雞尾酒吧套裝', 2, 9, NULL, 10, 390, 'Josefina-1.avif,Josefina-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:02:05', 1),
(72, 'Joss 垃圾桶', 2, 9, NULL, 10, 650, 'Joss-1.avif,Joss-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:02:08', 1),
(73, 'Juni 餐盤套裝', 2, 9, NULL, 10, 900, 'Juni-1.avif,Juni-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:02:12', 1),
(74, 'Kendra 烤盤', 2, 9, NULL, 10, 490, 'Kendra-1.avif,Kendra-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:02:18', 1),
(75, 'Krisha 餐盤套裝', 2, 9, NULL, 10, 1200, 'Krisha-1.avif,Krisha-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:02:23', 1),
(76, 'Leaf 餐墊', 2, 9, NULL, 10, 380, 'Leaf-1.avif,Leaf-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:02:26', 1),
(77, 'Liga 餐墊', 2, 9, NULL, 10, 420, 'Liga-1.avif,Liga-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:02:31', 1),
(78, 'Lillianna 餐盤套裝', 2, 9, NULL, 10, 1000, 'Lillianna-1.avif,Lillianna-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:02:34', 1),
(79, 'Limfjord 餐盤', 2, 9, NULL, 10, 390, 'Limfjord-1.avif,Limfjord-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:02:37', 1),
(80, 'Maria 餐盤', 2, 9, NULL, 10, 690, 'Maria-1.avif,Maria-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:02:40', 1),
(81, 'Moarc 餐盤套裝', 2, 9, NULL, 10, 1600, 'Moarc-1.avif,Moarc-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:02:43', 0),
(82, 'Moss 酒瓶架', 2, 9, NULL, 10, 700, 'Moss-1.avif,Moss-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:02:46', 0),
(83, 'Nelius 餐具套裝', 2, 9, NULL, 10, 1400, 'Nelius-1.avif,Nelius-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:02:49', 0),
(84, 'Reed 玻璃杯', 2, 9, NULL, 10, 260, 'Reed-1.avif,Reed-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:02:53', 0),
(85, 'Rue 餐盤套裝', 2, 9, NULL, 10, 1000, 'Rue-1.avif,Rue-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:02:56', 0),
(86, 'Sabar 餐盤套裝', 2, 9, NULL, 10, 1900, 'Sabar-1.avif,Sabar-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:02:59', 0),
(87, 'Sandvig 意大利麵碗', 2, 9, NULL, 10, 890, 'Sandvig-1.avif,Sandvig-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:03:04', 0),
(88, 'Shape 碗', 2, 9, NULL, 10, 790, 'Shape-1.avif,Shape-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:03:08', 0),
(89, 'Sodahl 餐墊', 2, 9, NULL, 10, 220, 'Sodahl-1.jpeg,Sodahl-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:03:10', 0),
(90, 'Stoned 矩形板', 2, 9, NULL, 10, 390, 'Stoned-1.avif,Stoned-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:03:13', 0),
(91, 'Sumi 餐具套裝', 2, 9, NULL, 10, 1300, 'Sumi-1.avif,Sumi-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:03:17', 0),
(92, 'Svelte 麥片碗', 2, 9, NULL, 10, 600, 'Svelte-1.avif,Svelte-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:03:20', 0),
(93, 'Sybella 餐盤套裝', 2, 9, NULL, 10, 1500, 'Sybella-1.avif,Sybella-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:03:24', 0),
(94, 'Taryn 餐盤套裝', 2, 9, NULL, 10, 1000, 'Taryn-1.avif,Taryn-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:03:28', 0),
(95, 'Thea 餐盤', 2, 9, NULL, 10, 450, 'Thea-1.avif,Thea-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:03:34', 0),
(96, 'TheAltasWorks 玻璃碗', 2, 9, NULL, 10, 240, 'TheAltasWorks-1.avif,TheAltasWorks-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:03:37', 0),
(97, 'Travel 旅行杯', 2, 9, NULL, 10, 290, 'Travel-1.avif,Travel-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:03:40', 0),
(98, 'Vora 餐具套裝', 2, 9, NULL, 10, 1100, 'Vora-1.avif,Vora-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:03:43', 0),
(99, 'Xeina 餐盤套裝', 2, 9, NULL, 10, 1300, 'Xeina-1.avif,Xeina-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:03:46', 0),
(100, 'Zaeden 餐盤套裝', 2, 9, NULL, 10, 1500, 'Zaeden-1.avif,Zaeden-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-02 22:28:08', '2022-11-17 12:03:49', 0),
(101, 'Abbon 儲物櫃', 3, 4, NULL, 10, 2900, 'Abbon-1.avif,Abbon-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-03 14:15:54', '2022-11-17 12:03:52', 1),
(102, 'Adria 牆鏡', 3, 8, NULL, 10, 1600, 'Adria-1.avif,Adria-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-03 14:15:54', '2022-11-17 12:03:55', 1),
(103, 'Adrianne 落地燈', 3, 6, NULL, 10, 2500, 'Adrianne-1.avif,Adrianne-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-03 14:15:54', '2022-11-17 12:03:59', 1),
(104, 'Alana 全身鏡', 3, 8, NULL, 10, 4750, 'Alana-1.avif,Alana-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-03 14:15:54', '2022-11-17 12:04:01', 1),
(105, 'Alexia 床單', 3, 5, NULL, 10, 350, 'Alexia-1.jpeg,Alexia-2.webp}', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-03 14:15:54', '2022-11-17 12:04:11', 1),
(106, 'Anwick 床頭板', 3, 5, NULL, 10, 3250, 'Anwick-1.webp,Anwick-2.webp}', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-03 14:15:54', '2022-11-17 12:04:17', 1),
(107, 'Arles 全身鏡', 3, 8, NULL, 10, 3750, 'Arles-1.avif,Arles-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-03 14:15:54', '2022-11-17 12:04:21', 1),
(108, 'Arles 牆鏡', 3, 8, NULL, 10, 2200, 'Arles-1.webp,Arles-2.jpg}', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-03 14:15:54', '2022-11-17 12:04:24', 1),
(109, 'Arles-rectangle 長方鏡', 3, 8, NULL, 10, 1900, 'Arles-rectangle-1.webp,Arles-rectangle-2.jpg}', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-03 14:15:54', '2022-11-17 12:04:26', 1),
(110, 'Asano 全身鏡', 3, 8, NULL, 10, 4500, 'Asano-1.webp,Asano-2.webp}', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-03 14:15:54', '2022-11-17 12:04:30', 1),
(111, 'Bex 圓鏡', 3, 8, NULL, 10, 650, 'Bex-1.avif,Bex-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-03 14:15:54', '2022-11-17 12:04:33', 1),
(112, 'Bree 落地燈', 3, 6, NULL, 10, 2100, 'Bree-1.avif,Bree-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-03 14:15:54', '2022-11-17 12:04:37', 1),
(113, 'Brisa 枕套', 3, 5, NULL, 10, 450, 'Brisa-1.jpeg,Brisa-2.webp}', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-03 14:15:54', '2022-11-17 12:04:40', 1),
(114, 'Brisa-bedsheet 床單', 3, 5, NULL, 10, 1100, 'Brisa-bedsheet-1.jpeg,Brisa-bedsheet-2.webp}', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-03 14:15:54', '2022-11-17 12:04:43', 1),
(115, 'Burle 床頭板', 3, 5, NULL, 10, 2350, 'Burle-1.avif,Burle-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-03 14:15:54', '2022-11-17 12:04:46', 1),
(116, 'Burley 羊毛毯', 3, 7, NULL, 10, 600, 'Burley-1.avif,Burley-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-03 14:15:54', '2022-11-17 12:04:49', 1),
(117, 'Camden 地毯', 3, 8, NULL, 10, 5750, 'Camden-1.jpeg,Camden-2.jpg}', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-03 14:15:54', '2022-11-17 12:04:52', 1),
(118, 'Cille 屏風', 3, 8, NULL, 10, 1710, 'Cille-1.avif,Cille-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-03 14:15:54', '2022-11-17 12:04:56', 1),
(119, 'Damien 衣櫃', 3, 4, NULL, 10, 5250, 'Damien-1.webp,Damien-2.webp}', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-03 14:15:54', '2022-11-17 12:04:59', 1),
(120, 'Drax 地毯', 3, 8, NULL, 10, 2200, 'Drax-1.avif,Drax-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-03 14:15:54', '2022-11-17 12:05:02', 1),
(121, 'Ebro 儲物櫃', 3, 4, NULL, 10, 4500, 'Ebro-1.webp,Ebro-2.webp}', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-03 14:15:54', '2022-11-17 12:05:05', 1),
(122, 'Ebro 化妝台', 3, 4, NULL, 10, 3500, 'Ebro-1.avif,Ebro-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-03 14:15:54', '2022-11-17 12:11:13', 1),
(123, 'Epicoco 地毯', 3, 8, NULL, 10, 4750, 'Epicoco-1.jpeg,Epicoco-2.webp}', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-03 14:15:54', '2022-11-17 12:05:09', 1),
(124, 'Fishes 畫像', 3, 8, NULL, 10, 500, 'Fishes-1.avif,Fishes-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-03 14:15:54', '2022-11-17 12:05:12', 1),
(125, 'Freda 地毯', 3, 8, NULL, 10, 2200, 'Freda-1.jpeg,Freda-2.jpg}', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-03 14:15:54', '2022-11-17 12:05:15', 1),
(126, 'Fresia 床頭板', 3, 5, NULL, 10, 2500, 'Fresia-1.webp,Fresia-2.jpg}', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 00:03:20', '2022-11-17 12:05:18', 1),
(127, 'Globe 吊燈', 3, 6, NULL, 10, 950, 'Globe-1.webp,Globe-2.webp}', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 00:12:54', '2022-11-17 12:05:21', 1),
(128, 'Holt 地毯', 3, 8, NULL, 10, 3750, 'Holt-1.jpeg,Holt-2.webp}', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 00:12:54', '2022-11-17 12:05:24', 1),
(129, 'Hopkins 儲物櫃', 3, 4, NULL, 10, 2200, 'Hopkins-1.avif,Hopkins-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 00:12:54', '2022-11-17 12:05:26', 1),
(130, 'Julius 靠枕', 3, 5, NULL, 10, 350, 'Julius-1.jpeg,Julius-2.webp}', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 00:12:54', '2022-11-17 12:05:29', 1),
(131, 'Kano 平台床', 3, 5, NULL, 10, 7750, 'Kano-1.webp,Kano-2.webp}', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 00:12:54', '2022-11-17 12:05:33', 1),
(132, 'Kilby 床頭櫃', 3, 4, NULL, 10, 3750, 'Kilby-1.webp,Kilby-2.webp}', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 00:24:11', '2022-11-17 12:05:37', 1),
(133, 'Klara 被單', 3, 5, NULL, 10, 850, 'Klara-1.avif,Klara-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 00:24:11', '2022-11-17 12:05:40', 1),
(134, 'Lavelle 平台床', 3, 5, NULL, 10, 7900, 'Lavelle-1.avif,Lavelle-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 00:24:11', '2022-11-17 12:05:43', 1),
(135, 'llaria 吊燈', 3, 8, NULL, 10, 3750, 'llaria-1.avif,llaria-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 00:24:11', '2022-11-17 12:05:46', 1),
(136, 'Makele 地毯', 3, 8, NULL, 10, 2900, 'Makele-1.jpeg,Makele-2.jpg}', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 00:24:11', '2022-11-17 12:05:49', 1),
(137, 'Masako 吊燈', 3, 6, NULL, 10, 1400, 'Masako-1.avif,Masako-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 00:24:11', '2022-11-17 12:05:54', 1),
(138, 'Meiko 平台床', 3, 5, NULL, 10, 7750, 'Meiko-1.webp,Meiko-2.webp}', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 00:24:11', '2022-11-17 12:05:57', 1),
(139, 'Mika 吊燈', 3, 6, NULL, 10, 2500, 'Mika-1.avif,Mika-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 00:24:11', '2022-11-17 12:06:00', 1),
(140, 'Noorali 梳妝台', 3, 3, NULL, 10, 4750, 'Noorali-1.avif,Noorali-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 00:24:11', '2022-11-17 12:06:02', 1),
(141, ' Nyro 壁燈', 3, 6, NULL, 10, 650, 'Nyro-1.avif,Nyro-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 00:24:11', '2022-11-17 12:06:05', 1),
(142, 'Ogilvy 壁燈', 3, 6, NULL, 10, 500, 'Ogilvy-1.avif,Ogilvy-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 00:24:11', '2022-11-17 12:06:08', 1),
(143, 'Oro 吊燈', 3, 6, NULL, 10, 400, 'Oro-1.avif,Oro-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 00:24:11', '2022-11-17 12:06:11', 1),
(144, 'Otilia 平台床', 3, 5, NULL, 10, 7250, 'Otillia-1.webp,Otillia-2.jpg}', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 00:24:11', '2022-11-17 12:06:14', 1),
(145, 'Parton 全身鏡', 3, 8, NULL, 10, 3750, 'Parton-1.avif,Parton-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 00:24:11', '2022-11-17 12:06:18', 1),
(146, 'Pavia 床頭櫃', 3, 4, NULL, 10, 5950, 'Pavia-1.jpeg,Pavia-2.jpg}', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 00:24:11', '2022-11-17 12:06:21', 1),
(147, 'Pavia-white 床頭櫃', 3, 4, NULL, 10, 1900, 'Pavia-white-1.webp,Pavia-white-2.jpg}', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 00:24:11', '2022-11-17 12:06:26', 1),
(148, 'Skye 平台床', 3, 5, NULL, 10, 8500, 'Skye-1.webp,Skye-2.webp}', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 00:24:11', '2022-11-17 12:06:29', 1),
(149, 'Tacoma 平台床', 3, 5, NULL, 10, 12000, 'Tacoma-1.webp,Tacoma-2.jpg}', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 00:24:11', '2022-11-17 12:06:32', 1),
(150, 'Vetro 桌燈', 3, 6, NULL, 10, 550, 'vetro-1.avif,vetro-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 00:24:11', '2022-11-17 12:06:36', 1),
(151, 'Aerial 置物架', 4, 3, NULL, 10, 1100, 'Aerial-1.avif,Aerial-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 09:50:08', '2022-11-17 12:06:38', 0),
(152, 'Albus 洗衣籃', 4, 4, NULL, 10, 1000, 'Albus-1.avif,Albus-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 09:50:08', '2022-11-17 12:06:41', 1),
(153, 'Alfa 洗衣籃', 4, 4, NULL, 10, 1000, 'Alfa-1.avif,Alfa-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 09:50:08', '2022-11-17 12:06:44', 1),
(154, 'Bask 洗衣籃', 4, 4, NULL, 10, 420, 'Bask-1.avif,Bask-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 09:50:08', '2022-11-17 12:06:48', 1),
(155, 'Belfast 置物架', 4, 3, NULL, 10, 650, 'Belfast-1.avif,Belfast-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 09:50:08', '2022-11-17 12:06:51', 1),
(156, 'Benjamin 化妝鏡', 4, 8, NULL, 10, 2200, 'Benjamin-1.avif,Benjamin-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 09:50:08', '2022-11-17 12:06:54', 1),
(157, 'Betula 置物架', 4, 3, NULL, 10, 1000, 'Betula-1.avif,Betula-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 09:50:08', '2022-11-17 12:07:01', 1),
(158, 'Bran 廁紙架', 4, 3, NULL, 10, 500, 'Bran-1.avif,Bran-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 09:50:08', '2022-11-17 12:07:05', 1),
(159, 'Brees 洗衣籃', 4, 4, NULL, 10, 1100, 'Brees-1.avif,Brees-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 09:50:08', '2022-11-17 12:07:09', 1),
(160, 'Calypso 置物架', 4, 3, NULL, 10, 320, 'Calypso-1.avif,Calypso-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 09:50:08', '2022-11-17 12:07:11', 1),
(161, 'Cam 洗衣籃', 4, 4, NULL, 10, 850, 'Cam-1.avif,Cam-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 09:50:08', '2022-11-17 12:07:14', 1),
(162, 'Cubett 置物架', 4, 3, NULL, 10, 1000, 'Cubett-1.avif,Cubett-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 09:50:08', '2022-11-17 12:07:19', 1),
(163, 'Dione 置物架', 4, 3, NULL, 10, 350, 'Dione-1.avif,Dione-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 09:50:08', '2022-11-17 12:07:22', 1),
(164, 'Eddie 洗衣籃', 4, 4, NULL, 10, 650, 'Eddie-1.avif,Eddie-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 09:50:08', '2022-11-17 12:07:25', 1),
(165, 'Elori 衛浴組合', 4, 10, NULL, 10, 350, 'Elori-1.avif,Elori-1.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:07:28', 1),
(166, 'Espa 置物架', 4, 3, NULL, 10, 500, 'Espa-1.avif,Espa-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:07:30', 1),
(167, 'Fiske 衛浴組合', 4, 10, NULL, 10, 650, 'Fiske-1.avif,Fiske-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:07:33', 1),
(168, 'Hadid 洗衣籃', 4, 4, NULL, 10, 1750, 'Hadid-1.avif,Hadid-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:07:38', 1),
(169, 'Havana 洗衣籃', 4, 4, NULL, 10, 1000, 'Havana-1.avif,Havana-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:07:41', 1),
(170, 'Holgate 洗衣籃', 4, 4, NULL, 10, 850, 'Holgate-1.avif,Holgate-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:07:45', 1),
(171, 'Huldra 化妝鏡', 4, 8, NULL, 10, 1300, 'Huldra-1.avif,Huldra-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:07:48', 1),
(172, 'Ickra 洗衣籃', 4, 4, NULL, 10, 700, 'Ickra-1.avif,Ickra-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:07:52', 1),
(173, 'Kespa 洗衣籃', 4, 4, NULL, 10, 700, 'Kespa-1.jpg,Kespa-2.jpg}', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:10:06', 1),
(174, 'Kurino 洗衣籃', 4, 4, NULL, 10, 550, 'Kurino-1.avif,Kurino-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:10:12', 1),
(175, 'Leyla 化妝鏡', 4, 8, NULL, 10, 1300, 'Leyla-1.avif,Leyla-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:10:15', 1),
(176, 'Lilo 衛浴組合', 4, 10, NULL, 10, 500, 'Lilo-1.avif,Lilo-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:10:18', 1),
(177, 'Lovise 洗衣籃', 4, 4, NULL, 10, 1400, 'Lovise-1.avif,Lovise-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:10:21', 1),
(178, 'Maxine 置物架', 4, 3, NULL, 10, 1300, 'Maxine-1.avif,Maxine-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:10:24', 1),
(179, 'Moss 洗衣籃', 4, 4, NULL, 10, 650, 'Moss-1.avif,Moss-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:10:27', 1),
(180, 'Nelly 洗衣籃', 4, 4, NULL, 10, 850, 'Nelly-1.avif,Nelly-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:10:31', 1),
(181, 'No.1 肥皂架', 4, 10, NULL, 10, 190, 'No.1-1.avif,No.1-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:10:34', 1),
(182, 'Nova 皂液機', 4, 10, NULL, 10, 290, 'Nova-1.avif,Nova-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:10:37', 1),
(183, 'Otten 洗衣籃', 4, 4, NULL, 10, 420, 'Otten-1.avif,Otten-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:10:40', 1),
(184, 'Raven 洗衣籃', 4, 4, NULL, 10, 900, 'Raven-1.jpg,Raven-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:10:45', 1),
(185, 'Rurick 置物架', 4, 3, NULL, 10, 500, 'Rurick-1.avif,Rurick-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:10:49', 1),
(186, 'Sakari 牆鉤', 4, 8, NULL, 10, 3200, 'Sakari-1.avif,Sakari-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:10:52', 1),
(187, 'Samson 毛巾架', 4, 10, NULL, 10, 1100, 'Samson-1.avif,Samson-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:10:55', 1),
(188, 'Soller 洗衣籃', 4, 4, NULL, 10, 850, 'Soller-1.avif,Soller-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:10:58', 1),
(189, 'Stria 化妝鏡', 4, 4, NULL, 10, 2000, 'Stria-1.avif,Stria-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:11:01', 1),
(190, 'Toro 洗衣籃', 4, 4, NULL, 10, 500, 'Toro-1.avif,Toro-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:11:04', 1),
(191, 'Turaco 毛巾架', 4, 10, NULL, 10, 700, 'Turaco-1.avif,Turaco-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:11:07', 1),
(192, 'Zenia 毛巾架', 4, 10, NULL, 10, 350, 'Zenia-1.avif,Zenia-2.avif', '▪ 尺寸材料皆可客製\r\n▪ 客製化商品不開放線上選購', 0.0, '2022-11-04 11:42:08', '2022-11-17 12:11:09', 0),
(193, 'BLAVINGAD藍鯨填充玩具', 3, 8, NULL, 4, 749, 'whaletoy-1.jpeg,whaletoy-2.jpeg', '大鯨魚的咀巴可以張開，讓小朋友把睡衣和他們的珍寶統統放進去。 它是小朋友的真正朋友，為他們保守秘密，跟他們玩耍，有需要時更加可以擁抱它，靠枕芯的再生聚酯纖維，拾獲自沿海至內陸50公里範圍內的塑膠廢料再生而成。', 0.9, NULL, NULL, 1),
(194, 'BLAVINGAD鯨魚圖案單人被套組', 3, 5, NULL, 3, 599, 'whalebed-1.webp,whalebed-2.webp', '棉質材質能吸收並帶走濕氣，讓身體感覺舒適、乾爽，而且有恆溫效果，小朋友可以一夜好眠，密織棉用在你小朋友的皮膚上，感覺柔軟清爽，是為美夢和酣睡而打造。', 0.0, NULL, NULL, 1),
(195, 'KURA松木翻轉式兒童床', 3, 5, NULL, 5, 8990, 'kurabed-1.webp,kurabed-2.webp', '適合年紀較小的兒童使用，還能隨著成長而變換；等孩子長大一些，可翻轉使用，立即打造遊戲和休閒空間，將床上下顛倒放置，矮床立即變成高床。', 0.0, NULL, NULL, 1),
(196, 'BLAVINGAD海豚填充玩具', 3, 8, NULL, 3, 299, 'dolphintoy-1.webp,dolphintoy-2.webp', '你知道海豚是透過吹口哨和卡嗒聲相互溝通的嗎？ 這個海豚填充玩具或能為你的小朋友講述關於奇妙海底世界的故事，希望他們可以細心聆聽，我們知道這些絨毛玩具會陪伴小朋友很多年的時光，所以我們只會挑選最舒適的物料、繡花眼睛和經過多次嚴格的洗滌情序，只有這樣做，才可保證沒有殘留有毒化學品損害小朋友的健康。', 0.0, NULL, NULL, 1),
(197, 'BLAVINGAD章魚靠枕套', 3, 8, NULL, 4, 249, 'octopus-1.webp,octopus-2.webp', '這條可愛又笑口常開的章魚，橡膠材質，印在靠枕上，打造立體效果；至於靠枕柔軟面料，則來自沿海岸線拾獲的塑膠廢料生成的再生聚酯纖維製造，兒童產品的拉鍊皆無拉鍊頭，可確保幼兒安全，讓年紀較大的兒童輕鬆拉開。', 0.0, NULL, NULL, 1),
(198, 'BLAVINGAD章魚填充玩具', 3, 8, NULL, 4, 499, 'octopustoy-1.webp,octopustoy-2.webp', '你知道章魚最愛躲藏在海底洞穴和沙泥底下嗎？ 跟這個友善的朋友玩捉迷藏或握握手，必定更加有趣，靠枕芯的再生聚酯纖維，拾獲自沿海至內陸50公里範圍內的塑膠廢料再生而成，所有絨毛玩具都能給你舒適的擁抱，也可以安撫情緒，好玩又可愛；且通過安全認證，值得信賴。', 0.0, NULL, NULL, 1),
(199, 'BLAVINGAD彩色釣魚玩具', 3, 8, NULL, 3, 439, 'fishinggame-1.webp,fishinggame-2.webp', '尊重和保護海洋世界的生物非常重要。 這個釣魚遊戲讓小朋友把垃圾放入廢料格，將海洋生物放回水中。 既有趣又富教育意義，成人小朋友一樣合適，富有教育意義的傳統遊戲，讓小朋友了解保護海洋免受污染對我們的未來有多重要，這個遊戲可以幫助發展專注力、肌肉運動和社交能力。', 0.0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `rating`
--

CREATE TABLE `rating` (
  `ratP_id` int(3) UNSIGNED NOT NULL,
  `product_id` int(6) NOT NULL,
  `user_id` int(6) NOT NULL,
  `stars` int(1) NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `rating`
--

INSERT INTO `rating` (`ratP_id`, `product_id`, `user_id`, `stars`, `comment`, `posted_at`) VALUES
(1, 2001, 6, 4, '除了電視還可以放很多小物，好用', '2022-10-01 00:44:23'),
(2, 2002, 8, 3, '質地太硬，普普', '2022-10-03 16:14:26'),
(3, 2003, 1, 5, '面積非常大可以舖整個客廳，讚！', '2022-10-03 23:01:01'),
(4, 2004, 5, 5, '一下班就攤在這椅子上，很舒服', '2022-10-04 09:47:44'),
(5, 2005, 16, 4, '隔熱好，可以裝熱湯但容量有點小', '2022-10-06 19:18:06'),
(6, 2006, 5, 3, '滿有設計感但只適合裝冰飲', '2022-10-08 12:47:34'),
(7, 2007, 2, 5, '用了洗碗精還是洗不乾淨，不推', '2022-10-08 13:11:11'),
(8, 2008, 2, 5, '一家人用剛剛好，拍起照也好看', '2022-10-08 13:14:59'),
(9, 2009, 19, 4, '很可愛的碗，用了之後孩子比較願意吃早餐', '2022-10-10 10:53:24'),
(10, 2010, 14, 4, '適合當閱讀燈但太重不好移動', '2022-10-11 08:17:28'),
(11, 2027, 13, 4, '每次給皂量很剛好，可惜容量不夠大，很快就要補充', '2022-10-16 15:35:08'),
(12, 2028, 7, 3, '容量超大能放下所有衣服，但門開起來卡卡的', '2022-10-17 07:31:49'),
(13, 2029, 25, 2, '太容易掉毛，不要買', '2022-10-18 14:49:03'),
(14, 2030, 25, 4, '小孩說很亮，看書很方便', '2022-10-20 09:55:48'),
(15, 2031, 22, 5, '就普通洗衣籃，可買可不買', '2022-10-20 10:01:15'),
(16, 157, 14, 4, '多用途，放客廳餐廳房間都合理', '2022-10-21 18:18:18'),
(17, 139, 17, 5, '裝在餐桌上整個像高級餐廳！', '2022-10-23 16:25:48'),
(18, 1, 15, 2, '負重太低', '2022-10-27 10:03:26'),
(19, 13, 31, 4, '高度剛好，適合放在沙房前架腳', '2022-10-30 08:12:16'),
(20, 3, 29, 5, '長寬剛好，不會太佔空間', '2022-10-31 15:18:31'),
(21, 1, 2, 2, '我家貓主子不愛，差評', '2022-11-01 19:28:31'),
(22, 47, 39, 1, '門關不緊，上次害我碗盤掉下來打破，還敢賣那麼貴', '2022-11-02 23:21:55'),
(23, 1, 4, 3, '造型滿可愛的', '2022-11-02 23:30:35'),
(24, 74, 37, 5, '容積超大，連肋排都能烤，讚', '2022-11-03 10:00:05'),
(25, 72, 32, 4, '有點輕，稍微撞到一下就會倒', '2022-11-05 19:40:55'),
(26, 77, 26, 3, 'Just elegant, nothing special', '2022-11-06 07:07:07'),
(27, 104, 3, 2, '太貴了cp值不高', '2022-11-06 08:10:43'),
(28, 188, 40, 1, '空籃子就太重了，加上髒衣服我一個弱女子根本抬不動', '2022-11-07 20:43:25'),
(29, 186, 28, 5, '黏著力夠強，推', '2022-11-08 11:35:16'),
(30, 105, 27, 5, '質地柔軟，舒服', '2022-11-10 15:30:45'),
(2004, 9, 2, 5, '太神拉 神奇控台桌', '2023-02-10 14:00:51'),
(2007, 19, 2, 5, '讚!', '2023-02-14 14:15:51');

-- --------------------------------------------------------

--
-- 資料表結構 `used_product`
--

CREATE TABLE `used_product` (
  `useP_id` int(6) UNSIGNED NOT NULL,
  `seller_id` int(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `category_room` int(3) NOT NULL,
  `category_product` int(3) NOT NULL,
  `amount` int(3) NOT NULL,
  `description` mediumtext NOT NULL,
  `original_price` int(6) NOT NULL,
  `price` int(6) NOT NULL,
  `img` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `bought_in` year(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `valid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `used_product`
--

INSERT INTO `used_product` (`useP_id`, `seller_id`, `name`, `category_room`, `category_product`, `amount`, `description`, `original_price`, `price`, `img`, `bought_in`, `created_at`, `updated_at`, `valid`) VALUES
(2004, 2, 'Borgeby桌', 1, 3, 1, '商品完整，狀況良好', 7600, 1200, 'Borgeby.jpg', 2006, '2022-11-04 15:17:27', '0000-00-00 00:00:00', 0),
(2005, 2, 'Ekero椅', 3, 2, 1, '椅墊的回彈性和舒適感經得起日常使用，且耐用多年。', 7000, 5000, 'Ekero.jpg', 2021, '2022-11-04 15:23:13', '0000-00-00 00:00:00', 0),
(2006, 2, 'Gallnas椅', 1, 2, 1, '椅墊的回彈性和舒適感經得起日常使用，且耐用多年。', 10000, 7000, 'Gallnas.jpg', 2016, '2022-11-04 15:23:48', '2022-11-14 23:01:33', 0),
(2007, 2, 'Gistad椅', 1, 2, 1, '椅墊的回彈性和舒適感經得起日常使用，且耐用多年。', 12000, 6000, 'Gistad.jpg', 2008, '2022-11-04 15:23:48', '0000-00-00 00:00:00', 0),
(2008, 2, 'Glostad沙發', 1, 1, 1, '椅墊的回彈性和舒適感經得起日常使用，且耐用多年。', 13000, 6000, 'Glostad.jpg', 2009, '2022-11-04 15:26:04', '0000-00-00 00:00:00', 0),
(2009, 2, 'Hemnes桌', 1, 3, 1, '商品完整，狀況良好', 7600, 4000, 'Hemnes.jpg', 2018, '2022-11-04 15:26:57', '0000-00-00 00:00:00', 0),
(2010, 2, 'Hol桌', 1, 3, 1, '商品完整，狀況良好', 4600, 1000, 'Hol.jpg', 2005, '2022-11-04 15:27:44', '2022-11-14 23:01:57', 1),
(2012, 2, 'Klippan沙發', 1, 1, 1, '商品完整，狀況良好', 13000, 10000, 'Klippan.jpg', 2018, '2022-11-04 15:29:25', '0000-00-00 00:00:00', 1),
(2013, 2, 'Landskrona沙發', 1, 1, 1, '商品完整，狀況良好', 13000, 7000, 'Landskrona.jpg', 2017, '2022-11-04 15:30:07', '0000-00-00 00:00:00', 1),
(2014, 2, 'Liatrop桌', 1, 3, 1, '商品完整，狀況良好', 7600, 2000, 'Liatrop.jpg', 2007, '2022-11-04 15:30:46', '0000-00-00 00:00:00', 1),
(2015, 2, 'Poang椅', 1, 2, 1, '椅墊的回彈性和舒適感經得起日常使用，且耐用多年。', 10000, 7000, 'Poang.jpg', 2023, '2022-11-04 15:31:31', '0000-00-00 00:00:00', 1),
(2016, 2, 'Remsta椅', 1, 2, 1, '椅墊的回彈性和舒適感經得起日常使用，且耐用多年。', 9000, 3000, 'Remsta.jpg', 2005, '2022-11-04 15:32:41', '0000-00-00 00:00:00', 0),
(2017, 2, 'Strandmon椅', 1, 2, 1, '椅墊的回彈性和舒適感經得起日常使用，且耐用多年。', 8000, 7000, 'Strandmon.jpg', 2020, '2022-11-04 15:33:28', '0000-00-00 00:00:00', 1),
(2018, 2, 'Vimle沙發', 1, 1, 1, '商品完整，狀況良好', 16000, 8000, 'Vimle.jpg', 2015, '2022-11-04 15:34:11', '0000-00-00 00:00:00', 1),
(2019, 2, 'Viskabacka椅', 1, 2, 1, '椅墊的回彈性和舒適感經得起日常使用，且耐用多年。', 13000, 11000, 'Viskabacka.jpg', 2020, '2022-11-04 15:34:41', '0000-00-00 00:00:00', 1),
(2020, 2, 'Vittsjo桌', 2, 3, 1, '商品完整，狀況良好', 10000, 8000, 'Vittsjo.jpg', 2009, '2022-11-04 15:35:26', '0000-00-00 00:00:00', 0),
(2022, 2, 'Norden桌', 2, 3, 1, '商品完整，狀況良好', 5000, 3000, 'Norden.jpg', 2012, '2022-11-11 15:01:11', '2022-11-11 15:01:11', 1),
(2023, 2, 'Barsviken桌', 2, 3, 1, '商品完整，狀況良好', 7600, 8000, 'Barsviken.jpg', 2013, '2022-11-11 15:06:05', '2022-11-11 15:06:05', 1),
(2024, 2, 'Kallhall桌', 2, 3, 1, '商品完整，狀況良好', 8000, 3000, 'Kallhall.jpg', 2014, '2022-11-11 15:07:23', '2022-11-11 15:07:23', 1),
(2025, 2, 'Danderyd桌 ', 2, 3, 1, '商品完整，狀況良好', 13000, 5000, 'Danderyd.jpg', 2015, '2022-11-11 15:08:05', '2022-11-11 15:08:05', 1),
(2026, 2, 'Ingatorp桌', 2, 3, 1, '商品完整，狀況良好', 8000, 4000, 'Ingatorp.jpg', 2016, '2022-11-11 15:09:09', '2022-11-14 23:01:15', 1),
(2027, 4, 'Friheten沙發', 2, 1, 1, '椅墊的回彈性和舒適感經得起日常使用，且耐用多年。', 13000, 10000, 'Friheten.jpg', 2017, '2022-11-11 15:10:00', '2022-11-11 15:10:00', 1),
(2028, 5, 'Vrestorp沙發', 2, 1, 1, '椅墊的回彈性和舒適感經得起日常使用，且耐用多年。', 14000, 6000, 'Vrestorp.jpg', 2018, '2022-11-11 15:10:46', '2022-11-11 15:10:46', 1),
(2029, 6, 'Ekolsund椅', 3, 2, 1, '椅墊的回彈性和舒適感經得起日常使用，且耐用多年。', 7600, 4000, 'Ekolsund.jpg', 2016, '2022-11-11 15:12:37', '2022-11-11 15:12:37', 1),
(2030, 7, 'Soderhamn椅', 3, 2, 1, '椅墊的回彈性和舒適感經得起日常使用，且耐用多年。', 13000, 8000, 'Soderhamn.jpg', 2015, '2022-11-11 15:13:58', '2022-11-11 15:13:58', 1),
(2031, 8, 'Stocksund椅', 3, 2, 1, '椅墊的回彈性和舒適感經得起日常使用，且耐用多年。', 10000, 4000, 'Stocksund.jpg', 2014, '2022-11-11 15:14:58', '2022-11-11 15:14:58', 1),
(2032, 9, 'Ekod椅', 3, 2, 1, '椅墊的回彈性和舒適感經得起日常使用，且耐用多年。', 13000, 4000, 'Ekod.jpg', 2014, '2022-11-11 15:16:25', '2022-11-11 15:16:25', 1),
(2033, 10, 'Viskafors椅', 3, 2, 1, '商品完整，狀況良好', 15000, 9000, 'Viskafors.jpg', 2013, '2022-11-11 15:18:37', '2022-11-11 15:18:37', 1),
(2034, 11, 'Tofteryd桌', 1, 3, 1, '商品完整，狀況良好', 7000, 3500, 'Tofteryd.jpg', 2017, '2022-11-11 15:21:09', '2022-11-11 15:21:09', 1),
(2035, 12, 'Ypperlig桌', 1, 3, 1, '商品完整，狀況良好', 8000, 5000, 'Ypperlig.jpg\n', 2018, '2022-11-11 15:22:36', '2022-11-11 15:22:36', 1),
(2036, 13, 'Lycksele沙發', 3, 1, 1, '商品完整，狀況良好', 7000, 5000, 'Lycksele.jpg', 2020, '2022-11-11 15:25:29', '2022-11-11 15:25:29', 1),
(2037, 14, 'Flottebo沙發', 3, 1, 1, '商品完整，狀況良好', 15000, 8000, 'Flottebo.jpg', 2013, '2022-11-11 15:26:10', '2022-11-11 15:26:10', 1),
(2038, 15, 'Holmsund沙發', 3, 1, 1, 'amazing\n商品完整，狀況良好', 10000, 6000, 'Holmsund.jpg', 2014, '2022-11-11 15:28:10', '2022-11-14 17:58:45', 1),
(2039, 16, 'Odensvik櫃', 4, 4, 1, '商品完整，狀況良好', 9000, 7000, 'Odensvik.jpg', 2020, '2022-11-11 15:29:54', '2022-11-11 15:29:54', 1),
(2040, 17, 'Godmorgon鏡', 4, 4, 1, '商品完整，狀況良好', 8000, 6000, 'Godmorgon.jpg', 2021, '2022-11-11 15:31:22', '2022-11-11 15:31:22', 1),
(2041, 18, 'Sandared凳', 3, 2, 1, '商品完整，狀況良好', 3000, 1000, 'Sandared.jpg', 2020, '2022-11-14 22:54:03', '2022-11-14 22:54:03', 1),
(2052, 2, 'Housetune套組', 1, 2, 1, 'Housetune官方沙發套組，購買後因為與室內風格不搭決定折價售出，九成新。\r\n', 10000, 5000, '405131676359047982.jpg,177411676359047982.jpg', 2023, '2023-02-14 15:16:52', '2023-02-14 15:17:27', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE `user` (
  `user_id` int(6) UNSIGNED NOT NULL,
  `account` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_account` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `liked` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `cart` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `valid_coupons` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `invalid_coupons` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `rating` float(2,1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `route` tinyint(1) NOT NULL,
  `valid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `user`
--

INSERT INTO `user` (`user_id`, `account`, `password`, `name`, `phone`, `email`, `address`, `bank_code`, `bank_account`, `liked`, `cart`, `valid_coupons`, `invalid_coupons`, `rating`, `created_at`, `last_modified`, `route`, `valid`) VALUES
(1, 'test123', '$argon2id$v=19$m=65536,t=3,p=4$AeYe6Cov3bfugXjtaOl0Pw$5/CW6OWQo9hAGzypF2q0eZxZWTA0lTLLGgSiPPipzAY', '官方客服', '0900000000', 'abc123@gmail.com', '台北市文山區中正路109號3樓', '', '', '[]', NULL, NULL, NULL, 0.0, '2023-01-22 22:20:55', '2023-01-22 22:20:55', 1, 1),
(2, 'user001', '$argon2id$v=19$m=65536,t=3,p=4$ErrRMzdh2UharqqNEmLxBg$2VP0kB5hL9WwjwVypWqRAYEzBd9m8o8GSJj+cos0Xa8', '王小明', '0900000000', 'gsn9456126@gmail.com', '新北市土城區金城路二段36號10樓', '700', '00012344321000', '[1]', NULL, '[\"HAPPYYEIN\",\"HAPPYYEIN2\",\"GIFT\"]', NULL, 4.2, '2023-01-23 02:54:28', '2023-01-23 02:54:28', 1, 1),
(3, 'user002', '$argon2id$v=19$m=65536,t=3,p=4$sJW46RKZ+Cqj0cG7Ca8KAA$72J1em/UnxPvv/B51BNgfOakoHiBOOGW2SO56gqgTtg', '李小美', '0912345678', 'mei@gmail.com', '台北市大安區寧波西街30巷9號', '700', '00023455432000', '[2,5,6]', NULL, NULL, NULL, 0.0, '2023-01-25 21:46:28', '2023-01-25 21:46:28', 1, 1),
(4, 'user003', '$argon2id$v=19$m=65536,t=3,p=4$Gbf95HKHmajm3Lzc4DTQsw$TSE3CRycFars8lHeoG4MYXkBDBSjbQBDVHICxBauorU', '陳小偉', '0223456789', 'wei@gmail.com', '新北市萬里區中興街3巷87號7樓', '000', '01234566543210', '[5]', NULL, '[\"HAPPYYEIN\"]', NULL, 4.0, '2023-01-29 01:03:01', '2023-01-29 01:03:01', 1, 1),
(5, 'user004', '$argon2id$v=19$m=65536,t=3,p=4$OpxAjsibihgv4NU3zAuZAA$ngkUV7hGQJ04JoBSnp4knOstpXiiVlNoUSbT8UdCtmw', '曾小惠', '0800076666', 'huei@gmail.com', '台北市大安區溫州街30巷9號', '808', '00024688642000', NULL, NULL, NULL, NULL, 3.0, '2023-02-08 01:03:05', '2023-02-08 01:03:05', 1, 1),
(6, 'user005', '$argon2id$v=19$m=65536,t=3,p=4$WY1Kngh8yYuVvd2dm0sfCw$2FWR1bxAxXgJz8wnxKYXgMQSntf/0q/TrgcYlx0Ybfc', '邱小傑', '0223939889', 'jay@gmail.com', '新北市萬里區寧波西街30巷9號', '013', '00013577531000', '[]', NULL, NULL, NULL, 2.0, '2023-02-08 15:12:48', '2023-02-08 15:12:48', 1, 1),
(7, 'housetune123', '$argon2id$v=19$m=65536,t=3,p=4$y0rNvtrYN2PJUVcAsD4N7g$zrnLQIguyFZrxjFGr315j/gWOeg6zyqJ5tskCM7FI9Y', '郝斯頓', '0913849199', 'housetune123@gmail.com', '桃園市中壢區新生路二段421號', '011', '00082540923000', NULL, NULL, NULL, NULL, 4.0, '2023-02-09 22:43:41', '2023-02-09 22:43:41', 2, 1),
(8, 'user006', '$argon2id$v=19$m=65536,t=3,p=4$z0bDqvQp/n2lKKIRRBQ84Q$iBPpf1+2tMZWzokRg/9q65rhO4zX6gbZiKHY68QH3/A', '溫辛迪', '0912345678', 'user006@gmail.com', '新北市板橋區土城路156號7樓', '', '', NULL, NULL, NULL, NULL, 5.0, '2023-02-10 15:35:57', '2023-02-10 15:35:57', 1, 1),
(9, 'user007', '$argon2id$v=19$m=65536,t=3,p=4$378RJSlRztJ7sIG+fF9F2w$TuzWo99LP+wxPAPlNjCI8rpThShyWLc4Ptn0Z4U7f5c', '牛音貞', '0912345678', 'user007@gmail.com', '台北市內湖區中正路5號', '', '', NULL, NULL, NULL, NULL, 0.0, '2023-02-10 15:37:12', '2023-02-10 15:37:12', 1, 1),
(10, 'user008', '$argon2id$v=19$m=65536,t=3,p=4$w1gXCD/y/tilDYsoQoevbg$DpLtlcS/TjkxOii+2ksImlJq/lxocs7VcW/6M4Yysjc', '咸品雪', '0912345678', 'user008@gmail.com', '桃園市蘆竹區洋五路55號4樓', '', '', '[]', NULL, NULL, NULL, 0.0, '2023-02-10 15:38:33', '2023-02-10 15:38:33', 1, 1),
(11, 'user010', '$argon2id$v=19$m=65536,t=3,p=4$JqYSFSECAJsiXfzY7tXdvw$6ehKKAOTepFqRCH386yP+81wvj74mjhpxyFMLiBo/uY', '印承美', '0955512345', 'user010@gmail.com', '新北市平溪區新速路55巷16-3號', '', '', NULL, NULL, NULL, NULL, 0.0, '2023-02-10 15:40:20', '2023-02-10 15:40:20', 1, 1),
(12, 'user011', '$argon2id$v=19$m=65536,t=3,p=4$Q1Q0I0hxo51gOMvl57Eahg$TnolyHqYAoW4/z6RzeCzjsTOleeMiCr5IjRumFu1rzk', '桑振劭', '0955481236', 'user011@gmail.com', '桃園市龍潭區龜山路53段4號', '', '', NULL, NULL, NULL, NULL, 0.0, '2023-02-10 15:41:28', '2023-02-10 15:41:28', 1, 1),
(13, 'user013', '$argon2id$v=19$m=65536,t=3,p=4$PLiAXhLhak2Utc7FzMSucw$dAzQ8+KntOi6MBvzGQgoY1CQPte5heENBiVNdRuEowE', '許純美', '0966578945', 'user013@gmail.com', '新北市金山區萬呈路5巷1樓', '', '', NULL, NULL, NULL, NULL, 0.0, '2023-02-10 15:42:27', '2023-02-10 15:42:27', 1, 1),
(14, 'uabbc123', '$argon2id$v=19$m=65536,t=3,p=4$hq6WBf1OQ058IS1zk7jGpA$FuB4/34+swIdoFPhpJhtxndckwe5mGyOqwDxwpcaqEw', '小可愛', '0953123468', 'uabbc123@gmail.com', '新北市汐止區南山路6號', '', '', NULL, NULL, NULL, NULL, 0.0, '2023-02-10 15:43:28', '2023-02-10 15:43:28', 1, 1),
(15, 'kevin543', '$argon2id$v=19$m=65536,t=3,p=4$IJB254FWpbEY3RTaZt5sFA$nHW+anPYaFekzWg1rLLvJtqLtTCHickrsXXDQjelous', '帥凱文', '0973123486', 'kevin543@gmail.com', '台北市北投區709 臺南市安南區義安街27號', '', '', NULL, NULL, NULL, NULL, 0.0, '2023-02-10 15:44:28', '2023-02-10 15:44:28', 1, 1),
(16, 'barbecue123', '$argon2id$v=19$m=65536,t=3,p=4$5F78E4S9u1gO0rfAab4dfg$ScoLo8gXz010cZlUrQ8h/EemJLdziReJwITvg0fqGYc', '司夙屏', '0912345689', 'barbecue123@gmail.com', '新北市板橋區新光路9巷11號', '', '', NULL, NULL, NULL, NULL, 0.0, '2023-02-10 15:45:25', '2023-02-10 15:45:25', 1, 1),
(17, 'wexiaobao123', '$argon2id$v=19$m=65536,t=3,p=4$u24ayZS2LPX/LzcT0ydvpw$P00kS8tQZshim9fAvEPxKOcHUWFeLdqSbzukLHfKHNA', '韋小寶', '0956123548', 'wexiaobao123@gmail.com', '桃園市八德區皇宮', '', '', NULL, NULL, NULL, NULL, 0.0, '2023-02-10 15:46:27', '2023-02-10 15:46:27', 1, 1),
(18, 'otis123', '$argon2id$v=19$m=65536,t=3,p=4$T7f/L85ZhZkERMMDfXm9xg$suaPiVTwv6QhpyHkTAL0TuKHr3QOkXgR5RPhUq26nKE', '奧提斯', '0964851327', 'otis123@gmail.com', '新北市板橋區無名小鎮', '', '', NULL, NULL, NULL, NULL, 0.0, '2023-02-10 15:47:30', '2023-02-10 15:47:30', 1, 1),
(19, 'moliflower555', '$argon2id$v=19$m=65536,t=3,p=4$0Hb8rNAZOqqvVo9vXaLs7A$15qxs4PBzaRMuWpt0SfTYKjNEsczMycY9et4GXR/wo4', '茉莉兒', '0955555588', 'moliflower555@gmail.com', '新北市板橋區無', '', '', NULL, NULL, NULL, NULL, 0.0, '2023-02-10 15:48:53', '2023-02-10 15:48:53', 1, 1),
(20, 'yodoctor88', '$argon2id$v=19$m=65536,t=3,p=4$aS0TTkYSNpR0SxH2EWaaqg$9B3BEK+zYOhL0zZ+e39BaHE39PlDWQmukYvFEw26qWI', '尤教授', '0988461232', 'yodoctor88@gmail.com', '新北市汐止區小鎮', '', '', NULL, NULL, NULL, NULL, 0.0, '2023-02-10 15:53:42', '2023-02-10 15:53:42', 1, 1),
(26, 'user009', '$argon2id$v=19$m=65536,t=3,p=4$UV5k+Il4z5/BRF7JElKlkA$xtD440oMhJuor3PWXp+o+NcEKAD4FoBEsOJwkFNsxg4', '劉小昊', '0912345678', 'hao@gmail.com', '', '700', '700', NULL, NULL, NULL, NULL, 0.0, '2023-02-14 13:25:59', '2023-02-14 13:25:59', 1, 1),
(27, 'bob83727', '$argon2id$v=19$m=65536,t=3,p=4$vd5/CMQEd6wP/ZuqH9b1qg$5IfIOhIOvJrC/uMeOKSaW0eMfDBOxfTgyj3cCI34bmI', 'Bob Huang', '0223939889', 'bob83727@gmail.com', '新北市三峽區新生路四段421號', '700', '00034566543000', NULL, NULL, NULL, NULL, 0.0, '2023-02-14 13:26:45', '2023-02-14 13:26:45', 2, 1);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `category_room`
--
ALTER TABLE `category_room`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `chat_room`
--
ALTER TABLE `chat_room`
  ADD PRIMARY KEY (`chat_id`);

--
-- 資料表索引 `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`coup_id`);

--
-- 資料表索引 `inspiration`
--
ALTER TABLE `inspiration`
  ADD PRIMARY KEY (`insp_id`);

--
-- 資料表索引 `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`ordD_id`);

--
-- 資料表索引 `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`ordL_id`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prod_id`),
  ADD KEY `category_room` (`category_room`),
  ADD KEY `category_product` (`category_product`);

--
-- 資料表索引 `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`ratP_id`);

--
-- 資料表索引 `used_product`
--
ALTER TABLE `used_product`
  ADD PRIMARY KEY (`useP_id`);

--
-- 資料表索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `category_room`
--
ALTER TABLE `category_room`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `chat_room`
--
ALTER TABLE `chat_room`
  MODIFY `chat_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `coupon`
--
ALTER TABLE `coupon`
  MODIFY `coup_id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `inspiration`
--
ALTER TABLE `inspiration`
  MODIFY `insp_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `ordD_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order_list`
--
ALTER TABLE `order_list`
  MODIFY `ordL_id` int(15) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2023000372;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product`
--
ALTER TABLE `product`
  MODIFY `prod_id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `rating`
--
ALTER TABLE `rating`
  MODIFY `ratP_id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2008;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `used_product`
--
ALTER TABLE `used_product`
  MODIFY `useP_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2053;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
