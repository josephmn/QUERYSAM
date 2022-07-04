
--- CAMBIAR TOTAL EN VENTAS / EMBARQUE A PARTIR DEL DETALLE
select invcnbr,BalDue,CuryBalDue,CuryRate,CuryTotInvc,TotInvc,CuryTotMerch,TotMerch,CuryTotTax,TotTax,CuryTotMerch * 0.18,TotCost,*
--update soshipheader set CuryBalDue=  CuryTotMerch * 1.18 --,CuryTotInvc= TotInvc * CuryRate ,TotMerch= CuryTotMerch * CuryRate ,CuryTotTax= TotTax * CuryRate 
from soshipheader where shipperid in('NCCH000033')


select *
--update soshipline set TotInvc= CuryTotInvc * 3.156,TotMerch= CuryTotMerch * 3.156 ,TxblAmt00= CuryTxblAmt00 * 3.156 ,TotCost= CuryTotCost * 3.156 ,TaxAmt00= CuryTaxAmt00 * 3.156 ,SlsPrice= CurySlsPrice * 3.156 
from soshipline where shipperid ='NCCH000033'

--update soshipheader set BalDue =-68.47,CuryBalDue =-68.47,CuryTotInvc=-68.47,TotInvc= -68.47 where shipperid ='NCCH000033'


--update soshipline set TotInvc =-17.80 , TotMerch =-17.80,TxblAmt00=-17.80,CuryTotInvc=-17.80,CuryTotMerch=-17.80,CuryTxblAmt00=-17.80
--where shipperid ='NCCH000033' and lineref= '00004'

select sum (totinvc) from soshipline where shipperid ='NCCH000033'


