CREATE TABLE [dbo].[Products] (
    [ProductId]             INT           IDENTITY (1, 1) NOT NULL,
    [ProductName]    NVARCHAR (30) NOT NULL,
    [PriceForEach]          MONEY         NOT NULL,
    [ManufacturerId] INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([ProductId] ASC),
    FOREIGN KEY ([ManufacturerId]) REFERENCES [dbo].[Manufacturers] ([ManufacturerId])
);

