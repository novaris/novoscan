CREATE OR REPLACE FUNCTION chk_login
 (ac_login varchar -- Логин
 ,ac_passwd varchar -- Пароль
 )
 RETURNS int8 AS
$BODY$
DECLARE
  n_ac int8;
  v_ac_passwd accounts.acct_passwd%TYPE;
  v_passwd accounts.acct_passwd%TYPE;
  v_salt accounts.acct_passwd%TYPE;
  v_evlg int8;
  v_type varchar(4) := 'psql';
  v_sql varchar(9) := 'chk_login';
  v_date varchar(19) := to_char(now(),'YYYY.MM.DD HH24:MI:SS');
BEGIN
  SELECT acct_id
        ,acct_passwd
    INTO n_ac
        ,v_ac_passwd
    FROM accounts
   WHERE UPPER(acct_login)=UPPER(trim(ac_login))
   ;
  IF n_ac IS NOT NULL THEN
    IF v_ac_passwd LIKE '$1$%0$%' THEN
      v_salt := SUBSTRING(v_ac_passwd, E'^(\\$1\\$.+)\\$.*$');
      v_passwd := mkpasswd_salt(ac_passwd, v_salt);
    ELSE
      v_passwd := ac_passwd;
    END IF;
    IF v_passwd = v_ac_passwd THEN
      select add_event(0::integer,current_schema()::varchar,0::integer,v_type,1::integer,v_sql,ac_login::text,'Успешный вход.'::text) INTO v_evlg;
      n_ac := n_ac;
    ELSE
      n_ac := NULL;
      RAISE EXCEPTION '[%] Incorect Password : "%" , "%"', v_date, ac_login, ac_passwd;
    END IF;
  ELSE
    n_ac := NULL;
    RAISE EXCEPTION '[%] User not found : "%"', v_date, ac_login;
  END IF;
  RETURN n_ac;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER;

ALTER FUNCTION chk_login
 (ac_login varchar
 ,ac_passwd varchar
 ) OWNER TO owner_track;

REVOKE EXECUTE ON FUNCTION chk_login
 (ac_login varchar
 ,ac_passwd varchar
 ) FROM public;

GRANT EXECUTE ON FUNCTION chk_login
 (ac_login varchar
 ,ac_passwd varchar
 ) TO owner_track;

GRANT EXECUTE ON FUNCTION chk_login
 (ac_login varchar
 ,ac_passwd varchar
 ) TO track_server_all;

REVOKE ALL ON FUNCTION chk_login
 (ac_login varchar
 ,ac_passwd varchar
 ) FROM public;

COMMENT ON FUNCTION chk_login
 (ac_login varchar
 ,ac_passwd varchar
 ) IS 'Процедура проверки пароля';

-- Function: owner_track.chk_login(character varying, character varying, character varying)

-- DROP FUNCTION owner_track.chk_login(character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION owner_track.chk_login(ac_login character varying, ac_passwd character varying, ac_ip character varying)
  RETURNS bigint AS
$BODY$
DECLARE
  n_ac int8;
  v_ac_passwd accounts.acct_passwd%TYPE;
  v_passwd accounts.acct_passwd%TYPE;
  v_salt accounts.acct_passwd%TYPE;
  v_evlg int8;
  v_type varchar(4) := 'psql';
  v_sql varchar(9) := 'chk_login';
  v_date varchar(19) := to_char(now(),'YYYY.MM.DD HH24:MI:SS');
BEGIN
  SELECT acct_id
        ,acct_passwd
    INTO n_ac
        ,v_ac_passwd
    FROM accounts
   WHERE UPPER(acct_login)=UPPER(trim(ac_login))
   ;
  IF n_ac IS NOT NULL THEN
    IF v_ac_passwd LIKE '$1$%0$%' THEN
      v_salt := SUBSTRING(v_ac_passwd, E'^(\\$1\\$.+)\\$.*$');
      v_passwd := mkpasswd_salt(ac_passwd, v_salt);
    ELSE
      v_passwd := ac_passwd;
    END IF;
    IF v_passwd = v_ac_passwd THEN
      select add_event(0::integer,current_schema()::varchar,0::integer,v_type,1::integer,v_sql,ac_login::text,('Успешный вход: '||ac_ip)::text) INTO v_evlg;
      n_ac := n_ac;
    ELSE
      n_ac := NULL;
      RAISE EXCEPTION '[%] Incorect Password : "%" , "%", "%"', v_date, ac_login, ac_passwd, ac_ip;
    END IF;
  ELSE
    n_ac := NULL;
    RAISE EXCEPTION '[%] User not found : "%", "%"', v_date, ac_login, ac_ip;
  END IF;
  RETURN n_ac;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE SECURITY DEFINER
  COST 100;
ALTER FUNCTION owner_track.chk_login(character varying, character varying, character varying)
  OWNER TO owner_track;
GRANT EXECUTE ON FUNCTION owner_track.chk_login(character varying, character varying, character varying) TO public;
GRANT EXECUTE ON FUNCTION owner_track.chk_login(character varying, character varying, character varying) TO owner_track;
GRANT EXECUTE ON FUNCTION owner_track.chk_login(character varying, character varying, character varying) TO track_server_all;
COMMENT ON FUNCTION owner_track.chk_login(character varying, character varying, character varying) IS 'Процедура проверки пароля';

