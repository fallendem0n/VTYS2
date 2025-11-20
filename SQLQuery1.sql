USE GameDb

CREATE TABLE Accounts(
	ID INT IDENTITY(1,1),
	USERID VARCHAR(50) NOT NULL ,
	REGISTERTIME DATE DEFAULT GETDATE(),
	CONSTRAINT PK_ID PRIMARY KEY (ID),
    CONSTRAINT UQ_USERID UNIQUE (USERID)
);


CREATE TABLE Players(
	PLAYERID INT IDENTITY(1,1) NOT NULL,
	ID INT NOT NULL,
	JOB VARCHAR(50) NOT NULL,
	LVL INT DEFAULT 1 CHECK (LVL>0 AND LVL <=99),
	CREATETIME DATE DEFAULT GETDATE(),
	CONSTRAINT PK_PLAYERID PRIMARY KEY (PLAYERID),
	CONSTRAINT FK_ID FOREIGN KEY (ID) REFERENCES Accounts(ID)
);

--ILERDE PLAYERNAME eklenecek

INSERT INTO Players(ID, JOB, LVL)
VALUES (1, 'Archer', 44);

INSERT INTO Players(ID, JOB, LVL)
VALUES (2, 'Warrior', 30);

INSERT INTO Players(ID, JOB, LVL)
VALUES (3, 'Mage', 99);

INSERT INTO Players(ID, JOB, LVL)
VALUES (5, 'Tank', 70);

-- ---- 1'e ÇOK ÝLÝÞKÝNÝN KANITI ----
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
    A.USERID,  -- Hesap Adý (Accounts tablosundan)
    P.JOB,      -- Oyuncu Mesleði (Players tablosundan)
	IT.ITEMNAME --Itemname (Items tablosundan)
FROM
    Accounts A
JOIN
    Players P ON A.ID = P.ID  -- Hesaplarý Oyunculara baðla
JOIN
    Inventory IV ON P.PLAYERID = IV.PLAYERID  -- Oyuncularý Envantere baðla
JOIN
    Items IT ON IV.ITEMID = IT.ITEMID  -- Envanteri Eþyalara baðla
WHERE
    IT.ITEMNAME = 'Staff'; -- Sadece 'Staff' adlý eþyaya sahip olanlarý filtrele





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
    COUNT(IV.ITEMID) AS EsyaSayisi -- 'EsyaSayisi' adýnda yeni bir sanal sütun oluþtur
FROM
    Players P
JOIN
    Inventory IV ON P.PLAYERID = IV.PLAYERID
GROUP BY
    P.PLAYERID, P.JOB  -- Hangi sütunlarý seçtiysek (COUNT hariç) onlarý gruplamalýyýz
ORDER BY
    EsyaSayisi DESC; -- En çok eþyasý olandan en aza doðru sýrala





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