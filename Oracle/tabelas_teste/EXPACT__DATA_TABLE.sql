REM INSERTING into SYS.EXPACT$
SET DEFINE OFF;
Insert into SYS.EXPACT$ (OWNER,NAME,FUNC_SCHEMA,FUNC_PACKAGE,FUNC_PROC,CODE,CALLORDER,CALLARG,OBJ_TYPE,USER_ARG) values ('OUTLN','OL$','SYS','OUTLN_PKG','DROP_EXTRAS_EXPACT','2','1',null,'2',null);
Insert into SYS.EXPACT$ (OWNER,NAME,FUNC_SCHEMA,FUNC_PACKAGE,FUNC_PROC,CODE,CALLORDER,CALLARG,OBJ_TYPE,USER_ARG) values ('OUTLN','OL$','SYS','OUTLN_PKG','DROP_UNREFD_HINTS_EXPACT','2','2',null,'2',null);
Insert into SYS.EXPACT$ (OWNER,NAME,FUNC_SCHEMA,FUNC_PACKAGE,FUNC_PROC,CODE,CALLORDER,CALLARG,OBJ_TYPE,USER_ARG) values ('OUTLN','OL$','SYS','OUTLN_PKG','DROP_COLLISION_EXPACT','2','3',null,'2',null);
Insert into SYS.EXPACT$ (OWNER,NAME,FUNC_SCHEMA,FUNC_PACKAGE,FUNC_PROC,CODE,CALLORDER,CALLARG,OBJ_TYPE,USER_ARG) values ('OUTLN','OL$','SYS','OUTLN_PKG','REFRESH_OUTLINE_CACHE_EXPACT','2','4',null,'2',null);