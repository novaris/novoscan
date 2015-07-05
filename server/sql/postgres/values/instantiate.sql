-- Данные которые должны быть установлены на момент установки БД
-- Для блоков которые забыли добавить устанавливается неопределённая организация неопределённый тип и т.п.
--
INSERT INTO SYS_CONSTS
 (SC_ID
 ,SC_NAME
 ,SC_NVALUE
 ,SC_CVALUE
 ,SC_DVALUE
 ,SC_DT_CREATE
 ,SC_DESC
 ) VALUES
 (1
 ,'UNDEF'
 ,0
 ,NULL
 ,NULL
 ,now()
 ,'Константа UNDEF (неопределённость)'
 );

INSERT INTO SYS_CONSTS
 (SC_ID
 ,SC_NAME
 ,SC_NVALUE
 ,SC_CVALUE
 ,SC_DVALUE
 ,SC_DT_CREATE
 ,SC_DESC
 ) VALUES
 (2
 ,'REF_ACCOUNTS'
 ,100
 ,NULL
 ,NULL
 ,now()
 ,'Константа ссылка на таблицу ACCOUNTS'
 );

INSERT INTO SYS_CONSTS
 (SC_ID
 ,SC_NAME
 ,SC_NVALUE
 ,SC_CVALUE
 ,SC_DVALUE
 ,SC_DT_CREATE
 ,SC_DESC
 ) VALUES
 (3
 ,'REF_OBJECTS'
 ,101
 ,NULL
 ,NULL
 ,now()
 ,'Константа ссылка на таблицу SPRV_OBJECTS'
 );
INSERT INTO SYS_CONSTS
 (SC_ID
 ,SC_NAME
 ,SC_NVALUE
 ,SC_CVALUE
 ,SC_DVALUE
 ,SC_DT_CREATE
 ,SC_DESC
 ) VALUES
 (4
 ,'REF_MODULES'
 ,102
 ,NULL
 ,NULL
 ,now()
 ,'Константа ссылка на таблицу SPRV_MODULES'
 );

INSERT INTO SYS_CONSTS
 (SC_ID
 ,SC_NAME
 ,SC_NVALUE
 ,SC_CVALUE
 ,SC_DVALUE
 ,SC_DT_CREATE
 ,SC_DESC
 ) VALUES
 (5
 ,'ACL_NONE'
 ,0
 ,NULL
 ,NULL
 ,now()
 ,'Константа доступ запрещён'
 );

INSERT INTO SYS_CONSTS
 (SC_ID
 ,SC_NAME
 ,SC_NVALUE
 ,SC_CVALUE
 ,SC_DVALUE
 ,SC_DT_CREATE
 ,SC_DESC
 ) VALUES
 (6
 ,'ACL_READ'
 ,1
 ,NULL
 ,NULL
 ,now()
 ,'Константа доступ на чтение'
 );
INSERT INTO SYS_CONSTS
 (SC_ID
 ,SC_NAME
 ,SC_NVALUE
 ,SC_CVALUE
 ,SC_DVALUE
 ,SC_DT_CREATE
 ,SC_DESC
 ) VALUES
 (7
 ,'ACL_WRITE'
 ,10
 ,NULL
 ,NULL
 ,now()
 ,'Константа доступ на запись'
 );

INSERT INTO SYS_CONSTS
 (SC_ID
 ,SC_NAME
 ,SC_NVALUE
 ,SC_CVALUE
 ,SC_DVALUE
 ,SC_DT_CREATE
 ,SC_DESC
 ) VALUES
 (8
 ,'REF_CLIENTS'
 ,103
 ,NULL
 ,NULL
 ,now()
 ,'Константа ссылка на таблицу SPRV_CLIENTS'
 );

INSERT INTO SYS_CONSTS
 (SC_ID
 ,SC_NAME
 ,SC_NVALUE
 ,SC_CVALUE
 ,SC_DVALUE
 ,SC_DT_CREATE
 ,SC_DESC
 ) VALUES
 (9
 ,'REF_DEPARTS'
 ,104
 ,NULL
 ,NULL
 ,now()
 ,'Константа ссылка на таблицу SPRV_DEPARTS'
 );

INSERT INTO SYS_CONSTS
 (SC_ID
 ,SC_NAME
 ,SC_NVALUE
 ,SC_CVALUE
 ,SC_DVALUE
 ,SC_DT_CREATE
 ,SC_DESC
 ) VALUES
 (10
 ,'PI'
 ,3.14159265358979
 ,NULL
 ,NULL
 ,now()
 ,'Значение константы PI'
 );

INSERT INTO SYS_CONSTS
 (SC_ID
 ,SC_NAME
 ,SC_NVALUE
 ,SC_CVALUE
 ,SC_DVALUE
 ,SC_DT_CREATE
 ,SC_DESC
 ) VALUES
 (11
 ,'EARTH_RADIUS'
 ,6372795
 ,NULL
 ,NULL
 ,now()
 ,'Значение радиса земли в метрах'
 );

INSERT INTO SYS_CONSTS
 (SC_ID
 ,SC_NAME
 ,SC_NVALUE
 ,SC_CVALUE
 ,SC_DVALUE
 ,SC_DT_CREATE
 ,SC_DESC
 ) VALUES
 (12
 ,'CMD_QU'
 ,1
 ,NULL
 ,NULL
 ,now()
 ,'Константа статус команды - поставлено в очередь команд'
 );

INSERT INTO SYS_CONSTS
 (SC_ID
 ,SC_NAME
 ,SC_NVALUE
 ,SC_CVALUE
 ,SC_DVALUE
 ,SC_DT_CREATE
 ,SC_DESC
 ) VALUES
 (13
 ,'CMD_OK'
 ,10
 ,NULL
 ,NULL
 ,now()
 ,'Константа статус команды - успешно обработано'
 );

