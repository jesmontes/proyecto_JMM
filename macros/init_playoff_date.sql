 {% macro init_playoff_date() %}

WITH src_games AS (
    SELECT * FROM {{ref('base_nba_games_data__games')}}
),
    init_playoff AS (
       
        SELECT  
                season,
                --game_id,
                min(game_date_est) as playoff_init
                FROM src_games
                where game_id like '4%'
                group by all
                order by season
        )
SELECT * FROM init_playoff

{% endmacro %}
