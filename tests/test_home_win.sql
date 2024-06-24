SELECT *
FROM {{ source('__nba_games_data', 'games') }}
WHERE (pts_away > pts_home AND home_team_wins = 1)
   OR (pts_home > pts_away AND home_team_wins = 0)



