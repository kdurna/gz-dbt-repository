select
    DATE_TRUNC(date_date, MONTH) as month_date
    ,sum(tot_ads_cost) as tot_ads_cost
    ,sum(tot_impression) as tot_impression
    ,sum(tot_clicks) as tot_clics
    ,round(avg(average_basket), 2) as average_basket
    ,sum(tot_quantity) as tot_quantity
    ,round(sum(tot_revenue),2) as tot_revenue
    ,round(sum(tot_purchase_cost),2) as tot_purchase_cost
    ,round(sum(tot_operational_margin),2) as tot_operational_margin
    ,round(sum(tot_shipping_fee),2) as tot_shipping_fee
    ,round(sum(tot_logcost),2) as tot_logcost
    ,round(sum(tot_operational_margin) - sum(tot_ads_cost),2) as ads_margin
from {{ ref('finance_campaigns_day') }}
group by month_date
order by month_date desc