WITH macro_date AS (
   {{ dbt_date.get_date_dimension("2003-01-01", "2030-12-31") }} 

),
    dim_date AS (
        SELECT
            DATE_DAY
            ,DAY_OF_WEEK
            ,DAY_OF_WEEK_NAME
            ,DAY_OF_MONTH
            ,DAY_OF_YEAR
            ,WEEK_OF_YEAR
            ,MONTH_NAME
            ,MONTH_OF_YEAR
            ,MONTH_END_DATE
            ,QUARTER_OF_YEAR
            ,YEAR_NUMBER
 
        FROM macro_date
    )

SELECT * FROM dim_date