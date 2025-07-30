select
    orders.orders_id
    ,round(
        orders.margin + ship.shipping_fee - ship.logcost - ship.ship_cost,
        2
    ) as operational_margin
    ,orders.date_date
    ,orders.revenue
    ,orders.quantity
    ,orders.purchase_cost
    ,orders.margin
    ,ship.shipping_fee
    ,ship.logcost
    ,ship.ship_cost,
from
    {{ ref('int_orders_margin') }} as orders
left join
    {{ ref('stg_raw__ship') }} as ship
using (orders_id)