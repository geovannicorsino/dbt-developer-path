{{ config(materialized='table') }}

with products as (

    select * from {{ ref('data_engineering', 'stg_ecommerce__products') }}

),

supplies as (

    select * from {{ ref('data_engineering', 'stg_ecommerce__supplies') }}

),

supply_costs as (

    select
        sku,
        cast(sum(supply_cost) as int64) as total_supply_cost

    from supplies
    group by sku

),

final as (

    select
        products.sku,
        products.product_name,
        products.product_type,
        products.product_price,
        products.product_type = 'jaffle'    as is_food_item,
        products.product_type = 'beverage'  as is_drink_item,
        supply_costs.total_supply_cost,
        products.product_price - supply_costs.total_supply_cost as gross_margin_cents

    from products
    left join supply_costs using (sku)

)

select * from final
