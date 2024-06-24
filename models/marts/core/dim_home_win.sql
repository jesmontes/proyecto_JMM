WITH stg_nba_games AS (

    SELECT * FROM {{ref('stg_nba_games_data__games')}}
),

dim_home_win AS (
    SELECT 
        DISTINCT home_team_wins_id,
        CASE
            WHEN home_team_wins_id = 1 THEN 'home team win'
            WHEN home_team_wins_id = 0 THEN 'visitor team win'
         END AS team_win
    FROM stg_nba_games
)

SELECT * FROM dim_home_win