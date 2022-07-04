
/******************** QUERY EJECUCION AL CORTE ********************/

SELECT (totalmindif - MINTARDE) Sanar ,* FROM (
SELECT SUM(DifMinutos) totalmindif, PER_COD, nom_ape FROM (
select (case when DIFF_Segundos >= 3600 then (((DIFF_Segundos % (24 * 60 * 60)) / (60 * 60))*60)+(((DIFF_Segundos % (24 * 60 * 60)) % (60 * 60)) / 60) 
else ((DIFF_Segundos % (24 * 60 * 60)) % (60 * 60)) / 60 end) AS DifMinutos, PER_COD, nom_ape from AAA_DIF_AST 
where --PER_COD = '09933576' AND 
FECHA_MARCACION >= '2018-05-21' AND FECHA_MARCACION <= '2018-06-15' 
--AND DATEPART(WEEKDAY,FECHA_MARCACION) NOT IN (7,1)
AND DiaSemana NOT IN ('SABADO','DOMINGO') AND DIFF_Segundos <> 0
)x group by PER_COD, nom_ape
)y
inner join (

select SUM(MinTarde) MINTARDE, perid, Nombre  --, Fecha, Ctrl_User_Ins 
from PATardanza where month(fecha) = 6 and year(fecha) = 2018 --and PerId = '72130767'
GROUP BY Nombre, perid --, Fecha, Ctrl_User_Ins
) d on y.PER_COD = d.PerId WHERE Y.totalmindif <> D.MINTARDE


-- COMPROBACION POR DNI
/************************************************************/
SELECT MinTarde, Nombre, PerId, Ctrl_Date_Ins, * FROM PATardanza WHERE PerId = '43064252' 

select (case when DIFF_Segundos >= 3600 then (((DIFF_Segundos % (24 * 60 * 60)) / (60 * 60))*60)+(((DIFF_Segundos % (24 * 60 * 60)) % (60 * 60)) / 60) 
else ((DIFF_Segundos % (24 * 60 * 60)) % (60 * 60)) / 60 end) AS DifMinutos, PER_COD, nom_ape, HORA_ENT, DiaSemana, FECHA_MARCACION, DiaDescripcion from AAA_DIF_AST 
where PER_COD = '43064252' AND 
FECHA_MARCACION >= '2018-05-01' AND FECHA_MARCACION <= '2018-06-01' 
--AND DATEPART(WEEKDAY,FECHA_MARCACION) NOT IN (7,1)
AND DiaSemana NOT IN ('SABADO','DOMINGO') AND DIFF_Segundos <> 0 ORDER BY FECHA_MARCACION ASC



-- JUNIO 0.36805

SELECT ROUND(0.36805 * 160,2)
