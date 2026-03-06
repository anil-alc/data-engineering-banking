with raw_data as (
    select * from {{ source('bank_raw', 'card') }}
),
clean_data as (
    select
        card_id,
        disp_id as disposition_id,
        type as card_type,
        issue_date,
        limit as card_limit
    from raw_data
)
select * from clean_data