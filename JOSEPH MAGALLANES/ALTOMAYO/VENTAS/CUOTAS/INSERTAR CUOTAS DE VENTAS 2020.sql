
SELECT * 
-- UPDATE A SET codpvfdh = '000000'
FROM PVFDsetup A 


SELECT * FROM PV_FuerzaDirectaH WHERE pvfdH_id = '000083'
SELECT * FROM PV_FuerzaDirectaV WHERE pvfdH_id = '000083'
SELECT * FROM PV_FuerzaDirectaD WHERE pvfdV_id = '000083'


SELECT * 
-- DELETE
FROM PV_FuerzaDirectaH WHERE pvfdH_id = ''
SELECT * FROM PV_FuerzaDirectaV WHERE pvfdH_id = ''
SELECT * FROM PV_FuerzaDirectaD WHERE pvfdV_id = ''

SELECT * FROM AM2019APP..PV_FuerzaDirectaH

-- DROP TABLE PV_FUERZADIRECTA_PLANTILLA

CREATE TABLE PV_FUERZADIRECTA_PLANTILLA
(
MARCA CHAR(20),
CUOTA FLOAT,
ZONA CHAR(20),
SLSPERID CHAR(10),
CODSUP CHAR(10),
PERIODO CHAR(6)
)


SELECT * FROM PV_FUERZADIRECTA_PLANTILLA
-- TRUNCATE TABLE PV_FUERZADIRECTA_PLANTILLA




ALTER PROC PV_FVDD_FOR_INSERT
-- PROCESO : INSERTAR CUOTAS DE FUERZA DIRECTA
-- SISTEMA : SOLOMON IV
-- USURIOA : JOSEPH MAGALLANES  
-- FECHA   : 04-02-2020
AS

DELETE FROM PV_FUERZADIRECTA_PLANTILLA WHERE MARCA = ''

BEGIN                

DECLARE @SLSPERID CHAR(10)
DECLARE @ZONA CHAR(20)
DECLARE @PERIODO CHAR(6)
                
DECLARE PFVD_SUP CURSOR FOR   

SELECT DISTINCT SLSPERID, ZONA, PERIODO FROM PV_FUERZADIRECTA_PLANTILLA

  OPEN PFVD_SUP                  
  FETCH PFVD_SUP INTO @SLSPERID, @ZONA, @PERIODO
                                    
   WHILE (@@FETCH_STATUS = 0 )                              
   BEGIN -- WHILE                                              
        
		DECLARE @DATO_CORRELATIVO CHAR(6)
		DECLARE @TOTAL_CUOTA FLOAT

		SET @DATO_CORRELATIVO = (SELECT dbo.FN_GETCORRFVDCODE() DATO)
		SET @TOTAL_CUOTA = (SELECT SUM(CUOTA) TOTAL FROM PV_FUERZADIRECTA_PLANTILLA WHERE ZONA = @ZONA AND SLSPERID = @SLSPERID AND PERIODO = @PERIODO)

		-- // PASO 01 //
		/****** INSERT PARA LA CABECERA ******/
		INSERT INTO PV_FuerzaDirectaH 
		([pvfdH_id], [Linea_Negocio], [perId], [Periodo], [Status], [Zona], [Cuota_Total_xVen], [Venta_Total], [VentaEfect_Total], [Porc_VtaEfect], 
		[nroPedi_Efect], [nroPedi_Rech], [cobertura], [fecha], [user1], [user2], [user3], [user4], [user5], [user6], [user7], [user8], [user9], 
		[user10], [user11], [user12])
		VALUES
		(@DATO_CORRELATIVO, '', @SLSPERID, @PERIODO, 'A', @ZONA, @TOTAL_CUOTA, 0, 0, 0, 0, 0, 0, CONVERT(VARCHAR(10),GETDATE(),120), '', '', '', 0, 0, 0, @TOTAL_CUOTA, 0, (@TOTAL_CUOTA * -1),
		'1900-01-01', '1900-01-01', '1900-01-01')

		--SELECT * FROM PV_FuerzaDirectaH WHERE pvfdH_id = '000007'

		-- // PASO 02 //
		/****** INSERT PARA LA CABECERA ******/
		INSERT INTO PV_FuerzaDirectaV 
		([pvfdH_id], [pvfdV_id], [perId], [Cuota_Total_xVen], [Venta_Total], [VentaEfect_Total], [Porc_VtaEfect], [nroPedi_Efect], [nroPedi_Rech], 
		[cobertura], [user1], [user2], [user3], [user4], [user5], [user6], [user7], [user8], [user9], [user10], [user11], [user12])
		--VALUES
		--(@DATO_CORRELATIVO, '', @SLSPERID, @TOTAL_CUOTA, 0, 0, 0, 0, 0, 0, @SLSPERID, '', '', 0, 0, 0, 0, 0, 0)

		SELECT @DATO_CORRELATIVO, '', CODSUP, SUM(CUOTA), 0, 0, 0, 0, 0, 0, SLSPERID, '', '', 0, 0, 0, 0, 0, 0,
		'1900-01-01', '1900-01-01', '1900-01-01'
		FROM PV_FUERZADIRECTA_PLANTILLA WHERE ZONA = @ZONA AND SLSPERID = @SLSPERID AND PERIODO = @PERIODO
		GROUP BY SLSPERID, CODSUP

		-- SELECT * FROM PV_FuerzaDirectaV WHERE pvfdH_id = '000006'

		-- // PASO 03 //
		/****** INSERT PARA LA CABECERA ******/
		INSERT INTO PV_FuerzaDirectaD
		([pvfdV_id], [pvfdD_id], [Cuota], [Venta], [cobertura], [Marca], [user1], [user2], [user3], [user4], [user5], [user6], [user7], [user8], [user9],
		[user10], [user11], [user12])
		
		SELECT @DATO_CORRELATIVO, PV.CODSUP, PV.CUOTA, 0, 0, MARCA, '', '', '', 0, 0, 0, 0, (ROUND((PV.CUOTA/A.CUOTA)*100,3)) PORCET, 0,
		'1900-01-01', '1900-01-01', '1900-01-01'
		FROM PV_FUERZADIRECTA_PLANTILLA PV --WHERE ZONA = @ZONA AND SLSPERID = @SLSPERID AND PERIODO = @PERIODO
		LEFT JOIN (SELECT CODSUP, PERIODO, SLSPERID, SUM(CUOTA) CUOTA FROM PV_FUERZADIRECTA_PLANTILLA
		GROUP BY SLSPERID, PERIODO, CODSUP) A ON PV.CODSUP = A.CODSUP AND PV.PERIODO = A.PERIODO AND PV.SLSPERID = A.SLSPERID
		-- SELECT * FROM PV_FuerzaDirectaD WHERE pvfdV_id = '000007'

		-- // PASO 04 //
		/****** LIMPIAMOS LA TABLA PV_FUERZADIRECTA_PLANTILLA ******/
		DELETE FROM PV_FUERZADIRECTA_PLANTILLA WHERE ZONA = @ZONA AND SLSPERID = @SLSPERID AND PERIODO = @PERIODO

		-- // PASO 05 //
		/****** ACTUALIZAMOS EL CORRELATIVO EN LA TABLA SETUP ******/

		UPDATE PVFDsetup SET codpvfdh = @DATO_CORRELATIVO

   FETCH PFVD_SUP INTO @SLSPERID, @ZONA, @PERIODO
   END-- END WHILE      
   CLOSE PFVD_SUP                            
  DEALLOCATE PFVD_SUP       
END      


-- UPDATE PVFDsetup SET codpvfdh = '000022'
