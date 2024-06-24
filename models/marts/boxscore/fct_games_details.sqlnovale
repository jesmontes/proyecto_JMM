WITH stg_games_details AS (

        SELECT * FROM {{ref('stg_nba_games_data__games_details')}}
),

    stg_games_date AS (

        SELECT  game_id,
                game_date_est            
            FROM {{ref('stg_nba_games_data__games')}}      

    ),

    fct_games_details AS (

        SELECT 
            a._fivetran_id,
            a.game_details_id, 
            a.game_id,
            b.game_date_est,
            a.team_id,
            a.player_id,
            a.min,
            a.pts,
            a.reb,
            a.ast,
            a.stl,
            a.blk,
            a.fgm,
            a.fga,
            a.fg_pct,
            a.fg3m,
            a.fg3a,           
            a.fg3_pct,
            a.ftm,
            a.fta,
            a.ft_pct,
            a.oreb,
            a.dreb,
            a.tos,
            a.pf,
            a.plus_minus,
            a._fivetran_deleted,
            a._fivetran_synced

            FROM stg_games_details a 
            LEFT JOIN stg_games_date b 
            ON a.game_id = b.game_id

    )

SELECT * FROM fct_games_details