INSERT INTO SYS_CONSTS
 (SC_ID
 ,SC_NAME
 ,SC_NVALUE
 ,SC_CVALUE
 ,SC_DVALUE
 ,SC_DT_CREATE
 ,SC_DESC
 ) VALUES
 (14
 ,'CMD_ER'
 ,20
 ,NULL
 ,NULL
 ,now()
 ,'Константа статус запроса - обработано с ошибкой'
 );

INSERT INTO SYS_CONSTS
 (SC_ID
 ,SC_NAME
 ,SC_NVALUE
 ,SC_CVALUE
 ,SC_DVALUE
 ,SC_DT_CREATE
 ,SC_DESC
 ) VALUES
 (15
 ,'RESULT_OK'
 ,0
 ,NULL
 ,NULL
 ,now()
 ,'Константа статус "Успешно"'
 );

INSERT INTO SYS_CONSTS
 (SC_ID
 ,SC_NAME
 ,SC_NVALUE
 ,SC_CVALUE
 ,SC_DVALUE
 ,SC_DT_CREATE
 ,SC_DESC
 ) VALUES
 (16
 ,'ALL_ROWS'
 ,0
 ,NULL
 ,NULL
 ,now()
 ,'Константа "Все строки"'
 );

INSERT INTO SYS_CONSTS
 (SC_ID
 ,SC_NAME
 ,SC_NVALUE
 ,SC_CVALUE
 ,SC_DVALUE
 ,SC_DT_CREATE
 ,SC_DESC
 ) VALUES
 (17
 ,'REF_GIS_OBJECTS'
 ,200
 ,NULL
 ,NULL
 ,now()
 ,'Константа ссылка на таблицу SPRV_MODULES'
 );

INSERT INTO SYS_CONSTS
 (SC_ID
 ,SC_NAME
 ,SC_NVALUE
 ,SC_CVALUE
 ,SC_DVALUE
 ,SC_DT_CREATE
 ,SC_DESC
 ) VALUES
 (18
 ,'OBJECT_CARRYING'
 ,1
 ,NULL
 ,NULL
 ,now()
 ,'Грузоподъёмность автомобиля'
 );

INSERT INTO SYS_CONSTS
 (SC_ID
 ,SC_NAME
 ,SC_NVALUE
 ,SC_CVALUE
 ,SC_DVALUE
 ,SC_DT_CREATE
 ,SC_DESC
 ) VALUES
 (100
 ,'ROLE_ADMIN'
 ,0
 ,NULL
 ,NULL
 ,now()
 ,'Константа доступ Админ'
 );





INSERT INTO SYS_CONSTS
 (SC_ID
 ,SC_NAME
 ,SC_NVALUE
 ,SC_CVALUE
 ,SC_DVALUE
 ,SC_DT_CREATE
 ,SC_DESC
 ) VALUES
 (8
 ,'REF_CLIENTS'
 ,103
 ,NULL
 ,NULL
 ,now()
 ,'Константа ссылка на таблицу SPRV_CLIENTS'
 );

--

INSERT INTO SPRV_MODULE_TYPES
 (SPMT_ID
 ,SPMT_NAME
 ,SPMT_DESC
 ) VALUES 
 (0
 ,'UNDEF'
 ,'Неопределённый тип модуля'
 );
--
INSERT INTO SPRV_MODULE_TYPES
 (SPMT_ID
 ,SPMT_NAME
 ,SPMT_DESC
 ) VALUES 
 (1
 ,'GELIX0'
 ,'"Геликс" версия firmware .0'
 );
INSERT INTO SPRV_MODULE_TYPES
 (SPMT_ID
 ,SPMT_NAME
 ,SPMT_DESC
 ) VALUES 
 (2
 ,'GELIX1'
 ,'"Геликс" версия firmware .1'
 );
INSERT INTO SPRV_MODULE_TYPES
 (SPMT_ID
 ,SPMT_NAME
 ,SPMT_DESC
 ) VALUES 
 (3
 ,'GELIX2'
 ,'"Геликс" версия firmware .2'
 );
INSERT INTO SPRV_MODULE_TYPES
 (SPMT_ID
 ,SPMT_NAME
 ,SPMT_DESC
 ) VALUES 
 (4
 ,'GELIX3'
 ,'"Геликс" версия firmware .3'
 );
INSERT INTO SPRV_MODULE_TYPES
 (SPMT_ID
 ,SPMT_NAME
 ,SPMT_DESC
 ) VALUES 
 (5
 ,'GELIX4'
 ,'"Геликс" версия firmware .4'
 );
INSERT INTO SPRV_MODULE_TYPES
 (SPMT_ID
 ,SPMT_NAME
 ,SPMT_DESC
 ) VALUES 
 (6
 ,'GELIX5'
 ,'"Геликс" версия firmware .5'
 );
INSERT INTO SPRV_MODULE_TYPES
 (SPMT_ID
 ,SPMT_NAME
 ,SPMT_DESC
 ) VALUES 
 (7
 ,'GELIX6'
 ,'"Геликс" версия firmware .6'
 );
INSERT INTO SPRV_MODULE_TYPES
 (SPMT_ID
 ,SPMT_NAME
 ,SPMT_DESC
 ) VALUES 
 (8
 ,'GELIX7'
 ,'"Геликс" версия firmware .7'
 );

