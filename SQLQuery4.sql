USE Okul

CREATE TABLE Ogrenci(
OgrenciNo INT IDENTITY(1,1),
Ad VARCHAR(50),
Soyad VARCHAR (50),
KayitTarihi DATE,
CINSIYET CHAR(1),
CONSTRAINT PK_ON PRIMARY KEY (OgrenciNo),
);

ALTER TABLE Ogrenci
ADD CONSTRAINT DEF_KT DEFAULT (GETDATE()) FOR KayitTarihi

CREATE TABLE Dersler(
DersID INT,
DersAd VARCHAR(50)

CONSTRAINT PK_DI PRIMARY KEY (DersID)
);

CREATE TABLE Notlar(
OgrenciNO INT,
DersID INT,

CONSTRAINT FK_ON FOREIGN KEY (OgrenciNo) REFERENCES Ogrenci(OgrenciNo),
CONSTRAINT FK_DI FOREIGN KEY (DersID) REFERENCES Dersler(DersID)

);

ALTER TABLE Notlar
ADD OgrenciNot INT

ALTER TABLE Notlar
ADD CONSTRAINT CHK_Notlar CHECK (OgrenciNot>=0 AND OgrenciNot<=100)


INSERT INTO Ogrenci (Ad, Soyad, CINSIYET)
VALUES
('Ali', 'Yýldýrým', 'E'),
('Ayþe', 'Demir', 'K'),
('Mehmet', 'Þahin', 'E'),
('Elif', 'Kaya', 'K'),
('Mustafa', 'Çelik', 'E'),
('Zeynep', 'Öztürk', 'K'),
('Ahmet', 'Yýlmaz', 'E'),
('Fatma', 'Arslan', 'K'),
('Emre', 'Can', 'E'),
('Gizem', 'Güler', 'K'),
('Furkan', 'Aydýn', 'E'),
('Sena', 'Erdoðan', 'K'),
('Okan', 'Aksoy', 'E'),
('Deniz', 'Tunç', 'K'),
('Caner', 'Uysal', 'E'),
('Ece', 'Özdemir', 'K'),
('Barýþ', 'Kara', 'E'),
('Merve', 'Kýlýç', 'K'),
('Gökhan', 'Doðan', 'E'),
('Pýnar', 'Tekin', 'K'),
('Kemal', 'Duran', 'E'),
('Ýrem', 'Acar', 'K'),
('Serkan', 'Bozkurt', 'E'),
('Aslý', 'Güneþ', 'K'),
('Cem', 'Taþ', 'E'),
('Büþra', 'Koç', 'K'),
('Tolga', 'Þen', 'E'),
('Hilal', 'Yücel', 'K'),
('Mert', 'Gürbüz', 'E'),
('Nilay', 'Sarý', 'K'),
('Onur', 'Özkan', 'E'),
('Yaðmur', 'Eren', 'K'),
('Hakan', 'Çakýr', 'E'),
('Cansu', 'Sözen', 'K'),
('Alper', 'Keleþ', 'E'),
('Melis', 'Yaman', 'K'),
('Tuna', 'Ateþ', 'E'),
('Selin', 'Genç', 'K'),
('Yasin', 'Toprak', 'E'),
('Duygu', 'Bulut', 'K'),
('Sinan', 'Aksu', 'E'),
('Esra', 'Kocaman', 'K'),
('Eray', 'Polat', 'E'),
('Demet', 'Ay', 'K'),
('Koray', 'Deniz', 'E'),
('Hande', 'Yalçýn', 'K'),
('Yiðit', 'Kurt', 'E'),
('Rüya', 'Iþýk', 'K'),
('Ufuk', 'Göz', 'E'),
('Berna', 'Yazýcý', 'K');


INSERT INTO Dersler (DersID, DersAd)
VALUES
(101, 'Veri Yapýlarý'),
(102, 'Algoritma Analizi'),
(103, 'Yazýlým Mühendisliði'),
(104, 'Görsel Programlama'),
(105, 'Ýþletim Sistemleri'),
(106, 'Veritabaný Yönetimi'),
(107, 'Web Teknolojileri'),
(108, 'Proje Yönetimi'),
(109, 'Bilgisayar Aðlarý'),
(110, 'Matematik I');


