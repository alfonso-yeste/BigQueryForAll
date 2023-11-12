WITH t_sesiones as (SELECT event_date, event_timestamp ,user_pseudo_id, value.int_value as sesiones
FROM `vidalvidal.analytics_267182121.events_20231015` , UNNEST(event_params) as event_params 
WHERE event_name = "purchase" and key = 'ga_session_id'),

t_page_title as (SELECT event_date, event_timestamp ,user_pseudo_id, value.string_value as page_title
FROM `vidalvidal.analytics_267182121.events_20231015` , UNNEST(event_params) as event_params 
WHERE event_name = "purchase" and key = 'page_title'),

t_payment_type as (SELECT event_date, event_timestamp ,user_pseudo_id, value.string_value as payment_type
FROM `vidalvidal.analytics_267182121.events_20231015` , UNNEST(event_params) as event_params
WHERE event_name = "purchase" and key = 'payment_type'),

t_union as(SELECT event_date, event_timestamp ,user_pseudo_id, sesiones, page_title
FROM t_sesiones
INNER JOIN t_page_title
USING (event_date, event_timestamp ,user_pseudo_id))

SELECT event_date, event_timestamp ,user_pseudo_id, sesiones, page_title, t_payment_type
FROM t_payment_type
INNER JOIN t_union
USING (event_date, event_timestamp ,user_pseudo_id)
