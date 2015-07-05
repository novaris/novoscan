-- Function: rep_record01(timestamp without time zone, timestamp without time zone, character varying, integer)

-- DROP FUNCTION rep_record01(timestamp without time zone, timestamp without time zone, character varying, integer);

CREATE OR REPLACE FUNCTION rep_record01(i_date_beg timestamp without time zone, i_date_end timestamp without time zone, i_spmd_uid character varying, i_time_offset integer)
  RETURNS SETOF record01 AS
$BODY$
DECLARE
  mviews RECORD;
  rid BIGINT;
  rec record01%rowtype;
  max_speed BIGINT := get_sysvari('MAX_SPEED');
  min_speed BIGINT := get_sysvari('MIN_SPEED');
  min_interval  FLOAT := get_sysvarf('MIN_INTERVAL');
  min_sattelite INTEGER := get_sysvari('MIN_SATELLITE_USED');
  max_timeout INTEGER := 600; -- 10 минут
  pi DOUBLE PRECISION := get_constf('PI'); --  число PI
  ra DOUBLE PRECISION := pi/180.0; -- радианы
  time_zone INTERVAL := i_time_offset * INTERVAL '1 minute';
--
--
  lat DOUBLE PRECISION;
  lon DOUBLE PRECISION;
  alt DOUBLE PRECISION;
  rad_lat DOUBLE PRECISION;
  rad_lon DOUBLE PRECISION;
  dt TIMESTAMP;
  tm NUMERIC;
  speed DOUBLE PRECISION;
--
  lat0 DOUBLE PRECISION;
  lon0 DOUBLE PRECISION;
  alt0 DOUBLE PRECISION;
  rad_lat0 DOUBLE PRECISION;
  rad_lon0 DOUBLE PRECISION;
  dt0 TIMESTAMP without time zone;
  tm0 NUMERIC;
  speed0 DOUBLE PRECISION;
--
  lat1 DOUBLE PRECISION;
  lon1 DOUBLE PRECISION;
  alt1 DOUBLE PRECISION;
  rad_lat1 DOUBLE PRECISION;
  rad_lon1 DOUBLE PRECISION;
  dt1 TIMESTAMP without time zone;
  tm1 NUMERIC;
  speed1 DOUBLE PRECISION;
--
  lat2 DOUBLE PRECISION;
  lon2 DOUBLE PRECISION;
  alt2 DOUBLE PRECISION;
  rad_lat2 DOUBLE PRECISION;
  rad_lon2 DOUBLE PRECISION;
  dt2 TIMESTAMP without time zone;
  tm2 NUMERIC;
  speed2 DOUBLE PRECISION;
--  
  dist DOUBLE PRECISION;
  dtime BIGINT;
--
  dist_summ0 DOUBLE PRECISION;
  dtime_summ0 BIGINT;
  -- Статусы движения объекта
  works        text;
  status       integer;
  status0      integer;
  status1      integer;

  --
  status_new   integer := 0;
  status_move  integer := 1;
  status_stop  integer := 2;
  status_unknown  integer := 3;
  status_bad integer := -1;

  i_dt1 TIMESTAMP;
  i_dt2 TIMESTAMP;

