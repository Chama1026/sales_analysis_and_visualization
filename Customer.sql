WITH PurchaseDate AS (
	SELECT
		CustomerID, 
		MIN(OrderDate) AS [First Purchase Date],
		Max(OrderDate) AS [Last Purchase Date]
	FROM
		Sales.SalesOrderHeader
	GROUP BY
		CustomerID
)
SELECT DISTINCT
	c.CustomerID,
	CASE
		WHEN c.StoreID IS NOT NULL THEN s.Name
		ELSE CONCAT(p.FirstName, ISNULL(' ' + p.MiddleName, ''), ' ',p.LastName) 
	END AS [Customer Name],
	CASE
		WHEN c.StoreID IS NOT NULL THEN 'Business'
		ELSE 'Individual'
	END AS [Customer Type],
	a.City,
	CASE	
		WHEN p.EmailPromotion = 0 THEN 'Non-subscriber'
		ELSE 'Subscriber'
	END AS [Email Promotion],
	pd.[First Purchase Date],
	pd.[Last Purchase Date]
FROM 
	Sales.Customer c
	LEFT JOIN Person.Person p ON c.CustomerID = p.BusinessEntityID
	LEFT JOIN Person.BusinessEntityAddress ba ON c.CustomerID = ba.BusinessEntityID
	LEFT JOIN Person.Address a ON ba.AddressID = a.AddressID
	LEFT JOIN PurchaseDate pd ON c.CustomerID = pd.CustomerID
	LEFT JOIN Sales.Store s ON c.StoreID = s.BusinessEntityID
WHERE
	pd.[First Purchase Date] IS NOT NULL

