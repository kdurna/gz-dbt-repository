select 
    campaigns.date_date
    ,campaigns.paid_source
    ,finance.tot_operational_margin - campaigns.tot_ads_cost as ads_margin
    ,finance.average_basket
    ,campaigns.tot_ads_cost
    ,campaigns.tot_impression
    ,campaigns.tot_clicks
    ,finance.tot_quantity
    ,finance.tot_revenue
    ,finance.tot_purchase_cost
    ,finance.tot_operational_margin
    ,finance.tot_shipping_fee
    ,finance.tot_logcost
from
    {{ ref('int_campaigns_day')}} as campaigns
left join
    {{ ref('finance_days')}} as finance
using (date_date)
order by campaigns.date_date desc, campaigns.paid_source