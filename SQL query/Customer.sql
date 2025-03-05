WITH purchasedate
     AS (SELECT customerid,
                Min(orderdate) AS [First Purchase Date],
                Max(orderdate) AS [Last Purchase Date]
         FROM   sales.salesorderheader
         GROUP  BY customerid)
SELECT DISTINCT c.customerid,
                CASE
                  WHEN c.storeid IS NOT NULL THEN s.NAME
                  ELSE Concat(p.firstname, Isnull(' ' + p.middlename, ''), ' ',
                       p.lastname)
                END AS [Customer Name],
                CASE
                  WHEN c.storeid IS NOT NULL THEN 'Business'
                  ELSE 'Individual'
                END AS [Customer Type],
                a.city,
                CASE
                  WHEN p.emailpromotion = 0 THEN 'Non-subscriber'
                  ELSE 'Subscriber'
                END AS [Email Promotion],
                pd.[first purchase date],
                pd.[last purchase date]
FROM   sales.customer c
       LEFT JOIN person.person p
              ON c.customerid = p.businessentityid
       LEFT JOIN person.businessentityaddress ba
              ON c.customerid = ba.businessentityid
       LEFT JOIN person.address a
              ON ba.addressid = a.addressid
       LEFT JOIN purchasedate pd
              ON c.customerid = pd.customerid
       LEFT JOIN sales.store s
              ON c.storeid = s.businessentityid
WHERE  pd.[first purchase date] IS NOT NULL 

