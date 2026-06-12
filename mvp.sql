-- Use a weighted index (e.g., 40% points, 30% rebounds/assists, 30% efficiency) to find an MVP for a given season.
WITH mvp_scores AS(SELECT
    player_name,
    season,
    pts, reb, ast,
    ROUND((0.4 * pts + 0.15 * reb + 0.15 * ast + 0.3 * ts_pct), 2) AS mvp_score,
    ROW_NUMBER() OVER(
    PARTITION BY season 
    ORDER BY (0.4 * pts + 0.15 * reb + 0.15 * ast + 0.3 * ts_pct) DESC) AS rn
FROM nba.all_seasons)
SELECT player_name, season, pts, reb, ast, mvp_score
FROM mvp_scores
WHERE rn = 1;