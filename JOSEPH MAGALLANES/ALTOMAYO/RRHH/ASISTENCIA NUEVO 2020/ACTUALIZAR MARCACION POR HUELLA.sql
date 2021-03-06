CREATE PROC SP_MARCACION_PERSONAL
-- SISTEMA : ASISTENCIA 2020
-- FUNCION : PROCEDURE INSERTAR Y ACTUALIZAR MARCACION DEL PERSONAL
-- FECHA   : 2020-08-14
-- USUARIO : JOSEPH MAGALLANES NOLAZCO     
@PER_COD VARCHAR(15),  
@COMENTARIO VARCHAR(120),
@MARCAHUELLA INT,
@MARCADNI INT
AS  
BEGIN  
  
DECLARE @ABREV CHAR(3)  
DECLARE @NUEVOID VARCHAR(10)    
DECLARE @NUEVOCOD VARCHAR(7)    
DECLARE @COD INT   
DECLARE @EMP_COD AS CHAR(15)  
DECLARE @LOC_COD AS INT  
  
DECLARE @HoraIngEmp varchar(10)  
DECLARE @HoraSalEmp varchar(10)  
DECLARE @MIN_INGRESO int  
  
SET @LOC_COD = (SELECT LOCAL FROM PERSONAL WHERE PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end))   
SET @EMP_COD = (SELECT EMPRESA FROM PERSONAL WHERE PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end))    
SET @ABREV = (SELECT ABREV FROM LOCAL WHERE LOC_ID = (SELECT LOCAL FROM PERSONAL WHERE PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end)))   
SET @COD = (SELECT ISNULL(MAX(CONVERT(INT,RIGHT(COD_ASI_TEM,7))),0)+1 FROM ASISTENCIA_TEMP WHERE LOC_COD = (SELECT LOCAL FROM PERSONAL WHERE PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end)))    
  
SET @NUEVOCOD = RIGHT('0000000'+LTRIM(@COD),7)    
SET @NUEVOID = LTRIM(@ABREV)+ @NUEVOCOD    
SELECT @NUEVOCOD,@NUEVOID    
  
SET @HoraIngEmp = (SELECT HoraInicio FROM TURNO_PERSONAL WHERE PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end) AND FechaActual = CONVERT(VARCHAR(10),GETDATE(),120))  
SET @HoraSalEmp = (SELECT HoraFin FROM TURNO_PERSONAL WHERE PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end) AND FechaActual = CONVERT(VARCHAR(10),GETDATE(),120))  
SET @MIN_INGRESO = (SELECT User6 FROM TURNO_PERSONAL WHERE PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end) AND FechaActual = CONVERT(VARCHAR(10),GETDATE(),120))  
  
  
DECLARE @TIPO VARCHAR(30)  
DECLARE @VER CHAR(1)  
SET @VER = (SELECT ISNULL(COUNT(*),0) FROM ASISTENCIA_TEMP WHERE FECHA = CONVERT(VARCHAR(10),GETDATE(),120) AND PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end))  
  
IF LTRIM(RTRIM(@VER)) = '' OR LTRIM(RTRIM(@VER)) = 0  
 BEGIN  
   --SELECT LTRIM(RTRIM(PER_COD)) PER_COD,   
   --LTRIM(RTRIM(LTRIM(RTRIM(PER_NOMBRE))+' '  
   --+LTRIM(RTRIM(PER_APE_PA))+' '+LTRIM(RTRIM(PER_APE_MA)))) NOMBRES,  
   --'REGISTRAR ENTRADA ?' MENSAJE FROM PERSONAL WHERE PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end)   
  
   INSERT INTO ASISTENCIA_TEMP (COD_ASI_TEM, HORA_ENT, HORA_SAL, HORA_ENT_REF, HORA_SAL_REF, COMENTARIO, HORAS_REF, HORAS, FECHA, EST_REF, EST_ASIS, EMP_COD, PER_COD, LOC_COD,  
          HoraIngresoEmp, HoraSalidaEmp, MIN_INGRESO, Crtd_DateTime, Crtd_User, LUpd_DateTime, LUpd_User, HORA_ORIG_ENT, HORA_ORIG_SAL, OBS_PE, MARC_ESP, 
		  COM_ENTRADA, COM_SALIDA, COM_INGREF, COM_REGREF, MAR_HUE_ENT, MAR_DNI_ENT, MAR_HUE_SAL, MAR_DNI_SAL, MAR_HUE_INGREF, MAR_DNI_INGREF, MAR_HUE_REGREF, MAR_DNI_REGREF)
   VALUES (@NUEVOID,GETDATE(),GETDATE(),GETDATE(),GETDATE(),    
     '',0,0,(CONVERT(CHAR(10), GETDATE(), 120)),'N','I',@EMP_COD,(case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end),  
     @LOC_COD, @HoraIngEmp, @HoraSalEmp, @MIN_INGRESO,GETDATE(), 'SUPERADMIN',GETDATE(), 'SUPERADMIN', GETDATE(), GETDATE(), '', 0, 
		  ISNULL(@COMENTARIO,''), '', '', '', @MARCAHUELLA, @MARCADNI, 0, 0, 0, 0, 0, 0)   
  
 END  
