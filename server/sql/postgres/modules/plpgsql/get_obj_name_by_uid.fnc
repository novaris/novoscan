-- Function: get_obj_name_by_uid(character varying)

-- DROP FUNCTION get_obj_name_by_uid(character varying);

CREATE OR REPLACE FUNCTION get_obj_name_by_uid(i_uid character varying)
  RETURNS character varying AS
$BODY$
DECLARE
  t_name text;
BEGIN
  SELECT spob_name INTO t_name
    FROM sprv_objects
        ,sprv_modules
   WHERE spob_id = spmd_spob_id
     AND spmd_uid = i_uid::double precision
     ;
  RETURN t_name;
END;
$BODY$
  LANGUAGE plpgsql STABLE SECURITY DEFINER
  COST 100;
ALTER FUNCTION get_obj_name_by_uid(character varying)
  OWNER TO owner_track;
GRANT EXECUTE ON FUNCTION get_obj_name_by_uid(character varying) TO public;
GRANT EXECUTE ON FUNCTION get_obj_name_by_uid(character varying) TO owner_track;
GRANT EXECUTE ON FUNCTION get_obj_name_by_uid(character varying) TO track_server_all;
COMMENT ON FUNCTION get_obj_name_by_uid(character varying) IS 'Процедура получения наименования объекта по ИД модуля';
