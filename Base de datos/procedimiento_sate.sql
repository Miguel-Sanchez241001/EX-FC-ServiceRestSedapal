
--------------------------------------------------------
--  DDL for Procedure BNPD_00_SOLICITUD_GEN_1
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BN_SATE"."BNPD_00_SOLICITUD_GEN_1" 
IS
      -- Declaración de variables
CURSOR c_solicitudes IS

SELECT
-- CABECERA DE CADA TRAMA   -- 74   
    LPAD(
        LPAD(UPPER('B'), 1, '0') || -- Tipo de Registro
        LPAD(UPPER('0302'), 4, '0') || -- solicitud
        LPAD(UPPER('0'), 16, '0') || -- Bit map de campos
        LPAD(UPPER('19'), 2, '0') || -- long DE02
        LPAD(UPPER('0'), 19, '0') || -- DE02 - Numero de Cuenta    
        TO_CHAR(SYSDATE, 'MMDDHHMISS')   -- DE07 - Fecha y Hora:
        , 52, '0') AS TRAMA1,  
  
    LPAD(UPPER(GENERAR_TRACE()), 6, '0')  -- DE11 - Trace
    AS TRAMA2,  
  
   RPAD(
        LPAD(UPPER('11'), 2, '0') || -- long DE33 valor = "11"
        LPAD(UPPER('00000000000'), 11, '0') || -- DE33 valor = "00000000000"
        LPAD(UPPER('926'), 3, '0') || -- long DE48 valor = "926"
        
        -- ESTRUCTURA   TRAMA 
        LPAD(UPPER('0101'), 4, '0') ||                             -- Transaccion-type = "0101"
        LPAD(UPPER('0'), 1, '0') ||                                -- Data compres = "0"
        LPAD(UPPER('0000'), 4, '0') ||                             -- Data sequent = "0000"
        LPAD(UPPER('N'), 1, '0') ||                                -- more data = "N"
        LPAD(UPPER('0'), 15, '0') ||                               -- Código BT = 000000000000000
           -- CLIENTE 
        LPAD(UPPER(NVL(cli.B06_TIPO_DOCUMENTO, 0)), 1, '0') ||     -- Tipo de documento
        LPAD(UPPER(NVL(cli.B06_NUM_DOCUMENTO, 0)), 12, '0') ||     -- Numero de documento
        RPAD(UPPER(NVL(TRIM(cli.B06_APPATERNO) || ' ' ||
        TRIM(cli.B06_APMATERNO), '0')), 30, ' ') ||          -- Apellidos funcionario
        RPAD(UPPER(NVL(cli.B06_NOMBRES, '0')), 30, ' ') ||         -- Nombre funcionario
        UPPER(NVL(cli.B06_EST_CIVIL, ' ')) ||                      -- Estado Civil
        UPPER(NVL(cli.B06_SEXO, ' ')) ||                           -- Sexo
        RPAD(UPPER(NVL(tar.B05_EMAIL, '0')), 57, ' ') ||           -- E-Mail 
        -- CLIENTE DOMICILIO
        LPAD(UPPER(' '), 5, ' ') ||  -- Dirección domicilio: Tipo de Via 
        LPAD(UPPER(NVL(cli.B06_DIRECCION,' ')), 30, ' ') ||  -- Dirección domicilio: Nombre de Via
        LPAD(UPPER(' '), 6, ' ') ||  -- Dirección domicilio: Número de Via/Calle
        LPAD(UPPER(' '), 6, ' ') ||  -- Dirección domicilio: Departamento
        LPAD(UPPER(' '), 5, ' ') ||  -- Dirección domicilio: Oficina
        LPAD(UPPER(' '), 3, ' ') ||  -- Dirección domicilio: Piso
        LPAD(UPPER(' '), 3, ' ') ||  -- Dirección domicilio: Manzana
        LPAD(UPPER(' '), 3, ' ') ||  -- Dirección domicilio: Lote
        LPAD(UPPER(' '), 3, ' ') ||  -- Dirección domicilio: Interior
        LPAD(UPPER(' '), 3, ' ') ||  -- Dirección domicilio: Sector
        LPAD(UPPER(' '), 5, ' ') ||  -- Dirección domicilio: Kilometro
        LPAD(UPPER(' '), 5, ' ') ||  -- Dirección domicilio: Código de zona
        LPAD(UPPER(NVL(cli.B06_DIRECCION_MC,' ')), 30, ' ') ||  -- Dirección domicilio: Nombre de zona
        LPAD(UPPER(NVL(cli.B06_UBIGEO, 0)), 9, '0') ||  -- UBIGEO
        RPAD(UPPER(NVL(cli.B06_REFERENCIA, ' ')), 55, ' ') ||  -- REFERENCIA
        LPAD(UPPER(NVL(cli.B06_TELEF_CASA, 0)), 10, '0') ||  -- TELEFONO
        LPAD(UPPER(NVL(tar.B05_NUM_CELULAR, 0)), 10, '0') ||  -- NUMERO
        -- EMPRESA 
        RPAD(UPPER(NVL(emp.B00_RAZON_SOCIAL, ' ')), 30, ' ') ||  -- Nombre empresa
        -- EMPRESA DIRECCION
        LPAD(UPPER('0'), 5, '0') ||                              -- Dirección trabajo: Tipo de Via
        RPAD(UPPER(NVL(emp.B00_DIRECCION, ' ')), 30, ' ') ||   -- Dirección trabajo: Nombre de Via
        LPAD(UPPER(' '), 6, ' ') ||  -- Dirección trabajo: Número de Via/Calle
        LPAD(UPPER(' '), 6, ' ') ||  -- Dirección trabajo: Departamento
        LPAD(UPPER(' '), 5, ' ') ||  -- Dirección trabajo: Oficina
        LPAD(UPPER(' '), 3, ' ') ||  -- Dirección trabajo: Piso
        LPAD(UPPER(' '), 3, ' ') ||  -- Dirección trabajo: Manzana
        LPAD(UPPER(' '), 3, ' ') ||  -- Dirección trabajo: Lote
        LPAD(UPPER(' '), 3, ' ') ||  -- Dirección trabajo: Interior
        LPAD(UPPER(' '), 3, ' ') ||  -- Dirección trabajo: Sector
        LPAD(UPPER(' '), 5, ' ') ||  -- Dirección trabajo: Kilometro
        LPAD(UPPER(' '), 5, ' ') ||  -- Dirección trabajo: Código de zona
        LPAD(UPPER(NVL(emp.B00_DIRECCION_MC, ' ')), 30, ' ') ||  -- Dirección trabajo: Nombre de zona
         LPAD(NVL(emp.B00_UBIGEO, 0), 9, '0') ||  -- Dirección trabajo: Ubigeo
      RPAD(UPPER(NVL(emp.B00_REFERENCIA, ' ')), 55, ' ') || -- Dirección trabajo: referencia
      LPAD(UPPER(NVL(emp.B00_TELEFONO, 0)), 10, '0') || -- Dirección trabajo: TELEFONO
      LPAD(UPPER(' '), 4, ' ') || -- Dirección trabajo: Telefono Anexo
      LPAD(UPPER(' '), 30, ' ') || -- Nombre conyuge
      LPAD(UPPER(' '), 30, ' ') || -- Nombre trabajo de conyugue
      LPAD(UPPER(' '), 10, ' ') || -- Nombre telefono de conyugue
      LPAD(UPPER(' '), 4, ' ') || -- Nombre anexo de telefono de conyugue
      LPAD(UPPER(' '), 55, ' ') || -- Nombre referencia personal
      LPAD(UPPER('3'), 1, ' ') || -- Indicador de envio de correo (Carrier Route)
      LPAD(UPPER('001'), 3, ' ') || -- Logo
      LPAD(UPPER('000000000'), 9, '0') || -- Línea de crédito
      LPAD(UPPER('604'), 3, '0') || -- Moneda de cuenta
      LPAD(UPPER('00'), 2, '0') || -- Ciclo de cuenta
      RPAD(UPPER(NVL(TO_CHAR(cli.B06_FEC_NACIMIENTO, 'YYYYMMDD'),' ')), 8, ' ') || -- Fecha de nacimiento
      LPAD(UPPER('0'), 9, '0') || -- Sueldo
      LPAD(UPPER('STD'), 3, '0') || -- PCT
      LPAD(UPPER('0000'), 4, ' ') || -- CDR origen
      LPAD(UPPER('00000'), 5, ' ') || -- Código de funcionario
      LPAD(UPPER('Y'), 1, ' ') || -- Limite de disposición de efectivo
      LPAD(UPPER('3'), 1, ' ') || -- Indicador de envio de EECC
      LPAD(UPPER('000'), 3, '0') || -- Código de unidad ejecutora
      LPAD(UPPER(' '), 5, ' ') || -- Dirección envío de EECC: Tipo de Via
      LPAD(UPPER(' '), 30, ' ') || -- Dirección envío de EECC: Nombre de Via
      LPAD(UPPER(' '), 6, ' ') || -- Dirección envío de EECC: Número de Via/Calle
      LPAD(UPPER(' '), 6, ' ') || -- Dirección envío de EECC: Departamento
      LPAD(UPPER(' '), 5, ' ') || -- Dirección envío de EECC: Oficina
      LPAD(UPPER(' '), 3, ' ') || -- Dirección envío de EECC: Piso
      LPAD(UPPER(' '), 3, ' ') || -- Dirección envío de EECC: Manzana
      LPAD(UPPER(' '), 3, ' ') || -- Dirección envío de EECC: Lote
      LPAD(UPPER(' '), 3, ' ') || -- Dirección envío de EECC: Interior
      LPAD(UPPER(' '), 3, ' ') || -- Dirección envío de EECC: Sector
      LPAD(UPPER(' '), 5, ' ') || -- Dirección envío de EECC: Kilometro
      LPAD(UPPER(' '), 5, ' ') || -- Dirección envío de EECC: Código de zona
      LPAD(UPPER(' '), 30, ' ') || -- Dirección envío de EECC: Nombre de zona
      LPAD(UPPER(' ') ,9, ' ') || -- Dirección envío de EECC: Ubigeo
      LPAD(UPPER(' '), 55, ' ') || -- Dirección envío de EECC: Referencia
      LPAD(UPPER('S'), 1, '0') || -- Indicador de Cargo
      LPAD(UPPER('0'), 1, '0') || -- Indicador de disposición de efectivo (botones)
      LPAD(UPPER('0'), 1, '0') || -- Indicador de sobregiro (botones)
      LPAD(UPPER('0'), 1, '0') || -- Indicador de compras en el exterior (botones)
      LPAD(UPPER('0'), 1, '0') -- Indicador de compras web (botones)
      , 936, '0') AS TRAMA3,
 
