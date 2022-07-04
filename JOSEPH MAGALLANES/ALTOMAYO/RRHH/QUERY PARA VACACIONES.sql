
/*
SELECT * FROM PAVacacionAno WHERE PerId = '70687806' --AND Ano > = '2014'


SELECT perid, pernombres, carid, carnombre, ZonaDescr, perfing, Acumulado, Gozados, 
Ano1 '2014-2015', Ano2 '2015-2016', Ano3 '2016-2017', Ano4 '2017-2018', Ano5 '2018-2019', Ano6, Ano7, Ano8, Ano9, Total, Descripcion, Motivo
FROM ControlVacaciones WHERE PerId = '10509942'

--perid, pernombres, carid, carnombre, ZonaDescr, perfing, Acumulado, Gozados, Ano1, Ano2, Ano3, Ano4, Ano5, Ano6, Ano7, Ano8, Ano9, Total, Descripcion, Motivo

*/

SELECT pernombre, perpaterno, permaterno, perfing FROM Personal WHERE perid IN ('72130767','10509942','77683117','70687806')

SELECT DATEDIFF(year,'2004-01-01', '2018-01-01')
SELECT DATEDIFF(quarter,'2004-01-01', '2018-01-01')
SELECT DATEDIFF(month,'2004-01-01', '2018-01-01')
SELECT DATEDIFF(dayofyear,'2004-01-01', '2018-01-01')
SELECT DATEDIFF(day,'2004-01-01', '2018-01-01')
SELECT DATEDIFF(week,'2018-01-01', '2018-12-01')


SELECT * FROM (
SELECT perid, pernombre, perpaterno, permaterno, perfing, 
DATEDIFF(year,perfing,GETDATE()) 'AÑOS EN EMPRESA',
((CONVERT(int,DATEDIFF(year,perfing,GETDATE()))*12)*2.5) 'DIAS DE VACACIONES COMPLETAS', ---SOLO SI LOS AÑOS ESTAN COMPLETOS
CONVERT(DATETIME,convert(char(4),GETDATE(),120)+RIGHT(CONVERT(varchar(10),perfing,120),6)) 'ANO_LABORAL_ACTUAL',
CASE WHEN DATEDIFF(month,CONVERT(DATETIME,convert(char(4),GETDATE(),120)+RIGHT(CONVERT(varchar(10),perfing,120),6)), '2018-10-31') < 0 
	THEN 0 ELSE DATEDIFF(month,CONVERT(DATETIME,convert(char(4),GETDATE(),120)+RIGHT(CONVERT(varchar(10),perfing,120),6)), '2018-10-31') END  'MESES ACTUALES LABORALES',

((CASE WHEN DATEDIFF(month,CONVERT(DATETIME,convert(char(4),GETDATE(),120)+RIGHT(CONVERT(varchar(10),perfing,120),6)), '2018-10-31') < 0 
	THEN 0 ELSE DATEDIFF(month,CONVERT(DATETIME,convert(char(4),GETDATE(),120)+RIGHT(CONVERT(varchar(10),perfing,120),6)), '2018-10-31') END)*2.5)  'DIAS ACTUALES DE VACACIONES'

FROM Personal WHERE perid IN ('72130767','10509942','77683117','70687806','10774615')
) X






