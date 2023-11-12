WITH t_sessions as (SELECT  event_date, user_pseudo_id, event_timestamp,value.int_value as sesiones
FROM `vidalvidal.analytics_267182121.events_*`,
UNNEST (event_params) as event_params
WHERE event_name= 'purchase' AND _TABLE_SUFFIX BETWEEN '20231015' AND '20231016' AND key = 'ga_session_id'),

t_page_tittle as(SELECT  event_date, user_pseudo_id, event_timestamp,value.string_value as titulo_pagina
FROM `vidalvidal.analytics_267182121.events_*`,
UNNEST (event_params) as event_params
WHERE event_name= 'purchase' AND _TABLE_SUFFIX BETWEEN '20231015' AND '20231016' AND key = 'page_title')

SELECT event_date, event_timestamp, user_pseudo_id,sesiones, 
FROM t_sessions
INNER JOIN t_page_tittle
using(event_date, user_pseudo_id, event_timestamp)
