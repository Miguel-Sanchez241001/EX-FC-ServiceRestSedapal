--------------------------------------------------------
--  DDL for Index PK_BNSATE06_CLIENTE
--------------------------------------------------------

  CREATE UNIQUE INDEX "BN_SATE"."PK_BNSATE06_CLIENTE" ON "BN_SATE"."BNSATE06_CLIENTE" ("B06_ID_CLI") 
  ;
--------------------------------------------------------
--  DDL for Index PK_BNSATE07_EST_TARJETA
--------------------------------------------------------

  CREATE UNIQUE INDEX "BN_SATE"."PK_BNSATE07_EST_TARJETA" ON "BN_SATE"."BNSATE07_EST_TARJETA" ("B07_ETA") 
  ;
--------------------------------------------------------
--  DDL for Index PK_BNSATE10_PER_PERMISOS
--------------------------------------------------------

  CREATE UNIQUE INDEX "BN_SATE"."PK_BNSATE10_PER_PERMISOS" ON "BN_SATE"."BNSATE10_PER_PERMISOS" ("B10_ID_PER") 
  ;
--------------------------------------------------------
--  DDL for Index PK_BNSATE03_REP_EMP
--------------------------------------------------------

  CREATE UNIQUE INDEX "BN_SATE"."PK_BNSATE03_REP_EMP" ON "BN_SATE"."BNSATE03_REP_EMP" ("B03_REPE") 
  ;
--------------------------------------------------------
--  DDL for Index PK_BNSATE02_USUARIO
--------------------------------------------------------

  CREATE UNIQUE INDEX "BN_SATE"."PK_BNSATE02_USUARIO" ON "BN_SATE"."BNSATE02_USUARIO" ("B02_REP") 
  ;
--------------------------------------------------------
--  DDL for Index BNSATE08_USU_REP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BN_SATE"."BNSATE08_USU_REP_PK" ON "BN_SATE"."BNSATE08_USU_REP" ("B08_ID_USU_REP") 
  ;
--------------------------------------------------------
--  DDL for Index PK_BNSATE05_TARJETA
--------------------------------------------------------

  CREATE UNIQUE INDEX "BN_SATE"."PK_BNSATE05_TARJETA" ON "BN_SATE"."BNSATE05_TARJETA" ("B05_ID_TAR") 
  ;
--------------------------------------------------------
--  DDL for Index PK_BNSATE11_ROLES
--------------------------------------------------------

  CREATE UNIQUE INDEX "BN_SATE"."PK_BNSATE11_ROLES" ON "BN_SATE"."BNSATE11_ROLES" ("B11_ID_ROL") 
  ;
--------------------------------------------------------
--  DDL for Index BNSATE04_CODIGO_ASIGNACIO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BN_SATE"."BNSATE04_CODIGO_ASIGNACIO_PK" ON "BN_SATE"."BNSATE04_ASIGNACION" ("B04_ID_CAS") 
  ;
--------------------------------------------------------
--  DDL for Index PK_BNSATE00_EMPRESA
--------------------------------------------------------

  CREATE UNIQUE INDEX "BN_SATE"."PK_BNSATE00_EMPRESA" ON "BN_SATE"."BNSATE00_EMPRESA" ("B00_ID_EMP") 
  ;
--------------------------------------------------------
--  DDL for Index BNSATE05_TARJETA_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "BN_SATE"."BNSATE05_TARJETA_UK1" ON "BN_SATE"."BNSATE05_TARJETA" ("B05_NUM_TARJETA") 
  ;
--------------------------------------------------------
--  DDL for Index BNSATE06_CLIENTE_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "BN_SATE"."BNSATE06_CLIENTE_UK1" ON "BN_SATE"."BNSATE06_CLIENTE" ("B06_TIPO_DOCUMENTO", "B06_NUM_DOCUMENTO") 
  ;
--------------------------------------------------------
--  DDL for Index BNSATE02_USUARIO_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "BN_SATE"."BNSATE02_USUARIO_UK1" ON "BN_SATE"."BNSATE02_USUARIO" ("B02_TIPO_DOCUMENTO", "B02_NUM_DOCUMENTO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_BNSATE01_EST_EMPRESA
--------------------------------------------------------

  CREATE UNIQUE INDEX "BN_SATE"."PK_BNSATE01_EST_EMPRESA" ON "BN_SATE"."BNSATE01_EST_EMPRESA" ("B01_ID_EST") 
  ;
--------------------------------------------------------
--  DDL for Index BNSATE16_PARAMETRO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BN_SATE"."BNSATE16_PARAMETRO_PK" ON "BN_SATE"."BNSATE16_PARAMETRO" ("B16_ID_TABLA", "B16_ID_REGISTRO") 
  ;