BEGIN
  rid := 0;
  i_dt1 := i_date_beg + time_zone;
  i_dt2 := i_date_end + time_zone;
  rec.rec_spob_name := get_obj_name_by_uid(i_spmd_uid);
  
  FOR mviews IN
  SELECT MAX(dasn_id) AS dasn_id
        ,dasn_uid
        ,(dasn_datetime - time_zone) AS dasn_date
        ,dasn_latitude
        ,dasn_longitude
        ,dasn_sat_used
        ,dasn_hgeo
        ,dasn_sog
        ,dasn_type
  FROM data_sensor
 WHERE dasn_vehicle = i_spmd_uid
   AND (dasn_latitude != 0 AND dasn_longitude != 0)
   AND dasn_datetime BETWEEN i_dt1 AND i_dt2
   AND dasn_sog < max_speed
   AND dasn_sat_used > min_sattelite
  GROUP BY dasn_uid
        ,dasn_datetime
        ,dasn_latitude
        ,dasn_longitude
        ,dasn_status
        ,dasn_sat_used
        ,dasn_hgeo
        ,dasn_sog
        ,dasn_type
        ,dasn_date 
  ORDER BY dasn_datetime
          ,dasn_id
  LOOP
     lat0     := mviews.dasn_latitude;
     lon0     := mviews.dasn_longitude;
     alt0     := mviews.dasn_hgeo;
     dt0      := mviews.dasn_date;
     speed0   := mviews.dasn_sog;
     rad_lat0 := lat0*ra;
     rad_lon0 := lon0*ra;
     IF (rid = 0) THEN
        -- Обработка 1 точки.
        rid := rid + 1;
 	lat := lat0;
	lon := lon0;
	alt := alt0;
	dt  := i_date_beg;
	dtime_summ0 :=  EXTRACT(EPOCH FROM mviews.dasn_date)::int8 - EXTRACT(EPOCH FROM i_date_beg)::int8;
	IF (dtime_summ0 > max_timeout) THEN
	   rec.rec_id := rid;
           rec.rec_datetime := dt;
           rec.rec_date := to_char(dt, 'YYYY.MM.DD');
           rec.rec_time := to_char(dt, 'HH24:MI:SS');
           rec.rec_address := '';           
	   rec.rec_type := status_unknown;
	   rec.rec_long := dtime_summ0;
           rec.rec_mileage := 0;
           rec.rec_speed := 0;
	   RETURN NEXT rec;
	   rid := rid + 1;
	END IF;
	dtime_summ0 := 0;
	dist_summ0 := 0;
        dt := dt0;
        status0 := status_unknown;
     ELSE
        ---
        --Вычисление интервала
        dtime := EXTRACT(EPOCH FROM dt0)::int8 - EXTRACT(EPOCH FROM dt1)::int8;
        --Дистанция
        dist := cal_distance(rad_lat1, rad_lon1, rad_lat0, rad_lon0, alt1, alt0);
        speed := get_rep_speed(dist,dtime);  
        -- Статус
	IF (dtime > max_timeout) THEN
	    status := status_unknown; 
        ELSIF (mviews.dasn_sog < min_speed) THEN
            status := status_stop;
        ELSIF (mviews.dasn_sog > min_speed) THEN
            status := status_move;
        END IF;
        
        dtime_summ0 := dtime_summ0 + dtime;
        dist_summ0 := dist_summ0 + dist; 
                
        IF (dtime < 180 AND speed > min_speed) THEN
          status := status_move;
        END IF;
        ---
        -- Проверка интервала.
        IF (status != status0) THEN
          IF (dtime_summ0 > 60) THEN
           -- Определение средней скорости
                      
           rec.rec_id := rid;
           rec.rec_datetime := dt;
           rec.rec_date := to_char(dt, 'YYYY.MM.DD');
           rec.rec_time := to_char(dt, 'HH24:MI:SS');
           rec.rec_address := '';           
	   dt := dt0;
	   lat := lat0;
	   lon := lon0;
	   alt := alt0;

	   IF (status = status_move) THEN
	     rec.rec_type := status_stop;
             rec.rec_long := dtime_summ0;
             rec.rec_mileage := 0;
	     speed := 0;
	     dtime_summ0 := 0;
           ELSIF (status = status_stop) THEN
	     rec.rec_type := status_move;
	     rec.rec_long := dtime_summ0;
             rec.rec_mileage := dist_summ0;
             speed := get_rep_speed(dist_summ0,dtime_summ0);
             dtime_summ0 := 0;
             dist_summ0 := 0;	     
	   ELSE
	     rec.rec_long := dtime_summ0;
             rec.rec_mileage := dist_summ0; 
	     rec.rec_type := status_unknown;
	     speed := get_rep_speed(dist_summ0,dtime_summ0);
	     dtime_summ0 := 0;
             dist_summ0 := 0;  
           END IF;
	   rec.rec_speed := speed;
	   
           RETURN NEXT rec;

           rid := rid + 1;
           status0 := status;
          END IF;
        END IF;
     END IF;
     
--      
     lat2     := lat1;
     lon2     := lon1;
     alt2     := alt1;
     dt2      := dt1;
     rad_lat2 := rad_lat1;
     rad_lon2 := rad_lon1;
--
     lat1     := lat0;
     lon1     := lon0;
     alt1     := alt0;
     dt1      := dt0;
     rad_lat1 := rad_lat0;
     rad_lon1 := rad_lon0;

  END LOOP;
  IF (dtime_summ0 > 0) THEN
           rec.rec_id := rid;
           rec.rec_datetime := dt;
           rec.rec_date := to_char(dt, 'YYYY.MM.DD');
           rec.rec_time := to_char(dt, 'HH24:MI:SS');
           rec.rec_address := '';
           rec.rec_long := dtime_summ0;
           rec.rec_type := status0;           	
	   rec.rec_speed := get_rep_speed(dist_summ0,dtime_summ0);
           RETURN NEXT rec;
  END IF;
  
  RETURN;
END;$BODY$
  LANGUAGE plpgsql VOLATILE SECURITY DEFINER
  COST 100
  ROWS 1000;
ALTER FUNCTION rep_record01(timestamp without time zone, timestamp without time zone, character varying, integer)
  OWNER TO owner_track;
GRANT EXECUTE ON FUNCTION rep_record01(timestamp without time zone, timestamp without time zone, character varying, integer) TO public;
GRANT EXECUTE ON FUNCTION rep_record01(timestamp without time zone, timestamp without time zone, character varying, integer) TO owner_track;
GRANT EXECUTE ON FUNCTION rep_record01(timestamp without time zone, timestamp without time zone, character varying, integer) TO track_server_all;
COMMENT ON FUNCTION rep_record01(timestamp without time zone, timestamp without time zone, character varying, integer) IS 'Отчёт по пробегу';

