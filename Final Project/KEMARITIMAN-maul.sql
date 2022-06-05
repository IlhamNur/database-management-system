CREATE TABLE TELUK (
	Kode varchar(20) PRIMARY KEY NOT NULL,
	LuasPermukaan float
);

CREATE TABLE SELAT (
	Kode varchar(20) PRIMARY KEY NOT NULL,
	PulauTerhubung varchar (40),
	JarakSelat float
);

CREATE TABLE PALUNG(
	IdPalung varchar(20) PRIMARY KEY NOT NULL,
	NamaPalung varchar(40),
	Geografis varchar(100),
	Astronomis nvarchar(100),
	Administratif varchar(100),
	Kedalaman float
);

CREATE TABLE SAMUDRA(
	IdSamudra varchar(20) PRIMARY KEY NOT NULL,
	NamaSamudra varchar(50),
	Geografis varchar(100),
	Astronomis nvarchar(100),
	Administratif varchar(100),
	LuasPermukaan float,
	MaxKedalaman float
);

CREATE TABLE HUTAN_MANGROVE(
	IdHutan varchar(20) PRIMARY KEY NOT NULL,
	LuasArea float,
	Lokasi varchar(50),
	Kondisi varchar(50),
	PengelolaHutan varchar(30),
	IdPnt varchar(20),
	CONSTRAINT fk_hutanMangrove_pntai FOREIGN KEY (IdPnt) REFERENCES PANTAI(IdPantai)
);

CREATE TABLE TAMAN_LAUT(
	IdTaman varchar(20) PRIMARY KEY NOT NULL,
	TahunDidirikan int,
	Geografis varchar(100),
	Astronomis varchar(100),
	Administratif varchar(100),
	LuasArea float,
	Pengelola varchar(30)
);

CREATE TABLE BERISI(
	IdTmn varchar(20),
	KdTk varchar(20),
	CONSTRAINT fk_berisi_tmn FOREIGN KEY (IdTmn) REFERENCES TAMAN_LAUT(IdTaman),
	CONSTRAINT fk_berisi_TK FOREIGN KEY (KdTk) REFERENCES TERUMBU_KARANG(KdTerumbuKarang),
	PRIMARY KEY (IdTmn, KdTk)
);

CREATE TABLE TERHUBUNG(
	KdLaut varchar(20),
	IdSmd varchar(20),
	CONSTRAINT fk_terhubung_laut FOREIGN KEY (KdLaut) REFERENCES LAUT(Kode),
	CONSTRAINT fk_terhubung_Smd FOREIGN KEY (IdSmd) REFERENCES SAMUDRA(IdSamudra),
	PRIMARY KEY (KdLaut, IdSmd)
);

CREATE TABLE DI_DALAM (
	KdLaut varchar(20),
	IdPlg varchar(20),
	CONSTRAINT fk_diDalam_laut FOREIGN KEY (KdLaut) REFERENCES LAUT(Kode),
	CONSTRAINT fk_diDalam_plg FOREIGN KEY (IdPlg) REFERENCES PALUNG(IdPalung),
	PRIMARY KEY (KdLaut, IdPlg)
);