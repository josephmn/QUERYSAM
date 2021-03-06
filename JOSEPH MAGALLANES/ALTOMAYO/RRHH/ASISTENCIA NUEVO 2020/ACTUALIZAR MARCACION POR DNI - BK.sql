CREATE PROC B_PERSONAL_MARCDNI
-- SISTEMA : ASISTENCIA 2020
-- FUNCION : PROCEDURE MARCACION POR DNI AL PERSONAL
-- FECHA   : 2020-08-14
-- USUARIO : JOSEPH MAGALLANES NOLAZCO   
@PER_COD VARCHAR(15)    
AS    
BEGIN    
    
DECLARE @MARCA CHAR(1)    
DECLARE @VER CHAR(1)    
DECLARE @Estado int    
    
SET @VER = (SELECT ISNULL(COUNT(*),0) FROM ASISTENCIA_TEMP WHERE FECHA = CONVERT(VARCHAR(10),GETDATE(),120) AND PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end))    
SET @MARCA = (SELECT ISNULL(COUNT(*),0) DATO FROM PERSONAL WHERE PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end) AND MAR_DNI = 1 AND PER_STATUS = 'A')    
--SET @Estado = (SELECT ISNULL(COUNT(*),0) FROM TURNO_PERSONAL WHERE PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end) AND FechaActual = CONVERT(VARCHAR(10),GETDATE(),120) AND Estado <> 1)    

    
If @Estado > 0    
 BEGIN
  --PREGUNTAMOS SI ESTAS DE VACACIONES 
  DECLARE @TIPO_ESTADO VARCHAR(30)    
  SET @TIPO_ESTADO =     
  (SELECT E.DESCR_MARCA FROM TURNO_PERSONAL TP INNER JOIN ESTADO_MARCA_PER E ON TP.Estado = E.ID_MARCA     
  WHERE TP.PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end) AND TP.FechaActual = CONVERT(VARCHAR(10),GETDATE(),120))    
    
  SELECT LTRIM(RTRIM(PER_COD)) PER_COD,     
  LTRIM(RTRIM(LTRIM(RTRIM(PER_NOMBRE))+' '    
  +LTRIM(RTRIM(PER_APE_PA))+' '+LTRIM(RTRIM(PER_APE_MA)))) NOMBRES,    
  'UDS. ESTA DE ' + LTRIM(RTRIM(@TIPO_ESTADO)) + '. NO PUEDE MARCAR' MENSAJE, 3 xCond, 0 Button, 0 MHUELLA, 0 MDNI FROM PERSONAL WHERE PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8)     
  else @PER_COD end)     
    
 END    
ELSE    
 IF @MARCA = 0    
  BEGIN    
   SELECT LTRIM(RTRIM(PER_COD)) PER_COD,     
   LTRIM(RTRIM(LTRIM(RTRIM(PER_NOMBRE))+' '    
   +LTRIM(RTRIM(PER_APE_PA))+' '+LTRIM(RTRIM(PER_APE_MA)))) NOMBRES,    
   'NO TIENE ACCESO A MARCAR CON DNI' MENSAJE, 0 xCond, 0 Button, 0 MHUELLA, 0 MDNI FROM PERSONAL WHERE PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end)     
  END    
 ELSE    
  IF @MARCA = 1    
   BEGIN    
    IF LTRIM(RTRIM(@VER)) = '' OR LTRIM(RTRIM(@VER)) = 0    
     BEGIN    
      SELECT LTRIM(RTRIM(PER_COD)) PER_COD,     
      LTRIM(RTRIM(LTRIM(RTRIM(PER_NOMBRE))+' '    
      +LTRIM(RTRIM(PER_APE_PA))+' '+LTRIM(RTRIM(PER_APE_MA)))) NOMBRES,    
      'REGISTRAR ENTRADA ?' MENSAJE, 1 xCond, 1 Button, 0 MHUELLA, 1 MDNI FROM PERSONAL WHERE PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end)     
     END    
    ELSE    
     IF (SELECT COUNT(*) FROM ASISTENCIA_TEMP WHERE FECHA = CONVERT(VARCHAR(10),GETDATE(),120) AND PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8)     
      else @PER_COD end) AND EST_REF = 'N' AND EST_ASIS = 'I') = 1    
      BEGIN    
       SELECT LTRIM(RTRIM(PER_COD)) PER_COD,     
       LTRIM(RTRIM(LTRIM(RTRIM(PER_NOMBRE))+' '    
       +LTRIM(RTRIM(PER_APE_PA))+' '+LTRIM(RTRIM(PER_APE_MA)))) NOMBRES,    
       'INICIO DE REFRIGERIO ?' MENSAJE, 1 xCond, 2 Button, 0 MHUELLA, 1 MDNI FROM PERSONAL WHERE PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end)     
      END    
     ELSE    
      IF (SELECT COUNT(*) FROM ASISTENCIA_TEMP WHERE FECHA = CONVERT(VARCHAR(10),GETDATE(),120) AND PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8)     
       else @PER_COD end) AND EST_REF = 'I' AND EST_ASIS = 'I') = 1    
       BEGIN    
        SELECT LTRIM(RTRIM(PER_COD)) PER_COD,     
        LTRIM(RTRIM(LTRIM(RTRIM(PER_NOMBRE))+' '    
        +LTRIM(RTRIM(PER_APE_PA))+' '+LTRIM(RTRIM(PER_APE_MA)))) NOMBRES,    
        'TERMINO DE REFRIGERIO ?' MENSAJE, 1 xCond, 3 Button, 0 MHUELLA, 1 MDNI FROM PERSONAL WHERE PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end)     
       END    
      ELSE    
      IF (SELECT COUNT(*) FROM ASISTENCIA_TEMP WHERE FECHA = CONVERT(VARCHAR(10),GETDATE(),120) AND PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8)     
        else @PER_COD end) AND EST_REF = 'T' AND EST_ASIS = 'I') = 1    
        BEGIN    
         SELECT LTRIM(RTRIM(PER_COD)) PER_COD,     
         LTRIM(RTRIM(LTRIM(RTRIM(PER_NOMBRE))+' '    
         +LTRIM(RTRIM(PER_APE_PA))+' '+LTRIM(RTRIM(PER_APE_MA)))) NOMBRES,    
         'REGISTRAR SALIDA ?' MENSAJE, 1 xCond, 4 Button, 0 MHUELLA, 1 MDNI FROM PERSONAL WHERE PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end)     
        END    
       ELSE    
        IF (SELECT COUNT(*) FROM ASISTENCIA_TEMP WHERE FECHA = CONVERT(VARCHAR(10),GETDATE(),120) AND PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8)     
         else @PER_COD end) AND EST_REF = 'T' AND EST_ASIS = 'S') = 1    
         BEGIN    
          SELECT LTRIM(RTRIM(PER_COD)) PER_COD,     
          LTRIM(RTRIM(LTRIM(RTRIM(PER_NOMBRE))+' '    
          +LTRIM(RTRIM(PER_APE_PA))+' '+LTRIM(RTRIM(PER_APE_MA)))) NOMBRES,    
          'UDS. YA MARCO SU SALIDA' MENSAJE, 2 xCond, 0 Button, 0 MHUELLA, 0 MDNI FROM PERSONAL WHERE PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end)     
         END    
            
   END    
END 