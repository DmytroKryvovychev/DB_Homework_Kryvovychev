CREATE TABLE [dbo].[Warehouses] (
    [WarehouseId]            INT           IDENTITY (1, 1) NOT NULL,
    [WarehouseName] NVARCHAR (30) NOT NULL,
    PRIMARY KEY CLUSTERED ([WarehouseId] ASC)
);

