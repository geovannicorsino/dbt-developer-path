{{ config(materialized='table') }}

with customers as (

    select * from {{ ref('data_engineering', 'stg_ecommerce__customers') }}

),

orders as (

    select * from {{ ref('data_engineering', 'stg_ecommerce__orders') }}

),

order_metrics as (

    select
        customer_id,
        count(order_id)         as total_orders,
        sum(order_total)        as lifetime_value,
        min(ordered_at)         as first_order_at,
        max(ordered_at)         as most_recent_order_at

    from orders
    group by customer_id

),

final as (

    select
        customers.customer_id,
        customers.customer_name,
        coalesce(order_metrics.total_orders, 0)     as total_orders,
        coalesce(order_metrics.lifetime_value, 0)   as lifetime_value,
        order_metrics.first_order_at,
        order_metrics.most_recent_order_at

    from customers
    left join order_metrics using (customer_id)

)

select * from final