tar.B05_ID_TAR as ID_TARJETA
FROM BN_SATE.BNSATE05_TARJETA tar
JOIN BN_SATE.BNSATE06_CLIENTE cli
  ON tar.B06_ID_CLI = cli.B06_ID_CLI
JOIN BN_SATE.BNSATE00_EMPRESA emp
  ON tar.B00_ID_EMP=emp.B00_ID_EMP
JOIN BN_SATE.BNSATE07_EST_TARJETA eta
  ON eta.B05_ID_TAR = tar.B05_ID_TAR
INNER JOIN (SELECT tar1.B05_ID_TAR, MAX(eta1.B07_FEC_REGISTRO) B07_FEC_REGISTRO FROM BN_SATE.BNSATE05_TARJETA tar1
JOIN BNSATE07_EST_TARJETA eta1 ON eta1.B05_ID_TAR = tar1.B05_ID_TAR
 GROUP BY tar1.B05_ID_TAR) q ON tar.B05_ID_TAR = q.B05_ID_TAR AND eta.B07_FEC_REGISTRO = q.B07_FEC_REGISTRO 
-- GROUP BY tar1.B05_ID_TAR) q ON tar.B05_ID_TAR = q.B05_ID_TAR
WHERE eta.B07_ESTADO = 2;
  
  
  
    v_total_registros NUMBER := 0; -- Inicializamos la variable a cero
   
