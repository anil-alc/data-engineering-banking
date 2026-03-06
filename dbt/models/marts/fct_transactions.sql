-- 1. INCREMENTAL CONFIGURATON (Artımlı Yükleme Ayarı)
{{
    config(
        materialized='incremental',
        unique_key='transaction_id'
    )
}}

with transactions as (
    select * from {{ ref('stg_transaction') }}
    
    -- 2. INCREMENTAL MANTIK
    {% if is_incremental() %}
        where transaction_date > (select max(transaction_date) from {{ this }})
    {% endif %}
),

final_fact as (
    select
        transaction_id,
        account_id,
        transaction_date,
        transaction_type,
        operation,
        amount,
        
        -- 3. MAKRO KULLANIMI
        {{ categorize_amount('amount') }} as amount_category,
        
        balance,
        transaction_bank,


        lag(transaction_date) over (
            partition by account_id 
            order by transaction_date
        ) as previous_transaction_date
        
    from transactions
)

select 
    *,
    datediff(day, previous_transaction_date, transaction_date) as days_since_last_txn
from final_fact