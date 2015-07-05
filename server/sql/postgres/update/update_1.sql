-- Create Partititon on Data_Sensor
DROP TABLE data_sensor_values_p201406 CASCADE;
DROP TABLE data_sensor_values_p201407 CASCADE;
DROP TABLE data_sensor_values_p201408 CASCADE;
DROP TABLE data_sensor_values_p201409 CASCADE;
DROP TABLE data_sensor_values_p201410 CASCADE;
DROP TABLE data_sensor_values_p201411 CASCADE;
DROP TABLE data_sensor_values_p201412 CASCADE;
DROP TABLE data_sensor_values_p201501 CASCADE;
DROP TABLE data_sensor_values_p201502 CASCADE;
DROP TABLE data_sensor_values_p201503 CASCADE;
DROP TABLE data_sensor_values_p201504 CASCADE;
DROP TABLE data_sensor_values_p201505 CASCADE;
DROP TABLE data_sensor_values_p201506 CASCADE;
DROP TABLE data_sensor_values_p201507 CASCADE;
DROP TABLE data_sensor_values_p201508 CASCADE;
DROP TABLE data_sensor_values_p201509 CASCADE;
DROP TABLE data_sensor_values_p201510 CASCADE;
DROP TABLE data_sensor_values_p201511 CASCADE;
DROP TABLE data_sensor_values_p201512 CASCADE;
DROP TABLE data_sensor_values_p201601 CASCADE;
DROP TABLE data_sensor_values_p201602 CASCADE;
DROP TABLE data_sensor_values_p201603 CASCADE;
DROP TABLE data_sensor_values_p201604 CASCADE;
DROP TABLE data_sensor_values_p201605 CASCADE;
DROP TABLE data_sensor_values_p201606 CASCADE;
DROP TABLE data_sensor_values_p201607 CASCADE;
DROP TABLE data_sensor_values_p201608 CASCADE;
DROP TABLE data_sensor_values_p201609 CASCADE;
DROP TABLE data_sensor_values_p201610 CASCADE;
DROP TABLE data_sensor_values_p201611 CASCADE;
DROP TABLE data_sensor_values_p201612 CASCADE;
DROP TABLE data_sensor_values_p201701 CASCADE;
DROP TABLE data_sensor_values_p201702 CASCADE;
DROP TABLE data_sensor_values_p201703 CASCADE;
DROP TABLE data_sensor_values_p201704 CASCADE;
DROP TABLE data_sensor_values_p201705 CASCADE;
DROP TABLE data_sensor_values_p201706 CASCADE;
DROP TABLE data_sensor_values_p201707 CASCADE;
DROP TABLE data_sensor_values_p201708 CASCADE;
DROP TABLE data_sensor_values_p201709 CASCADE;
DROP TABLE data_sensor_values_p201710 CASCADE;
DROP TABLE data_sensor_values_p201711 CASCADE;
DROP TABLE data_sensor_values_p201712 CASCADE;
DROP TABLE data_sensor_values_p201801 CASCADE;
DROP TABLE data_sensor_values_p201802 CASCADE;
DROP TABLE data_sensor_values_p201803 CASCADE;
DROP TABLE data_sensor_values_p201804 CASCADE;
DROP TABLE data_sensor_values_p201805 CASCADE;
DROP TABLE data_sensor_values_p201806 CASCADE;
DROP TABLE data_sensor_values_p201807 CASCADE;
DROP TABLE data_sensor_values_p201808 CASCADE;
DROP TABLE data_sensor_values_p201809 CASCADE;
DROP TABLE data_sensor_values_p201810 CASCADE;
DROP TABLE data_sensor_values_p201811 CASCADE;
DROP TABLE data_sensor_values_p201812 CASCADE;
DROP TABLE data_sensor_values_p201901 CASCADE;
DROP TABLE data_sensor_values_p201902 CASCADE;
DROP TABLE data_sensor_values_p201903 CASCADE;
DROP TABLE data_sensor_values_p201904 CASCADE;
DROP TABLE data_sensor_values_p201905 CASCADE;
DROP TABLE data_sensor_values_p201906 CASCADE;
DROP TABLE data_sensor_values_p201907 CASCADE;
DROP TABLE data_sensor_values_p201908 CASCADE;
DROP TABLE data_sensor_values_p201909 CASCADE;
DROP TABLE data_sensor_values_p201910 CASCADE;
DROP TABLE data_sensor_values_p201911 CASCADE;
DROP TABLE data_sensor_values_p201912 CASCADE;
DROP TABLE data_sensor_values_p202001 CASCADE;
DROP TABLE data_sensor_values_p202002 CASCADE;
DROP TABLE data_sensor_values_p202003 CASCADE;
DROP TABLE data_sensor_values_p202004 CASCADE;
DROP TABLE data_sensor_values_p202005 CASCADE;
DROP TABLE data_sensor_values_p202006 CASCADE;
DROP TABLE data_sensor_values_p202007 CASCADE;
DROP TABLE data_sensor_values_p202008 CASCADE;
DROP TABLE data_sensor_values_p202009 CASCADE;
DROP TABLE data_sensor_values_p202010 CASCADE;
DROP TABLE data_sensor_values_p202011 CASCADE;
DROP TABLE data_sensor_values_p202012 CASCADE;
DROP TABLE data_sensor_values_p202101 CASCADE;
DROP TABLE data_sensor_values_p202102 CASCADE;
DROP TABLE data_sensor_values_p202103 CASCADE;
DROP TABLE data_sensor_values_p202104 CASCADE;
DROP TABLE data_sensor_values_p202105 CASCADE;
DROP TABLE data_sensor_values_p202106 CASCADE;
DROP TABLE data_sensor_values_p202107 CASCADE;
DROP TABLE data_sensor_values_p202108 CASCADE;
DROP TABLE data_sensor_values_p202109 CASCADE;
DROP TABLE data_sensor_values_p202110 CASCADE;
DROP TABLE data_sensor_values_p202111 CASCADE;
DROP TABLE data_sensor_values_p202112 CASCADE;
DROP TABLE data_sensor_values_p202201 CASCADE;
DROP TABLE data_sensor_values_p202202 CASCADE;
DROP TABLE data_sensor_values_p202203 CASCADE;
DROP TABLE data_sensor_values_p202204 CASCADE;
DROP TABLE data_sensor_values_p202205 CASCADE;
DROP TABLE data_sensor_values_p202206 CASCADE;
DROP TABLE data_sensor_values_p202207 CASCADE;
DROP TABLE data_sensor_values_p202208 CASCADE;
DROP TABLE data_sensor_values_p202209 CASCADE;
DROP TABLE data_sensor_values CASCADE;
DROP TABLE data_sensor_last_values CASCADE;




















CREATE TABLE DATA_SENSOR_VALUES
(DASV_ID BIGINT NOT NULL DEFAULT NEXTVAL('DASV_SEQ')
,DASV_SPMD_ID BIGINT NOT NULL
,DASV_DASN_ID BIGINT
,DASV_KEY  VARCHAR(10) NOT NULL
,DASV_VALUE NUMERIC
,DASV_DATETIME TIMESTAMP NOT NULL
,PRIMARY KEY (DASV_ID)
) TABLESPACE USER_DATA;

CREATE TABLE DATA_SENSOR_LAST_VALUES
(DALV_ID BIGINT NOT NULL DEFAULT NEXTVAL('DALV_SEQ')
,DALV_SPMD_ID BIGINT NOT NULL
,DALV_DASL_ID BIGINT
,DALV_KEY  VARCHAR(10) NOT NULL
,DALV_VALUE NUMERIC
,DALV_DATETIME TIMESTAMP NOT NULL
,DALV_DTM TIMESTAMP NOT NULL
,CONSTRAINT DALV_DASL_KEY_UK UNIQUE (DALV_SPMD_ID, DALV_KEY)
,PRIMARY KEY (DALV_ID)
) TABLESPACE USER_DATA;


