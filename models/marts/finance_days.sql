{{config(materialized='table')}}

select
    date_date
    ,count(distinct orders_id) as tot_transactions
    ,round(sum(revenue),2) as tot_revenue
    ,round(sum(revenue) / nullif(count(distinct orders_id), 0), 2) as average_basket
    ,round(sum(purchase_cost),2) as tot_purchase_cost
    ,round(sum(operational_margin),2) as tot_operational_margin
    ,round(sum(shipping_fee),2) as tot_shipping_fee
    ,round(sum(logcost),2) as tot_logcost
    ,round(sum(quantity),2) as tot_quantity
from {{ ref('int_orders_operational') }}
group by date_date