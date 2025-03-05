SELECT DISTINCT
	p.ProductID,
	p.Name AS [Product Name],
	ISNULL(pc.Name, 'Other') AS [Product Category],
	ISNULL(ps.Name, 'Other') AS [Product Subcategory],
	CASE
		WHEN p.ProductLine = 'R' THEN 'Road'
		WHEN p.ProductLine = 'M' THEN 'Mountain'
		WHEN p.ProductLine = 'T' THEN 'Touring'
		WHEN p.ProductLine = 'S' THEN 'Standard'
		ELSE 'Other'
	END AS [Product Line],
	CASE 
		WHEN p.Class = 'H' THEN 'High-end'
		WHEN p.Class = 'M' THEN 'Mid-range'
		WHEN p.Class = 'L' THEN 'Low-end'
		ELSE 'Other'
	END AS [Product Class],
	CASE
		WHEN p.Style = 'W' THEN 'Women'
		WHEN p.Style = 'M' THEN 'Men'
		ELSE 'Unisex'
	END AS [Product Style]
FROM 
	Production.Product p
	LEFT JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
	LEFT JOIN Production.ProductCategory pc ON ps.ProductCategoryID = pc.ProductCategoryID
ORDER BY [Product Category]

