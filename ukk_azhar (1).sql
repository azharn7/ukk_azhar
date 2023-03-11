-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Mar 2023 pada 11.28
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ukk_azhar`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `masyarakat`
--

CREATE TABLE `masyarakat` (
  `nik` char(16) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(32) NOT NULL,
  `telp` varchar(13) NOT NULL,
  `level` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `masyarakat`
--

INSERT INTO `masyarakat` (`nik`, `nama`, `username`, `password`, `telp`, `level`) VALUES
('00001', 'Azly', 'Azly', '88ff9837f3dc07634cf8c7584610e63f', '08000000001', 'masyarakat'),
('00002', 'Arya', 'arya', '5d996a9a7a1bd4aaf0fb479624cea188', '08000000002', 'masyarakat'),
('00003', 'Andriano', 'rino', 'b05a0cedae04b6ba59540a4f0d141ff9', '08000000003', 'masyarakat'),
('00004', 'Salsa', 'salsa', '8a0822544847671f66946473a7916c77', '08000000004', 'masyarakat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id_pengaduan` int(11) NOT NULL,
  `tgl_pengaduan` date NOT NULL,
  `nik` char(16) NOT NULL,
  `judul_laporan` varchar(50) NOT NULL,
  `isi_laporan` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` enum('0','proses','selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengaduan`
--

INSERT INTO `pengaduan` (`id_pengaduan`, `tgl_pengaduan`, `nik`, `judul_laporan`, `isi_laporan`, `foto`, `status`) VALUES
(11, '2023-03-10', '00001', 'Kebakaran', 'Telah terjadi kebakaran hutan', '824-kebakaran.jpg', 'selesai'),
(12, '2023-03-10', '00002', 'Banjir', 'Banjir di daerah Jakarta, bagaimana solusinya', '73-banjir.jpg', 'selesai'),
(13, '2023-03-10', '00003', ' Jalan Rusak', 'Jalan rusak di daerah Pangauban', '628-jalan rusak.jpg', 'selesai'),
(14, '2023-03-10', '00004', 'Perampokan Bank', 'Perampokan terjadi di Bank ..... di Jakarta Timur', '680-perampokan.jpg', 'selesai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama_petugas` varchar(35) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(32) NOT NULL,
  `telp` varchar(13) NOT NULL,
  `level` enum('admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `username`, `password`, `telp`, `level`) VALUES
(1, 'Azhar', 'Azhar', '6210ecb188aaca9e0d57e5bdce507e26', '0800000001', 'admin'),
(2, 'Mely', 'Mely', '92633fec8a9b7e746014285abdcb82e5', '0800000002', 'admin'),
(3, 'Qailla', 'qailla', 'f08d0bf6d6088d71dd295dc3fb270cc5', '0800000003', 'petugas'),
(4, 'Saskia', 'saskia', '5f34f4fe16211104369a054f72695f8a', '0800000004', 'petugas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggapan`
--

CREATE TABLE `tanggapan` (
  `id_tanggapan` int(11) NOT NULL,
  `id_pengaduan` int(11) NOT NULL,
  `tgl_tanggapan` date NOT NULL,
  `tanggapan` text NOT NULL,
  `id_petugas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tanggapan`
--

INSERT INTO `tanggapan` (`id_tanggapan`, `id_pengaduan`, `tgl_tanggapan`, `tanggapan`, `id_petugas`) VALUES
(17, 11, '2023-03-10', 'Siap kami akan mengirimkan pemadam kebakaran!', 1),
(18, 12, '2023-03-10', 'Untuk masyarakat harus membuang sampah pada tempatnya!', 2),
(19, 13, '2023-03-10', 'Baik kami segera perbaiki!', 3),
(20, 14, '2023-03-10', 'Kami akan mengirimkan Polisi Segera!', 4);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `masyarakat`
--
ALTER TABLE `masyarakat`
  ADD PRIMARY KEY (`nik`);

--
-- Indeks untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id_pengaduan`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indeks untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`id_tanggapan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id_pengaduan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  MODIFY `id_tanggapan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
