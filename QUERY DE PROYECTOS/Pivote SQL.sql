
select AH.IdCorrelativo, AP.Codigo, AP.Descr, (primeratabla.Lunes - AP.Lunes) LunesD,
(primeratabla.Martes - AP.Martes) MartesD,
(primeratabla.Miercoles - AP.Miercoles) MiercolesD,
(primeratabla.Jueves - AP.Jueves) JuevesD,
(primeratabla.Viernes - AP.Viernes) ViernesD,
(primeratabla.Sabado - AP.Sabado) SabadoD
from (
SELECT y.KitID, y.Descr, ISNULL((y.Lunes),0) Lunes, ISNULL((y.Martes),0) Martes, ISNULL((y.Miercoles),0) Miercoles, 
ISNULL((y.Jueves),0) Jueves, ISNULL((y.Viernes),0) Viernes, ISNULL((y.Sabado),0) Sabado FROM (
select [KitID],[Descr],[Lunes],[Martes],[Miercoles],[Jueves],[Viernes],[Sabado] from (
SELECT assy.KitID, inv.Descr, sum(assy.KitCntr) KitCntr, (
SELECT (case x.dia 
when 'Monday' then 'Lunes' 
when 'Tuesday' then 'Martes'
when 'Wednesday' then 'Miercoles'
when 'Thursday' then 'Jueves'
when 'Friday' then 'Viernes'
when 'Saturday' then 'Sabado'
when 'Sunday' then 'Domingo'
else 'NADA'
end) Dia FROM (
select CONVERT(VARCHAR(100),DATENAME(weekday,assy.TranDate)) dia
)x
) DiaSemana FROM AssyDoc assy
inner join Inventory inv on assy.KitID = inv.InvtID
where TranDate between 
--@fechaInicio 
(select distinct ff.FechaInicio from AMProdSemanalH hh inner join FechaPlanProduccion ff on hh.Semana = ff.NroSemana where hh.IdCorrelativo = '000001')
and 
--@fechaFin
(select distinct ff.FechaFin from AMProdSemanalH hh inner join FechaPlanProduccion ff on hh.Semana = ff.NroSemana where hh.IdCorrelativo = '000001')
group by assy.KitID, inv.Descr,assy.TranDate
--ORDER BY assy.TranDate
)x
pivot
(
SUM(KitCntr)
for [DiaSemana] in ([Lunes],[Martes],[Miercoles],[Jueves],[Viernes],[Sabado])
)
AS PIVOTETE
)y
) primeratabla
inner join AMProdSemanalD AP ON AP.Codigo = primeratabla.KitID
inner join AMProdSemanalH AH ON AH.IdCorrelativo = AP.IdCorrelativo
--inner join FechaPlanProduccion lp on AH.Semana = lp.NroSemana
WHERE AH.IdCorrelativo = '000001'
