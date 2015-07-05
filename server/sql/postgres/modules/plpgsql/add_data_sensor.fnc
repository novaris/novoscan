-- Function: owner_tech.add_data_sensor(dasn_uid "varchar")

-- DROP FUNCTION owner_tech.add_data_sensor(dasn_uid "varchar");

CREATE OR REPLACE FUNCTION add_data_sensor
 (i_vehicle_id varchar -- идентификатор блока.
 ,i_dasn_uid int8 -- Иднетификатор записи лога
 ,i_dasn_datetime timestamp -- Дата время с таймзоной
 ,i_dasn_latitude float8 -- Географическая долгота
 ,i_dasn_longitude float8 -- Географическая широта
 ,i_dasn_status int4 -- Флаг состояний
 ,i_dasn_sat_used int4 -- Количество спутников
 ,i_dasn_zone_alarm int4 -- Состояние тревога зон охраны
 ,i_dasn_macro_id int4 -- Номер макроса
 ,i_dasn_macro_src int4 -- Код источника
 ,i_dasn_sog float8 -- Скорость в м\с
 ,i_dasn_course float8 -- Курс в градусах
 ,i_dasn_hdop float8 -- Значение HDOP
 ,i_dasn_hgeo float8 -- Значение HGEO
 ,i_dasn_hmet float8 -- Значение HMET
 ,i_dasn_gpio int4 -- Состояние входов-выходов в позиционно-битовом коде
 ,i_dasn_adc int8 -- Состояние аналоговых входов
 ,i_dasn_temp float8 -- Температура С
 ,i_dasn_type int4 -- Тип данных
 ,i_dasn_xml text -- Дополнтельные данные.
 ,i_dasn_dtm timestamp -- Дата модификации
 ,i_spmt_id  int8  -- Идентификатор типа блока из таблицы sprv_module_types
 )
  RETURNS int8 AS
$BODY$


DECLARE
  n_val integer;
  spsn_id int8;
  spmd_id int8;
  n_dasn_id int8;
  spsl_id int8;
  dasl_dt TIMESTAMP WITHOUT TIME ZONE;
  dasl_dt_max TIMESTAMP WITHOUT TIME ZONE;
  last_activity CURSOR (i_spsn_id INT8)
    IS
    SELECT dasl_id
          ,dasl_datetime 
      FROM data_sensor_last
     WHERE dasl_spsn_id = i_spsn_id
     ;
