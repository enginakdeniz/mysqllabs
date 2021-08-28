-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 11 May 2021, 14:50:57
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
-- Veritabanı: `emlakofisi`
--
CREATE DATABASE IF NOT EXISTS `emlakofisi` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `emlakofisi`;

DELIMITER $$
--
-- Yordamlar
--
DROP PROCEDURE IF EXISTS `gelirgetir`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `gelirgetir` (IN `calisanID` INT(11))  BEGIN
SELECT round(((SUM(m.kira)/100)*3),2) as gelir  FROM kiralikmulk m WHERE m.calisanID = calisanID and m.kiralanmaTarihi is not null;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `calisan`
--

DROP TABLE IF EXISTS `calisan`;
CREATE TABLE IF NOT EXISTS `calisan` (
  `calisanID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Çalışan ID',
  `adi` varchar(20) NOT NULL COMMENT 'Adı',
  `soyadi` varchar(20) NOT NULL COMMENT 'Soyadı',
  `pozisyon` varchar(20) NOT NULL COMMENT 'Pozisyon',
  `cinsiyet` varchar(1) NOT NULL COMMENT 'Cinsiyet',
  `maas` int(11) NOT NULL COMMENT 'Maaş',
  `ofisID` int(11) NOT NULL COMMENT 'Ofis ID',
  PRIMARY KEY (`calisanID`),
  KEY `ofisID` (`ofisID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- TABLO İLİŞKİLERİ `calisan`:
--   `ofisID`
--       `emlakofisi` -> `ofisID`
--

--
-- Tablo döküm verisi `calisan`
--

INSERT INTO `calisan` (`calisanID`, `adi`, `soyadi`, `pozisyon`, `cinsiyet`, `maas`, `ofisID`) VALUES
(1, 'Ferhat', 'Aloğlu', 'Emlak Danışmanı', 'E', 3200, 1),
(2, 'Vildan', 'Esener', 'Emlak Danışmanı', 'K', 3200, 3),
(3, 'Yaşar', 'Yıldız', 'Emlak Danışmanı', 'E', 3500, 1),
(4, 'Naime', 'Sekmen', 'Emlak Danışmanı', 'K', 3300, 4),
(5, 'Erman', 'Kulunyaz', 'Emlak Danışmanı', 'E', 3200, 2),
(6, 'Fadime', 'Eren', 'Emlak Danışmanı', 'K', 3400, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `emlakofisi`
--

DROP TABLE IF EXISTS `emlakofisi`;
CREATE TABLE IF NOT EXISTS `emlakofisi` (
  `ofisID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Ofis ID',
  `cadde` varchar(50) NOT NULL COMMENT 'Cadde',
  `sehir` varchar(50) NOT NULL COMMENT 'Şehir',
  `postaKodu` smallint(5) UNSIGNED NOT NULL COMMENT 'Posta Kodu',
  PRIMARY KEY (`ofisID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- TABLO İLİŞKİLERİ `emlakofisi`:
--

--
-- Tablo döküm verisi `emlakofisi`
--

INSERT INTO `emlakofisi` (`ofisID`, `cadde`, `sehir`, `postaKodu`) VALUES
(1, 'Galata Cad', 'İstanbul', 34500),
(2, 'Bağdat Cad', 'İstanbul', 34740),
(3, 'Oran Mah', 'Ankara', 6400),
(4, 'Bornova Merkez Mah', 'İzmir', 35040);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kayit`
--

DROP TABLE IF EXISTS `kayit`;
CREATE TABLE IF NOT EXISTS `kayit` (
  `musteriID` int(11) NOT NULL,
  `ofisID` int(11) NOT NULL,
  `calisanID` int(11) NOT NULL,
  `kayitTarihi` date NOT NULL,
  KEY `ofisID` (`ofisID`),
  KEY `musteriID` (`musteriID`),
  KEY `calisanID` (`calisanID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- TABLO İLİŞKİLERİ `kayit`:
--   `calisanID`
--       `calisan` -> `calisanID`
--   `musteriID`
--       `musteri` -> `musteriID`
--   `ofisID`
--       `emlakofisi` -> `ofisID`
--

--
-- Tablo döküm verisi `kayit`
--

INSERT INTO `kayit` (`musteriID`, `ofisID`, `calisanID`, `kayitTarihi`) VALUES
(1, 1, 1, '2021-05-01'),
(3, 3, 2, '2021-05-02'),
(2, 4, 5, '2021-05-04'),
(1, 1, 3, '2021-05-06');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kiralikmulk`
--

DROP TABLE IF EXISTS `kiralikmulk`;
CREATE TABLE IF NOT EXISTS `kiralikmulk` (
  `mulkID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mülk ID',
  `cadde` varchar(20) NOT NULL COMMENT 'Cadde',
  `sehir` varchar(20) NOT NULL COMMENT 'Şehir',
  `postaKodu` smallint(5) UNSIGNED NOT NULL COMMENT 'Posta Kodu',
  `tip` varchar(20) NOT NULL COMMENT 'Tip',
  `odaSayisi` varchar(5) NOT NULL COMMENT 'Oda Sayısı',
  `kira` int(11) UNSIGNED NOT NULL COMMENT 'Kira',
  `mulkSahibiID` int(11) NOT NULL COMMENT 'Mülk Sahibi ID',
  `calisanID` int(11) NOT NULL COMMENT 'Çalışan ID',
  `ofisID` int(11) NOT NULL COMMENT 'Ofis ID',
  `kiralanmaTarihi` date NOT NULL COMMENT 'Kiralama Tarihi',
  PRIMARY KEY (`mulkID`),
  KEY `mulkSahibiID` (`mulkSahibiID`),
  KEY `calisanID` (`calisanID`),
  KEY `ofisID` (`ofisID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- TABLO İLİŞKİLERİ `kiralikmulk`:
--   `mulkSahibiID`
--       `mulksahibi` -> `mulkSahibiID`
--   `calisanID`
--       `calisan` -> `calisanID`
--   `ofisID`
--       `emlakofisi` -> `ofisID`
--

--
-- Tablo döküm verisi `kiralikmulk`
--

INSERT INTO `kiralikmulk` (`mulkID`, `cadde`, `sehir`, `postaKodu`, `tip`, `odaSayisi`, `kira`, `mulkSahibiID`, `calisanID`, `ofisID`, `kiralanmaTarihi`) VALUES
(1, '205/31. Sok', 'İzmir', 35390, 'Daire', '1+1', 1000, 1, 3, 1, '2021-05-10'),
(2, 'Etiler Mah', 'İstanbul', 34000, 'Daire', '3+1', 6000, 2, 2, 1, '2021-05-08'),
(3, 'Dumlupınar Mah', 'Bursa', 16000, 'Daire', '2+1', 1200, 5, 4, 1, '2021-05-08'),
(4, 'Taşucu Mah', 'Mersin', 33000, 'Daire', '3+1', 4000, 4, 6, 1, '2021-05-05'),
(5, 'Şişli Merkez Mah', 'İstanbul', 34381, 'Daire', '1+0', 1700, 5, 2, 1, '2021-05-05'),
(6, 'Yenişehir Mah', 'Sivas', 58030, 'Daire', '1+1', 2200, 1, 1, 1, '2021-05-03'),
(7, 'Gaziosmanpaşa Mah', 'Ankara', 6700, 'Daire', '3+1', 3500, 3, 3, 1, '2021-05-03');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mulkgosterme`
--

DROP TABLE IF EXISTS `mulkgosterme`;
CREATE TABLE IF NOT EXISTS `mulkgosterme` (
  `musteriID` int(11) NOT NULL COMMENT 'Müşteri ID',
  `mulkID` int(11) NOT NULL COMMENT 'Mülk ID',
  `gostermeZamani` date NOT NULL COMMENT 'Gösterme Zamanı',
  `yorum` text NOT NULL COMMENT 'Yorum',
  KEY `mulkID` (`mulkID`),
  KEY `musteriID` (`musteriID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- TABLO İLİŞKİLERİ `mulkgosterme`:
--   `mulkID`
--       `kiralikmulk` -> `mulkID`
--   `musteriID`
--       `musteri` -> `musteriID`
--

--
-- Tablo döküm verisi `mulkgosterme`
--

INSERT INTO `mulkgosterme` (`musteriID`, `mulkID`, `gostermeZamani`, `yorum`) VALUES
(1, 1, '2021-05-02', 'EGE ÜNİVERSİTESİ, YAŞAR ÜNİVERSİTESİ VE FORUM BORNOVA AVM’YE YÜRÜME MESAFESİNDE.'),
(2, 7, '2021-05-06', 'TEMİZ MOBILYALI 1.KAT ÖN CEPHE DAİRE'),
(4, 2, '2021-05-10', 'BÜTÇEMİZE UYGUN DEĞİL VE FAZLA BÜYÜK'),
(4, 3, '2021-05-10', 'MERKEZİ YERLERE FAZLA UZAK'),
(1, 5, '2021-05-01', 'DAİRE ÇOK KÜÇÜK'),
(2, 5, '2021-05-02', 'ÖZELLİKLERİ GÜZEL AMA ÇOK KÜÇÜK VE AİDAT ÇOK FAZLA'),
(3, 5, '2021-05-03', 'AİDAT ÇOK FALZA'),
(4, 5, '2021-05-05', 'OLANAKLAR GÜZEL AMA O KADAR, YATAK ATSAN ODA DOLAR, OTEL ODASI GİBİ YER. ZATEN AİDAT DA OTEL FİYATINA..!');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mulksahibi`
--

DROP TABLE IF EXISTS `mulksahibi`;
CREATE TABLE IF NOT EXISTS `mulksahibi` (
  `mulkSahibiID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mülk Sahibi ID',
  `adi` varchar(20) NOT NULL COMMENT 'Adı',
  `soyadi` varchar(20) NOT NULL COMMENT 'Soyadı',
  `adres` text NOT NULL COMMENT 'Adres',
  `tel` varchar(20) NOT NULL COMMENT 'Telefon',
  PRIMARY KEY (`mulkSahibiID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- TABLO İLİŞKİLERİ `mulksahibi`:
--

--
-- Tablo döküm verisi `mulksahibi`
--

INSERT INTO `mulksahibi` (`mulkSahibiID`, `adi`, `soyadi`, `adres`, `tel`) VALUES
(1, 'Mehmet Emrah', 'Akansen', 'Abide-i Hürriyet Cad. Reha Yurdakul Sokak. Emel Pa', '+905067799123'),
(2, 'Derya', 'Baysoydan', 'Gurbet pınar Mevkii, Bekir Saydam Caddesi No:88, P', '+90507312645'),
(3, 'Ferhat', 'Üstünyağız', 'Ayazağa Mah. Mezarlık Sok No:5 Ayazağa, 34000', '+905067539512'),
(4, 'Mehmet Suphi', 'Başpınar', 'Çankaya Mh.Özdoğan İşh. Küçükhamam Durağı 11/C, 033', '+905074433555'),
(5, 'Arda', 'Ünalan', 'Bağdat Cad. Harput Apt. No:503/6 Bostancı - Kadıköy / İSTANBUL ( Bostancı Trafik Şube Müdürlüğü Yanı', '+905064578951'),
(6, 'Onur', 'Bilgin', 'Murat Reis Mah. Tahtaravancı Sok, NO:13 Üsküdar', '+905067595789');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `musteri`
--

DROP TABLE IF EXISTS `musteri`;
CREATE TABLE IF NOT EXISTS `musteri` (
  `musteriID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Müşteri ID',
  `adi` varchar(20) NOT NULL COMMENT 'Adı',
  `soyadi` varchar(20) NOT NULL COMMENT 'Soyadı',
  `tel` varchar(20) NOT NULL COMMENT 'Telefon',
  `maxKira` int(11) UNSIGNED NOT NULL COMMENT 'Maksimum Kira',
  PRIMARY KEY (`musteriID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- TABLO İLİŞKİLERİ `musteri`:
--

--
-- Tablo döküm verisi `musteri`
--

INSERT INTO `musteri` (`musteriID`, `adi`, `soyadi`, `tel`, `maxKira`) VALUES
(1, 'Tuğçe ', 'Özkök', '+905304272433', 2000),
(2, 'Kağan', 'Yılmaz', '+905495001733', 1500),
(3, 'İlker', 'Çaykara', '+905334660532', 2500),
(4, 'Murat', 'Karadeniz', '+905323948804', 3000),
(5, 'Alpaslan', 'Düven', '+905541668869', 3500),
(6, 'Güney', 'Gürgen', '+905387255600', 1900);

--
-- Tetikleyiciler `musteri`
--
DROP TRIGGER IF EXISTS `del_musteri`;
DELIMITER $$
CREATE TRIGGER `del_musteri` BEFORE DELETE ON `musteri` FOR EACH ROW BEGIN
	DELETE FROM mulkgosterme WHERE musteriID = OLD.musteriID;
    DELETE FROM kayit WHERE musteriID = OLD.musteriID;
END
$$
DELIMITER ;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `calisan`
--
ALTER TABLE `calisan`
  ADD CONSTRAINT `calisan_ibfk_1` FOREIGN KEY (`ofisID`) REFERENCES `emlakofisi` (`ofisID`);

--
-- Tablo kısıtlamaları `kayit`
--
ALTER TABLE `kayit`
  ADD CONSTRAINT `kayit_ibfk_1` FOREIGN KEY (`calisanID`) REFERENCES `calisan` (`calisanID`),
  ADD CONSTRAINT `kayit_ibfk_2` FOREIGN KEY (`musteriID`) REFERENCES `musteri` (`musteriID`),
  ADD CONSTRAINT `kayit_ibfk_3` FOREIGN KEY (`ofisID`) REFERENCES `emlakofisi` (`ofisID`);

--
-- Tablo kısıtlamaları `kiralikmulk`
--
ALTER TABLE `kiralikmulk`
  ADD CONSTRAINT `kiralikmulk_ibfk_1` FOREIGN KEY (`mulkSahibiID`) REFERENCES `mulksahibi` (`mulkSahibiID`),
  ADD CONSTRAINT `kiralikmulk_ibfk_2` FOREIGN KEY (`calisanID`) REFERENCES `calisan` (`calisanID`),
  ADD CONSTRAINT `kiralikmulk_ibfk_3` FOREIGN KEY (`ofisID`) REFERENCES `emlakofisi` (`ofisID`);

--
-- Tablo kısıtlamaları `mulkgosterme`
--
ALTER TABLE `mulkgosterme`
  ADD CONSTRAINT `mulkgosterme_ibfk_1` FOREIGN KEY (`mulkID`) REFERENCES `kiralikmulk` (`mulkID`),
  ADD CONSTRAINT `mulkgosterme_ibfk_2` FOREIGN KEY (`musteriID`) REFERENCES `musteri` (`musteriID`);


--
-- Üstveri
--
USE `phpmyadmin`;

--
-- calisan tablosu için üstveri
--

--
-- Tablo döküm verisi `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'emlakofisi', 'calisan', '{\"sorted_col\":\"`calisan`.`calisanID` ASC\"}', '2021-05-10 15:04:22');

--
-- emlakofisi tablosu için üstveri
--

--
-- kayit tablosu için üstveri
--

--
-- kiralikmulk tablosu için üstveri
--

--
-- Tablo döküm verisi `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'emlakofisi', 'kiralikmulk', '{\"sorted_col\":\"`kiralikmulk`.`calisanID` ASC\"}', '2021-05-11 12:23:28');

--
-- mulkgosterme tablosu için üstveri
--

--
-- Tablo döküm verisi `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'emlakofisi', 'mulkgosterme', '{\"sorted_col\":\"`mulkgosterme`.`mulkID` ASC\"}', '2021-05-11 07:45:28');

--
-- mulksahibi tablosu için üstveri
--

--
-- musteri tablosu için üstveri
--

--
-- emlakofisi veritabanı için üstveri
--

--
-- Tablo döküm verisi `pma__pdf_pages`
--

INSERT INTO `pma__pdf_pages` (`db_name`, `page_descr`) VALUES
('emlakofisi', 'reletion');

SET @LAST_PAGE = LAST_INSERT_ID();

--
-- Tablo döküm verisi `pma__table_coords`
--

INSERT INTO `pma__table_coords` (`db_name`, `table_name`, `pdf_page_number`, `x`, `y`) VALUES
('emlakofisi', 'calisan', @LAST_PAGE, 580, 510),
('emlakofisi', 'emlakofisi', @LAST_PAGE, 300, 620),
('emlakofisi', 'kayit', @LAST_PAGE, 120, 480),
('emlakofisi', 'kiralikmulk', @LAST_PAGE, 60, 140),
('emlakofisi', 'mulkgosterme', @LAST_PAGE, 380, 120),
('emlakofisi', 'mulksahibi', @LAST_PAGE, 380, 250),
('emlakofisi', 'musteri', @LAST_PAGE, 700, 330);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
