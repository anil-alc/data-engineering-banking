{% snapshot snp_customer %}

{{
    config(
      target_schema='dbt_aalkan',
      unique_key='customer_id',
      strategy='check',
      check_cols=['city', 'salary', 'job_title']
    )
}}

select * from {{ ref('stg_customer') }}

{% endsnapshot %}