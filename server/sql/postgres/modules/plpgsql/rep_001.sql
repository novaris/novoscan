-- Function: rep_001(i_spob_id int8, dt1 "timestamp", dt2 "timestamp")

-- DROP FUNCTION rep_001(i_spob_id int8, dt1 "timestamp", dt2 "timestamp");

CREATE OR REPLACE FUNCTION rep_001(i_spob_id int8, dt1 "timestamp", dt2 "timestamp")
  RETURNS SETOF text AS
$BODY$DECLARE
  rec record;
  n_dist float;
  n_dist_dist float;
  lat1 float;
  lat2 float;
  lon1 float;
  lon2 float;
  pi float := 3.14159265358979; --  число PI
  rad float := 6372795; -- радиус земли в метрах
  cl1 float;
  cl2 float;
  sl1 float;
  sl2 float;
  delta float;
  cdelta float;
  sdelta float;
  p1 float;
  p2 float;
  t1 timestamp;
  t2 timestamp;
  t_works text;
  t_int int8;
  rec_row integer;
  s_speed float;
  t_stat integer;
  t_beg timestamp;
  t_end timestamp;
  t_int_int int8;
  dt_format text := 'DD.MM.YYYY HH24:MI:SS';
BEGIN
  lat1 := NULL;
  lon1 := NULL;
  n_dist := 0;
  rec_row := 0;
