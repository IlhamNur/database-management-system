CREATE TABLE KAPAL (
	KdKapal varchar(20) NOT NULL,
	NamaKapal varchar(50),
	Pemilik varchar(50),
	TahunPembuatan int,
	Negara varchar(50),
	PRIMARY KEY(KdKapal)
);

INSERT INTO KAPAL VALUES
	('YFFD', 'Pangrango', 'PT. PELAYARAN NASIONAL INDONESIA', 1993, 'Indonesia'),
	('YGRG', 'Nggapulu', 'PT. PELAYARAN NASIONAL INDONESIA', 2001, 'Indonesia'),
	('YD 4894',	'Albatros.M', 'PT. KAPAL PESIAR PAYUNG LAUT', 2000, 'Indonesia'),
	('YGSG', 'Uma Kalada', 'PT. ASDP INDONESIA FERRY', 1997, 'Indonesia'),
	('YDOW', 'Bondeng Ladjoni', 'PT. CRUISE DARI NAGAH DIAMOND ARCHIPELAGO', 1976, 'Indonesia'),
	('YGQN', 'Dorolonda', 'PT. PELAYARAN NASIONAL INDONESIA', 2001, 'Indonesia'),
	('YEWA', 'Bukit Raya', 'PT. PELAYARAN NASIONAL INDONESIA', 1994, 'Indonesia');


CREATE TABLE PROVINSI (
	IdProvinsi varchar(20) NOT NULL,
	NamaProvinsi varchar(50),
	PRIMARY KEY (IdProvinsi)
);

INSERT INTO PROVINSI VALUES
	('8100', 'Maluku'),
	('5300', 'Nusa Tenggara Timur'),
	('7100', 'Sulawesi Utara'),
	('2000', 'Kepulauan Riau'),
	('8200', 'Maluku Utara');
	
CREATE TABLE KOTA (
	IdKota varchar(20) NOT NULL,
	NamaKota varchar(50),
	NamaKecamatan varchar(50),
	NamaKelurahan varchar(50),
	IdProv varchar(20) NOT NULL,
	PRIMARY KEY (IdKota),
	CONSTRAINT fk_kota_provinsi FOREIGN KEY(IdProv) REFERENCES PROVINSI(IdProvinsi)
);

INSERT INTO KOTA VALUES
	('8103', 'Maluku Tengah', 'Banda', 'Nusantara', '8100'),
	('5371', 'Kupang', 'Kupang Barat', 'Bolok', '5300'),
	('7172', 'Bitung', 'Aertembaga', 'Sumolang', '7100'),
	('2003', 'Natuna', 'Bunguran Timur', 'Ranai Kota', '2000'),
	('8206', 'Halmahera Timur', 'Maba', 'Buli', '8200');

CREATE TABLE PELABUHAN (
	KdPelabuhan varchar(20) NOT NULL,
	NamaPelabuhan varchar(50),
	JmlDermaga int,
	JenisPelabuhan varchar(50),
	LuasArea float,
	IdKt varchar(20) NOT NULL,
	PRIMARY KEY (KdPelabuhan),
	CONSTRAINT fk_pelabuhan_kota FOREIGN KEY(IdKt) REFERENCES KOTA(IdKota)
);

INSERT INTO PELABUHAN VALUES
	('IDNDA', 'Banda Neira', 1, 'Internasional', 10000,	'8103'),
	('IDKOE', 'Bolok', 2, 'Lokal', 2300, '5371'),
	('IDBIT', 'Bitung', 4, 'Internasional', 14000, '7172'),
	('IDSTA', 'Selat Lampa', 1, 'Internasional', 17000, '2003'),
	('IDTBU', 'Buli', 1, 'Nasional', 3000, '8206');

CREATE TABLE PULAU (
	IdPulau varchar(20) NOT NULL,
	NamaPulau varchar(50),
	Koordinat nvarchar(100),
	LuasPulau float,
	StatusKepemilikan varchar(50),
	PRIMARY KEY (IdPulau)
);

