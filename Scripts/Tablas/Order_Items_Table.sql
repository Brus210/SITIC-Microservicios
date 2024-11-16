use dbSITIC_Commerce;

IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Order_Items]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Tables */
	--Almacena la informacion de los elementos del pedido
	CREATE TABLE [dbo].[Order_Items]
	(
		[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Identificador unico del elemento del carrito
		[Order_Id] INT NOT NULL,						--Identificador relacion al pedido (maestro)
		[Product_Id] INT NOT NULL,					--Identificador relacion al producto
		[Quantity] INT NOT NULL,					--Cantidad del producto en el carrito
		[Price] DECIMAL (18,2) NOT NULL,			--Precio del producto en el momento de añadirlo al carrito
		[Created_At] DATETIME NOT NULL DEFAULT GETDATE(),	--Fecha de creacion del producto añadido
		[Updated_At] DATETIME NOT NULL DEFAULT GETDATE(),   --Fecha de ultima actualizacion del producto añadido		
		FOREIGN KEY ([Order_Id]) REFERENCES [dbo].[Orders]([Id]),
		FOREIGN KEY ([Product_Id]) REFERENCES [dbo].[Products]([Id]),

	)
END


/* Create Table Comments */
IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Order_Items', NULL, NULL))
BEGIN
  EXEC sys.sp_updateextendedproperty 'MS_Description', 'Almacena la informacion de los elementos del pedido', 'SCHEMA', 'dbo', 'table', 'Order_Items'
END 
ELSE
BEGIN
  EXEC sys.sp_addextendedproperty 'MS_Description', 'Almacena la informacion de los elementos del pedido', 'SCHEMA', 'dbo', 'table', 'Order_Items'
END
GO


/*  Comentarios para las columnas */
-- Verifica y agrega la descripción extendida para cada columna en la tabla Order_Items
-- Id column
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Order_Items', 'column', 'Id'))
	EXEC sp_addextendedproperty 'MS_Description', 'Identificador único del elemento del pedido', 'Schema', [dbo], 'table', Order_Items, 'column', [Id]

-- Order_Id column
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Order_Items', 'column', 'Order_Id'))
	EXEC sp_addextendedproperty 'MS_Description', 'Identificador que relaciona al pedido (maestro)', 'Schema', [dbo], 'table', Order_Items, 'column', [Order_Id]

-- Product_Id column
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Order_Items', 'column', 'Product_Id'))
	EXEC sp_addextendedproperty 'MS_Description', 'Identificador que relaciona al producto', 'Schema', [dbo], 'table', Order_Items, 'column', [Product_Id]

-- Quantity column
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Order_Items', 'column', 'Quantity'))
	EXEC sp_addextendedproperty 'MS_Description', 'Cantidad del producto en el pedido', 'Schema', [dbo], 'table', Order_Items, 'column', [Quantity]

-- Price column
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Order_Items', 'column', 'Price'))
	EXEC sp_addextendedproperty 'MS_Description', 'Precio del producto en el momento de añadirlo al pedido', 'Schema', [dbo], 'table', Order_Items, 'column', [Price]

-- Created_At column
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Order_Items', 'column', 'Created_At'))
	EXEC sp_addextendedproperty 'MS_Description', 'Fecha de creación del producto añadido al pedido', 'Schema', [dbo], 'table', Order_Items, 'column', [Created_At]

-- Updated_At column
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Order_Items', 'column', 'Updated_At'))
	EXEC sp_addextendedproperty 'MS_Description', 'Fecha de última actualización del producto añadido al pedido', 'Schema', [dbo], 'table', Order_Items, 'column', [Updated_At]

