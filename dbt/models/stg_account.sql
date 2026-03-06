with raw_data as (
    -- sources.yml dosyasında tanımladığımız account tablosu
    select * from {{ source('bank_raw', 'account') }}
),

clean_data as (
    select
        account_id,
        frequency,
        created_date,
        day,
        month,
        year
    from raw_data
)

select * from clean_data