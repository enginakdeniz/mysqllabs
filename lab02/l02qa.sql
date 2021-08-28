
-- BIRINCI SORU
SELECT * FROM yazar WHERE EPOSTA = 'oguzhantas@gmail.com'

-- IKINCI SORU
INSERT INTO `yazar` (`yazarID`, `ADI`, `SOYADI`, `EPOSTA`, `KULLANICIADI`, `SIFRE`) VALUES ('2', 'ERHAN', 'CAN', 'erhan@gmail.com', 'erhanc', '123457');

-- UCUNCU SORU
DELETE FROM makale WHERE SAYAC < 5;

-- DORDUNCU SORU
UPDATE yazar SET ADI = 'Faruk', SOYADI = 'Can', KULLANICIADI = 'farukc', SIFRE = 'abc123'
WHERE yazarID = 5;

-- BESINCI SORU
SELECT * FROM makale WHERE BASLIK LIKE '%şart%'; 

-- ALTINCI SORU
SELECT a.BASLIK, b.KATEGORI FROM makale a,  kategori b 
WHERE a.kategoriID = b.kategoriID
  AND a.TARIH >= '2020-01-01'
  AND a.TARIH <= '2020-12-30';

--YEDINCI SORU
SELECT c.KATEGORI, a.BASLIK, (b.ADI b.SOYADI) as YAZAR from makale a, yazar b, kategori c 
WHERE a.yazarID = b.yazarID
  AND b.kategoriID = c.kategoriID;

-- SEKIZINCI SORU
SELECT * FROM makale 
WHERE BASLIK LIKE '%faktöriyel%' 
   OR ICERIK LIKE '%faktöriyel%'; 

-- DOKUZUNCU SORU
SELECT * FROM makale 
WHERE SAYAC < ( SELECT AVR( SAYAC ) FROM makale )

-- ONUNCU SORU
SELECT b.KATEGORI SUM( a.SAYAC ) FROM makale a, kategori b WHERE a.kategoriID = b.kategoriID
    GROUP BY b.KATEGORI
