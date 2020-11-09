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
