-- Function: get_acl_obj_name(bigint, bigint)

-- DROP FUNCTION get_acl_obj_name(bigint, bigint);

CREATE OR REPLACE FUNCTION get_acl_obj_name(i_object bigint, i_object_type bigint)
  RETURNS text AS
$BODY$
DECLARE
  resp	  TEXT;
  rec     RECORD;
  
BEGIN
  resp := '';
  IF (i_object_type = 100) THEN
    SELECT acct_login||' ('||acct_name||')' INTO resp FROM accounts WHERE acct_id = i_object;
  ELSIF (i_object_type = 101) THEN
    resp := get_obj_name(i_object)||' ('||get_obj_desc(i_object)||')';
  ELSIF (i_object_type = 102) THEN
    SELECT spmd_name INTO resp FROM sprv_modules WHERE spmd_id = i_object;
  ELSIF (i_object_type = 103) THEN
    SELECT spcl_name INTO resp FROM sprv_clients WHERE spcl_id = i_object;
  ELSIF (i_object_type = 104) THEN
    SELECT spdp_name INTO resp FROM sprv_departs WHERE spdp_id = i_object;
  ELSE
    resp := 'Имя не определено'; 
  END IF;
  
  RETURN resp;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;
ALTER FUNCTION get_acl_obj_name(bigint, bigint) OWNER TO owner_track;
COMMENT ON FUNCTION get_acl_obj_name(bigint, bigint) IS 'Имя объекта доступа';
