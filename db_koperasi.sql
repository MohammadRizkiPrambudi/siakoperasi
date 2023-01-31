-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2023 at 04:12 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_koperasi`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `kode` varchar(128) NOT NULL,
  `nama` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`kode`, `nama`) VALUES
('1-111', 'Kas'),
('1-112', 'Piutang'),
('1-113', 'Persediaan'),
('1-114', 'Perlengkapan'),
('1-211', 'Peralatan'),
('1-212', 'Tanah'),
('1-213', 'Bangunan'),
('1-214', 'Akumulasi Penyusutan'),
('2-111', 'Simpanan Pokok'),
('2-112', 'Simpanan Sukarela'),
('2-113', 'Simpanan Wajib'),
('2-114', 'SHU Belum Dibagi'),
('3-111', 'Modal');

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `anggota_kode` varchar(10) NOT NULL,
  `anggota_nik` varchar(20) NOT NULL,
  `anggota_nokk` varchar(20) NOT NULL,
  `anggota_nama` varchar(80) NOT NULL,
  `anggota_tgllahir` date NOT NULL,
  `anggota_alamat` text NOT NULL,
  `anggota_pekerjaan` varchar(80) NOT NULL,
  `anggota_nohp` varchar(20) NOT NULL,
  `tgl_masuk_anggota` date DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`anggota_kode`, `anggota_nik`, `anggota_nokk`, `anggota_nama`, `anggota_tgllahir`, `anggota_alamat`, `anggota_pekerjaan`, `anggota_nohp`, `tgl_masuk_anggota`, `password`) VALUES
('A000001', '180213071180001', '222917287316162', 'Yudi Setyawan', '1998-11-07', 'Gg. Damai No. 2 Rajabasa,Semarang', 'Pegawai Negeri Sipil', '082382000703', '2022-09-01', '827ccb0eea8a706c4c34a16891f84e7b'),
('A000002', '180213071180002', '333396058385747', 'Neprisa Anggraini', '1997-11-25', 'Bandar Jaya, Solo', 'Enterpreneur', '082382000703', '2022-10-02', '827ccb0eea8a706c4c34a16891f84e7b'),
('A000003', '3374031312058161', '222299907387837', 'Alfin Natan', '1998-09-10', 'Krajan Lor, Kaliwungu', 'Wiraswata', '08990685315', '2022-10-03', '827ccb0eea8a706c4c34a16891f84e7b'),
('A000004', '2221980000176161', '1111289128972187', 'Sumi', '2000-09-08', 'Kendal', 'Guru', '089907651717', '2022-12-02', '202cb962ac59075b964b07152d234b70'),
('A000005', '7896662345', '88875900012', 'Anisa', '2000-02-10', 'Cepiring, Kendal', 'Guru', '0877382345', '2023-01-09', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Table structure for table `angsuran`
--

CREATE TABLE `angsuran` (
  `angsuran_id` int(11) NOT NULL,
  `angsuran_pinjaman` varchar(10) NOT NULL,
  `angsuran_waktu` datetime NOT NULL,
  `angsuran_ke` int(11) NOT NULL,
  `angsuran_jumlah` double NOT NULL,
  `angsuran_denda` double NOT NULL,
  `angsuran_total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `angsuran`
--

INSERT INTO `angsuran` (`angsuran_id`, `angsuran_pinjaman`, `angsuran_waktu`, `angsuran_ke`, `angsuran_jumlah`, `angsuran_denda`, `angsuran_total`) VALUES
(4, 'P000002', '2022-10-01 21:55:18', 1, 650000, 0, 650000),
(5, 'P000002', '2022-10-01 21:55:32', 2, 650000, 0, 650000),
(6, 'P000002', '2022-10-01 21:55:42', 3, 650000, 0, 650000),
(7, 'P000001', '2022-10-01 21:56:51', 2, 1300000, 0, 1300000),
(8, 'P000001', '2022-10-01 21:57:02', 3, 1300000, 0, 1300000),
(9, 'P000001', '2022-10-01 21:57:12', 4, 1300000, 0, 1300000),
(10, 'P000001', '2022-10-01 21:57:23', 5, 1300000, 0, 1300000),
(15, 'P000004', '2022-10-01 21:59:29', 1, 866666.66666667, 0, 866666),
(16, 'P000004', '2022-10-01 21:59:43', 2, 866666.66666667, 0, 866666),
(17, 'P000004', '2022-10-01 21:59:57', 3, 866666.66666667, 0, 866666),
(18, 'P000001', '2022-11-26 19:20:35', 6, 1300000, 0, 1300000),
(19, 'P000002', '2023-01-09 03:44:55', 4, 650000, 10000, 660000),
(20, 'P000005', '2023-01-09 15:15:14', 1, 1083333.3333333, 0, 1083333);

