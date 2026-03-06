with customers as (
    select * from {{ ref('stg_customer') }}
),

final_dim as (
    select
        customer_id,
        first_name,
        last_name,
        full_name,
        gender,
        birth_date,
        job_title,
        salary,
        city,
        state,
        country
    from customers
)

select * from final_dim