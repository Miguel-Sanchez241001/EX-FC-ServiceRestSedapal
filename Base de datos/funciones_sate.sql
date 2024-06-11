--------------------------------------------------------
--  DDL for Function GENERAR_TRACE
--------------------------------------------------------
  CREATE OR REPLACE EDITIONABLE FUNCTION "BN_SATE"."GENERAR_TRACE" RETURN VARCHAR2 IS
    v_codigo VARCHAR2(6);
    v_fecha DATE := TRUNC(SYSDATE); -- Obtener la fecha actual sin la hora
    v_existencia NUMBER;
BEGIN
        SELECT TO_CHAR(BNSQ_COD_TRACE.NEXTVAL) INTO v_codigo FROM dual;
        -- Concatenar la fecha actual con el código generado
        v_codigo := TO_CHAR(v_fecha, 'DD') || LPAD(v_codigo,4,'0');
    RETURN v_codigo;
END GENERAR_TRACE;

/