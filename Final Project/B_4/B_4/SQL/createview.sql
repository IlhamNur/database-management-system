USE KEPENDUDUKAN4

CREATE VIEW KEPADATAN_TERBANYAK AS
SELECT TOP(1) P.NamaPulau  FROM PULAU as P
JOIN KONDISISOSIAL AS G ON P.KdPulau = G.KdPulau 
where G.DistribusiPenduduk='padat'
ORDER BY G.DistribusiPenduduk DESC