BEGIN

  SELECT o_spsn, o_spmd INTO spsn_id, spmd_id FROM get_sens_mod_id(i_vehicle_id,i_spmt_id);
  IF (spsn_id IS NULL) THEN
    spsn_id := 0;
  END IF;
  SELECT nextval('dasn_seq') INTO n_dasn_id;
  INSERT INTO data_sensor
  (dasn_id
  ,dasn_uid
  ,dasn_datetime-- Дата время с таймзоной
  ,dasn_latitude -- Географическая долгота
  ,dasn_longitude -- Географическая широта
  ,dasn_status -- Флаг состояний
  ,dasn_sat_used -- Количество спутников
  ,dasn_zone_alarm -- Состояние тревога зон охраны
  ,dasn_macro_id  -- Номер макроса
  ,dasn_macro_src -- Код источника
  ,dasn_sog  -- Скорость в м\с
  ,dasn_course  -- Курс в градусах
  ,dasn_hdop  -- Значение HDOP
  ,dasn_hgeo  -- Значение HGEO
  ,dasn_hmet  -- Значение HMET
  ,dasn_gpio  -- Состояние входов-выходов в позиционно-битовом коде
  ,dasn_adc -- Состояние аналоговых входов
  ,dasn_temp  -- Температура С
  ,dasn_type  -- Тип данных
  ,dasn_xml -- Дополнтельные данные.
  ,dasn_dtm  -- Дата модификации
  ,dasn_spsn_id -- ид записи блока
  ,dasn_vehicle -- реальный идентификатор устройства
  ) VALUES 
  (n_dasn_id
  ,i_dasn_uid
  ,i_dasn_datetime -- Дата время с таймзоной
  ,i_dasn_latitude  -- Географическая долгота
  ,i_dasn_longitude  -- Географическая широта
  ,i_dasn_status  -- Флаг состояний
  ,i_dasn_sat_used  -- Количество спутников
  ,i_dasn_zone_alarm  -- Состояние тревога зон охраны
  ,i_dasn_macro_id  -- Номер макроса
  ,i_dasn_macro_src  -- Код источника
  ,i_dasn_sog -- Скорость в м;с
  ,i_dasn_course  -- Курс в градусах
  ,i_dasn_hdop  -- Значение HDOP
  ,i_dasn_hgeo  -- Значение HGEO
  ,i_dasn_hmet -- Значение HMET
  ,i_dasn_gpio -- Состояние входов-выходов в позиционно-битовом коде
  ,i_dasn_adc -- Состояние аналоговых входов
  ,i_dasn_temp -- Температура С
  ,i_dasn_type  -- Тип данных
  ,''-- Дополнтельные данные.
  ,i_dasn_dtm -- Дата модификации
  ,spsn_id-- ид блока
  ,i_vehicle_id -- реальный идентификатор устройства
  );
  -- Обновим в таблице последней активности
  IF spsn_id != 0 THEN
	  OPEN last_activity(spsn_id);
	  FETCH last_activity INTO spsl_id, dasl_dt;
	  CLOSE last_activity;
	  dasl_dt_max := now() - (get_timezone() - 1)* interval '1 hours' ;
	  IF spsl_id IS NOT NULL AND (i_dasn_datetime >= dasl_dt AND i_dasn_datetime <= dasl_dt_max) THEN
		  UPDATE data_sensor_last SET
		   dasl_uid = i_dasn_uid
		  ,dasl_datetime = i_dasn_datetime-- Дата время с таймзоной
		  ,dasl_latitude = i_dasn_latitude -- Географическая долгота
		  ,dasl_longitude = i_dasn_longitude -- Географическая широта
		  ,dasl_status = i_dasn_status -- Флаг состояний
		  ,dasl_sat_used = i_dasn_sat_used -- Количество спутников
		  ,dasl_zone_alarm = i_dasn_zone_alarm -- Состояние тревога зон охраны
		  ,dasl_macro_id =i_dasn_macro_id -- Номер макроса
		  ,dasl_macro_src = i_dasn_macro_src-- Код источника
		  ,dasl_sog = i_dasn_sog -- Скорость в м\с
		  ,dasl_course = i_dasn_course -- Курс в градусах
		  ,dasl_hdop = i_dasn_hdop -- Значение HDOP
		  ,dasl_hgeo = i_dasn_hgeo -- Значение HGEO
		  ,dasl_hmet = i_dasn_hmet -- Значение HMET
		  ,dasl_gpio = i_dasn_gpio -- Состояние входов-выходов в позиционно-битовом коде
		  ,dasl_adc = i_dasn_adc -- Состояние аналоговых входов
		  ,dasl_temp = i_dasn_temp -- Температура С
		  ,dasl_type = i_dasn_type -- Тип данных
		  ,dasl_xml = i_dasn_xml -- Дополнтельные данные.
		  ,dasl_dtm = i_dasn_dtm -- Дата модификации
		  ,dasl_spsn_id = spsn_id -- ид записи блока
		  ,dasl_dasn_id = n_dasn_id -- ид в data_sensor
		  ,dasl_vehicle = i_vehicle_id -- реальный идентификатор устройства
		  WHERE dasl_id = spsl_id
		  ;
	  ELSIF spsl_id IS NOT NULL AND i_dasn_datetime > dasl_dt_max THEN
	          RAISE NOTICE 'Incorrect date to large %', i_dasn_datetime;
	  ELSIF spsl_id IS NOT NULL AND i_dasn_datetime < dasl_dt THEN
	          RAISE NOTICE 'Incorrect date to small %', i_dasn_datetime;
          ELSIF spsl_id IS NOT NULL THEN
	          RAISE NOTICE 'Incorrect date %', i_dasn_datetime;
	  ELSE
		  SELECT nextval('dasl_seq') INTO spsl_id;
		  INSERT INTO data_sensor_last
		  (dasl_id
		  ,dasl_uid
		  ,dasl_datetime-- Дата время с таймзоной
		  ,dasl_latitude -- Географическая долгота
		  ,dasl_longitude -- Географическая широта
		  ,dasl_status -- Флаг состояний
		  ,dasl_sat_used -- Количество спутников
		  ,dasl_zone_alarm -- Состояние тревога зон охраны
		  ,dasl_macro_id  -- Номер макроса
		  ,dasl_macro_src -- Код источника
		  ,dasl_sog  -- Скорость в м\с
		  ,dasl_course  -- Курс в градусах
		  ,dasl_hdop  -- Значение HDOP
		  ,dasl_hgeo  -- Значение HGEO
		  ,dasl_hmet  -- Значение HMET
		  ,dasl_gpio  -- Состояние входов-выходов в позиционно-битовом коде
		  ,dasl_adc -- Состояние аналоговых входов
		  ,dasl_temp  -- Температура С
		  ,dasl_type  -- Тип данных
		  ,dasl_xml -- Дополнтельные данные.
		  ,dasl_dtm  -- Дата модификации
		  ,dasl_spsn_id -- ид записи блока
		  ,dasl_vehicle -- реальный идентификатор устройства
		  ,dasl_dasn_id -- ид в data_sensor
		  ) VALUES 
		  (spsl_id
		  ,i_dasn_uid
		  ,i_dasn_datetime -- Дата время с таймзоной
		  ,i_dasn_latitude  -- Географическая долгота
		  ,i_dasn_longitude  -- Географическая широта
		  ,i_dasn_status  -- Флаг состояний
		  ,i_dasn_sat_used  -- Количество спутников
		  ,i_dasn_zone_alarm  -- Состояние тревога зон охраны
		  ,i_dasn_macro_id  -- Номер макроса
		  ,i_dasn_macro_src  -- Код источника
		  ,i_dasn_sog -- Скорость в м;с
		  ,i_dasn_course  -- Курс в градусах
		  ,i_dasn_hdop  -- Значение HDOP
		  ,i_dasn_hgeo  -- Значение HGEO
		  ,i_dasn_hmet -- Значение HMET
		  ,i_dasn_gpio -- Состояние входов-выходов в позиционно-битовом коде
		  ,i_dasn_adc -- Состояние аналоговых входов
		  ,i_dasn_temp -- Температура С
		  ,i_dasn_type  -- Тип данных
		  ,i_dasn_xml-- Дополнтельные данные.
		  ,i_dasn_dtm -- Дата модификации
		  ,spsn_id-- ид блока
		  ,i_vehicle_id -- реальный идентификатор устройства
		  ,n_dasn_id
		  );
	  END IF;
	  IF(length(i_dasn_xml) > 3) THEN
	     n_val := add_data_values(i_dasn_xml, spsl_id, n_dasn_id, spmd_id, i_dasn_datetime);
	  END IF;
  END IF;	
  
  RETURN spsl_id;
  
