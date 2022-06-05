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