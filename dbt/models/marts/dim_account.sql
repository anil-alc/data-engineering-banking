with accounts as (
    select * from {{ ref('stg_account') }}
),

final_dim as (
    select
        account_id,
        frequency as account_frequency,
        created_date as account_created_date
    from accounts
)

select * from final_dim