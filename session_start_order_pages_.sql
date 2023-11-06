SELECT
event_date,
 event_name,
  event_params.value.string_value,
FROM
  `XXXXX.events_*`,
  UNNEST(event_params) as event_params
WHERE
  event_name = 'session_start' AND
  _TABLE_SUFFIX between 'XXXX' and 'XXXX' AND
  event_params.key = 'page_location' and event_params.value.string_value like '%order%'

  ;
