CREATE DATABASE GameDb  --- GameDb adinda yeni bir database olusturuyoruz

CREATE TABLE Accounts(    --- Account Tablosunun olusturulmasi
	ID INT IDENTITY(1,1) NOT NULL, --- ID sutunu oluşturuyoruz IDENTITY olarak tanimlansin 1den baslasin otomatik 1er 1er artarak değer alsin
	USERID VARCHAR(50) NOT NULL , --- UserID adinda bir sutun olusturuyoruz VARCHAR (50) veri tipinde ve bos gecilemez! 
	REGISTERTIME DATE DEFAULT GETDATE(), --- RegisterTime sutunu date veri tipinde ve default olarak kaydşn olusturuldugu tarihi alsin
	CONSTRAINT PK_ID PRIMARY KEY (ID), --- ID sutunu PRIMARY KEY olsun ve bu constraint PK_ID adini alsin
    CONSTRAINT UQ_USERID UNIQUE (USERID) --- USERID UNIQUE olsun (icerisindeki bütün degerler birbirinden farkli olma zorunlulugu)
);


CREATE TABLE Players( --- Players Tablosunun olusturulmasi
	PLAYERID INT IDENTITY(1,1) NOT NULL, --- PlayerID sutununun olusturulmasi ayni sekilde identity 1den baslar 1er 1er artar otomatik deger alir
	ID INT NOT NULL, --- ID sutununun olusturulmasi daha sonra bunu Accounts->ID ile FK -> PK iliskisi ile baglayacagiz
	JOB VARCHAR(50) NOT NULL, 
	LVL INT DEFAULT 1 CHECK (LVL>0 AND LVL <=99), 
	CREATETIME DATE DEFAULT GETDATE(), 
	CONSTRAINT PK_PLAYERID PRIMARY KEY (PLAYERID), 
	CONSTRAINT FK_ID FOREIGN KEY (ID) REFERENCES Accounts(ID) 
);


INSERT INTO Players(ID, JOB, LVL)
VALUES (1, 'Archer', 44);

INSERT INTO Players(ID, JOB, LVL)
VALUES (2, 'Warrior', 30);

INSERT INTO Players(ID, JOB, LVL)
VALUES (3, 'Mage', 99);

INSERT INTO Players(ID, JOB, LVL)
VALUES (5, 'Tank', 70);

INSERT INTO Players(ID, JOB, LVL)
VALUES (1, 'Mage', 15);

SELECT * FROM Accounts

SELECT * FROM Players


CREATE TABLE Items(
	ITEMID INT NOT NULL UNIQUE IDENTITY(1,1),
	ITEMNAME VARCHAR(50) NOT NULL ,
	CONSTRAINT PK_ITEMID PRIMARY KEY (ITEMID)
);

INSERT INTO Items(ITEMNAME)
VALUES 
('Staff'),
('Shield'),
('Bow'),
('Sword')

CREATE TABLE Inventory(
	ITEMID INT NOT NULL,
	PLAYERID INT NOT NULL
	CONSTRAINT FK_ITEMID FOREIGN KEY (ITEMID) REFERENCES Items(ITEMID),
	CONSTRAINT FK_PLAYERID FOREIGN KEY (PLAYERID) REFERENCES Players(PLAYERID)
);

INSERT INTO Inventory
VALUES
(2,3),
(1,3),
(2,2),
(1,1),
(3,4),
(4,2),
(4,3),
(3,5),
(1,4)


SELECT
    A.USERID,  -- Hesap Adi (Accounts tablosundan)
    P.JOB,      -- Oyuncu Meslegi (Players tablosundan)
	IT.ITEMNAME --Itemname (Items tablosundan)
FROM
    Accounts A
JOIN
    Players P ON A.ID = P.ID  -- Hesaplari Oyunculara bagla
JOIN
    Inventory IV ON P.PLAYERID = IV.PLAYERID  -- Oyunculari Envantere bagla
JOIN
    Items IT ON IV.ITEMID = IT.ITEMID  -- Envanteri Esyalara bagla
WHERE
    IT.ITEMNAME = 'Staff'; -- Sadece 'Staff' adli esyaya sahip olanlari filtrele





SELECT
    A.USERID,
    P.JOB,
    IT.ITEMNAME
FROM
    Accounts A
JOIN
    Players P ON A.ID = P.ID
JOIN
    Inventory IV ON P.PLAYERID = IV.PLAYERID
JOIN
    Items IT ON IV.ITEMID = IT.ITEMID
WHERE
    A.USERID = 'draken';





SELECT
    P.PLAYERID,
    P.JOB,
    COUNT(IV.ITEMID) AS EsyaSayisi -- 'EsyaSayisi' adinda yeni bir sanal sutun olustur
FROM
    Players P
JOIN
    Inventory IV ON P.PLAYERID = IV.PLAYERID
GROUP BY
    P.PLAYERID, P.JOB  -- Hangi sutunlari seçtiysek (COUNT hariç) onlari gruplamaliyiz
ORDER BY
    EsyaSayisi DESC; -- En çok esyasi olandan en aza dogru sirala





SELECT
    IT.ITEMNAME,
    COUNT(IV.PLAYERID) AS OyuncuSayisi
FROM
    Items IT
JOIN
    Inventory IV ON IT.ITEMID = IV.ITEMID
GROUP BY
    IT.ITEMNAME
ORDER BY
    OyuncuSayisi DESC;
