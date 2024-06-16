WITH ranking AS (
    SELECT * FROM {{ref('stg_nba_games_data__playoff_init')}}
) ,
games AS (
    SELECT * FROM {{ref('base_nba_games_data__games')}}
),

playoff AS (
    SELECT
        a.game_id
        ,a.game_date_est
        ,a.team_id_home
        ,a.team_id_away
        ,a.pts_home
        ,a.pts_away
        ,a.reb_home
        ,a.ast_home
        ,a.fg_pct_home 
        ,a.fg3_pct_home 
        ,a.ft_pct_home
        ,a.home_team_wins_id
        ,a.reb_away
        ,a.ast_away      
        ,a.fg_pct_away 
        ,a.fg3_pct_away 
        ,a.ft_pct_away
        ,a.season
        ,a.season_id
        ,a.game_status
        ,CASE WHEN a.season = b.season AND a.game_date_est >= b.playoff_init THEN 'Playoff'
            ELSE 'Regular Season'
            END AS game_type
        ,_fivetran_synced
        FROM games a    
        JOIN ranking b 
        ON a.season = b.season
)
SELECT * FROM playoff 