{{
    config(
        materialized='table',
        query_tag = 'udemy_dbt_station_dimension'
    )
}}
with start_station as
(
    select distinct 
    --start_station_id,
    cast(start_station_id as int) as start_station_id,
    start_station_name,start_latitude,start_longitude
     from {{ ref('BIKE2_not_null')}}

),
end_station as
(
    select distinct 
    --end_station_id,
    cast(end_station_id as int) as end_station_id,
    end_station_name, end_latitude,end_longitude
    from  {{ ref('BIKE2_not_null')}}
),

union_cte as
(
select  * from  start_station 
union 
select * from end_station

)
select start_station_id as station_id, start_station_name as station_name ,
start_latitude as station_latitude,
start_longitude as station_longitude
from union_cte 
qualify row_number() over (partition by station_id  order by station_latitude asc) = 1
order by start_station_id asc