-- Create Partititon on Data_Sensor_Values
CREATE TABLE data_sensor_values_p201406 
(CHECK ( dasv_datetime >= DATE '2014-06-01' AND dasv_datetime < DATE '2014-07-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201406 ON data_sensor_values_p201406 (dasv_id);
CREATE INDEX dasv_spmd_i201406 ON data_sensor_values_p201406 (dasv_spmd_id);
CREATE INDEX dasv_key_i201406 ON data_sensor_values_p201406 (dasv_key);
CREATE INDEX dasv_datetime_i201406 ON data_sensor_values_p201406 (dasv_datetime);
CREATE RULE data_sensor_values_r201406 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2014-06-01' AND dasv_datetime < DATE '2014-07-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201406 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201407 
(CHECK ( dasv_datetime >= DATE '2014-07-01' AND dasv_datetime < DATE '2014-08-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201407 ON data_sensor_values_p201407 (dasv_id);
CREATE INDEX dasv_spmd_i201407 ON data_sensor_values_p201407 (dasv_spmd_id);
CREATE INDEX dasv_key_i201407 ON data_sensor_values_p201407 (dasv_key);
CREATE INDEX dasv_datetime_i201407 ON data_sensor_values_p201407 (dasv_datetime);
CREATE RULE data_sensor_values_r201407 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2014-07-01' AND dasv_datetime < DATE '2014-08-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201407 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201408 
(CHECK ( dasv_datetime >= DATE '2014-08-01' AND dasv_datetime < DATE '2014-09-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201408 ON data_sensor_values_p201408 (dasv_id);
CREATE INDEX dasv_spmd_i201408 ON data_sensor_values_p201408 (dasv_spmd_id);
CREATE INDEX dasv_key_i201408 ON data_sensor_values_p201408 (dasv_key);
CREATE INDEX dasv_datetime_i201408 ON data_sensor_values_p201408 (dasv_datetime);
CREATE RULE data_sensor_values_r201408 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2014-08-01' AND dasv_datetime < DATE '2014-09-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201408 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201409 
(CHECK ( dasv_datetime >= DATE '2014-09-01' AND dasv_datetime < DATE '2014-10-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201409 ON data_sensor_values_p201409 (dasv_id);
CREATE INDEX dasv_spmd_i201409 ON data_sensor_values_p201409 (dasv_spmd_id);
CREATE INDEX dasv_key_i201409 ON data_sensor_values_p201409 (dasv_key);
CREATE INDEX dasv_datetime_i201409 ON data_sensor_values_p201409 (dasv_datetime);
CREATE RULE data_sensor_values_r201409 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2014-09-01' AND dasv_datetime < DATE '2014-10-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201409 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201410 
(CHECK ( dasv_datetime >= DATE '2014-10-01' AND dasv_datetime < DATE '2014-11-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201410 ON data_sensor_values_p201410 (dasv_id);
CREATE INDEX dasv_spmd_i201410 ON data_sensor_values_p201410 (dasv_spmd_id);
CREATE INDEX dasv_key_i201410 ON data_sensor_values_p201410 (dasv_key);
CREATE INDEX dasv_datetime_i201410 ON data_sensor_values_p201410 (dasv_datetime);
CREATE RULE data_sensor_values_r201410 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2014-10-01' AND dasv_datetime < DATE '2014-11-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201410 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201411 
(CHECK ( dasv_datetime >= DATE '2014-11-01' AND dasv_datetime < DATE '2014-12-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201411 ON data_sensor_values_p201411 (dasv_id);
CREATE INDEX dasv_spmd_i201411 ON data_sensor_values_p201411 (dasv_spmd_id);
CREATE INDEX dasv_key_i201411 ON data_sensor_values_p201411 (dasv_key);
CREATE INDEX dasv_datetime_i201411 ON data_sensor_values_p201411 (dasv_datetime);
CREATE RULE data_sensor_values_r201411 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2014-11-01' AND dasv_datetime < DATE '2014-12-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201411 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201412 
(CHECK ( dasv_datetime >= DATE '2014-12-01' AND dasv_datetime < DATE '2015-01-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201412 ON data_sensor_values_p201412 (dasv_id);
CREATE INDEX dasv_spmd_i201412 ON data_sensor_values_p201412 (dasv_spmd_id);
CREATE INDEX dasv_key_i201412 ON data_sensor_values_p201412 (dasv_key);
CREATE INDEX dasv_datetime_i201412 ON data_sensor_values_p201412 (dasv_datetime);
CREATE RULE data_sensor_values_r201412 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2014-12-01' AND dasv_datetime < DATE '2015-01-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201412 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201501 
(CHECK ( dasv_datetime >= DATE '2015-01-01' AND dasv_datetime < DATE '2015-02-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201501 ON data_sensor_values_p201501 (dasv_id);
CREATE INDEX dasv_spmd_i201501 ON data_sensor_values_p201501 (dasv_spmd_id);
CREATE INDEX dasv_key_i201501 ON data_sensor_values_p201501 (dasv_key);
CREATE INDEX dasv_datetime_i201501 ON data_sensor_values_p201501 (dasv_datetime);
CREATE RULE data_sensor_values_r201501 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2015-01-01' AND dasv_datetime < DATE '2015-02-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201501 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201502 
(CHECK ( dasv_datetime >= DATE '2015-02-01' AND dasv_datetime < DATE '2015-03-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201502 ON data_sensor_values_p201502 (dasv_id);
CREATE INDEX dasv_spmd_i201502 ON data_sensor_values_p201502 (dasv_spmd_id);
CREATE INDEX dasv_key_i201502 ON data_sensor_values_p201502 (dasv_key);
CREATE INDEX dasv_datetime_i201502 ON data_sensor_values_p201502 (dasv_datetime);
CREATE RULE data_sensor_values_r201502 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2015-02-01' AND dasv_datetime < DATE '2015-03-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201502 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201503 
(CHECK ( dasv_datetime >= DATE '2015-03-01' AND dasv_datetime < DATE '2015-04-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201503 ON data_sensor_values_p201503 (dasv_id);
CREATE INDEX dasv_spmd_i201503 ON data_sensor_values_p201503 (dasv_spmd_id);
CREATE INDEX dasv_key_i201503 ON data_sensor_values_p201503 (dasv_key);
CREATE INDEX dasv_datetime_i201503 ON data_sensor_values_p201503 (dasv_datetime);
CREATE RULE data_sensor_values_r201503 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2015-03-01' AND dasv_datetime < DATE '2015-04-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201503 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201504 
(CHECK ( dasv_datetime >= DATE '2015-04-01' AND dasv_datetime < DATE '2015-05-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201504 ON data_sensor_values_p201504 (dasv_id);
CREATE INDEX dasv_spmd_i201504 ON data_sensor_values_p201504 (dasv_spmd_id);
CREATE INDEX dasv_key_i201504 ON data_sensor_values_p201504 (dasv_key);
CREATE INDEX dasv_datetime_i201504 ON data_sensor_values_p201504 (dasv_datetime);
CREATE RULE data_sensor_values_r201504 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2015-04-01' AND dasv_datetime < DATE '2015-05-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201504 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201505 
(CHECK ( dasv_datetime >= DATE '2015-05-01' AND dasv_datetime < DATE '2015-06-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201505 ON data_sensor_values_p201505 (dasv_id);
CREATE INDEX dasv_spmd_i201505 ON data_sensor_values_p201505 (dasv_spmd_id);
CREATE INDEX dasv_key_i201505 ON data_sensor_values_p201505 (dasv_key);
CREATE INDEX dasv_datetime_i201505 ON data_sensor_values_p201505 (dasv_datetime);
CREATE RULE data_sensor_values_r201505 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2015-05-01' AND dasv_datetime < DATE '2015-06-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201505 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201506 
(CHECK ( dasv_datetime >= DATE '2015-06-01' AND dasv_datetime < DATE '2015-07-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201506 ON data_sensor_values_p201506 (dasv_id);
CREATE INDEX dasv_spmd_i201506 ON data_sensor_values_p201506 (dasv_spmd_id);
CREATE INDEX dasv_key_i201506 ON data_sensor_values_p201506 (dasv_key);
CREATE INDEX dasv_datetime_i201506 ON data_sensor_values_p201506 (dasv_datetime);
CREATE RULE data_sensor_values_r201506 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2015-06-01' AND dasv_datetime < DATE '2015-07-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201506 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201507 
(CHECK ( dasv_datetime >= DATE '2015-07-01' AND dasv_datetime < DATE '2015-08-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201507 ON data_sensor_values_p201507 (dasv_id);
CREATE INDEX dasv_spmd_i201507 ON data_sensor_values_p201507 (dasv_spmd_id);
CREATE INDEX dasv_key_i201507 ON data_sensor_values_p201507 (dasv_key);
CREATE INDEX dasv_datetime_i201507 ON data_sensor_values_p201507 (dasv_datetime);
CREATE RULE data_sensor_values_r201507 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2015-07-01' AND dasv_datetime < DATE '2015-08-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201507 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201508 
(CHECK ( dasv_datetime >= DATE '2015-08-01' AND dasv_datetime < DATE '2015-09-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201508 ON data_sensor_values_p201508 (dasv_id);
CREATE INDEX dasv_spmd_i201508 ON data_sensor_values_p201508 (dasv_spmd_id);
CREATE INDEX dasv_key_i201508 ON data_sensor_values_p201508 (dasv_key);
CREATE INDEX dasv_datetime_i201508 ON data_sensor_values_p201508 (dasv_datetime);
CREATE RULE data_sensor_values_r201508 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2015-08-01' AND dasv_datetime < DATE '2015-09-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201508 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201509 
(CHECK ( dasv_datetime >= DATE '2015-09-01' AND dasv_datetime < DATE '2015-10-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201509 ON data_sensor_values_p201509 (dasv_id);
CREATE INDEX dasv_spmd_i201509 ON data_sensor_values_p201509 (dasv_spmd_id);
CREATE INDEX dasv_key_i201509 ON data_sensor_values_p201509 (dasv_key);
CREATE INDEX dasv_datetime_i201509 ON data_sensor_values_p201509 (dasv_datetime);
CREATE RULE data_sensor_values_r201509 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2015-09-01' AND dasv_datetime < DATE '2015-10-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201509 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201510 
(CHECK ( dasv_datetime >= DATE '2015-10-01' AND dasv_datetime < DATE '2015-11-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201510 ON data_sensor_values_p201510 (dasv_id);
CREATE INDEX dasv_spmd_i201510 ON data_sensor_values_p201510 (dasv_spmd_id);
CREATE INDEX dasv_key_i201510 ON data_sensor_values_p201510 (dasv_key);
CREATE INDEX dasv_datetime_i201510 ON data_sensor_values_p201510 (dasv_datetime);
CREATE RULE data_sensor_values_r201510 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2015-10-01' AND dasv_datetime < DATE '2015-11-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201510 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201511 
(CHECK ( dasv_datetime >= DATE '2015-11-01' AND dasv_datetime < DATE '2015-12-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201511 ON data_sensor_values_p201511 (dasv_id);
CREATE INDEX dasv_spmd_i201511 ON data_sensor_values_p201511 (dasv_spmd_id);
CREATE INDEX dasv_key_i201511 ON data_sensor_values_p201511 (dasv_key);
CREATE INDEX dasv_datetime_i201511 ON data_sensor_values_p201511 (dasv_datetime);
CREATE RULE data_sensor_values_r201511 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2015-11-01' AND dasv_datetime < DATE '2015-12-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201511 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201512 
(CHECK ( dasv_datetime >= DATE '2015-12-01' AND dasv_datetime < DATE '2016-01-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201512 ON data_sensor_values_p201512 (dasv_id);
CREATE INDEX dasv_spmd_i201512 ON data_sensor_values_p201512 (dasv_spmd_id);
CREATE INDEX dasv_key_i201512 ON data_sensor_values_p201512 (dasv_key);
CREATE INDEX dasv_datetime_i201512 ON data_sensor_values_p201512 (dasv_datetime);
CREATE RULE data_sensor_values_r201512 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2015-12-01' AND dasv_datetime < DATE '2016-01-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201512 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201601 
(CHECK ( dasv_datetime >= DATE '2016-01-01' AND dasv_datetime < DATE '2016-02-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201601 ON data_sensor_values_p201601 (dasv_id);
CREATE INDEX dasv_spmd_i201601 ON data_sensor_values_p201601 (dasv_spmd_id);
CREATE INDEX dasv_key_i201601 ON data_sensor_values_p201601 (dasv_key);
CREATE INDEX dasv_datetime_i201601 ON data_sensor_values_p201601 (dasv_datetime);
CREATE RULE data_sensor_values_r201601 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2016-01-01' AND dasv_datetime < DATE '2016-02-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201601 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201602 
(CHECK ( dasv_datetime >= DATE '2016-02-01' AND dasv_datetime < DATE '2016-03-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201602 ON data_sensor_values_p201602 (dasv_id);
CREATE INDEX dasv_spmd_i201602 ON data_sensor_values_p201602 (dasv_spmd_id);
CREATE INDEX dasv_key_i201602 ON data_sensor_values_p201602 (dasv_key);
CREATE INDEX dasv_datetime_i201602 ON data_sensor_values_p201602 (dasv_datetime);
CREATE RULE data_sensor_values_r201602 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2016-02-01' AND dasv_datetime < DATE '2016-03-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201602 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201603 
(CHECK ( dasv_datetime >= DATE '2016-03-01' AND dasv_datetime < DATE '2016-04-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201603 ON data_sensor_values_p201603 (dasv_id);
CREATE INDEX dasv_spmd_i201603 ON data_sensor_values_p201603 (dasv_spmd_id);
CREATE INDEX dasv_key_i201603 ON data_sensor_values_p201603 (dasv_key);
CREATE INDEX dasv_datetime_i201603 ON data_sensor_values_p201603 (dasv_datetime);
CREATE RULE data_sensor_values_r201603 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2016-03-01' AND dasv_datetime < DATE '2016-04-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201603 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201604 
(CHECK ( dasv_datetime >= DATE '2016-04-01' AND dasv_datetime < DATE '2016-05-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201604 ON data_sensor_values_p201604 (dasv_id);
CREATE INDEX dasv_spmd_i201604 ON data_sensor_values_p201604 (dasv_spmd_id);
CREATE INDEX dasv_key_i201604 ON data_sensor_values_p201604 (dasv_key);
CREATE INDEX dasv_datetime_i201604 ON data_sensor_values_p201604 (dasv_datetime);
CREATE RULE data_sensor_values_r201604 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2016-04-01' AND dasv_datetime < DATE '2016-05-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201604 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201605 
(CHECK ( dasv_datetime >= DATE '2016-05-01' AND dasv_datetime < DATE '2016-06-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201605 ON data_sensor_values_p201605 (dasv_id);
CREATE INDEX dasv_spmd_i201605 ON data_sensor_values_p201605 (dasv_spmd_id);
CREATE INDEX dasv_key_i201605 ON data_sensor_values_p201605 (dasv_key);
CREATE INDEX dasv_datetime_i201605 ON data_sensor_values_p201605 (dasv_datetime);
CREATE RULE data_sensor_values_r201605 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2016-05-01' AND dasv_datetime < DATE '2016-06-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201605 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201606 
(CHECK ( dasv_datetime >= DATE '2016-06-01' AND dasv_datetime < DATE '2016-07-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201606 ON data_sensor_values_p201606 (dasv_id);
CREATE INDEX dasv_spmd_i201606 ON data_sensor_values_p201606 (dasv_spmd_id);
CREATE INDEX dasv_key_i201606 ON data_sensor_values_p201606 (dasv_key);
CREATE INDEX dasv_datetime_i201606 ON data_sensor_values_p201606 (dasv_datetime);
CREATE RULE data_sensor_values_r201606 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2016-06-01' AND dasv_datetime < DATE '2016-07-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201606 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201607 
(CHECK ( dasv_datetime >= DATE '2016-07-01' AND dasv_datetime < DATE '2016-08-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201607 ON data_sensor_values_p201607 (dasv_id);
CREATE INDEX dasv_spmd_i201607 ON data_sensor_values_p201607 (dasv_spmd_id);
CREATE INDEX dasv_key_i201607 ON data_sensor_values_p201607 (dasv_key);
CREATE INDEX dasv_datetime_i201607 ON data_sensor_values_p201607 (dasv_datetime);
CREATE RULE data_sensor_values_r201607 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2016-07-01' AND dasv_datetime < DATE '2016-08-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201607 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201608 
(CHECK ( dasv_datetime >= DATE '2016-08-01' AND dasv_datetime < DATE '2016-09-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201608 ON data_sensor_values_p201608 (dasv_id);
CREATE INDEX dasv_spmd_i201608 ON data_sensor_values_p201608 (dasv_spmd_id);
CREATE INDEX dasv_key_i201608 ON data_sensor_values_p201608 (dasv_key);
CREATE INDEX dasv_datetime_i201608 ON data_sensor_values_p201608 (dasv_datetime);
CREATE RULE data_sensor_values_r201608 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2016-08-01' AND dasv_datetime < DATE '2016-09-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201608 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201609 
(CHECK ( dasv_datetime >= DATE '2016-09-01' AND dasv_datetime < DATE '2016-10-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201609 ON data_sensor_values_p201609 (dasv_id);
CREATE INDEX dasv_spmd_i201609 ON data_sensor_values_p201609 (dasv_spmd_id);
CREATE INDEX dasv_key_i201609 ON data_sensor_values_p201609 (dasv_key);
CREATE INDEX dasv_datetime_i201609 ON data_sensor_values_p201609 (dasv_datetime);
CREATE RULE data_sensor_values_r201609 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2016-09-01' AND dasv_datetime < DATE '2016-10-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201609 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201610 
(CHECK ( dasv_datetime >= DATE '2016-10-01' AND dasv_datetime < DATE '2016-11-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201610 ON data_sensor_values_p201610 (dasv_id);
CREATE INDEX dasv_spmd_i201610 ON data_sensor_values_p201610 (dasv_spmd_id);
CREATE INDEX dasv_key_i201610 ON data_sensor_values_p201610 (dasv_key);
CREATE INDEX dasv_datetime_i201610 ON data_sensor_values_p201610 (dasv_datetime);
CREATE RULE data_sensor_values_r201610 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2016-10-01' AND dasv_datetime < DATE '2016-11-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201610 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201611 
(CHECK ( dasv_datetime >= DATE '2016-11-01' AND dasv_datetime < DATE '2016-12-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201611 ON data_sensor_values_p201611 (dasv_id);
CREATE INDEX dasv_spmd_i201611 ON data_sensor_values_p201611 (dasv_spmd_id);
CREATE INDEX dasv_key_i201611 ON data_sensor_values_p201611 (dasv_key);
CREATE INDEX dasv_datetime_i201611 ON data_sensor_values_p201611 (dasv_datetime);
CREATE RULE data_sensor_values_r201611 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2016-11-01' AND dasv_datetime < DATE '2016-12-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201611 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201612 
(CHECK ( dasv_datetime >= DATE '2016-12-01' AND dasv_datetime < DATE '2017-01-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201612 ON data_sensor_values_p201612 (dasv_id);
CREATE INDEX dasv_spmd_i201612 ON data_sensor_values_p201612 (dasv_spmd_id);
CREATE INDEX dasv_key_i201612 ON data_sensor_values_p201612 (dasv_key);
CREATE INDEX dasv_datetime_i201612 ON data_sensor_values_p201612 (dasv_datetime);
CREATE RULE data_sensor_values_r201612 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2016-12-01' AND dasv_datetime < DATE '2017-01-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201612 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201701 
(CHECK ( dasv_datetime >= DATE '2017-01-01' AND dasv_datetime < DATE '2017-02-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201701 ON data_sensor_values_p201701 (dasv_id);
CREATE INDEX dasv_spmd_i201701 ON data_sensor_values_p201701 (dasv_spmd_id);
CREATE INDEX dasv_key_i201701 ON data_sensor_values_p201701 (dasv_key);
CREATE INDEX dasv_datetime_i201701 ON data_sensor_values_p201701 (dasv_datetime);
CREATE RULE data_sensor_values_r201701 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2017-01-01' AND dasv_datetime < DATE '2017-02-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201701 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201702 
(CHECK ( dasv_datetime >= DATE '2017-02-01' AND dasv_datetime < DATE '2017-03-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201702 ON data_sensor_values_p201702 (dasv_id);
CREATE INDEX dasv_spmd_i201702 ON data_sensor_values_p201702 (dasv_spmd_id);
CREATE INDEX dasv_key_i201702 ON data_sensor_values_p201702 (dasv_key);
CREATE INDEX dasv_datetime_i201702 ON data_sensor_values_p201702 (dasv_datetime);
CREATE RULE data_sensor_values_r201702 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2017-02-01' AND dasv_datetime < DATE '2017-03-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201702 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201703 
(CHECK ( dasv_datetime >= DATE '2017-03-01' AND dasv_datetime < DATE '2017-04-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201703 ON data_sensor_values_p201703 (dasv_id);
CREATE INDEX dasv_spmd_i201703 ON data_sensor_values_p201703 (dasv_spmd_id);
CREATE INDEX dasv_key_i201703 ON data_sensor_values_p201703 (dasv_key);
CREATE INDEX dasv_datetime_i201703 ON data_sensor_values_p201703 (dasv_datetime);
CREATE RULE data_sensor_values_r201703 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2017-03-01' AND dasv_datetime < DATE '2017-04-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201703 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201704 
(CHECK ( dasv_datetime >= DATE '2017-04-01' AND dasv_datetime < DATE '2017-05-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201704 ON data_sensor_values_p201704 (dasv_id);
CREATE INDEX dasv_spmd_i201704 ON data_sensor_values_p201704 (dasv_spmd_id);
CREATE INDEX dasv_key_i201704 ON data_sensor_values_p201704 (dasv_key);
CREATE INDEX dasv_datetime_i201704 ON data_sensor_values_p201704 (dasv_datetime);
CREATE RULE data_sensor_values_r201704 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2017-04-01' AND dasv_datetime < DATE '2017-05-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201704 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201705 
(CHECK ( dasv_datetime >= DATE '2017-05-01' AND dasv_datetime < DATE '2017-06-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201705 ON data_sensor_values_p201705 (dasv_id);
CREATE INDEX dasv_spmd_i201705 ON data_sensor_values_p201705 (dasv_spmd_id);
CREATE INDEX dasv_key_i201705 ON data_sensor_values_p201705 (dasv_key);
CREATE INDEX dasv_datetime_i201705 ON data_sensor_values_p201705 (dasv_datetime);
CREATE RULE data_sensor_values_r201705 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2017-05-01' AND dasv_datetime < DATE '2017-06-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201705 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201706 
(CHECK ( dasv_datetime >= DATE '2017-06-01' AND dasv_datetime < DATE '2017-07-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201706 ON data_sensor_values_p201706 (dasv_id);
CREATE INDEX dasv_spmd_i201706 ON data_sensor_values_p201706 (dasv_spmd_id);
CREATE INDEX dasv_key_i201706 ON data_sensor_values_p201706 (dasv_key);
CREATE INDEX dasv_datetime_i201706 ON data_sensor_values_p201706 (dasv_datetime);
CREATE RULE data_sensor_values_r201706 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2017-06-01' AND dasv_datetime < DATE '2017-07-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201706 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201707 
(CHECK ( dasv_datetime >= DATE '2017-07-01' AND dasv_datetime < DATE '2017-08-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201707 ON data_sensor_values_p201707 (dasv_id);
CREATE INDEX dasv_spmd_i201707 ON data_sensor_values_p201707 (dasv_spmd_id);
CREATE INDEX dasv_key_i201707 ON data_sensor_values_p201707 (dasv_key);
CREATE INDEX dasv_datetime_i201707 ON data_sensor_values_p201707 (dasv_datetime);
CREATE RULE data_sensor_values_r201707 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2017-07-01' AND dasv_datetime < DATE '2017-08-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201707 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201708 
(CHECK ( dasv_datetime >= DATE '2017-08-01' AND dasv_datetime < DATE '2017-09-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201708 ON data_sensor_values_p201708 (dasv_id);
CREATE INDEX dasv_spmd_i201708 ON data_sensor_values_p201708 (dasv_spmd_id);
CREATE INDEX dasv_key_i201708 ON data_sensor_values_p201708 (dasv_key);
CREATE INDEX dasv_datetime_i201708 ON data_sensor_values_p201708 (dasv_datetime);
CREATE RULE data_sensor_values_r201708 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2017-08-01' AND dasv_datetime < DATE '2017-09-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201708 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201709 
(CHECK ( dasv_datetime >= DATE '2017-09-01' AND dasv_datetime < DATE '2017-10-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201709 ON data_sensor_values_p201709 (dasv_id);
CREATE INDEX dasv_spmd_i201709 ON data_sensor_values_p201709 (dasv_spmd_id);
CREATE INDEX dasv_key_i201709 ON data_sensor_values_p201709 (dasv_key);
CREATE INDEX dasv_datetime_i201709 ON data_sensor_values_p201709 (dasv_datetime);
CREATE RULE data_sensor_values_r201709 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2017-09-01' AND dasv_datetime < DATE '2017-10-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201709 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201710 
(CHECK ( dasv_datetime >= DATE '2017-10-01' AND dasv_datetime < DATE '2017-11-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201710 ON data_sensor_values_p201710 (dasv_id);
CREATE INDEX dasv_spmd_i201710 ON data_sensor_values_p201710 (dasv_spmd_id);
CREATE INDEX dasv_key_i201710 ON data_sensor_values_p201710 (dasv_key);
CREATE INDEX dasv_datetime_i201710 ON data_sensor_values_p201710 (dasv_datetime);
CREATE RULE data_sensor_values_r201710 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2017-10-01' AND dasv_datetime < DATE '2017-11-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201710 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201711 
(CHECK ( dasv_datetime >= DATE '2017-11-01' AND dasv_datetime < DATE '2017-12-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201711 ON data_sensor_values_p201711 (dasv_id);
CREATE INDEX dasv_spmd_i201711 ON data_sensor_values_p201711 (dasv_spmd_id);
CREATE INDEX dasv_key_i201711 ON data_sensor_values_p201711 (dasv_key);
CREATE INDEX dasv_datetime_i201711 ON data_sensor_values_p201711 (dasv_datetime);
CREATE RULE data_sensor_values_r201711 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2017-11-01' AND dasv_datetime < DATE '2017-12-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201711 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201712 
(CHECK ( dasv_datetime >= DATE '2017-12-01' AND dasv_datetime < DATE '2018-01-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201712 ON data_sensor_values_p201712 (dasv_id);
CREATE INDEX dasv_spmd_i201712 ON data_sensor_values_p201712 (dasv_spmd_id);
CREATE INDEX dasv_key_i201712 ON data_sensor_values_p201712 (dasv_key);
CREATE INDEX dasv_datetime_i201712 ON data_sensor_values_p201712 (dasv_datetime);
CREATE RULE data_sensor_values_r201712 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2017-12-01' AND dasv_datetime < DATE '2018-01-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201712 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201801 
(CHECK ( dasv_datetime >= DATE '2018-01-01' AND dasv_datetime < DATE '2018-02-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201801 ON data_sensor_values_p201801 (dasv_id);
CREATE INDEX dasv_spmd_i201801 ON data_sensor_values_p201801 (dasv_spmd_id);
CREATE INDEX dasv_key_i201801 ON data_sensor_values_p201801 (dasv_key);
CREATE INDEX dasv_datetime_i201801 ON data_sensor_values_p201801 (dasv_datetime);
CREATE RULE data_sensor_values_r201801 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2018-01-01' AND dasv_datetime < DATE '2018-02-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201801 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201802 
(CHECK ( dasv_datetime >= DATE '2018-02-01' AND dasv_datetime < DATE '2018-03-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201802 ON data_sensor_values_p201802 (dasv_id);
CREATE INDEX dasv_spmd_i201802 ON data_sensor_values_p201802 (dasv_spmd_id);
CREATE INDEX dasv_key_i201802 ON data_sensor_values_p201802 (dasv_key);
CREATE INDEX dasv_datetime_i201802 ON data_sensor_values_p201802 (dasv_datetime);
CREATE RULE data_sensor_values_r201802 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2018-02-01' AND dasv_datetime < DATE '2018-03-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201802 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201803 
(CHECK ( dasv_datetime >= DATE '2018-03-01' AND dasv_datetime < DATE '2018-04-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201803 ON data_sensor_values_p201803 (dasv_id);
CREATE INDEX dasv_spmd_i201803 ON data_sensor_values_p201803 (dasv_spmd_id);
CREATE INDEX dasv_key_i201803 ON data_sensor_values_p201803 (dasv_key);
CREATE INDEX dasv_datetime_i201803 ON data_sensor_values_p201803 (dasv_datetime);
CREATE RULE data_sensor_values_r201803 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2018-03-01' AND dasv_datetime < DATE '2018-04-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201803 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201804 
(CHECK ( dasv_datetime >= DATE '2018-04-01' AND dasv_datetime < DATE '2018-05-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201804 ON data_sensor_values_p201804 (dasv_id);
CREATE INDEX dasv_spmd_i201804 ON data_sensor_values_p201804 (dasv_spmd_id);
CREATE INDEX dasv_key_i201804 ON data_sensor_values_p201804 (dasv_key);
CREATE INDEX dasv_datetime_i201804 ON data_sensor_values_p201804 (dasv_datetime);
CREATE RULE data_sensor_values_r201804 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2018-04-01' AND dasv_datetime < DATE '2018-05-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201804 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201805 
(CHECK ( dasv_datetime >= DATE '2018-05-01' AND dasv_datetime < DATE '2018-06-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201805 ON data_sensor_values_p201805 (dasv_id);
CREATE INDEX dasv_spmd_i201805 ON data_sensor_values_p201805 (dasv_spmd_id);
CREATE INDEX dasv_key_i201805 ON data_sensor_values_p201805 (dasv_key);
CREATE INDEX dasv_datetime_i201805 ON data_sensor_values_p201805 (dasv_datetime);
CREATE RULE data_sensor_values_r201805 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2018-05-01' AND dasv_datetime < DATE '2018-06-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201805 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201806 
(CHECK ( dasv_datetime >= DATE '2018-06-01' AND dasv_datetime < DATE '2018-07-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201806 ON data_sensor_values_p201806 (dasv_id);
CREATE INDEX dasv_spmd_i201806 ON data_sensor_values_p201806 (dasv_spmd_id);
CREATE INDEX dasv_key_i201806 ON data_sensor_values_p201806 (dasv_key);
CREATE INDEX dasv_datetime_i201806 ON data_sensor_values_p201806 (dasv_datetime);
CREATE RULE data_sensor_values_r201806 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2018-06-01' AND dasv_datetime < DATE '2018-07-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201806 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201807 
(CHECK ( dasv_datetime >= DATE '2018-07-01' AND dasv_datetime < DATE '2018-08-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201807 ON data_sensor_values_p201807 (dasv_id);
CREATE INDEX dasv_spmd_i201807 ON data_sensor_values_p201807 (dasv_spmd_id);
CREATE INDEX dasv_key_i201807 ON data_sensor_values_p201807 (dasv_key);
CREATE INDEX dasv_datetime_i201807 ON data_sensor_values_p201807 (dasv_datetime);
CREATE RULE data_sensor_values_r201807 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2018-07-01' AND dasv_datetime < DATE '2018-08-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201807 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201808 
(CHECK ( dasv_datetime >= DATE '2018-08-01' AND dasv_datetime < DATE '2018-09-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201808 ON data_sensor_values_p201808 (dasv_id);
CREATE INDEX dasv_spmd_i201808 ON data_sensor_values_p201808 (dasv_spmd_id);
CREATE INDEX dasv_key_i201808 ON data_sensor_values_p201808 (dasv_key);
CREATE INDEX dasv_datetime_i201808 ON data_sensor_values_p201808 (dasv_datetime);
CREATE RULE data_sensor_values_r201808 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2018-08-01' AND dasv_datetime < DATE '2018-09-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201808 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201809 
(CHECK ( dasv_datetime >= DATE '2018-09-01' AND dasv_datetime < DATE '2018-10-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201809 ON data_sensor_values_p201809 (dasv_id);
CREATE INDEX dasv_spmd_i201809 ON data_sensor_values_p201809 (dasv_spmd_id);
CREATE INDEX dasv_key_i201809 ON data_sensor_values_p201809 (dasv_key);
CREATE INDEX dasv_datetime_i201809 ON data_sensor_values_p201809 (dasv_datetime);
CREATE RULE data_sensor_values_r201809 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2018-09-01' AND dasv_datetime < DATE '2018-10-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201809 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201810 
(CHECK ( dasv_datetime >= DATE '2018-10-01' AND dasv_datetime < DATE '2018-11-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201810 ON data_sensor_values_p201810 (dasv_id);
CREATE INDEX dasv_spmd_i201810 ON data_sensor_values_p201810 (dasv_spmd_id);
CREATE INDEX dasv_key_i201810 ON data_sensor_values_p201810 (dasv_key);
CREATE INDEX dasv_datetime_i201810 ON data_sensor_values_p201810 (dasv_datetime);
CREATE RULE data_sensor_values_r201810 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2018-10-01' AND dasv_datetime < DATE '2018-11-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201810 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201811 
(CHECK ( dasv_datetime >= DATE '2018-11-01' AND dasv_datetime < DATE '2018-12-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201811 ON data_sensor_values_p201811 (dasv_id);
CREATE INDEX dasv_spmd_i201811 ON data_sensor_values_p201811 (dasv_spmd_id);
CREATE INDEX dasv_key_i201811 ON data_sensor_values_p201811 (dasv_key);
CREATE INDEX dasv_datetime_i201811 ON data_sensor_values_p201811 (dasv_datetime);
CREATE RULE data_sensor_values_r201811 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2018-11-01' AND dasv_datetime < DATE '2018-12-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201811 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201812 
(CHECK ( dasv_datetime >= DATE '2018-12-01' AND dasv_datetime < DATE '2019-01-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201812 ON data_sensor_values_p201812 (dasv_id);
CREATE INDEX dasv_spmd_i201812 ON data_sensor_values_p201812 (dasv_spmd_id);
CREATE INDEX dasv_key_i201812 ON data_sensor_values_p201812 (dasv_key);
CREATE INDEX dasv_datetime_i201812 ON data_sensor_values_p201812 (dasv_datetime);
CREATE RULE data_sensor_values_r201812 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2018-12-01' AND dasv_datetime < DATE '2019-01-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201812 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201901 
(CHECK ( dasv_datetime >= DATE '2019-01-01' AND dasv_datetime < DATE '2019-02-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201901 ON data_sensor_values_p201901 (dasv_id);
CREATE INDEX dasv_spmd_i201901 ON data_sensor_values_p201901 (dasv_spmd_id);
CREATE INDEX dasv_key_i201901 ON data_sensor_values_p201901 (dasv_key);
CREATE INDEX dasv_datetime_i201901 ON data_sensor_values_p201901 (dasv_datetime);
CREATE RULE data_sensor_values_r201901 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2019-01-01' AND dasv_datetime < DATE '2019-02-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201901 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201902 
(CHECK ( dasv_datetime >= DATE '2019-02-01' AND dasv_datetime < DATE '2019-03-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201902 ON data_sensor_values_p201902 (dasv_id);
CREATE INDEX dasv_spmd_i201902 ON data_sensor_values_p201902 (dasv_spmd_id);
CREATE INDEX dasv_key_i201902 ON data_sensor_values_p201902 (dasv_key);
CREATE INDEX dasv_datetime_i201902 ON data_sensor_values_p201902 (dasv_datetime);
CREATE RULE data_sensor_values_r201902 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2019-02-01' AND dasv_datetime < DATE '2019-03-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201902 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201903 
(CHECK ( dasv_datetime >= DATE '2019-03-01' AND dasv_datetime < DATE '2019-04-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201903 ON data_sensor_values_p201903 (dasv_id);
CREATE INDEX dasv_spmd_i201903 ON data_sensor_values_p201903 (dasv_spmd_id);
CREATE INDEX dasv_key_i201903 ON data_sensor_values_p201903 (dasv_key);
CREATE INDEX dasv_datetime_i201903 ON data_sensor_values_p201903 (dasv_datetime);
CREATE RULE data_sensor_values_r201903 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2019-03-01' AND dasv_datetime < DATE '2019-04-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201903 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201904 
(CHECK ( dasv_datetime >= DATE '2019-04-01' AND dasv_datetime < DATE '2019-05-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201904 ON data_sensor_values_p201904 (dasv_id);
CREATE INDEX dasv_spmd_i201904 ON data_sensor_values_p201904 (dasv_spmd_id);
CREATE INDEX dasv_key_i201904 ON data_sensor_values_p201904 (dasv_key);
CREATE INDEX dasv_datetime_i201904 ON data_sensor_values_p201904 (dasv_datetime);
CREATE RULE data_sensor_values_r201904 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2019-04-01' AND dasv_datetime < DATE '2019-05-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201904 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201905 
(CHECK ( dasv_datetime >= DATE '2019-05-01' AND dasv_datetime < DATE '2019-06-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201905 ON data_sensor_values_p201905 (dasv_id);
CREATE INDEX dasv_spmd_i201905 ON data_sensor_values_p201905 (dasv_spmd_id);
CREATE INDEX dasv_key_i201905 ON data_sensor_values_p201905 (dasv_key);
CREATE INDEX dasv_datetime_i201905 ON data_sensor_values_p201905 (dasv_datetime);
CREATE RULE data_sensor_values_r201905 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2019-05-01' AND dasv_datetime < DATE '2019-06-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201905 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201906 
(CHECK ( dasv_datetime >= DATE '2019-06-01' AND dasv_datetime < DATE '2019-07-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201906 ON data_sensor_values_p201906 (dasv_id);
CREATE INDEX dasv_spmd_i201906 ON data_sensor_values_p201906 (dasv_spmd_id);
CREATE INDEX dasv_key_i201906 ON data_sensor_values_p201906 (dasv_key);
CREATE INDEX dasv_datetime_i201906 ON data_sensor_values_p201906 (dasv_datetime);
CREATE RULE data_sensor_values_r201906 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2019-06-01' AND dasv_datetime < DATE '2019-07-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201906 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201907 
(CHECK ( dasv_datetime >= DATE '2019-07-01' AND dasv_datetime < DATE '2019-08-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201907 ON data_sensor_values_p201907 (dasv_id);
CREATE INDEX dasv_spmd_i201907 ON data_sensor_values_p201907 (dasv_spmd_id);
CREATE INDEX dasv_key_i201907 ON data_sensor_values_p201907 (dasv_key);
CREATE INDEX dasv_datetime_i201907 ON data_sensor_values_p201907 (dasv_datetime);
CREATE RULE data_sensor_values_r201907 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2019-07-01' AND dasv_datetime < DATE '2019-08-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201907 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201908 
(CHECK ( dasv_datetime >= DATE '2019-08-01' AND dasv_datetime < DATE '2019-09-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201908 ON data_sensor_values_p201908 (dasv_id);
CREATE INDEX dasv_spmd_i201908 ON data_sensor_values_p201908 (dasv_spmd_id);
CREATE INDEX dasv_key_i201908 ON data_sensor_values_p201908 (dasv_key);
CREATE INDEX dasv_datetime_i201908 ON data_sensor_values_p201908 (dasv_datetime);
CREATE RULE data_sensor_values_r201908 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2019-08-01' AND dasv_datetime < DATE '2019-09-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201908 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201909 
(CHECK ( dasv_datetime >= DATE '2019-09-01' AND dasv_datetime < DATE '2019-10-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201909 ON data_sensor_values_p201909 (dasv_id);
CREATE INDEX dasv_spmd_i201909 ON data_sensor_values_p201909 (dasv_spmd_id);
CREATE INDEX dasv_key_i201909 ON data_sensor_values_p201909 (dasv_key);
CREATE INDEX dasv_datetime_i201909 ON data_sensor_values_p201909 (dasv_datetime);
CREATE RULE data_sensor_values_r201909 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2019-09-01' AND dasv_datetime < DATE '2019-10-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201909 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201910 
(CHECK ( dasv_datetime >= DATE '2019-10-01' AND dasv_datetime < DATE '2019-11-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201910 ON data_sensor_values_p201910 (dasv_id);
CREATE INDEX dasv_spmd_i201910 ON data_sensor_values_p201910 (dasv_spmd_id);
CREATE INDEX dasv_key_i201910 ON data_sensor_values_p201910 (dasv_key);
CREATE INDEX dasv_datetime_i201910 ON data_sensor_values_p201910 (dasv_datetime);
CREATE RULE data_sensor_values_r201910 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2019-10-01' AND dasv_datetime < DATE '2019-11-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201910 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201911 
(CHECK ( dasv_datetime >= DATE '2019-11-01' AND dasv_datetime < DATE '2019-12-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201911 ON data_sensor_values_p201911 (dasv_id);
CREATE INDEX dasv_spmd_i201911 ON data_sensor_values_p201911 (dasv_spmd_id);
CREATE INDEX dasv_key_i201911 ON data_sensor_values_p201911 (dasv_key);
CREATE INDEX dasv_datetime_i201911 ON data_sensor_values_p201911 (dasv_datetime);
CREATE RULE data_sensor_values_r201911 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2019-11-01' AND dasv_datetime < DATE '2019-12-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201911 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p201912 
(CHECK ( dasv_datetime >= DATE '2019-12-01' AND dasv_datetime < DATE '2020-01-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i201912 ON data_sensor_values_p201912 (dasv_id);
CREATE INDEX dasv_spmd_i201912 ON data_sensor_values_p201912 (dasv_spmd_id);
CREATE INDEX dasv_key_i201912 ON data_sensor_values_p201912 (dasv_key);
CREATE INDEX dasv_datetime_i201912 ON data_sensor_values_p201912 (dasv_datetime);
CREATE RULE data_sensor_values_r201912 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2019-12-01' AND dasv_datetime < DATE '2020-01-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p201912 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202001 
(CHECK ( dasv_datetime >= DATE '2020-01-01' AND dasv_datetime < DATE '2020-02-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202001 ON data_sensor_values_p202001 (dasv_id);
CREATE INDEX dasv_spmd_i202001 ON data_sensor_values_p202001 (dasv_spmd_id);
CREATE INDEX dasv_key_i202001 ON data_sensor_values_p202001 (dasv_key);
CREATE INDEX dasv_datetime_i202001 ON data_sensor_values_p202001 (dasv_datetime);
CREATE RULE data_sensor_values_r202001 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2020-01-01' AND dasv_datetime < DATE '2020-02-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202001 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202002 
(CHECK ( dasv_datetime >= DATE '2020-02-01' AND dasv_datetime < DATE '2020-03-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202002 ON data_sensor_values_p202002 (dasv_id);
CREATE INDEX dasv_spmd_i202002 ON data_sensor_values_p202002 (dasv_spmd_id);
CREATE INDEX dasv_key_i202002 ON data_sensor_values_p202002 (dasv_key);
CREATE INDEX dasv_datetime_i202002 ON data_sensor_values_p202002 (dasv_datetime);
CREATE RULE data_sensor_values_r202002 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2020-02-01' AND dasv_datetime < DATE '2020-03-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202002 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202003 
(CHECK ( dasv_datetime >= DATE '2020-03-01' AND dasv_datetime < DATE '2020-04-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202003 ON data_sensor_values_p202003 (dasv_id);
CREATE INDEX dasv_spmd_i202003 ON data_sensor_values_p202003 (dasv_spmd_id);
CREATE INDEX dasv_key_i202003 ON data_sensor_values_p202003 (dasv_key);
CREATE INDEX dasv_datetime_i202003 ON data_sensor_values_p202003 (dasv_datetime);
CREATE RULE data_sensor_values_r202003 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2020-03-01' AND dasv_datetime < DATE '2020-04-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202003 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202004 
(CHECK ( dasv_datetime >= DATE '2020-04-01' AND dasv_datetime < DATE '2020-05-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202004 ON data_sensor_values_p202004 (dasv_id);
CREATE INDEX dasv_spmd_i202004 ON data_sensor_values_p202004 (dasv_spmd_id);
CREATE INDEX dasv_key_i202004 ON data_sensor_values_p202004 (dasv_key);
CREATE INDEX dasv_datetime_i202004 ON data_sensor_values_p202004 (dasv_datetime);
CREATE RULE data_sensor_values_r202004 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2020-04-01' AND dasv_datetime < DATE '2020-05-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202004 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202005 
(CHECK ( dasv_datetime >= DATE '2020-05-01' AND dasv_datetime < DATE '2020-06-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202005 ON data_sensor_values_p202005 (dasv_id);
CREATE INDEX dasv_spmd_i202005 ON data_sensor_values_p202005 (dasv_spmd_id);
CREATE INDEX dasv_key_i202005 ON data_sensor_values_p202005 (dasv_key);
CREATE INDEX dasv_datetime_i202005 ON data_sensor_values_p202005 (dasv_datetime);
CREATE RULE data_sensor_values_r202005 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2020-05-01' AND dasv_datetime < DATE '2020-06-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202005 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202006 
(CHECK ( dasv_datetime >= DATE '2020-06-01' AND dasv_datetime < DATE '2020-07-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202006 ON data_sensor_values_p202006 (dasv_id);
CREATE INDEX dasv_spmd_i202006 ON data_sensor_values_p202006 (dasv_spmd_id);
CREATE INDEX dasv_key_i202006 ON data_sensor_values_p202006 (dasv_key);
CREATE INDEX dasv_datetime_i202006 ON data_sensor_values_p202006 (dasv_datetime);
CREATE RULE data_sensor_values_r202006 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2020-06-01' AND dasv_datetime < DATE '2020-07-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202006 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202007 
(CHECK ( dasv_datetime >= DATE '2020-07-01' AND dasv_datetime < DATE '2020-08-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202007 ON data_sensor_values_p202007 (dasv_id);
CREATE INDEX dasv_spmd_i202007 ON data_sensor_values_p202007 (dasv_spmd_id);
CREATE INDEX dasv_key_i202007 ON data_sensor_values_p202007 (dasv_key);
CREATE INDEX dasv_datetime_i202007 ON data_sensor_values_p202007 (dasv_datetime);
CREATE RULE data_sensor_values_r202007 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2020-07-01' AND dasv_datetime < DATE '2020-08-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202007 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202008 
(CHECK ( dasv_datetime >= DATE '2020-08-01' AND dasv_datetime < DATE '2020-09-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202008 ON data_sensor_values_p202008 (dasv_id);
CREATE INDEX dasv_spmd_i202008 ON data_sensor_values_p202008 (dasv_spmd_id);
CREATE INDEX dasv_key_i202008 ON data_sensor_values_p202008 (dasv_key);
CREATE INDEX dasv_datetime_i202008 ON data_sensor_values_p202008 (dasv_datetime);
CREATE RULE data_sensor_values_r202008 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2020-08-01' AND dasv_datetime < DATE '2020-09-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202008 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202009 
(CHECK ( dasv_datetime >= DATE '2020-09-01' AND dasv_datetime < DATE '2020-10-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202009 ON data_sensor_values_p202009 (dasv_id);
CREATE INDEX dasv_spmd_i202009 ON data_sensor_values_p202009 (dasv_spmd_id);
CREATE INDEX dasv_key_i202009 ON data_sensor_values_p202009 (dasv_key);
CREATE INDEX dasv_datetime_i202009 ON data_sensor_values_p202009 (dasv_datetime);
CREATE RULE data_sensor_values_r202009 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2020-09-01' AND dasv_datetime < DATE '2020-10-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202009 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202010 
(CHECK ( dasv_datetime >= DATE '2020-10-01' AND dasv_datetime < DATE '2020-11-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202010 ON data_sensor_values_p202010 (dasv_id);
CREATE INDEX dasv_spmd_i202010 ON data_sensor_values_p202010 (dasv_spmd_id);
CREATE INDEX dasv_key_i202010 ON data_sensor_values_p202010 (dasv_key);
CREATE INDEX dasv_datetime_i202010 ON data_sensor_values_p202010 (dasv_datetime);
CREATE RULE data_sensor_values_r202010 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2020-10-01' AND dasv_datetime < DATE '2020-11-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202010 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202011 
(CHECK ( dasv_datetime >= DATE '2020-11-01' AND dasv_datetime < DATE '2020-12-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202011 ON data_sensor_values_p202011 (dasv_id);
CREATE INDEX dasv_spmd_i202011 ON data_sensor_values_p202011 (dasv_spmd_id);
CREATE INDEX dasv_key_i202011 ON data_sensor_values_p202011 (dasv_key);
CREATE INDEX dasv_datetime_i202011 ON data_sensor_values_p202011 (dasv_datetime);
CREATE RULE data_sensor_values_r202011 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2020-11-01' AND dasv_datetime < DATE '2020-12-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202011 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202012 
(CHECK ( dasv_datetime >= DATE '2020-12-01' AND dasv_datetime < DATE '2021-01-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202012 ON data_sensor_values_p202012 (dasv_id);
CREATE INDEX dasv_spmd_i202012 ON data_sensor_values_p202012 (dasv_spmd_id);
CREATE INDEX dasv_key_i202012 ON data_sensor_values_p202012 (dasv_key);
CREATE INDEX dasv_datetime_i202012 ON data_sensor_values_p202012 (dasv_datetime);
CREATE RULE data_sensor_values_r202012 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2020-12-01' AND dasv_datetime < DATE '2021-01-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202012 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202101 
(CHECK ( dasv_datetime >= DATE '2021-01-01' AND dasv_datetime < DATE '2021-02-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202101 ON data_sensor_values_p202101 (dasv_id);
CREATE INDEX dasv_spmd_i202101 ON data_sensor_values_p202101 (dasv_spmd_id);
CREATE INDEX dasv_key_i202101 ON data_sensor_values_p202101 (dasv_key);
CREATE INDEX dasv_datetime_i202101 ON data_sensor_values_p202101 (dasv_datetime);
CREATE RULE data_sensor_values_r202101 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2021-01-01' AND dasv_datetime < DATE '2021-02-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202101 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202102 
(CHECK ( dasv_datetime >= DATE '2021-02-01' AND dasv_datetime < DATE '2021-03-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202102 ON data_sensor_values_p202102 (dasv_id);
CREATE INDEX dasv_spmd_i202102 ON data_sensor_values_p202102 (dasv_spmd_id);
CREATE INDEX dasv_key_i202102 ON data_sensor_values_p202102 (dasv_key);
CREATE INDEX dasv_datetime_i202102 ON data_sensor_values_p202102 (dasv_datetime);
CREATE RULE data_sensor_values_r202102 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2021-02-01' AND dasv_datetime < DATE '2021-03-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202102 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202103 
(CHECK ( dasv_datetime >= DATE '2021-03-01' AND dasv_datetime < DATE '2021-04-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202103 ON data_sensor_values_p202103 (dasv_id);
CREATE INDEX dasv_spmd_i202103 ON data_sensor_values_p202103 (dasv_spmd_id);
CREATE INDEX dasv_key_i202103 ON data_sensor_values_p202103 (dasv_key);
CREATE INDEX dasv_datetime_i202103 ON data_sensor_values_p202103 (dasv_datetime);
CREATE RULE data_sensor_values_r202103 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2021-03-01' AND dasv_datetime < DATE '2021-04-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202103 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202104 
(CHECK ( dasv_datetime >= DATE '2021-04-01' AND dasv_datetime < DATE '2021-05-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202104 ON data_sensor_values_p202104 (dasv_id);
CREATE INDEX dasv_spmd_i202104 ON data_sensor_values_p202104 (dasv_spmd_id);
CREATE INDEX dasv_key_i202104 ON data_sensor_values_p202104 (dasv_key);
CREATE INDEX dasv_datetime_i202104 ON data_sensor_values_p202104 (dasv_datetime);
CREATE RULE data_sensor_values_r202104 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2021-04-01' AND dasv_datetime < DATE '2021-05-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202104 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202105 
(CHECK ( dasv_datetime >= DATE '2021-05-01' AND dasv_datetime < DATE '2021-06-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202105 ON data_sensor_values_p202105 (dasv_id);
CREATE INDEX dasv_spmd_i202105 ON data_sensor_values_p202105 (dasv_spmd_id);
CREATE INDEX dasv_key_i202105 ON data_sensor_values_p202105 (dasv_key);
CREATE INDEX dasv_datetime_i202105 ON data_sensor_values_p202105 (dasv_datetime);
CREATE RULE data_sensor_values_r202105 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2021-05-01' AND dasv_datetime < DATE '2021-06-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202105 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202106 
(CHECK ( dasv_datetime >= DATE '2021-06-01' AND dasv_datetime < DATE '2021-07-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202106 ON data_sensor_values_p202106 (dasv_id);
CREATE INDEX dasv_spmd_i202106 ON data_sensor_values_p202106 (dasv_spmd_id);
CREATE INDEX dasv_key_i202106 ON data_sensor_values_p202106 (dasv_key);
CREATE INDEX dasv_datetime_i202106 ON data_sensor_values_p202106 (dasv_datetime);
CREATE RULE data_sensor_values_r202106 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2021-06-01' AND dasv_datetime < DATE '2021-07-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202106 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202107 
(CHECK ( dasv_datetime >= DATE '2021-07-01' AND dasv_datetime < DATE '2021-08-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202107 ON data_sensor_values_p202107 (dasv_id);
CREATE INDEX dasv_spmd_i202107 ON data_sensor_values_p202107 (dasv_spmd_id);
CREATE INDEX dasv_key_i202107 ON data_sensor_values_p202107 (dasv_key);
CREATE INDEX dasv_datetime_i202107 ON data_sensor_values_p202107 (dasv_datetime);
CREATE RULE data_sensor_values_r202107 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2021-07-01' AND dasv_datetime < DATE '2021-08-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202107 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202108 
(CHECK ( dasv_datetime >= DATE '2021-08-01' AND dasv_datetime < DATE '2021-09-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202108 ON data_sensor_values_p202108 (dasv_id);
CREATE INDEX dasv_spmd_i202108 ON data_sensor_values_p202108 (dasv_spmd_id);
CREATE INDEX dasv_key_i202108 ON data_sensor_values_p202108 (dasv_key);
CREATE INDEX dasv_datetime_i202108 ON data_sensor_values_p202108 (dasv_datetime);
CREATE RULE data_sensor_values_r202108 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2021-08-01' AND dasv_datetime < DATE '2021-09-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202108 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202109 
(CHECK ( dasv_datetime >= DATE '2021-09-01' AND dasv_datetime < DATE '2021-10-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202109 ON data_sensor_values_p202109 (dasv_id);
CREATE INDEX dasv_spmd_i202109 ON data_sensor_values_p202109 (dasv_spmd_id);
CREATE INDEX dasv_key_i202109 ON data_sensor_values_p202109 (dasv_key);
CREATE INDEX dasv_datetime_i202109 ON data_sensor_values_p202109 (dasv_datetime);
CREATE RULE data_sensor_values_r202109 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2021-09-01' AND dasv_datetime < DATE '2021-10-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202109 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202110 
(CHECK ( dasv_datetime >= DATE '2021-10-01' AND dasv_datetime < DATE '2021-11-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202110 ON data_sensor_values_p202110 (dasv_id);
CREATE INDEX dasv_spmd_i202110 ON data_sensor_values_p202110 (dasv_spmd_id);
CREATE INDEX dasv_key_i202110 ON data_sensor_values_p202110 (dasv_key);
CREATE INDEX dasv_datetime_i202110 ON data_sensor_values_p202110 (dasv_datetime);
CREATE RULE data_sensor_values_r202110 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2021-10-01' AND dasv_datetime < DATE '2021-11-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202110 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202111 
(CHECK ( dasv_datetime >= DATE '2021-11-01' AND dasv_datetime < DATE '2021-12-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202111 ON data_sensor_values_p202111 (dasv_id);
CREATE INDEX dasv_spmd_i202111 ON data_sensor_values_p202111 (dasv_spmd_id);
CREATE INDEX dasv_key_i202111 ON data_sensor_values_p202111 (dasv_key);
CREATE INDEX dasv_datetime_i202111 ON data_sensor_values_p202111 (dasv_datetime);
CREATE RULE data_sensor_values_r202111 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2021-11-01' AND dasv_datetime < DATE '2021-12-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202111 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202112 
(CHECK ( dasv_datetime >= DATE '2021-12-01' AND dasv_datetime < DATE '2022-01-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202112 ON data_sensor_values_p202112 (dasv_id);
CREATE INDEX dasv_spmd_i202112 ON data_sensor_values_p202112 (dasv_spmd_id);
CREATE INDEX dasv_key_i202112 ON data_sensor_values_p202112 (dasv_key);
CREATE INDEX dasv_datetime_i202112 ON data_sensor_values_p202112 (dasv_datetime);
CREATE RULE data_sensor_values_r202112 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2021-12-01' AND dasv_datetime < DATE '2022-01-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202112 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202201 
(CHECK ( dasv_datetime >= DATE '2022-01-01' AND dasv_datetime < DATE '2022-02-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202201 ON data_sensor_values_p202201 (dasv_id);
CREATE INDEX dasv_spmd_i202201 ON data_sensor_values_p202201 (dasv_spmd_id);
CREATE INDEX dasv_key_i202201 ON data_sensor_values_p202201 (dasv_key);
CREATE INDEX dasv_datetime_i202201 ON data_sensor_values_p202201 (dasv_datetime);
CREATE RULE data_sensor_values_r202201 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2022-01-01' AND dasv_datetime < DATE '2022-02-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202201 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202202 
(CHECK ( dasv_datetime >= DATE '2022-02-01' AND dasv_datetime < DATE '2022-03-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202202 ON data_sensor_values_p202202 (dasv_id);
CREATE INDEX dasv_spmd_i202202 ON data_sensor_values_p202202 (dasv_spmd_id);
CREATE INDEX dasv_key_i202202 ON data_sensor_values_p202202 (dasv_key);
CREATE INDEX dasv_datetime_i202202 ON data_sensor_values_p202202 (dasv_datetime);
CREATE RULE data_sensor_values_r202202 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2022-02-01' AND dasv_datetime < DATE '2022-03-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202202 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202203 
(CHECK ( dasv_datetime >= DATE '2022-03-01' AND dasv_datetime < DATE '2022-04-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202203 ON data_sensor_values_p202203 (dasv_id);
CREATE INDEX dasv_spmd_i202203 ON data_sensor_values_p202203 (dasv_spmd_id);
CREATE INDEX dasv_key_i202203 ON data_sensor_values_p202203 (dasv_key);
CREATE INDEX dasv_datetime_i202203 ON data_sensor_values_p202203 (dasv_datetime);
CREATE RULE data_sensor_values_r202203 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2022-03-01' AND dasv_datetime < DATE '2022-04-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202203 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202204 
(CHECK ( dasv_datetime >= DATE '2022-04-01' AND dasv_datetime < DATE '2022-05-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202204 ON data_sensor_values_p202204 (dasv_id);
CREATE INDEX dasv_spmd_i202204 ON data_sensor_values_p202204 (dasv_spmd_id);
CREATE INDEX dasv_key_i202204 ON data_sensor_values_p202204 (dasv_key);
CREATE INDEX dasv_datetime_i202204 ON data_sensor_values_p202204 (dasv_datetime);
CREATE RULE data_sensor_values_r202204 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2022-04-01' AND dasv_datetime < DATE '2022-05-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202204 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202205 
(CHECK ( dasv_datetime >= DATE '2022-05-01' AND dasv_datetime < DATE '2022-06-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202205 ON data_sensor_values_p202205 (dasv_id);
CREATE INDEX dasv_spmd_i202205 ON data_sensor_values_p202205 (dasv_spmd_id);
CREATE INDEX dasv_key_i202205 ON data_sensor_values_p202205 (dasv_key);
CREATE INDEX dasv_datetime_i202205 ON data_sensor_values_p202205 (dasv_datetime);
CREATE RULE data_sensor_values_r202205 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2022-05-01' AND dasv_datetime < DATE '2022-06-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202205 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202206 
(CHECK ( dasv_datetime >= DATE '2022-06-01' AND dasv_datetime < DATE '2022-07-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202206 ON data_sensor_values_p202206 (dasv_id);
CREATE INDEX dasv_spmd_i202206 ON data_sensor_values_p202206 (dasv_spmd_id);
CREATE INDEX dasv_key_i202206 ON data_sensor_values_p202206 (dasv_key);
CREATE INDEX dasv_datetime_i202206 ON data_sensor_values_p202206 (dasv_datetime);
CREATE RULE data_sensor_values_r202206 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2022-06-01' AND dasv_datetime < DATE '2022-07-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202206 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202207 
(CHECK ( dasv_datetime >= DATE '2022-07-01' AND dasv_datetime < DATE '2022-08-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202207 ON data_sensor_values_p202207 (dasv_id);
CREATE INDEX dasv_spmd_i202207 ON data_sensor_values_p202207 (dasv_spmd_id);
CREATE INDEX dasv_key_i202207 ON data_sensor_values_p202207 (dasv_key);
CREATE INDEX dasv_datetime_i202207 ON data_sensor_values_p202207 (dasv_datetime);
CREATE RULE data_sensor_values_r202207 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2022-07-01' AND dasv_datetime < DATE '2022-08-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202207 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202208 
(CHECK ( dasv_datetime >= DATE '2022-08-01' AND dasv_datetime < DATE '2022-09-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202208 ON data_sensor_values_p202208 (dasv_id);
CREATE INDEX dasv_spmd_i202208 ON data_sensor_values_p202208 (dasv_spmd_id);
CREATE INDEX dasv_key_i202208 ON data_sensor_values_p202208 (dasv_key);
CREATE INDEX dasv_datetime_i202208 ON data_sensor_values_p202208 (dasv_datetime);
CREATE RULE data_sensor_values_r202208 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2022-08-01' AND dasv_datetime < DATE '2022-09-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202208 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );

CREATE TABLE data_sensor_values_p202209 
(CHECK ( dasv_datetime >= DATE '2022-09-01' AND dasv_datetime < DATE '2022-10-01' ) ) INHERITS (data_sensor_values);
CREATE INDEX dasv_i202209 ON data_sensor_values_p202209 (dasv_id);
CREATE INDEX dasv_spmd_i202209 ON data_sensor_values_p202209 (dasv_spmd_id);
CREATE INDEX dasv_key_i202209 ON data_sensor_values_p202209 (dasv_key);
CREATE INDEX dasv_datetime_i202209 ON data_sensor_values_p202209 (dasv_datetime);
CREATE RULE data_sensor_values_r202209 AS
ON INSERT TO data_sensor_values WHERE
    ( dasv_datetime >= DATE '2022-09-01' AND dasv_datetime < DATE '2022-10-01' )
DO INSTEAD
    INSERT INTO data_sensor_values_p202209 VALUES (NEW.DASV_ID
					,NEW.DASV_SPMD_ID
					,NEW.DASV_DASN_ID
					,NEW.DASV_KEY
					,NEW.DASV_VALUE
					,NEW.DASV_DATETIME
                                        );






















CREATE INDEX DALV_DASL_IDX ON DATA_SENSOR_LAST_VALUES
  (DALV_DASL_ID)
  TABLESPACE USER_IND
;

CREATE INDEX DALV_SPMD_IDX ON DATA_SENSOR_LAST_VALUES
  (DALV_SPMD_ID)
  TABLESPACE USER_IND
;

CREATE INDEX DALV_KEY_IDX ON DATA_SENSOR_LAST_VALUES
  (DALV_KEY)
  TABLESPACE USER_IND
;
CREATE INDEX DALV_DATETIME_IDX ON DATA_SENSOR_LAST_VALUES
  (DALV_DATETIME)
  TABLESPACE USER_IND
;

CREATE INDEX DASV_DASN_IDX ON DATA_SENSOR_VALUES 
  (DASV_DASN_ID) 
  TABLESPACE USER_IND
;
CREATE INDEX DASV_KEY_IDX ON DATA_SENSOR_VALUES 
  (DASV_KEY)
  TABLESPACE USER_IND
;

CREATE INDEX DASV_SPMD_IDX ON DATA_SENSOR_VALUES 
  (DASV_SPMD_ID)
  TABLESPACE USER_IND
;

CREATE INDEX DASV_DATETIME_IDX ON DATA_SENSOR_VALUES
  (DASV_DATETIME)
  TABLESPACE USER_IND
;


ALTER TABLE DATA_SENSOR_LAST_VALUES
	ADD FOREIGN KEY (DALV_SPMD_ID)
	REFERENCES SPRV_MODULES (SPMD_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;

CREATE SEQUENCE DASV_SEQ
 NO MAXVALUE
 NO MINVALUE
 NO CYCLE
;

CREATE SEQUENCE DALV_SEQ
 NO MAXVALUE
 NO MINVALUE
 NO CYCLE
;

