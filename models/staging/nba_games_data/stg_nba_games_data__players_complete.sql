WITH base_players_games AS (
        SELECT * FROM {{ref('stg_nba_games_data__players')}}
    ),

    base_players_all_seasons AS (
        SELECT * FROM {{ref('base_nba_players_all_seasons__players')}}
    ),

joined AS (

    SELECT 
        a.player_id
        ,a.player_name
        ,a.season
        ,a.team_id
        ,b.age
        ,b.player_height_cm
        ,b.player_weight_kg
        ,b.country
        ,b.college
        ,b.draft_year
        ,b.draft_round
        ,b.draft_number  
    FROM base_players_games a
    JOIN base_players_all_seasons b
    ON a.player_name = b.player_name AND a.season=b.season

)
SELECT * FROM joined