CREATE VIEW LAUT_TERLUAS AS
SELECT TOP(1) Nama, Luas
FROM LAUT
ORDER BY Luas DESC