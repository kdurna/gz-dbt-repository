select
    orders_id
    ,date_date
    ,round(sum(revenue),2) as revenue
    ,sum(quantity) as quantity
    ,round(sum(quantity * purchase_price),2) as purchase_cost
    ,round(sum(revenue) - sum(quantity * purchase_price),2) as margin
from
    {{ ref('stg_raw__sales')}} as sales
left join
    {{ ref('stg_raw__product')}} as product
using (products_id)
group by orders_id, date_date