WITH base_ranking AS (
        SELECT * FROM {{ref('base_nba_games_data__ranking')}}
),

    final AS (
        SELECT 
               {{dbt_utils.generate_surrogate_key(['season','standingsdate','team_id'])}} AS ranking_id,
                standingsdate,
                {{dbt_utils.generate_surrogate_key(['season'])}} AS season_id,
                season,
                {{dbt_utils.generate_surrogate_key(['conference'])}} AS conference_id,
                conference,
                team_id,
                team,
                g,
                w,
                l,
                {{round_and_alias('w_pct',1)}},
                road_record,            
                home_record,
                _fivetran_synced

        FROM base_ranking
    )

    SELECT * FROM final
