SELECT *

FROM `XXXX.events_*`
 
WHERE _TABLE_SUFFIX between 'XXXX' and '20231104'
  AND user_pseudo_id = '1076058865.1699101341'
ORDER BY event_timestamp ASC
  ;
