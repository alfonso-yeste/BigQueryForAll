WITH t_sessions as (SELECT  event_date, user_pseudo_id, event_timestamp, device.category, key, value.string_value as sesiones
FROM `vidalvidal.analytics_267182121.events_*`,
UNNEST (event_params) as event_params
WHERE event_name= 'purchase' AND _TABLE_SUFFIX BETWEEN '20231015' AND '20231016')

SELECT * FROM t_sessions
