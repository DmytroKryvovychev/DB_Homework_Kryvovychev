CREATE PROCEDURE [dbo].[AddProductToWarehouse]
	@productId int,
	@warehouseId int,
	@count int
AS
BEGIN
INSERT INTO StoredProducts (ProductId, WarehouseId, Count) VALUES (@productId, @warehouseId, @count)
END