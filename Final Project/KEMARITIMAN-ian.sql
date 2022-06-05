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

CREATE TABLE CUACA (
	IdCuaca varchar(20) NOT NULL,
	KecepatanAngin int,
	KondisiLangit varchar(20),
	ArahAngin varchar(100),
	KdLaut varchar(20) NOT NULL,
    	CONSTRAINT fk_cuaca_laut FOREIGN KEY(KdLaut) REFERENCES LAUT(Kode),
    	PRIMARY KEY(IdCuaca)
);

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

CREATE TABLE PANTAI (
	IdPantai varchar(20) NOT NULL,
	Nama varchar(50),
	PanjangPantai int,
	Warna_Pasir varchar(20),
	Geografis varchar(100),
	Astronomis nvarchar(100),
	Administratif varchar(100),
	IdPlu varchar(20) NOT NULL,
	CONSTRAINT fk_pantai_pulau FOREIGN KEY(IdPlu) REFERENCES PULAU(IdPulau),
	PRIMARY KEY(IdPantai)
);

CREATE TABLE DI_BAWAH (
	KdLaut varchar(20) NOT NULL,
	IdGng varchar(20) NOT NULL,
	CONSTRAINT fk_db_laut FOREIGN KEY(KdLaut) REFERENCES LAUT(Kode),
	CONSTRAINT fk_db_gb FOREIGN KEY(IdGng) REFERENCES GUNUNG_BERAPI(IdGunung),
	PRIMARY KEY(KdLaut, IdGng)
);

CREATE TABLE DIKELILINGI (
	KdLaut varchar(20) NOT NULL,
	IdPlu varchar(20) NOT NULL,
	CONSTRAINT fk_dikelilingi_laut FOREIGN KEY(KdLaut) REFERENCES LAUT(Kode),
	CONSTRAINT fk_dikelilingi_pulau FOREIGN KEY(IdPlu) REFERENCES PULAU(IdPulau),
	PRIMARY KEY(KdLaut, IdPlu)
);

CREATE TABLE DILEWATI (
	KdLaut varchar(20) NOT NULL,
	KdKpl varchar(20) NOT NULL,
	CONSTRAINT fk_dilewati_laut FOREIGN KEY(KdLaut) REFERENCES LAUT(Kode),
	CONSTRAINT fk_dilewati_kapal FOREIGN KEY(KdKpl) REFERENCES KAPAL(KdKapal),
	PRIMARY KEY(KdLaut, KdKpl)
);