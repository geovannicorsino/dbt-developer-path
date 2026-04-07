{{ config(materialized='table') }}

with products as (

    select * from {{ ref('data_engineering', 'stg_ecommerce__products') }}

),

final as (

    select
        sku,
        product_name,
        product_type,
        product_price,
        product_description,
        product_type = 'jaffle'     as is_food_item,
        product_type = 'beverage'   as is_drink_item

    from products

)

select * from final
