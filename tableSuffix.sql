SELECT  event_date, user_pseudo_id, event_timestamp, device.category, key, value.string_value
FROM `vidalvidal.analytics_267182121.events_*`,
UNNEST (event_params)
WHERE device.category = 'mobile' AND value.string_value IS NOT NULL AND _TABLE_SUFFIX BETWEEN '20231015' AND '20231016'
GROUP BY event_date, user_pseudo_id, event_timestamp, device.category, key, value.string_value
