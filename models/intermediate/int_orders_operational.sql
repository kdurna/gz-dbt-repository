select
    sales.orders_id,
    sales.date_date,
    round(sum(sales.revenue), 2) as revenue,
    sum(sales.quantity) as quantity,
    round(sum(sales.quantity * product.purchase_price), 2) as purchase_cost,
    round(sum(sales.revenue) - sum(sales.quantity * product.purchase_price), 2) as margin,
    round(
      (sum(sales.revenue) - sum(sales.quantity * product.purchase_price)) 
      + sum(shipping.shipping_fee) 
      - sum(shipping.logcost) 
      - sum(shipping.ship_cost), 2
    ) as operational_margin
from
    {{ ref('stg_raw__sales') }} as sales
left join
    {{ ref('stg_raw__product') }} as product
    using (products_id)
left join
    {{ ref('stg_raw__ship') }} as shipping
    on sales.orders_id = shipping.orders_id
group by
    sales.orders_id,
    sales.date_date