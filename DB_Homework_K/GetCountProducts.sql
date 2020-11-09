SELECT Manufacturers.ManufacturerName, SUM(StoredProducts.Count) FROM StoredProducts
INNER JOIN Products ON Products.ProductId = StoredProducts.ProductId
INNER JOIN Manufacturers ON Manufacturers.ManufacturerId =Products.ManufacturerId
GROUP BY Manufacturers.ManufacturerName