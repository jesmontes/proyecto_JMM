WITH stg_players_complete AS (
        SELECT * FROM {{ref('stg_nba_games_data__players_complete')}}
),

dim_players AS (
    SELECT 
        player_id
        ,player_name
        ,season
        ,season_id
        ,team_id
        ,age
        ,player_height_cm
        ,player_weight_kg
        ,country
        ,college
        ,draft_year
        ,draft_round
        ,draft_number
       
       FROM stg_players_complete
)

SELECT * FROM dim_players