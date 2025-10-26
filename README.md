# VTYS2

Temel T-SQL Komutları: Veritabanı ve Tablo Oluşturma

SSMS'te üst menüden **"New Query"** (Yeni Sorgu) butonuna tıklayarak boş bir sorgu ekranı açın. Komutlarımızı buraya yazacağız.

### Veritabanı Oluşturma

İlk adım, tüm tablolarımızı içinde barındıracak olan ana veritabanını oluşturmaktır.

```sql
-- 'OyunDB' adında yeni bir veritabanı oluşturur.
CREATE DATABASE OyunDB;
```

Bu komutu yazdıktan sonra üstteki **"Execute"** (Çalıştır) butonuna basın (veya `F5` tuşuna). "Commands completed successfully." mesajını görmelisiniz.

> **MD Notu:** SQL'de `--` (iki tire) ile başlayan satırlar yorum satırıdır ve kod olarak işlenmez.

### Veritabanını Kullanıma Alma

Sunucuya hangi veritabanı üzerinde işlem yapacağımızı belirtmemiz gerekir.

```sql
-- Bundan sonra yazacağımız komutların 'OyunDB' üzerinde çalışacağını belirtir.
USE OyunDB;
```

### Tablo Oluşturma (CREATE TABLE)

Verilerimizi tutacağımız yapıları, yani tabloları oluşturalım. Örnek olarak bir `Karakterler` tablosu oluşturalım.

```sql
-- 'Karakterler' adında yeni bir tablo oluşturuyoruz.
CREATE TABLE Karakterler (
    KarakterID INT PRIMARY KEY IDENTITY(1,1),  -- Otomatik artan (1'den başla, 1'er art) benzersiz ID
    KullaniciAdi VARCHAR(50) NOT NULL UNIQUE,     -- 50 karaktere kadar metin, Boş olamaz (NOT NULL), Benzersiz olmalı (UNIQUE)
    Seviye INT DEFAULT 1,                       -- Tam sayı (INT), Varsayılan değeri 1
    KayitTarihi DATETIME DEFAULT GETDATE()        -- Tarih/Saat bilgisi, Varsayılan olarak şimdiki zamanı ata
);
```

**Bu koddaki anahtar kelimeler:**

  * `INT`: Tam sayı (Integer).
  * `VARCHAR(50)`: Değişken uzunlukta metin (en fazla 50 karakter).
  * `PRIMARY KEY`: Bu sütunun tablodaki **benzersiz anahtar** olduğunu belirtir. Kayıtları birbirinden ayırmak için kullanılır (ID gibi).
  * `IDENTITY(1,1)`: Sadece MS SQL'e özgü güzel bir özelliktir. `KarakterID`'nin otomatik olarak 1'den başlamasını ve her yeni kayıtta 1 artmasını sağlar (MySQL'deki `AUTO_INCREMENT` gibi).
  * `NOT NULL`: Bu alanın boş bırakılamayacağını zorunlu kılar.
  * `UNIQUE`: Bu alandaki verinin tüm tabloda benzersiz olmasını sağlar (örn: iki aynı `KullaniciAdi` olamaz).
  * `DEFAULT`: Eğer bu alana veri girilmezse, varsayılan olarak atanacak değeri belirler.

-----

Bölüm 1 tamamlandı\! Artık çalışan bir SQL Server'ınız, SSMS arayüzünüz ve içinde `Karakterler` tablosu olan bir `OyunDB` veritabanınız var.

Bir sonraki derse hazır olduğunuzda, bu tabloya veri ekleme (`INSERT`), veri çekme (`SELECT`), güncelleme (`UPDATE`) ve silme (`DELETE`) işlemlerine (CRUD operasyonları) geçebiliriz.
