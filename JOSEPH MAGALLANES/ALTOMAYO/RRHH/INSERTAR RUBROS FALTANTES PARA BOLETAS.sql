BEGIN 
DECLARE @NBRBOLTEA VARCHAR(15)     
DECLARE @PERID VARCHAR(15)
DECLARE @RUBID CHAR(3)
DECLARE @RUBDESC CHAR(50)
DECLARE @PERIODO VARCHAR(6)
DECLARE @RUBTIPO CHAR(2)

SELECT @RUBID = rubid, @RUBDESC = rubdesc, @RUBTIPO = rubtipo 
FROM PArubro WHERE rubid = 'R14'

--SET @RUBID = 'R07'
--SET @RUBDESC = 'GRATIFICACIONES DE FIESTAS PATRIAS Y NAVIDAD'
SET @PERIODO = '202203'
--SET @RUBTIPO = '02'

--GRATIFICACIONES DE FIESTAS PATRIAS Y NAVIDAD      	R07
--BONIFICACION   EXTRAORD LEY 29351                 	R05

DECLARE PERSONAL_AM CURSOR FOR         

SELECT nbrboleta, perid, @RUBID, @RUBDESC, @PERIODO, @RUBTIPO 
FROM paboletaH
WHERE periodoid = '202203' AND PERID = '44291021'

OPEN PERSONAL_AM FETCH PERSONAL_AM INTO @NBRBOLTEA, @PERID, @RUBID, @RUBDESC, @PERIODO, @RUBTIPO
                        
WHILE (@@FETCH_STATUS = 0 )                    
	BEGIN -- WHILE                                    

	If (select COUNT(*) from paboletah h inner join paboletad d on h.nbrboleta = d.nbrboleta where h.periodoid = @PERIODO and d.rubid = @RUBID and h.perid = @PERID) = 0
		BEGIN

			INSERT INTO paboletad
			(cantidad, nbrboleta,	provisiona,	rubctac,	rubctad,	rubdesc,	rubid	,rubporcentaje	,rubsoles,	
			rubsubc	,rubsubd,	rubtipo	,user1,	user10	,user2	,user3	,user4	,user5	,user6,user7	,user8	,user9)

			SELECT 0, @NBRBOLTEA,	provisiona,	rubctac,	rubctad,	@RUBDESC,	@RUBID	,rubporcentaje	,0,	
			rubsubc	,rubsubd,	@RUBTIPO	,A.user1,	A.user10	,A.user2	,A.user3	, 0 user4	,A.user5	,A.user6, A.user7	,A.user8	,A.user9
			FROM paboletad A 
			INNER JOIN paboletaH B ON A.nbrboleta = B.nbrboleta 
			WHERE rubid = 'BRE' AND B.perid = @PERID AND B.periodoid = @PERIODO			

			--12.- ACTUALIZAMOS CUENTA DESTINO ALTOMAYO       
			-- SELECT B.persub, A.*           
			UPDATE A SET A.rubsubc = C.persub, A.rubsubd = C.persub          
			FROM paboletad A
			INNER JOIN paboletaH B ON A.nbrboleta = B.nbrboleta
			INNER JOIN Personal C ON B.perid = B.perid
			WHERE B.perid = @PERID AND B.periodoid = @PERIODO AND A.rubid = @RUBID 

		END
	ELSE
		BEGIN
			PRINT 'YA ESTA INSERTADO'
		END

	FETCH PERSONAL_AM INTO @NBRBOLTEA, @PERID, @RUBID, @RUBDESC, @PERIODO, @RUBTIPO
	END-- END WHILE                  
	CLOSE PERSONAL_AM                 
DEALLOCATE PERSONAL_AM               
END 


--select * --COUNT(*) 
--from paboletah h 
--inner join paboletad d on h.nbrboleta = d.nbrboleta 
--where h.periodoid = '202107' --and d.rubid = 'D03' 
--and h.perid = '76086519'
