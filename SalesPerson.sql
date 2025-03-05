SELECT
    sp.BusinessEntityID,
    CONCAT(p.FirstName, ISNULL(' ' + p.MiddleName, ''), ' ', p.LastName) AS [Sales Person Name],
    YEAR(q.QuotaDate) AS [Fiscal Year], 
    SUM(q.SalesQuota) AS [Sales Quota]
FROM 
    Sales.SalesPerson sp
    LEFT JOIN Person.Person p ON sp.BusinessEntityID = p.BusinessEntityID
    LEFT JOIN Sales.SalesPersonQuotaHistory q ON sp.BusinessEntityID = q.BusinessEntityID
GROUP BY
    sp.BusinessEntityID,
    CONCAT(p.FirstName, ISNULL(' ' + p.MiddleName, ''), ' ', p.LastName),
    YEAR(q.QuotaDate);
