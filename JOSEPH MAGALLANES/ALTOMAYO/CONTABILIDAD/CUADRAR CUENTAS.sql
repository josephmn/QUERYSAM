--update T set Cramt = TaxTot00,curyCramt = TaxTot00                                                --401110 in
--update T set dramt = TaxTot00,curydramt = TaxTot00                                                --401110 CM
--update T set Cramt = 0,curyCramt = 0																--401110
--update T set Cramt = txbltot00,curyCramt = txbltot00                                              --701110 IN
--update T set Dramt = txbltot00,curyDramt = txbltot00                                              --701110 CM
--update T set Dramt = txbltot00+TaxTot00,curyDramt = txbltot00+TaxTot00                            --121301 IN
--update T set Cramt = txbltot00+TaxTot00,curyCramt = txbltot00+TaxTot00--,Dramt=0,   curyDramt=0   --121301 CM


select A.* from ardoc A inner join  artran T on A.batnbr=T.batnbr and A.refnbr = T.refnbr
where 
A.perpost ='201804' and a.RefNbr = 'B140063670' and T.TranType = 'IN'

--and round((TaxTot00 - tranamt),2) between -0.02 and 0.02


select A.refnbr,A.custid,T.acct,T.Cramt,T.curyCramt,T.Dramt,T.curyDramt,curyorigDocAmt,origDocAmt,TaxTot00, txbltot00,T.trantype,
round(T.Cramt-TaxTot00,2)igv ,round(T.dramt-TaxTot00,2) igv,round(T.Cramt-txbltot00,2) base,round(T.dramt-txbltot00,2) base,round(T.Cramt-curyorigDocAmt,2) total,round(T.dramt-curyorigDocAmt,2) total,*

from ardoc A inner join  gltran T on A.batnbr=T.batnbr and A.refnbr = T.refnbr
where
t.perpost ='201804' and T.module ='AR' and trantype <> 'PA'
and T.acct ='701110' AND Cramt <> 0 and trantype  in ( 'IN')
and t.refnbr ='B140063670'
order by A.refnbr


--select * from GLTran where RefNbr = 'B140063670' --and Acct = '121301'

select Acct, BatNbr, RefNbr, CrAmt, CuryCrAmt, CuryDrAmt, DrAmt, * from GLTran where RefNbr = 'B140063903' and Acct = '121301' and TranType = 'IN' and Module = 'AR'  --121301

select Acct, BatNbr, RefNbr, CrAmt, CuryCrAmt, CuryDrAmt, DrAmt, * from GLTran where RefNbr = 'B140063903' and Acct = '701110' and TranType = 'IN' and Module = 'AR'  --701110

select Acct, BatNbr, RefNbr, CrAmt, CuryCrAmt, CuryDrAmt, DrAmt, * from GLTran where RefNbr = 'B140063903' and Acct = '401110' and TranType = 'IN' and Module = 'AR'  --401110

select BankAcct, BatNbr, RefNbr, DocDate, CuryOrigDocAmt, OrigDocAmt, * from Ardoc where RefNbr = 'B140063903' and PerPost = '201804'  and DocType = 'IN'

select Acct, BatNbr, RefNbr, CuryTranAmt, TranAmt, TranType, TranDesc, * from ARTran where RefNbr = 'B140063903' and Acct = '121301' and TranType = 'IN'



