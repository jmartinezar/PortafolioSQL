/*El presente query usa where para aplicar dos condiciones al mismo dato y ordena alfabéticamente según el nombre*/

SELECT "AGENT_CODE", "AGENT_NAME", "WORKING_AREA", "COMMISSION"
FROM "AGENTS"
WHERE ("COMMISSION" >= 0.12 AND "COMMISSION" < 0.14)
ORDER BY 2;

/*Este query crea una tabla con el código y el nombre de los agentes según la cantidad de órdenes que hayan realizado, organizados de mayor a menor cantidad de órdenes*/

SELECT A."AGENT_CODE", "AGENT_NAME", COUNT("ORD_NUM")
FROM "AGENTS" A, "ORDERS" O
WHERE A."AGENT_CODE"=O."AGENT_CODE"
GROUP BY 2, 1
ORDER BY 3 DESC;

/*El presente query genera una tabla a partir de la tabla CUSTOMER que contiene el código del cliente, su nombre, su ciudad, su grado y el código del vendedor, mostrando solamente los vendedores que son de New York o que tienen un grado superior a 2*/

SELECT "CUST_CODE", "CUST_NAME", "WORKING_AREA", "GRADE", "AGENT_CODE"
FROM "CUSTOMER"
WHERE ("CUSTOMER"."WORKING_AREA" = 'New York' OR "GRADE" > 2)
ORDER BY 2;

/*El código crea una tabla de dos columnas: la primera con los nombres de los países en los que la empresa cuenta con más de dos clientes y la segunda con la cantidad de clientes que tiene la empresa en cada uno de estos países, está organizada alfabéticamente según el nombre de los países.*/

SELECT "CUST_COUNTRY", COUNT("CUST_NAME") AS "CUST_FOR_COUNTRY"
       FROM "CUSTOMER"
       GROUP BY "CUST_COUNTRY"
       HAVING COUNT("CUST_NAME")>2
       ORDER BY 1;

/*El presente Query crea una tabla derivada de la tabla CUSTOMER que contiene las columnas con el código, el nombre, área de trabajo y el grado, los ordena de menor a mayor grado, para clientes con el mismo grado se organizan siguiendo un orden alfabético*/

SELECT "CUST_CODE", "CUST_NAME", "WORKING_AREA", "GRADE"
FROM "CUSTOMER"
ORDER BY 4 DESC, 2;

/*El presente código funciona para proporcionar una tabla de los clientes con su código, su nombre, su área de trabajo y su monto operativo, organizadas, en la tabla solo entran los tres clientes con mayor monto de operación, siempre que dicho monto sea superior a US$ 50*/

SELECT "CUST_CODE", "CUST_NAME", "WORKING_AREA", "OPENING_AMT"
FROM "CUSTOMER"
WHERE "OPENING_AMT">50
ORDER BY 4 DESC LIMIT 3;

/*El código implementa un WHERE sub-query para obtener el código y nombre del (de los) agente(s) con la comisión más alta*/

SELECT "AGENT_CODE", "AGENT_NAME", "COMMISSION"
FROM "AGENTS" A
WHERE "COMMISSION"=(
      SELECT MAX("COMMISSION")
      FROM "AGENTS"
      ORDER BY 1 DESC LIMIT 1)
ORDER BY 2;

/*El query genera una tabla que contiene el código de todos los clientes cuyo monto de orden promedio sea superior a US$1000 junto con dicho valor promedio (el valor promedio es dado con un formato que usa la coma para indicar miles y tienes dos cifras decimales), las filas están organizadas de menor a mayor valor promedio.*/

SELECT "CUST_CODE", printf('$%.2f', "ORD_AMOUNT") AS "AVG_AMOUNT"
FROM "ORDERS"
GROUP BY "CUST_CODE"
HAVING AVG("ORD_AMOUNT")>1000
ORDER BY 2;

/*Este query genera el código del cliente que tuvo en total mayor monto de orden, teniendo en cuenta todas las órdenes, junto con el monto total de dicho cliente*/

SELECT "CUST_CODE", SUM("ORD_AMOUNT") AS "TOTAL_AMOUNT"
FROM "ORDERS"
GROUP BY "CUST_CODE"
ORDER BY 2 DESC LIMIT 1;

/*Este query toma de la tabla ORDERS las columnas con el número de orden, el monto de la orden, la fecha de la orden, el código del cliente y el código del agente. La tabla resultado contiene solo los datos de las órdenes hechas en fechas diferentes a 2008-04-15, órdenes cuyo código de agente sea menor a A010 y cuyo monto sea menor a 1500*/

SELECT "ORD_NUM", "ORD_AMOUNT", "ORD_DATE", "CUST_CODE", "AGENT_CODE"
       FROM "ORDERS"
       WHERE ("ORD_DATE"!='2008-04-15' AND "ORDERS"."AGENT_CODE" < 'A010' AND "ORD_AMOUNT"<1500)
       ORDER BY 1;

--Este query crea una vista de los 5 agentes con mayor cantidad de ordernes realizadas


CREATE VIEW IF NOT EXISTS "BEST_AGENTS" AS
       SELECT A."AGENT_NAME" AS "AGENT NAME", COUNT("ORD_NUM") AS "ORDERS AMOUNT"
       FROM "AGENTS" A JOIN "ORDERS" O ON A."AGENT_CODE"=O."AGENT_CODE"
       GROUP BY A."AGENT_NAME"
       ORDER BY 2 DESC LIMIT 5;

