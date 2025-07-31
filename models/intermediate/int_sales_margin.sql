select 
    *
    ,quantity * purchase_price as purchase_cost
    ,round(revenue - (quantity * purchase_price),2) as margin
from
    {{ ref('stg_raw__sales')}} as sales
left join
    {{ ref('stg_raw__product')}} as product
using (products_id)