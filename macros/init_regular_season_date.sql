{% macro init_regular_season_date() %}

WITH base_games AS (

        SELECT * FROM {{ref('base_nba_games_data__games')}}
    ),

    start_reg_season AS (
            SELECT 
                season,
                MIN(game_date_est) AS reg_season_init 

                FROM base_games where game_id like '2%' 
                group by season
                order by season
        )

SELECT * FROM start_reg_season

{% endmacro %}
