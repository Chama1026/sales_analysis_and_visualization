WITH OrderTotal AS (
	SELECT
		s.SalesOrderID,
		SUM(sd.OrderQty) AS TotalQty
	FROM
		Sales.SalesOrderHeader s
		LEFT JOIN Sales.SalesOrderDetail sd ON s.SalesOrderID = sd.SalesOrderID
	GROUP BY
		s.SalesOrderID
)	
SELECT
	s.SalesOrderID,
	s.OrderDate AS [Order Date],
	CASE
		WHEN s.OnlineOrderFlag = 1 THEN 'Online'
		WHEN s.OnlineOrderFlag = 0 THEN 'Retail'
	END AS [Order Type],
	s.CustomerID,
	s.SalesPersonID,
	sd.ProductID,
	sd.OrderQty,
	o.TotalQty,
	s.TotalDue,
	CAST(sd.OrderQty AS DECIMAL) / CAST(o.TotalQty AS DECIMAL) * s.TotalDue AS [Product Amount]
FROM 
	Sales.SalesOrderHeader s
	LEFT JOIN Person.Address a ON s.BillToAddressID = a.AddressID
	LEFT JOIN Sales.SalesOrderDetail sd ON s.SalesOrderID = sd.SalesOrderID
	LEFT JOIN OrderTotal o ON s.SalesOrderID = o.SalesOrderID
