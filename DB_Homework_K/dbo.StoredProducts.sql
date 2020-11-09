CREATE TABLE [dbo].[StoredProducts]
(
	[ProductId] INT NOT NULL,
	[WarehouseId] INT NOT NULL,
	[Count] INT NOT NULL,
	FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Products] ([ProductId]),
	FOREIGN KEY ([WarehouseId]) REFERENCES [dbo].[Warehouses] ([WarehouseId])
)
