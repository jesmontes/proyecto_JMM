WITH stg_players_games AS (

        SELECT * FROM {{ref('stg_nba_games_data__players_games_details')}}
    ),

    base_players_all_seasons AS (
        
        SELECT * FROM {{ref('stg_nba_players_all_seasons__players')}}
    ),

joined AS (

    SELECT 
        a.player_id
        ,a.player_name
        ,a.season
        ,a.season_id
        ,a.team_id
        ,COALESCE (b.age,0) AS age
        ,COALESCE(b.player_height_cm,0) AS player_height_cm
        ,COALESCE(b.player_weight_kg,0) AS player_weight_kg
        ,COALESCE(b.country,'Unknown') AS country
        ,COALESCE(b.college,'Unknown') AS college
        ,COALESCE(b.draft_year,'Unknown') AS draft_year
        ,COALESCE(b.draft_round,'Unknown') AS draft_round
        ,COALESCE(b.draft_number,'Unknown') AS draft_number
        ,a._fivetran_synced  
    FROM stg_players_games a
    LEFT JOIN base_players_all_seasons b
    ON a.player_name = b.player_name AND a.season=b.season

)
SELECT * FROM joined