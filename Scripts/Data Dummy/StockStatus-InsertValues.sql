use dbSITIC_Commerce;

SELECT * from Stock_Status;
Select * from vwStock_Status;

IF NOT EXISTS (SELECT 1 from Stock_status WHERE [KEY] = 'IN_STOCK')
Insert into Stock_status(Status_Name, [KEY])
VALUES ('In Stock','IN_STOCK')
ELSE
	PRINT('Ya existe IN_STOCK')

IF NOT EXISTS (SELECT 1 from Stock_status WHERE [KEY] = 'OUT_OF_STOCK')
Insert into Stock_status(Status_Name, [KEY])
VALUES ('Out of Stock','OUT_OF_STOCK')
ELSE
	PRINT('Ya existe OUT_OF_STOCK')

IF NOT EXISTS (SELECT 1 from Stock_status WHERE [KEY] = 'LOW_STOCK')
Insert into Stock_status(Status_Name, [KEY])
VALUES ('Low Stock','LOW_STOCK')
ELSE
	PRINT('Ya existe LOW_STOCK')
