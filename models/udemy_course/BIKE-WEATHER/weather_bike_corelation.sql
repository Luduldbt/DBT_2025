{{
    config(
        materialized = 'table',
        query_tag = 'sbt_udemy_weather_bike_corelation'
     )
 }}


    select t.ride_id,t.trip_date,t.RIDE_DURATION_IN_SECONDS,t.START_STATION_ID,t.END_STATION_ID,t.MEMBER_CASUAL,
    w.weather,w.avg_temp,w.avg_clouds,w.avg_humidity, w.avg_pressure
    from {{ ref('Trip_Fact')}} t
    left join {{ ref('daily_weather')}} w
    on t.trip_date = w.start_date
    where w.start_date IS NOT NULL

