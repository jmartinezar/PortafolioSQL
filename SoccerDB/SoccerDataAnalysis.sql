/*--Query inicial, busca en principio generar una tabla de posiciones estándar

SELECT TEAM_API_ID, CASE 
					WHEN HOME_TEAM_GOAL > AWAY_TEAM_GOAL THEN 'W' 
					WHEN HOME_TEAM_GOAL = AWAY_TEAM_GOAL THEN 'D' 
					WHEN HOME_TEAM_GOAL < AWAY_TEAM_GOAL THEN 'L' END AS "RESULT"
FROM TEAM T JOIN MATCH M ON (TEAM_API_ID = HOME_TEAM_API_ID)
WHERE LEAGUE_ID = 1
GROUP BY 1
ORDER BY 2 DESC;

--Query que cuente los partidos ganados ganados, empatados y perdidos en condición de local por cada equipo

SELECT TEAM_API_ID, COUNT(CASE WHEN home_team_goal < away_team_goal THEN 1 END) AS PartidosPerdidos,
       COUNT(CASE WHEN home_team_goal = away_team_goal THEN 1 END) AS PartidosEmpatados,
       COUNT(CASE WHEN home_team_goal > away_team_goal THEN 1 END) AS PartidosGanados
FROM TEAM T JOIN MATCH M ON (T.TEAM_API_ID = M.HOME_TEAM_API_ID)
WHERE LEAGUE_ID = 1
GROUP BY 1;

--Query que cuente los partidos ganados ganados, empatados y perdidos en condición de visitante por cada equipo

SELECT TEAM_API_ID, COUNT(CASE WHEN home_team_goal < away_team_goal THEN 1 END) AS PartidosPerdidos,
       COUNT(CASE WHEN home_team_goal = away_team_goal THEN 1 END) AS PartidosEmpatados,
       COUNT(CASE WHEN home_team_goal > away_team_goal THEN 1 END) AS PartidosGanados
FROM TEAM T JOIN MATCH M ON (T.TEAM_API_ID = M.AWAY_TEAM_API_ID)
WHERE LEAGUE_ID = 1
GROUP BY 1;
*/

-- Query que genera una tabla con los equipos de la liga con id 1 que hayan jugado la temporada 2008/2009, para cada equipo muestra la cantidad de partidos ganados, empatados y perdidos

DROP VIEW IF EXISTS "Tabla de posiciones";

CREATE VIEW IF NOT EXISTS "Tabla de posiciones" AS
SELECT L.TEAM_API_ID AS "TEAM ID", 
		SUM(L.PartidosPerdidos+V.PartidosPerdidos) AS "MATCHES LOSE",
		SUM(L.PartidosEmpatados+V.PartidosEmpatados) AS "MATCHES DRAW",
		SUM(L.PartidosGanados+V.PartidosGanados) AS "MATCHES WIN",
		SUM(L.GolesAFavor+V.GolesAFavor) AS GF,
		SUM(L.GolesEnContra+V.GolesEnContra) AS GC
FROM (SELECT TEAM_API_ID, COUNT(CASE WHEN home_team_goal < away_team_goal THEN 1 END) AS PartidosPerdidos,
       COUNT(CASE WHEN home_team_goal = away_team_goal THEN 1 END) AS PartidosEmpatados,
       COUNT(CASE WHEN home_team_goal > away_team_goal THEN 1 END) AS PartidosGanados,
	   COUNT(CASE WHEN HOME_TEAM_GOAL > 0 THEN HOME_TEAM_GOAL END) AS GolesAFavor,
	   COUNT(CASE WHEN AWAY_TEAM_GOAL > 0 THEN AWAY_TEAM_GOAL END) AS GolesEnContra
		FROM TEAM T JOIN MATCH M ON (T.TEAM_API_ID = M.HOME_TEAM_API_ID)
		WHERE LEAGUE_ID = 1 AND SEASON = '2008/2009'
		GROUP BY 1) L 
	JOIN
		(SELECT TEAM_API_ID, COUNT(CASE WHEN home_team_goal < away_team_goal THEN 1 END) AS PartidosPerdidos,
       COUNT(CASE WHEN home_team_goal = away_team_goal THEN 1 END) AS PartidosEmpatados,
       COUNT(CASE WHEN home_team_goal > away_team_goal THEN 1 END) AS PartidosGanados,
	   COUNT(CASE WHEN AWAY_TEAM_GOAL > 0 THEN AWAY_TEAM_GOAL END) AS GolesAFavor,
	   COUNT(CASE WHEN HOME_TEAM_GOAL > 0 THEN HOME_TEAM_GOAL END) AS GolesEnContra
		FROM TEAM T JOIN MATCH M ON (T.TEAM_API_ID = M.AWAY_TEAM_API_ID)
		WHERE LEAGUE_ID = 1 AND SEASON = '2008/2009'
	GROUP BY 1) V ON L.TEAM_API_ID = V.TEAM_API_ID
GROUP BY 1
ORDER BY 4 DESC;

ALTER VIEW "Tabla de posiciones" ADD COLUMN "Partidos jugados" INT;

UPDATE "Tabla de posiciones" SET "Partidos jugados"= "MATCHES LOSE"+"MATCHES DRAW"+"MATCHES WIN";

SELECT * FROM "Tabla de posiciones";