
-- * : ALL
-- ASC : �������� ASCENGIND�� ����
-- DESC : �������� DESCENDING�� ����

SELECT *
FROM dbo.Customers;

SELECT *
FROM dbo.Customers
WHERE FirstName = 'Adam' AND MiddleInitial IS NULL;

SELECT TOP (100) FirstName
FROM dbo.Customers;

SELECT *
FROM dbo.Products
ORDER BY Price DESC;

