use dbSITIC_Commerce;

--VERIFICA SI EXISTE EL TRIGGER
IF OBJECT_ID('trg_UpdateStockStatus', 'TR') IS NOT NULL
BEGIN
--DESPUES LO ELIMINA
	DROP TRIGGER trg_UpdateStockStatus;

END
go
--SE CREA
CREATE TRIGGER trg_UpdateStockStatus
ON [dbo].[Products]
AFTER INSERT, UPDATE
AS
BEGIN
	--SI SE MODIFICO LA COLUMNA Current_Stock O SI FUE INSERTADA
	IF UPDATE(Current_Stock) OR EXISTS (SELECT 1 FROM inserted)
	BEGIN

		DECLARE @statusStockId INT

		DECLARE @OutOfStockId INT,
				@LowStock INT,
				@InStock INT,
				@StockStatusId INT


		SELECT @OutOfStockId = Id
		FROM Stock_Status
		WHERE [Key] = 'OUT_OF_STOCK'

		SELECT @LowStock = Id
		FROM Stock_Status
		WHERE [Key] = 'LOW_STOCK'

		SELECT @InStock = Id
		FROM Stock_Status
		WHERE [Key] = 'IN_STOCK'

		--VERIFICAMOS QUE NO EXISTE PREVIAMENTE EL CURSOR PARA PODERLO CERRAR
		IF CURSOR_STATUS('GLOBAL', 'cursor_products') >= -1
		BEGIN
			CLOSE cursor_products --SE CIERRA
			DEALLOCATE cursor_products --SE LIBERA MEMORIA
		END

		--VARIABLES QUE UTILIZARA EL CURSOR
		DECLARE @ProductId INT,
				@CurrentStock INT,
				@MinStock INT

		--SE DECLARA CURSOR:
		DECLARE cursor_products CURSOR FAST_FORWARD FOR

		--TABLA QUE VA A AFECTAR + SUS COLUMNAS ESPECIFICAS QUE NECESITAMOS PARA OPERACIONES
		SELECT Id, --0 
			   Current_Stock, --1 
			   Min_Stock --2
		FROM Products

		--SE ABRE CURSOR
		OPEN cursor_products

		--SE ABRE REGLON Y SE METEN LOS VALORES (EN ORDEN A LAS COLUMNAS ESPECIFICADAS)
		FETCH NEXT FROM cursor_products INTO @ProductId, --0 Id
											 @CurrentStock, --1 Current_Stock
											 @MinStock --2 MinStock
		--SE ABRE BLOQUE DE EJECUCION (CICLO)
		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF(ISNULL(@CurrentStock, 0) = 0)
				SET @StockStatusId = @OutOfStockId
			ELSE IF (@CurrentStock <= @MinStock)
				SET @StockStatusId = @LowStock
			ELSE 
				SET @StockStatusId = @InStock

				--SE ACTUALIZA LA INFORMACION EN BASE AL CALCULO PREVIO
				UPDATE Products
				SET Stock_Status_Id = @statusStockId
				WHERE Id = @ProductId

			FETCH NEXT FROM cursor_products INTO @ProductId, @CurrentStock, @MinStock
		END
		CLOSE cursor_products
		DEALLOCATE cursor_products
	END
END