INSERT INTO PULAU VALUES
	('P-BNDA', 'Pulau Banda', '4°35′S 129°55′E', 172,	'Indonesia'),
	('P-SW', 'Pulau Sawu', '10°39′0″S 121°53′0″E', 414, 'Indonesia'),
	('P-TMR', 'Pulau Timor', '9°14′S 124°56′E', 30777, 'Indonesia dan Timor Leste'),
	('P-LMBH', 'Pulau Lembeh', '1°26′N 125°14′E',	50,	'Indonesia'),
	('P-SLWS', 'Pulau Sulawesi', '02°S 121°E', 180681, 'Indonesia'),
	('P-NTN', 'Pulau Natuna', '3°59′45″N 108°11′17″E', 58, 'Indonesia'),
	('P-HLMH', 'Pulau Halmahera', '0°36′N 127°52′E', 17780, 'Indonesia'),
	('P-JWA', 'Pulau Jawa', '7°29′30″S 110°00′16″E', 128297, 'Indonesia');

CREATE TABLE JENIS_KAPAL (
	KdKpl varchar(20) NOT NULL,
	KdJenis varchar(20) NOT NULL,
	Jenis Varchar(50),
	DayaTampung float,
	PRIMARY KEY (KdKpl, KdJenis),
	CONSTRAINT fk_jenisKapal_kapal FOREIGN KEY(KdKpl) REFERENCES KAPAL(KdKapal)
);

INSERT INTO JENIS_KAPAL VALUES
	('YFFD', 'KMP', 'Penumpang', 786),
	('YGRG', 'KMP', 'Penumpang', 4629),
	('YD 4894', 'PT', 'Perahu Tunda', 53),
	('YGSG', 'KMP', 'Penumpang', 2778),
	('YDOW', 'KU', 'Kargo Umum', 1181),
	('YGQN', 'KMP', 'Penumpang', 14685),
	('YEWA', 'KMP', 'Penumpang', 1806);

CREATE TABLE BERLABUH (
	KdKpl varchar(20) NOT NULL,
	KdLabuh varchar(20),
	Jam time,
	Tanggal date,
	PRIMARY KEY (KdKpl, KdLabuh),
	CONSTRAINT fk_berlabuh_kapal FOREIGN KEY(KdKpl) REFERENCES KAPAL(KdKapal),
	CONSTRAINT fk_berlabuh_pelabuhan FOREIGN KEY(KdLabuh) REFERENCES PELABUHAN(KdPelabuhan)
);

INSERT INTO BERLABUH VALUES
	('YFFD', 'IDNDA', '6:00', '2021-11-27'),
	('YGRG', 'IDNDA', '5:00', '2021-12-12'),
	('YD 4894', 'IDNDA', NULL, NULL),
	('YGSG', 'IDKOE', '15:00', '2021-11-16'),
	('YDOW', 'IDBIT', NULL, NULL),
	('YGQN', 'IDBIT', '19:00', '2021-12-10'),
	('YEWA', 'IDSTA', '22:00', '2021-03-29'),
	('YGQN', 'IDTBU', '7:00', '2021-12-11');

CREATE TABLE LAUT (
	Kode varchar(20) NOT NULL,
	Nama varchar(50),
	Geografis varchar(100),
	Astronomis nvarchar(100),
	Administratif varchar(100),
	Luas int,
	TinggiGelombang float,
	Kedalaman int,
	PRIMARY KEY(Kode)
);

