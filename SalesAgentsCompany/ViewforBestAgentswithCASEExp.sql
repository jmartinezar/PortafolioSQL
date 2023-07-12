/*Se genera una tabla con el nombre de los 5 agentes con mayores ventas y se agrega además una etiqueta que clasifica la cantidad de ventas en LOW, MED y HIGH*/

CREATE VIEW "BEST_AGENTS" AS
       (SELECT A."AGENT_NAME" AS "AGENT NAME", COUNT("ORD_NUM") AS "ORDERS AMOUNT", CASE WHEN COUNT("ORD_NUM")<4 THEN 'LOW'
       	 WHEN COUNT("ORD_NUM")<7 THEN 'MED'
	 ELSE 'HIGH'
	 END AS "AMOUNT"
       FROM "AGENTS" A JOIN "ORDERS" O ON A."AGENT_CODE"=O."AGENT_CODE"
       GROUP BY A."AGENT_NAME"
       ORDER BY 2 DESC LIMIT 5);
