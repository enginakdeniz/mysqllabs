# 1.bölüm 

Bir tatil köyündeki animasyon aktiviteler' için bir veritabanı oluşturma. gerekmektedir: 
- Aktivitelere katılan müşteriler vardır. Müşterilerin IDsi, adı, soyadı, yaşı, oda numarası, telefon bilgileri tutulur. 
- Aktiviteleri yürüten animatörler var. Animatörlerin, ID.si, adı, soyadı, telefon numarası ve uzmanlık alanı saklanır. Her animatörün birden fazla uzmanlık alanı olabilir. 
- Iki farklı aktivite türü vardır. Bireysel aktivite ve Grup aktivitesi. Bireysel aktivitelerde ID, aktivite adı, internet bağlantısı, katılım şartı vardır. Grup aktiviteler' ise ID, aktivite adı, internet bağlantısı ve kapasite bilgilerini saklar. Aerobik, surf okulu, havuz oyunları gibi çeşitleri olan grup aktiviteler' birden çok müşteri ve birden çok animatörün katılımına açıktır. Bireysel aktiviteler icin bir aynı zamanda süpervizör (denetleyen) olan tek bir animatör vardır. Bir animatör yalnızca bir aktiviteyi denetler. 
- Birçok müşteri bireysel aktivitelere katılabilir, ancak gün boyunca ayrı bir planlanmış saate ihtiyaçları vardır. 
- Her grup aktivitesi için bir acil durum bilgisi vardır. Aktivite silinirse, acil durum bilgisinin saklanması gerekmez. Acil durum bilgisi, aranacak telefon numarasını ve acil durum ekipmanını almak için anahtarları tutan dolap numarasını içerir. 
- Ekipmanlar ID, ekipman ismi ve amacına göre saklanır. Ekipmanlar animatörler tarafından kullanılmaktadır Birden çok animatör birden fazla ekipman kullanabilir. 

1. Bir E-R diyagramı oluşturunuz, varlıklar, özelliklerini, ilişkileri ve ilgili kardinalite kısıtlarını gösteriniz. 
2. PK ve FK.yi (ve referanslari) gösteren ilişkileri oluşturunuz. 
3. OIuşturulan tabloları anlamlı verilerle doldurarak SQL cümleciklerini oluşturunuz. (tablo başına 2-3 kayıt)

## 2. Bölüm

Aşağıdaki ilişkiler, bir okuldaki öğrencilerin okul sonrası etkinlik takvimlerini tutmak için kullanılır. Bu veritabanının bir örneği aşağıda verilmiştir. Tabii ki veritabanı çok daha geniş olabilir ve verilen bu özelliklerden çok daha fazla bilgi içerebilir, ama bu soru kapsamında aşağıdaki veri kümelerini kullanma. yeterlidir. 

**Öğrenci** (*ogrenc_id*, ad soyad, adres, telefon) 
**Etkinlik** (*etkinlik_adi* kapasite, ekipman, ucret) 
**Yer**(*yer_adi*,ekiplman) 
**Takvim** (*etkinlik_adi* gun baslangicıamani, bitisıamani, yer) 
**Kayit**(*ogrenc_id* etkinlik adi) 

Ogrenci ggrID ad soyad adres telefon 123 Ali Ozturk Barbaros Cad O 533 466 77 88 345 Ayse Kaya Tesvikiye Mah O 505 222 33 44 
Etkinlik etkinlik adi kapasite ekipman ucret Müzik 3 piyano 100 Bale 15 ahşap zemin 50 
Yer yer adi .prnan Salon 1 piyano Salon 1 ses sistemi Salon 2 Inat, agirlik Oda 1 ahşap zemin 
Takvim etkinlik adi gün baslangic _zaman' bitis jarnani yer Müzik Carsamba 15.30 16.30 Salon 1 Bale Pazartesi 16.30 18.00 Oda 1 
Kayıt ggrencilD etkinlik adi 123 Muzik 345 Bale 123 Bale 
1 .Veritabanını ve tabloları mysql veritabanında SQL cümlecikleri ile oluşturun ve içlerine yine SQL cümlecikleri ile örnek kayıtlar ekleyin (benim örneklerim ve yeni kayıt örnekleri olabilir, her tabloda en az 5 kayıt olacak şekilde). 
Sorgular: 2.Ahşap zeminlerin bakım ihtiyacı var. Bunun için hafta içi (Pazartesi-Cuma) ahşap zeminli yerlerde yapılması planlanan etkinlikleri ve zamanlarını ve bu dersleri alan öğrencilerin isimlerini ve telefon numaralarını gösteren sorguyu oluşturunuz. Bilgilendirilmeleri için kullanılacaldır. 3.0kul için şu anda en karlı (en çok parayı getiren) etkinliği bulunuz. 4.Her gün için en kalabalık etkinliği, yerini ve içindeki kişi sayısını bulunuz. 5.0kul, etkinlik olmayan günlerde kapatılacaldır. Haftada programlanınış etkinlik olmadığı herhangi bir gün olup olmadığını bulunuz. Bu sorguyu kolayca gerçekleştirmek için veritabanını genişletınenin bir yolunu bulmaya çalışın (yeni bir alan ya da tablo eklenebilir mi?) 