INSERT INTO LAUT VALUES
	('12019', 'Laut Sawu', 'Barat Timor Leste', '118°54’ - 124°23’E dan 8045°49.964’ - 1109°43.919’S', 'Nusa Tenggara Timur',	3500, 1.25, 3497),
	('12031', 'Laut Banda', 'Tenggara Ambon', '131° - 133° 5’E dan 5° - 6.5° S', 'Maluku', 47000, 1.25, 6500),
	('12025', 'Laut Sulawesi', 'Timur Kepulauan Sangihe', '3.138° - 4°40’N dan 124.17° - 125.491°E', 'Sulawesi Utara', 28000, 2.5, 6200),
	('12005', 'Laut Natuna', 'Selatan Laut Tiongkok Selatan', '1°N dan 107°E', 'Kepulauan Riau', 26220, 4, 110),
	('12032', 'Laut Halmahera', 'Utara Laut Seram',	'1°S dan 129°E', 'Maluku Utara', 9500, 4, 2039),
	('12010', 'Laut Jawa', 'Kepulauan Sunda Besar', '5°16 00"S dan 111°43 52"E', 'Jawa', 31000, 3, 46),
	('12011', 'Laut Andaman', 'Utara Aceh', '5°35 59.6"N dan 95°16 57.2"E', 'Jawa', 79770, 3, 800),
	('12012', 'Laut Timor', 'Utara Australia', '11°12 43.8"S dan 127°58 20.4"E', 'Nusa Tenggara Timur', 61000, 4, 190);

CREATE TABLE CUACA (
	IdCuaca varchar(20) NOT NULL,
	KecepatanAngin int,
	KondisiLangit varchar(20),
	ArahAngin varchar(100),
	KdLaut varchar(20) NOT NULL,
    CONSTRAINT fk_cuaca_laut FOREIGN KEY(KdLaut) REFERENCES LAUT(Kode),
    PRIMARY KEY(IdCuaca)
);

INSERT INTO CUACA VALUES
	('C-HL1', 20, 'Hujan Lebat', 'Barat Laut ke Timur Laut', '12005'),
	('C-HR1', 15, 'Hujan Ringan', 'Barat Daya ke Barat Laut', '12019'),
	('C-HR2', 6, 'Hujan Ringan', 'Barat ke Utara',	'12025'),
	('C-B1', 20, 'Berawan', 'Barat ke Timur', '12032'),
	('C-HR3', 10, 'Hujan Ringan', 'Barat Daya ke Barat Laut', '12031');

CREATE TABLE PANTAI (
	IdPantai varchar(20) NOT NULL,
	Nama varchar(50),
	PanjangPantai float,
	Warna_Pasir varchar(20),
	Geografis varchar(100),
	Astronomis nvarchar(100),
	Administratif varchar(100),
	IdPlu varchar(20) NOT NULL,
	CONSTRAINT fk_pantai_pulau FOREIGN KEY(IdPlu) REFERENCES PULAU(IdPulau),
	PRIMARY KEY(IdPantai)
);

