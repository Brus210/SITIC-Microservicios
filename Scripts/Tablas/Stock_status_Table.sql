use dbSITIC_Commerce;

IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Stock_Status]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Tables */
    --Almacena los diferentes estados de existencia de un producto
	CREATE TABLE [dbo].[Stock_Status]
	(
		[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Identificador principal de la tabla Stock_Status
		[Status_Name] VARCHAR(50) not null,				--Nombre del estado de existencia
		[Key] VARCHAR(50) not null,				--Clave del estado de existencia
		

		
	)
END


/* Create Table Comments */
IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Stock_Status', NULL, NULL))
BEGIN
  EXEC sys.sp_updateextendedproperty 'MS_Description', 'Almacena los diferentes estados de existencia de los productos', 'SCHEMA', 'dbo', 'table', 'Stock_Status'
END 
ELSE
BEGIN
  EXEC sys.sp_addextendedproperty 'MS_Description', 'Almacena los diferentes estados de existencia de los productos', 'SCHEMA', 'dbo', 'table', 'Stock_Status'
END
GO


/*  Comentarios para las columnas */
-- Verifica y agrega la descripción extendida para cada columna en la tabla Stock_Status

-- Id column
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Stock_Status', 'column', 'Id'))
	EXEC sp_addextendedproperty 'MS_Description', 'Identificador principal de la tabla Stock_Status', 'Schema', '[dbo]', 'table', 'Stock_Status', 'column', '[Id]'

-- Status_Name column
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Stock_Status', 'column', 'Status_Name'))
	EXEC sp_addextendedproperty 'MS_Description', 'Nombre del estado de existencia', 'Schema', '[dbo]', 'table', 'Stock_Status', 'column', '[Status_Name]'

-- [Key] column
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Stock_Status', 'column', 'Key'))
	EXEC sp_addextendedproperty 'MS_Description', 'Clave del estado de existencia', 'Schema', '[dbo]', 'table', 'Stock_Status', 'column', '[Key]'

