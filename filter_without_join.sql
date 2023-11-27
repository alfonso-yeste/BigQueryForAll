WITH blog_visitors AS (
SELECT
DISTINCT user_pseudo_id AS visitors_id
FROM
`xuanlanyoga.analytics_322908039.events_*`,
UNNEST(event_params) AS event_params
WHERE 
_TABLE_SUFFIX BETWEEN '20231101' AND '20231120' AND
event_params.key = 'pageType' AND event_params.value.string_value IN ('blog', 'articulo_blog')
)
SELECT 
SUM(ecommerce.purchase_revenue) AS total_revenue
FROM 
`xuanlanyoga.analytics_322908039.events_*`,
blog_visitors
WHERE 
_TABLE_SUFFIX BETWEEN '20231101' AND '20231120' AND
user_pseudo_id = blog_visitors.visitors_id AND
event_name = 'purchase' AND
ecommerce.purchase_revenue IS NOT NULL
