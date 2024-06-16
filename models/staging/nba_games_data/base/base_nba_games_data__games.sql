--En base elimino los registros duplicados ( vienen por redondeo de porcentajes)
--porcentajes en formato 35,23%
WITH src_games AS (
    SELECT * FROM {{source('__nba_games_data','games')}}
),

game_id_duplicados AS (

    SELECT 
        _fivetran_id,
        home_team_id,
        pts_away,
        reb_away,
        CASE
            WHEN pts_away IS NULL or pts_home IS NULL THEN 'Game not played'
            ELSE game_status_text
            END AS game_status,
        reb_home,
        game_date_est,
        ast_home,
        game_id,
        pts_home,
        fg_pct_away * 100 AS fg_pct_away,
        fg3_pct_away * 100 AS fg3_pct_away,
        fg_pct_home * 100 AS fg_pct_home,
        fg3_pct_home * 100 AS fg3_pct_home,
        ft_pct_home * 100 AS ft_pct_home,
        ast_away,
        ft_pct_away * 100 AS ft_pct_away,
        {{concat_season('season')}},
        team_id_away,
        team_id_home,
        home_team_wins as home_team_wins_id,
        visitor_team_id,
        _fivetran_deleted,
        _fivetran_synced,
        ROW_NUMBER() OVER (PARTITION BY game_id ORDER BY game_date_est ) AS row_num
        FROM src_games 
        
),

row_num AS(

    SELECT * FROM game_id_duplicados where row_num = 1 
),
casted as (

    select
        game_id
        ,game_date_est
        ,team_id_home
        ,team_id_away
        ,{{round_and_alias('pts_home')}}
        ,{{round_and_alias('pts_away')}}
        ,{{round_and_alias('reb_home')}}
        ,{{round_and_alias('ast_home')}}
        ,{{round_and_alias('fg_pct_home',1)}} 
        ,{{round_and_alias('fg3_pct_home',1)}} 
        ,{{round_and_alias('ft_pct_home',1)}} 
        ,home_team_wins_id
        ,{{round_and_alias('reb_away')}}
        ,{{round_and_alias('ast_away')}}       
        ,{{round_and_alias('fg_pct_away',1)}} 
        ,{{round_and_alias('fg3_pct_away',1)}} 
        ,{{round_and_alias('ft_pct_away',1)}} 
        ,season
        ,game_status
        ,_fivetran_synced

    from row_num
)

SELECT * FROM casted