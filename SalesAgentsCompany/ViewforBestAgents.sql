--Este query crea una vista de los 5 agentes con mayor cantidad de ordernes realizadas


CREATE VIEW "BEST_AGENTS" AS
       (SELECT A."AGENT_NAME" AS "AGENT NAME", COUNT("ORD_NUM") AS "ORDERS AMOUNT"
       FROM "AGENTS" A JOIN "ORDERS" O ON A."AGENT_CODE"=O."AGENT_CODE"
       GROUP BY A."AGENT_NAME"
       ORDER BY 2 DESC LIMIT 5);
