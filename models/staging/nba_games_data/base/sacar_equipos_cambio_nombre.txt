WITH 
equipos AS(
SELECT  team_id,
        team_abbreviation,
FROM {{ source('__nba_games_data', 'game_details') }}
GROUP BY team_abbreviation,1 order by 1
),
conteo_equipos_cambios AS (

    SELECT
        team_id,
        COUNT(*) AS count
    FROM
        equipos
    GROUP BY
        team_id
    HAVING
        COUNT(*) > 1
    )
SELECT a.team_id,
       b.team_abbreviation
       FROM conteo_equipos_cambios a
       JOIN {{ source('__nba_games_data', 'game_details') }} b
       ON a.team_id = b.team_id
       GROUP BY 2,1
       order by 1