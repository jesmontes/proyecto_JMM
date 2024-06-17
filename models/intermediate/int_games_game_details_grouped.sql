WITH stg_games AS (
        
        SELECT * FROM {{ref('stg_nba_games_data__games')}}
    ),

    stg_games_details AS (

        SELECT * FROM {{ref('stg_nba_games_data__games_details')}}
    ),

    joined AS (

        SELECT  
                a.game_id
                ,a.game_date_est
                ,a.team_id_home
                ,a.team_id_away
                ,a.pts_home
                ,a.pts_away
                ,a.reb_home
                ,a.ast_home
                ,a.fg_pct_home 
                ,a.fg3_pct_home 
                ,a.ft_pct_home
                ,a.home_team_wins_id
                ,a.reb_away
                ,a.ast_away      
                ,a.fg_pct_away 
                ,a.fg3_pct_away 
                ,a.ft_pct_away
                --,a.season
                ,a.season_id
                ,a.game_status
                ,a.game_type_id
                --,a.game_type
                --,a._fivetran_synced

                ,b.game_details_id
                --,b.game_id
                ,b.fg3m
                ,b.start_position
                ,b.fg_pct
                ,b.fgm
                ,b.fta
                ,b.min
                ,b.ft_pct
                ,b.plus_minus
                ,b.stl
                ,b.fga
                ,b.team_city
                ,b.team_abbreviation
                ,b.reb
                ,b.fg3a
                ,b.comment
                ,b.player_name
                ,b.ast
                ,b.pf
                ,b.oreb
                ,b.blk
                ,b.pts
                ,b.ftm
                ,b.first_name
                ,b.dreb
                ,b.team_id
                ,b.fg3_pct
                ,b.tos
                ,b.player_id
                ,b._fivetran_synced

                FROM stg_games a 
                JOIN stg_games_details b 
                ON a.game_id = b.game_id
    )

SELECT * FROM joined order by game_id