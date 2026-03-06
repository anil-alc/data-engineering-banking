with raw_data as (
    select * from {{ source('bank_raw', 'disposition') }}
),
clean_data as (
    select
        type as disposition_type,
        disp_id as disposition_id,
        client_id as customer_id,
        account_id
    from raw_data
)
select * from clean_data