INSERT INTO SPRV_MODULE_TYPES
 (SPMT_ID
 ,SPMT_NAME
 ,SPMT_DESC
 ) VALUES 
 (100
 ,'GS_TR15x'
 ,'"Global-Sat" модель TR-150/TR-151'
 );

INSERT INTO SPRV_MODULE_TYPES
 (SPMT_ID
 ,SPMT_NAME
 ,SPMT_DESC
 ) VALUES 
 (200
 ,'UTP-5'
 ,'"Navitech" модель UTP-5'
 );

INSERT INTO SPRV_MODULE_TYPES
 (SPMT_ID
 ,SPMT_NAME
 ,SPMT_DESC
 ) VALUES 
 (300
 ,'miniTrack'
 ,'"Novacom" модель GNS-miniTrack'
 );

INSERT INTO SPRV_MODULE_TYPES
 (SPMT_ID
 ,SPMT_NAME
 ,SPMT_DESC
 ) VALUES 
 (500
 ,'MT-5XX'
 ,'"Скаут" модель MT-5XX'
 );

INSERT INTO SPRV_MODULE_TYPES
 (SPMT_ID
 ,SPMT_NAME
 ,SPMT_DESC
 ) VALUES 
 (800
 ,'MAYAK-4x'
 ,'"Автофон" модель Маяк-4X'
 );

INSERT INTO SPRV_MODULE_TYPES
 (SPMT_ID
 ,SPMT_NAME
 ,SPMT_DESC
 ) VALUES 
 (301
 ,'ST270'
 ,'Ижевский радиозавод ST270'
 );

INSERT INTO SPRV_MODULE_TYPES
 (SPMT_ID
 ,SPMT_NAME
 ,SPMT_DESC
 ) VALUES 
 (302
 ,'Signal'
 ,'Модуль Сигнал S-xxx'
 );

INSERT INTO SPRV_MODULE_TYPES
 (SPMT_ID
 ,SPMT_NAME
 ,SPMT_DESC
 ) VALUES 
 (303
 ,'GPSMarker'
 ,'Модуль GPS Маркер'
 );
INSERT INTO SPRV_MODULE_TYPES
 (SPMT_ID
 ,SPMT_NAME
 ,SPMT_DESC
 ) VALUES 
 (304
 ,'T15'
 ,'Модуль GPS Маяк Т15'
 );
INSERT INTO SPRV_MODULE_TYPES
 (SPMT_ID
 ,SPMT_NAME
 ,SPMT_DESC
 ) VALUES 
 (305
 ,'NavixyM7'
 ,'Модуль GPS Navixy M7'
 );
INSERT INTO SPRV_MODULE_TYPES
 (SPMT_ID
 ,SPMT_NAME
 ,SPMT_DESC
 ) VALUES 
 (306
 ,'GalileoSKY'
 ,'Модуль GPS/Glonass GalileoSKY'
 );

INSERT INTO SPRV_MODULE_TYPES
 (SPMT_ID
 ,SPMT_NAME
 ,SPMT_DESC
 ) VALUES 
 (310
 ,'UM04'
 ,'Модуль Навитрек УМ-04'
 );

INSERT INTO SPRV_MODULE_TYPES
 (SPMT_ID
 ,SPMT_NAME
 ,SPMT_DESC
 ) VALUES 
 (350
 ,'FMXXXX'
 ,'Модуль Teltonika FM1100, FM2100, FM2200, FM4100, FM4200'
 );

INSERT INTO SPRV_MODULE_TYPES
 (SPMT_ID
 ,SPMT_NAME
 ,SPMT_DESC
 ) VALUES 
 (600
 ,'ScoutOpen'
 ,'"Скаут" протокол SCOUT OPEN'
 );

INSERT INTO SPRV_SENSOR_TYPES
 (SPST_ID
 ,SPST_NAME
 ,SPST_DESC
 ) VALUES 
 (0
 ,'UNDEF'
 ,'Неопределённый тип сенсора'
 );
--
INSERT INTO SPRV_SENSOR_TYPES
 (SPST_ID
 ,SPST_NAME
 ,SPST_DESC
 ) VALUES 
 (1
 ,'STANDART'
 ,'Стандартный тип сенсора'
 );
--
INSERT INTO SPRV_SENSOR_TYPES
 (SPST_ID
 ,SPST_NAME
 ,SPST_DESC
 ) VALUES 
 (2
 ,'COMBINE'
 ,'Сенсоры совмещённые в одном модуле'
 );
--
INSERT INTO SPRV_OBJECT_TYPES
 (SPOT_ID
 ,SPOT_NAME
 ,SPOT_DESC
 ) VALUES 
 (0
 ,'UNDEF'
 ,'Неопределённый тип объекта'
 );
--
INSERT INTO SPRV_OBJECT_TYPES
 (SPOT_ID
 ,SPOT_NAME
 ,SPOT_DESC
 ) VALUES 
 (1
 ,'PASSENGER'
 ,'Легковой автомобиль'
 );

--
INSERT INTO SPRV_OBJECT_TYPES
 (SPOT_ID
 ,SPOT_NAME
 ,SPOT_DESC
 ) VALUES 
 (2
 ,'BUS'
 ,'Автобус'
 );

--
INSERT INTO SPRV_OBJECT_TYPES
 (SPOT_ID
 ,SPOT_NAME
 ,SPOT_DESC
 ) VALUES 
 (3
 ,'FLATBED'
 ,'Грузовой бортовой автомобиль'
 );

--
INSERT INTO SPRV_OBJECT_TYPES
 (SPOT_ID
 ,SPOT_NAME
 ,SPOT_DESC
 ) VALUES 
 (4
 ,'TRUCK'
 ,'Седельный тягач'
 );