BEGIN
  -- Sumar uno a la variable en cada iteración del bucle
   FOR FILA IN c_solicitudes LOOP
      v_total_registros := v_total_registros + 1;
   END LOOP;

 -- PRIMERA LINEA HEADER A19
   dbms_output.put_line(
   'A' ||                               --Tipo de Registro "A"
   '019' ||                             -- Código de emisor: "019"
   TO_CHAR(SYSDATE, 'DDMMYYYY')    ||   -- FECHA ACTUAL
   LPAD(v_total_registros, 6, '0') ||   -- Número Total de Registros de Datos
   LPAD(' ',982 , ' '));
   
   -- REGISTRANDO TRAMAS TXT
   FOR FILA IN c_solicitudes LOOP
       INSERT INTO BNSATE18_TRACE_TRAMA (B18_TRACE_CODE, B18_FECHA, B18_DATOS)
        VALUES (FILA.TRAMA2, SYSDATE, FILA.TRAMA1||FILA.TRAMA2||FILA.TRAMA3);
   dbms_output.put_line(FILA.TRAMA1||FILA.TRAMA2||FILA.TRAMA3);
   END LOOP;
END BNPD_00_SOLICITUD_GEN_1;

/

--------------------------------------------------------
--  DDL for Procedure BNPD_01_SOLICITUD_GEN_2
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BN_SATE"."BNPD_01_SOLICITUD_GEN_2" 
IS
BEGIN
INSERT INTO BN_SATE.BNSATE07_EST_TARJETA eta (eta.B05_ID_TAR, eta.B07_ESTADO, eta.B07_MOTIVO, B07_FEC_REGISTRO) SELECT tar.B05_ID_TAR,'3',NULL,SYSDATE FROM BNSATE05_TARJETA tar 
JOIN BN_SATE.BNSATE07_EST_TARJETA eta ON eta.B05_ID_TAR = tar.B05_ID_TAR 
INNER JOIN (SELECT tar1.B05_ID_TAR, MAX(eta1.B07_FEC_REGISTRO) B07_FEC_REGISTRO FROM BN_SATE.BNSATE05_TARJETA tar1
JOIN BN_SATE.BNSATE07_EST_TARJETA eta1 ON eta1.B05_ID_TAR = tar1.B05_ID_TAR 
GROUP BY tar1.B05_ID_TAR) q ON tar.B05_ID_TAR = q.B05_ID_TAR AND eta.B07_FEC_REGISTRO = q.B07_FEC_REGISTRO 
WHERE eta.B07_ESTADO = 2;
END BNPD_01_SOLICITUD_GEN_2;

