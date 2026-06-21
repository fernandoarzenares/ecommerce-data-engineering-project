with source as (

    select *
    from {{ source('ecommerce_raw', 'RAW_PAYMENTS') }}

),

renamed as (

    select
        payment_id::number as payment_id,
        order_id::number as order_id,
        payment_method,
        amount::number(10,2) as amount,
        payment_date::date as payment_date
    from source

)

select *
from renamed