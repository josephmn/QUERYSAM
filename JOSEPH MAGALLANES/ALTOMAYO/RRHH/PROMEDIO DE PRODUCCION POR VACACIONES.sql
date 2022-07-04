

SELECT a.PerId DNI, b.pernombre Nombres, a.PeriodoId periodo, a.Dias, a.Produccion 
--
FROM PALiqVacacion a
inner join personalv b on a.PerId = b.perid
where PeriodoId > = '202107' 
and a.PerId in 
(select perid from Personal where perstatus <> 'R' and user4 = 0)
order by a.PeriodoId asc
