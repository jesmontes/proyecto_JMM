WITH conference AS (
    SELECT COUNT(DISTINCT(conference)) as conference_count 

    FROM {{ref('stg_nba_games_data__teams')}}
)

SELECT conference_count
FROM conference 
where conference_count != 2