WITH int_players_complete AS (
        SELECT * FROM {{ref('int_nba_games_data__players_complete')}}
),


dim_players AS (
    SELECT 
        {{dbt_utils.generate_surrogate_key(['player_id','player_name'])}} AS players_general_id
        ,player_id
        ,season_id
        ,team_id
        ,age
        ,player_height_cm
        ,player_weight_kg
       
       FROM int_players_complete 
)

SELECT * FROM dim_players