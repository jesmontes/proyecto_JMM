{{ config(
    materialized='incremental',
    unique_key = 'game_details_id'
    ) 
    }}
WITH int_games__games_details AS (

        SELECT * FROM {{ref('int_games_game_details_grouped')}}
{% if is_incremental() %}

	  WHERE _fivetran_synced > (SELECT MAX(_fivetran_synced) FROM {{ this }} )

{% endif %}
),

    fct_games_details AS (

        SELECT 
            
            game_details_id,
            season_id, 
            game_id,
            game_type_id,
            game_date_est,
            team_id,
            player_id,
            min,
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

            FROM int_games__games_details
           

    )

SELECT * FROM fct_games_details