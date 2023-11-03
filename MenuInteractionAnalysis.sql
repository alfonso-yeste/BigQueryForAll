WITH users as (
SELECT count(DISTINCT user_pseudo_id) as total
FROM `XXXX.events_*`
WHERE  _TABLE_SUFFIX BETWEEN 'XXXX' AND 'XXX'
)
SELECT event_params.value.string_value, count(*), count(distinct user_pseudo_id) as unique_users
FROM `bellaaurora.analytics_348556202.events_*` as event, users, UNNEST(event_params) as event_params
WHERE 
_TABLE_SUFFIX BETWEEN '20230210' AND '20230430' AND 
event_name = 'menu' AND 
event_params.key = 'action'
group by event_params.value.string_value
