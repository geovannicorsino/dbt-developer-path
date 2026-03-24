
{{ config(materialized='view') }}

SELECT 
    id as customer_id,
    first_name,
    last_name,
    
FROM `geovanni-corsino-labs.jaffle_shop.customers`
