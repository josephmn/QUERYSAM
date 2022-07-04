SELECT xViewCtaOrigen."Acct9", xViewCtaOrigen."Acct", xViewCtaOrigen."CrAmt", xViewCtaOrigen."DrAmt", xViewCtaOrigen."PerPost", xViewCtaOrigen."Posted", xViewCtaDestino."Destino"
 FROM { oj "CA2016APP"."dbo"."xViewCtaOrigen" xViewCtaOrigen INNER JOIN "CA2016APP"."dbo"."xViewCtaDestino" xViewCtaDestino ON xViewCtaOrigen."Acct9" = xViewCtaDestino."Acct9" 
 AND xViewCtaOrigen."PerPost" = xViewCtaDestino."perpost"} WHERE (xViewCtaOrigen."Acct" <> '99999' AND xViewCtaOrigen."Acct" <> '99998') AND xViewCtaOrigen."Posted" = 'P'  
  AND ((xViewCtaDestino.perpost between '201607' AND '201607')) 
  AND xViewCtaOrigen.ACCT9 ='676101'
  ORDER BY xViewCtaOrigen."Acct9" ASC, xViewCtaOrigen."Acct" ASC






SP_HELPTEXT  xViewCtaDestino

Select distinct  l.Acct9,g.perpost,Destino=sum(g.dramt)-sum(g.cramt)  
from (Select distinct Acct9 from LAG_LOCAcctDis) l join gltran g   
on g.acct=l.Acct9 and g.posted in ('P')   
group by l.Acct9,g.perpost  



Select distinct g.batnbr,  l.Acct9,g.perpost,Destino=sum(g.dramt)-sum(g.cramt)  
from (Select distinct Acct9 from LAG_LOCAcctDis) l join gltran g   
on g.acct=l.Acct9 and g.posted in ('P')   WHERE g.perpost ='201611' and l.acct9 ='676101'
group by g.batnbr,l.Acct9,g.perpost  


 SELECT BATNBR, DRAMT,CRAMT,* FROM GLTRAN WHERE MODULE ='gl' AND BATNBR ='008878'
 select dramt,CRAMT ,batnbr,module,* from gltran where perpost ='201611' and BATNBR ='026563' and module ='AP'
select dramt ,batnbr,module,* from gltran where perpost ='201608' and acct ='943102'  and module ='AP'


select dramt ,batnbr,module,* from gltran where perpost ='201607' and acct ='976101' and dramt in (0.32,0.41) and module ='AP'
update gltran  G set dramt  = 0 WHERE BATNBR ='' AND MODULE ='' AND ACCT  ='956007'




select batnbr,module,dramt,curydramt,* from gltran where perpost ='201607' and acct ='976101'  and module ='AP' and batnbr  ='014741'
update gltran  set dramt  = 0.71 where perpost ='201607' and acct ='976101' and curydramt in (0.41) and module ='AP' and batnbr ='014741'


---------------| RESUMEN DE CUENTAS |-----------------------


select sum(cramt),sum(curycramt),sum(dramt),sum(curydramt) from gltran where perpost  ='201611'





---------------------------------------------------------
SELECT GLTran."Acct", GLTran."BatNbr", GLTran."CpnyID", GLTran."CrAmt", GLTran."DrAmt", GLTran."JrnlType", GLTran."LedgerID", GLTran."LineNbr", 
GLTran."OrigCpnyID", GLTran."PerEnt", GLTran."PerPost", GLTran."Posted", GLTran."RefNbr", GLTran."Sub", GLTran."TranDate", GLTran."TranDesc", 
GLTran."TranType", Account."Acct", Account."AcctType", Account."Descr", RptCompany."RI_ID", vs_Company."CpnyName" FROM 
{ oj (("CA2016APP"."dbo"."GLTran" GLTran INNER JOIN "CA2016APP"."dbo"."RptCompany" RptCompany ON GLTran."CpnyID" = RptCompany."CpnyID") 
 INNER JOIN "CA2016APP"."dbo"."vs_Company" vs_Company ON GLTran."CpnyID" = vs_Company."CpnyID") 
  LEFT OUTER JOIN "CA2016APP"."dbo"."Account" Account ON GLTran."Acct" = Account."Acct"} WHERE GLTran."Posted" = 'P' 
    AND ((RI_ID = 6) AND ((GLTran.PerPost between '201611' AND '201611'))) ORDER BY GLTran."CpnyID" ASC, GLTran."LedgerID" ASC
    
    
    select x.module,x.batnbr,x.cramt,x.dramt from 
    (
    select module,batnbr,round(sum(cramt),2)cramt,round(sum(dramt),2)dramt, sum(cramt)- sum(dramt)diferencia from gltran where perpost  ='201611'
    group by  module,batnbr
    )x where x.diferencia <>0
    
    
    [192.168.10.93].SGRP2016.GEN.AM_Movimiento_MigrarVentas '201611'
    
    
    
    
    
    
    