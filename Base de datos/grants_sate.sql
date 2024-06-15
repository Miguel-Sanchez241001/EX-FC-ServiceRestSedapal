--Otorgar rol BNRL_CONEXION al usuario BN_SATE
--Otorgar rol BNRL_SATE al usuario DB_SATE
--Otorgar UNLIMITED TABLESPACE al usuario BN_SATE

--Otorgar rol BNRL_COCP al usuario BN_SATE
GRANT "BNRL_COCP" TO "BN_SATE";

--Otorgar rol BNRL_COCI al usuario DB_SATE
--Otorgar rol BNRL_SATE al usuario DB_SATE
GRANT "BNRL_COCI" TO "DB_SATE";
GRANT "BNRL_SATE" TO "DB_SATE"

--Otorgar UNLIMITED TABLESPACE al usuario BN_SATE
GRANT UNLIMITED TABLESPACE TO "BN_SATE";