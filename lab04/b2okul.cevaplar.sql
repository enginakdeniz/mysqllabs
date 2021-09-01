-- 1. Soru
INSERT INTO `ogrenci` (`ogrenciID`, `ad`, `soyad`, `adres`, `telefon`) VALUES
(123, 'ALI', 'ÖZTÜRK', 'Barbaros Cad', '0 533 466 77 88'),
(345, 'AYSE', 'KAYA', 'Teşvikiye Mah', '0 505 222 33 44'),
(346, 'NUR ALEYNA', 'AYDINLI', 'SUMER MAH BARAJ CAD 2, DURAK NO:49/A ARI TAKSI KARSISI ADANA', '0 553 135 12 78'),
(347, 'ENGIN', 'AKDENIZ', 'mahmutbeyyolu 15.sok no:1 Şirinevler, 34188', '0 505 751 16 84 '),
(348, 'MEHMET EMRAH', 'MORAN', 'ÇALI SAN.BÖL.GEBEÇINARI MEVKİİ, Çalı', '0 536 521 47 96'),
(349, 'ŞENAY', 'BAKAY', 'OLGUNLAR S N 20/15, Kızılay', '0 523 324 58 44');

INSERT INTO `etkinlik` (`etkinlik_adi`, `kapasite`, `ekipman`, `ucret`) VALUES
('Aikido', 10, 'tanto', 80),
('Bale', 15, 'ahşap zemin', 50),
('Basketbol', 5, 'pota', 70),
('Müzik', 3, 'piyano', 100),
('Resim', 20, 'tuval', 45),
('Tiyatro', 10, 'sahne', 60);

INSERT INTO `takvim` (`etkinlik_adi`, `gun`, `baslangic_zamani`, `bitis_zamani`, `yer`) VALUES
('Aikido', 'Cuma', '15:30:00', '16:30:00', 'Salon 2'),
('Bale', 'Pazartesi', '16:30:00', '18:00:00', 'Oda 1'),
('Basketbol', 'Perşembe', '19:30:00', '21:00:00', 'Spor Salonu'),
('Müzik', 'Çarşamba', '15:30:00', '16:30:00', 'Salon 1'),
('Resim', 'Salı', '16:45:00', '17:30:00', 'Salon 4'),
('Tiyatro', 'Çarşamba', '11:30:00', '13:30:00', 'Salon 3');

INSERT INTO `yer` (`yer_adi`, `ekipman`) VALUES
('Salon 1', 'piyano'),
('Salon 1', 'ses sistemi'),
('Salon 2', 'mat, ağırlık'),
('Oda 1', 'ahşap zemin'),
('Salon 3', 'sahne'),
('Salon 4', 'tuval'),
('Spor Salonu', 'pota');

INSERT INTO `kayit` (`ogrenciID`, `etkinlik_adi`) VALUES
(123, 'Müzik'),
(345, 'Bale'),
(123, 'Bale'),
(347, 'Aikido'),
(348, 'Basketbol'),
(349, 'Resim'),
(348, 'Tiyatro');

-- 2. Soru
SELECT ad, soyad, telefon FROM kayit as k
 INNER JOIN ogrenci as o ON o.ogrenciID = k.ogrenciID
 WHERE k.etkinlik_adi IN (SELECT e.etkinlik_adi FROM etkinlik as e
INNER JOIN takvim as t on t.etkinlik_adi = e.etkinlik_adi
WHERE e.ekipman = 'ahşap zemin'
and t.gun IN ('Pazartesi', 'Salı','Çarşamba', 'Perşembe', 'Cuma') )
GROUP by ad, soyad, telefon;

-- 3. Soru
SELECT k.etkinlik_adi, COUNT(*), e.ucret, COUNT(*) * e.ucret as toplam FROM kayit as k 
	JOIN etkinlik as e on k.etkinlik_adi = e.etkinlik_adi
GROUP by etkinlik_adi ORDER by toplam DESC;

-- 4. Soru
SELECT t.gun, t.etkinlik_adi, t.yer, COUNT(k.ogrenciID) FROM takvim as t 
INNER JOIN kayit as k on k.etkinlik_adi = t.etkinlik_adi 
GROUP by t.gun, t.etkinlik_adi, t.yer

-- 5. Soru
SELECT * FROM (
SELECT 'Pazartesi' as day
UNION
SELECT 'Salı' as day
UNION
SELECT 'Çarşamba' as day
UNION
SELECT 'Perşembe' as day
UNION
SELECT 'Cuma' as day
UNION
SELECT 'Cumartesi' as day
UNION
SELECT 'Pazar' as day ) d WHERE day not in ( SELECT t.gun FROM takvim as t GROUP by t.gun )