/*Este query toma de la tabla ORDERS las columnas con el número de orden, el monto de la orden, la fecha de la orden, el código del cliente y el código del agente. La tabla resultado contiene solo los datos de las órdenes hechas en fechas diferentes a 2008-04-15, órdenes cuyo código de agente sea menor a A010 y cuyo monto sea menor a 1500*/

SELECT "ORD_NUM", "ORD_AMOUNT", "ORD_DATE", "CUST_CODE", "AGENT_CODE"
       FROM "ORDERS"
       WHERE ("ORD_DATE"!='2008-04-15' AND "ORDERS"."AGENT_CODE" < 'A010' AND "ORD_AMOUNT"<1500)
       ORDER BY 1;
