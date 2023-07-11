/*Este query genera el código del cliente que tuvo en total mayor monto de orden, teniendo en cuenta todas las órdenes, junto con el monto total de dicho cliente*/

SELECT "CUST_CODE", SUM("ORD_AMOUNT") AS "TOTAL_AMOUNT"
FROM "ORDERS"
GROUP BY "CUST_CODE"
ORDER BY 2 DESC LIMIT 1
