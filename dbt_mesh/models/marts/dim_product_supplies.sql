{{ config(materialized = 'table') }}

with products as (
    select * from {{ ref('raw_products') }}
),

supplies as (
    select * from {{ ref('raw_supplies') }}
),

supply_costs as (
    select
        sku,
        cast(sum(cost) as float64) as supply_cost
    from supplies
    group by sku
),

final as (
    select
        products.sku                            as product_id,
        products.name                           as product_name,
        products.type                           as product_type,
        products.description                    as product_description,
        cast(products.price as float64)         as product_price,
        products.type = 'jaffle'                as is_food_item,
        products.type = 'beverage'              as is_drink_item,
        supply_costs.supply_cost
    from products
    left join supply_costs using (sku)
)

select * from final