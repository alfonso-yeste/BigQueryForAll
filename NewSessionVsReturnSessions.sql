WITH max_sessions as (
SELECT max(event_params.value.int_value) as session_number
FROM
  `XXXXX.events_*`, UNNEST (event_params) as event_params
WHERE
 _TABLE_SUFFIX between 'XXXX' and 'XXXX'
  AND event_params.key = "ga_session_number"
  group by user_pseudo_id)
select SUM(CASE when max_sessions.session_number = 1 then 1 else 0 end) as one_session,
SUM(CASE when max_sessions.session_number > 1 then 1 else 0 end) as multiple_sessions
from max_sessions;