/

--------------------------------------------------------
--  DDL for Procedure BNPD_02_SOLICITUD_ACT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BN_SATE"."BNPD_02_SOLICITUD_ACT" 
IS
BEGIN
UPDATE BN_SATE.BNSATE05_TARJETA tar
   SET (tar.B05_NUM_CUENTA, tar.B05_NUM_TARJETA, tar.B05_FEC_VENCIMIENTO, tar.B05_MONTO_LINEA_ASIGNADO, tar.B05_EST_CUENTA, tar.B05_FEC_APERTURA_CUENTA) = 
   (SELECT rpt.B12_NUMERO_CUENTA, rpt.B12_NUMERO_TARJETA, rpt.B12_FECHA_VENCIMIENTO_TARJETA, rpt.B12_LINEA_CREDITO, rpt.B12_BLOQUEO_2_CUENTA, rpt.B12_FECHA_APERTURA_CUENTA
   FROM BN_SATE.BNSATE12_RPTA_MC_TEMP rpt
   WHERE tar.B05_ID_TAR = rpt.B12_TRACE AND rpt.B12_TIPO_RESPUESTA = '0' AND rpt.B12_FECHA_REGISTRO = 
   (SELECT MAX(B12_FECHA_REGISTRO) FROM BN_SATE.BNSATE12_RPTA_MC_TEMP tem WHERE rpt.B12_TRACE = tem.B12_TRACE AND tem.B12_TIPO_RESPUESTA = '0'))
 WHERE EXISTS (
    SELECT ''
      FROM BN_SATE.BNSATE12_RPTA_MC_TEMP rpt
      WHERE tar.B05_ID_TAR = rpt.B12_TRACE);
      
    INSERT INTO BN_SATE.BNSATE07_EST_TARJETA eta (eta.B05_ID_TAR, eta.B07_ESTADO, eta.B07_MOTIVO, B07_FEC_REGISTRO) 
    SELECT rpt.B12_TRACE,'5',NVL(rpt.B12_BLOQUEO_1_TARJETA,'N'),SYSDATE FROM BN_SATE.BNSATE12_RPTA_MC_TEMP rpt;
    
    DELETE FROM BN_SATE.BNSATE12_RPTA_MC_TEMP rpt WHERE rpt.B12_TIPO_RESPUESTA = '0';
    
     COMMIT;


