use dbSITIC_Commerce;

IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Orders]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Tables */
	CREATE TABLE [dbo].[Orders]
	(
		[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Comentario de qué es
		[Total_Price] DECIMAL(20,2) NOT NULL,		--Precio total del pedido
		[Status] VARCHAR(50) NOT NULL,				--Estado del pedido (pendiente, enviado)
		[Created_At] DATETIME NOT NULL DEFAULT GETDATE(),	--Fecha de creacion del pedido
		[Updated_At] DATETIME NOT NULL DEFAULT GETDATE(),   --Fecha de ultima actualizacion del pedido
		
	)
END


/* Create Table Comments */
IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', NULL, NULL))
BEGIN
  EXEC sys.sp_updateextendedproperty 'MS_Description', 'Almacena la información sobre los pedidos realizados', 'SCHEMA', 'dbo', 'table', 'Orders'
END 
ELSE
BEGIN
  EXEC sys.sp_addextendedproperty 'MS_Description', 'Almacena la información sobre los pedidos realizados', 'SCHEMA', 'dbo', 'table', 'Orders'
END
GO


/*  Comentarios para las columnas */
-- Verifica y agrega la descripción extendida para cada columna en la tabla Orders

-- Id column
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Id'))
	EXEC sp_addextendedproperty 'MS_Description', 'Identificador único del pedido', 'Schema', '[dbo]', 'table', 'Orders', 'column', '[Id]'

-- Total_Price column
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Total_Price'))
	EXEC sp_addextendedproperty 'MS_Description', 'Precio total del pedido', 'Schema', '[dbo]', 'table',' Orders', 'column', '[Total_Price]'

-- Status column
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Status'))
	EXEC sp_addextendedproperty 'MS_Description', 'Estado del pedido (pendiente, enviado, etc.)', 'Schema', '[dbo]', 'table', 'Orders', 'column', '[Status]'

-- Created_At column
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Created_At'))
	EXEC sp_addextendedproperty 'MS_Description', 'Fecha de creación del pedido', 'Schema', '[dbo]', 'table', 'Orders', 'column', '[Created_At]'

-- Updated_At column
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Updated_At'))
	EXEC sp_addextendedproperty 'MS_Description', 'Fecha de última actualización del pedido', 'Schema', '[dbo]', 'table', 'Orders', 'column', '[Updated_At]'
