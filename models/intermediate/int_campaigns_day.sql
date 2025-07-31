select 
date_date
,paid_source
,sum(ads_cost) as tot_ads_cost
,sum(impression) as tot_impression
,sum(click) as tot_clicks
from{{ ref("int_campaigns") }}
GROUP BY date_date, paid_source
ORDER BY date_date DESC
