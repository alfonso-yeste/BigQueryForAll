WITH total_visitas as (
SELECT COUNT(DISTINCT event_params.value.int_value) as visitas
FROM `XXXXX.events_*`, UNNEST (event_params) AS event_params
WHERE event_params.key = 'ga_session_id' 
)
SELECT total_visitas.visitas, SUM(CASE WHEN items.item_name = 'first_photo' THEN 1 ELSE 0 END ) as first_photo,
SUM(CASE WHEN items.item_name = 'second_photo' THEN 1 ELSE 0 END ) as second_photo,
SUM(CASE WHEN items.item_name = 'third_photo' THEN 1 ELSE 0 END ) as third_photo,
ROUND(SUM(CASE WHEN items.item_name = 'XXXXX' THEN 1 ELSE 0 END )/ total_visitas.visitas *100,2) as precentage_first_photo,
ROUND(SUM(CASE WHEN items.item_name = 'XXXXX' THEN 1 ELSE 0 END )/ total_visitas.visitas *100,2) as precentage_second_photo,
ROUND(SUM(CASE WHEN items.item_name = 'XXXXX' THEN 1 ELSE 0 END )/ total_visitas.visitas *100,2) as precentage_third_photo


FROM `XXXX_*`, UNNEST (items) AS items, total_visitas
WHERE event_name = 'purchase' AND items.item_name IN ('XXXX', 'XXX', 'XXXX')
GROUP BY total_visitas.visitas
