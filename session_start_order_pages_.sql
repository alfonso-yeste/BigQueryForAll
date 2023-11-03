SELECT
event_date,
 event_name,
  event_params.value.string_value,
FROM
  `xuanlanyoga.analytics_322908039.events_*`,
  UNNEST(event_params) as event_params
WHERE
  event_name = 'session_start' AND
  _TABLE_SUFFIX between '20230713' and '20230713' AND
  event_params.key = 'page_location' and event_params.value.string_value like '%order%'

  ;
