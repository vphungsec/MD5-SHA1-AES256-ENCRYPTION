/*----------------------------------------------------------
MASV: N17DCAT031
HO TEN: VO PHI HUNG
LAB: 04
NGAY: 24/09/2020
----------------------------------------------------------*/ 
USE [QLSV]
GO
CREATE PROC SP_EDIT_ENCRYPT_NHANVIEN (		--SP dung de chinh sua thong tin nhan vien
	@MANV VARCHAR(20) ,
	@HOTEN NVARCHAR(100) ,
	@EMAIL VARCHAR(20) ,
	@LUONG VARCHAR(256),
	@TENDN NVARCHAR(100),
	@MATKHAU VARCHAR(32)
) AS
BEGIN
	DECLARE @MK VARBINARY (256)
	SET @MK = HASHBYTES('SHA1',@MATKHAU)

	UPDATE NHANVIEN
	SET HOTEN = @HOTEN, EMAIL = @EMAIL, LUONG = CONVERT(VARBINARY(256),@LUONG), TENDN = @TENDN, MATKHAU = @MK
	WHERE MANV = @MANV
END