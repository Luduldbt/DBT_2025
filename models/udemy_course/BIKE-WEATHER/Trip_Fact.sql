{{
    config(
        materialized='table',
        query_tag = 'udemy_dbt_trip_fact'
    )
}}

with trips as
(
    select ride_id,
    date(to_timestamp(started_at)) as trip_date,
    timediff(second,to_timestamp(started_at),to_timestamp(ended_at)) as ride_duration_in_seconds,
    start_station_id,
    end_station_id,
    MEMBER_CASUAL

    from {{ ref('BIKE2_not_null')}}
)
select * from trips