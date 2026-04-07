{{ config(materialized='table') }}

with order_items as (

    select * from {{ ref('data_engineering', 'stg_ecommerce__order_items') }}

),

orders as (

    select * from {{ ref('data_engineering', 'stg_ecommerce__orders') }}

),

customers as (

    select * from {{ ref('data_engineering', 'stg_ecommerce__customers') }}

),

stores as (

    select * from {{ ref('data_engineering', 'stg_ecommerce__stores') }}

),

final as (

    select
        order_items.order_item_id,
        order_items.order_id,
        order_items.sku,
        orders.customer_id,
        orders.store_id,
        orders.order_total,
        orders.ordered_at

    from order_items
    left join orders    on orders.order_id        = order_items.order_id
    left join customers on customers.customer_id  = orders.customer_id
    left join stores    on stores.store_id         = orders.store_id

)

select * from final
