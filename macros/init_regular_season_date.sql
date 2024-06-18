{% macro init_regular_season_date() %}

WITH src_games AS (
        SELECT * FROM {{source('__nba_games_data','games')}}
    ),

        start_reg_season AS (
                SELECT 
                        season,
                        MIN(game_date_est) AS reg_season_init     
                        FROM src_games where game_id like '2%' 
                        group by season
                        order by season
            ),

        season_casted AS (
            SELECT 
                {{concat_season('season')}},
                reg_season_init
                FROM start_reg_season
        )

SELECT * FROM season_casted

{% endmacro %}