--  RETURN NEXT '№;Событие;Начало;Конец;Время;Дорога;Протяженность;Средняя скорость;';
  FOR rec IN  
    SELECT dasn_latitude*pi/180 AS latitude
          ,dasn_longitude*pi/180 AS longitude
          ,dasn_sog AS dasn_kmh
          ,dasn_datetime AS datetime
      FROM sprv_objects b 
          ,sprv_modules m 
          ,sprv_clients a
          ,sprv_departs d
          ,data_sensor  s
  WHERE a.spcl_id = b.spob_spcl_id 
    AND d.spdp_id = a.spcl_spdp_id
    AND m.spmd_spob_id = b.spob_id
    AND b.spob_id = i_spob_id
    AND m.spmd_uid = s.dasn_vehicle
    AND s.dasn_datetime BETWEEN dt1 AND dt2
  GROUP BY dasn_latitude
          ,dasn_longitude
          ,dasn_sog
          ,dasn_datetime
  ORDER BY s.dasn_datetime 
  LOOP
    lat1 := rec.latitude;
    lon1 := rec.longitude;
    t1   := rec.datetime;
    IF lat1 IS NOT NULL AND lat2 IS NOT NULL THEN
       --Вычисление дистанции
       --косинусы и синусы широт и разниц долгот
       cl1 := cos(lat1);
       cl2 := cos(lat2);
       sl1 := sin(lat1);
       sl2 := sin(lat2);
       delta := lon2 - lon1;
       cdelta := cos(delta);
       sdelta := sin(delta);
       --вычисления длины большого круга
       p1 := (cl2*sdelta)^2;
       p2 := ((cl1*sl2) - (sl1*cl2*cdelta))^2;
       n_dist := (atan((p1 + p2)^0.5/(sl1*sl2+cl1*cl2*cdelta)))*rad;
       --Вычисление интервала движения
       t_int := EXTRACT(EPOCH FROM t1)::int8 - EXTRACT(EPOCH FROM t2)::int8;
       -- Определение средней скорости
       IF t_int = 0 THEN
         s_speed := 0;
       ELSE
         s_speed := round((n_dist*3.6/t_int)::numeric,2);
       END IF;
       -- Отсеим с интервалом менее 10 сек (защитный интервал)
       IF t_int < 10 THEN
         t_int_int   := t_int_int   + t_int;
         n_dist_dist := n_dist_dist + n_dist;
         t_end       := t1;
       -- Если скорость более 1 км в час или интервал передачи данных менее 280 скунд - то машина движется 
       ELSIF s_speed > 1 OR t_int < 280 THEN
         IF t_stat = 0 THEN
           t_stat      := 1;
           t_works     := 'Движение';
           t_int_int   := t_int_int   + t_int;
           n_dist_dist := n_dist_dist + n_dist;
           --t_beg       := t1;
           t_end       := t1; 
         ELSIF t_stat != 1 THEN
           n_dist_dist := 0;
           s_speed     := round((n_dist_dist*3.6/t_int_int)::numeric,2);
           rec_row     := rec_row + 1;
           RETURN NEXT rec_row::text||';'||t_works||';'||to_char(t_beg, dt_format)||';'||to_char(t_end, dt_format)||';'||(t_int_int*interval '1 second')::text||';Неизв.;'||round((n_dist_dist/1000.0)::numeric,2)::text||';'||s_speed::text||';';
           t_stat      := 1;
           t_beg       := t2;
           t_end       := t1;
           t_works     := 'Движение';
           n_dist_dist := n_dist;
           t_int_int   := t_int;
         ELSE
           t_int_int   := t_int_int   + t_int;
           n_dist_dist := n_dist_dist + n_dist;
           t_end       := t1;
         END IF;
       ELSE
         IF t_stat = 0 THEN
           t_stat      := 2;
           t_works     := 'Стоянка';
           t_int_int   := t_int_int   + t_int;
           n_dist_dist := n_dist_dist + n_dist;
           --t_beg       := t1;
           t_end       := t1; 
         ELSIF t_stat != 2 THEN
           s_speed     := round((n_dist_dist*3.6/t_int_int)::numeric,2);
           rec_row     := rec_row + 1;
           RETURN NEXT rec_row::text||';'||t_works||';'||to_char(t_beg, dt_format)||';'||to_char(t_end, dt_format)||';'||(t_int_int*interval '1 second')::text||';Неизв.;'||round((n_dist_dist/1000.0)::numeric,2)::text||';'||s_speed::text||';';
           t_stat      := 2;
           t_beg       := t2;
           t_end       := t1;
           t_works     := 'Стоянка';
           n_dist_dist := n_dist;
           t_int_int   := t_int;
         ELSE
           t_int_int   := t_int_int   + t_int;
           n_dist_dist := n_dist_dist + n_dist;
           t_end       := t1;
         END IF;
     END IF;
    ELSE
       t_works     := 'Начало движения';
       t_stat      := 0;
       t_beg       := t1;
       t_end       := t1;
       n_dist      := 0;
       t_int       := 0;
       s_speed     := 0;
       n_dist_dist := 0;
       t_int_int   := 0;
       rec_row     := rec_row + 1;
       RETURN NEXT rec_row::text||';'||t_works||';'||to_char(t_beg, dt_format)||';'||to_char(t_end, dt_format)||';'||(t_int_int*interval '1 second')::text||';Неизв.;'||round((n_dist_dist/1000.0)::numeric,2)::text||';'||s_speed::text||';';
    END IF;
    lat2 := lat1;
    lon2 := lon1;
    t2   := t1;
  END LOOP;
  rec_row     := rec_row + 1;
  RETURN NEXT rec_row::text||';'||t_works||';'||to_char(t_beg, dt_format)||';'||to_char(t_end, dt_format)||';'||(t_int_int*interval '1 second')::text||';Неизв.;'||round((n_dist_dist/1000.0)::numeric,2)::text||';'||s_speed::text||';';
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER;
ALTER FUNCTION rep_001(i_spob_id int8, dt1 "timestamp", dt2 "timestamp") OWNER TO owner_track;
GRANT EXECUTE ON FUNCTION rep_001(i_spob_id int8, dt1 "timestamp", dt2 "timestamp") TO public;
GRANT EXECUTE ON FUNCTION rep_001(i_spob_id int8, dt1 "timestamp", dt2 "timestamp") TO owner_track;
GRANT EXECUTE ON FUNCTION rep_001(i_spob_id int8, dt1 "timestamp", dt2 "timestamp") TO track_server_all;
GRANT EXECUTE ON FUNCTION rep_001(i_spob_id int8, dt1 "timestamp", dt2 "timestamp") TO owner_dev;
COMMENT ON FUNCTION rep_001(i_spob_id int8, dt1 "timestamp", dt2 "timestamp") IS 'Статистика движения объекта за интервал дат';
