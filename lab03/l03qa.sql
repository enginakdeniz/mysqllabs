-- SQL Sorguları

-- Soru 1, Öncelikle her ilişki için uygun birincil ve yabancı anahtarları belirleyiniz. Ardından SQL kullanarak aşağıdaki sorguları oluşturunuz.
-- Not:SQL cümleciklerini doğrudan mySQL üzerinde çalıştırarak ödevinizi kontrol edeceğim, lütfen veritabanını oluşturup tüm SQL sorgularınızı çalıştırarak gönderiniz.


-- Soru 2, "Galata Cad" caddesinde bulunan ofiste çalışanlar tarafından yönetilen mülklerin ID, cadde, sehir ve kira bilgilerini listeleyiniz. 
SELECT * FROM kiralikmulk
WHERE calisanID IN (
SELECT calisanID FROM calisan c 
	INNER JOIN emlakofisi e ON c.ofisID = e.ofisID
    	WHERE e.cadde = 'Galata Cad');
		
-- Soru 3, Ofis bulunmayan ancak kiralık mülklerin bulunduğu tüm şehirleri listeleyiniz.
SELECT DISTINCT sehir FROM kiralikmulk 
WHERE sehir not in ( SELECT DISTINCT sehir FROM emlakofisi );

-- Soru 4, Kiralık bir mülkü gören tüm müşterilerin isimlerini ve yorumlarını listeleyiniz.
SELECT m2.adi, m2.soyadi, m1.yorum FROM mulkgosterme m1 INNER JOIN musteri m2 ON m1.musteriID = m2.musteriID;

-- Soru 5, Kayıtlı müşteri olupta hiç mülk gösterimi yapılmamış müşterileri listeleyiniz 
SELECT * FROM musteri WHERE musteriID not IN ( SELECT DISTINCT musteriID FROM mulkgosterme )

-- Soru 6, Maaşları ortalama maaştan yüksek olan tüm çalışanları listeleyiniz
SELECT * FROM `calisan` WHERE maas > (SELECT AVG(maas) FROM `calisan`)

-- Soru 7, Her bir çalışan tarafından yönetilen mülklerin sayısını bulunuz
SELECT CONCAT(c.adi,' ',c.soyadi) as calisan, COUNT(*) as kiralıkmulk FROM kiralikmulk k LEFT JOIN calisan c ON k.calisanID = c.calisanID GROUP by calisan

-- Soru 8, En çok gösterimi yapılmış olan mülkü, sehir, kira, oda sayısı bilgileriyle gösteriniz.
SELECT g.mulkID, m.sehir, m.kira, m.odaSayisi, COUNT(g.mulkID) as gosterimSayisi FROM mulkgosterme g INNER JOIN kiralikmulk m ON g.mulkID = m.mulkID GROUP by g.mulkID ORDER by gosterimSayisi DESC LIMIT 1

-- Soru 9, Bir müşteri silindiğinde mülk gösterme ve kayıt tablolarındaki müşteri kayıtlarını da silen bir trigger yazınız
DELIMITER //
CREATE TRIGGER del_musteri BEFORE DELETE
ON musteri
FOR EACH ROW
BEGIN
	DELETE FROM mulkgosterme WHERE musteriID = OLD.musteriID;
    DELETE FROM kayit WHERE musteriID = OLD.musteriID;
END//
DELIMITER ;

-- Soru 10, Bir çalışanın emlak ofisine kazandırdığı geliri hesaplayan bir prosedür yazınız. Her kiralanan mülk icin %3 komisyon alınmaktadır ve kiralanan mülkler icin kiralanma tarihi alanı atanmış olmalıdır.
DELIMITER //
CREATE PROCEDURE gelirgetir(IN calisanID INT(11))
BEGIN
SELECT round(((SUM(m.kira)/100)*3),2) as gelir  FROM kiralikmulk m WHERE m.calisanID = calisanID and m.kiralanmaTarihi is not null;
END //
DELIMITER ;

--CALL gelirgetir(3);