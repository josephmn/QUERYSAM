--SELECT * FROM PAregistro WHERE PERID = '72130767'
--SELECT * FROM PAregistro WHERE PERID = '77683117'

--SELECT perid, * FROM PERSONAL WHERE perfing > = '2020-08-01'
/*
SELECT COUNT(*) DATO, A.perid
FROM PERSONAL A
INNER JOIN PAregistro B ON A.perid = B.perid
WHERE A.perstatus <> 'R'
GROUP BY A.perid
*/

--SELECT perid, * FROM PERSONAL WHERE perfing > = '2020-10-01'
--CREATE PROC JM_ASP_GENERAR_RUBROS
--@DNI VARCHAR(15)
--AS
BEGIN      
DECLARE @PERID VARCHAR(15)

DECLARE PERSONAL_AM CURSOR FOR         

SELECT perid FROM PERSONAL WHERE perstatus <> 'R' --AND perid = '77683117'
--AND PERID IN 
--(
--'40045308','43582949','44466241','45410963','46944909','48319179','70548966','76879786'
--)

OPEN PERSONAL_AM FETCH PERSONAL_AM INTO @PERID
                        
WHILE (@@FETCH_STATUS = 0 )                    
	BEGIN -- WHILE                                    

	DELETE FROM PAregistro WHERE PERID = LTRIM(RTRIM(@PERID))

	-- INSERTAMOS LOS NUEVOS RUBROS
	INSERT INTO PAregistro 
	(perid, provisiona, rubctac, rubctad, rubdesc, rubid, rubporcentaje, rubsoles, rubsubc, rubsubd, rubtipo, 
	user1, user10, user2, user3, user4, user5, user6, user7, user8, user9)

	SELECT 
	LTRIM(RTRIM(@PERID)), 0, rubctac, rubctad, rubdesc, rubid, rubporcentaje, rubsoles, rubsubc, rubsubd, rubtipo, 
	'', '1900-01-01', 0, 0, '', '', 0, 0, 0,'1900-01-01'
	FROM PArubro
	WHERE rubdefault = 1

	-- ACTUALIZAMOS LAS CUENTAS PARA LOS RUBROS
	-- SELECT A.rubctac, A.rubctad, B.ctacargo, B.ctacredito
	UPDATE A SET A.rubctac = B.ctacargo, A.rubctad = B.ctacredito
	FROM PAregistro A
	INNER JOIN PARubroCta B ON A.rubid = B.rubid
	INNER JOIN (SELECT D.* FROM PACentroCostoH H 
	INNER JOIN PACentroCostoD D ON H.IdCCosto = D.IdCCosto
	INNER JOIN PERSONAL P ON P.perarea = D.areaid AND D.cCostoArea = P.persub
	WHERE P.PERID = LTRIM(RTRIM(@PERID))) X ON B.ttrabid = X.IdCCosto
	WHERE A.perid = LTRIM(RTRIM(@PERID))

	FETCH PERSONAL_AM INTO @PERID
	END-- END WHILE                  
	CLOSE PERSONAL_AM                 
DEALLOCATE PERSONAL_AM               
END 
