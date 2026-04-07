{{ config(materialized='table') }}

with order_items as (

    select * from {{ ref('data_engineering', 'stg_ecommerce__order_items') }}

),

orders as (

    select * from {{ ref('data_engineering', 'stg_ecommerce__orders') }}

),

products as (

    select * from {{ ref('data_engineering', 'stg_ecommerce__products') }}

),

items_with_orders as (

    select
        order_items.sku,
        orders.order_id,
        orders.order_total

    from order_items
    left join orders on orders.order_id = order_items.order_id

),

revenue_by_product as (

    select
        sku,
        count(*)                                as total_units_sold,
        sum(order_total)                        as total_revenue,
        cast(avg(order_total) as float64)       as avg_order_value

    from items_with_orders
    group by sku

),

final as (

    select
        products.sku,
        products.product_name,
        products.product_type,
        coalesce(revenue_by_product.total_units_sold, 0)    as total_units_sold,
        coalesce(revenue_by_product.total_revenue, 0)       as total_revenue,
        revenue_by_product.avg_order_value

    from products
    left join revenue_by_product using (sku)

)

select * from final
