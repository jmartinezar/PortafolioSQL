/*Este query crea una tabla con el código y el nombre de los agentes según la cantidad de órdenes que hayan realizado, organizados de mayor a menor cantidad de órdenes*/

SELECT A."AGENT_CODE", "AGENT_NAME", COUNT("ORD_NUM")
FROM "AGENTS" A, "ORDERS" O
WHERE A."AGENT_CODE"=O."AGENT_CODE"
GROUP BY 2, 1
ORDER BY 3 DESC;
