-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2024 at 02:08 PM
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
-- Database: `erd_rootify`
--

-- --------------------------------------------------------

--
-- Table structure for table `accommodations`
--

CREATE TABLE `accommodations` (
  `accommodation_ID` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `total_rooms` int(11) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `price_per_night` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_ID` int(11) NOT NULL,
  `booking_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `user_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_accommodation`
--

CREATE TABLE `booking_accommodation` (
  `booking_ID` int(11) NOT NULL,
  `accommodation_ID` int(11) NOT NULL,
  `stay_duration` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_event`
--

CREATE TABLE `booking_event` (
  `booking_ID` int(11) NOT NULL,
  `event_ID` int(11) NOT NULL,
  `event_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_tourpackage`
--

CREATE TABLE `booking_tourpackage` (
  `booking_ID` int(11) NOT NULL,
  `package_ID` int(11) NOT NULL,
  `package_date` date DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chatbot`
--

CREATE TABLE `chatbot` (
  `session_ID` int(11) NOT NULL,
  `question` text DEFAULT NULL,
  `user_ID` int(11) DEFAULT NULL,
  `response` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `event_ID` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `entry_fee` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_wisata`
--

CREATE TABLE `kategori_wisata` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_wisata`
--

INSERT INTO `kategori_wisata` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Wisata Alam'),
(2, 'Wisata Budaya'),
(3, 'Wisata Kuliner'),
(4, 'Wisata Sejarah'),
(5, 'Wisata Edukasi'),
(6, 'Wisata Religi'),
(7, 'Wisata Belanja');

-- --------------------------------------------------------

--
-- Table structure for table `tempat_wisata`
--

CREATE TABLE `tempat_wisata` (
  `id_wisata` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `url_gambar` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `latitude` decimal(9,6) DEFAULT NULL,
  `rating` decimal(3,2) DEFAULT NULL,
  `jam_buka` time DEFAULT NULL,
  `jam_tutup` time DEFAULT NULL,
  `trip_types` varchar(50) DEFAULT NULL,
  `budget_range` varchar(10) DEFAULT NULL,
  `interests_tags` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tempat_wisata`
--

INSERT INTO `tempat_wisata` (`id_wisata`, `nama`, `deskripsi`, `url_gambar`, `alamat`, `kategori`, `longitude`, `latitude`, `rating`, `jam_buka`, `jam_tutup`, `trip_types`, `budget_range`, `interests_tags`) VALUES
(1, 'Candi Prambanan', 'Kompleks candi Hindu terbesar di Indonesia yang dibangun pada abad ke-9 Masehi, terkenal dengan arsitektur megah dan kisah Ramayana.', '../img/prambanan.jpg', 'Jalan Raya Solo - Yogyakarta No.16, Prambanan, Sleman, Yogyakarta', 'Budaya', 110.491073, -7.752020, 4.80, '06:00:00', '17:00:00', 'solo,family', 'medium', 'culture,history'),
(2, 'Malioboro', 'Jalan terkenal di pusat kota Yogyakarta yang menjadi ikon wisata belanja, dengan banyak toko, pusat oleh-oleh, dan pedagang kaki lima.', '../img/Malioboro.jpg', 'Jalan Malioboro, Sosromenduran, Gedong Tengen, Yogyakarta', 'Belanja', 110.367075, -7.793171, 4.50, '00:00:00', '23:59:00', 'solo,family,friends', 'low', 'shopping,culture'),
(3, 'Hutan Pinus Mangunan', 'Destinasi alam yang menawan dengan hutan pinus yang rimbun, cocok untuk rekreasi dan foto, serta memiliki pemandangan bukit hijau yang asri.', '../img/hutanpinus.jpg', 'Dlingo, Bantul, Yogyakarta', 'Alam', 110.440868, -7.926475, 4.60, '06:00:00', '17:00:00', 'solo,partner,family', 'low', 'nature,scenic'),
(4, 'Keraton Yogyakarta', 'Istana resmi Sultan Yogyakarta yang kaya akan budaya dan sejarah, tempat berlangsungnya berbagai acara tradisional dan pertunjukan seni.', '../img/keraton.jpeg', 'Jalan Rotowijayan No.1, Kraton, Yogyakarta', 'Budaya', 110.364121, -7.795576, 4.70, '08:00:00', '14:00:00', 'solo,family', 'medium', 'culture,history'),
(5, 'Taman Sari', 'Kompleks taman yang dulunya merupakan tempat pemandian raja dan keluarga keraton, memiliki arsitektur yang indah dan kolam yang menawan.', '../img/tamansari.jpg', 'Jalan Taman, Patehan, Kraton, Yogyakarta', 'Budaya', 110.363449, -7.794107, 4.60, '09:00:00', '15:00:00', 'solo,family', 'low', 'culture,history'),
(6, 'Pantai Parangtritis', 'Pantai yang terkenal dengan pasir hitam dan ombak besar, tempat yang ideal untuk bersantai dan menikmati matahari terbenam.', '../img/parangritis.jpg', 'Parangtritis, Kretek, Bantul, Yogyakarta', 'Alam', 110.360344, -8.018284, 4.40, '00:00:24', '00:00:24', 'solo,partner,friends', 'low', 'nature,beach'),
(7, 'Candi Borobudur', 'Candi Buddha terbesar di dunia dan situs warisan dunia UNESCO, terkenal dengan arsitektur megah dan relief yang indah.', '../img/borobudur.jpg', 'Borobudur, Magelang, Yogyakarta', 'Budaya', 110.202705, -7.607389, 4.90, '06:00:00', '17:00:00', 'solo,family', 'high', 'culture,history'),
(8, 'Bukit Bintang', 'Tempat wisata yang menawarkan pemandangan malam kota Yogyakarta yang menakjubkan, cocok untuk bersantai sambil menikmati kuliner lokal.', '../img/bukitbintang.jpg', 'Dlingo, Bantul, Yogyakarta', 'Alam', 110.410908, -7.927064, 4.50, '18:00:00', '23:00:00', 'solo,partner,friends', 'low', 'scenic,nature'),
(9, 'Pantai Indrayanti', 'Pantai pasir putih yang bersih dan cocok untuk liburan keluarga, dengan fasilitas lengkap seperti restoran dan area bermain.', '../img/indrayanti.jpg', 'Tepus, Gunung Kidul, Yogyakarta', 'Alam', 110.667084, -8.148953, 4.70, '00:00:00', '23:59:59', 'solo,partner,friends,family', 'low', 'nature,beach'),
(10, 'Gua Jomblang', 'Gua vertikal dengan fenomena cahaya surga yang terkenal, cocok untuk wisata petualangan.', '../img/jomblang.jpg', 'Jetis Wetan, Pacarejo, Semanu, Gunung Kidul', 'Alam', 110.632430, -8.030832, 4.80, '07:00:00', '15:00:00', 'solo,partner', 'medium', 'nature,adventure'),
(11, 'Museum Ullen Sentalu', 'Museum seni dan budaya Jawa yang penuh dengan koleksi seni tradisional dan sejarah.', '../img/ullensentalu.jpg', 'Kaliurang Barat, Sleman, Yogyakarta', 'Budaya', 110.423390, -7.600800, 4.60, '08:30:00', '15:30:00', 'solo,family', 'medium', 'culture,art'),
(12, 'Pantai Drini', 'Pantai yang memiliki pulau kecil di tengah laut dan terkenal dengan keindahan alamnya.', '../img/drini.png', 'Tanjungsari, Gunung Kidul, Yogyakarta', 'Alam', 110.598271, -8.144376, 4.50, '00:00:00', '23:59:59', 'solo,partner,family', 'low', 'nature,beach'),
(13, 'Pantai Pok Tunggal', 'Pantai dengan pemandangan tebing yang indah, sering dikunjungi untuk menikmati sunset.', '../img/poktunggal.jpg', 'Tepus, Gunung Kidul, Yogyakarta', 'Alam', 110.667908, -8.150697, 4.60, '00:00:00', '23:59:59', 'solo,partner,friends', 'low', 'nature,beach'),
(14, 'Tebing Breksi', 'Tebing kapur yang diubah menjadi tempat wisata, dengan pahatan artistik dan pemandangan indah.', '../img/tebingbreksi.jpg', 'Sambirejo, Prambanan, Sleman, Yogyakarta', 'Alam', 110.509657, -7.775102, 4.50, '06:00:00', '18:00:00', 'solo,partner,friends', 'low', 'nature,scenic'),
(15, 'Alun-Alun Kidul', 'Alun-alun yang ramai pada malam hari dengan hiburan lokal, becak lampu, dan makanan khas.', '../img/alunalunkidul.jpeg', 'Patehan, Kraton, Yogyakarta', 'Budaya', 110.359846, -7.812329, 4.40, '00:00:00', '23:59:59', 'solo,family,friends', 'low', 'culture,nightlife'),
(16, 'Taman Pintar Yogyakarta', 'Tempat rekreasi edukasi dengan berbagai wahana sains, cocok untuk anak-anak dan keluarga.', '../img/tamanpintar.jpg', 'Jl. Panembahan Senopati No.1-3, Yogyakarta', 'Edukasi', 110.367905, -7.801309, 4.50, '09:00:00', '16:00:00', 'family', 'medium', 'education,children'),
(17, 'De Mata Trick Eye Museum', 'Museum dengan koleksi ilusi optik dan seni tiga dimensi yang interaktif.', '../img/demata.jpg', 'XT Square, Jl. Veteran No.150-151, Pandeyan, Yogyakarta', 'Seni', 110.393364, -7.819437, 4.30, '10:00:00', '22:00:00', 'solo,partner,family', 'medium', 'art,photography'),
(18, 'Sindu Kusuma Edupark', 'Taman hiburan yang memiliki wahana seperti bianglala dan miniatur kota, cocok untuk keluarga.', '../img/sindukusuma.jpg', 'Jl. Jambon, Kragilan, Sinduadi, Mlati, Sleman', 'Hiburan', 110.361180, -7.769879, 4.20, '15:00:00', '21:00:00', 'family,friends', 'medium', 'amusement,children'),
(19, 'Pasar Beringharjo', 'Pasar tradisional terbesar di Yogyakarta yang menjual batik, makanan, dan oleh-oleh khas.', '../img/beringharjo.jpg', 'Jl. Pabringan No.1, Ngupasan, Gondomanan, Yogyakarta', 'Belanja', 110.367257, -7.801977, 4.50, '08:00:00', '17:00:00', 'solo,family', 'low', 'shopping,culture'),
(20, 'Warung Bu Ageng', 'Tempat makan tradisional yang menyajikan makanan khas Jawa dengan suasana sederhana namun ramah keluarga dan pasangan.', '../img/buageng.jpg', 'Jl. Tirtodipuran No.13, Mantrijeron, Yogyakarta', 'Restoran', 110.361424, -7.818049, 4.70, '10:00:00', '22:00:00', 'solo,family,partner', 'medium', 'food,culture'),
(21, 'The Manglung Café & Resto', 'Restoran dengan pemandangan kota Yogyakarta yang menawan, terkenal dengan suasana romantis dan menu khas Nusantara.', '../img/manglung.jpg', 'Jl. Ngoro-Ngoro Ombo No.16, Patuk, Gunung Kidul, Yogyakarta', 'Restoran', 110.466530, -7.889950, 4.70, '10:00:00', '22:00:00', 'partner,friends', 'high', 'food,scenic'),
(22, 'Canting Restaurant', 'Restoran elegan dengan konsep modern yang menawarkan pemandangan indah kota dari rooftop, menyajikan hidangan fusion internasional.', '../img/canting.jpg', 'Rooftop Galeria Mall, Jl. Sudirman No.99-101, Yogyakarta', 'Restoran', 110.374139, -7.782964, 4.80, '11:00:00', '23:00:00', 'partner,solo', 'high', 'food,romantic'),
(23, 'Gudeg Yu Djum', 'Salah satu tempat makan legendaris di Yogyakarta yang terkenal dengan gudeg asli Yogyakarta.', '../img/gudegyudjum.jpg', 'Jl. Wijilan No.167, Panembahan, Kraton, Yogyakarta', 'Restoran', 110.368319, -7.803563, 4.50, '06:00:00', '20:00:00', 'solo,family', 'low', 'food,culture'),
(24, 'Angkringan Lik Man', 'Angkringan khas Yogyakarta yang terkenal dengan kopi joss dan berbagai macam lauk khas.', '../img/likman.jpg', 'Jl. Wongsodirjan, Sosromenduran, Gedong Tengen, Yogyakarta', 'Restoran', 110.366803, -7.789126, 4.40, '17:00:00', '02:00:00', 'solo,friends', 'low', 'food,street'),
(25, 'Abhayagiri Restaurant', 'Restoran yang memiliki pemandangan Candi Prambanan dan Gunung Merapi, cocok untuk dinner romantis.', '../img/abhayagiri.jpg', 'Sumberwatu Heritage Resort, Sambirejo, Prambanan, Sleman, Yogyakarta', 'Restoran', 110.505643, -7.767293, 4.70, '11:00:00', '22:00:00', 'partner', 'high', 'food,romantic'),
(26, 'Bale Raos', 'Restoran yang menyajikan makanan khas Jawa dengan menu favorit dari Keraton Yogyakarta.', '../img/baleraos.jpg', 'Kompleks Keraton Yogyakarta, Jl. Magangan Kulon No.1, Yogyakarta', 'Restoran', 110.365558, -7.805908, 4.60, '10:00:00', '21:00:00', 'family,partner', 'medium', 'food,culture'),
(27, 'Honje Restaurant', 'Restoran yang menawarkan hidangan Asia dan Western dengan pemandangan langsung ke Jalan Malioboro.', '../img/honje.jpg', 'Jl. Margo Utomo No.129, Jetis, Yogyakarta', 'Restoran', 110.367229, -7.790280, 4.50, '11:00:00', '23:00:00', 'partner,solo', 'high', 'food,scenic'),
(28, 'House of Raminten', 'Restoran dengan konsep unik dan menyajikan makanan khas Jawa dengan suasana yang kental dengan budaya Yogyakarta.', '../img/raminten.jpg', 'Jl. FM Noto No.7, Kota Baru, Yogyakarta', 'Restoran', 110.379647, -7.782784, 4.40, '00:00:00', '23:59:59', 'partner,friends', 'low', 'food,culture'),
(29, 'Milas Vegetarian Resto', 'Restoran vegetarian yang menyajikan hidangan sehat dengan bahan-bahan organik dalam suasana taman yang nyaman.', '../img/milas.jpg', 'Jl. Prawirotaman IV No.127B, Yogyakarta', 'Restoran', 110.374532, -7.821469, 4.60, '11:00:00', '21:00:00', 'solo,family,partner', 'medium', 'food,vegetarian'),
(30, 'Warung Kopi Klotok', 'Warung sederhana yang menyajikan kopi klotok khas Jawa dan makanan tradisional dengan suasana pedesaan.', '../img/klotok.jpg', 'Jl. Kaliurang Km.16, Pakem, Sleman, Yogyakarta', 'Restoran', 110.413917, -7.671535, 4.70, '07:00:00', '22:00:00', 'solo,family', 'low', 'food,local');

-- --------------------------------------------------------

--
-- Table structure for table `tourguide`
--

CREATE TABLE `tourguide` (
  `Guide_ID` int(11) NOT NULL,
  `name_guide` varchar(100) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tourpackage`
--

CREATE TABLE `tourpackage` (
  `package_ID` int(11) NOT NULL,
  `destination` int(11) DEFAULT NULL,
  `opening_hours` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `trip_type` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tourpackage_tourguide`
--

CREATE TABLE `tourpackage_tourguide` (
  `package_ID` int(11) NOT NULL,
  `Guide_ID` int(11) NOT NULL,
  `assigned_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `travelhistory`
--

CREATE TABLE `travelhistory` (
  `history_ID` int(11) NOT NULL,
  `user_ID` int(11) DEFAULT NULL,
  `destination_ID` int(11) DEFAULT NULL,
  `visit_date` date DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `trip_type` varchar(20) NOT NULL,
  `budget` varchar(20) NOT NULL,
  `interests` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`id`, `start_date`, `end_date`, `trip_type`, `budget`, `interests`, `created_at`) VALUES
(54, '2024-11-01', '2024-11-04', 'solo', 'low', 'nature,shopping,food', '2024-11-03 11:14:10'),
(55, '2024-11-01', '2024-11-04', 'solo', 'low', 'nature,shopping,food', '2024-11-03 11:14:57'),
(56, '2024-11-04', '2024-11-05', 'solo', 'low', 'culture,shopping,beach', '2024-11-03 11:15:42'),
(57, '2024-11-04', '2024-11-05', 'solo', 'low', 'culture,shopping,beach', '2024-11-03 11:16:02'),
(58, '2024-11-04', '2024-11-05', 'solo', 'low', 'culture,shopping,beach', '2024-11-03 11:42:38'),
(59, '2024-11-04', '2024-11-05', 'solo', 'low', 'culture,shopping,beach', '2024-11-03 11:50:20'),
(60, '2024-11-04', '2024-11-05', 'solo', 'low', 'culture,shopping,beach', '2024-11-03 11:50:53'),
(61, '2024-11-04', '2024-11-05', 'solo', 'low', 'culture,shopping,beach', '2024-11-03 11:52:43'),
(62, '2024-11-04', '2024-11-05', 'solo', 'low', 'culture,shopping,beach', '2024-11-03 11:53:39'),
(63, '2024-11-04', '2024-11-05', 'solo', 'low', 'culture,shopping,beach', '2024-11-03 11:53:57'),
(64, '2024-11-04', '2024-11-05', 'solo', 'low', 'culture,shopping,beach', '2024-11-03 11:56:59'),
(65, '2024-11-04', '2024-11-05', 'solo', 'low', 'culture,shopping,beach', '2024-11-03 12:27:43'),
(66, '2024-11-01', '2024-11-06', 'solo', 'low', 'nature,culture', '2024-11-04 00:51:25'),
(67, '2024-11-01', '2024-11-06', 'solo', 'low', 'nature,culture', '2024-11-04 00:56:22'),
(68, '2024-11-01', '2024-11-03', 'solo', 'low', 'culture,beach', '2024-11-04 00:57:04'),
(69, '2024-11-01', '2024-11-03', 'family', 'medium', 'shopping,food,beach', '2024-11-08 12:47:36'),
(70, '2024-11-01', '2024-11-03', 'family', 'low', 'shopping,beach', '2024-11-08 12:48:36'),
(71, '2024-11-01', '2024-11-03', 'solo', 'low', 'shopping,beach', '2024-11-08 12:48:53'),
(72, '2024-11-01', '2024-11-03', 'solo', 'low', 'shopping,beach', '2024-11-08 12:49:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'sulthan', 'sulthanraihan701@gmail.com', '$2y$10$VfKkikPEXNJjmat2z7AtzO35M2MyFhy3M/7kG7BeHEQ/gD/iECUaW', '2024-11-01 15:37:33'),
(2, 'tio', 'tio@gmail.com', '$2y$10$1hB5lnWGJM3PDY4sbojmQO/cydDg6VnNr1GPrizSh834GHfmN0Rmu', '2024-11-01 16:02:10');

-- --------------------------------------------------------

--
-- Table structure for table `user_visits_destination`
--

CREATE TABLE `user_visits_destination` (
  `user_ID` int(11) NOT NULL,
  `destination_ID` int(11) NOT NULL,
  `review` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accommodations`
--
ALTER TABLE `accommodations`
  ADD PRIMARY KEY (`accommodation_ID`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_ID`),
  ADD KEY `user_ID` (`user_ID`);

--
-- Indexes for table `booking_accommodation`
--
ALTER TABLE `booking_accommodation`
  ADD PRIMARY KEY (`booking_ID`,`accommodation_ID`),
  ADD KEY `accommodation_ID` (`accommodation_ID`);

--
-- Indexes for table `booking_event`
--
ALTER TABLE `booking_event`
  ADD PRIMARY KEY (`booking_ID`,`event_ID`),
  ADD KEY `event_ID` (`event_ID`);

--
-- Indexes for table `booking_tourpackage`
--
ALTER TABLE `booking_tourpackage`
  ADD PRIMARY KEY (`booking_ID`,`package_ID`),
  ADD KEY `package_ID` (`package_ID`);

--
-- Indexes for table `chatbot`
--
ALTER TABLE `chatbot`
  ADD PRIMARY KEY (`session_ID`),
  ADD KEY `user_ID` (`user_ID`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_ID`);

--
-- Indexes for table `tempat_wisata`
--
ALTER TABLE `tempat_wisata`
  ADD PRIMARY KEY (`id_wisata`);

--
-- Indexes for table `tourguide`
--
ALTER TABLE `tourguide`
  ADD PRIMARY KEY (`Guide_ID`);

--
-- Indexes for table `tourpackage`
--
ALTER TABLE `tourpackage`
  ADD PRIMARY KEY (`package_ID`),
  ADD KEY `destination` (`destination`);

--
-- Indexes for table `tourpackage_tourguide`
--
ALTER TABLE `tourpackage_tourguide`
  ADD PRIMARY KEY (`package_ID`,`Guide_ID`),
  ADD KEY `Guide_ID` (`Guide_ID`);

--
-- Indexes for table `travelhistory`
--
ALTER TABLE `travelhistory`
  ADD PRIMARY KEY (`history_ID`),
  ADD KEY `user_ID` (`user_ID`),
  ADD KEY `destination_ID` (`destination_ID`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_visits_destination`
--
ALTER TABLE `user_visits_destination`
  ADD PRIMARY KEY (`user_ID`,`destination_ID`),
  ADD KEY `destination_ID` (`destination_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tempat_wisata`
--
ALTER TABLE `tempat_wisata`
  MODIFY `id_wisata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `user` (`User_ID`);

--
-- Constraints for table `booking_accommodation`
--
ALTER TABLE `booking_accommodation`
  ADD CONSTRAINT `booking_accommodation_ibfk_1` FOREIGN KEY (`booking_ID`) REFERENCES `bookings` (`booking_ID`),
  ADD CONSTRAINT `booking_accommodation_ibfk_2` FOREIGN KEY (`accommodation_ID`) REFERENCES `accommodations` (`accommodation_ID`);

--
-- Constraints for table `booking_event`
--
ALTER TABLE `booking_event`
  ADD CONSTRAINT `booking_event_ibfk_1` FOREIGN KEY (`booking_ID`) REFERENCES `bookings` (`booking_ID`),
  ADD CONSTRAINT `booking_event_ibfk_2` FOREIGN KEY (`event_ID`) REFERENCES `event` (`event_ID`);

--
-- Constraints for table `booking_tourpackage`
--
ALTER TABLE `booking_tourpackage`
  ADD CONSTRAINT `booking_tourpackage_ibfk_1` FOREIGN KEY (`booking_ID`) REFERENCES `bookings` (`booking_ID`),
  ADD CONSTRAINT `booking_tourpackage_ibfk_2` FOREIGN KEY (`package_ID`) REFERENCES `tourpackage` (`package_ID`);

--
-- Constraints for table `chatbot`
--
ALTER TABLE `chatbot`
  ADD CONSTRAINT `chatbot_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `user` (`User_ID`);

--
-- Constraints for table `tourpackage`
--
ALTER TABLE `tourpackage`
  ADD CONSTRAINT `tourpackage_ibfk_1` FOREIGN KEY (`destination`) REFERENCES `touristdestination` (`destination_ID`);

--
-- Constraints for table `tourpackage_tourguide`
--
ALTER TABLE `tourpackage_tourguide`
  ADD CONSTRAINT `tourpackage_tourguide_ibfk_1` FOREIGN KEY (`package_ID`) REFERENCES `tourpackage` (`package_ID`),
  ADD CONSTRAINT `tourpackage_tourguide_ibfk_2` FOREIGN KEY (`Guide_ID`) REFERENCES `tourguide` (`Guide_ID`);

--
-- Constraints for table `travelhistory`
--
ALTER TABLE `travelhistory`
  ADD CONSTRAINT `travelhistory_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `user` (`User_ID`),
  ADD CONSTRAINT `travelhistory_ibfk_2` FOREIGN KEY (`destination_ID`) REFERENCES `touristdestination` (`destination_ID`);

--
-- Constraints for table `user_visits_destination`
--
ALTER TABLE `user_visits_destination`
  ADD CONSTRAINT `user_visits_destination_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `user` (`User_ID`),
  ADD CONSTRAINT `user_visits_destination_ibfk_2` FOREIGN KEY (`destination_ID`) REFERENCES `touristdestination` (`destination_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
