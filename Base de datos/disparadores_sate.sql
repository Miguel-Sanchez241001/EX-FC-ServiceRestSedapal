
--------------------------------------------------------
--  DDL for Trigger BNTG_00_EMPRESA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BN_SATE"."BNTG_00_EMPRESA" 
 before insert on BN_SATE.BNSATE00_EMPRESA
FOR EACH ROW
BEGIN
  IF :new.B00_ID_EMP IS NULL THEN
    SELECT BNSQ_00_EMPRESA.nextval INTO :new.B00_ID_EMP FROM DUAL;
  END IF;
END;
/
ALTER TRIGGER "BN_SATE"."BNTG_00_EMPRESA" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BNTG_01_EST_EMPRESA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BN_SATE"."BNTG_01_EST_EMPRESA" 
 before insert on BN_SATE.BNSATE01_EST_EMPRESA
FOR EACH ROW
BEGIN
  IF :new.B01_ID_EST IS NULL THEN
    SELECT BNSQ_01_EST_EMPRESA.nextval INTO :new.B01_ID_EST FROM DUAL;
  END IF;
END;
/
ALTER TRIGGER "BN_SATE"."BNTG_01_EST_EMPRESA" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BNTG_02_REPRESENTANTE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BN_SATE"."BNTG_02_REPRESENTANTE" 
 before insert on BN_SATE.BNSATE02_USUARIO
FOR EACH ROW
BEGIN
  IF :new.B02_REP IS NULL THEN
    SELECT BNSQ_02_USUARIO.nextval INTO :new.B02_REP FROM DUAL;
  END IF;
END;
/
ALTER TRIGGER "BN_SATE"."BNTG_02_REPRESENTANTE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BNTG_02_USUARIO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BN_SATE"."BNTG_02_USUARIO" 
 before insert on BN_SATE.BNSATE02_USUARIO
FOR EACH ROW

DECLARE
   usuario_id number(6) := BN_SATE.BNSQ_02_USUARIO.nextval;

BEGIN
  IF :new.B02_REP IS NULL THEN
    SELECT usuario_id, CHR(65+TRUNC(usuario_id/POWER(26,3))) || CHR(65+TRUNC(MOD(usuario_id,POWER(26,3))/POWER(26,2))) || CHR(65+TRUNC(MOD(MOD(usuario_id,POWER(26,3)),POWER(26,2))/POWER(26,1))) || CHR(65+TRUNC(MOD(MOD(MOD(usuario_id,POWER(26,3)),POWER(26,2)),POWER(26,1))/POWER(26,0))) INTO :new.B02_REP, :new.B02_USERNAME FROM DUAL;
  END IF;
END;

/
ALTER TRIGGER "BN_SATE"."BNTG_02_USUARIO" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BNTG_03_REP_EMP
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BN_SATE"."BNTG_03_REP_EMP" 
 before insert on BN_SATE.BNSATE03_REP_EMP
FOR EACH ROW
BEGIN
  IF :new.B03_REPE IS NULL THEN
    SELECT BNSQ_03_REP_EMP.nextval INTO :new.B03_REPE FROM DUAL;
  END IF;
END;

/
ALTER TRIGGER "BN_SATE"."BNTG_03_REP_EMP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BNTG_04_ASIGNACION
--------------------------------------------------------
-- Unable to Render DDL with DBMS_METADATA using internal generator.
CREATE
TRIGGER 
"BNTG_04_ASIGNACION" 
 before insert on "BN_SATE"."BNSATE04_ASIGNACION"
FOR EACH ROW
BEGIN
  IF :new.B04_ID_CAS IS NULL THEN
    SELECT BNSQ_04_ASIGNACION.nextval INTO :new.B04_ID_CAS FROM DUAL;
  END IF;
END; 

/

--------------------------------------------------------
--  DDL for Trigger BNTG_05_TARJETA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BN_SATE"."BNTG_05_TARJETA" 
 before insert on BN_SATE.BNSATE05_TARJETA
FOR EACH ROW
BEGIN
  IF :new.B05_ID_TAR IS NULL THEN
    SELECT BNSQ_05_TARJETA.nextval INTO :new.B05_ID_TAR FROM DUAL;
  END IF;
END;

/
ALTER TRIGGER "BN_SATE"."BNTG_05_TARJETA" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BNTG_06_CLIENTE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BN_SATE"."BNTG_06_CLIENTE" 
 before insert on BN_SATE.BNSATE06_CLIENTE
FOR EACH ROW
BEGIN
  IF :new.B06_ID_CLI IS NULL THEN
    SELECT BNSQ_06_CLIENTE.nextval INTO :new.B06_ID_CLI FROM DUAL;
  END IF;
END;
/
ALTER TRIGGER "BN_SATE"."BNTG_06_CLIENTE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BNTG_07_EST_TARJETA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BN_SATE"."BNTG_07_EST_TARJETA" 
 before insert on BN_SATE.BNSATE07_EST_TARJETA
FOR EACH ROW
BEGIN
  IF :new.B07_ETA IS NULL THEN
    SELECT BNSQ_07_EST_TARJETA.nextval INTO :new.B07_ETA FROM DUAL;
  END IF;
END;

/
ALTER TRIGGER "BN_SATE"."BNTG_07_EST_TARJETA" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BNTG_08_USU_REP
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BN_SATE"."BNTG_08_USU_REP" 
 before insert on BN_SATE.BNSATE08_USU_REP
FOR EACH ROW
BEGIN
  IF :new.B08_ID_USU_REP IS NULL THEN
    SELECT BNSQ_08_USU_REP.nextval INTO :new.B08_ID_USU_REP FROM DUAL;
  END IF;
END;

/
ALTER TRIGGER "BN_SATE"."BNTG_08_USU_REP" ENABLE;