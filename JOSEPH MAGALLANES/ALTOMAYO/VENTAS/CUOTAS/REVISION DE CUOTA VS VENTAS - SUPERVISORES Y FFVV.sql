select sum(a.CuryTotInvc) CuryTotInvc, sum(a.CuryTotMerch) CuryTotMerch --a.SlsperID, b.Name, * 
from SOShipHeader a 
inner join Salesperson b on a.SlsperID = b.SlsperId
where Cancelled = 0 and a.SlsperID in
(
'006',
'239', --
'556', --
'557',
'694',
'771',
'960',
-- agentes
'536',
'699',
'700',
'701',
'702',
'703',
'705'
) and PerPost = '202110'
--order by a.SlsperID asc


select SlsperId, Name, * from Salesperson where SlsperId in (
'006',
'239', --
'556', --
'557',
'694',
'771',
'960'
)

SELECT A.perpost, D.pvfdV_id, A.slsperid, S.name, C.idmarca, D.cuota, round(sum(B.totinvc),2) totinvc, 
cast(round(cast(sum(B.totinvc) as decimal(10,2))/cast(D.cuota as decimal(10,2)),4)*100 as float) avance
FROM SOShipHeader A
INNER JOIN SOShipLine B ON A.SHIPPERID = B.SHIPPERID
LEFT JOIN ZInventoryMILES C ON B.invtid = C.invtid
LEFT JOIN PV_FuerzaDirectaD D ON A.slsperid = D.pvfdD_id and C.idmarca = D.Marca and D.pvfdV_id in ('000206','000207','000209','000210') --'000066' --'000070'
LEFT JOIN Salesperson S ON A.slsperid = S.slsperid
WHERE A.Cancelled = 0 and A.SLSPERID in ('006','239','556','557','694','771','960')
AND A.PerPost IN ('202110') 
group by A.perpost, D.pvfdV_id, A.slsperid, S.name, C.idmarca, D.cuota
order by SlsperId asc

select * 
-- delete
from PV_FuerzaDirectaD where pvfdV_id in (select pvfdH_id from PV_FuerzaDirectaH where Periodo = '202110' and perId in ('006','239','556','557','694','771','960'))
          																										 
																												 



SELECT A.perpost, D.pvfdV_id, A.slsperid, S.name, C.idmarca, D.cuota, round(sum(B.totinvc),2) totinvc--, 
--cast(round(cast(sum(isnull(B.totinvc,0)) as decimal(10,2))/cast(isnull(D.cuota,0) as decimal(10,2)),4)*100 as float) avance
FROM SOShipHeader A
INNER JOIN SOShipLine B ON A.SHIPPERID = B.SHIPPERID
LEFT JOIN ZInventoryMILES C ON B.invtid = C.invtid
LEFT JOIN PV_FuerzaDirectaD D ON A.slsperid = D.pvfdD_id and C.idmarca = D.Marca and D.pvfdV_id = '000208' --'000066' --'000070'
LEFT JOIN Salesperson S ON A.slsperid = S.slsperid
WHERE A.Cancelled = 0 and A.SLSPERID in (
'536',
'699',
'700',
'701',
'702',
'703',
'705'
) AND A.PerPost IN ('202110') 
group by A.perpost, D.pvfdV_id, A.slsperid, S.name, C.idmarca, D.cuota
