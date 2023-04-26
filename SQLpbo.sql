-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2023 at 11:00 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ta`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `p2` (IN `n` INT(11))   BEGIN
DECLARE message VARCHAR(30);
IF (EXISTS ( SELECT id_reservasi FROM payment WHERE id_reservasi = n))
THEN 
SET message = "OK";
ELSE
SET message = "NO";
END IF;
SELECT message;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p3` (IN `n` INT(11))   BEGIN
DECLARE message VARCHAR(30);
IF (EXISTS ( SELECT id_dokter FROM dokter WHERE id_dokter = n))
THEN 
SET message = "OK";
ELSE
SET message = "NO";
END IF;
SELECT message;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p4` (IN `n` INT(11))   BEGIN
DECLARE message VARCHAR(30);
IF (EXISTS ( SELECT id_pasien FROM pasien WHERE id_pasien = n))
THEN 
SET message = "OK";
ELSE
SET message = "NO";
END IF;
SELECT message;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(11) NOT NULL,
  `nama_dok` varchar(20) NOT NULL,
  `no_telp_dok` varchar(20) NOT NULL,
  `jk_dok` varchar(20) NOT NULL,
  `spesial` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dok`, `no_telp_dok`, `jk_dok`, `spesial`) VALUES
(123456785, 'gngngh', '345454454', 'hghhtyjytty', 'Dokter Gigi'),
(123456786, 'Udin Pangestu', '082121993434', 'Pria', 'Bedah Syaraf'),
(123456787, 'Asep Praharja', '082121213466', 'Pria', 'Ahli Mata'),
(123456788, 'Bambang Atmaji', '082121213430', 'Pria', 'Ahli Mata'),
(123456789, 'Joko Abdillah', '082121213434', 'Pria', 'Dokter Gigi');

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `id_kamar` int(11) NOT NULL,
  `jenis` varchar(30) NOT NULL,
  `harga` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`id_kamar`, `jenis`, `harga`) VALUES
(1, 'Kelas 1', 350000),
(2, 'Kelas 2', 300000),
(3, 'Kelas 3', 200000),
(4, 'VIP', 450000),
(5, 'VVIP', 500000);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id_admin` int(5) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `hak_akses` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id_admin`, `username`, `password`, `hak_akses`) VALUES
(1, 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(20) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jk` varchar(20) NOT NULL,
  `goldar` varchar(2) NOT NULL,
  `jp` varchar(20) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `wali` varchar(20) NOT NULL,
  `alamat` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama`, `nik`, `tanggal_lahir`, `jk`, `goldar`, `jp`, `no_telp`, `wali`, `alamat`) VALUES
(1234, 'Putri', '2312312313', '2023-04-06', 'Perempuan', 'O', 'Bedah Syaraf', '32245445454', 'adsadsads', 'adsadsadsads'),
(4321, 'Farah Aida', '22053360', '2023-04-18', 'Perempuan', 'B', 'Bedah Syaraf', '087724101671', 'Tidak Diketahui', 'Terucap'),
(5432, 'Muhammad Fiqih', '22053360', '2023-04-06', 'Perempuan', 'B', 'Ahli Mata', '087724101671', 'Tidak Diketahui', 'Terucap');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id_payment` int(11) NOT NULL,
  `id_reservasi` int(11) NOT NULL,
  `tbiaya` varchar(100) NOT NULL,
  `jpayment` varchar(30) NOT NULL,
  `ubayar` varchar(100) NOT NULL,
  `tgl` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id_payment`, `id_reservasi`, `tbiaya`, `jpayment`, `ubayar`, `tgl`) VALUES
(1234, 1234, '340000.0', 'Non-Tunai', '340000.0', '2023-04-26'),
(4321, 4321, '980000.0', 'Non-Tunai', '980000.0', '2023-04-27'),
(5432, 5432, '230000.0', 'Tunai', '230000.0', '2023-04-12');

-- --------------------------------------------------------

--
-- Table structure for table `reservasi`
--

CREATE TABLE `reservasi` (
  `id_reservasi` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `tgl_reservasi` date NOT NULL,
  `hari` int(11) NOT NULL,
  `malam` int(11) NOT NULL,
  `tipe_kamar` varchar(20) NOT NULL,
  `dokter` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservasi`
--

INSERT INTO `reservasi` (`id_reservasi`, `id_pasien`, `tgl_reservasi`, `hari`, `malam`, `tipe_kamar`, `dokter`) VALUES
(6789, 4321, '2023-04-19', 2, 2, 'Kelas 3', 'Udin Pangestu');

-- --------------------------------------------------------

--
-- Table structure for table `spesial`
--

CREATE TABLE `spesial` (
  `id_spesialis` int(11) NOT NULL,
  `spesial` varchar(30) NOT NULL,
  `harga` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `spesial`
--

INSERT INTO `spesial` (`id_spesialis`, `spesial`, `harga`) VALUES
(1, 'Ahli Mata', 30000),
(2, 'Bedah Syaraf', 40000),
(3, 'Dokter Gigi', 25000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`id_kamar`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id_payment`),
  ADD UNIQUE KEY `id_reservasi` (`id_reservasi`);

--
-- Indexes for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`id_reservasi`),
  ADD KEY `id_pasien` (`id_pasien`);

--
-- Indexes for table `spesial`
--
ALTER TABLE `spesial`
  ADD PRIMARY KEY (`id_spesialis`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD CONSTRAINT `reservasi_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
