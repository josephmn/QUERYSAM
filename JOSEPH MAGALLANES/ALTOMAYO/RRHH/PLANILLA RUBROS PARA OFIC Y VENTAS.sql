/*
DECLARE @DNI VARCHAR(8)
DECLARE @SBASICO FLOAT
DECLARE @ASIGFAM FLOAT
DECLARE @PROMPROD_VACACIONES FLOAT
DECLARE @PROMPRODUCCION FLOAT

SET @DNI = '46046866'
SET @SBASICO = 930
SET @ASIGFAM = 93
SET @PROMPROD_VACACIONES = 0
SET @PROMPRODUCCION = 0
--132.44
--SELECT * 
UPDATE PALiqBeneficios 
SET 
PromProduccion = @PROMPRODUCCION, 
RemComputable = @PROMPRODUCCION + @ASIGFAM + @SBASICO,
CtsMesesMonto = ((@PROMPRODUCCION + @ASIGFAM + @SBASICO)/12) * (SELECT CtsMeses FROM PALiqBeneficios WHERE PERID = @DNI),
CtsDiasMonto = (((@PROMPRODUCCION + @ASIGFAM + @SBASICO)/12)/30) * (SELECT CtsDias FROM PALiqBeneficios WHERE PERID = @DNI),
GratiMesesMonto = ((@PROMPRODUCCION + @ASIGFAM + @SBASICO)/6) * (SELECT GratiMeses FROM PALiqBeneficios WHERE PERID = @DNI),
GratiBoniMonto = (((@PROMPRODUCCION + @ASIGFAM + @SBASICO)/6) * (SELECT GratiMeses FROM PALiqBeneficios WHERE PERID = @DNI)*0.09)

FROM PALiqBeneficios WHERE PERID = @DNI

UPDATE PALiqBeneficios
SET 
CtsTotal = CtsMesesMonto + CtsDiasMonto,
GratiTotal = GratiMesesMonto + GratiBoniMonto
FROM PALiqBeneficios WHERE PERID = @DNI


*/


SELECT * FROM PALiqBeneficios WHERE PERID = '46046866'


exec DetalleComisionCTS '201909', '76733968','204.14'
exec DetalleComisionGRAT '201909', '76733968','204.14'
exec DetalleComisionVAC '201909', '76733968','204.14'



-- CALCULO DE DESCUENTO POR TRARDANZAS Y FALTA (PERSONAL CON MOVILIDAD) R19

select replace(perid,'X',''),* from PALiqVacacion where PeriodoId = '201909'
select perid, * from Personal where pernombre like '%jezabel%'
select perid, pernombre, * from Personal where perid = '70194839'

exec cal_montomovmes '10187594','202008'

SELECT * FROM PArubro

SELECT * 
-- DELETE
FROM paboletaH WHERE periodoid = '202011' AND perid = '73417082'

SELECT * 
-- DELETE
FROM paboletad WHERE nbrboleta IN (SELECT nbrboleta FROM paboletaH WHERE periodoid = '202011' AND perid = '73417082')

--44579663
--70085984
--46526899
--73417082
--73148266
--46944909

/************************** CALCULO PERSONAL OFICINA *********************/
--gente oficina (no ventas)
SELECT H.periodoid, P.user4, C.carnombre, h.pernombre, H.perid ,H.sneto, H.sbruto, Y.TOTAL ,(Y.TOTAL-H.sbruto)dif, DATEDIFF(YEAR,P.perfnac,GETDATE()) EDAD, P.perstatus
-- UPDATE H SET H.sbruto = Y.TOTAL
FROM paboletaH h
INNER JOIN (
SELECT * FROM (
SELECT  nbrboleta ,round(SUM( CASE WHEN RUBID IN ('D17','D24','D25') THEN rubsoles * -1 ELSE rubsoles END),2) TOTAL  
FROM paboletad WHERE RUBID IN ('AFA','BRE','D17','R02','R19','R21','R13','R14','R06','R23','R13','R24','R25','R18','R05','R07','R09')--'S01','S02',
--AND nbrboleta = '9000121272'
GROUP BY nbrboleta 
)X
)Y ON H.nbrboleta  = Y.nbrboleta 
LEFT JOIN PERSONAL P ON H.perid = P.perid
LEFT JOIN PAcargo C ON P.percargo = C.carid
WHERE H.perid  --='10861882' 
in ('45785848')
--AND periodoid IN ('201901','201902','201903','201904','201905','201906','201907','201908','201909','201910','201911','201912') 
AND periodoid IN ('202102') 
ORDER BY H.periodoid ASC

--update paboletaH set sneto = 0 where periodoid in ('202010','202011') and perid = '10682322'

-- SELECT  perid, * FROM PERSONAL WHERE pernombre LIKE '%marco%'