--
INSERT INTO SPRV_OBJECT_TYPES
 (SPOT_ID
 ,SPOT_NAME
 ,SPOT_DESC
 ) VALUES 
 (5
 ,'TIPPER'
 ,'Самосвал'
 );

--
INSERT INTO SPRV_OBJECT_TYPES
 (SPOT_ID
 ,SPOT_NAME
 ,SPOT_DESC
 ) VALUES 
 (6
 ,'CISTERN'
 ,'Цистерна'
 );

--
INSERT INTO SPRV_OBJECT_TYPES
 (SPOT_ID
 ,SPOT_NAME
 ,SPOT_DESC
 ) VALUES 
 (7
 ,'WAGON'
 ,'Фургон'
 );

--
INSERT INTO SPRV_OBJECT_TYPES
 (SPOT_ID
 ,SPOT_NAME
 ,SPOT_DESC
 ) VALUES 
 (8
 ,'SPECIAL'
 ,'Специальный автомобиль'
 );

-- 
INSERT INTO SPRV_OBJECT_TYPES
 (SPOT_ID
 ,SPOT_NAME
 ,SPOT_DESC
 ) VALUES 
 (9
 ,'HUMAN'
 ,'Человек'
 );

-- 
INSERT INTO SPRV_OBJECT_TYPES
 (SPOT_ID
 ,SPOT_NAME
 ,SPOT_DESC
 ) VALUES 
 (10
 ,'ANIMAL'
 ,'Животное'
 );

-- 
INSERT INTO SPRV_DEPARTS
 (SPDP_ID
 ,SPDP_NAME
 ) VALUES 
 (0
 ,'Неопределённая организация'
 );
--
INSERT INTO SPRV_CLIENTS
 (SPCL_ID
 ,SPCL_NAME
 ,SPCL_TYPE
 ,SPCL_DESC
 ,SPCL_SPDP_ID
 ) VALUES 
 (0
 ,'UNDEF'
 ,0
 ,'Неопределённый клиент'
 ,0
 );
--
INSERT INTO SPRV_OBJECTS
 (SPOB_ID
 ,SPOB_NAME
 ,SPOB_DESC
 ,SPOB_DT_CREATE
 ,SPOB_DT_MODIFY
 ,SPOB_DT_CLOSE
 ,SPOB_SPCL_ID
 ,SPOB_SPOT_ID
 ) VALUES 
 (0
 ,'UNDEF'
 ,'Неопределённый объект'
 ,now()
 ,now()
 ,NULL
 ,0
 ,0
 );
--
INSERT INTO SPRV_MODULES
 (SPMD_ID
 ,SPMD_UID
 ,SPMD_NAME
 ,SPMD_DT_CREATE
 ,SPMD_DT_CLOSE
 ,SPMD_USER
 ,SPMD_IMEI
 ,SPMD_NUMB
 ,SPMD_DESC
 ,SPMD_SPOB_ID
 ,SPMD_SPMT_ID
 ) VALUES 
 (0
 ,0
 ,0
 ,now()
 ,NULL
 ,'OWNER'
 ,'0000000000000'
 ,0
 ,'Неопределённый модуль'
 ,0
 ,0
 );
--
INSERT INTO SPRV_SENSORS
 (SPSN_ID
 ,SPSN_UIN
 ,SPSN_NAME
 ,SPSN_DESC
 ,SPSN_SPST_ID
 ,SPSN_SPMD_ID
 ) VALUES 
 (0
 ,0
 ,'UNDEF'
 ,'Неопределённый сенсор'
 ,0
 ,0
 );


-- Variables
INSERT INTO SYS_VARIABLES
 (SVAR_ID
 ,SVAR_NAME
 ,SVAR_NVALUE
 ,SVAR_CVALUE
 ,SVAR_DVALUE
 ,SVAR_DT_CREATE
 ,SVAR_DT_MODIFY
 ,SVAR_DESC
 ) VALUES
 (1
 ,'NLS_DATE_FORMAT'
 ,NULL
 ,'DD.MM.YYYY HH24:MI:SS'
 ,NULL
 ,now()
 ,now()
 ,'Формат даты при преобразовании типа дата в символьные значения в отчётах'
 );

INSERT INTO SYS_VARIABLES
 (SVAR_ID
 ,SVAR_NAME
 ,SVAR_NVALUE
 ,SVAR_CVALUE
 ,SVAR_DVALUE
 ,SVAR_DT_CREATE
 ,SVAR_DT_MODIFY
 ,SVAR_DESC
 ) VALUES
 (2
 ,'MIN_SPEED'
 ,5
 ,NULL
 ,NULL
 ,now()
 ,now()
 ,'Скорость в км/ч ниже которой считается что машина стоит'
 );

INSERT INTO SYS_VARIABLES
 (SVAR_ID
 ,SVAR_NAME
 ,SVAR_NVALUE
 ,SVAR_CVALUE
 ,SVAR_DVALUE
 ,SVAR_DT_CREATE
 ,SVAR_DT_MODIFY
 ,SVAR_DESC
 ) VALUES
 (3
 ,'MIN_INTERVAL'
 ,10
 ,NULL
 ,NULL
 ,now()
 ,now()
 ,'Минимальный интервал в секундах при котором записи в данных считаются как одна'
 );

INSERT INTO SYS_VARIABLES
 (SVAR_ID
 ,SVAR_NAME
 ,SVAR_NVALUE
 ,SVAR_CVALUE
 ,SVAR_DVALUE
 ,SVAR_DT_CREATE
 ,SVAR_DT_MODIFY
 ,SVAR_DESC
 ) VALUES
 (4
 ,'PIKET_RADIUS'
 ,0.0003
 ,NULL
 ,NULL
 ,now()
 ,now()
 ,'Радиус поиска пикета дороги'
 );
