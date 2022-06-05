USE KEPENDUDUKAN4;

CREATE TABLE PULAU (
KdPulau int not null,
NamaPulau nchar(25),
Lintang nchar (10),
Bujur nchar(10),
KdGeografis int not null,
PRIMARY KEY (KdPulau,KdGeografis),
FOREIGN KEY (KdGeografis) REFERENCES KONDISIGEOGRAFIS(KdGeografis),
UNIQUE(KdPulau)
);


CREATE TABLE PROV_MEMILIKI_PULAU (
KdPulau int not null,
KdProvinsi int not null,
JmlPulau int,
PRIMARY KEY (KdPulau,KdProvinsi),
FOREIGN KEY (KdPulau) references PULAU (KdPulau),
FOREIGN KEY (KdProvinsi) REFERENCES PROVINSI(KdProvinsi)
);

CREATE TABLE DES_MEMILIKI_PULAU (
KdDestinasiWisata int not null,
KdPulau int not null,
PRIMARY KEY (KdPulau,KdDestinasiWisata),
FOREIGN KEY (KdPulau) references PULAU (KdPulau),
FOREIGN KEY (KdDestinasiWisata) REFERENCES DESTINASIWISATA(KdDestinasiWisata)
);

CREATE TABLE RUTE (
KdRute int not null,
KdTransportasi int not null,
KdIbukota int not null,
StepRute nchar(100),
JarakRute nchar(10),
MedanRute nchar (100),
Transportasi nchar(100),
DurasiPerjalanan time,
NamaIbukota nchar (25),
TitikLokasiGPS nchar (10),
PRIMARY KEY (KdRute,KdTransportasi,KdIbukota),
FOREIGN KEY (KdIbukota) references IBUKOTA (KdIbukota)
);

ALTER TABLE RUTE
ADD UNIQUE (KdTransportasi)

CREATE TABLE PULAU_MELEWATI_RUTE (
KdTransportasi int not null,
KdPulau int not null,
PRIMARY KEY (KdTransportasi,KdPulau),
FOREIGN KEY (KdTransportasi) references RUTE (KdTransportasi),
FOREIGN KEY (KdPulau) references PULAU (KdPulau)
);

CREATE TABLE KONDISISOSIAL (
KdKondisiSosial int not null,
KdPulau int not null,
AngkaKelahiran int, 
AngkaKematian int,
JumlahPenduduk int,
DistribusiPenduduk int,
PRIMARY KEY (KdKondisiSosial,KdPulau),
FOREIGN KEY (KdPulau) references PULAU (KdPulau)
);

ALTER TABLE KONDISISOSIAL
ADD UNIQUE (KdKondisiSosial)

CREATE TABLE PULAU_BERKONDISI_SOSIAL (
KdPulau int not null,
KdKondisiSosial int not null
PRIMARY KEY (KdKondisiSosial,KdPulau),
FOREIGN KEY (KdKondisiSosial) references KONDISISOSIAL(KdKondisiSosial),
FOREIGN KEY (KdPulau) references PULAU (KdPulau)
);

CREATE TABLE ETNIS (
KdEtnis int not null,
KdSuku int not null,
KdAgama int not null,
Suku nchar(50),
Ras nchar(50),
Agama nchar(30),
Bahasa nchar(30),
PRIMARY KEY (KdEtnis,KdSuku,KdAgama)
);
ALTER TABLE ETNIS
ADD UNIQUE (KdEtnis,KdSuku,KdAgama)

ALTER TABLE ETNIS
ADD constraint (FK_ETNIS_PULAU2ETNIS)
FOREIGN KEY (KdEtnis) REFERENCES ETNIS(KdEtnis);

CREATE TABLE KabupatenKota (
KdProvinsi int not null,
KdKabupaten int not null,
KdKec int not null,
ProvIbukota nchar(25),
NamaProvinsi nchar(25),
LuasWilayah int,
PerdaProv nchar(50),
PerdaKab nchar (50),
KabupatenKota nchar (25),
Kecamatan nchar(25),
PRIMARY KEY (KdProvinsi,KdKabupaten,Kdkec),
FOREIGN KEY (KdProvinsi) references PROVINSI(KdProvinsi)
);
ALTER TABLE KabupatenKota
ADD UNIQUE (KdKabupaten,KdKec)

ALTER TABLE PROVINSI
ADD UNIQUE (KdProvinsi)

CREATE TABLE PULAU_DITINGGALI_ETNIS (
KdPulau int not null,
KdEtnis int not null,
KdSuku int not null,
KdAgama int not null,
PRIMARY KEY (KdPulau,KdEtnis,KdSuku,KdAgama),
FOREIGN KEY (KdPulau) references PULAU (KdPulau),
FOREIGN KEY (KdEtnis,KdSuku,KdAgama) references ETNIS (KdEtnis,KdSuku,KdAgama)
);

CREATE TABLE MEMIMPIN (
KdProvinsi int not null,
KdJabatan int not null, 
KdKabupaten int not null,
KdKec int not null,
NamaProvinsi nchar(25),
NamaIbukota nchar (15),
NamaPejabat nchar(25),
LuasWilayah int,
PeriodeJabatan int,
NamaKabupaten nchar(25),
JenisJabatan nchar (25),
PerdaProv nchar(50),
PerdaKab nchar (50),
NamaKecamatan nchar(25),
PRIMARY KEY (KdProvinsi,KdKabupaten,Kdkec,KdJabatan),
FOREIGN KEY (KdKabupaten,KdKec) references KabupatenKota(KdKabupaten,KdKec),
FOREIGN KEY (KdProvinsi) references PROVINSI(KdProvinsi),
FOREIGN KEY (KdJabatan) references STRUKTUBIROKRASI(KdJabatan)
);

CREATE TABLE LETAKASTRO (
KdPulau int not null,
Lintang int ,
Bujur int, 
PRIMARY KEY (KdPulau),
FOREIGN KEY (KdPulau) references PULAU (KdPulau)
);

CREATE TABLE SUMBERDAYA (
IdSumberDaya int not null,
PRIMARY KEY (IdSumberDaya),
);
CREATE TABLE HAYATI (
IdSumberDaya int not null,
KdSpesies Int not null,
NamaSpesies nchar (25),
JenisSpesies nchar (25),
PRIMARY KEY (IdSumberDaya,KdSpesies),
FOREIGN KEY (IdSumberDaya) references SUMBERDAYA (IdSumberDaya)
);

CREATE TABLE NONHAYATI (
IdSumberDaya int not null,
KdNonHayati Int not null,
Bentuk nchar (25),
NamaSumberDayaNonHayati nchar (25),
PRIMARY KEY (IdSumberDaya,KdNonHayati),
FOREIGN KEY (IdSumberDaya) references SUMBERDAYA (IdSumberDaya)
);

CREATE TABLE PUL_MEMILIKI_SD (
IdSumberDaya int not null,
KdPulau int not null,
PRIMARY KEY (IdSumberDaya,KdPulau),
FOREIGN KEY (KdPulau) references PULAU (KdPulau)
);

Alter TABLE PULAU
ADD constraint FK_PULAU_GEOGRAFIS FOREIGN KEY (KdGeografis) REFERENCES KONDISIGEOGRAFIS(Kdgeografis);

SELECT *
FROM NONHAYATI