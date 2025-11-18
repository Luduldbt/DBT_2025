{{ 
    config(materialized='ephemeral') 
}}

select * from {{ source("BIKE_DATA2","BIKE_TABLE2")}} where START_STATION_ID IS NOT NULL AND END_STATION_ID IS NOT NULL 