ELSE  
 IF (SELECT COUNT(*) FROM ASISTENCIA_TEMP WHERE FECHA = CONVERT(VARCHAR(10),GETDATE(),120) AND PER_COD =   
  (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end) AND EST_REF = 'N' AND EST_ASIS = 'I') = 1  
  
  BEGIN  
    
   --SELECT LTRIM(RTRIM(PER_COD)) PER_COD, 
   --LTRIM(RTRIM(LTRIM(RTRIM(PER_NOMBRE))+' '  
   --+LTRIM(RTRIM(PER_APE_PA))+' '+LTRIM(RTRIM(PER_APE_MA)))) NOMBRES,  
   --'INICIO DE REFRIGERIO ?' MENSAJE FROM PERSONAL WHERE PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end)   
  
   UPDATE ASISTENCIA_TEMP SET HORA_ENT_REF = GETDATE(), EST_REF = 'I', HoraIngresoEmp = @HoraIngEmp, HoraSalidaEmp = @HoraSalEmp, MIN_INGRESO = @MIN_INGRESO,
   COM_INGREF = ISNULL(@COMENTARIO,''), MAR_HUE_INGREF = @MARCAHUELLA , MAR_DNI_INGREF = @MARCADNI
   WHERE FECHA = CONVERT(varchar(10),GETDATE(),120) AND PER_COD = @PER_COD AND EST_REF = 'N' AND EST_ASIS = 'I'  
  
  END  
 ELSE  
   IF (SELECT COUNT(*) FROM ASISTENCIA_TEMP WHERE FECHA = CONVERT(VARCHAR(10),GETDATE(),120) AND PER_COD =   
    (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end) AND EST_REF = 'I' AND EST_ASIS = 'I') = 1  
  
    BEGIN  
    
     --SELECT LTRIM(RTRIM(PER_COD)) PER_COD,   
     --LTRIM(RTRIM(LTRIM(RTRIM(PER_NOMBRE))+' '  
     --+LTRIM(RTRIM(PER_APE_PA))+' '+LTRIM(RTRIM(PER_APE_MA)))) NOMBRES,  
     --'TERMINO DE REFRIGERIO ?' MENSAJE FROM PERSONAL WHERE PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end)   
  
     UPDATE ASISTENCIA_TEMP SET HORA_SAL_REF = GETDATE(), EST_REF = 'T', HoraIngresoEmp = @HoraIngEmp, HoraSalidaEmp = @HoraSalEmp, MIN_INGRESO = @MIN_INGRESO,
	 COM_REGREF = ISNULL(@COMENTARIO,''), MAR_HUE_REGREF = @MARCAHUELLA, MAR_DNI_REGREF = @MARCADNI
     WHERE FECHA = CONVERT(varchar(10),GETDATE(),120) AND PER_COD = @PER_COD AND EST_REF = 'I' AND EST_ASIS = 'I'  
  
    END  
   ELSE  
    IF (SELECT COUNT(*) FROM ASISTENCIA_TEMP WHERE FECHA = CONVERT(VARCHAR(10),GETDATE(),120) AND PER_COD =   
     (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end) AND EST_REF = 'T' AND EST_ASIS = 'I') = 1  
     --(case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end) AND EST_REF = 'T' AND EST_ASIS <> 'T') = 1  
  
     BEGIN  
    
      --SELECT LTRIM(RTRIM(PER_COD)) PER_COD,   
      --LTRIM(RTRIM(LTRIM(RTRIM(PER_NOMBRE))+' '  
      --+LTRIM(RTRIM(PER_APE_PA))+' '+LTRIM(RTRIM(PER_APE_MA)))) NOMBRES,  
      --'REGISTRAR SALIDA ?' MENSAJE FROM PERSONAL WHERE PER_COD = (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end)   
  
      UPDATE ASISTENCIA_TEMP SET HORA_SAL = GETDATE(), EST_ASIS = 'S', HoraIngresoEmp = @HoraIngEmp, HoraSalidaEmp = @HoraSalEmp, MIN_INGRESO = @MIN_INGRESO, HORA_ORIG_SAL = GETDATE(),
	  COM_SALIDA = ISNULL(@COMENTARIO,''), MAR_HUE_SAL = @MARCAHUELLA, MAR_DNI_SAL = @MARCADNI
      WHERE FECHA = CONVERT(varchar(10),GETDATE(),120) AND PER_COD = @PER_COD AND EST_REF = 'T' AND EST_ASIS = 'I'  
      --WHERE FECHA = CONVERT(varchar(10),GETDATE(),120) AND PER_COD = @PER_COD AND EST_REF = 'T' AND EST_ASIS <> 'T'  
  
     END  
    --ELSE  
    -- IF (SELECT COUNT(*) FROM ASISTENCIA_TEMP WHERE FECHA = CONVERT(VARCHAR(10),GETDATE(),120) AND PER_COD =   
    -- (case when len(@PER_COD)<8 then RIGHT('00000000' + Ltrim(Rtrim(@PER_COD)),8) else @PER_COD end) AND EST_REF = 'T' AND EST_ASIS = 'S') = 1  
    -- BEGIN  
  
    --  PRINT 'UDS. YA MARCO SALIDA'  
  
    -- END  
   
END  
  