END;

$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  SECURITY DEFINER;

COMMENT ON FUNCTION add_data_sensor (i_vehicle_id varchar
 ,i_dasn_uid int8
 ,i_dasn_datetime timestamp
 ,i_dasn_latitude float8
 ,i_dasn_longitude float8
 ,i_dasn_status int4
 ,i_dasn_sat_used int4
 ,i_dasn_zone_alarm int4
 ,i_dasn_macro_id int4
 ,i_dasn_macro_src int4
 ,i_dasn_sog float8
 ,i_dasn_course float8
 ,i_dasn_hdop float8
 ,i_dasn_hgeo float8
 ,i_dasn_hmet float8
 ,i_dasn_gpio int4
 ,i_dasn_adc int8
 ,i_dasn_temp float8
 ,i_dasn_type int4
 ,i_dasn_xml text
 ,i_dasn_dtm timestamp
 ,i_spmt_id  int8
 )
  IS 'Процедура вставки данных в таблицу данных сенсоров блока для разных типов блоков';

REVOKE ALL ON FUNCTION add_data_sensor
 (i_vehicle_id varchar
 ,i_dasn_uid int8
 ,i_dasn_datetime timestamp
 ,i_dasn_latitude float8
 ,i_dasn_longitude float8
 ,i_dasn_status int4
 ,i_dasn_sat_used int4
 ,i_dasn_zone_alarm int4
 ,i_dasn_macro_id int4
 ,i_dasn_macro_src int4
 ,i_dasn_sog float8
 ,i_dasn_course float8
 ,i_dasn_hdop float8
 ,i_dasn_hgeo float8
 ,i_dasn_hmet float8
 ,i_dasn_gpio int4
 ,i_dasn_adc int8
 ,i_dasn_temp float8
 ,i_dasn_type int4
 ,i_dasn_xml text
 ,i_dasn_dtm timestamp
 ,i_spmt_id  int8
  ) FROM public;

GRANT EXECUTE ON FUNCTION add_data_sensor
 (i_vehicle_id varchar
 ,i_dasn_uid int8
 ,i_dasn_datetime timestamp
 ,i_dasn_latitude float8
 ,i_dasn_longitude float8
 ,i_dasn_status int4
 ,i_dasn_sat_used int4
 ,i_dasn_zone_alarm int4
 ,i_dasn_macro_id int4
 ,i_dasn_macro_src int4
 ,i_dasn_sog float8
 ,i_dasn_course float8
 ,i_dasn_hdop float8
 ,i_dasn_hgeo float8
 ,i_dasn_hmet float8
 ,i_dasn_gpio int4
 ,i_dasn_adc int8
 ,i_dasn_temp float8
 ,i_dasn_type int4
 ,i_dasn_xml text
 ,i_dasn_dtm timestamp
 ,i_spmt_id  int8
  ) TO GROUP T04_ADM_DATA_SENS;





