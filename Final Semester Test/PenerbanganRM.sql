USE PENERBANGAN
GO

CREATE TABLE AIRWAYS (
	KdAirways nvarchar(20) NOT NULL,
	Nama nvarchar (20),
	THBerdiri int,
	Pemilik nvarchar (20),
	Market float,
	Telp bigint,
	PRIMARY KEY (KdAirways)
);

INSERT INTO AIRWAYS (KdAirways, Nama, THBerdiri, Pemilik, Market, Telp)
	VALUES
		('GIA', 'Garuda Indonesia', 1970, 'Negara', 0.50, 021889977),
		('BTK', 'Batik Air', 2000, 'Swasta', 0.20, 021237012),
		('JT', 'Lion Air', 1995, 'Swasta', 0.30, 021464656)
;

CREATE TABLE PESAWAT (
	NoLambung nvarchar(20) NOT NULL,
	ThPengadaan int, 
	Jenis nvarchar(20),
	Kapasitas int,
	JamPenggunaan bigint,
	KdAirways nvarchar(20),
	PRIMARY KEY (NoLambung),
	FOREIGN KEY (KdAirways) REFERENCES AIRWAYS (KdAirways)
		ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO PESAWAT (NoLambung, ThPengadaan, Jenis, Kapasitas, JamPenggunaan, KdAirways)
	VALUES 
		('PK-101', 2000, 'AirBus', 300, 623589, 'JT'),
		('PK-102', 2005, 'ATR', 10, 89006, 'BTK'),
		('PK-103', 2015, 'AirBus', 250, 64262, 'GIA'),
		('PK-104', 2019, 'AirBus', 300, 73848, 'GIA'),
		('PK-114', 2009, 'Boeing', 225, 98458548, 'GIA'),
		('PK-105', 2019, 'AirBus', 400, 64647, 'JT'),
		('PK-106', 2020, 'Boeing', 300, 6654, 'JT'),
		('PK-107', 1996, 'Boeing', 400, 1234569, 'BTK')
;

CREATE TABLE KOTA (
	IdKota nvarchar(20) PRIMARY KEY NOT NULL,
	Kota nvarchar(20),
);

INSERT INTO KOTA (IdKota, Kota)
	VALUES
		('SL', 'Surakarta'),
		('YG', 'Yogyakarta'),
		('DP', 'Denpasar'),
		('JAK', 'Jakarta'),
		('SMR', 'Semarang'),
		('SBY', 'Surabaya'),
		('BDG', 'Bandung')
;

CREATE TABLE KOTA_CABANG_AIRWAYS (
	KdAirways nvarchar(20) NOT NULL,
	Kota nvarchar(20) NOT NULL,
	PRIMARY KEY (KdAirways, Kota),
	FOREIGN KEY (KdAirways) REFERENCES AIRWAYS (KdAirways)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Kota) REFERENCES KOTA (IdKota)
		ON DELETE CASCADE ON UPDATE CASCADE,
);

INSERT INTO KOTA_CABANG_AIRWAYS (KdAirways, Kota)
	VALUES
		('JT', 'SL'),
		('JT', 'YG'), 
		('JT', 'DP'),
		('JT', 'JAK'),
		('JT', 'SMR'),
		('BTK', 'SBY'),
		('BTK', 'BDG'),
		('GIA', 'SL'),
		('GIA', 'YG'),
		('GIA', 'JAK'),
		('GIA', 'DP')
;

CREATE TABLE BANDARA(
	KdBandara nvarchar(20) NOT NULL,
	ThMulaiOperasi int,
	Nama nvarchar(20),
	LuasArea int,
	JmlTerminal int,
	JmlGate int,
	Kapasitas bigint,
	JenisBandara nvarchar(20),
	IdKota nvarchar(20),
	PRIMARY KEY (KdBandara),
	FOREIGN KEY (IdKota) REFERENCES KOTA (IdKota)
		ON DELETE CASCADE ON UPDATE CASCADE,
);

