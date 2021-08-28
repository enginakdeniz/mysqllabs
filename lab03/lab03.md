Bir emlak ofisi için aşağıdaki ilişkisel veritabanı şemasına sahip olduğunuzu varsayınız:

## Tablo Yapısı

![lab03](https://user-images.githubusercontent.com/7565785/131222103-b2924a0d-5913-4d70-ba68-5f516ded229f.png)

- **EmlakOfisi** (ofisID, cadde, şehir, postaKodu)

- **Çalışan** (calisanID, adi, soyadi, pozisyon, cinsiyet, maas, ofisID)

- **KiralikMulk** (mulkID, cadde, sehir, postaKodu, tip, odaSayisi, kira, mulkSahibiID, calisanID, ofisID, kiralanmaTarihi)

- **Musteri** (musteriID, adi, soyadi, tel, maxKira)

- **MulkSahibi** (mulkSahibiID, adi, soyadi, adres, tel)

- **MulkGösterme** (musteriID, mulkID, gostermeZamani, yorum)

- **Kayıt** (musteriID, ofisID, calisanID, kayitTarihi)


## SQL Sorguları

Öncelikle her ilişki için uygun birincil ve yabancı anahtarları belirleyiniz. Ardından SQL kullanarak aşağıdaki sorguları oluşturunuz.

1. "Galata Cad" caddesinde bulunan ofiste çalışanlar tarafından yönetilen mülklerin ID, cadde, sehir ve kira bilgilerini listeleyiniz.

2. Ofis bulunmayan ancak kiralık mülklerin bulunduğu tüm şehirleri listeleyiniz.

3. Kiralık bir mülkü gören tüm müşterilerin isimlerini ve yorumlarını listeleyiniz.

4. Kayıtlı müşteri olupta hiç mülk gösterimi yapılmamış müşterileri listeleyiniz 

5. Maaşları ortalama maaştan yüksek olan tüm çalışanları listeleyiniz

6. Her bir çalışan tarafından yönetilen mülklerin sayısını bulunuz

7. En çok gösterimi yapılmış olan mülkü, sehir, kira, oda sayısı bilgileriyle gösteriniz.

8. Bir müşteri silindiğinde mülk gösterme ve kayıt tablolarındaki müşteri kayıtlarını da silen bir trigger yazınız

9. Bir çalışanın emlak ofisine kazandırdığı geliri hesaplayan bir prosedür yazınız. Her kiralanan mülk icin %3 komisyon alınmaktadır ve kiralanan mülkler icin kiralanma tarihi alanı atanmış olmalıdır.