
DECLARE 
@PERID VARCHAR(15), 
@TIPO INT,
@PERIODO VARCHAR(6)

DECLARE CUR_MITABLA CURSOR FOR

SELECT perid, user4, '202203' FROM PERSONAL 
WHERE 
--perstatus <> 'R' AND 
PERID IN ('09670268') --,'72130767')

OPEN CUR_MITABLA 
	FETCH CUR_MITABLA INTO @PERID, @TIPO, @PERIODO
      WHILE (@@FETCH_STATUS = 0 )
      BEGIN -- WHILE    

	  -- PERSONAL REMUNERACION VARIABLE
	  IF @TIPO = 0
			BEGIN
				
				PRINT 'REMUNERACION VARIABLE DNI --> '+@PERID
				--SELECT H.periodoid ,H.perid ,H.sbruto ,Y.TOTAL , (Y.TOTAL-H.sbruto) dif
				UPDATE H SET H.sbruto = Y.TOTAL
				FROM paboletaH h
				INNER JOIN (
				SELECT * FROM (
				SELECT  nbrboleta ,round(SUM( CASE WHEN RUBID IN ('D17','D24','D25') THEN rubsoles * -1 ELSE rubsoles END),2)TOTAL  --
				FROM paboletad   
				--WHERE RUBID IN ('AFA','BRE','R02','D17','R19','R03','R04','R13','R06','R23','R24','R25','D25','R18') --,'S01','S02'se retiro el D24 por se descuento en mes
				WHERE RUBID IN ('AFA','BRE','R02','D17','R19','R21','R03','R04','R06','R23','R13','R14','R24','R25','D25','R18','R05','R07','R09')
				GROUP BY nbrboleta 
				)X
				)Y ON H.nbrboleta  = Y.nbrboleta 
				LEFT JOIN PERSONAL P ON H.perid = P.perid
				LEFT JOIN PAcargo C ON P.percargo = C.carid
				WHERE H.perid = LTRIM(RTRIM(@PERID)) AND P.user4 = @TIPO
				AND periodoid IN (@PERIODO) --('202101','202102','202103','202104','202105','202106','202107','202108','202109','202110','202111','202112','2107GR','2112GR') 

			END

	  -- PERSONAL REMUNERACION FIJA
	  IF @TIPO = 1
			BEGIN
				
				PRINT 'REMUNERACION FIJA DNI --> '+@PERID
				-- SELECT H.periodoid, P.user4, C.carnombre, h.pernombre, H.perid ,H.sneto, H.sbruto, Y.TOTAL ,(Y.TOTAL-H.sbruto)dif, DATEDIFF(YEAR,P.perfnac,GETDATE()) EDAD, P.perstatus
				UPDATE H SET H.sbruto = Y.TOTAL
				FROM paboletaH h
				INNER JOIN (
				SELECT * FROM (
				SELECT  nbrboleta ,round(SUM( CASE WHEN RUBID IN ('D17','D24','D25') THEN rubsoles * -1 ELSE rubsoles END),2) TOTAL  
				FROM paboletad 
				WHERE RUBID IN ('AFA','BRE','R02','D17','R19','R21','R13','R14','R06','R23','R13','R24','R25','R18','D25','R18','R05','R07','R09')--,'S01','S02'
				GROUP BY nbrboleta 
				)X
				)Y ON H.nbrboleta  = Y.nbrboleta 
				LEFT JOIN PERSONAL P ON H.perid = P.perid
				LEFT JOIN PAcargo C ON P.percargo = C.carid
				WHERE H.perid = LTRIM(RTRIM(@PERID)) AND P.user4 = @TIPO
				AND periodoid IN (@PERIODO) --('202101','202102','202103','202104','202105','202106','202107','202108','202109','202110','202111','202112','2107GR','2112GR')

			END

			--END
	FETCH CUR_MITABLA INTO @PERID, @TIPO, @PERIODO
      END -- END WHILE
CLOSE CUR_MITABLA
DEALLOCATE CUR_MITABLA

/*
				SELECT H.periodoid, P.user4, C.carnombre, h.pernombre, H.perid ,H.sneto, H.sbruto, Y.TOTAL ,(Y.TOTAL-H.sbruto)dif, DATEDIFF(YEAR,P.perfnac,GETDATE()) EDAD, P.perstatus
				--UPDATE H SET H.sbruto = Y.TOTAL
				FROM paboletaH h
				INNER JOIN (
				SELECT * FROM (
				SELECT  nbrboleta ,round(SUM( CASE WHEN RUBID IN ('D17','D24','D25') THEN rubsoles * -1 ELSE rubsoles END),2) TOTAL  
				FROM paboletad 
				WHERE RUBID IN ('AFA','BRE','R02','D17','R19','R13','R14','S01','S02','R06','R23','R13','R24','R25','R18')--
				GROUP BY nbrboleta 
				)X
				)Y ON H.nbrboleta  = Y.nbrboleta 
				LEFT JOIN PERSONAL P ON H.perid = P.perid
				LEFT JOIN PAcargo C ON P.percargo = C.carid
				WHERE H.perid = LTRIM(RTRIM('71469061')) AND P.user4 = 1
				AND periodoid IN ('202203')
				ORDER BY H.periodoid ASC
*/
