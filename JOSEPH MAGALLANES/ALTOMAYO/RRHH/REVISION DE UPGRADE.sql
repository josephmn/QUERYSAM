SELECT * FROM (
SELECT * FROM 
(
	select * from (
	select a.PerId, b.pernombre, a.PeriodoId, SBruto
	from PersonalBrutoMes a
	left join personalv b on a.perid = b.perid
	where PeriodoId > = '202201' and PeriodoId <= '202206'
	)x where perid in (select perid from personal where perstatus <> 'R')
	union all
	select a.perid, b.pernombre, '202207' PeriodoId, a.perbruto 
	from personal a
	left join personalv b on a.perid = b.perid
	where a.perstatus <> 'R' --and a.perid = '47939915'

) AS montos
PIVOT (sum(SBruto)
FOR PeriodoId IN ([202201],[202202],[202203],[202204],[202205],[202206],[202207]))
as PVT
) Y WHERE [202207] > [202206]
--and [202206] > 1025
--select * from PersonalBrutoMes where PeriodoId > = '202201'
