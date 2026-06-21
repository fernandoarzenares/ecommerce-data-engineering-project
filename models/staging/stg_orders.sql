with source as (

    select *
    from {{ source('ecommerce_raw', 'RAW_ORDERS') }}

),

renamed as (

    select
        order_id::number as order_id,
        customer_id::number as customer_id,
        order_date::date as order_date,
        status
    from source

)

select *
from renamed