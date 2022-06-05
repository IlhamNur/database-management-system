INSERT INTO LAUT VALUES
	('12019', 'Laut Sawu', 'Barat Timor Leste', '118°54' - 124°23' E dan 8045°49,964' - 1109°43,919' S', 'Nusa Tenggara Timur',	3500, 1.25, 3497),
	('12031', 'Laut Banda', 'Tenggara Ambon', '131° - 133° 5’ E dan 5° – 6.5° S', 'Maluku', 47000, 1.25, 6500),
	('12025', 'Laut Sulawesi', 'Timur Kepulauan Sangihe', '3.138° - 4°40' N dan 124.17° - 125.491° E', 'Sulawesi Utara', 28000, 2.5, 6200),
	('12005', 'Laut Natuna', 'Selatan Laut Tiongkok Selatan', '1°N dan 107°E', 'Kepulauan Riau', 26220, 4, 110),
	('12032', 'Laut Halmahera', 'Utara Laut Seram',	'1°S dan 129°E', 'Maluku Utara', 9500, 4, 2039);


INSERT INTO CUACA VALUES
	('C-HL1', 20, 'Hujan Lebat', 'Barat Laut ke Timur Laut', '12005'),
	('C-HR1', 15, 'Hujan Ringan', 'Barat Daya ke Barat Laut', '12019'),
	('C-HR2', 6, 'Hujan Ringan', 'Barat ke Utara',	'12025'),
	('C-B1', 20, 'Berawan', 'Barat ke Timur', '12032'),
	('C-HR3', 10, 'Hujan Ringan', 'Barat Daya ke Barat Laut', '12031');


INSERT INTO PANTAI VALUES
	('HTT', 'Pantai Pulau Hatta', '2000 m', 'Putih', 'Banda Neira', '4°35'20.9"S dan 130°02'15.6"E', 'Maluku', 'P-BNDA'),
	('NPE', 'Pantai Napae', '1100 m', 'Putih', 'Sabu Raijua', '10°29'45"S dan 121°50'5"E', 'Nusa Tenggara Timur', 'P-SW'),
	('RMA', 'Pantai Rae Mea', '200 m', 'Putih', 'Sabu Raijua', '10°29'50.0"S dan 121°59'43.2"E', 'Nusa Tenggara Timur', 'P-SW'),
	('PLS', 'Pantai Pulisan', '500 m', 'Putih', 'Minahasa Utara', '1°40'57.6"N dan 125°08'49.1"E', 'Sulawesi Utara', 'P-SLWS'),
	('KHN', 'Pantai Kahona', '6000 m', 'Putih', 'Pasirpanjang', '1°23'55.3"N dan 125°11'11.7"E', 'Sulawesi utara', 'P-LMBH'),
	('SSI', 'Pantai Sisi', '7000 m', 'Putih', 'Serasan', '2°31'39.6"N dan 109°02'53.3"E', 'Kepulauan Riau', 'P-NTN'),
	('PPG',	'Pantai Pasir Panjang', '1000 m', 'Putih', 'Tobelo Utara', '1°47'16.0"N dan 127°57'22.0"E', 'Maluku Utara', 'P-HLMH'),
	('CMG', 'Pantai Cemaga', '5000 m', 'Putih', 'Natuna', '3°43'55.3"N dan 108°18'35.9"E', 'Kepulauan Riau', 'P-NTN');


INSERT INTO OBJEK_WISATA VALUES
	('OW-903', 'Wisata Bahari Kahona', '8 jam', 'Kecamatan Lembeh Selatan', 3000, '12025', 'KHN'),
	('OW-666', 'Wisata Pantai Pulisan', '24 jam', 'Kecamatan Likupang Timur', 5000,	'12025', 'PLS'),
	('OW-860', 'Wisata Pantai Sisi', '24 jam', 'Kecamatan Serasan', 4000, '12005', 'SSI'),
	('OW-512', 'Wisata Bahari Napae', '24 jam', 'Kecamatan Sabu Barat', 3000, '12019', 'NPE'),
	('OW-147', 'Wisata Pantai Rae Mea', '24 jam', 'Kecamatan Sabu Timur', 10000, '12019', 'RMA');


INSERT INTO GUNUNG_BERAPI VALUES
	('GA111', 'Banua Wuhu', 3000, 'A', 'Sulawesi Utara', '3.138°N dan 125.491°E', 'Pulau Sangihe'),
	('GA112', 'Emperor of China', 1500, 'B', 'Maluku', '6.62°S dan 124.22°E', 'Laut Banda'),
	('GA113', 'Hobal', 1018, 'A', 'Nusa Tenggara Timur', '6.62°S dan 124.22°E', 'Laut Banda'),
	('GA114', 'Kawio Barat', 3200, 'A', 'Sulawesi Utara', '4°40’4″N dan 125°4’9″E', 'Laut Sulawesi'),
	('GA115', 'Nieuwerkerk', 2285, 'A', 'Maluku', '6.60°S dan 124.675°E', 'Laut Banda'),
	('GA116', 'Yersey', NULL, 'B', 'Maluku', '6.60°S dan 124.675°E', 'Laut Banda');


INSERT INTO DI_BAWAH VALUES
	('12031', 'GA112'),
	('12031', 'GA113'),
	('12031', 'GA115'),
	('12031', 'GA116'),
	('12025', 'GA111'),
	('12025', 'GA114');


INSERT INTO DIKELILINGI VALUES
	('12031', 'P-BNDA'),
	('12019', 'P-SW'),
	('12019', 'P-TMR'),
	('12025', 'P-LMBH'),
	('12025', 'P-SLWS'),
	('12005', 'P-NTN'),
	('12032', 'P-HLMH');


INSERT INTO DILEWATI VALUES
	('12031', 'YFFD'),
	('12031', 'YGRG'),
	('12031', 'YD 4894'),
	('12019', 'YGSG'),
	('12025', 'YDOW'),
	('12025', 'YGQN'),
	('12005', 'YEWA'),
	('12032', 'YGQN');