INSERT INTO SYS_VARIABLES
 (SVAR_ID
 ,SVAR_NAME
 ,SVAR_NVALUE
 ,SVAR_CVALUE
 ,SVAR_DVALUE
 ,SVAR_DT_CREATE
 ,SVAR_DT_MODIFY
 ,SVAR_DESC
 ) VALUES
 (5
 ,'MIN_SATELLITE_USED'
 ,3
 ,NULL
 ,NULL
 ,now()
 ,now()
 ,'Минимальное количество спутников необходимых для определения координат'
 );
INSERT INTO SYS_VARIABLES
 (SVAR_ID
 ,SVAR_NAME
 ,SVAR_NVALUE
 ,SVAR_CVALUE
 ,SVAR_DVALUE
 ,SVAR_DT_CREATE
 ,SVAR_DT_MODIFY
 ,SVAR_DESC
 ) VALUES
 (6
 ,'MAX_SPEED'
 ,200
 ,NULL
 ,NULL
 ,now()
 ,now()
 ,'Максимальная скорость в км/ч'
 );

INSERT INTO SYS_VARIABLES
 (SVAR_ID
 ,SVAR_NAME
 ,SVAR_NVALUE
 ,SVAR_CVALUE
 ,SVAR_DVALUE
 ,SVAR_DT_CREATE
 ,SVAR_DT_MODIFY
 ,SVAR_DESC
 ) VALUES
 (7
 ,'MIN_PARKING_TIME'
 ,300
 ,NULL
 ,NULL
 ,now()
 ,now()
 ,'Минимальная длительность стоянки'
);

INSERT INTO SYS_VARIABLES
 (SVAR_ID
 ,SVAR_NAME
 ,SVAR_NVALUE
 ,SVAR_CVALUE
 ,SVAR_DVALUE
 ,SVAR_DT_CREATE
 ,SVAR_DT_MODIFY
 ,SVAR_DESC
 ) VALUES
 (8
 ,'MIN_CHANGE_COURSE'
 ,60
 ,NULL
 ,NULL
 ,now()
 ,now()
 ,'Минимальное изменение курса для отметки точки'
 );

INSERT INTO SYS_VARIABLES
 (SVAR_ID
 ,SVAR_NAME
 ,SVAR_NVALUE
 ,SVAR_CVALUE
 ,SVAR_DVALUE
 ,SVAR_DT_CREATE
 ,SVAR_DT_MODIFY
 ,SVAR_DESC
 ) VALUES
 (9
 ,'MIN_LONG_COURSE'
 ,1000
 ,NULL
 ,NULL
 ,now()
 ,now()
 ,'Минимальный пробег без изменения курса для отметки точки'
 );

INSERT INTO GIS_TYPES
 (GSTP_ID
 ,GSTP_CODE
 ,GSTP_NAME
 ,GSTP_DESC
 ,GSTP_DT
 ) VALUES
 (1
 ,'ROAD'
 ,'Дорога'
 ,'Тип объекта дорога'
 ,now()
 );
--- Типы населённых пунктов
INSERT INTO GIS_TYPES
 (GSTP_ID
 ,GSTP_CODE
 ,GSTP_NAME
 ,GSTP_DESC
 ,GSTP_DT
 ) VALUES
 (101
 ,'CITY'
 ,'Город'
 ,'Населённый пункт Город'
 ,now()
 );
INSERT INTO GIS_TYPES
 (GSTP_ID
 ,GSTP_CODE
 ,GSTP_NAME
 ,GSTP_DESC
 ,GSTP_DT
 ) VALUES
 (102
 ,'TOWNSHIP'
 ,'Посёлок'
 ,'Населённый пункт Посёлок'
 ,now()
 );
INSERT INTO GIS_TYPES
 (GSTP_ID
 ,GSTP_CODE
 ,GSTP_NAME
 ,GSTP_DESC
 ,GSTP_DT
 ) VALUES
 (103
 ,'SELO'
 ,'Село'
 ,'Населённый пункт Село'
 ,now()
 );
INSERT INTO GIS_TYPES
 (GSTP_ID
 ,GSTP_CODE
 ,GSTP_NAME
 ,GSTP_DESC
 ,GSTP_DT
 ) VALUES
 (104
 ,'VILLAGE'
 ,'Деревня'
 ,'Населённый пункт Деревня'
 ,now()
 );
INSERT INTO GIS_TYPES
 (GSTP_ID
 ,GSTP_CODE
 ,GSTP_NAME
 ,GSTP_DESC
 ,GSTP_DT
 ) VALUES
 (105
 ,'COTTAGE'
 ,'Коттеджный посёлок'
 ,'Населённый пункт Коттеджный посёлок'
 ,now()
 );
INSERT INTO GIS_TYPES
 (GSTP_ID
 ,GSTP_CODE
 ,GSTP_NAME
 ,GSTP_DESC
 ,GSTP_DT
 ) VALUES
 (105
 ,'KHUTOR'
 ,'Хутор'
 ,'Населённый пункт Хутор'
 ,now()
 );
INSERT INTO GIS_TYPES
 (GSTP_ID
 ,GSTP_CODE
 ,GSTP_NAME
 ,GSTP_DESC
 ,GSTP_DT
 ) VALUES
 (106
 ,'STANITSA'
 ,'Станица'
 ,'Населённый пункт Станица'
 ,now()
 );