SELECT sneto,sbruto, * FROM paboletaH where perid = '72130767' and periodoid = '202008'
SELECT * FROM paboletad where nbrboleta = (SELECT nbrboleta FROM paboletaH where perid = '73417082' and periodoid = '202005') and (rubsoles <> 0 or cantidad <> 0)


 --10187594  
SELECT CONVERT(float,COUNT(rubsoles )), CONVERT(float,SUM(rubsoles)) FROM paregistro WITH(NOLOCK) where  RubId in ('R19')    AND PerId= '10509942' 
SELECT CONVERT(float,COUNT(monto )), CONVERT(float,SUM(monto)) FROM pa_movilidadAM WITH(NOLOCK) where  PerId= '10509942' 
select CONVERT(float,COUNT(rubsoles )), SUM(rubsoles) from PAregistro where perid =  '10509942' and rubid = 'R19'


/************************** CALCULO PERSONAL VENTAS *********************/

SELECT H.periodoid, P.user4, C.carnombre, h.pernombre, H.perid ,H.sneto, H.sbruto, Y.TOTAL ,(Y.TOTAL-H.sbruto)dif, DATEDIFF(YEAR,P.perfnac,GETDATE()) EDAD, P.perstatus
-- UPDATE H SET H.sbruto = Y.TOTAL
FROM paboletaH h
INNER JOIN (
SELECT * FROM (
SELECT  nbrboleta ,round(SUM( CASE WHEN RUBID IN ('D17','D24','D25') THEN rubsoles * -1 ELSE rubsoles END),2)TOTAL  --
FROM paboletad   
WHERE RUBID IN ('AFA','BRE','R02','D17','R19','R21','R03','R04','R13','R06','R23','R13','R24','R25','D25','R18') --se retiro el D24 por se descuento en mes
--SELECT  nbrboleta ,SUM( CASE WHEN RUBID IN ('D17') THEN rubsoles * -1 ELSE rubsoles END)TOTAL  FROM paboletad   WHERE RUBID IN ('AFA','BRE','R02','D17','R19','R03','R04')
GROUP BY nbrboleta 
)X
)Y ON H.nbrboleta  = Y.nbrboleta 
LEFT JOIN PERSONAL P ON H.perid = P.perid
LEFT JOIN PAcargo C ON P.percargo = C.carid
WHERE H.perid = '40126511' 
AND periodoid IN ('202001','202002','202003','202004','202005','202006','202007','202008','202009','202010','202011','202012') 
ORDER BY H.periodoid ASC


select * 

from paboletad d 
inner join paboletaH h on d.nbrboleta = h.nbrboleta
where h.perid = '41466697' and periodoid = '202007'
and (rubsoles <> 0 or cantidad <> 0)

--SELECT sbruto, sneto, * FROM paboletaH WHERE perid = '80464784' AND periodoid = '201906'

SELECT * FROM PArubro WHERE rubid IN ('AFA','BRE','R02','D17','R19','R03','R04','R13','S01','S02','R06','R23','R13','R24','R25','R18')
ORDER BY RUBID ASC

SELECT * FROM paboletad WHERE nbrboleta IN (SELECT nbrboleta FROM PABOLETAH WHERE periodoid = '202003' AND perid = '80464784')

--10187594	BALBUENA	1537
--06790520	ESTRADA		779.32
--45419162	GARGATE		91.75   YA ESTA (SISTEMA DICE QUE FALTO UN DIA)
--40356350	GUEVARA		298.49
--42622439	GUTIERRES	3.86
--48030329	PERLECHE	5.19
--42150338	TESEN		3.68


-- cabecera montos totales por meses
SELECT CANTIDAD, periodoid, sbruto, * --CONVERT(float,COUNT(PABoletaD.cantidad)), CONVERT(float,SUM(PABoletaD.cantidad)) 
FROM PABoletaD WITH(NOLOCK) 
INNER JOIN PABoletaH WITH(NOLOCK) ON PABoletaD.nbrBoleta=PABoletaH.nbrBoleta WHERE PABoletaH.peremp= 'AM'  
AND PABoletaD.RubId in ('R03')  and rubtipo ='02' AND PABoletaH.periodoid>= '202001'  
AND PABoletaH.periodoid IN ('202001','202002','202003','202004','202005','202006','202007','202008','202009','202010','202011','202012') AND 
PerId= '46630385' /* AND rubsoles > 0 */ 
ORDER BY PABoletaH.periodoid ASC

--- detallle
SELECT  nbrboleta ,*--,SUM( CASE WHEN RUBID = 'D17' THEN rubsoles * -1 ELSE rubsoles END)TOTAL  
FROM paboletad   WHERE --RUBID IN ('AFA','BRE','R02','D17','R17','R19','R03','D03') AND 
nbrboleta IN (SELECT nbrboleta FROM paboletaH WHERE PERID = '46630385' AND periodoid = '202009')
--GROUP BY nbrboleta 

