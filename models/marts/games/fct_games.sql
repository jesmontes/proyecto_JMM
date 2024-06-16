WITH stg_games AS (
    SELECT * FROM {{ref('stg_nba_games_data__games')}}
),

    fct_games AS (

        SELECT 
                game_id
                ,game_date_est
                ,team_id_home
                ,team_id_away
                ,pts_home
                ,pts_away
                ,reb_home
                ,ast_home
                ,fg_pct_home 
                ,fg3_pct_home 
                ,ft_pct_home
                ,home_team_wins_id
                ,reb_away
                ,ast_away      
                ,fg_pct_away 
                ,fg3_pct_away 
                ,ft_pct_away
                ,season_id
                ,game_status
                ,game_type_id
                ,_fivetran_synced

            FROM stg_games

    )

SELECT * FROM fct_games