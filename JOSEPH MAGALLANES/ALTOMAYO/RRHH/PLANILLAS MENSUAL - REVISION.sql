/*********************** REVISION FINAL PLANILLA MENSUAL *****************************/

SELECT * FROM PAREGISTRO WHERE perid = '10861882' AND rubid = 'A03'
SELECT * FROM PAREGISTRO WHERE perid = '10861882' AND rubid = 'A01'

SELECT pernombre, * FROM PERSONAL WHERE PERID = '10774615'



select * from paboletaH where perid = '47666448' and periodoid = '201909'

select * from paboletaH where perid = '47666448' and periodoid = '201909'


--DetalleComisionCTS
--DetalleComisionGRAT
--DetalleComisionVAC


alter Procedure PAdbnav_TempDetalleBoleta                     
@parm1 varchar (2)                      
As              
 SELECT T.*,A.* FROM TempDetalleBoleta T inner join personal P on T.PerId = P.perid  
 inner join PAarea A on P.perarea = A.areid
 WHERE 
-- p.perid  in (
--'72130767'
-- ) AND 
 t.peremp = @parm1                         
 ORDER BY nombre 
  
-- 10287282  
  

select * from PAregistro where perid = '10187594' and rubid = 'R19'


select * from pasetup

SELECT CANTIDAD, periodoid, sbruto, * --CONVERT(float,COUNT(PABoletaD.cantidad)), CONVERT(float,SUM(PABoletaD.cantidad)) 
FROM PABoletaD WITH(NOLOCK) 
INNER JOIN PABoletaH WITH(NOLOCK) ON PABoletaD.nbrBoleta=PABoletaH.nbrBoleta WHERE PABoletaH.peremp= 'AM'  
AND PABoletaD.RubId in ('R03')  and rubtipo ='02' AND PABoletaH.periodoid>= '200610'  
AND PABoletaH.periodoid IN ('201801','201802','201803','201804','201805','201806') AND PerId= '10774615' /* AND rubsoles > 0 */ ORDER BY PABoletaH.periodoid ASC

select perdias, * 

from paboletaH where perid = '10774615' and periodoid in ('201801','201802','201803','201804','201805','201806','0718GR') order by periodoid 
  
select perdias, * 

from paboletaH where perid = '10774615' and periodoid in ('201801','201802','201803','201804','201805','201806','0718GR') order by periodoid 


select * from paboletad where rubid = 'R02' AND nbrboleta IN (select nbrboleta

from paboletaH where perid = '40580635' and periodoid in ('201806') )




select sum(rubsoles) from PAregistro where perid  ='45203105' and rubid IN ('AFA','BRE','R02','D17')
select rubsoles,* from PAregistro where perid  ='10287282' and rubid IN ('AFA','BRE','R02','D17')


--select * from paregistro where perid = '40580635' and rubid = 'r02'

 /**** CAMBIAZO ****/
SELECT sbruto, sneto, * -- CONVERT(float,COUNT(SBruto)), CONVERT(float,SUM(SBruto)) 
FROM PABoletaH WITH(NOLOCK) WHERE peremp= 'AM'  AND periodoid>= '200610'  
AND PeriodoId IN ('201801','201802','201803','201804','201805','201806') AND PerId= '10774615' 
ORDER BY PeriodoId ASC

--201801	10774615  	5595
--201802	10774615  	5685
--201803	10774615  	5685
--201804	10774615  	5611.9
--201805	10774615  	5542.46
--201806	10774615  	5544.11


-- GENTE DE VENTAS
SELECT H.periodoid ,H.perid ,H.sbruto ,Y.TOTAL 
-- UPDATE H SET H.sbruto = Y.TOTAL
FROM paboletaH h
INNER JOIN (
SELECT * FROM (
SELECT  nbrboleta ,SUM( CASE WHEN RUBID IN ('D17') THEN rubsoles * -1 ELSE rubsoles END)TOTAL  FROM paboletad   WHERE RUBID IN ('AFA','BRE','R02','D17','R19','R03')
GROUP BY nbrboleta 
)X
)Y ON H.nbrboleta  = Y.nbrboleta 
WHERE H.perid  ='10287282' AND periodoid IN ('201801','201802','201803','201804','201805','201806') ORDER BY H.periodoid ASC


--- GENTE DE OFICINA (SIN COMISIONES) ---
SELECT H.periodoid ,H.perid ,H.sbruto ,Y.TOTAL 
-- UPDATE H SET H.sbruto = Y.TOTAL
FROM paboletaH h
INNER JOIN (
SELECT * FROM (
SELECT  nbrboleta ,SUM( CASE WHEN RUBID IN ('D17') THEN rubsoles * -1 ELSE rubsoles END)TOTAL  FROM paboletad WHERE RUBID IN ('AFA','BRE','R02','D17','R19')
GROUP BY nbrboleta 
)X
)Y ON H.nbrboleta  = Y.nbrboleta 
WHERE H.perid  ='10682322' AND periodoid IN ('201801','201802','201803','201804','201805','201806') ORDER BY H.periodoid ASC

