--Query inicial, busca en principio generar una tabla de posiciones estándar

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


-- Query que genera una tabla con los equipos de la liga con id 1 que hayan jugado la temporada 2008/2009, para cada equipo muestra los partidos jugados, la cantidad de partidos ganados, empatados y perdidos, los goles anotados, recibidos y la diferencia de gol.

DROP TABLE IF EXISTS [Tabla de posiciones];

CREATE TABLE IF NOT EXISTS [Tabla de posiciones] AS
SELECT L.TEAM_API_ID AS "TEAM ID", 
		SUM(L.PartidosPerdidos+V.PartidosPerdidos+L.PartidosEmpatados+V.PartidosEmpatados+L.PartidosGanados+V.PartidosGanados) AS PJ,
		SUM(L.PartidosPerdidos+V.PartidosPerdidos) AS PP,
		SUM(L.PartidosEmpatados+V.PartidosEmpatados) AS PE,
		SUM(L.PartidosGanados+V.PartidosGanados) AS PG,
		SUM(L.GolesAFavor+V.GolesAFavor) AS GF,
		SUM(L.GolesEnContra+V.GolesEnContra) AS GC,
		SUM(L.GolesAFavor+V.GolesAFavor-L.GolesEnContra-V.GolesEnContra) AS DG,
		SUM(L.PartidosGanados+V.PartidosGanados+L.PartidosGanados+V.PartidosGanados+L.PartidosGanados+V.PartidosGanados+L.PartidosEmpatados+V.PartidosEmpatados) AS PTS
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
ORDER BY 9 DESC;

SELECT * FROM [Tabla de posiciones];
