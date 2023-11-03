
SELECT SUM(CASE WHEN event_name = 'createAccount' THEN 1 ELSE 0 END) as create_account,
SUM(CASE WHEN event_name = 'first_visit' THEN 1 ELSE 0 END) as first_visit,
ROUND(SUM(CASE WHEN event_name = 'createAccount' THEN 1 ELSE 0 END)/SUM(CASE WHEN event_name = 'first_visit' THEN 1 ELSE 0 END) *100,2) as percentage_create_account
FROM `XXXX.events_*`
WHERE event_name IN ('createAccount','first_visit')
