SELECT
  event_timestamp,
  CONCAT(FORMAT_DATE('%d-%m-%Y', PARSE_DATE('%Y%m%d', event_date)), ' ',  
         FORMAT_TIME('%T', TIME(TIMESTAMP_MICROS(event_timestamp)))) AS fulldate,
  event_name,
  user_pseudo_id,
  (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_id') AS session_id,
  (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_number') AS session_number,
  CASE 
    WHEN (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_number') > 1 THEN 0 
    ELSE 1 
  END AS is_first_session,
  items.item_id,
  items.item_name, 
  items.item_brand,
  items.item_category,
  items.item_category2,
  items.item_category3,
  items.price
 
FROM
  `XXXX`,
  UNNEST(items) AS items
WHERE
  _TABLE_SUFFIX BETWEEN '20230606' AND '20231209' AND 
  event_name IN ('purchase', 'view_cart', 'view_item', 'begin_checkout', 'add_to_cart', 'remove_from_cart')
  ORDER BY 1 ASC
