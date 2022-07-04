
--paso 1 consultar tablas y verificar si esta liberado. 
select rlsed,status,*from batch where batnbr in('011790') and module ='Ar'
select rlsed,refnbr,curyorigDocAmt,origDocAmt,custid,doctype,docdate,user2,docbal,*from ardoc where batnbr  in('011790')  --and refnbr in ('PLUS062014')
select rlsed,refnbr,curyTranAmt,TranAmt,custid,trantype,trandesc,*from artran where batnbr  in('011790')  --and refnbr in ('080F000324')--and acct ='999999'
select refnbr,curycramt, cramt, curydramt,dramt,trantype,rlsed,trandesc,*
from gltran where batnbr  in('011790')  and module ='Ar' --and refnbr in ('080F000324') --and acct ='999999'order by gltran.refnbr
select *from aradjust where adjbatnbr  in('011790') 

--ejecutar solo si estA EN RLSED = 0 Y EXITE UNA 121301 EN ARTRAN- SOLUCION ELIMINAR REGISTRO COMO ??? EJECUTANDO EL QUERY
select BATNBR,REFNBR,CuryTranAmt,TRANAMT,(CuryTranAmt - TRANAMT),DrCr , TRANTYPE,acct,*
from arTRAN 
--delete arTRAN 
where BATNBR ='011451' AND ACCT   IN ('121301','12110','131230') AND TRANAMT=0 --AND TRANTYPE='CM'--AND refnbr IN ('B370019808','B370020017')

--TERCER PASO...

aRdebug '011451'

------- si hay error q existe en esta tabla
select *from WrkRelease where batnbr = '011451'
------------------ solucion
delete WrkRelease where batnbr = '011451'


/********************************/

select refnbr,*from  HistDocSlsTax where refnbr in (select refnbr from ardoc where batnbr ='010955')
 -- Solucion --despues de aRdebug
delete HistDocSlsTax
where refnbr in (select refnbr from ardoc where batnbr ='011451')


/*********/

select *from WrkReleaseBad

delete from WrkReleaseBad