-- --------------------------------------------------------

--
-- Table structure for table `jurnal`
--

CREATE TABLE `jurnal` (
  `jurnal_id` int(11) NOT NULL,
  `kode` varchar(64) NOT NULL,
  `tanggal` date NOT NULL,
  `kode_akun` varchar(32) NOT NULL,
  `keterangan` text NOT NULL,
  `debit` decimal(10,0) NOT NULL,
  `kredit` decimal(10,0) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jurnal`
--

INSERT INTO `jurnal` (`jurnal_id`, `kode`, `tanggal`, `kode_akun`, `keterangan`, `debit`, `kredit`, `created_at`) VALUES
(11, 'T202209102201261', '2023-01-06', '3-111', 'Modal', '0', '127330000', '2022-09-10 15:01:26'),
(12, 'T202209102201262', '2023-01-06', '1-212', 'Tanah', '150730000', '0', '2022-09-10 15:01:26'),
(13, 'T202209102203410', '2023-01-06', '1-111', 'Kas', '382500000', '0', '2022-09-10 15:03:41'),
(14, 'T202209102203411', '2023-01-06', '1-112', 'Piutang Dagang', '250000000', '0', '2022-09-10 15:03:41'),
(15, 'T202209111441560', '2023-01-06', '1-114', 'Perlengkapan', '11750000', '0', '2022-09-11 07:41:56'),
(16, 'T202209111441561', '2023-01-06', '1-113', 'Persediaan', '45000000', '0', '2022-09-11 07:41:56'),
(17, 'T202210021012360', '2023-01-06', '1-213', 'Bangunan', '123500000', '0', '2022-10-02 03:12:36'),
(18, 'T202210021013070', '2023-01-06', '1-211', 'Peralatan', '23600000', '0', '2022-10-02 03:13:07'),
(19, 'T202210021013530', '2023-01-06', '1-214', 'Akumulasi Penyusutan', '11250000', '0', '2022-10-02 03:13:53'),
(20, 'T202210021020220', '2023-01-06', '2-112', 'Simpanan Sukarela', '0', '137500000', '2022-10-02 03:20:22'),
(21, 'T202210021021210', '2023-01-06', '2-113', 'Simpanan Wajib', '0', '244500000', '2022-10-02 03:21:21'),
(22, 'T202210021023060', '2023-01-06', '2-111', 'Simpanan Pokok', '0', '489000000', '2022-10-02 03:23:06'),
(23, 'T202301091520550', '2023-01-09', '1-111', 'kas1', '2000000', '0', '2023-01-09 08:20:55'),
(24, 'T202301091522170', '2023-01-09', '1-114', 'perlengkapan', '0', '1000000', '2023-01-09 08:22:17');

-- --------------------------------------------------------

--
-- Table structure for table `penarikan`
--

CREATE TABLE `penarikan` (
  `kode` varchar(10) NOT NULL,
  `anggota_id` varchar(10) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penarikan`
--

INSERT INTO `penarikan` (`kode`, `anggota_id`, `amount`, `created_at`) VALUES
('P000001', 'A000001', 10000, '2022-09-11 14:18:52'),
('P000002', 'A000003', 20000, '2022-09-30 02:55:27'),
('P000003', 'A000007', 35000, '2022-09-30 02:55:44'),
('P000004', 'A000010', 20000, '2022-10-01 15:02:11'),
('P000005', 'A000009', 15000, '2022-10-01 15:02:31'),
('P000006', 'A000005', 10000, '2023-01-09 08:18:25');

-- --------------------------------------------------------

--
-- Table structure for table `pinjaman`
--

CREATE TABLE `pinjaman` (
  `pinjaman_kode` varchar(10) NOT NULL,
  `pinjaman_anggota` varchar(10) NOT NULL,
  `pinjaman_jumlah` double NOT NULL,
  `pinjaman_tempo` int(11) NOT NULL,
  `pinjaman_bunga` int(11) NOT NULL,
  `pinjaman_total` double NOT NULL,
  `pinjaman_jaminan` varchar(254) NOT NULL,
  `pinjaman_waktu` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pinjaman`
--

INSERT INTO `pinjaman` (`pinjaman_kode`, `pinjaman_anggota`, `pinjaman_jumlah`, `pinjaman_tempo`, `pinjaman_bunga`, `pinjaman_total`, `pinjaman_jaminan`, `pinjaman_waktu`) VALUES
('P000001', 'A000002', 20000000, 24, 4, 20800000, 'BPKP mobil xenia AD 53643 HZ', '2023-01-09 03:49:07'),
('P000002', 'A000003', 25000000, 24, 4, 26000000, 'BPKB Revo H 3441 EU', '2023-01-09 03:49:38'),
('P000004', 'A000001', 25000000, 36, 4, 26000000, 'BPKB Ayla H 2778 OU', '2023-01-09 03:50:08'),
('P000005', 'A000005', 25000000, 24, 4, 26000000, 'Beat AB 2334 KL', '2023-01-09 15:14:27');

-- --------------------------------------------------------

--
-- Table structure for table `simpanan`
--

CREATE TABLE `simpanan` (
  `simpanan_kode` varchar(10) NOT NULL,
  `simpanan_anggota` varchar(10) NOT NULL,
  `simpanan_jumlah` double NOT NULL,
  `simpanan_jenis` enum('wajib','pokok','sukarela') NOT NULL,
  `simpanan_waktu` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `simpanan`
--

INSERT INTO `simpanan` (`simpanan_kode`, `simpanan_anggota`, `simpanan_jumlah`, `simpanan_jenis`, `simpanan_waktu`) VALUES
('SP000001', 'A000001', 100000, 'pokok', '2022-10-10 06:46:51'),
('SP000002', 'A000002', 100000, 'pokok', '2022-09-30 09:12:48'),
('SP000003', 'A000003', 100000, 'pokok', '2022-09-30 09:13:42'),
('SP000004', 'A000004', 100000, 'pokok', '2023-01-09 03:48:37'),
('SP000005', 'A000005', 100000, 'pokok', '2023-01-09 15:13:08'),
('SS000001', 'A000002', 75000, 'sukarela', '2022-09-30 09:11:47'),
('SS000004', 'A000001', 40000, 'sukarela', '2022-10-01 21:34:47'),
('SS000005', 'A000003', 50000, 'sukarela', '2022-10-01 21:36:27'),
('SS000006', 'A000001', 200000, 'sukarela', '2023-01-09 03:48:05'),
('SS000007', 'A000004', 50000, 'sukarela', '2023-01-09 03:48:23'),
('SS000008', 'A000005', 130000, 'sukarela', '2023-01-09 15:12:21'),
('SW000002', 'A000002', 50000, 'wajib', '2022-09-30 08:57:37'),
('SW000003', 'A000003', 50000, 'wajib', '2022-09-30 08:57:17'),
('SW000004', 'A000001', 50000, 'wajib', '2023-01-09 03:47:26'),
('SW000005', 'A000004', 50000, 'wajib', '2023-01-09 03:47:38'),
('SW000006', 'A000005', 50000, 'wajib', '2023-01-09 15:11:44');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_nama` varchar(100) NOT NULL,
  `user_username` varchar(50) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_level` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_nama`, `user_username`, `user_password`, `user_level`) VALUES
(1, 'Bendahara', 'Bendahara', '202cb962ac59075b964b07152d234b70', 'bendahara'),
(4, 'Ketua Pengawas', 'Pengawas', '202cb962ac59075b964b07152d234b70', 'pengawas'),
(6, 'Manager', 'Manager', '202cb962ac59075b964b07152d234b70', 'manager'),
(8, 'Pengawas', 'Pengawas1', '202cb962ac59075b964b07152d234b70', 'pengawas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`anggota_kode`),
  ADD UNIQUE KEY `anggota_nik` (`anggota_nik`);

--
-- Indexes for table `angsuran`
--
ALTER TABLE `angsuran`
  ADD PRIMARY KEY (`angsuran_id`),
  ADD KEY `angsuran_pinjaman` (`angsuran_pinjaman`);

--
-- Indexes for table `jurnal`
--
ALTER TABLE `jurnal`
  ADD PRIMARY KEY (`jurnal_id`);

--
-- Indexes for table `penarikan`
--
ALTER TABLE `penarikan`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `simpanan_anggota` (`anggota_id`);

--
-- Indexes for table `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD PRIMARY KEY (`pinjaman_kode`),
  ADD KEY `pinjaman_anggota` (`pinjaman_anggota`);

--
-- Indexes for table `simpanan`
--
ALTER TABLE `simpanan`
  ADD PRIMARY KEY (`simpanan_kode`),
  ADD KEY `simpanan_anggota` (`simpanan_anggota`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `angsuran`
--
ALTER TABLE `angsuran`
  MODIFY `angsuran_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `jurnal`
--
ALTER TABLE `jurnal`
  MODIFY `jurnal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `angsuran`
--
ALTER TABLE `angsuran`
  ADD CONSTRAINT `angsuran_ibfk_1` FOREIGN KEY (`angsuran_pinjaman`) REFERENCES `pinjaman` (`pinjaman_kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD CONSTRAINT `pinjaman_ibfk_1` FOREIGN KEY (`pinjaman_anggota`) REFERENCES `anggota` (`anggota_kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `simpanan`
--
ALTER TABLE `simpanan`
  ADD CONSTRAINT `simpanan_ibfk_1` FOREIGN KEY (`simpanan_anggota`) REFERENCES `anggota` (`anggota_kode`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