END BNPD_02_SOLICITUD_ACT;

/

--------------------------------------------------------
--  DDL for Procedure BNPD_03_BLOQUEO_GEN_1
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BN_SATE"."BNPD_03_BLOQUEO_GEN_1" 
IS
BEGIN
   -- Open the cursor and loop through the records
   FOR FILA IN (SELECT RPAD(NVL(tar.B05_EST_CUENTA,' '),1,' ') || RPAD(NVL(tar.B05_EST_CUENTA,' '),1,' ') || NVL(tar.B05_ENTREGA_UBICACION,'0') || LPAD(NVL(tar.B05_ENTREGA_AGENCIA_BN,'0'),11,'0') || NVL(tar.B05_ENTREGA_DIRECCION_MC,LPAD(' ',35,' ')||LPAD('0',6,'0')||LPAD(' ',66,' ')) || LPAD(NVL(tar.B05_ENTREGA_UBIGEO,0), 9,'0') || RPAD(NVL(tar.B05_ENTREGA_REFERENCIA,' '),55,' ') as TRAMA, tar.B05_ID_TAR as ID_TARJETA
FROM BN_SATE.BNSATE05_TARJETA tar 
WHERE tar.b05_flag_act_est_cuenta = '1') LOOP
   dbms_output.put_line(FILA.TRAMA);
   END LOOP;
END BNPD_03_BLOQUEO_GEN_1;

/

--------------------------------------------------------
--  DDL for Procedure BNPD_04_BLOQUEO_GEN_2
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BN_SATE"."BNPD_04_BLOQUEO_GEN_2" 
IS
BEGIN
   UPDATE BN_SATE.BNSATE05_TARJETA SET b05_flag_act_est_cuenta = '0' WHERE b05_flag_act_est_cuenta = '1';
   COMMIT;
END BNPD_04_BLOQUEO_GEN_2;

/

--------------------------------------------------------
--  DDL for Procedure BNPD_05_BLOQUEO_ACT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BN_SATE"."BNPD_05_BLOQUEO_ACT" 
IS
BEGIN 

    UPDATE BN_SATE.BNSATE05_TARJETA tar
   SET (tar.B05_EST_CUENTA) = (SELECT rpt.B12_CODIGO_BLOQUEO
   FROM BN_SATE.BNSATE12_RPTA_MC_TEMP rpt
   WHERE tar.B05_ID_TAR = rpt.B12_TRACE AND rpt.B12_TIPO_RESPUESTA = '1' AND rpt.B12_FECHA_REGISTRO = 
   (SELECT MAX(B12_FECHA_REGISTRO) FROM BN_SATE.BNSATE12_RPTA_MC_TEMP tem WHERE rpt.B12_TRACE = tem.B12_TRACE AND tem.B12_TIPO_RESPUESTA = '1'))
 WHERE EXISTS (
    SELECT ''
      FROM BN_SATE.BNSATE12_RPTA_MC_TEMP rpt
      WHERE tar.B05_ID_TAR = rpt.B12_TRACE);
    
        DELETE FROM BN_SATE.BNSATE12_RPTA_MC_TEMP rpt WHERE rpt.B12_TIPO_RESPUESTA = '1';
    
     COMMIT;


END BNPD_05_BLOQUEO_ACT;

/