INSERT INTO GIS_TYPES
 (GSTP_ID
 ,GSTP_CODE
 ,GSTP_NAME
 ,GSTP_DESC
 ,GSTP_DT
 ) VALUES
 (200
 ,'GEOZONE'
 ,'Геозона пробега'
 ,'Геозона для учёта'
 ,now()
 );
INSERT INTO GIS_TYPES
 (GSTP_ID
 ,GSTP_CODE
 ,GSTP_NAME
 ,GSTP_DESC
 ,GSTP_DT
 ) VALUES
 (201
 ,'GEOZONE_MILEAGE'
 ,'Геозона'
 ,'Геозона для расчёта пробега'
 ,now()
 );
-- 
INSERT INTO GIS_POINT_TYPES
 (GSPT_ID
 ,GSPT_NAME
 ,GSPT_DESC
 ,GSPT_DT
 ) VALUES
 (0
 ,'TYPICAL'
 ,'Точка обычного типа'
 ,now()
 );
INSERT INTO GIS_POINT_TYPES
 (GSPT_ID
 ,GSPT_NAME
 ,GSPT_DESC
 ,GSPT_DT
 ) VALUES
 (1
 ,'CROSSROAD'
 ,'Точка перекрёсток'
 ,now()
 );
INSERT INTO GIS_POINT_TYPES
 (GSPT_ID
 ,GSPT_NAME
 ,GSPT_DESC
 ,GSPT_DT
 ) VALUES
 (1000
 ,'POINT'
 ,'Геометрия типа точка'
 ,now()
 );
INSERT INTO GIS_POINT_TYPES
 (GSPT_ID
 ,GSPT_NAME
 ,GSPT_DESC
 ,GSPT_DT
 ) VALUES
 (1001
 ,'LINESTRING'
 ,'Геометрия типа линия'
 ,now()
 );
INSERT INTO GIS_POINT_TYPES
 (GSPT_ID
 ,GSPT_NAME
 ,GSPT_DESC
 ,GSPT_DT
 ) VALUES
 (1002
 ,'MULTILINESTRING'
 ,'Геометрия типа ломанная линия'
 ,now()
 );




-- Добавление в ошибки

insert into gis_errors(gser_id,gser_desc,gser_dt) values (0,'нормально',now());
insert into gis_errors(gser_id,gser_desc,gser_dt) values (10,'нет ничего',now());
insert into gis_errors(gser_id,gser_desc,gser_dt) values (11,'нет координат, нанесено по карте',now());
insert into gis_errors(gser_id,gser_desc,gser_dt) values (12,'нет координат, нанесено примерно',now());
insert into gis_errors(gser_id,gser_desc,gser_dt) values (1,'не хватает координат (меньшая протяж.)',now());
insert into gis_errors(gser_id,gser_desc,gser_dt) values (2,'Расхожд. протяж с паспортом',now());
insert into gis_errors(gser_id,gser_desc,gser_dt) values (3,'неправильное начало/конец',now());
insert into gis_errors(gser_id,gser_desc,gser_dt) values (4,'некорректный титул',now());
insert into gis_errors(gser_id,gser_desc,gser_dt) values (5,'неправильно в паспорте',now());

-- Принадлежность
insert into  sprv_cis_info(spci_id,spci_code,spci_desc,spci_gstp_id) values (nextval('spci_seq'),1,'Федеральная',1);
insert into  sprv_cis_info(spci_id,spci_code,spci_desc,spci_gstp_id) values (nextval('spci_seq'),2,'Территориальная областного значения',1);
insert into  sprv_cis_info(spci_id,spci_code,spci_desc,spci_gstp_id) values (nextval('spci_seq'),3,'Территориальная местного значения',1);
insert into  sprv_cis_info(spci_id,spci_code,spci_desc,spci_gstp_id) values (nextval('spci_seq'),5,'Внутрихозяйственная',1);
insert into  sprv_cis_info(spci_id,spci_code,spci_desc,spci_gstp_id) values (nextval('spci_seq'),6,'Прочая',1);
insert into  sprv_cis_info(spci_id,spci_code,spci_desc,spci_gstp_id) values (nextval('spci_seq'),0,'Нет данных',1);

-- Типы атрибутов
insert into gis_attr_types(gstt_id,gstt_name,gstt_desc) values (1,'BEGIN_END','Атрибут интервальный BEGIN - END');
insert into gis_attr_types(gstt_id,gstt_name,gstt_desc) values (2,'SPCI_ID','Атрибут принадлежности дороги - ссылка на sprv_cis_info');



