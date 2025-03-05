SELECT
	'Total Customers' AS 'Stage',
	COUNT(DISTINCT CustomerID) AS [Customer Count]
FROM 
	sales.SalesOrderHeader

UNION ALL

SELECT
	CASE
		WHEN [Order Count] = 1 THEN '1 Purchase'
		WHEN [Order Count] = 2 THEN '2 Purchase'
		WHEN [Order Count] = 3 THEN '3 Purchase'
		WHEN [Order Count] = 4 THEN '4 Purchase'
		WHEN [Order Count] >= 5 AND [Order Count] <= 9 THEN '5 - 9 Purchase'
		WHEN [Order Count] >= 10 THEN '10 + Purchase'
	END AS 'Stage',
	COUNT(CustomerID) AS [Customer Count]
FROM 
(
	SELECT
		CustomerID,
		COUNT(DISTINCT SalesOrderID) AS [Order Count]
	FROM
		Sales.SalesOrderHeader
	GROUP BY
		CustomerID
) AS CustomerOrderCount 
GROUP BY
	CASE
		WHEN [Order Count] = 1 THEN '1 Purchase'
		WHEN [Order Count] = 2 THEN '2 Purchase'
		WHEN [Order Count] = 3 THEN '3 Purchase'
		WHEN [Order Count] = 4 THEN '4 Purchase'
		WHEN [Order Count] >= 5 AND [Order Count] <= 9 THEN '5 - 9 Purchase'
		WHEN [Order Count] >= 10 THEN '10 + Purchase'
	END
ORDER BY
	[Customer Count] DESC
