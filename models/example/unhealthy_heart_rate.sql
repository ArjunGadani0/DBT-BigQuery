{{ config(materialized='table', tags=['watch_data']) }}

with HeartRateCte as (
    SELECT * 
    FROM `playground-s-11-498e6593.myDataset.watch_data`
    where AvgHeartRate > 90
)
SELECT * FROM HeartRateCte