INSERT INTO PANTAI VALUES
	('HTT', 'Pantai Pulau Hatta', 2, 'Putih', 'Banda Neira', '4°35’20.9"S dan 130°02’15.6"E', 'Maluku', 'P-BNDA'),
	('NPE', 'Pantai Napae', 1.1, 'Putih', 'Sabu Raijua', '10°29’45"S dan 121°50’5"E', 'Nusa Tenggara Timur', 'P-SW'),
	('RMA', 'Pantai Rae Mea', 0.2, 'Putih', 'Sabu Raijua', '10°29’50.0"S dan 121°59’43.2"E', 'Nusa Tenggara Timur', 'P-SW'),
	('PLS', 'Pantai Pulisan', 0.5, 'Putih', 'Minahasa Utara', '1°40’57.6"N dan 125°08’49.1"E', 'Sulawesi Utara', 'P-SLWS'),
	('KHN', 'Pantai Kahona', 6, 'Putih', 'Pasirpanjang', '1°23’55.3"N dan 125°11’11.7"E', 'Sulawesi utara', 'P-LMBH'),
	('SSI', 'Pantai Sisi', 7, 'Putih', 'Serasan', '2°31’39.6"N dan 109°02’53.3"E', 'Kepulauan Riau', 'P-NTN'),
	('PPG',	'Pantai Pasir Panjang', 1, 'Putih', 'Tobelo Utara', '1°47’16.0"N dan 127°57’22.0"E', 'Maluku Utara', 'P-HLMH'),
	('CMG', 'Pantai Cemaga', 5, 'Putih', 'Natuna', '3°43’55.3"N dan 108°18’35.9"E', 'Kepulauan Riau', 'P-NTN'),
	('ANN', 'Pantai Annora', 12.7, 'Putih', 'Jepara', '5°50 36.7"S dan 110°28 29.5"E', 'Kepulauan Seribu','P-JWA'),
	('MDT', 'Pantai Pasir Mendit', 8.1, 'Hitam', 'Kulon Progo', '7°53 40.1"S dan 110°01 09.9"E', 'Selatan Pulau Jawa','P-JWA'),
	('IDK', 'Pantai Indah Kapuk', 1, 'Putih', 'Jakarta Utara', '6°06 26.4"S dan 106°44 09.5"E', 'Utara Pulau Jawa','P-JWA'),
	('BDL', 'Pantai Bedul', 1.7, 'Putih', 'Banyuwangi', '8°36 09.6"S dan 114°15 37.8"E', 'Selatan Pulau Jawa','P-JWA'),
	('CSW', 'Pantai Cemara Sawojajar', 5, 'Putih', 'Brebes', '6°48 11.0"S dan 108°59 32.1"E', 'Utara Pulau Jawa','P-JWA');

CREATE TABLE OBJEK_WISATA (
	IdWisata varchar(20) NOT NULL,
	NamaWisata varchar(50),
	JamOperasi varchar(20),
	LokasiWisata varchar(100),
	HargaTiket int,
	KdLaut varchar(20) NOT NULL,
	IdPnt varchar(20) NOT NULL,
	CONSTRAINT fk_ow_laut FOREIGN KEY(KdLaut) REFERENCES LAUT(Kode),
	CONSTRAINT fk_ow_pantai FOREIGN KEY(IdPnt) REFERENCES PANTAI(IdPantai),
	PRIMARY KEY(IdWisata)
);

INSERT INTO OBJEK_WISATA VALUES
	('OW-903', 'Wisata Bahari Kahona', '8 jam', 'Kecamatan Lembeh Selatan', 3000, '12025', 'KHN'),
	('OW-666', 'Wisata Pantai Pulisan', '24 jam', 'Kecamatan Likupang Timur', 5000,	'12025', 'PLS'),
	('OW-860', 'Wisata Pantai Sisi', '24 jam', 'Kecamatan Serasan', 4000, '12005', 'SSI'),
	('OW-512', 'Wisata Bahari Napae', '24 jam', 'Kecamatan Sabu Barat', 3000, '12019', 'NPE'),
	('OW-147', 'Wisata Pantai Rae Mea', '24 jam', 'Kecamatan Sabu Timur', 10000, '12019', 'RMA');

CREATE TABLE GUNUNG_BERAPI (
	IdGunung varchar(20) NOT NULL,
	NamaGunung varchar(50),
	Ketinggian int,
	Tipe nchar(5),
	Geografis varchar(100),
	Astronomis nvarchar(100),
	Administratif varchar(100),
	PRIMARY KEY(IdGunung)
);

INSERT INTO GUNUNG_BERAPI VALUES
	('GA111', 'Banua Wuhu', 3000, 'A', 'Sulawesi Utara', '3.138°N dan 125.491°E', 'Pulau Sangihe'),
	('GA112', 'Emperor of China', 1500, 'B', 'Maluku', '6.62°S dan 124.22°E', 'Laut Banda'),
	('GA113', 'Hobal', 1018, 'A', 'Nusa Tenggara Timur', '6.62°S dan 124.22°E', 'Laut Banda'),
	('GA114', 'Kawio Barat', 3200, 'A', 'Sulawesi Utara', '4°40’4″N dan 125°4’9″E', 'Laut Sulawesi'),
	('GA115', 'Nieuwerkerk', 2285, 'A', 'Maluku', '6.60°S dan 124.675°E', 'Laut Banda'),
	('GA116', 'Yersey', NULL, 'B', 'Maluku', '6.60°S dan 124.675°E', 'Laut Banda');

