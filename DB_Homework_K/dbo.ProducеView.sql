CREATE VIEW [dbo].[Product]	AS
SELECT Products.ProductName AS Products,
	   Manufacturers.ManufacturerName AS Manufacturer,
	   Warehouses.WarehouseName AS Warehouse
FROM StoredProducts INNER JOIN Warehouses ON Warehouses.WarehouseId = StoredProducts.WarehouseId
INNER JOIN Products ON Products.ProductId = StoredProducts.ProductId
INNER JOIN Manufacturers ON Products.ManufacturerId = Manufacturers.ManufacturerId
