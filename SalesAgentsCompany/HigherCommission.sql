/*El código implementa un WHERE sub-query para obtener el código y nombre del (de los) agente(s) con la comisión más alta*/

SELECT "AGENT_CODE", "AGENT_NAME", "COMMISSION"
FROM "AGENTS" A
WHERE "COMMISSION"=(
      SELECT MAX("COMMISSION")
      FROM "AGENTS"
      ORDER BY 1 DESC LIMIT 1)
ORDER BY 2;
