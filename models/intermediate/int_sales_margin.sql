--margin = revenue - purchase_cost
--purchase_cost = quantity * purchase_price

WITH cost AS(
SELECT
   s.products_id
   -- ,s.revenue
    --,s.quantity
    --,p.purchase_price
    ,CAST(SUM(s.quantity*p.purchase_price) AS FLOAT64) AS purchase_cost
FROM {{ref('stg_raw__sales')}} s
JOIN {{ref('stg_raw__product')}} p
ON s.products_id = p.products_id
GROUP BY s.products_id
)
SELECT
    s.products_id
    ,purchase_cost
    ,SUM(s.revenue-cost.purchase_cost) AS margin
FROM {{ref('stg_raw__sales')}} s
JOIN cost
ON s.products_id = cost.products_id
GROUP BY s.products_id, purchase_cost

