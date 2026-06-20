with source as (

    select *
    from {{ source('ecommerce_raw', 'RAW_PRODUCTS') }}

),

renamed as (

    select
        product_id::number as product_id,
        product_name,
        category,
        price::number(10,2) as price,
        created_at::date as created_at
    from source

)

select *
from renamed