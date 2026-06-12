-- Rank players in each season by points, rebounds, assists per game.

WITH season_max AS (
SELECT season, MAX(pts) AS max_pts, MAX(reb) AS max_reb,  MAX(ast) AS max_ast
FROM nba.all_seasons
GROUP BY season)
SELECT a.season,
MAX(CASE 
WHEN a.pts = s.max_pts THEN a.player_name
END) AS scoring_leader, 
MAX(CASE 
WHEN a.pts = s.max_pts THEN a.team_abbreviation
END) AS sl_team, s.max_pts,
MAX(CASE 
WHEN a.reb = s.max_reb THEN a.player_name 
END) AS rebound_leader, 
MAX(CASE 
WHEN a.reb = s.max_reb THEN a.team_abbreviation
END) AS rl_team, s.max_reb,
MAX(CASE 
WHEN a.ast = s.max_ast THEN a.player_name 
END) AS playmaking_leader, 
MAX(CASE 
WHEN a.ast = s.max_ast THEN a.team_abbreviation 
END) AS pl_team, s.max_ast
FROM nba.all_seasons a
JOIN season_max s
ON a.season = s.season
GROUP BY a.season;