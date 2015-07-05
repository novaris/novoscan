-- Function: add_data_values(text, bigint, bigint, bigint, timestamp without time zone)

-- DROP FUNCTION add_data_values(text, bigint, bigint, bigint, timestamp without time zone);

CREATE OR REPLACE FUNCTION add_data_values(i_value text, i_dasl bigint, i_dasn bigint, i_spmd bigint, i_datetime timestamp without time zone)
  RETURNS integer AS
$BODY$
DECLARE
  value_count INTEGER;
  rec RECORD;
  dalv INT8;
  v_dt TIMESTAMP WITHOUT TIME ZONE;
  v_value NUMERIC;
  dt_max TIMESTAMP WITHOUT TIME ZONE;
  v_save BOOLEAN;
  rec_value NUMERIC;

  last_activity CURSOR (i_spmd INT8, i_key VARCHAR)
    IS
    SELECT dalv_id
          ,dalv_datetime
          ,dalv_value 
      FROM data_sensor_last_values
     WHERE dalv_spmd_id = i_spmd
       AND dalv_key = i_key
       ;
       
BEGIN
  value_count := 0;
  FOR rec IN (
	  SELECT g.arr[1] AS akey, g.arr[2] AS avalue 
	  FROM 
	  (SELECT regexp_split_to_array(a,'=') AS arr 
	     FROM regexp_split_to_table(i_value, ';')
	   AS a
	     LIMIT 50 
	  ) g
	  ) LOOP
	  IF (rec.avalue IS NOT NULL) THEN
	     -- Проверим наличие данных значений в таблице послед 
	     -- данных
	     rec_value := rec.avalue;
	     v_save := false;
	     OPEN last_activity(i_spmd, rec.akey);
	     FETCH last_activity INTO dalv, v_dt, v_value;
	     CLOSE last_activity;
  	     dt_max := now() - (get_timezone() - 1)* interval '1 hours' ;
	     IF dalv IS NOT NULL AND (i_datetime >= v_dt AND i_datetime <= dt_max) THEN
	        IF (v_value = rec_value) THEN
		  UPDATE data_sensor_last_values SET 
		      dalv_dasl_id = i_dasl 
		     ,dalv_dtm = i_datetime
		    WHERE  dalv_id = dalv;
		  v_save := false;  	
		ELSE
		  UPDATE data_sensor_last_values 
		     SET dalv_dasl_id = i_dasl
		        ,dalv_value = rec_value
		        ,dalv_dtm = i_datetime
	          WHERE  dalv_id = dalv;
	          v_save := true; 
		END IF;
	     
	    ELSIF dalv IS NULL THEN    
		INSERT INTO data_sensor_last_values
		     (dalv_id
		     ,dalv_dasl_id
		     ,dalv_spmd_id
		     ,dalv_key
		     ,dalv_value
		     ,dalv_datetime
		     ,dalv_dtm
		     ) VALUES 
		     (nextval('dalv_seq')
		     ,i_dasl
		     ,i_spmd
		     ,rec.akey
		     ,rec_value
		     ,i_datetime
		     ,i_datetime
		     );
		  v_save := true;
             ELSE
                  v_save := true;
	     END IF;
	  END IF;
	  IF (v_save) THEN
	     INSERT INTO data_sensor_values
	     (dasv_id
             ,dasv_spmd_id
	     ,dasv_dasn_id
	     ,dasv_key
	     ,dasv_value
	     ,dasv_datetime
	     ) VALUES 
	     (nextval('dasv_seq')
             ,i_spmd
	     ,i_dasn
	     ,rec.akey
	     ,rec_value
	     ,i_datetime
	     );
	     value_count := value_count + 1;
	     v_save := false;
	  END IF;
  END LOOP;	  
  RETURN value_count;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION add_data_values(text, bigint, bigint, bigint, timestamp without time zone)
  OWNER TO owner_track;
GRANT EXECUTE ON FUNCTION add_data_values(text, bigint, bigint, bigint, timestamp without time zone) TO public;
GRANT EXECUTE ON FUNCTION add_data_values(text, bigint, bigint, bigint, timestamp without time zone) TO owner_track;
GRANT EXECUTE ON FUNCTION add_data_values(text, bigint, bigint, bigint, timestamp without time zone) TO t04_adm_data_sens;
COMMENT ON FUNCTION add_data_values(text, bigint, bigint, bigint, timestamp without time zone) IS 'Дополнительные данные для систем мониторинга';

