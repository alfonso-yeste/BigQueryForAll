SELECT event_params.* 
FROM `vidalvidal.analytics_267182121.events_20231014*` , UNNEST (event_params) as event_params
WHERE event_name = 'purchase';
