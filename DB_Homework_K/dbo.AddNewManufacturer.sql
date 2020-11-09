CREATE TYPE Items AS TABLE(
	ProductName    NVARCHAR(30),
    Price          MONEY
)
GO

CREATE PROCEDURE [dbo].[AddNewManufacturer]
	(@manufacturerName nvarchar(50),
	@products Items READONLY)
AS
BEGIN
	INSERT INTO Manufacturers (ManufacturerName) VALUES (@manufacturerName)
	DECLARE @manufacturerId int
	SET @manufacturerId = SCOPE_IDENTITY()
	INSERT INTO Products(ProductName, PriceForEach, ManufacturerId) SELECT ProductName, Price, @manufacturerId FROM @products
END