USE COMPANY
GO

CREATE FUNCTION hitungGajiHarian(@gaji int, @bulan int,	@tahun int) 
RETURNS int
BEGIN 
	DECLARE @harian int 
	SET @harian = CASE
		WHEN (@bulan = 2) 
			THEN CASE 
			WHEN (@tahun%4 = 0) 
				THEN @gaji/29
			ELSE 
				@gaji/28 
		END
		WHEN (@bulan <= 7 AND @bulan != 2) 
			THEN CASE 
			WHEN (@bulan%2 = 0) 
				THEN @gaji/30
			ELSE 
				@gaji/31 
		END
		WHEN (@bulan > 7) 
			THEN CASE 
			WHEN (@bulan%2 = 0) 
				THEN @gaji/31										 
			ELSE 
				@gaji/30 END
		END
	RETURN @harian
END

GO