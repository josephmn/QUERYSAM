

select *from ardoc where batnbr ='028090'
select *from artran where batnbr ='028090'


select A.custid,T.acct,T.tranamt,T.Curytranamt,curyorigDocAmt,origDocAmt,TaxTot00, txbltot00,T.trantype,round((TaxTot00 - tranamt),2) dif,*
--update T set tranamt = TaxTot00,Curytranamt = TaxTot00                                            --401110
--update T set tranamt = txbltot00,Curytranamt = txbltot00                                          --701110
--update T set tranamt = txbltot00+TaxTot00,Curytranamt = txbltot00+TaxTot00            --121301
from ardoc A inner join  artran T on A.batnbr=T.batnbr and A.refnbr = T.refnbr
where 
--A.batnbr ='028090'
----and T.acct ='701110'
--and 
A.perpost ='201608' and
T.acct ='401110' and tranamt <> 0 --and round((TaxTot00 - tranamt),2) < 0 --and TranDesc='IGV 18 %'                      
--and T.acct ='121301'
order by A.refnbr


select A.refnbr,A.custid,T.acct,T.Cramt,T.curyCramt,T.Dramt,T.curyDramt,curyorigDocAmt,origDocAmt,TaxTot00, txbltot00,T.trantype,*
--update T set Cramt = TaxTot00,curyCramt = TaxTot00                                                --401110
--update T set Cramt = 0,curyCramt = 0                                                  --401110
--update T set Cramt = txbltot00,curyCramt = txbltot00                                                    --701110
--update T set Dramt = txbltot00+TaxTot00,curyDramt = txbltot00+TaxTot00                      --121301
from ardoc A inner join  gltran T on A.batnbr=T.batnbr and A.refnbr = T.refnbr
where 
--A.batnbr ='028090' and 
T.module ='AR' and a.perpost ='201608'
--and T.acct ='701110'
and T.acct ='401110' AND dramt <> 0
--and T.acct ='121301'
order by A.refnbr
