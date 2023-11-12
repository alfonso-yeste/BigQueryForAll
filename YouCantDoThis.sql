-- No se puede hacer desanidar dos key a la vez

SELECT  user_pseudo_id, value.int_value
FROM `vidalvidal.analytics_267182121.events_20231015*` , UNNEST (event_params) as event_params
WHERE event_name = 'purchase' AND event_params.key = 'ga_session_id' and key = 'medium'


-- PEro sí que puedes hacer esto (subquery)
SELECT  user_pseudo_id,
(SELECT value.int_value FROM UNNEST (event_params) as event_params WHERE key = 'ga_session_id') as sesiones,
(SELECT value.string_value FROM UNNEST (event_params) as event_params WHERE key = 'medium') as medio
FROM `vidalvidal.analytics_267182121.events_20231015*`
WHERE event_name = 'purchase'
