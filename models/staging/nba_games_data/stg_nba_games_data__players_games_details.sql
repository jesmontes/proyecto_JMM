WITH base_games AS (
        SELECT * FROM {{ref('base_nba_games_data__games')}}
    ),

    base_games_details AS (
        SELECT * FROM {{ref('base_nba_games_data__games_details')}}
        
    ),
    players_2003_2022 AS (
   
        SELECT       
            {{dbt_utils.generate_surrogate_key(['a.player_id','a.player_name','a.team_id'])}} as surr_player_id
            --,a.player_id || a.player_name || a.team_id as surr_player_id2
            ,a.player_name  
            ,a.team_id                                                          
            ,a.player_id
            ,b.season
            ,MAX(a._fivetran_synced) AS  _fivetran_synced
            FROM base_games_details a
            JOIN base_games b
            ON a.game_id = b.game_id
            GROUP by all 
    )
    SELECT * FROM players_2003_2022 