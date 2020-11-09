/*
Скрипт развертывания для DB_Homework_Kryvovychev

Этот код был создан программным средством.
Изменения, внесенные в этот файл, могут привести к неверному выполнению кода и будут потеряны
в случае его повторного формирования.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DB_Homework_Kryvovychev"
:setvar DefaultFilePrefix "DB_Homework_Kryvovychev"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\"

GO
:on error exit
GO
/*
Проверьте режим SQLCMD и отключите выполнение скрипта, если режим SQLCMD не поддерживается.
Чтобы повторно включить скрипт после включения режима SQLCMD выполните следующую инструкцию:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'Для успешного выполнения этого скрипта должен быть включен режим SQLCMD.';
        SET NOEXEC ON;
    END


GO
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Выполняется создание $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE Cyrillic_General_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Параметры базы данных изменить нельзя. Применить эти параметры может только пользователь SysAdmin.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Параметры базы данных изменить нельзя. Применить эти параметры может только пользователь SysAdmin.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
/*
 Шаблон скрипта после развертывания							
--------------------------------------------------------------------------------------
 В данном файле содержатся инструкции SQL, которые будут исполнены перед скриптом построения.	
 Используйте синтаксис SQLCMD для включения файла в скрипт, выполняемый перед развертыванием.			
 Пример:      :r .\myfile.sql								
 Используйте синтаксис SQLCMD для создания ссылки на переменную в скрипте перед развертыванием.		
 Пример:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
PRINT('Pre deployment script')
GO

GO
PRINT N'Выполняется создание [dbo].[Items]...';


GO
CREATE TYPE [dbo].[Items] AS TABLE (
    [ProductName] NVARCHAR (30) NULL,
    [Price]       MONEY         NULL);


GO
PRINT N'Выполняется создание [dbo].[Manufacturers]...';


GO
CREATE TABLE [dbo].[Manufacturers] (
    [ManufacturerId]   INT           IDENTITY (1, 1) NOT NULL,
    [ManufacturerName] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([ManufacturerId] ASC)
);


GO
PRINT N'Выполняется создание [dbo].[Products]...';


GO
CREATE TABLE [dbo].[Products] (
    [ProductId]      INT           IDENTITY (1, 1) NOT NULL,
    [ProductName]    NVARCHAR (30) NOT NULL,
    [PriceForEach]   MONEY         NOT NULL,
    [ManufacturerId] INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([ProductId] ASC)
);


GO
PRINT N'Выполняется создание [dbo].[StoredProducts]...';


GO
CREATE TABLE [dbo].[StoredProducts] (
    [ProductId]   INT NOT NULL,
    [WarehouseId] INT NOT NULL,
    [Count]       INT NOT NULL
);


GO
PRINT N'Выполняется создание [dbo].[Warehouses]...';


GO
CREATE TABLE [dbo].[Warehouses] (
    [WarehouseId]   INT           IDENTITY (1, 1) NOT NULL,
    [WarehouseName] NVARCHAR (30) NOT NULL,
    PRIMARY KEY CLUSTERED ([WarehouseId] ASC)
);


GO
PRINT N'Выполняется создание ограничение без названия для [dbo].[Products]...';


GO
ALTER TABLE [dbo].[Products]
    ADD FOREIGN KEY ([ManufacturerId]) REFERENCES [dbo].[Manufacturers] ([ManufacturerId]);


GO
PRINT N'Выполняется создание ограничение без названия для [dbo].[StoredProducts]...';


GO
ALTER TABLE [dbo].[StoredProducts]
    ADD FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Products] ([ProductId]);


GO
PRINT N'Выполняется создание ограничение без названия для [dbo].[StoredProducts]...';


GO
ALTER TABLE [dbo].[StoredProducts]
    ADD FOREIGN KEY ([WarehouseId]) REFERENCES [dbo].[Warehouses] ([WarehouseId]);


GO
PRINT N'Выполняется создание [dbo].[Product]...';


GO
CREATE VIEW [dbo].[Product]	AS
SELECT Products.ProductName AS Products,
	   Manufacturers.ManufacturerName AS Manufacturer,
	   Warehouses.WarehouseName AS Warehouse
FROM StoredProducts INNER JOIN Warehouses ON Warehouses.WarehouseId = StoredProducts.WarehouseId
INNER JOIN Products ON Products.ProductId = StoredProducts.ProductId
INNER JOIN Manufacturers ON Products.ManufacturerId = Manufacturers.ManufacturerId
GO
PRINT N'Выполняется создание [dbo].[AddNewManufacturer]...';


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
GO
PRINT N'Выполняется создание [dbo].[AddProductToWarehouse]...';


GO
CREATE PROCEDURE [dbo].[AddProductToWarehouse]
	@productId int,
	@warehouseId int,
	@count int
AS
BEGIN
INSERT INTO StoredProducts (ProductId, WarehouseId, Count) VALUES (@productId, @warehouseId, @count)
END
GO
PRINT N'Выполняется создание [dbo].[DeleteProduct]...';


GO
CREATE PROCEDURE [dbo].[DeleteProduct]
	@productid int
AS
BEGIN
DELETE StoredProducts WHERE ProductId = @productid
DELETE Products  WHERE ProductId = @productid
END
GO
/*
Шаблон скрипта после развертывания							
--------------------------------------------------------------------------------------
 В данном файле содержатся инструкции SQL, которые будут добавлены в скрипт построения.		
 Используйте синтаксис SQLCMD для включения файла в скрипт после развертывания.			
 Пример:      :r .\myfile.sql								
 Используйте синтаксис SQLCMD для создания ссылки на переменную в скрипте после развертывания.		
 Пример:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
PRINT ('Inserting data')

insert into dbo.Warehouses (WarehouseName)
select 'London'
where not exists(select 1 from dbo.Warehouses where WarehouseName = 'London')
GO
insert into dbo.Warehouses (WarehouseName)
select 'Berlin'
where not exists(select 1 from dbo.Warehouses where WarehouseName = 'Berlin')
GO
insert into dbo.Manufacturers(ManufacturerName)
select 'NewLine'
where not exists(select 1 from dbo.Manufacturers where ManufacturerName = 'NewLine')
GO
insert into dbo.Manufacturers(ManufacturerName)
select 'Captain'
where not exists(select 1 from dbo.Manufacturers where ManufacturerName = 'Captain')
GO
insert into dbo.Products(ProductName, PriceForEach, ManufacturerId)
select 'Paper', 10, 1
where not exists(select 1 from dbo.Products where ProductName = 'Paper' and ManufacturerId = 1)
GO
insert into dbo.Products(ProductName, PriceForEach, ManufacturerId)
select 'Books', 200, 1
where not exists(select 1 from dbo.Products where ProductName = 'Books' and ManufacturerId = 1)
GO
insert into dbo.Products(ProductName, PriceForEach, ManufacturerId)
select 'Fish', 10,  2
where not exists(select 1 from dbo.Products where ProductName = 'Fish' and ManufacturerId = 2)
GO
insert into dbo.Products(ProductName, PriceForEach, ManufacturerId)
select 'Bottle', 10, 2
where not exists(select 1 from dbo.Products where ProductName = 'Bottle' and ManufacturerId = 2)
GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Обновление завершено.';


GO
