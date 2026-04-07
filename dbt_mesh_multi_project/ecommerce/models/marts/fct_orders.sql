{{ config(materialized='table') }}

with orders as (

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
        orders.order_id,
        orders.customer_id,
        orders.store_id,
        customers.customer_name,
        stores.store_name,
        orders.subtotal,
        orders.tax_paid,
        orders.order_total,
        stores.tax_rate,
        orders.ordered_at

    from orders
    left join customers on customers.customer_id = orders.customer_id
    left join stores    on stores.store_id        = orders.store_id

)

select * from final
