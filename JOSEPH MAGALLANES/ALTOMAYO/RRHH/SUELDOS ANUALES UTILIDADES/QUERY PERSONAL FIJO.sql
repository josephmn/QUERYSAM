
-- DROP TABLE COMPARATIVO_SISTEMAS

SELECT * FROM (
SELECT TOP 9999 perid, pernombre, 
isnull([ENERO],0) [ENERO], 
isnull([FEBRERO],0) [FEBRERO],
isnull([MARZO],0) [MARZO],
isnull([ABRIL],0) [ABRIL],
isnull([MAYO],0) [MAYO],
isnull([JUNIO],0) [JUNIO],
isnull([JULIO],0) [JULIO],
isnull([AGOSTO],0) [AGOSTO],
isnull([SEPTIEMBRE],0) [SEPTIEMBRE],
isnull([OCTUBRE],0) [OCTUBRE],
isnull([NOVIEMBRE],0) [NOVIEMBRE],
isnull([DICIEMBRE],0) [DICIEMBRE],
isnull([JULIO-GR],0) [JULIOGR],
isnull([DICIEMBRE-GR],0) [DICIEMBREGR],
0 [LIQBBSS] --into COMPARATIVO_SISTEMAS
FROM  
(
SELECT A.perid, A.pernombre, round(SUM( CASE WHEN RUBID IN ('D17','D24','D25') THEN rubsoles * -1 ELSE rubsoles END),2) TOTAL, 
(CASE 

WHEN RIGHT(A.periodoid,2) = '01' THEN 'ENERO' 
WHEN RIGHT(A.periodoid,2) = '02' THEN 'FEBRERO' 
WHEN RIGHT(A.periodoid,2) = '03' THEN 'MARZO' 
WHEN RIGHT(A.periodoid,2) = '04' THEN 'ABRIL' 
WHEN RIGHT(A.periodoid,2) = '05' THEN 'MAYO' 
WHEN RIGHT(A.periodoid,2) = '06' THEN 'JUNIO' 
WHEN RIGHT(A.periodoid,2) = '07' THEN 'JULIO' 
WHEN RIGHT(A.periodoid,2) = '08' THEN 'AGOSTO' 
WHEN RIGHT(A.periodoid,2) = '09' THEN 'SEPTIEMBRE' 
WHEN RIGHT(A.periodoid,2) = '10' THEN 'OCTUBRE' 
WHEN RIGHT(A.periodoid,2) = '11' THEN 'NOVIEMBRE' 
WHEN RIGHT(A.periodoid,2) = '12' THEN 'DICIEMBRE' 

ELSE (CASE WHEN A.periodoid LIKE '%07GR%' THEN 'JULIO-GR' ELSE 'DICIEMBRE-GR' END) END) MES
FROM paboletaH A
INNER JOIN paboletad B ON A.nbrboleta = B.nbrboleta
LEFT JOIN PERSONAL P ON A.perid = P.perid
WHERE A.periodoid IN ('202101','202102','202103','202104','202105','202106','202107','202108','202109','202110','202111','202112','2107GR','2112GR') 
--AND A.perid = '72130767' 
AND rubsoles > 0
AND RUBID IN ('AFA','BRE','R02','D17','R03','R04','R06','R23','R13','R14','R24','R25','R18','R05','R07','R27','R34','R35','R36','D24','D25'/*,'S02','R21'*/) 
AND P.user4 IN (1,2)
--AND A.perid = '46336583'
--AND A.perid NOT IN ('40033352','42706489','72174102','72388324','45047812','45002217','72895775')
--AND A.periodoid = '202112'
GROUP BY A.nbrboleta, A.periodoid, A.perid, A.pernombre
--ORDER BY A.periodoid
) AS SourceTable  
PIVOT  
(
SUM(TOTAL)  
FOR MES IN ([ENERO], [FEBRERO], [MARZO], [ABRIL], [MAYO], [JUNIO], [JULIO], [AGOSTO], [SEPTIEMBRE], [OCTUBRE], [NOVIEMBRE], [DICIEMBRE], [JULIO-GR], [DICIEMBRE-GR])  
) AS PivotTable
ORDER BY perid
) X --WHERE PERID = '46630385'


--SELECT * 
---- UPDATE paboletaH SET PERNOMBRE = 'RINZA DE LA CRUZ WILLIAM'
--FROM paboletaH WHERE perid = '45695751'




SELECT A.LiqBenId, A.perid, C.pernombre, A.FechaCese, 
0 ENERO, 
0 FEBRERO, 
0 MARZO, 
0 ABRIL, 
0 MAYO,
0 JUNIO,
0 JULIO,
0 AGOSTO,
0 SEPTIEMBRE,
0 OCTUBRE,
0 NOVIEMBRE,
0 DICIEMBRE,
0 JULIOGR,
0 DICIEMBREGR,
A.GratiTotal, A.VacTotal, A.DevTotal,
(A.GratiTotal + A.VacTotal + A.DevTotal) - (A.user3 + A.user2) LIQBBSS 
FROM PALiqBeneficios A
INNER JOIN PERSONAL B ON A.PERID = B.PERID 
INNER JOIN PERSONALV C ON B.PERID = C.PERID
WHERE 
--a.PerId in ('00796675','10799491') and
--A.PerId IN
--('45032867','46336583','10861882','42179253','10682322','45507329','44579663','47344842')
YEAR(a.FechaCese) = '2021'

select * from PALiqBeneficios where PerId in ('00796675') and YEAR(FechaCese) = '2021'
select * from PALiqBeneficios where PerId in ('10799491') and YEAR(FechaCese) = '2021'


--select user2, user3, * from PALiqBeneficios where YEAR(FechaCese) = '2021'
--and PerId not like '%X' and user2 <> '0'

----select user2, user3, * from PALiqBeneficios where YEAR(FechaCese) = '2022'
----and PerId not like '%X' and user2 <> '0'

--select * from PALiqBeneficios where PerId in ('10799491') and YEAR(FechaCese) = '2021'
--select * from PALiqBeneficios where YEAR(FechaCese) = '2022' and PerId = '70051903'
----and PerId not like '%X' and user2 <> '0'

