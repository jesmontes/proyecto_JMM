 {% macro init_playoff_date_complicated() %}

 WITH base_ranking AS (

        SELECT * FROM {{ref('base_nba_games_data__ranking')}}
 ),
 
 
 playoff_82 AS (  SELECT  
                season,
                MIN(standingsdate) AS playoff_init,
                MIN(g) AS g
                FROM base_ranking
                where standingsdate > '2004-01-01' AND  season_id LIKE '2%' AND g=82               
                group by all
                 order by 1
                 ),
    playoff_lockout AS (
     SELECT  
                season,
                MIN(standingsdate) AS playoff_init,
                MIN(g) AS g
                FROM base_ranking
                where season_id = 22011 AND g=66               
                group by all
                 order by 1
    ),

    playoff_covid AS (
     SELECT  
                season,
                MIN(standingsdate) AS playoff_init,
                MIN(g) AS g
                FROM base_ranking
                where (season_id = 22020 AND g=72) OR (season_id = 22019 AND g=75)               
                group by all
                 order by 1
                ),
    union_all AS (
        SELECT * FROM playoff_82
        UNION ALL
        SELECT * FROM playoff_lockout
        UNION ALL 
        SELECT * FROM playoff_covid
    
    )

    SELECT * FROM union_all 

{% endmacro %}
