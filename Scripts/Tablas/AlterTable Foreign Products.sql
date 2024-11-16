use dbSITIC_Commerce;

--Alter table para añadir llave foranea del producto en la tabla: Cart_Items
IF NOT EXISTS(
	Select 1
	From sys.foreign_keys
	where name = 'FK_Cart_Items_Cart_Id'
)
BEGIN
	ALTER TABLE [dbo].[Cart_Items]
	Add constraint FK_Cart_Items_Cart_Id
	FOREIGN KEY ([Cart_Id])References [dbo].[Carts]([Id])
END

--Alter table para añadir llave foranea del producto en la tabla: Cart
IF NOT EXISTS(
	Select 1
	From sys.foreign_keys
	where name = 'FK_Cart_Items_Cart_Id'
)
BEGIN
	ALTER TABLE [dbo].[Cart_Items]
	Add constraint FK_Cart_Items_Cart_Id
	FOREIGN KEY ([Cart_Id])References [dbo].[Cart]([Id])
END