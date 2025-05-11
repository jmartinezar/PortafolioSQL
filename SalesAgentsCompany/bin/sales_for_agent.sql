.headers on
.mode csv
.output sales_for_country_month.csv

SELECT 
    strftime('%m', o.ORD_DATE) AS Month,
    SUM(CASE WHEN c.CUST_COUNTRY = 'Australia' 
        THEN o.ORD_AMOUNT ELSE 0 END) AS Australia,
    SUM(CASE WHEN c.CUST_COUNTRY = 'Canada' 
        THEN o.ORD_AMOUNT ELSE 0 END) AS Canada,
    SUM(CASE WHEN c.CUST_COUNTRY = 'India' 
        THEN o.ORD_AMOUNT ELSE 0 END) AS India,
    SUM(CASE WHEN c.CUST_COUNTRY = 'UK' 
        THEN o.ORD_AMOUNT ELSE 0 END) AS UK,
    SUM(CASE WHEN c.CUST_COUNTRY = 'USA' 
        THEN o.ORD_AMOUNT ELSE 0 END) AS USA
FROM 
    CUSTOMER c
JOIN 
    ORDERS o ON c.CUST_CODE = o.CUST_CODE
GROUP BY 
    Month
ORDER BY 
    Month;