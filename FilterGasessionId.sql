SELECT event_params.* 
FROM `vidalvidal.analytics_267182121.events_20231014*` , UNNEST (event_params) as event_params
WHERE event_name = 'purchase' AND event_params.key = 'ga_session_id'


--You can do this directly, regardless of whether you include 'key=' or 'event_params=' in the query, among other parameters

SELECT event_params.* 
FROM `vidalvidal.analytics_267182121.events_20231014*` , UNNEST (event_params) as event_params
WHERE event_name = 'purchase' AND key = 'ga_session_id'
