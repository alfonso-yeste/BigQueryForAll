-- Obtener de la unión de las tablas t_taxis_trips y t_taxis_trips_2 por cada día obtenido de la métrica “trip_start_timestamp” (a la cual llamaremos fecha), 
compañía y tipo de pago la suma de trip_total al cual llamaremos “coste_total”. Ordenado por fecha ascendente.


WITH t_union as (SELECT EXTRACT(DATE FROM trip_start_timestamp ) AS fecha, company, payment_type, trip_total
FROM `vidalvidal.analytics_267182121.t_taxis_trips_2`
UNION ALL
SELECT EXTRACT(DATE FROM trip_start_timestamp ) AS fecha, company, payment_type, trip_total
FROM `vidalvidal.analytics_267182121.t_taxis_trips`)

SELECT fecha, company, payment_type, SUM(trip_total) as coste_total FROM t_union
GROUP BY fecha, company, payment_type
