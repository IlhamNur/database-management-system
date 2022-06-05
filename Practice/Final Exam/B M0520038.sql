/* B - M0520038 - Ilham Nur Romdoni
(Saya bersumpah atas nama Tuhan Yang Maha Esa, bahwa saya mengerjakan semua soal secara mandiri, tidak bekerjasama dengan siapapun. Saya siap menerima konsekuensi dari Tuhan YME jika saya berbohong atas sumpah saya ini) */

-- 1 --
CREATE TABLE MAHASISWA (
	KdFakultas char NOT NULL,
	KdProdi varchar(2) NOT NULL,
	NamaKaprodi varchar(30) NOT NULL,
	KdAngkatan varchar(2) NOT NULL,
	NoUrut smallint NOT NULL,
	Nim varchar(7) PRIMARY KEY NOT NULL,
	Nama varchar(30) NOT NULL,
	NIDNDosenPA varchar(20) NOT NULL,
	NamaDosenPA varchar(20) NOT NULL,
	SKSTempuh int NOT NULL,
	SKSSemesterAktif int NOT NULL,
	IPK float NOT NULL,
	IPSmtAktif float NOT NULL
);

INSERT INTO MAHASISWA
VALUES
	('M', '04', 'Dr. Widodo', '18', 01, 'M041801','Wawan', '0012109002', 'Dr. Waskito', 100 , 23, 3.34 , 3.27),
	('M', '05', 'Dr. Wiharto', '19', 02, 'M051902','Irwan', '0009097803', 'Dr. Umi',67,21,3.10,3.90),
	('M', '05', 'Dr. Wiharto', '18', 01, 'M051801','Bambang', '0009097803', 'Dr. Umi',103,20,3.23,3.73),
	('M', '06', 'Dr. Isnandar', '19', 02, 'M061902','Yahya', '0014046702', 'Dr. Etik',60,23,3.61,3.30),
	('T', '01', 'Dr. Untung', '18',01, 'T011801' ,'Bekti', '0030018901', 'Dr. Indira',105,20,3.05,3.19),
	('T', '02', 'Dr. Fery', '19', 02, 'T021902','Sayekti', '0027057703', 'Dr. Suparjo',66,19,3.37,3.00),
	('K', '06', 'Dr. Muzzazinah', '18', 01, 'K061801', 'Witri', '0013057904','Dr. Sumarno',101,21,3.07,3.00),
	('K', '07', 'Dr. Sri Mulyani', '19', 02, 'K071902', 'Ayu', '0019068202','Dr. Respati',69,20,3.11,3.18),
	('H', '01', 'Dr. Rustamaji', '18', 01, 'H011801', 'Hanung', '0017048101','Dr. Kamto',98,20,3.5,3.12),
	('H', '01', 'Dr. Rustamaji', '19', 02, 'H011902', 'Mulyono', '0017048101','Dr. Kamto',68,23,3.05,3.20),
	('S', '01', 'Dr. Setyo Budi', '18', 01, 'S011801', 'Bambang', '0026108404','Dr. Hartono',102,22,3.00,3.80),
	('S', '02', 'Dr. Widodo', '19', 02,'S021902', 'Ningsih', '0011078203','Dr. Waskito',62,18,3.17,3.00);

--2--
BACKUP DATABASE [UjianPraktikum] 
TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\UjianPraktikum.bak' 
WITH NOFORMAT, NOINIT,  NAME = N'UjianPraktikum-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

--3--
CREATE TABLE PRODI (
	KdFakultas char NOT NULL,
	KdProdi varchar(2) NOT NULL,
	NamaKaprodi varchar(30) NOT NULL,
	PRIMARY KEY (KdFakultas, KdProdi)
);

CREATE TABLE DOSENPA (
	NIDNDosenPA varchar(20) NOT NULL,
	NamaDosenPA varchar(20) NOT NULL,
	PRIMARY KEY (NIDNDosenPA)
);

CREATE TABLE NIMMHS (
	Nim varchar(7) NOT NULL,
	KdFakultas char NOT NULL,
	KdProdi varchar(2) NOT NULL,
	KdAngkatan varchar(2) NOT NULL,
	NoUrut smallint NOT NULL,
	PRIMARY KEY (Nim),
	CONSTRAINT FK_KdFakultas_NIMMHS FOREIGN KEY (KdFakultas) REFERENCES PRODI (KdFakultas),
	CONSTRAINT FK_KdProdi_NIMMHS FOREIGN KEY (KdProdi) REFERENCES PRODI (KdProdi),
);

CREATE TABLE MHS (
	Nim varchar(7) NOT NULL,
	Nama varchar(30) NOT NULL,
	SKSTempuh int NOT NULL,
	SKSSmtAktif int NOT NULL,
	IPSemesterAktif float NOT NULL,
	IPK float NOT NULL, 
	NIDNDosenPA varchar(20) NOT NULL,
	PRIMARY KEY (Nim),
	CONSTRAINT FK_NIDNDosenPA_MHS FOREIGN KEY (Nim) REFERENCES NIMMHS (Nim),
	CONSTRAINT WK_NIDNDosenPA_MHS FOREIGN KEY (NIDNDosenPA) REFERENCES DOSENPA (NIDNDosenPA)
);

--4--
CREATE PROCEDURE dbo.inputNIM
AS 
BEGIN
	INSERT INTO MAHASISWA(Nim)
	SELECT CONCAT(KdFakultas, KdProdi, KdAngkatan, NoUrut)
	FROM MAHASISWA
END

--5--
CREATE INDEX KdFakultas ON MAHASISWA(KdFakultas);
CREATE INDEX KdProdi ON MAHASISWA(KdProdi);
CREATE INDEX NamaKaprodi ON MAHASISWA(NamaKaprodi);
CREATE INDEX KdAngkatan ON MAHASISWA(KdAngkatan);
CREATE INDEX NoUrut ON MAHASISWA(NoUrut);
CREATE INDEX Nim ON MAHASISWA(Nim);
CREATE INDEX Nama ON MAHASISWA(Nama);
CREATE INDEX NIDNDosenPA ON MAHASISWA(NIDNDosenPA);
CREATE INDEX NamaDosenPA ON MAHASISWA(NamaDosenPA);
CREATE INDEX SKSTempuh ON MAHASISWA(SKSTempuh);
CREATE INDEX SKSSemesterAktif ON MAHASISWA(SKSSemesterAktif);
CREATE INDEX IPK ON MAHASISWA(IPK);
CREATE INDEX IPSmtAktif ON MAHASISWA(IPSmtAktif);

--6--
--(A)-- 
SELECT AVG(IPK) FROM MAHASISWA;

--(B)--
SELECT TOP(1) Nama, IPK
FROM MAHASISWA
ORDER BY IPK DESC;

--(C)--
SELECT Nim, Nama, IPK
FROM MAHASISWA;

--(D)--
SELECT TOP(1) NamaKaprodi
FROM MAHASISWA
ORDER BY AVG(IPK) DESC;

--(E)--
SELECT Nama, NamaDosenPA
FROM MAHASISWA
WHERE LEN(Nama) = LEN(NamaDosenPA);