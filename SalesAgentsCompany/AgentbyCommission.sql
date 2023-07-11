/*El presente query usa where para aplicar dos condiciones al mismo dato y ordena alfabéticamente según el nombre*/

SELECT "AGENT_CODE", "AGENT_NAME", "WORKING_AREA", "COMMISSION"
FROM "AGENTS"
WHERE ("COMMISSION" >= 0.12 AND "COMMISSION" < 0.14)
ORDER BY 2;
