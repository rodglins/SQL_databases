REM INSERTING into SYS.DBMS_LOCK_ALLOCATED
SET DEFINE OFF;
Insert into SYS.DBMS_LOCK_ALLOCATED (NAME,LOCKID,EXPIRATION) values ('ORA$ORD_MODEL_LOCK','1073741824',to_timestamp('14-02-2019','DD-MM-YYYY HH.MI.SSXFF AM'));
Insert into SYS.DBMS_LOCK_ALLOCATED (NAME,LOCKID,EXPIRATION) values ('sqlpatch_global_lock','1073741844',to_timestamp('05-07-2021','DD-MM-YYYY HH.MI.SSXFF AM'));
Insert into SYS.DBMS_LOCK_ALLOCATED (NAME,LOCKID,EXPIRATION) values ('ORA$QP_CONTROL_LOCK','1073741845',to_timestamp('06-10-2021','DD-MM-YYYY HH.MI.SSXFF AM'));
Insert into SYS.DBMS_LOCK_ALLOCATED (NAME,LOCKID,EXPIRATION) values ('ORA$KU$DATAPUMP_SW_UPDATE','1073741846',to_timestamp('21-10-2021','DD-MM-YYYY HH.MI.SSXFF AM'));
