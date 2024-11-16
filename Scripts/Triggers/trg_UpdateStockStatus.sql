use dbSITIC_Commerce;


--VERIFICA SI EXISTE EL TRIGGER
IF OBJECT_ID('trg_UpdateStockStatus', 'TR') IS NOT NULL
BEGIN
--DESPUES LO ELIMINA
	DROP TRIGGER 'trg_UpdateStockStatus'
END
--SE CREA
CREATE TRIGGER trg_UpdateStockStatus
ON [dbo].[Products]
AFTER INSERT, UPDATE
AS
BEGIN

	IF UPDATE(Current_Stock) OR EXISTS (SELECT 1 FROM inserted)
	BEGIN
		DECLARE @statusStockId INT
--------------------------------------------------------------
		IF CURSOR_STATUS('GLOBAL', 'cursor_products') >= -1
		BEGIN
			CLOSE cursor_products
			DEALLOCATE cursor_products
		END

		--VARIABLES QUE UTILIZARA EL CURSOR
		DECLARE @ProductId INT,
				@CurrentStock INT,
				@MinStock INT

		--SE DECLARA CURSOR:
		DECLARE cursor_products CURSOR FOR
		--TABLA QUE VA A AFECTAR + SUS COLUMNAS ESPECIFICAS QUE NECESITAMOS
		SELECT Id, Current_Stock, Min_Stock
		FROM Products

		--SE ABRE CURSOR
		OPEN cursor_products

		--SE ABRE REGLON Y SE METEN LOS VALORES (EN ORDEN A LAS COLUMNAS ESPECIFICADAS)
		FETCH NEXT FROM cursor_products INTO @ProductId, 
											 @CurrentStock, 
											 @MinStock, 
											 @StatusKey
		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF(ISNULL(@CurrentStock, 0) = 0)
				SELECT @statusStockId = Id
				FROM Stock_Status
				WHERE [Key] = 'OUT_OF_STOCK'
			ELSE IF (@CurrentStock <= @MinStock)
				SELECT @statusStockId = Id
				FROM Stock_Status
				WHERE [Key] = 'LOW_STOCK'
			ELSE 
				SELECT @statusStockId = Id
				FROM Stock_Status
				WHERE [Key] = 'IN_STOCK'

				UPDATE Products
				SET Stock_Status_Id = @statusStockId
				WHERE Id = @ProductId
			FETCH NEXT FROM cursor_products INTO @ProductId
		END
		CLOSE cursor_products
		DEALLOCATE cursor_products
	END
END