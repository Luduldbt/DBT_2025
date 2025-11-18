{{
    config(
        materialized='table',
        query_tag = 'DBT UDEMY date dimension'
    )
}}
with CTE1 AS
(
        Select 
        to_timestamp(STARTED_AT) as STARTED_AT,
        DATE(to_timestamp(STARTED_AT))  AS DATE_STARTED_AT,
        HOUR(to_timestamp(STARTED_AT)) AS HOUR_STARTED_AT,
        MONTH(to_timestamp(STARTED_AT)) AS Month_STARTED_AT
        
        from {{ ref('BIKE2_not_null')}}
       

),
CTE2 as
(

    select *, 

    {{ get_day("DATE_STARTED_AT") }} AS DAY_TYPE,

     {{ get_season("DATE_STARTED_AT" ) }} AS STATION_OF_YEAR 
     
     FROM CTE1
)

SELECT * FROM CTE2

