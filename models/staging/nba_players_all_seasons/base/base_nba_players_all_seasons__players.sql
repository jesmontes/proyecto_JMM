WITH src_players_all_seasons AS (
    SELECT * 
    FROM {{ source('nba_players_all_seasons', 'players') }}
    )
SELECT * FROM src_players_all_seasons