--ASP_GRTJUL_DIC_AM



SELECT  nbrboleta ,*--,SUM( CASE WHEN RUBID = 'D17' THEN rubsoles * -1 ELSE rubsoles END)TOTAL  
FROM paboletad   WHERE RUBID IN ('AFA','BRE','R02','D17','R17','R19','R03','D03') AND nbrboleta IN (SELECT nbrboleta FROM paboletaH WHERE PERID = '16410842' AND periodoid = '201803')
--GROUP BY nbrboleta 





 --INSERT INTO TempDetalleBoleta(perid,nombre,fingreso ,basico,ESSALUD,SENATI ,ASIGFAM ,BRE ,BDF,ESSVIDA ,SNP ,RENTA ,AFPFONDO ,AFPCOMISION ,AFPSEGURO,bruto,rpm,rimac,peremp )  VALUES(  '40640940' ,  'ABREGU VELASQUEZ MARCO ANTONIO' , '02/01/2017' , 0,0,0, 93,0,0,0,0,0,0,0,0,0,0,0, 'AM' )


 --delete TempDetalleBoleta


 /**** CTS (SEXTO GRATIS) ****/

 SELECT CAST(paboletad.CANTIDAD AS VARCHAR(50)) as dato FROM paboletad 
 INNER JOIN paboletaH ON paboletad.nbrboleta = paboletaH.nbrboleta 
 WHERE paboletaH.peremp= 'AM'  AND paboletaH.perid= '10861882'  
 AND paboletad.RUBID='R07' AND paboletaH.periodoid=
 (select TOP 1 periodoid from paboletah where periodoid like '%GR' AND peremp= 'AM'  ORDER BY periodoid DESC)

SELECT * FROM PAREGISTRO WHERE perid = '10861882' AND rubid = 'CTS'

SELECT * FROM PAREGISTRO WHERE perid = '10861882' AND rubid = 'D01'
SELECT * FROM PAREGISTRO WHERE perid = '10861882' AND rubid = 'D02'
SELECT * FROM PAREGISTRO WHERE perid = '10861882' AND rubid = 'D06'
SELECT * FROM PAREGISTRO WHERE perid = '10861882' AND rubid = 'D07'
SELECT * FROM PAREGISTRO WHERE perid = '10861882' AND rubid = 'D08'

SELECT * FROM PAREGISTRO WHERE perid = '10861882' AND rubid = 'D17'
SELECT * FROM PAREGISTRO WHERE perid = '10861882' AND rubid = 'D22'
SELECT * FROM PAREGISTRO WHERE perid = '10861882' AND rubid = 'GRM'

SELECT * FROM PAREGISTRO WHERE perid = '10861882' AND rubid = 'R02'
SELECT * FROM PAREGISTRO WHERE perid = '10861882' AND rubid = 'R03'
SELECT * FROM PAREGISTRO WHERE perid = '10861882' AND rubid = 'R06'
SELECT * FROM PAREGISTRO WHERE perid = '10861882' AND rubid = 'VAC'

SELECT * FROM PAREGISTRO WHERE perid = '10861882' AND rubtipo = '05'

v_detalleBoleta

SELECT * FROM pasetup



/************** MANTY **************/

SELECT 
sbruto, PeriodoId, *
--CONVERT(float,COUNT(SBruto)), 
--round(SUM(SBruto),2) 

FROM PABoletaH D WITH(NOLOCK) 
WHERE peremp= 'AM'  AND periodoid>= '200610'  
AND PeriodoId IN ('201801','201802','201803','201804','201805','201806') AND PerId= '10774615' 
ORDER BY D.PeriodoId ASC

SELECT 
--sbruto, PeriodoId, *
CONVERT(float,COUNT(SBruto)), 
round(SUM(SBruto),2) 

FROM PABoletaH D WITH(NOLOCK) 
WHERE peremp= 'AM'  AND periodoid>= '200610'  
AND PeriodoId IN ('201801','201802','201803','201804','201805') AND PerId= '10774615' 
ORDER BY D.PeriodoId ASC


UPDATE PABoletaH 
SET sbruto = 5611.90 where nbrboleta = '9000045420'

UPDATE PABoletaH 
SET sbruto = 5542.46 where nbrboleta = '9000046969'


 --ABRIL - S/. 5,611.90 
 --MAYO - S/. 5,542.46 
--original
--5062
--4187.6

--select * from PABoletaH where nbrboleta = '9000051134'

SELECT *
--CONVERT(float,COUNT(PABoletaD.cantidad)), 
--CONVERT(float,SUM(PABoletaD.cantidad)) 
FROM PABoletaD WITH(NOLOCK) INNER JOIN 
PABoletaH WITH(NOLOCK) ON PABoletaD.nbrBoleta=PABoletaH.nbrBoleta 
WHERE PABoletaH.peremp= 'AM'  AND 
PABoletaD.RubId not in ('R18','R17')  
and rubtipo ='02' AND PABoletaH.periodoid>= '200610'  
AND PABoletaH.periodoid IN 
('201801','201802','201803','201804','201805','201806') 
AND PerId= '10774615' 







