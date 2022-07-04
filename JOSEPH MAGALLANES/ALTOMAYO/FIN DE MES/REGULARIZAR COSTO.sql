

select *  from gltran  where BatNbr  ='015052    ' and Module  ='IN' 




select TranAmt,*  from INTran where BatNbr  ='015052' and  InvtID   ='I250227'
select *  from gltran  where BatNbr  ='015052    ' and Module  ='IN'  AND   InvtID   ='I250227'


select * from gltran where Module  ='IN' AND BatNbr  ='015224'



ASP_INSERTAR_A_INTRAN
InsertLotSert
ASP_GENERAGLINTRAN




SP_HELPTEXT ASP_GENERAGLINTRAN















sp_helptext 


select * 
from 
   sys.procedures 
where 
   name like '%salesmercader%' ORDER BY name DESC 
   


SELECT  'IN'Module,vr_10630."perpost",vr_10630.BatNbr ,vr_10630.RefNbr,vr_10630."InvtID",vr_10630."trantype",
        ISNULL(  ROUND(  sum((case when vr_10630.TranType in ('RC', 'AJ', 'AC', 'AS', 'TR') then vr_10630.TranAmt * vr_10630.InvtMult else vr_10630.ExtCost * vr_10630.InvtMult end  )),2) ,0) valor ,
        sum((case when vr_10630.TranType in ('RC', 'AJ', 'AC', 'AS', 'TR','IN') then vr_10630.QTY * vr_10630.Unitprice * vr_10630.InvtMult else 0 end  )) valor2   
	FROM { oj ((("AMCAF2018APP"."dbo"."vr_10630" vr_10630 INNER JOIN "AMCAF2018APP"."dbo"."RptCompany" RptCompany ON vr_10630."CpnyID" = RptCompany."CpnyID" 
	AND vr_10630."RI_ID" = RptCompany."RI_ID")  INNER JOIN "AMCAF2018APP"."dbo"."Inventory" Inventory ON vr_10630."InvtID" = Inventory."InvtID")
    LEFT OUTER JOIN "AMCAF2018APP"."dbo"."ItemSite" ItemSite ON vr_10630."InvtID" = ItemSite."InvtID" AND vr_10630."SiteID" = ItemSite."SiteID") 
	INNER JOIN "AMCAF2018APP"."dbo"."InventoryADG" InventoryADG ON Inventory."InvtID" = InventoryADG."InvtID"} WHERE (vr_10630.invtacct = '241101')
	and vr_10630.PerPost  <= '201804' AND RefNbr  ='EI00000315     ' --AND vr_10630.BATNBR  ='008482' 
	group by vr_10630."BatNbr", vr_10630."RefNbr",vr_10630."InvtID",vr_10630."PerPost",vr_10630."TranType"
	union all	
select 'GL',perpost,batnbr,REFNBR,acct,trantype,ROUND( sum(DRAmt)- sum(CrAmt),2) ,ROUND( sum(curyDRAmt)- sum(curyCrAmt)  ,2)
from gltran where acct like '241101%' and perpost  <='201804' and RefNbr   ='EI00000315     '-- AND GLTran .BatNbr  ='008482'
--and  module ='IN' --and batnbr ='003812'  --and
group by perpost,acct,batnbr,REFNBR,trantype























--ACTU_COST_TR '006808','I250442',3.68

--ACTU_COST_SI '011674','I250166', 16.50

--ACTU_COST_KIT '001521','21141',1.321830

--ACTU_COST_venta '032313','','I213438',1.321830












ACTU_COST_SI2 '015052','I250227', 0.6,'PORINVT'









011674
ai00000251
3.8036



@LOTE CHAR(6),        
@PRO CHAR(7),        
@COSTO NUMERIC (18,6)   ,    
@REFNBR VARCHAR(15)  
SELECT * FROM INTran WHERE BatNbr  ='003785' AND RefNbr  ='SALINICIAL' AND InvtID  ='I250443'














ACTU_COST_SI '009331','I801965', 2.88


ACTU_COST_SI2  '009141','I212225', 0.21145,'AI00000029'

 SP_HELPTEXT ACTU_COST_SI2
 
 CREATE PROCEDURE ACTU_COST_SI2        
--Funcion : Ajuste x Lote, Producto ,Refnbr    
--Sistema : Solomon IV    
--Usuario : Gasla Baudat Laisson     
--Fecha Mod : 07/11/2017    
@LOTE CHAR(6),        
@PRO CHAR(7),        
@COSTO NUMERIC (18,6)   ,    
@REFNBR VARCHAR(15)     
        
AS        
        
update intran set UnitPrice =@COSTO        
from intran where batnbr IN(@LOTE) AND invtid IN(@PRO) AND TRANTYPE ='aj'    AND RefNbr  IN (@REFNBR)     
update intran set  tranAmt= qty * UnitPrice ,ExtCost= qty * UnitPrice        
from intran where batnbr IN(@LOTE) AND invtid IN(@PRO)  AND TRANTYPE ='aj'  AND RefNbr  IN (@REFNBR)       
        
DECLARE @COSTOtOTAL NUMERIC (18,2)        
SET @COSTOtOTAL = ( SELECT sum((CASe when qty < 0 then tranAmt *-1 else tranAmt end )) from intran where batnbr IN(@LOTE) AND invtid IN(@PRO) AND TRANTYPE ='aj' AND RefNbr  IN (@REFNBR) )        
        
--SELECT @COSTOtOTAL        
        
update gltran set Cramt=(case when Cramt <>0 then @COSTOtOTAL else 0 end ),CuryCramt=(case when CuryCramt <>0 then @COSTOtOTAL else 0 end ),Dramt=(case when Dramt <>0 then @COSTOtOTAL else 0 end ),CuryDramt=(case when CuryDramt <>0 then @COSTOtOTAL else 0
  
    
      
      
 end )        
from gltran         
where batnbr  in(@LOTE)  and module ='IN' AND RefNbr IN (@REFNBR) AND   trandesc IN(SELECT TRANDESC from intran where batnbr IN(@LOTE) AND invtid IN(@PRO) AND TRANTYPE ='aj'  AND RefNbr  IN (@REFNBR) )        
  
  
 
--1.67

--ACTU_COST_KIT '037042','i210305',1.67

--sp_helptext ACTU_COST_SI2




















