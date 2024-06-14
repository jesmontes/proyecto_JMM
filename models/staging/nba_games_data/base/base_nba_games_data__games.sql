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
        game_status_text,
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
        season,
        team_id_away,
        team_id_home,
        home_team_wins,
        visitor_team_id,
        _fivetran_deleted,
        _fivetran_synced,
        ROW_NUMBER() OVER (PARTITION BY game_id ORDER BY game_date_est ) AS row_num
        FROM src_games 
        
)
SELECT * FROM game_id_duplicados where row_num = 1