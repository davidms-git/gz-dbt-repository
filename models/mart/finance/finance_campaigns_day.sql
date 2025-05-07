select
    date_date
    ,(operational_margin-ads_cost) as ads_margin
    ,average_basket
    ,operational_margin
    ,ads_cost
    ,ads_impressions
    ,ads_clicks
    ,quantity
    ,revenue
    ,purchase_cost
    ,margin
    ,shipping_fee
    ,logcost
    ,ship_cost
from {{ref("finance_days")}}
join {{ref("int_campaigns_day")}} 
using (date_date)