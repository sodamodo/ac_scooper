SELECT * FROM vehicles ORDER BY vehicle_timestamp DESC LIMIT 10;

SELECT COUNT(*) FROM vehicles;

SELECT COUNT(*) FROM predictions;

UPDATE predictions SET prediction_datetimez = prediction_datetime - INTERVAL '8 hours'

SELECT * FROM predictions WHERE prediction_datetimez IS NULL;

CREATE TABLE vehicles_mar AS (
  SELECT * FROM vehicles  WHERE EXTRACT(MONTH FROM vehicle_timestamp) = 3
);

SELECT * FROM vehicles_mar LIMIT 100
UPDATE vehicles_mar SET vehicle_timestampz = vehicle_timestamp - INTERVAL '8 hours'
DROP MATERIALIZED VIEW vehicles_mar;

CREATE TABLE predictions_mar AS (
  SELECT * FROM predictions  WHERE EXTRACT(MONTH FROM prediction_datetime) = 3
);

UPDATE predictions SET prediction_datetimez = prediction_datetime - INTERVAL '8 hours'


SELECT COUNT(*), EXTRACT(DAY FROM vehicle_timestampz) AS dy FROM vehicles_mar
GROUP BY dy;

SELECT * FROM vehicles_mar WHERE speed != '0.0'

SELECT * FROM predictions_mar LIMIT 100;
SELECT * FROM vehicles_mar LIMIT 100;

UPDATE vehicles_mar SET loc = ST_SetSRID(ST_MakePoint(lon :: FLOAT, lat :: FLOAT),4326);

UPDATE predictions_mar SET prediction_datetimez = prediction_datetime - INTERVAL '8 hours'

SELECT AVG(predicted_delay :: INT),  EXTRACT(HOUR FROM prediction_datetimez) AS hr FROM predictions_mar
GROUP BY hr;

ALTER TABLE stops RENAME COLUMN stp_511_id TO stop_id;

CREATE TABLE seventwo_stops AS (
  SELECT * FROM stops WHERE '72' = ANY (route_array)
);

SELECT * FROM stops AS s INNER JOIN vehicles_mar_stops AS v
ON s.stop_id = v.stop_id :: INT
WHERE v.stop_id != '';

SELECT * FROM vehicles_mar WHERE stop_id = '';

CREATE TABLE vehicles_mar_stops AS (
    SELECT * FROM vehicles_mar WHERE stop_id != ''
);


SELECT * FROM stops WHERE '72' = ANY route_array;
SELECT * FROM vehicles_mar_stops;


ALTER TABLE stops ADD COLUMN route_array VARCHAR[];
SELECT * FROM stops;
UPDATE stops SET route_array = STRING_TO_ARRAY(route, ' ');

SELECT * FROM stops WHERE '72' = ANY (route_array);