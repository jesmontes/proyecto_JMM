WITH src_players_hasta_2019 AS (
    SELECT * 
    FROM {{ source('nba_games_data', 'players') }}
    ),

player_season_corregida AS (

SELECT  player_name,
        team_id,
        player_id,
        --añado año que acaba para poder luego combinar con la otra
        CONCAT(season, '-', ROUND(CAST(SUBSTRING(season, 3, 2) + 1 AS VARCHAR), 0)) AS season 
                
     FROM src_players
)
SELECT * FROM player_season_corregida