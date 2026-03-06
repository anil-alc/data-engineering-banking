with dispositions as (
    select * from {{ ref('stg_disposition') }}
),

final_dim as (
    select
        disposition_type,
        disposition_id,
        customer_id,
        account_id

    from dispositions
)

select * from final_dim