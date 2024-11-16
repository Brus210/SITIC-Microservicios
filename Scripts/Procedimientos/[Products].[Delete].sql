use dbSITIC_Commerce;

-- Author:		Andrea Escobar
-- Description:	Eliminar Productos
-- Fecha:		31/08/2024
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Products].[Delete]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Products].[Delete]
GO
CREATE PROCEDURE [Products].[Delete]
	@Id INT

WITH  ENCRYPTION  
AS 
BEGIN	
	DELETE Products WHERE ID =@Id
END
GO
EXEC sp_recompile N'[Products].[Delete]';
GO