SELECT COUNT(DISTINCT event_params.value.int_value) as visitas
FROM `XXXX.events_*`, UNNEST (event_params) AS event_params
WHERE event_params.key = 'ga_session_id'
