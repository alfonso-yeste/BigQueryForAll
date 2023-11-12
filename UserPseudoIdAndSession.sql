SELECT user_pseudo_id, value.int_value
FROM `vidalvidal.analytics_267182121.events_20231014*` , UNNEST (event_params) as event_params
WHERE event_name = 'purchase' AND event_params.key = 'ga_session_id'