--------------------------------------------------------
--  DDL for Procedure BNPD_06_CONTACTO_GEN_1
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BN_SATE"."BNPD_06_CONTACTO_GEN_1" 
IS
BEGIN
   -- Open the cursor and loop through the records
   FOR FILA IN (SELECT LPAD(NVL(emp.B00_NUM_RUC,0),11,'0') || TO_CHAR(SYSDATE, 'YYYYMMDD') || TO_CHAR(SYSDATE, 'MMDDHHMISS') || LPAD(NVL(tar.B05_ID_TAR,0),6,'0') || RPAD(NVL(TRIM(cli.B06_APPATERNO)||' '||TRIM(cli.B06_APMATERNO),' '),30,' ') || RPAD(NVL(cli.B06_NOMBRES,' '),30,' ') || NVL(cli.B06_TIPO_DOCUMENTO,0) || LPAD(NVL(cli.B06_NUM_DOCUMENTO,0),12,'0') || RPAD(NVL(TO_CHAR(cli.B06_FEC_NACIMIENTO, 'YYYYMMDD'),' '),8,' ') || NVL(cli.B06_SEXO,' ') || NVL(cli.B06_EST_CIVIL,' ') || NVL(cli.B06_DIRECCION_MC,LPAD(' ',35,' ')||LPAD('0',6,'0')||LPAD(' ',66,' ')) || LPAD(NVL(cli.B06_UBIGEO,0), 9,'0') || RPAD(NVL(cli.B06_REFERENCIA,' '),55,' ') || LPAD(NVL(cli.B06_TELEF_CASA,0),10,'0') || LPAD(NVL(tar.B05_NUM_CELULAR,0),10,'0') || RPAD(NVL(tar.B05_EMAIL,' '),30,' ') || RPAD('0',9,'0') || RPAD(NVL(emp.B00_NOMBRE_CORTO,' '),30,' ') || LPAD(NVL(emp.B00_NUM_RUC,0),11,'0') || NVL(emp.B00_DIRECCION_MC,LPAD(' ',35,' ')||LPAD('0',6,'0')||LPAD(' ',66,' ')) || LPAD(NVL(emp.B00_UBIGEO,0), 9,'0') || RPAD(NVL(emp.B00_REFERENCIA,' '),55,' ') || RPAD('0',10,'0') || NVL(tar.B05_ENTREGA_UBICACION,'0') || LPAD(NVL(tar.B05_ENTREGA_AGENCIA_BN,'0'),5,'0') || NVL(tar.B05_ENTREGA_DIRECCION_MC,LPAD(' ',35,' ')||LPAD('0',6,'0')||LPAD(' ',66,' ')) || LPAD(NVL(tar.B05_ENTREGA_UBIGEO,0), 9,'0') || RPAD(NVL(tar.B05_ENTREGA_REFERENCIA,' '),55,' ') || LPAD(NVL(tar.B05_TIPO_MONEDA,0), 3,'0') || '31' || LPAD(NVL(tar.B05_TIPO_TARJETA,0), 6,'0') || 'STD' || '3' || 'N' || 'D' || LPAD(NVL(emp.B00_NUM_CUENTA_CORRIENTE,0),17,'0') || LPAD(0,5,0) || LPAD(0,5,0) || 'T' || LPAD(' ',5,' ') || LPAD(NVL(tar.B05_DISENO,0), 1,'0') || LPAD(tar.B05_NUM_CELULAR,10,0) || RPAD(tar.B05_EMAIL,30,' ') as TRAMA, tar.B05_ID_TAR as ID_TARJETA
FROM BN_SATE.BNSATE05_TARJETA tar 
JOIN BN_SATE.BNSATE06_CLIENTE cli ON tar.B06_ID_CLI = cli.B06_ID_CLI 
JOIN BN_SATE.BNSATE00_EMPRESA emp ON tar.B00_ID_EMP=emp.B00_ID_EMP 
WHERE tar.b05_flag_act_contacto = '1' ) LOOP
   dbms_output.put_line(FILA.TRAMA);
   END LOOP;
END BNPD_06_CONTACTO_GEN_1;

/