INSERT INTO Notlar (OgrenciNo, DersID, OgrenciNot)
VALUES
(1, 101, 85),
(1, 102, 70),
(2, 101, 92),
(3, 103, 55),
(4, 104, 68),
(5, 105, 90),
(6, 106, 77),
(7, 107, 45), 
(8, 108, 88),
(9, 109, 62),
(10, 110, 75),
(11, 101, 95),
(12, 102, 80),
(13, 103, 79),
(14, 104, 60),
(15, 105, 50),
(16, 106, 99),
(17, 107, 72),
(18, 108, 81),
(19, 109, 67),
(20, 110, 73),
(21, 101, 88),
(22, 102, 91),
(23, 103, 58),
(24, 104, 65),
(25, 105, 93),
(26, 106, 76),
(27, 107, 40),
(28, 108, 89),
(29, 109, 63),
(30, 110, 74),
(31, 101, 96),
(32, 102, 82),
(33, 103, 78),
(34, 104, 61),
(35, 105, 51),
(36, 106, 98),
(37, 107, 71),
(38, 108, 83),
(39, 109, 66),
(40, 110, 72),
(41, 101, 89),
(42, 102, 92),
(43, 103, 59),
(44, 104, 64),
(45, 105, 94),
(46, 106, 75),
(47, 107, 48), 
(48, 108, 87),
(49, 109, 68),
(50, 110, 71);



SELECT * FROM Ogrenci
SELECT * FROM Dersler
SELECT * FROM Notlar

SELECT Ad,Soyad FROM Ogrenci

SELECT * FROM Notlar 
WHERE OgrenciNot<50

SELECT COUNT(*) FROM Ogrenci


UPDATE Notlar
SET OgrenciNot = 70
WHERE OgrenciNO = 5

DELETE FROM Notlar
WHERE OgrenciNO = 25

DELETE FROM Notlar
WHERE OgrenciNot>90

UPDATE Notlar 
SET OgrenciNot = 30 
WHERE OgrenciNot <50

SELECT Ogrenci.Ad,Ogrenci.Soyad,Dersler.DersAd,Notlar.OgrenciNot FROM Ogrenci
INNER JOIN Notlar ON Ogrenci.OgrenciNO = Notlar.OgrenciNO
INNER JOIN Dersler ON Dersler.DersID = Notlar.DersID

-- ADI A ile baþlayan öðrencileri getir 

SELECT * FROM Ogrenci
WHERE Ad LIKE 'A%'

--- ADI A ile baþlayan öðrencinin notlarýný getir

SELECT Ogrenci.Ad, Notlar.OgrenciNot,Dersler.DersAd FROM Ogrenci 
INNER JOIN Notlar ON Notlar.OgrenciNo = Ogrenci.OgrenciNo
INNER JOIN Dersler ON Dersler.DersID = Notlar.DersID
WHERE Ogrenci.CINSIYET='K' AND Notlar.OgrenciNot > 50 AND Dersler.DersID=104
ORDER BY Notlar.OgrenciNot ASC

INSERT INTO Notlar (OgrenciNo, DersID, OgrenciNot)
VALUES
(51,101,50),
(51,102,60),
(51,103,90)

-- Ad, Soyad , Ders Adý , Notu          Kimin OgrenciNo = 51 

SELECT Ogrenci.Ad, Ogrenci.Soyad,Dersler.DersAd,Notlar.OgrenciNot
FROM Ogrenci
INNER JOIN Notlar ON Notlar.OgrenciNo = Ogrenci.OgrenciNo
INNER JOIN Dersler ON Dersler.DersID = Notlar.DersID 
WHERE Ogrenci.OgrenciNo = 51

SELECT Ogrenci.Ad,Ogrenci.Soyad,AVG(OgrenciNot) AS Ortalama FROM Notlar 
INNER JOIN Ogrenci ON Ogrenci.OgrenciNo= Notlar.OgrenciNo
GROUP BY Ogrenci.Ad,Ogrenci.Soyad
HAVING AVG(OgrenciNot) <80 
ORDER BY Ortalama DESC

