WITH stg_nba_games AS (

    SELECT  FROM {{ref('stg_nba_games_data__games')}}
),

home_win AS (
    SELECT 
        home_team_wins AS home_team_wins_id,
        CASE
            WHEN home_team_wins = 1 THEN 'home team win'
            WHEN home_team_wins = 0 THEN 'visitor team win'
         END AS team_win
    FROM stg_nba_games
)

SELECT * FROM home_win