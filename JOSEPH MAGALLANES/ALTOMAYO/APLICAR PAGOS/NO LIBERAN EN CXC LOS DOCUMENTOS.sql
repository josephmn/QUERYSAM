

SELECT ARBatNbr, INBatNbr, CustID, Cancelled, InvcNbr, BalDue, CuryBalDue, CuryID, CuryRate, CuryTotInvc, CuryTotMerch, TotCost, TotInvc, TotMerch, TotShipWght, User5 
FROM SOShipHeader where InvcNbr in (
'B050058456',
'B050058457',
'B050058458',
'B050058460',
'B050058463',
'B050058466',
'B050058469',
'B050058470',
'B050058471',
'B050058475',
'B050058476',
'B050058481',
'B050058486',
'B050058487',
'B050058488'
)


--exec liberarAR '009701'

SELECT
    xAMVentasPorLiberar."siteid", xAMVentasPorLiberar."Perpost", xAMVentasPorLiberar."Shipperid", xAMVentasPorLiberar."refnbr"
FROM
    "AM2018APP"."dbo"."xAMVentasPorLiberar" xAMVentasPorLiberar
ORDER BY
    xAMVentasPorLiberar."siteid" ASC



	/*
CREATE  view [dbo].[xAMVentasPorLiberar]  
as  



select siteid, Perpost, Shipperid = '', refnbr, jrnltype  
from intran  
where rlsed=0 and jrnltype='om'   
  
union  
  
select siteid, perpost, Shipperid, invcnbr, JrnlType = 'OM'  
from soshipheader where cancelled = 0 and inbatnbr =''

SELECT Rlsed, RefNbr, *
FROM INTran A WHERE BatNbr = '011626'

SELECT Rlsed, RefNbr, *
FROM INTran A WHERE BatNbr = '011625' AND RefNbr IN (
'B050058456',
'B050058457',
'B050058458',
'B050058460',
'B050058463',
'B050058466',
'B050058469',
'B050058470',
'B050058471',
'B050058475',
'B050058476',
'B050058481',
'B050058486',
'B050058487',
'B050058488') ORDER BY A.RefNbr ASC

select *
from GLTran where BatNbr = '011625'


select Status, Rlsed, * 
-- UPDATE B SET Status = 'B', RLSED = 0
from Batch B where BatNbr = '011625' and Module = 'IN'


*/

