with cards as (
    select * from {{ ref('stg_card') }}
),

final_dim as (
    select
        card_id,
        disposition_id,
        card_type,
        issue_date,
        card_limit
    from cards
)

select * from final_dim