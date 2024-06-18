WITH players_complete AS (

        SELECT * FROM {{ref('int_nba_games_data__players_complete')}}
),

    players_general AS (
        SELECT 
            {{dbt_utils.generate_surrogate_key(['player_id','player_name'])}} AS players_general_id,
            player_id,
            player_name,
            country,
            college,
            draft_year,
            draft_round,
            draft_number

        FROM players_complete
    )

SELECT * FROM players_general