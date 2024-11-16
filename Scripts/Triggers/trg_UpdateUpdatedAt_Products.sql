use dbSITIC_Commerce;


--VERIFICA SI EXISTE EL TRIGGER
IF OBJECT_ID('trg_UpdateUpdatedAt_Products', 'TR') IS NOT NULL
BEGIN
--DESPUES LO ELIMINA
	DROP TRIGGER trg_UpdateUpdatedAt_Products;
END
GO
--SE CREA
CREATE TRIGGER trg_UpdateUpdatedAt_Products
ON [dbo].[Products]
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON

	UPDATE Products 
	SET Updated_At = GETDATE()
	FROM inserted i
	WHERE Products.id = i.Id
END