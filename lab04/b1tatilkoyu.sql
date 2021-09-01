-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 03 Nis 2021, 17:53:12
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
-- Veritabanı: `b1tatilkoyu`
--
CREATE DATABASE IF NOT EXISTS `b1tatilkoyu` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `b1tatilkoyu`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `adb`
--

DROP TABLE IF EXISTS `adb`;
CREATE TABLE IF NOT EXISTS `adb` (
  `akid` int(11) NOT NULL,
  `telefon` varchar(20) NOT NULL,
  `dolap_no` tinyint(4) NOT NULL,
  UNIQUE KEY `akid` (`akid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- TABLO İLİŞKİLERİ `adb`:
--   `akid`
--       `aktivite` -> `akid`
--

--
-- Tablo döküm verisi `adb`
--

INSERT INTO `adb` (`akid`, `telefon`, `dolap_no`) VALUES
(5, '555-555-55-55', 6),
(6, '555-555-55-55', 5);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `aktivite`
--

DROP TABLE IF EXISTS `aktivite`;
CREATE TABLE IF NOT EXISTS `aktivite` (
  `akid` int(11) NOT NULL AUTO_INCREMENT,
  `aktivite_adi` varchar(20) NOT NULL,
  `aktivite_tipi` tinyint(4) NOT NULL,
  `internet` tinyint(1) NOT NULL DEFAULT 0,
  `katilim_sarti` text NOT NULL,
  `kapasite` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`akid`),
  KEY `aktivite_tipi` (`aktivite_tipi`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- TABLO İLİŞKİLERİ `aktivite`:
--   `aktivite_tipi`
--       `aktivite_tipi` -> `atid`
--

--
-- Tablo döküm verisi `aktivite`
--

INSERT INTO `aktivite` (`akid`, `aktivite_adi`, `aktivite_tipi`, `internet`, `katilim_sarti`, `kapasite`) VALUES
(1, 'Aerobic', 1, 0, '', 20),
(2, 'Surf Okulu', 1, 0, '', 10),
(3, 'Havuz Oyunları', 1, 0, '', 15),
(4, 'Su Altı Turu', 2, 0, '2 saatlik etkinlik öncesi eğitim', 1),
(5, 'Kaçış Oyunları', 1, 0, '', 9),
(6, 'Paintball', 1, 0, '', 16),
(7, 'Masaj ', 2, 0, '', 1),
(8, 'Binicilik', 2, 0, '', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `aktivite_tipi`
--

DROP TABLE IF EXISTS `aktivite_tipi`;
CREATE TABLE IF NOT EXISTS `aktivite_tipi` (
  `atid` tinyint(4) NOT NULL,
  `aktivite_tipi` varchar(20) NOT NULL,
  PRIMARY KEY (`atid`),
  KEY `atid` (`atid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- TABLO İLİŞKİLERİ `aktivite_tipi`:
--

--
-- Tablo döküm verisi `aktivite_tipi`
--

INSERT INTO `aktivite_tipi` (`atid`, `aktivite_tipi`) VALUES
(1, 'Grup Akitivite'),
(2, 'Bireysel Aktivite');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `animator`
--

DROP TABLE IF EXISTS `animator`;
CREATE TABLE IF NOT EXISTS `animator` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `adi` varchar(20) NOT NULL,
  `soyadi` varchar(20) NOT NULL,
  `telefon` varchar(20) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- TABLO İLİŞKİLERİ `animator`:
--

--
-- Tablo döküm verisi `animator`
--

INSERT INTO `animator` (`aid`, `adi`, `soyadi`, `telefon`) VALUES
(1, 'İLAYDA', 'ÇETİNER', ''),
(2, 'CAFER', 'BALİ', ''),
(3, 'GÜLÇİN', 'VOYVODA', ''),
(4, 'NURMUHAMMET', 'EMMEZ', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bireysel_akt`
--

DROP TABLE IF EXISTS `bireysel_akt`;
CREATE TABLE IF NOT EXISTS `bireysel_akt` (
  `tarih` datetime NOT NULL,
  `aid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `akid` int(11) NOT NULL,
  KEY `tarih` (`tarih`),
  KEY `aid` (`aid`),
  KEY `mid` (`mid`),
  KEY `akid` (`akid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- TABLO İLİŞKİLERİ `bireysel_akt`:
--   `mid`
--       `musteri` -> `mid`
--   `akid`
--       `aktivite` -> `akid`
--   `aid`
--       `animator` -> `aid`
--

--
-- Tablo döküm verisi `bireysel_akt`
--

INSERT INTO `bireysel_akt` (`tarih`, `aid`, `mid`, `akid`) VALUES
('2021-04-02 18:00:00', 2, 1, 8),
('2021-04-02 18:00:00', 3, 2, 7);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ekipanim`
--

DROP TABLE IF EXISTS `ekipanim`;
CREATE TABLE IF NOT EXISTS `ekipanim` (
  `ekid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  KEY `ekid` (`ekid`,`aid`),
  KEY `aid` (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- TABLO İLİŞKİLERİ `ekipanim`:
--   `aid`
--       `animator` -> `aid`
--   `ekid`
--       `ekipman` -> `ekid`
--

--
-- Tablo döküm verisi `ekipanim`
--

INSERT INTO `ekipanim` (`ekid`, `aid`) VALUES
(1, 1),
(1, 3),
(2, 1),
(2, 3),
(4, 2),
(4, 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ekipman`
--

DROP TABLE IF EXISTS `ekipman`;
CREATE TABLE IF NOT EXISTS `ekipman` (
  `ekid` int(11) NOT NULL AUTO_INCREMENT,
  `ekipman_adi` varchar(20) NOT NULL,
  `kullanım_amaci` text NOT NULL,
  PRIMARY KEY (`ekid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- TABLO İLİŞKİLERİ `ekipman`:
--

--
-- Tablo döküm verisi `ekipman`
--

INSERT INTO `ekipman` (`ekid`, `ekipman_adi`, `kullanım_amaci`) VALUES
(1, 'Dalış Tüpü', 'Dalış'),
(2, 'Snorkel', 'Dalış'),
(3, 'Paintball Tabancası', 'Paintball'),
(4, 'Maske Tulum Seti', 'Paintball');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `grup_akt`
--

DROP TABLE IF EXISTS `grup_akt`;
CREATE TABLE IF NOT EXISTS `grup_akt` (
  `tarih` datetime NOT NULL,
  `aid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `akid` int(11) NOT NULL,
  KEY `tarih` (`tarih`),
  KEY `aid` (`aid`),
  KEY `mid` (`mid`),
  KEY `akid` (`akid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- TABLO İLİŞKİLERİ `grup_akt`:
--   `aid`
--       `animator` -> `aid`
--   `mid`
--       `musteri` -> `mid`
--   `akid`
--       `aktivite` -> `akid`
--

--
-- Tablo döküm verisi `grup_akt`
--

INSERT INTO `grup_akt` (`tarih`, `aid`, `mid`, `akid`) VALUES
('2021-04-02 18:00:00', 4, 3, 6),
('2021-04-02 18:00:00', 4, 3, 3),
('2021-04-02 17:00:00', 1, 3, 1),
('2021-04-02 16:00:00', 3, 4, 6);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `musteri`
--

DROP TABLE IF EXISTS `musteri`;
CREATE TABLE IF NOT EXISTS `musteri` (
  `mid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Müşteri ID',
  `adi` varchar(20) NOT NULL,
  `soyadi` varchar(20) NOT NULL,
  `yasi` int(11) NOT NULL,
  `oda` int(11) NOT NULL,
  `telefon` varchar(20) NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- TABLO İLİŞKİLERİ `musteri`:
--

--
-- Tablo döküm verisi `musteri`
--

INSERT INTO `musteri` (`mid`, `adi`, `soyadi`, `yasi`, `oda`, `telefon`) VALUES
(1, 'CEBBAR ', 'KÜRKÇÜOĞLU', 36, 8, ''),
(2, 'AYLİN ', 'KARTAL', 30, 3, ''),
(3, 'FERHAT', 'ALOĞLU', 19, 2, ''),
(4, 'VİLDAN', 'ESENER', 19, 2, ''),
(5, 'MUSTAFA GÜRHAN', 'YAKALI', 27, 7, ''),
(6, 'FATMA SELCEN', 'KOCACIKLI', 24, 6, '');

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `adb`
--
ALTER TABLE `adb`
  ADD CONSTRAINT `adb_ibfk_1` FOREIGN KEY (`akid`) REFERENCES `aktivite` (`akid`);

--
-- Tablo kısıtlamaları `aktivite`
--
ALTER TABLE `aktivite`
  ADD CONSTRAINT `aktivite_ibfk_1` FOREIGN KEY (`aktivite_tipi`) REFERENCES `aktivite_tipi` (`atid`);

--
-- Tablo kısıtlamaları `bireysel_akt`
--
ALTER TABLE `bireysel_akt`
  ADD CONSTRAINT `bireysel_akt_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `musteri` (`mid`),
  ADD CONSTRAINT `bireysel_akt_ibfk_2` FOREIGN KEY (`akid`) REFERENCES `aktivite` (`akid`),
  ADD CONSTRAINT `bireysel_akt_ibfk_3` FOREIGN KEY (`aid`) REFERENCES `animator` (`aid`);

--
-- Tablo kısıtlamaları `ekipanim`
--
ALTER TABLE `ekipanim`
  ADD CONSTRAINT `ekipanim_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `animator` (`aid`),
  ADD CONSTRAINT `ekipanim_ibfk_2` FOREIGN KEY (`ekid`) REFERENCES `ekipman` (`ekid`);

--
-- Tablo kısıtlamaları `grup_akt`
--
ALTER TABLE `grup_akt`
  ADD CONSTRAINT `grup_akt_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `animator` (`aid`),
  ADD CONSTRAINT `grup_akt_ibfk_2` FOREIGN KEY (`mid`) REFERENCES `musteri` (`mid`),
  ADD CONSTRAINT `grup_akt_ibfk_3` FOREIGN KEY (`akid`) REFERENCES `aktivite` (`akid`);


--
-- Üstveri
--
USE `phpmyadmin`;

--
-- adb tablosu için üstveri
--

--
-- aktivite tablosu için üstveri
--

--
-- aktivite_tipi tablosu için üstveri
--

--
-- animator tablosu için üstveri
--

--
-- bireysel_akt tablosu için üstveri
--

--
-- ekipanim tablosu için üstveri
--

--
-- ekipman tablosu için üstveri
--

--
-- grup_akt tablosu için üstveri
--

--
-- musteri tablosu için üstveri
--

--
-- b1tatilkoyu veritabanı için üstveri
--

--
-- Tablo döküm verisi `pma__pdf_pages`
--

INSERT INTO `pma__pdf_pages` (`db_name`, `page_descr`) VALUES
('b1tatilkoyu', 'a');

SET @LAST_PAGE = LAST_INSERT_ID();

--
-- Tablo döküm verisi `pma__table_coords`
--

INSERT INTO `pma__table_coords` (`db_name`, `table_name`, `pdf_page_number`, `x`, `y`) VALUES
('b1tatilkoyu', 'adb', @LAST_PAGE, 590, 540),
('b1tatilkoyu', 'aktivite', @LAST_PAGE, 350, 540),
('b1tatilkoyu', 'aktivite_tipi', @LAST_PAGE, 590, 630),
('b1tatilkoyu', 'animator', @LAST_PAGE, 350, 250),
('b1tatilkoyu', 'bireysel_akt', @LAST_PAGE, 100, 410),
('b1tatilkoyu', 'ekipanim', @LAST_PAGE, 580, 250),
('b1tatilkoyu', 'ekipman', @LAST_PAGE, 770, 250),
('b1tatilkoyu', 'grup_akt', @LAST_PAGE, 100, 260),
('b1tatilkoyu', 'musteri', @LAST_PAGE, 350, 370);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