CREATE TABLE DI_BAWAH (
	KdLaut varchar(20) NOT NULL,
	IdGng varchar(20) NOT NULL,
	CONSTRAINT fk_db_laut FOREIGN KEY(KdLaut) REFERENCES LAUT(Kode),
	CONSTRAINT fk_db_gb FOREIGN KEY(IdGng) REFERENCES GUNUNG_BERAPI(IdGunung),
	PRIMARY KEY(KdLaut, IdGng)
);

INSERT INTO DI_BAWAH VALUES
	('12031', 'GA112'),
	('12031', 'GA113'),
	('12031', 'GA115'),
	('12031', 'GA116'),
	('12025', 'GA111'),
	('12025', 'GA114');

CREATE TABLE DIKELILINGI (
	KdLaut varchar(20) NOT NULL,
	IdPlu varchar(20) NOT NULL,
	CONSTRAINT fk_dikelilingi_laut FOREIGN KEY(KdLaut) REFERENCES LAUT(Kode),
	CONSTRAINT fk_dikelilingi_pulau FOREIGN KEY(IdPlu) REFERENCES PULAU(IdPulau),
	PRIMARY KEY(KdLaut, IdPlu)
);

INSERT INTO DIKELILINGI VALUES
	('12031', 'P-BNDA'),
	('12019', 'P-SW'),
	('12019', 'P-TMR'),
	('12025', 'P-LMBH'),
	('12025', 'P-SLWS'),
	('12005', 'P-NTN'),
	('12032', 'P-HLMH');

CREATE TABLE DILEWATI (
	KdLaut varchar(20) NOT NULL,
	KdKpl varchar(20) NOT NULL,
	CONSTRAINT fk_dilewati_laut FOREIGN KEY(KdLaut) REFERENCES LAUT(Kode),
	CONSTRAINT fk_dilewati_kapal FOREIGN KEY(KdKpl) REFERENCES KAPAL(KdKapal),
	PRIMARY KEY(KdLaut, KdKpl)
);

INSERT INTO DILEWATI VALUES
	('12031', 'YFFD'),
	('12031', 'YGRG'),
	('12031', 'YD 4894'),
	('12019', 'YGSG'),
	('12025', 'YDOW'),
	('12025', 'YGQN'),
	('12005', 'YEWA'),
	('12032', 'YGQN');

CREATE TABLE TELUK (
	Kode varchar(20) PRIMARY KEY NOT NULL,
	NamaTeluk nvarchar(40),
	LuasPermukaan float,
	CONSTRAINT fk_teluk_laut FOREIGN KEY(Kode) REFERENCES LAUT(Kode)	
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
	CONSTRAINT fk_selat_laut FOREIGN KEY(Kode) REFERENCES LAUT(Kode)
)

INSERT INTO SELAT VALUES
	('12019', 'Lamakera', 'Lomblen','Adonara', 10),
	('12010', 'Sunda', 'Jawa','Sumatera', 82),
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
	Geografis varchar(50),
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
	IdPnt varchar(20),
	CONSTRAINT fk_hutanMangrove_pantai FOREIGN KEY (IdPnt) REFERENCES PANTAI(IdPantai)
);

INSERT INTO HUTAN_MANGROVE VALUES
	('HM-001', 'Karimun Jawa', 222.2, 'Jepara', 'ANN'),
	('HM-002', 'Kulon Progo', 8, 'Kulon Progo', 'MDT'),
	('HM-003', 'Pandan Sari', 22, 'Brebes', 'CSW'),
	('HM-004', 'Bedul', 1200, 'Bedul', 'BDL'),
	('HM-005', 'Angke Kapuk', 99.82, 'Jakarta Utara', 'IDK');

