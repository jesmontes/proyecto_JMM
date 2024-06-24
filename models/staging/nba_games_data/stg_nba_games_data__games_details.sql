WITH base_games_details AS (
        SELECT * FROM {{ref('base_nba_games_data__games_details')}}
),

    games_details_casted AS (
        SELECT
            _fivetran_id,
            game_details_id, 
            game_id,
            {{round_and_alias('fg3m')}},
            start_position,
            {{round_and_alias('fg_pct',1)}},
            {{round_and_alias('fgm')}},
            {{round_and_alias('fta')}},
            min,
            {{round_and_alias('ft_pct',1)}},
            {{round_and_alias('plus_minus')}},
            {{round_and_alias('stl')}},
            {{round_and_alias('fga')}},
            team_city,
            team_abbreviation,
            {{round_and_alias('reb')}},
            {{round_and_alias('fg3a')}},
            comment,
            player_name,
            {{round_and_alias('ast')}},
            {{round_and_alias('pf')}},
            {{round_and_alias('oreb')}},
            {{round_and_alias('blk')}},
            {{round_and_alias('pts')}},
            {{round_and_alias('ftm')}},
            --first_name,
            {{round_and_alias('dreb')}},
            team_id,
            {{round_and_alias('fg3_pct',1)}},
            {{round_and_alias('tos')}},
            player_id,
            _fivetran_deleted,
            _fivetran_synced

        FROM base_games_details

    )

SELECT * FROM games_details_casted