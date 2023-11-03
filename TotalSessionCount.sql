SELECT COUNT(DISTINCT event_params.value.int_value) as visitas
FROM `aural-376908.analytics_312541864.events_*`, UNNEST (event_params) AS event_params
WHERE event_params.key = 'ga_session_id'
