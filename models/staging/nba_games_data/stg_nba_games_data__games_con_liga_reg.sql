WITH reg_season_init AS (

    {{init_regular_season_date()}}
), 

playoff_init AS (
    {{init_playoff_date()}}
) ,

init_date AS (
    select 
        a.season,
        a.reg_season_init,
        b.playoff_init
     from reg_season_init a
    JOIN playoff_init b
    ON a.season = b.season
),


games AS (
    SELECT * FROM {{ref('base_nba_games_data__games')}}
),

playoff AS (
    SELECT
        _fivetran_id
        ,a.game_id
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
        ,CASE   WHEN a.season = b.season AND a.game_date_est >= b.playoff_init THEN 'Playoff'
                WHEN a.season = b.season AND a.game_date_est BETWEEN b.reg_season_init AND b.playoff_init THEN 'Regular Season'
            ELSE 'Preseason'
            END AS game_type
        ,_fivetran_deleted
        ,_fivetran_synced
        FROM games a    
        LEFT JOIN init_date b 
        ON a.season = b.season
) 
,

id_game_type AS (

        SELECT  
                _fivetran_id
                ,game_id
                ,game_date_est
                ,team_id_home
                ,team_id_away
                ,pts_home
                ,pts_away
                ,reb_home
                ,ast_home
                ,fg_pct_home 
                ,fg3_pct_home 
                ,ft_pct_home
                ,home_team_wins_id
                ,reb_away
                ,ast_away      
                ,fg_pct_away 
                ,fg3_pct_away 
                ,ft_pct_away
                ,season
                ,season_id
                ,game_status
                ,{{dbt_utils.generate_surrogate_key(['game_type'])}} AS game_type_id
                ,game_type
                ,_fivetran_deleted
                ,_fivetran_synced
                FROM playoff
)
SELECT * FROM id_game_type  