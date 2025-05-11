.headers on
.mode csv
.output sales_for_agent.csv

SELECT 
    A.AGENT_CODE,
    A.AGENT_NAME,
    SUM(O.ORD_AMOUNT) AS TOTAL_SALES,
    ROUND(A.COMMISSION * SUM(O.ORD_AMOUNT), 2) AS TOTAL_COMMISSION
FROM
    ORDERS O JOIN AGENTS A 
    ON O.AGENT_CODE = A.AGENT_CODE
GROUP BY
    A.AGENT_CODE
ORDER BY
    A.AGENT_NAME ASC;

.output sales_for_country_month.csv

/*
SELECT 
    c.CUST_COUNTRY AS Country,
    SUM(CASE WHEN strftime('%m', o.ORD_DATE) = '01' 
        THEN o.ORD_AMOUNT ELSE 0 END) AS January,
    SUM(CASE WHEN strftime('%m', o.ORD_DATE) = '02' 
        THEN o.ORD_AMOUNT ELSE 0 END) AS February,
    SUM(CASE WHEN strftime('%m', o.ORD_DATE) = '03' 
        THEN o.ORD_AMOUNT ELSE 0 END) AS March,
    SUM(CASE WHEN strftime('%m', o.ORD_DATE) = '04' 
        THEN o.ORD_AMOUNT ELSE 0 END) AS April,
    SUM(CASE WHEN strftime('%m', o.ORD_DATE) = '05' 
        THEN o.ORD_AMOUNT ELSE 0 END) AS May,
    SUM(CASE WHEN strftime('%m', o.ORD_DATE) = '06' 
        THEN o.ORD_AMOUNT ELSE 0 END) AS June,
    SUM(CASE WHEN strftime('%m', o.ORD_DATE) = '07' 
        THEN o.ORD_AMOUNT ELSE 0 END) AS July,
    SUM(CASE WHEN strftime('%m', o.ORD_DATE) = '08' 
        THEN o.ORD_AMOUNT ELSE 0 END) AS August,
    SUM(CASE WHEN strftime('%m', o.ORD_DATE) = '09' 
        THEN o.ORD_AMOUNT ELSE 0 END) AS September,
    SUM(CASE WHEN strftime('%m', o.ORD_DATE) = '10' 
        THEN o.ORD_AMOUNT ELSE 0 END) AS October,
    SUM(CASE WHEN strftime('%m', o.ORD_DATE) = '11' 
        THEN o.ORD_AMOUNT ELSE 0 END) AS November,
    SUM(CASE WHEN strftime('%m', o.ORD_DATE) = '12' 
        THEN o.ORD_AMOUNT ELSE 0 END) AS December
FROM 
    CUSTOMER c
JOIN 
    ORDERS o ON c.CUST_CODE = o.CUST_CODE
GROUP BY 
    c.CUST_COUNTRY
ORDER BY 
    c.CUST_COUNTRY;
*/
--

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