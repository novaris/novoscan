-- Function: get_access_uid(bigint, character varying)

-- DROP FUNCTION get_access_uid(bigint, character varying);

CREATE OR REPLACE FUNCTION get_access_uid(i_acct_id bigint, i_uid character varying)
  RETURNS integer AS
$BODY$DECLARE
  is_grant_object CURSOR (acct BIGINT, uid VARCHAR)
    FOR
      SELECT 1
        FROM sprv_objects
            ,sprv_clients
            ,sprv_departs
            ,account_lists
            ,sprv_sensors
	    ,sprv_modules
       WHERE spcl_spdp_id = spdp_id
         AND spmd_spob_id = spob_id
         AND spmd_id = spsn_spmd_id
         AND (accl_ref_id1 = acct
          AND accl_ref_type1 = 100
	  AND accl_ref_type2 = 101
	  AND spob_id = accl_ref_id2
	  AND spob_spcl_id = spcl_id
	  AND spcl_spdp_id = spdp_id
        ) 
        AND spmd_uid::VARCHAR = uid
        LIMIT 1 
       ;

  ret INTEGER;
BEGIN
  OPEN is_grant_object(i_acct_id, i_uid);
  FETCH is_grant_object INTO ret;
  CLOSE is_grant_object;
  IF ret IS NULL THEN
    ret := 0; 
  END IF;
  RETURN ret;
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION get_access_uid(bigint, character varying)
  OWNER TO owner_track;
GRANT EXECUTE ON FUNCTION get_access_uid(i_acct_id bigint, i_uid character varying) TO public;
GRANT EXECUTE ON FUNCTION get_access_uid(i_acct_id bigint, i_uid character varying) TO owner_track;
GRANT EXECUTE ON FUNCTION get_access_uid(i_acct_id bigint, i_uid character varying) TO track_server_all;
COMMENT ON FUNCTION get_access_uid(i_acct_id bigint, i_uid character varying) IS 'Проверка доступа к UID';  
