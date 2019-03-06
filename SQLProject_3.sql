USE Northwind
--Q1
SELECT e1.FirstName + ' '+ e1.LastName AS "Employee Name", e2.FirstName + ' ' + e2.LastName AS "Reports To" 
FROM Employees e1
INNER JOIN Employees e2
ON e2.EmployeeID = e1.ReportsTo;
--Q2
SELECT s.CompanyName, SUM(od.UnitPrice)* SUM(od.Quantity) AS "Total Sale" FROM [Order details] od 
INNER JOIN Orders o 
ON o.OrderID = od.OrderID
INNER JOIN [Products] p
ON od.ProductID = p.ProductID
INNER JOIN [Suppliers] s
ON p.SupplierID = s.SupplierID
WHERE (SELECT SUM(UnitPrice)* SUM(Quantity) FROM [Order Details]) > 10000
GROUP BY s.CompanyName ORDER BY "Total Sale";
--Q3
SELECT TOP (10) c.CompanyName, COUNT(o.ShipName) FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID
GROUP BY c.CompanyName, o.ShippedDate
ORDER BY COUNT(o.ShippedDate);
--Q4
SELECT AVG(DATEDIFF(day ,OrderDate, ShippedDate)) AS "Shipping time", MONTH(ShippedDate) AS "Average per Month" FROM [Orders]
GROUP BY MONTH(ShippedDate)
ORDER BY "Average per Month";