INSERT INTO BANDARA	(KdBandara, ThMulaiOperasi, Nama, LuasArea, JmlTerminal, JmlGate, Kapasitas, JenisBandara, IdKota)
	VALUES
		('SOC', 1990, 'Adisumarmo', 50, 2, 6, 5000, 'Nasional', 'SL'),
		('JOG', 1980, 'Adisucipto', 90, 2, 8, 7000, 'International', 'YG'),
		('YIA', 2018, 'Yogya International', 220, 3, 20, 20000, 'International', 'YG'),
		('SRG', 2000, 'Ahmad Yani', 35, 2, 4, 4000, 'Nasional', 'SMR'),
		('CGK', 1965, 'Soekarno Hatta', 207, 4, 20, 50000, 'International', 'JAK'),
		('BDO', 1999, 'Husein Sastranegara', 40, 2, 5, 4500, 'Nasional', 'BDG'),
		('SUB', 1975, 'Juanda', 150, 3, 9, 10000, 'International', 'SBY'),
		('DEN', 1980, 'Ngurah Rai', 330, 4, 18, 30000, 'International', 'DP'),
		('HLP', 1945, 'Halim Perdanakusuma', 55, 2, 4, 5000, 'International', 'JAK')
;

CREATE TABLE BANDARA_CABANG_AIRWAYS	(
	KdAirways nvarchar(20) NOT NULL,
	KdBandara nvarchar(20) NOT NULL,
	ThDibuka int,
	PRIMARY KEY (KdAirways, KdBandara),
	FOREIGN KEY (KdAirways) REFERENCES AIRWAYS (KdAirways)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (KdBandara) REFERENCES BANDARA (KdBandara)
		ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO BANDARA_CABANG_AIRWAYS (KdAirways, KdBandara, ThDibuka)
	VALUES
		('GIA', 'SOC', 2000),
		('GIA', 'CGK', 1990),
		('GIA', 'JOG', 1995),
		('GIA', 'YIA', 2018),
		('GIA', 'SUB', 1995),
		('BTK', 'CGK', 2007),
		('BTK', 'YIA', 2020),
		('BTK', 'SUB', 2000),
		('JT', 'CGK', 2000),
		('JT', 'YIA', 2018),
		('JT', 'SUB', 2000),
		('JT', 'DEN', 2000),
		('JT', 'SOC', 2001),
		('JT', 'HLP', 2016),
		('JT', 'JOG', 2000)
;

CREATE TABLE RUTE (
	KdRute nvarchar(20) NOT NULL,
	JenisRute nvarchar(20),
	IdKotaDari nvarchar(20),
	IdKotaTujuan nvarchar(20),
	PRIMARY KEY (KdRute),
	FOREIGN KEY (IdKotaDari) REFERENCES KOTA (IdKota),
	FOREIGN KEY (IdKotaTujuan) REFERENCES KOTA (IdKota)
);

INSERT INTO RUTE (KDRute, JenisRute, IdKotaDari, IdKotaTujuan)
	VALUES
		('R001', 'Direct', 'JAK', 'DP'),
		('R002', 'Indirect', 'SL', 'DP'),
		('R003', 'Indirect', 'SMR', 'DP'),
		('R004', 'Direct', 'YG', 'JAK'),
		('R005', 'Direct', 'SL', 'JAK'),
		('R006', 'Direct', 'JAK', 'BDG'),
		('R007', 'Direct', 'SMR', 'JAK'),
		('R008', 'Direct', 'DP', 'SBY')
;

CREATE TABLE TERDIRI_RUTE (
	KdRute nvarchar(20) NOT NULL,
	KdRuteDigunakan nvarchar(20) NOT NULL,
	PRIMARY KEY (KdRute, KdRuteDigunakan),
	FOREIGN KEY (KdRute) REFERENCES RUTE (KdRute),
	FOREIGN KEY (KdRuteDigunakan) REFERENCES RUTE (KdRute),
);

INSERT INTO TERDIRI_RUTE (KdRute, KdRuteDigunakan) 
	VALUES
		('R002', 'R005'),
		('R002', 'R001'),
		('R003', 'R007'),
		('R003', 'R001')
;

CREATE TABLE LAYANAN (
	KdAirways nvarchar(20) NOT NULL,
	KdRute nvarchar(20) NOT NULL,
	RuteTerbeli int,
	PRIMARY KEY (KdAirways, KdRute),
	FOREIGN KEY (KdAirways) REFERENCES AIRWAYS (KdAirways)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (KdRute) REFERENCES RUTE (KdRute)
		ON DELETE CASCADE ON UPDATE CASCADE,
);

INSERT INTO LAYANAN (KdAirways, KdRute, RuteTerbeli)
	VALUES
		('GIA', 'R001', 800),
		('GIA', 'R002', 70), 
		('GIA', 'R005', 300),
		('JT', 'R001', 200),
		('JT', 'R002', 150),
		('JT', 'R003', 135),
		('JT', 'R004', 300),
		('JT', 'R007', 500),
		('BTK', 'R001', 1000),
		('BTK', 'R006', 30)
;

CREATE TABLE PENERBANGAN (
	KdPenerbangan nvarchar(20) NOT NULL,
	MulaiBoarding time,
	WaktuTakeOff time,
	WaktuLanding time,
	KdBandaraDari nvarchar(20),
	KdBandaraTujuan nvarchar(20),
	KdPesawat nvarchar(20),
	PRIMARY KEY (KdPenerbangan),
	FOREIGN KEY (KdBandaraDari) REFERENCES BANDARA (KdBandara),
	FOREIGN KEY (KdBandaraTujuan) REFERENCES BANDARA (KdBandara),
	FOREIGN KEY (KdPesawat) REFERENCES PESAWAT (NoLambung)
		ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO PENERBANGAN (KdPenerbangan, MulaiBoarding, WaktuTakeOff, WaktuLanding, KdBandaraDari, KdBandaraTujuan, KdPesawat)
	VALUES
		('GIA 234', '10:00', '10:45', '13:00', 'CGK', 'DEN', 'PK-103'),
		('GIA 356', '06:00', '06:45', '07:15', 'SOC', 'CGK', 'PK-103'),
		('GIA 123', '07:00', '08:00', '09:15', 'SOC', 'CGK', 'PK-104'),
		('GIA 543', '09:00', '10:00', '11:30', 'SOC', 'CGK', 'PK-114'),
		('JT 334', '08:30', '09:20', '10:10', 'SRG', 'CGK', 'PK-106'),
		('JT 706', '12:00', '13:00', '14:25', 'CGK', 'DEN', 'PK-101'),
		('JT 650', '07:15', '08:00', '09:00', 'YIA', 'CGK', 'PK-101'),
		('JT 330', '06:30', '07:30', '08:45', 'JOG', 'CGK', 'PK-105'),
		('BTK 100', '06:00', '07:00', '09:45', 'CGK', 'DEN', 'PK-102'),
		('BTK 110', '13:00', '13:30', '13:49', 'HLP', 'BDO', 'PK-107'),
		('JT 890', '19:00', '20:00', '20:30', 'DEN', 'SUB', 'PK-103')
;

CREATE TABLE TERBANG_RUTE (
	KdPenerbangan nvarchar(20) NOT NULL,
	KdRute nvarchar(20) NOT NULL,
	PRIMARY KEY (KdPenerbangan, KdRute),
	FOREIGN KEY (KdPenerbangan) REFERENCES PENERBANGAN (KdPenerbangan)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (KdRute) REFERENCES RUTE (KdRute)
		ON DELETE CASCADE ON UPDATE CASCADE,
);

INSERT INTO TERBANG_RUTE (KdPenerbangan, KdRute)
	VALUES
		('GIA 234',  'R001'),
		('GIA 234',  'R002'),
		('GIA 356',  'R005'),
		('GIA 356',  'R002'),
		('GIA 123',  'R005'),
		('GIA 543',  'R005'),
		('JT 334',  'R007'),
		('JT 334',  'R003'),
		('JT 706',  'R001'),
		('JT 706',  'R003'),
		('JT 650',  'R004'),
		('JT 330',  'R004'),
		('BTK 100',  'R001'),
		('BTK 110',  'R006')
;

GO;