CREATE TABLE TAMAN_LAUT(
	IdTaman varchar(20) PRIMARY KEY NOT NULL,
	TLNama nvarchar(40),
	TahunDidirikan int,
	JmlSpesiesTerumbuKarang int,
	Geo varchar(50),
	Astronomi varchar(40),
	Administratif varchar(40),
	LuasArea float,
	KdLaut varchar(20),
	CONSTRAINT fk_tamanLaut_laut FOREIGN KEY (KdLaut) REFERENCES LAUT(Kode)
)

INSERT INTO TAMAN_LAUT VALUES
	(50501, 'Rubiah', 1991, 40, 'Pulau Rubiah', 'Astro', 'Aceh', 2600, '12011'),
	(50502, 'Kepulauan Seribu', 2002, 182, 'Kepulauan Seribu', 'Astro', 'DKI Jakarta', 107489, '12010'),
	(50503, 'Karimun Jawa', 1999, 201, 'Kepulauan Karimun Jawa', 'Astro', 'Jawa Tengah', 110117, '12010'),
	(50504, 'Bunaken', 1991, 390, 'Selatan Laut Sulawesi', 'Astro', 'Sulawesi Utara', 89000, '12025'),
	(50505, 'Wakatobi', 1996, 750, 'Barat Laut Banda', 'Astro', 'Sulawesi Tenggara', 1390000, '12025');

CREATE TABLE BERISI(
	IdTmn varchar(20) NOT NULL,
	KdTk varchar(20) NOT NULL,
	CONSTRAINT fk_berisi_tmn FOREIGN KEY (IdTmn) REFERENCES TAMAN_LAUT(IdTaman),
	PRIMARY KEY (IdTmn, KdTk)
);

CREATE TABLE TERHUBUNG(
	KdLaut varchar(20),
	IdSmd varchar(30),
	CONSTRAINT fk_terhubung_laut FOREIGN KEY (KdLaut) REFERENCES LAUT(Kode),
	CONSTRAINT fk_terhubung_samudra FOREIGN KEY (IdSmd) REFERENCES SAMUDRA(IdSamudra),
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
	KdLaut varchar(20),
	IdPlg varchar(30),
	CONSTRAINT fk_diDalam_laut FOREIGN KEY (KdLaut) REFERENCES LAUT(Kode),
	CONSTRAINT fk_diDalam_palung FOREIGN KEY (IdPlg) REFERENCES PALUNG(IdPalung),
	PRIMARY KEY (KdLaut, IdPlg)
)

INSERT INTO DI_DALAM VALUES
	('12025', 'MDN'),
	('12031', 'WBR'),
	('12025', 'MKR'),
	('12010', 'JWA'),
	('12012', 'TMR');

CREATE TABLE HEWAN(
	IdSDAHayati VARCHAR(30),
	NamaSDA VARCHAR(30),
	NamaLatin VARCHAR(30),
	Habitat VARCHAR(50),
	KingdomAnimalia VARCHAR(30),
	CONSTRAINT PK_HEWAN_IdSDAHayati PRIMARY KEY (IdSDAHayati)
)

CREATE TABLE TUMBUHAN(
	IdSDAHayati VARCHAR(30),
	NamaSDA VARCHAR(30),
	NamaLatin VARCHAR(30),
	Habitat VARCHAR(50),
	KingdomPlantae VARCHAR(30),
	CONSTRAINT PK_TUMBUHAN_IdSDAHayati PRIMARY KEY (IdSDAHayati)
)

CREATE TABLE MIGAS(
	IdSDANonHayati VARCHAR(30),
	NamaSDA VARCHAR(30),
	LetakSDA VARCHAR(50),
	UnsurKimia VARCHAR(100), --30 -> 100
	JmlPersediaan VARCHAR(50),
	HargaMigas VARCHAR(30),
	CONSTRAINT PK_MIGAS_IdSDANonHayati PRIMARY KEY (IdSDANonHayati)
)

