with date_spine as (
    -- 2016'dan başlayarak ileriye doğru 3650 gün (10 yıl)
    -- 3650 days (10 years) starting from 2016
    select
        dateadd(day, seq4(), '2016-01-01'::date) as date_day
    from table(generator(rowcount => 3650))
),

final_date_dim as (
    select
        date_day as date,
        extract(year from date_day) as year,
        extract(month from date_day) as month,
        extract(day from date_day) as day,
        dayname(date_day) as day_name,
        monthname(date_day) as month_name,
        extract(quarter from date_day) as quarter
    from date_spine
)

select * from final_date_dim