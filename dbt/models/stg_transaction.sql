with raw_data as (
    select * from {{ source('bank_raw', 'transaction') }}
),
clean_data as (
    select
        trans_id as transaction_id,
        account_id,
        txndate as transaction_date,
        type as transaction_type,
        operation,
        amount,
        balance,
        bank as transaction_bank
    from raw_data
)
select * from clean_data