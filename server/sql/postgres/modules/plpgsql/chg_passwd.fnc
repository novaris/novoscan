CREATE OR REPLACE FUNCTION chg_passwd
 (i_acct   IN INT8
 ,t_passwd IN TEXT
 )
  RETURNS void AS
$BODY$DECLARE
  v_login accounts.acct_login%TYPE;
BEGIN
  SELECT acct_login INTO v_login 
    FROM accounts 
   WHERE acct_id = i_acct;
  IF v_login IS NULL THEN
    RAISE EXCEPTION 'User whith ID : "%" not found', i_acct;
  END IF;
  UPDATE accounts SET acct_passwd = mkpasswd(t_passwd)  WHERE acct_id = i_acct;
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER;

ALTER FUNCTION chg_passwd
 (INT8
 ,TEXT
 ) OWNER TO owner_track;
GRANT EXECUTE ON FUNCTION chg_passwd
 (INT8
 ,TEXT
 ) TO owner_track;
GRANT EXECUTE ON FUNCTION chg_passwd
 (INT8
 ,TEXT
 ) TO t02_adm_www;
GRANT EXECUTE ON FUNCTION chg_passwd
 (INT8
 ,TEXT
 ) TO t02_adm_dev;
COMMENT ON FUNCTION chg_passwd
 (INT8
 ,TEXT
 ) IS 'Процедура изменения пароля клиента по идентификатрой аккаунта без проверки старого пароля';
