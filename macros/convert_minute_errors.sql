WITH raw_data AS (
    SELECT
        duracion
    FROM {{ ref('your_source_table') }}
),

cleaned_data AS (
    SELECT
        duracion,
        CASE
            -- Convert '0.000000:38' to '0:38'
            WHEN duracion LIKE '0.000000:%' THEN
                '0:' || SPLIT_PART(duracion, ':', 2)
            
            -- Convert '-8' to '8:00'
            WHEN duracion LIKE '-%' THEN
                LTRIM(duracion, '-') || ':00'
            
            -- Convert '0' to '0:00'
            WHEN duracion = '0' THEN
                '0:00'
            
            -- Keep correct format as is
            ELSE
                duracion
        END AS cleaned_duracion
    FROM raw_data
),

converted_data AS (
    SELECT
        cleaned_duracion,
        CAST(SPLIT_PART(cleaned_duracion, ':', 1) AS INT) * 60 +
        CAST(SPLIT_PART(cleaned_duracion, ':', 2) AS INT) AS total_segundos,
        CAST(
            LPAD(SPLIT_PART(cleaned_duracion, ':', 1), 2, '0') || ':' ||
            LPAD(SPLIT_PART(cleaned_duracion, ':', 2), 2, '0') || ':00'
        AS TIME) AS duracion_time
    FROM cleaned_data
)

SELECT *
FROM converted_data;
