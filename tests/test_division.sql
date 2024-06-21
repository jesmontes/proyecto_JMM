WITH division AS (
    SELECT COUNT(DISTINCT(division)) as division_count 

    FROM {{ref('stg_nba_games_data__teams')}}
)

SELECT division_count
FROM division 
where division_count != 6