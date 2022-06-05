CREATE TABLE TELUK (
	Kode varchar(20) PRIMARY KEY NOT NULL,
	NamaTeluk nvarchar(40),
	LuasPermukaan float,
	CONSTRAINT fk_dr_idLaut FOREIGN KEY(Kode) REFERENCES LAUT(Kode)
	
)
INSERT INTO TELUK VALUES
	('12031', 'Ambon', 158.79),
	('12010', 'Banten', 150),
	('12032', 'Cendrawasih', 14535),
	('12025', 'Tomini', 137700),
	('12012', 'Mutiara', 141);


CREATE TABLE SELAT (
	Kode varchar(20) PRIMARY KEY NOT NULL,
	NamaSelat nvarchar(40),
	DariPulau nvarchar (40),
	KePulau nvarchar (40),
	JarakSelat float,
	CONSTRAINT fk_dr_idLaut FOREIGN KEY(Kode) REFERENCES LAUT(Kode)
)

INSERT INTO SELAT VALUES

	('12019', 'Lamakera', 'Lomblen','Adonara', 10),
	('12010', 'Sunda', 'Jawa','Sumatera', 82);
	('12025', 'Makassar', 'Kalimantan','Sulawesi', 600),
	('12005', 'Berhala', 'Kepulauan Riau','Jambi', 12),
	('12031', 'Capalulu', 'Mangole','Taliabu', 10);

CREATE TABLE PALUNG(
	IdPalung varchar(30) PRIMARY KEY NOT NULL,
	NamaPalung varchar(40),
	Geo varchar(40),
	Astronomi nvarchar(40),
	Administratif varchar(50),
	Kedalaman float
)

INSERT INTO PALUNG VALUES
	('MDN', 'Mindanao', 'Utara Samudra Pasifik', '5°30 06.6"N dan 133°16 19.5"E', 'Samudra Pasifik', 10540),
	('WBR', 'Weber', 'Utara Samudra Pasifik', '5°28 42.2"S dan 126°53 53.0"E', 'Banda', 7440),
	('MKR', 'Makassar', 'Utara Samudra Pasifik', '5°05 24.0"S dan 119°20 57.4"E', 'Makassar', 2540),
	('JWA', 'Jawa', 'Utara Samudra Hindia', '5°28 42.2"S dan 126°53 53.0"E', 'Jawa', 7140),
	('TMR', 'Timor', 'Utara Samudra Hindia', '5°28 42.2"S dan 126°53 53.0"E', 'Timor', 3130);

CREATE TABLE SAMUDRA(
	IdSamudra varchar(30) PRIMARY KEY NOT NULL,
	NamaSamudra varchar(50),
	Geo varchar(50),
	Astronomi varchar(40),
	LuasPermukaan float(50),
	MaxKedalaman float(50)
)

INSERT INTO SAMUDRA VALUES
	('HND', 'Hindia', 'Benua Asia, Afrika, dan Australia', '20°LS 80°BT', 70560000, 10911),
	('PSF', 'Pasifik', 'Diantara Benua Asia dan Australia', '5°LU', 165200000, 7258);

CREATE TABLE HUTAN_MANGROVE(
	IdHutan varchar(30) PRIMARY KEY NOT NULL,
	NamaHutan nvarchar(40),
	LuasArea float,
	Lokasi varchar(50),
	IdPnt varchar(30),
	CONSTRAINT fk_id_pantai FOREIGN KEY (IdPnt) REFERENCES PANTAI(IdPantai)
);
INSERT INTO HUTAN_MANGROVE VALUES
	('HM-001', 'Karimun Jawa', 222.2, 'Jepara', 'ANN'),
	('HM-002', 'Kulon Progo', 8, 'Kulon Progo', 'MDT'),
	('HM-003', 'Pandan Sari', 22, 'Brebes', 'CSW'),
	('HM-004', 'Bedul', 1200, 'Bedul', 'BDL'),
	('HM-002', 'Angke Kapuk', 99.82, 'Jakarta Utara', 'IDK');

