--Generamos clave surrogada y eliminamos duplicados --hay 7 duplicados, todos en el mismo partido
WITH src_game_details AS (

    SELECT *    
    FROM {{ source('__nba_games_data', 'game_details') }}
),

key_game_details AS (

    SELECT
        {{dbt_utils.generate_surrogate_key(['game_id','player_id'])}} AS game_details_id,
        _fivetran_id,
        game_id,
        fg3m,
        start_position,
        fg_pct,
        fgm,
        fta,
        {{convert_minute_errors('min')}} as min,
        ft_pct,
        plus_minus,
        stl,
        fga,
        team_city,
        team_abbreviation,
        reb,
        fg3a,
        comment,
        player_name,
        ast,
        pf,
        oreb,
        blk,
        pts,
        ftm,
        --nickname,
        dreb,
        team_id,
        fg3_pct,
        tos,
        player_id,
        _fivetran_deleted,
        _fivetran_synced

        FROM src_game_details
),

duplicados AS (
    SELECT
        _fivetran_id,
        game_details_id, 
        game_id,
        fg3m,
        start_position,
        fg_pct * 100 AS fg_pct,
        fgm,
        fta,
        min,
        ft_pct * 100 AS ft_pct,
        plus_minus,
        stl,
        fga,
        team_city,
        team_abbreviation,
        reb,
        fg3a,
        comment,
        player_name,
        ast,
        pf,
        oreb,
        blk,
        pts,
        ftm,
        --nickname AS first_name,
        dreb,
        team_id,
        fg3_pct * 100 AS fg3_pct,
        tos,
        player_id,
        _fivetran_deleted,
        _fivetran_synced,
        ROW_NUMBER() OVER (PARTITION BY game_details_id ORDER BY _fivetran_synced DESC) AS row_num

        FROM key_game_details

)

SELECT * FROM duplicados where row_num = 1 