--------------------------------------------------------
--  DDL for Procedure BNPD_07_CONTACTO_GEN_2
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BN_SATE"."BNPD_07_CONTACTO_GEN_2" 
IS
BEGIN
   UPDATE BN_SATE.BNSATE05_TARJETA SET b05_flag_act_contacto = '0' WHERE b05_flag_act_contacto = '1';
   COMMIT;
END BNPD_07_CONTACTO_GEN_2;

/

--------------------------------------------------------
--  DDL for Procedure BNPD_08_CONTACTO_ACT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BN_SATE"."BNPD_08_CONTACTO_ACT" 
IS
BEGIN
    
         UPDATE BN_SATE.BNSATE05_TARJETA tar
   SET (tar.B05_NUM_CELULAR, tar.B05_EMAIL) = (SELECT rpt.B12_CELULAR, rpt.B12_EMAIL
   FROM BN_SATE.BNSATE12_RPTA_MC_TEMP rpt
   WHERE tar.B05_ID_TAR = rpt.B12_TRACE AND rpt.B12_TIPO_RESPUESTA = '2' AND rpt.B12_FECHA_REGISTRO = 
   (SELECT MAX(B12_FECHA_REGISTRO) FROM BN_SATE.BNSATE12_RPTA_MC_TEMP tem WHERE rpt.B12_TRACE = tem.B12_TRACE AND tem.B12_TIPO_RESPUESTA = '2'))
 WHERE EXISTS (
    SELECT ''
      FROM BN_SATE.BNSATE12_RPTA_MC_TEMP rpt
      WHERE tar.B05_ID_TAR = rpt.B12_TRACE);
    
        DELETE FROM BN_SATE.BNSATE12_RPTA_MC_TEMP rpt WHERE rpt.B12_TIPO_RESPUESTA = '2';
    
     COMMIT;
     
END BNPD_08_CONTACTO_ACT;

/

--------------------------------------------------------
--  DDL for Procedure BNPD_09_CUENTA_ACT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BN_SATE"."BNPD_09_CUENTA_ACT" 
IS
BEGIN
  
      UPDATE BN_SATE.BNSATE05_TARJETA tar
   SET ( tar.B05_FEC_AUTORIZACION, tar.B05_FEC_INICIO_LINEA, tar.B05_FEC_TERMINO_LINEA, tar.B05_MONTO_LINEA_ASIGNADO) = 
   (SELECT rpt.b13_fec_inicio_aut,rpt.b13_fec_inicio_aut,rpt.b13_fec_fin_aut,rpt.b13_importe
   FROM BN_SATE.BNSATE13_RPTA_MEF_TEMP rpt
   WHERE SUBSTR(tar.B05_NUM_TARJETA,1,4) = SUBSTR(rpt.B13_NUM_TARJETA_AUT,1,4) AND SUBSTR(tar.B05_NUM_TARJETA,13,4) = SUBSTR(rpt.B13_NUM_TARJETA_AUT,13,4) AND rpt.B13_FECHA_REGISTRO = 
   (SELECT MAX(B13_FECHA_REGISTRO) FROM BN_SATE.BNSATE13_RPTA_MEF_TEMP tem WHERE tem.B13_NUM_TARJETA_AUT = rpt.B13_NUM_TARJETA_AUT))
 WHERE EXISTS (
    SELECT ''
      FROM BN_SATE.BNSATE13_RPTA_MEF_TEMP rpt
      WHERE SUBSTR(tar.B05_NUM_TARJETA,1,4) = SUBSTR(rpt.B13_NUM_TARJETA_AUT,1,4) AND SUBSTR(tar.B05_NUM_TARJETA,13,4) = SUBSTR(rpt.B13_NUM_TARJETA_AUT,13,4));
    

     UPDATE  BN_SATE.BNSATE00_EMPRESA emp
   SET ( emp.B00_NUM_CUENTA_CORRIENTE) = 
   (SELECT distinct rpt.B13_CUENTA_CARGO FROM BN_SATE.BNSATE13_RPTA_MEF_TEMP rpt JOIN BN_SATE.BNSATE05_TARJETA tar ON (SUBSTR(tar.B05_NUM_TARJETA,1,4) = SUBSTR(rpt.B13_NUM_TARJETA_AUT,1,4) AND SUBSTR(tar.B05_NUM_TARJETA,13,4) = SUBSTR(rpt.B13_NUM_TARJETA_AUT,13,4)) WHERE tar.B00_ID_EMP = emp.b00_id_emp)
 WHERE EXISTS (
    SELECT ''
      FROM BN_SATE.BNSATE13_RPTA_MEF_TEMP rpt JOIN BN_SATE.BNSATE05_TARJETA tar ON (SUBSTR(tar.B05_NUM_TARJETA,1,4) = SUBSTR(rpt.B13_NUM_TARJETA_AUT,1,4) AND SUBSTR(tar.B05_NUM_TARJETA,13,4) = SUBSTR(rpt.B13_NUM_TARJETA_AUT,13,4)) WHERE tar.B00_ID_EMP = emp.b00_id_emp);
            DELETE FROM BN_SATE.BNSATE13_RPTA_MEF_TEMP rpt;
     COMMIT;

