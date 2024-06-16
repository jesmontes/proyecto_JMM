WITH stg_games_details AS (
        SELECT * FROM {{ref('stg_nba_games_data__games_details')}}
),

    fct_games_details AS (

        SELECT 
            game_details_id, 
            game_id,
            team_id,
            player_id,
            min
            pts,
            reb,
            ast,
            stl,
            blk,
            fgm,
            fga,
            fg_pct,
            fg3m,
            fg3a,           
            fg3_pct,
            ftm,
            fta,
            ft_pct,
            oreb,
            dreb,
            tos,
            pf,
            plus_minus,
            _fivetran_synced

    )

SELECT * FROM fct_games_details