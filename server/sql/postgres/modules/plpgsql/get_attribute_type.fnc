CREATE OR REPLACE FUNCTION get_attribute_type(attrid bigint)
  RETURNS character varying AS
$BODY$
DECLARE
  a_name character varying(30);
  gatn CURSOR(n_id BIGINT)
    IS
    SELECT r.attr_type
      FROM attributes r
     WHERE r.attr_id = n_id
     ;

BEGIN
  OPEN gatn(attrid);
  FETCH gatn INTO a_name;
  CLOSE gatn;
  RETURN a_name;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE SECURITY DEFINER
  COST 100;
ALTER FUNCTION get_attribute_type(bigint)
  OWNER TO owner_track;

GRANT EXECUTE ON FUNCTION get_attribute_type(bigint) TO public;
GRANT EXECUTE ON FUNCTION get_attribute_type(bigint) TO owner_track;
GRANT EXECUTE ON FUNCTION get_attribute_type(bigint) TO track_server_all;
COMMENT ON FUNCTION get_attribute_type(bigint) IS 'Тип атрибута';

