with source as (

    select *
    from {{ source('ecommerce_raw', 'RAW_CUSTOMERS') }}

),

renamed as (

    select
        customer_id::number as customer_id,
        customer_name,
        email,
        city,
        state,
        created_at::date as created_at
    from source

)

select *
from renamed