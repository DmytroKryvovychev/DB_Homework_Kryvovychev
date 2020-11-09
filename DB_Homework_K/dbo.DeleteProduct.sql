CREATE PROCEDURE [dbo].[DeleteProduct]
	@productid int
AS
BEGIN
DELETE StoredProducts WHERE ProductId = @productid
DELETE Products  WHERE ProductId = @productid
END