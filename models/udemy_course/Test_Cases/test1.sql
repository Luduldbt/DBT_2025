{{
    config(
        materialized='table'
    )
}}

select * from {{ source("BIKE_DATA","BIKE_TABLE")}}