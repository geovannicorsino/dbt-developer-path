with source as (

    select * from {{ ref('raw_supplies') }}

),

renamed as (

    select
        id                                              as supply_id,
        name                                            as supply_name,
        cast(cost as int64)                             as supply_cost,
        case when lower(perishable) = 'true'
            then true
            else false
        end                                             as is_perishable,
        sku

    from source

)

select * from renamed