-- Отчёты
-- Группы
INSERT INTO sprv_report_types(sprt_id, sprt_name, sprt_desc) VALUES (1, 'Топливные', 'Отчёты по топливу');
INSERT INTO sprv_report_types(sprt_id, sprt_name, sprt_desc) VALUES (2, 'Навигационные', 'На основе данных навигации');
INSERT INTO sprv_report_types(sprt_id, sprt_name, sprt_desc) VALUES (3, 'Информационные', 'Дополнительные датчики, общая информация по объектам');
-- Отчёты
INSERT INTO sprv_reports (sprp_id, sprp_sprt_id, sprp_name, sprp_source, sprp_desc) VALUES (1, 2, 'Пробег', 'novoscanReport01', 'Отчёт о пробеге за указанный интервал дат');
INSERT INTO sprv_reports (sprp_id, sprp_sprt_id, sprp_name, sprp_source, sprp_desc) VALUES (2, 2, 'Скоростной режим', 'novoscanReport02', 'Скоростной режим выбранного объекта за интервал дат');
INSERT INTO sprv_reports (sprp_id, sprp_sprt_id, sprp_name, sprp_source, sprp_desc) VALUES (3, 1, 'Расход топлива', 'novoscanReport03', 'Расход топлива за интервал дат');
INSERT INTO sprv_reports (sprp_id, sprp_sprt_id, sprp_name, sprp_source, sprp_desc) VALUES (4, 3, 'Посещение геозон', 'novoscanReport02', 'Посещение геозон за интервал дат');
INSERT INTO sprv_reports (sprp_id, sprp_sprt_id, sprp_name, sprp_source, sprp_desc) VALUES (5, 3, 'Посещение геозон (с пробегом)', 'novoscanReport03', 'Посещение геозон за интервал дат с пробегом');
INSERT INTO sprv_reports (sprp_id, sprp_sprt_id, sprp_name, sprp_source, sprp_desc) VALUES (99, 3, 'Посещение геозоны (Трансерфинг)', 'novoscanReportTrans', 'Посещение геозон с пробегом для Трансерфинг');
INSERT INTO sprv_reports (sprp_id, sprp_sprt_id, sprp_name, sprp_source, sprp_desc) VALUES (98, 3, 'Работы в геозоне групповые (Трансерфинг)',
'novoscanReportTrans01', 'Расчёт перевезённого груза для Трансерфинг');
-- Параметры отчётов

INSERT INTO sprv_report_parameters(
            sppr_id, sppr_sprp_id, sppr_name, sppr_desc, sppr_type, sppr_valuen, 
            sppr_valued, sppr_valuev, sppr_hash_map)
    VALUES (nextval('sppr_seq'), 1, 'format', 'Формат файлов', 'LIST_STRING', null, 
            null, 'pdf', 'SELECT ''pdf'' AS key,''Acrobat Reader'' AS value UNION SELECT ''xls'' AS key,''Microsoft Exel'' AS value');

INSERT INTO sprv_report_parameters(
            sppr_id, sppr_sprp_id, sppr_name, sppr_desc, sppr_type, sppr_valuen, 
            sppr_valued, sppr_valuev, sppr_hash_map)
    VALUES (nextval('sppr_seq'), 1, 'date_beg', 'Дата начала', 'DATE', null, 
            null, null, null);

INSERT INTO sprv_report_parameters(
            sppr_id, sppr_sprp_id, sppr_name, sppr_desc, sppr_type, sppr_valuen, 
            sppr_valued, sppr_valuev, sppr_hash_map)
    VALUES (nextval('sppr_seq'), 1, 'date_end', 'Дата окончания', 'DATE', null, 
            null, null, null);

INSERT INTO sprv_report_parameters(
            sppr_id, sppr_sprp_id, sppr_name, sppr_desc, sppr_type, sppr_valuen, 
            sppr_valued, sppr_valuev, sppr_hash_map)
    VALUES (nextval('sppr_seq'), 1, 'spmd_uid', 'Ид объекта', 'LIST_STRING', null, 
            null, null, 'SELECT spob_name AS value, spmd_uid AS key FROM sprv_objects, sprv_modules WHERE spob_id = spmd_spob_id AND get_access_uid(:userId, to_char(spmd_uid,''FM99999999999999999999999999999999999'')) = 1');


----

INSERT INTO sprv_report_parameters(
            sppr_id, sppr_sprp_id, sppr_name, sppr_desc, sppr_type, sppr_valuen, 
            sppr_valued, sppr_valuev, sppr_hash_map)
    VALUES (nextval('sppr_seq'), 4, 'format', 'Формат отчёта', 'LIST_STRING', null, 
            null, 'pdf', 'SELECT ''pdf'' AS key,''Acrobat Reader'' AS value UNION SELECT ''xls'' AS key,''Microsoft Exel'' AS value');

INSERT INTO sprv_report_parameters(
            sppr_id, sppr_sprp_id, sppr_name, sppr_desc, sppr_type, sppr_valuen, 
            sppr_valued, sppr_valuev, sppr_hash_map)
    VALUES (nextval('sppr_seq'), 4, 'date_beg', 'Дата начала', 'DATE', null, 
            null, null, null);

INSERT INTO sprv_report_parameters(
            sppr_id, sppr_sprp_id, sppr_name, sppr_desc, sppr_type, sppr_valuen, 
            sppr_valued, sppr_valuev, sppr_hash_map)
    VALUES (nextval('sppr_seq'), 4, 'date_end', 'Дата окончания', 'DATE', null, 
            null, null, null);

INSERT INTO sprv_report_parameters(
            sppr_id, sppr_sprp_id, sppr_name, sppr_desc, sppr_type, sppr_valuen, 
            sppr_valued, sppr_valuev, sppr_hash_map)
    VALUES (nextval('sppr_seq'), 4, 'spmd_uid', 'Ид объекта', 'LIST_STRING', null, 
            null, null, 'SELECT spob_name AS value, spmd_uid AS key FROM sprv_objects, sprv_modules WHERE spob_id = spmd_spob_id AND get_access_uid(:userId, to_char(spmd_uid,''FM99999999999999999999999999999999999'')) = 1');

----
----

INSERT INTO sprv_report_parameters(
            sppr_id, sppr_sprp_id, sppr_name, sppr_desc, sppr_type, sppr_valuen, 
            sppr_valued, sppr_valuev, sppr_hash_map)
    VALUES (nextval('sppr_seq'), 5, 'format', 'Формат отчёта', 'LIST_STRING', null, 
            null, 'pdf', 'SELECT ''pdf'' AS key,''Acrobat Reader'' AS value UNION SELECT ''xls'' AS key,''Microsoft Exel'' AS value');