SELECT  nbrboleta ,*--,SUM( CASE WHEN RUBID = 'D17' THEN rubsoles * -1 ELSE rubsoles END)TOTAL  
FROM paboletad  where nbrboleta IN (SELECT nbrboleta FROM paboletaH WHERE PERID = '10774615' 
AND periodoid = '202006') and rubsoles > 0
--GROUP BY nbrboleta 

--8735.00

SELECT sbruto, * 
-- UPDATE A SET sbruto = '4418'
FROM paboletaH A WHERE nbrboleta = '9000040798'


SELECT * 
FROM PAREGISTRO A WHERE PERID = '10682322' AND RUBID IN ('D17','R19')


/****** RENTA DE QUINTA PARA PERSONAL *****/


SELECT nbrboleta ,*--,SUM( CASE WHEN RUBID = 'D17' THEN rubsoles * -1 ELSE rubsoles END)TOTAL  
FROM paboletad S 
WHERE RUBID IN ('D03') AND nbrboleta IN 
(SELECT nbrboleta FROM paboletaH WHERE PERID = '10549346' 
AND periodoid IN (
'202001','202002','202003','202004','202005','202006','202007','202008','202009','202010','202011','202012')) ORDER BY S.nbrboleta ASC
--GROUP BY nbrboleta 

SELECT * 
FROM PAREGISTRO A WHERE PERID = '10287282' AND rubsoles > 0
--AND RUBID IN ('D03')
ORDER BY rubid ASC

select 
sum((CASE WHEN RUBID = 'D17' THEN rubsoles * -1 when RUBID ='R03' 
THEN (RUBSOLES + ISNULL(USER7,0)) ELSE rubsoles END)) 
from paregistro WITH(NOLOCK) where perid = '40356350'  AND RUBID IN ('AFA','BRE','R02','D17','R13','R14')





SELECT CANTIDAD, periodoid, sbruto, sneto, * --CONVERT(float,COUNT(PABoletaD.cantidad)), CONVERT(float,SUM(PABoletaD.cantidad)) 
FROM PABoletaD WITH(NOLOCK) 
INNER JOIN PABoletaH WITH(NOLOCK) ON PABoletaD.nbrBoleta=PABoletaH.nbrBoleta WHERE PABoletaH.peremp= 'AM'  
AND PABoletaD.RubId in ('R03')  and rubtipo ='02' AND PABoletaH.periodoid>= '202001'  
AND PABoletaH.periodoid IN ('202001','202002','202003','202004','202005','202006','202007') AND PerId= '10774615' /* AND rubsoles > 0 */ 
ORDER BY PABoletaH.periodoid ASC



select 
sum((CASE WHEN RUBID = 'D17' THEN rubsoles * -1 when RUBID ='R03' THEN (RUBSOLES  + ISNULL(USER7,0)) 
ELSE rubsoles END)) from paregistro WITH(NOLOCK) where perid = '72130767'  AND RUBID IN ('AFA','BRE','R02','D17','R13','R14')

SELECT 
--SBruto, *
CONVERT(float,COUNT(SBruto)), 
round(SUM(SBruto),2) 
FROM PABoletaH WITH(NOLOCK) 
WHERE peremp= 'AM'  AND periodoid>= '201604'  AND PeriodoId IN ('202001','202002','202003','202004','202005','202006') AND PerId= '72130767' 


SELECT * FROM pa_movilidadAM WHERE perid = '72130767'


/****************** GRATI JULIO ***********************/

SELECT sbruto, * FROM  paboletaH where perid = '10187594' and periodoid = '1807GR'



/******************* TEMA DE REINTEGROS POR DEVOLUCION PERIODO 201909 *******************************/

SELECT H.periodoid ,H.perid ,H.sneto, H.sbruto, Y.TOTAL ,(Y.TOTAL-H.sbruto) dif, (Y.TOTAL-K.cantidad) NEW
-- UPDATE H SET H.sbruto = Y.TOTAL
-- UPDATE H SET H.sbruto = (Y.TOTAL-K.cantidad)
FROM paboletaH h
INNER JOIN (
SELECT * FROM (
SELECT  nbrboleta ,round(SUM( CASE WHEN RUBID IN ('D17') THEN rubsoles * -1 ELSE rubsoles END),2) TOTAL  
FROM paboletad WHERE RUBID IN ('AFA','BRE','D17','R02','R19','R13','R14','S01','S02','R06','R23','R13')--
GROUP BY nbrboleta 
)X
)Y ON H.nbrboleta  = Y.nbrboleta 

INNER JOIN paboletad K ON H.nbrboleta = K.nbrboleta

WHERE H.perid  --='10861882' 
in ('46563840')
AND periodoid IN ('201901','201902','201903','201904','201905','201906','201907','201908','201909','201910') 
AND rubid = 'R14'
ORDER BY H.periodoid ASC
