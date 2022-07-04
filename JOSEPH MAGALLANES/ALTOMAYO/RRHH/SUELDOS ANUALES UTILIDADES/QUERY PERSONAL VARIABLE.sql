
--insert into COMPARATIVO_SISTEMAS (PERID, pernombre, ENERO, FEBRERO, MARZO, ABRIL, MAYO, JUNIO, JULIO, AGOSTO, SEPTIEMBRE, OCTUBRE, NOVIEMBRE, DICIEMBRE, JULIOGR, DICIEMBREGR, LIQBBSS)

SELECT perid, pernombre, 
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
isnull([JULIO-GR],0) [JULIO-GR],
isnull([DICIEMBRE-GR],0) [DICIEMBRE-GR],
0 [LIQBBSS]
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
--AND A.perid = '10287282' 
AND rubsoles > 0 
AND RUBID IN ('AFA','BRE','R02','D17','R03','R04','R06','R23','R13','R14','R24','R25','R05','R07','R27','R34','R35','R36',/*'D24','S02','R21',*/'D25') --,'R18'
AND P.user4 = 0
--AND A.periodoid = '202112'
AND A.perid NOT IN ('40033352','42706489','72174102','72388324','45047812','45002217','72895775')
GROUP BY A.nbrboleta, A.periodoid, A.perid, A.pernombre
--ORDER BY A.periodoid
) AS SourceTable  
PIVOT  
(
SUM(TOTAL)  
FOR MES IN ([ENERO], [FEBRERO], [MARZO], [ABRIL], [MAYO], [JUNIO], [JULIO], [AGOSTO], [SEPTIEMBRE], [OCTUBRE], [NOVIEMBRE], [DICIEMBRE], [JULIO-GR], [DICIEMBRE-GR])  
) AS PivotTable

ORDER BY perid
--SELECT * FROM paboletad WHERE nbrboleta = '9000117894' AND RUBSOLES > 0

/*
--SELECT * FROM PArubro WHERE RUBID = 'R21'

--delete from paboletah where perid = '9000123689'
--delete from paboletah where perid = '9000123689'

SELECT * 
-- update a set sneto = 0
FROM paboletaH a WHERE PERID = '47770904' and periodoid = '202109'
ORDER BY periodoid ASC

SELECT * 
-- DELETE 
-- UPDATE paboletad SET rubsoles = 0, cantidad = 0
FROM paboletad WHERE nbrboleta = '9000123689'
--AND rubid <> 'BRE'

select * 
-- update tempPagoPlanilla_HIST set DIA_LABORA = 0
from tempPagoPlanilla_HIST where perid = '47770904' and PERIODO = '202109'


--insert into paboletad 
--(cantidad, nbrboleta, provisiona, rubctac, rubctad, rubdesc, rubid, rubporcentaje, rubsoles, rubsubc, 
--rubsubd, rubtipo, user1, user10, user2, user3, user4, user5, user6, user7, user8, user9)

--select cantidad, '9000123456', provisiona, rubctac, rubctad, rubdesc, rubid, rubporcentaje, rubsoles, rubsubc, 
--rubsubd, rubtipo, user1, user10, user2, user3, user4, user5, user6, user7, user8, user9 from paboletad where nbrboleta = '9000123526'
*/