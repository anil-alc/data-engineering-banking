with raw_data as (
    select * from {{ source('bank_raw', 'customer') }}
),
clean_data as (
    select
        customer_id,
        first as first_name,
        last as last_name,
        fullname as full_name,
        gender,
        birth_date,
        jobtitle as job_title,
        salary,
        city,
        state,
        country
    from raw_data
)
select * from clean_data