-- Yorumlar iki tire ile başlar. Her komutu noktalı virgülle sonlandırın.

-- SQL, anahtar kelimeler konusunda büyük/küçük harfe duyarlı değildir. 
-- Buradaki örnek komutlarda, onları veritabanı, tablo ve sütun adlarından 
-- ayırt etmeyi kolaylaştırdığı için büyük harfle yazıldı.


-- Kullanıcı Yarat
CREATE USER 'someuser'@'localhost' IDENTIFIED BY 'somepassword';

-- Tüm Veritabanlarında Tüm Ayrıcalıkları Ver
GRANT ALL PRIVILEGES ON * . * TO 'someuser'@'localhost';
FLUSH PRIVILEGES;

-- Yetkileri Göster
SHOW GRANTS FOR 'someuser'@'localhost';

-- Yetki Kaldır
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'someuser'@'localhost';

--  Kullancı Kaldır
DROP USER 'someuser'@'localhost';

-- Bir veritabanı oluşturun ve silin. Veritabanı ve tablo adları büyük/küçük 
-- harfe duyarlıdır.
CREATE DATABASE someDatabase;
DROP DATABASE someDatabase;

-- Kullanılabilir veritabanlarını listeleyin.
SHOW DATABASES;

-- Belirli bir mevcut veritabanını kullanın.
USE employees;

-- Şu anda kullanımda olan veritabanı için iki sütunun gösterildiği 
-- tablename1 adlı bir tablo oluşturun. Veri türleri gibi sütunları 
-- nasıl belirttiğinize ilişkin birçok başka seçenek mevcuttur.
CREATE TABLE tablename1 (fname VARCHAR(20), lname VARCHAR(20));

-- Yeni Sütun Ekle
ALTER TABLE tablename1 ADD age VARCHAR(3);

-- Sütun Değiştir
ALTER TABLE tablename1 MODIFY COLUMN age INT(3);

-- Dizin Oluştur ve Kaldır
CREATE INDEX LIndex On tablename1(fname);
DROP INDEX LIndex ON tablename1;

-- tablename1 tablosuna bir bilgi satırı ekleyin. Bu, tablonun bu değerleri
-- kendisine uygun olarak kabul edecek şekilde tanımlandığını varsayar.
INSERT INTO tablename1 VALUES('Richard','Mutt');

-- Çoklu Kayıt ekleme
INSERT INTO tablename1  
       VALUES ('Sara', 'Watson'),
              ('Will', 'Jackson'),
              ('Paula', 'Johnson'),
              ('Tom', 'Spears');

-- tablename1'de, lname değeri 'Mutt' olan tüm satırlar için fname 
-- değerini 'John' olarak değiştirin.
UPDATE tablename1 SET fname='John' WHERE lname='Mutt';

-- lname değerinin 'M' ile başladığı tablename1 tablosundaki satırları silin.
DELETE FROM tablename1 WHERE lname like 'M%';

-- tablename1 tablosundaki tüm satırları boş tabloyu bırakarak silin.
DELETE FROM tablename1;

-- tablename1 tablosunun tamamını kaldırın.
DROP TABLE tablename1;

-- Geçerli veritabanının 'departments' tablosundan tüm satırları ve sütunları seçin.
-- Varsayılan aktivite, interpreter'ın sonuçları ekranınızda listelemesidir.
SELECT * FROM departments;

-- 'departments' tablosundan tüm satırları alın çeker,
-- ama yalnızca dept_no ve dept_name sütunlarını.
-- Komutları satırlara bölmek hata vermez.
SELECT dept_no,
       dept_name FROM departments;

-- Tüm 'departments' sütunlarını alın, ancak yalnızca 5 satır.
SELECT * FROM departments LIMIT 5;


-- 'departments' tablosundan dept_name değerinin 'en' alt metnine   
-- sahip olan dept_name sütun değerlerini alalım.
SELECT dept_name FROM departments WHERE dept_name LIKE '%en%';

-- Retrieve all columns from the departments table where the dept_name
-- column starts with an 'S' and has exactly 4 characters after it.

-- 'departments' tablosundan tüm sütunları çekiyoruz yalnız dept_name 
-- sütunu 'S' ile başlamalı ve ondan sonra tam olarak 4 karakter gelmeli.
SELECT * FROM departments WHERE dept_name LIKE 'S____';

-- 'title' tablosundan başlık değerlerini seçin ancak kopyaları göstermeyin.
SELECT DISTINCT title FROM titles;

-- Yukarıdakiyle aynı, ancak başlık değerlerine göre sıralanmış 
-- (büyük/küçük harfe duyarlı).
SELECT DISTINCT title FROM titles ORDER BY title;

-- Bölümler tablosundaki satır sayısını gösterin.
SELECT COUNT(*) FROM departments;

-- Dept_name değerinin alt metni 'en' olan 'departments' tablosundaki 
-- satır sayısını gösterir.
SELECT COUNT(*) FROM departments WHERE dept_name LIKE '%en%';

-- A JOIN of information from multiple tables: the titles table shows
-- who had what job titles, by their employee numbers, from what
-- date to what date. Retrieve this information, but instead of the
-- employee number, use the employee number as a cross-reference to
-- the employees table to get each employee's first and last name
-- instead. (And only get 10 rows.)

SELECT employees.first_name, employees.last_name,
       titles.title, titles.from_date, titles.to_date
FROM titles INNER JOIN employees ON
       employees.emp_no = titles.emp_no LIMIT 10;

-- List all the tables in all the databases. Implementations typically provide
-- their own shortcut command to do this with the database currently in use.
SELECT * FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE='BASE TABLE';

-- Sıralama Ölçütü (Sort)
SELECT * FROM users ORDER BY last_name ASC;  --Küçükten -> Büyüğe
SELECT * FROM users ORDER BY last_name DESC; --Büyükten -> Küçüğü

-- Sütunları Birleştir
SELECT CONCAT(first_name, ' ', last_name) AS 'Name', dept FROM users;

-- Between (Aralıklı Seçim)
SELECT * FROM users WHERE age BETWEEN 20 AND 25;

-- Çıkış
exit;