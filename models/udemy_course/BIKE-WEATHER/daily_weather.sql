{{
    config(
        materialized='table',
        query_tag = 'DBT UDEMY = DAILY_WEATHER'
    )
}}


WITH weather_aggregate AS
(
        Select DATE(TIME)  as start_date,
        WEATHER,
        COUNT(*) AS total_count,
        ROUND(AVG(TEMP),2) as avg_temp,
        ROUND(AVG(CLOUDS),2) as avg_clouds,
        ROUND(AVG(HUMIDITY),2) as avg_humidity,
        ROUND(AVG(PRESSURE),2) as avg_pressure

        FROM {{ source("WEATHER_DATA","WEATHERTABLE_B")}}
        GROUP BY DATE(TIME),WEATHER
)
select 
start_date,
WEATHER,
avg_temp,
avg_clouds,
avg_humidity,
avg_pressure
from weather_aggregate 
qualify row_number() over (partition by start_date order by  total_count desc) = 1

ORDER BY start_date DESC

