{{ config(materialized='table') }}

with HeartRateCte as (
    SELECT * 
    FROM `playground-s-11-047fc222.myDataset.watch_data`
    where AvgHeartRate < 90
)
SELECT * FROM HeartRateCte