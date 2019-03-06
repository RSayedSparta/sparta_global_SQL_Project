USE Northwind

SELECT CustomerID, CompanyName, Address --displaying the three columns 
FROM Customers WHERE City ='London' OR City = 'Paris';-- columns from the customers table, condition is when the city column 

SELECT * FROM Products 
WHERE QuantityPerUnit 
LIKE '%bottle%';

SELECT s.CompanyName, s.Country
FROM Products p 
INNER JOIN Suppliers s 
ON p.SupplierID = s.SupplierID 
WHERE QuantityPerUnit 
LIKE '%bottle%';

SELECT DISTINCT CategoryName, p.ReorderLevel FROM Products p 
INNER JOIN Categories c 
ON c.CategoryID = p.CategoryID
GROUP BY p.ReorderLevel, CategoryName 
ORDER BY p.ReorderLevel DESC;

SELECT TitleOfCourtesy + FirstName + LastName, City FROM Employees 
WHERE Country = 'UK';

-- SELECT FORMAT((SUM(UnitPrice)* SUM(Quantity)),'N', 'en-us') AS "Sale Total" 
-- FROM [Order Details];

SELECT r.RegionDescription,FORMAT((SUM(UnitPrice)* SUM(Quantity)),'N', 'en-us') AS "Sales Total" 
FROM [Order Details] od 
INNER JOIN Orders o 
ON od.OrderID = o.OrderID
INNER JOIN EmployeeTerritories et
ON o.EmployeeID = et.EmployeeID
INNER JOIN Territories t
ON et.TerritoryID =t.TerritoryID
INNER JOIN Region r
ON t.RegionID = r.RegionID
GROUP BY od.OrderID, r.RegionDescription 
ORDER BY "Sales Total" ASC;

SELECT COUNT (*) FROM Orders o 
WHERE o.Freight > 100.00 
AND ShipCountry ='USA' 
OR ShipCountry = 'UK';

SELECT o.OrderID ,MAX(od.Discount) AS "Biggest Discount" 
FROM Orders o 
INNER JOIN [Order Details] od 
ON o.OrderID = od.OrderID 
GROUP BY o.OrderID, od.Discount 
ORDER BY "Biggest Discount" DESC;