CREATE TABLE TAMAN_LAUT(
	IdTaman int PRIMARY KEY NOT NULL,
	TLNama nvarchar(40),
	TahunDidirikan int,
	JmlSpesiesTerumbuKarang int,
	Geo varchar(50),
	Astronomi varchar(40),
	Administratif varchar(40),
	LuasArea float,
	KdLaut varchar(20),
	CONSTRAINT fk_kd_laut FOREIGN KEY (KdLaut) REFERENCES LAUT(Kode)
)

INSERT INTO TAMAN_LAUT VALUES
	(50501, 'Rubiah', 1991, 40, 'Pulau Rubiah', 'Astro', 'Aceh', 2600, '12011'),
	(50502, 'Kepulauan Seribu', 2002, 182, 'Kepulauan Seribu', 'Astro', 'DKI Jakarta', 107489, '12010'),
	(50503, 'Karimun Jawa', 1999, 201, 'Kepulauan Karimun Jawa', 'Astro', 'Jawa Tengah', 110117, '12010'),
	(50504, 'Bunaken', 1991, 390, 'Selatan Laut Sulawesi', 'Astro', 'Sulawesi Utara', 89000, '12025'),
	(50505, 'Wakatobi', 1996, 750, 'Barat Laut Banda', 'Astro', 'Sulawesi Tenggara', 1390000, '12025');


CREATE TABLE TERHUBUNG(
	KdLaut varchar(20),
	IdSmd varchar(30),
	CONSTRAINT fk_id_kdlaut2 FOREIGN KEY (KdLaut) REFERENCES LAUT(Kode),
	CONSTRAINT fk_id_idSmd FOREIGN KEY (IdSmd) REFERENCES SAMUDRA(IdSamudra),
	PRIMARY KEY (KdLaut, IdSmd)
)

INSERT INTO TERHUBUNG VALUES
	('12019', 'PSF'),
	('12031', 'PSF'),
	('12025', 'PSF'),
	('12005', 'PSF'),
	('12032', 'HND'),
	('12010', 'HND'),
	('12011', 'HND'),
	('12012', 'HND');

CREATE TABLE DI_DALAM(
	KdLaut varchar(30),
	IdPlg varchar(30),
	CONSTRAINT fk_id_kdlaut FOREIGN KEY KdLaut REFERENCES LAUT(Kode),
	CONSTRAINT fk_id_idPlg FOREIGN KEY IdPlg REFERENCES PALUNG(IdPalung),
	PRIMARY KEY (KdLaut, IdPlg)
)

INSERT INTO DI_DALAM VALUES
	('12025', 'MDN'),
	('12031', 'WBR'),
	('12025', 'MKR'),
	('12010', 'JWA'),
	('12012', 'TMR');

INSERT INTO PANTAI VALUES
	('ANN', 'Pantai Annora', '12700 m', 'Putih', 'Jepara', '5°50 36.7"S dan 110°28 29.5"E', 'Kepulauan Seribu','P-JWA'),
	('MDT', 'Pantai Pasir Mendit', '8100 m', 'Hitam', 'Kulon Progo', '7°53 40.1"S dan 110°01 09.9"E', 'Selatan Pulau Jawa','P-JWA'),
	('IDK', 'Pantai Indah Kapuk', '1000 m', 'Putih', 'Jakarta Utara', '6°06 26.4"S dan 106°44 09.5"E', 'Utara Pulau Jawa','P-JWA'),
	('BDL', 'Pantai Bedul', '1700 m', 'Putih', 'Banyuwangi', '8°36 09.6"S dan 114°15 37.8"E', 'Selatan Pulau Jawa','P-JWA'),
	('CSW', 'Pantai Cemara Sawojajar', '5000 m', 'Putih', 'Brebes', '6°48 11.0"S dan 108°59 32.1"E', 'Utara Pulau Jawa','P-JWA');
INSERT INTO LAUT VALUES
	('12010', 'Laut Jawa', 'Kepulauan Sunda Besar', '5°16 00"S dan 111°43 52"E', 'Jawa', 31000000,3, 46),
	('12011', 'Laut Andaman', 'Utara Aceh', '5°35 59.6"N dan 95°16 57.2"E', 'Jawa', 79770000,3, 800),
	('12012', 'Laut Timor', 'Utara Australia', '11°12 43.8"S dan 127°58 20.4"E', 'Nusa Tenggara Timur', 61000000,4, 190);