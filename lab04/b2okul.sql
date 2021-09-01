-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 03 Nis 2021, 19:37:22
-- Sunucu sürümü: 10.4.17-MariaDB
-- PHP Sürümü: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `b2okul`
--
CREATE DATABASE IF NOT EXISTS `b2okul` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `b2okul`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `etkinlik`
--

DROP TABLE IF EXISTS `etkinlik`;
CREATE TABLE IF NOT EXISTS `etkinlik` (
  `etkinlik_adi` varchar(20) NOT NULL,
  `kapasite` int(11) NOT NULL,
  `ekipman` varchar(20) NOT NULL,
  `ucret` int(11) NOT NULL,
  PRIMARY KEY (`etkinlik_adi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- TABLO İLİŞKİLERİ `etkinlik`:
--

--
-- Tablo döküm verisi `etkinlik`
--

INSERT INTO `etkinlik` (`etkinlik_adi`, `kapasite`, `ekipman`, `ucret`) VALUES
('Aikido', 10, 'tanto', 80),
('Bale', 15, 'ahşap zemin', 50),
('Basketbol', 5, 'pota', 70),
('Müzik', 3, 'piyano', 100),
('Resim', 20, 'tuval', 45),
('Tiyatro', 10, 'sahne', 60);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kayit`
--

DROP TABLE IF EXISTS `kayit`;
CREATE TABLE IF NOT EXISTS `kayit` (
  `ogrenciID` int(11) NOT NULL,
  `etkinlik_adi` varchar(20) NOT NULL,
  KEY `ogrenciID` (`ogrenciID`),
  KEY `etkinlik_adi` (`etkinlik_adi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- TABLO İLİŞKİLERİ `kayit`:
--   `ogrenciID`
--       `ogrenci` -> `ogrenciID`
--

--
-- Tablo döküm verisi `kayit`
--

INSERT INTO `kayit` (`ogrenciID`, `etkinlik_adi`) VALUES
(123, 'Müzik'),
(345, 'Bale'),
(123, 'Bale'),
(347, 'Aikido'),
(348, 'Basketbol'),
(349, 'Resim'),
(348, 'Tiyatro');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ogrenci`
--

DROP TABLE IF EXISTS `ogrenci`;
CREATE TABLE IF NOT EXISTS `ogrenci` (
  `ogrenciID` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(20) NOT NULL,
  `soyad` varchar(20) NOT NULL,
  `adres` varchar(255) NOT NULL,
  `telefon` varchar(20) NOT NULL,
  PRIMARY KEY (`ogrenciID`)
) ENGINE=InnoDB AUTO_INCREMENT=350 DEFAULT CHARSET=utf8mb4;

--
-- TABLO İLİŞKİLERİ `ogrenci`:
--

--
-- Tablo döküm verisi `ogrenci`
--

INSERT INTO `ogrenci` (`ogrenciID`, `ad`, `soyad`, `adres`, `telefon`) VALUES
(123, 'ALI', 'ÖZTÜRK', 'Barbaros Cad', '0 533 466 77 88'),
(345, 'AYSE', 'KAYA', 'Teşvikiye Mah', '0 505 222 33 44'),
(346, 'NUR ALEYNA', 'AYDINLI', 'SUMER MAH BARAJ CAD 2, DURAK NO:49/A ARI TAKSI KARSISI ADANA', '0 553 135 12 78'),
(347, 'ENGIN', 'AKDENIZ', 'mahmutbeyyolu 15.sok no:1 Şirinevler, 34188', '0 505 751 16 84 '),
(348, 'MEHMET EMRAH', 'MORAN', 'ÇALI SAN.BÖL.GEBEÇINARI MEVKİİ, Çalı', '0 536 521 47 96'),
(349, 'ŞENAY', 'BAKAY', 'OLGUNLAR S N 20/15, Kızılay', '0 523 324 58 44');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `takvim`
--

DROP TABLE IF EXISTS `takvim`;
CREATE TABLE IF NOT EXISTS `takvim` (
  `etkinlik_adi` varchar(20) NOT NULL,
  `gun` varchar(20) NOT NULL,
  `baslangic_zamani` time NOT NULL,
  `bitis_zamani` time NOT NULL,
  `yer` varchar(20) NOT NULL,
  PRIMARY KEY (`etkinlik_adi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- TABLO İLİŞKİLERİ `takvim`:
--

--
-- Tablo döküm verisi `takvim`
--

INSERT INTO `takvim` (`etkinlik_adi`, `gun`, `baslangic_zamani`, `bitis_zamani`, `yer`) VALUES
('Aikido', 'Cuma', '15:30:00', '16:30:00', 'Salon 2'),
('Bale', 'Pazartesi', '16:30:00', '18:00:00', 'Oda 1'),
('Basketbol', 'Perşembe', '19:30:00', '21:00:00', 'Spor Salonu'),
('Müzik', 'Çarşamba', '15:30:00', '16:30:00', 'Salon 1'),
('Resim', 'Salı', '16:45:00', '17:30:00', 'Salon 4'),
('Tiyatro', 'Çarşamba', '11:30:00', '13:30:00', 'Salon 3');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yer`
--

DROP TABLE IF EXISTS `yer`;
CREATE TABLE IF NOT EXISTS `yer` (
  `yer_adi` varchar(20) NOT NULL,
  `ekipman` varchar(20) NOT NULL,
  KEY `yer_adi` (`yer_adi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- TABLO İLİŞKİLERİ `yer`:
--

--
-- Tablo döküm verisi `yer`
--

INSERT INTO `yer` (`yer_adi`, `ekipman`) VALUES
('Salon 1', 'piyano'),
('Salon 1', 'ses sistemi'),
('Salon 2', 'mat, ağırlık'),
('Oda 1', 'ahşap zemin'),
('Salon 3', 'sahne'),
('Salon 4', 'tuval'),
('Spor Salonu', 'pota');

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `kayit`
--
ALTER TABLE `kayit`
  ADD CONSTRAINT `kayit_ibfk_1` FOREIGN KEY (`ogrenciID`) REFERENCES `ogrenci` (`ogrenciID`);


--
-- Üstveri
--
USE `phpmyadmin`;

--
-- etkinlik tablosu için üstveri
--

--
-- kayit tablosu için üstveri
--

--
-- ogrenci tablosu için üstveri
--

--
-- takvim tablosu için üstveri
--

--
-- Tablo döküm verisi `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'b2okul', 'takvim', '{\"sorted_col\":\"`takvim`.`etkinlik_adi` ASC\"}', '2021-04-03 16:28:26');

--
-- yer tablosu için üstveri
--

--
-- b2okul veritabanı için üstveri
--

--
-- Tablo döküm verisi `pma__pdf_pages`
--

INSERT INTO `pma__pdf_pages` (`db_name`, `page_descr`) VALUES
('b2okul', 'aa');

SET @LAST_PAGE = LAST_INSERT_ID();

--
-- Tablo döküm verisi `pma__table_coords`
--

INSERT INTO `pma__table_coords` (`db_name`, `table_name`, `pdf_page_number`, `x`, `y`) VALUES
('b2okul', 'etkinlik', @LAST_PAGE, 292, 491),
('b2okul', 'kayit', @LAST_PAGE, 600, 310),
('b2okul', 'ogrenci', @LAST_PAGE, 340, 320),
('b2okul', 'takvim', @LAST_PAGE, 570, 570),
('b2okul', 'yer', @LAST_PAGE, 67, 408);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