CREATE TABLE LOGAM(
	IdSDANonHayati VARCHAR(30),
	NamaSDA VARCHAR(30),
	LetakSDA VARCHAR(50),
	UnsurKimia VARCHAR(30),
	JmlPersediaan VARCHAR(50),
	HargaLogam VARCHAR(30),
	CONSTRAINT PK_LOGAM_IdSDANonHayati PRIMARY KEY (IdSDANonHayati)
)

CREATE TABLE MEMILIKI_HEWAN(
	KdLaut VARCHAR(20),
	IdHayati VARCHAR(30),
	CONSTRAINT FK_MEMILIKIHEW_KdLaut FOREIGN KEY (KdLaut) REFERENCES LAUT(Kode),
	CONSTRAINT FK_MEMILIKIHEW_IdHayati FOREIGN KEY (IdHayati) REFERENCES HEWAN(IdSDAHayati),
	CONSTRAINT PK_MEMILIKIHEW PRIMARY KEY (KdLaut, IdHayati)
)

CREATE TABLE MEMILIKI_TUMBUHAN(
	KdLaut VARCHAR(20),
	IdHayati VARCHAR(30),
	CONSTRAINT FK_MEMILIKITUM_KdLaut FOREIGN KEY (KdLaut) REFERENCES LAUT(Kode),
	CONSTRAINT FK_MEMILIKITUM_IdHayati FOREIGN KEY (IdHayati) REFERENCES TUMBUHAN(IdSDAHayati),
	CONSTRAINT PK_MEMILIKITUM PRIMARY KEY (KdLaut, IdHayati)
)

CREATE TABLE TERDAPAT_MIGAS(
	KdLaut VARCHAR(20),
	IdNonHayati VARCHAR(30),
	CONSTRAINT FK_TERDAPATMIG_KdLaut FOREIGN KEY (KdLaut) REFERENCES LAUT(Kode),
	CONSTRAINT FK_TERDAPATMIG_IdNonHayati FOREIGN KEY (IdNonHayati) REFERENCES MIGAS(IdSDANonHayati),
	CONSTRAINT PK_TERDAPATMIG PRIMARY KEY (KdLaut, IdNonHayati)
)

CREATE TABLE TERDAPAT_LOGAM(
	KdLaut VARCHAR(20),
	IdNonHayati VARCHAR(30),
	CONSTRAINT FK_TERDAPATLOG_KdLaut FOREIGN KEY (KdLaut) REFERENCES LAUT(Kode),
	CONSTRAINT FK_TERDAPATLOG_IdNonHayati FOREIGN KEY (IdNonHayati) REFERENCES LOGAM(IdSDANonHayati),
	CONSTRAINT PK_TERDAPATLOG PRIMARY KEY (KdLaut, IdNonHayati)
)

INSERT INTO TUMBUHAN
VALUES('PSTA-001','Gracilaria','Gracilaria','Perairan tropik','Protista')
INSERT INTO TUMBUHAN
VALUES('PSTA-002','Rumput Laut','Eucheuma','Perairan tropik','Protista')
INSERT INTO TUMBUHAN
VALUES('MNRA-001','Ganggang Hijau-Biru','Cyanophyta','Perairan pesisir','Monera')
INSERT INTO TUMBUHAN
VALUES('PSTA-003','Alga Hijau','Chlorophyta','Perairan pesisir','Protista')
INSERT INTO TUMBUHAN
VALUES('PSTA-004','Alga Coklat','Phaeophyceae','Perairan dingin','Protista')