END BNPD_09_CUENTA_ACT;

/

--------------------------------------------------------
--  DDL for Procedure BNPD_10_TRUNCAR_TEMP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BN_SATE"."BNPD_10_TRUNCAR_TEMP" 
IS
BEGIN
    execute immediate ' TRUNCATE TABLE BN_SATE.BNSATE12_RPTA_MC_TEMP';
    execute immediate ' TRUNCATE TABLE BN_SATE.BNSATE13_RPTA_MEF_TEMP';
     COMMIT;
END BNPD_10_TRUNCAR_TEMP;

/

--------------------------------------------------------
--  DDL for Procedure BNPD_11_TRUNCAR_HIS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BN_SATE"."BNPD_11_TRUNCAR_HIS" 
IS
BEGIN
    
    execute immediate ' TRUNCATE TABLE BN_SATE.BNSATE14_TRANSACCION_HIS';
    execute immediate ' TRUNCATE TABLE BN_SATE.BNSATE15_CARGO_HIS';
     COMMIT;

END BNPD_11_TRUNCAR_HIS;

/

--------------------------------------------------------
--  DDL for Procedure BNPD_12_ASIGNACION_ACT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BN_SATE"."BNPD_12_ASIGNACION_ACT" 
IS
BEGIN
    
MERGE INTO BN_SATE.BNSATE04_ASIGNACION cas
USING (SELECT * FROM BN_SATE.BNSATE05_TARJETA tar JOIN BN_SATE.BNSATE12_RPTA_MC_TEMP rpt ON (tar.B05_NUM_CUENTA = SUBSTR(rpt.B12_NUMERO_CUENTA,4,16)) 
WHERE rpt.B12_TIPO_RESPUESTA = '3' AND rpt.B12_FECHA_REGISTRO = (SELECT MAX(B12_FECHA_REGISTRO) FROM BN_SATE.BNSATE12_RPTA_MC_TEMP tem WHERE rpt.B12_NUMERO_CUENTA = tem.B12_NUMERO_CUENTA AND tem.B12_TIPO_RESPUESTA = '3')) rptar 
ON (cas.B04_CODIGO_ASIGNACION = rptar.B12_CODIGO_ASIGNACION)
WHEN NOT MATCHED THEN INSERT (B05_ID_TAR,B04_CODIGO_ASIGNACION,B04_FECHA_INICIO_LINEA,B04_FECHA_FIN_LINEA,B04_FECHA_REGISTRO) VALUES (rptar.B05_ID_TAR,rptar.B12_CODIGO_ASIGNACION,rptar.B12_FECHA_INICIO_LINEA,rptar.B12_FECHA_FIN_LINEA,SYSDATE)
WHEN MATCHED THEN UPDATE set B04_FECHA_FIN_LINEA = rptar.B12_FECHA_FIN_LINEA;

DELETE FROM BN_SATE.BNSATE12_RPTA_MC_TEMP rpt WHERE rpt.B12_TIPO_RESPUESTA = '3';
    
COMMIT;
     
END BNPD_12_ASIGNACION_ACT;

/

