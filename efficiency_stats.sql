-- Compare efficiency stats (TS% vs usage%) - do volume scorers sacrifice efficiency?

WITH season_max AS (
SELECT season, MAX(pts) AS max_pts
FROM nba.all_seasons
GROUP BY season)
SELECT a.season,
MAX(CASE 
WHEN a.pts = s.max_pts THEN a.player_name
END) AS scoring_leader,
MAX(CASE 
WHEN a.pts = s.max_pts THEN a.team_abbreviation
END) AS team, s.max_pts, 
ROUND(MAX(CASE 
WHEN a.pts = s.max_pts THEN a.usg_pct
END)*100,1) AS usg_pct, 
ROUND(MAX(CASE 
WHEN a.pts = s.max_pts THEN a.ts_pct
END)*100,1) AS ts_pct
FROM nba.all_seasons a
JOIN season_max s
ON a.season = s.season
GROUP BY a.season;