INSERT INTO HEWAN
VALUES('IKNP-312','Ikan Tongkol','Euthynnus Affinis','Perairan pesisir','Animalia')
INSERT INTO HEWAN
VALUES('IKNP-238','Ikan Bandeng','Chanos Chanos','Perairan pesisir','Animalia')
INSERT INTO HEWAN
VALUES('IKNP-126','Ikan Kakap Merah','Lutjanidae Campechanus','Perairan pesisir','Animalia')
INSERT INTO HEWAN
VALUES('IKNP-017','Ikan Teri','Anchovies','Perairan pesisir','Animalia')
INSERT INTO HEWAN
VALUES('IKNT-109','Ikan Cakalang','Katsuwonus pelamis','Perairan tropik','Animalia')

INSERT INTO MIGAS
VALUES('MB','Minyak bumi','Bawah tanah','90%-97% alkana, sisanya sikloalkana, alkena, alkuna, dan senyawa aromatik.','4,2 miliar barel','$80 per barel')
INSERT INTO MIGAS
VALUES('GB','Gas bumi','Bawah tanah','80%-95% metana, 6%-15% etana, sisanya propana dan butana','62,4 miliar MMBtu','$27,5 per MMbtu')
INSERT INTO MIGAS
VALUES('CBM','Coal Bed Methane','Bawah tanah','80%-95% metana, sisanya etana, propana, butana, dan gas non-hidrokarbon batubara','453 miliar MMbtu','$41,2 per MMbtu')

INSERT INTO LOGAM
VALUES('TBA','Tembaga','Dasar laut','Cu','15,08 miliar ton','$9418 per ton')
INSERT INTO LOGAM
VALUES('KBT','Kobalt','Dasar laut','Co','3,8 miliar ton','$82000 per ton')
INSERT INTO LOGAM
VALUES('NKL','Nikel','Dasar laut','Ni','7.1 miliar ton','$19650 per ton')
INSERT INTO LOGAM
VALUES('SNG','Seng','Dasar laut','Zn','29,5 miliar ton','$2444 per ton')
INSERT INTO LOGAM
VALUES('LTH','Lithium','Dasar laut','Li','19,3 miliar ton','$8700 per ton')

INSERT INTO MEMILIKI_HEWAN VALUES
	('12019', 'IKNP-126'),
	('12019', 'IKNT-109'),
	('12031', 'IKNP-312'),
	('12031', 'IKNP-017'),
	('12025', 'IKNP-312'),
	('12025', 'IKNP-126'),
	('12025', 'IKNT-109'),
	('12005', 'IKNP-312'),
	('12005', 'IKNP-238'),
	('12005', 'IKNP-126'),
	('12005', 'IKNP-017'),
	('12005', 'IKNT-109'),
	('12032', 'IKNP-238'),
	('12032', 'IKNT-109'),
	('12010', 'IKNP-312'),
	('12010', 'IKNP-238'),
	('12010', 'IKNP-017'),
	('12011', 'IKNP-312'),
	('12011', 'IKNP-238');

INSERT INTO MEMILIKI_TUMBUHAN VALUES
	('12019', 'PSTA-002'),
	('12019', 'MNRA-001'),
	('12019', 'PSTA-004'),
	('12031', 'PSTA-001'),
	('12031', 'PSTA-002'),
	('12025', 'PSTA-003'),
	('12025', 'PSTA-004'),
	('12005', 'PSTA-001'),
	('12005', 'MNRA-001'),
	('12005', 'PSTA-003'),
	('12005', 'PSTA-004'),
	('12032', 'PSTA-002'),
	('12010', 'PSTA-002'),
	('12010', 'PSTA-003'),
	('12010', 'PSTA-004'),
	('12011', 'PSTA-001');

INSERT INTO TERDAPAT_MIGAS VALUES
	('12032', 'CBM'),
	('12005', 'GB'),
	('12010', 'GB'),
	('12011', 'MB'),
	('12019', 'MB'),
	('12025', 'CBM');

INSERT INTO TERDAPAT_LOGAM VALUES
	('12032', 'KBT'),
	('12005', 'TBA'),
	('12031', 'TBA'),
	('12031', 'NKL'),
	('12025', 'SNG'),
	('12025', 'LTH');