CREATE TABLE [dbo].[Manufacturers] (
    [ManufacturerId]               INT           IDENTITY (1, 1) NOT NULL,
    [ManufacturerName] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([ManufacturerId] ASC)
);