INSERT INTO sprv_report_parameters(
            sppr_id, sppr_sprp_id, sppr_name, sppr_desc, sppr_type, sppr_valuen, 
            sppr_valued, sppr_valuev, sppr_hash_map)
    VALUES (nextval('sppr_seq'), 5, 'date_beg', 'Дата начала', 'DATE', null, 
            null, null, null);

INSERT INTO sprv_report_parameters(
            sppr_id, sppr_sprp_id, sppr_name, sppr_desc, sppr_type, sppr_valuen, 
            sppr_valued, sppr_valuev, sppr_hash_map)
    VALUES (nextval('sppr_seq'), 5, 'date_end', 'Дата окончания', 'DATE', null, 
            null, null, null);

INSERT INTO sprv_report_parameters(
            sppr_id, sppr_sprp_id, sppr_name, sppr_desc, sppr_type, sppr_valuen, 
            sppr_valued, sppr_valuev, sppr_hash_map)
    VALUES (nextval('sppr_seq'), 5, 'spmd_uid', 'Ид объекта', 'LIST_STRING', null, 
            null, null, 'SELECT spob_name AS value, spmd_uid AS key FROM sprv_objects, sprv_modules WHERE spob_id = spmd_spob_id AND get_access_uid(:userId, to_char(spmd_uid,''FM99999999999999999999999999999999999'')) = 1');
----

INSERT INTO sprv_report_parameters(
            sppr_id, sppr_sprp_id, sppr_name, sppr_desc, sppr_type, sppr_valuen, 
            sppr_valued, sppr_valuev, sppr_hash_map)
    VALUES (nextval('sppr_seq'), 99, 'format', 'Формат отчёта', 'LIST_STRING', null, 
            null, 'pdf', 'SELECT ''pdf'' AS key,''Acrobat Reader'' AS value UNION SELECT ''xls'' AS key,''Microsoft Exel'' AS value');

INSERT INTO sprv_report_parameters(
            sppr_id, sppr_sprp_id, sppr_name, sppr_desc, sppr_type, sppr_valuen, 
            sppr_valued, sppr_valuev, sppr_hash_map)
    VALUES (nextval('sppr_seq'), 99, 'date_beg', 'Дата начала', 'DATE', null, 
            null, null, null);

INSERT INTO sprv_report_parameters(
            sppr_id, sppr_sprp_id, sppr_name, sppr_desc, sppr_type, sppr_valuen, 
            sppr_valued, sppr_valuev, sppr_hash_map)
    VALUES (nextval('sppr_seq'), 99, 'date_end', 'Дата окончания', 'DATE', null, 
            null, null, null);

INSERT INTO sprv_report_parameters(
            sppr_id, sppr_sprp_id, sppr_name, sppr_desc, sppr_type, sppr_valuen, 
            sppr_valued, sppr_valuev, sppr_hash_map)
    VALUES (nextval('sppr_seq'), 99, 'spmd_uid', 'Ид объекта', 'LIST_STRING', null, 
            null, null, 'SELECT spob_name AS value, spmd_uid AS key FROM sprv_objects, sprv_modules WHERE spob_id = spmd_spob_id AND get_access_uid(:userId, to_char(spmd_uid,''FM99999999999999999999999999999999999'')) = 1');

---

----

INSERT INTO sprv_report_parameters(
            sppr_id, sppr_sprp_id, sppr_name, sppr_desc, sppr_type, sppr_valuen, 
            sppr_valued, sppr_valuev, sppr_hash_map)
    VALUES (nextval('sppr_seq'), 98, 'format', 'Формат отчёта', 'LIST_STRING', null, 
            null, 'pdf', 'SELECT ''pdf'' AS key,''Acrobat Reader'' AS value UNION SELECT ''xls'' AS key,''Microsoft Exel'' AS value');

INSERT INTO sprv_report_parameters(
            sppr_id, sppr_sprp_id, sppr_name, sppr_desc, sppr_type, sppr_valuen, 
            sppr_valued, sppr_valuev, sppr_hash_map)
    VALUES (nextval('sppr_seq'), 98, 'date_beg', 'Дата начала', 'DATE', null, 
            null, null, null);

INSERT INTO sprv_report_parameters(
            sppr_id, sppr_sprp_id, sppr_name, sppr_desc, sppr_type, sppr_valuen, 
            sppr_valued, sppr_valuev, sppr_hash_map)
    VALUES (nextval('sppr_seq'), 98, 'date_end', 'Дата окончания', 'DATE', null, 
            null, null, null);

INSERT INTO sprv_report_parameters(
            sppr_id, sppr_sprp_id, sppr_name, sppr_desc, sppr_type, sppr_valuen, 
            sppr_valued, sppr_valuev, sppr_hash_map)
    VALUES (nextval('sppr_seq'), 98, 'gsdt_id', 'Ид зоны', 'LIST_STRING', null, 
            null, null, 'SELECT gsdt_id AS key, gsdt_info AS value FROM gis_data');

INSERT INTO sprv_report_parameters(
            sppr_id, sppr_sprp_id, sppr_name, sppr_desc, sppr_type, sppr_valuen, 
            sppr_valued, sppr_valuev, sppr_hash_map)
    VALUES (nextval('sppr_seq'), 98, 'DetailType', 'Степень детализации', 'LIST_STRING', null, 
            null, null, 'SELECT ''S'' AS key, ''Только итоги'' AS value UNION SELECT ''L'' AS key, ''Итоги и итоги по объекту'' AS value UNION SELECT ''F'' AS key, ''Полная детализация'' AS value');


----

INSERT INTO attributes(attr_id, attr_name, attr_type) VALUES (1, 'Профиль пользовтаеля', 'X');


COMMIT;
