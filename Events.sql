SELECT  event_name,event_date, user_pseudo_id, event_timestamp, device.category, key, value.string_value
FROM `vidalvidal.analytics_267182121.events_20231015`,
UNNEST (event_params)
WHERE device.category = 'mobile' AND value.string_value IS NOT NULL
GROUP BY event_date, user_pseudo_id, event_timestamp, device.category, key, value.string_value, event_name
