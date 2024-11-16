use dbSITIC_Commerce;

-- Author:		Andrea Escobar
-- Description:	SELECCIONAR Productos
-- Fecha:		31/08/2024
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Products].[GetById]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Products].[GetById]
GO
CREATE PROCEDURE [Products].[GetById]
	@Id INT

WITH  ENCRYPTION  
AS 
BEGIN	
	SELECT ID , Name, Description, Price, Current_Stock, Max_Stock, Min_Stock, Image_Path FROM Products WHERE Id = @Id
END
GO
EXEC sp_recompile N'[Products].[GetById]';
GO