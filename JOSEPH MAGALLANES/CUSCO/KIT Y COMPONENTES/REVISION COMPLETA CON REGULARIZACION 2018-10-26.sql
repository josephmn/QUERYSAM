
SELECT * FROM RptRuntime


/****** REG CON MI INTEGRIDAD VERSION 100000 *******/

----1.- REGULARIZAR ENSAMBLES
--EXEC InvtID_Costo_Reg '201910','CFCUSCO2'

--SELECT * FROM LoteCostoCUZCO10000
--SELECT * FROM LoteBuenoCUZCO10000
--select * from LotexREGCUZCO10000


--SELECT * FROM LoteEjecCUZCO10000 order by ejecutar -- > AQUI SOLO SE REGULARIZAN COSTO DE LOS COMPONENTES DE UN ENSAMBLE

----2.- REGULARIZAR LAS VENTAS (FACTURAS)
--EXEC Venta_REGCUZCO_Reg2018v '201811','CFCUSCO3'

--SELECT * FROM LoteVentaEjecCUZCO10000

----3.- REGULARIZAR LOS AJUSTES CON COSTOS ERRONEOS
--EXEC AJUSTES_Costo_Reg '201811','CFCUSCO1'

--SELECT * FROM LoteAJUSTECUZCO10000 where UnitPrice > 5.00

--SELECT * FROM LoteAJUSTEEjecCUZCO10000 -- > AQUI SOLO SE REGULARIZAN COSTO DE LOS PRODUCTOS POR LOS AJUSTES DE INVICTUS

----4.- CHETAR LAS CUENTAS PARA TERMINAR EL CIERRE EN 1 DIA Y ENTRAN TEMPRANO AL PUBGESITO
--EXEC ASP_REVISIONACCT_CUZCO '201811'

---- exec recargar_kardex
--/****** REG CON MI INTEGRIDAD VERSION 100000 *******/

--EXEC ACTU_COST_KIT '042410','I250170','46.9877'

--/************************ REVISAR LO QUE SE HA MIGRADO ***************************/

--select ExportadoEns,USER03, user07, PT_ALMACEN_QTY, NLU_NUMBER, PRICE1, P1_SALES_QTY, P1_SALES_TOTAL, * 
---- update CF_ResItem set ExportadoEns = '', USER03 = '0'
--from CF_ResItem where NumTienda = '44'  and  FechaNegocio = '12/05/2018'  and origen ='M' --and  ExportadoEns ='' --AND USER03=0 and  user07 =  '0' 

--/************************ REVISAR FORMULAS QUE SE VAN A ENSAMBLAR Y LIBERAR *****************************/
----I216830  

--select * from CF_StkEnsamb where NumTienda =  '44'  and  FechaNegocio =  '12/05/2018'  and CodProd in (select invtid from inventory where StkItem=1) --AND CodProd = 'I250007'
--AND CANTIDAD > CantDisp


/*********************************************************************************************/
--PARA REVISAR LAS FORMULAS (KIT)
--SOLOMON
SELECT * FROM Component WHERE KitId = 'I210115' ORDER BY CmpnentId ASC

--INVICTUS
SELECT KitId,CmpnentId COMPONENTE,CmpnentQty QTY, UNIDAD,LINENBR FROM (    
select         
 CmpnentId= (select 'I'+codigoproducto from SGRPAM2018.GEN.Producto where id = IdInsumo), CmpnentQty= cantidad,
 (  select top 1  abreviatura  from SGRPAM2018.GEN.UnidadMedida where id  =  IdUnidadMedida)UNIDAD ,    
 KitId=(select 'I'+codigoproducto from SGRPAM2018.GEN.Producto where id = idFormula),         
 LineNbr = CONVERT(INT,RIGHT(ID,5))    
from SGRPAM2018.VEN.FormulaProducto where idFormula in (select idproducto from SGRPAM2018.gen.localizacionproducto )        
AND ACTIVO = 1     
)X WHERE KITID = 'I295060' ORDER BY COMPONENTE ASC


-- REVISAR LOS LOTES
SELECT * FROM Batch WHERE BatNbr = '035243' and Module = 'IN'
SELECT * FROM INTran WHERE BatNbr = '035243'
SELECT * FROM GLTran WHERE BatNbr = '035243' AND Module = 'IN'


--DELETE FROM Batch WHERE BatNbr = '035243' and Module = 'IN'
--DELETE FROM INTran WHERE BatNbr = '035243'
--DELETE FROM GLTran WHERE BatNbr = '035243' AND Module = 'IN'

select * 
-- UPDATE INTRAN SET trandate = '2018-10-01'
from INTran where BatNbr = '035259'

select *
-- UPDATE GLTran SET trandate = '2018-10-01'
from GLTran where BatNbr = '035259' and Module = 'IN'

/************************ REVISAR LO QUE SE HA MIGRADO ***************************/


/**************************************** PARA REGULARIZAR COSTO (VENTAS, ENSAMBLES, TRANSFERENCIAS Y VENTAS) **********************************************/
--4.05
select  BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType, * 
from intran where invtid = 'I250051' AND PerPost = '201811' AND SiteID = 'CFCUSCO1' AND TranType = 'AS'

select TranDesc, Qty,CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef, *  
-- update t set DrAmt = 1, CuryDrAmt = 1
from GLTran t where batnbr = '034861' and TranDesc like '%TAMAL DE ALCACHOFA            %'-- and LineRef = '00035'
-- I250017
select  DISTINCT REFNBR
from intran where invtid = 'I211007' AND PerPost = '202001' AND SiteID = 'CFCUSCO2' AND TranType = 'AS'


SELECT InvtAcct, BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType, *  
-- update intran set unitprice = '0.61875', extcost = round(0.61875*qty,2), tranamt = round(0.61875*qty,2)
-- UPDATE INTRAN SET unitprice = '0.495', extcost = round(0.495*qty,2), tranamt = round(0.495*qty,2)
-- UPDATE INTRAN SET unitprice = '0.61875', tranamt = round(0.61875*qty,2)
FROM INTran WHERE BatNbr IN ('035069','035095') AND InvtID = 'I250111' --and TranType = 'CT' AND TranAmt = 123.75

SELECT acct, TranDesc, Qty,CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef, * 
-- UPDATE GLTRAN SET DrAmt = '1.15', CuryDrAmt = '1.15'
-- UPDATE GLTRAN SET DrAmt = 123.75, CuryDrAmt = 123.75
-- UPDATE GLTRAN SET CrAmt = 123.75, CuryCrAmt = 123.75
FROM GLTran WHERE RefNbr IN ('0570010638','0570010637') AND TranDesc = 'I250111' --AND QTY = 200 AND LineRef = '00002'

                       
SELECT BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType, *  
-- update intran set unitprice = '0.0271', extcost = round(0.0271*qty,2), tranamt = round(0.0271*qty,2)
-- update intran set unitprice = 0
FROM INTran WHERE BatNbr = '038853' AND InvtID = 'I300001'

select QtyOnHand, InvtID, SiteID, * from Location where InvtID = 'I200155'

--TRANSFERENCIA
--ACTU_COST_TR '035095','I250212',1.4035

--ACTU_COST_TR '038853','I300001',0.61875


                       
--AJUSTE
select  'EXEC ACTU_COST_SI '+''''+LTRIM(RTRIM(BatNbr))+''''+','+''''+LTRIM(RTRIM(InvtID))+''''+','+''''+'1'+'''', UnitPrice, BatNbr, PerPost, UnitPrice, * 
from intran A where invtid = 'I211688' AND PerPost = '202002' AND SiteID = 'CFCUSCO3' AND TranType = 'AJ' --AND BatNbr > '038762'
--and BatNbr > = '045382'  and BatNbr < = '046884'
ORDER BY A.BatNbr ASC
--AND BatNbr > '031981'

EXEC ACTU_COST_SI '002187','I211688','1'
EXEC ACTU_COST_SI '002436','I211688','1'
EXEC ACTU_COST_SI '003139','I211688','1'
EXEC ACTU_COST_SI '003267','I211688','1'
EXEC ACTU_COST_SI '003827','I211688','1'
EXEC ACTU_COST_SI '004297','I211688','1'
EXEC ACTU_COST_SI '005172','I211688','1'
EXEC ACTU_COST_SI '005590','I211688','1'

--ENSAMBLE
select  'EXEC ACTU_COST_KIT '+''''+LTRIM(RTRIM(BatNbr))+''''+','+''''+LTRIM(RTRIM(InvtID))+''''+','+'''1.781607'+'''', UnitPrice, BatNbr,* 
from intran A where invtid = '21090' AND PerPost = '202102' AND SiteID = 'CIXPROD' AND TranType = 'AS' 
--and BatNbr > = '045382' and BatNbr < = '046884'
ORDER BY A.BatNbr ASC
--EXEC ACTU_COST_KIT '027996','I280001', '4.9700'
--AND BatNbr > '031981'

--TRANSFERENCIA
SELECT 'EXEC ACTU_COST_TR '+''''+LTRIM(RTRIM(BatNbr))+''''+','+''''+LTRIM(RTRIM(InvtID))+''''+','+''''+'0.1'+'''', UnitPrice, RefNbr, * 
from intran where invtid = 'I259047' AND PerPost = '202001' AND SiteID = 'CFCENTRAL' AND TranType = 'TR'

SELECT 'EXEC ACTU_COST_TR '+''''+LTRIM(RTRIM(BatNbr))+''''+','+''''+LTRIM(RTRIM(InvtID))+''''+','+''''+'38.6'+'''', UnitPrice, RefNbr, * 
from intran where invtid = 'I250204' AND PerPost = '202001' AND SiteID = 'CFCUSCO2' AND TranType = 'CT' and Acct = '281101'


select RcptNbr, RefNbr, TrnsfrDocNbr, User5, * from TrnsfrDoc where RefNbr = '00000001'  
SELECT RcptNbr, BatNbr, * FROM INTran WHERE RcptNbr = '000478'

select RefNbr, BatNbr, * from INTran where BatNbr = '001362'


--VENTA
select  'EXEC ACTU_COST_VENTA '+''''+LTRIM(RTRIM(BatNbr))+''''+','+''''+LTRIM(RTRIM(RefNbr))+''''+','+''''+LTRIM(RTRIM(InvtID))+''''+','+CONVERT(VARCHAR(10),3.1763), * 
from intran where invtid = 'I211007' AND PerPost = '202001' AND SiteID = 'CFCUSCO1' AND TranType = 'IN'
AND BatNbr IN
(
'000945',
'001225',
'001361',
'001625',
'045328',
'045479',
'045627',
'045776',
'046933',
'047220',
'047343' 
)

--EXEC ACTU_COST_KIT '027996','I280001', '4.9700'


'000945',    	01262020       
'001225',    	01282020       
'001361',    	01292020       
'001625',    	01312020       
'045328',    	01012020       
'045479',    	01022020       
'045627',    	01032020       
'045776',    	01042020       
'046933',    	01132020       
'047220',    	01152020       
'047343'    	01162020       


--SELECT InvtAcct, BatNbr, RefNbr, RcptDate, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType, * 
---- DELETE
--FROM INTran WHERE BatNbr = '029987' AND InvtID = 'I250340' AND SiteID = 'CFCUSCO3'

--SELECT acct, PerPost, TranDesc, Qty,CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef, * 
---- DELETE
--FROM GLTran WHERE BatNbr = '029987' AND TranDesc = 'EMPANADA DE CARNE TERMINADO   ' AND LineRef IN ('00153','00154')

        






      
        
        

--VENTA
--ACTU_COST_VENTA '028083','08082018','I210133', 3.473333
--I213433   
DECLARE @PERPOST CHAR(6)
DECLARE @INvtId char(7)
DECLARE @siteid char(8)

SET @PERPOST = '202001'
SET @siteid = 'CFCUSCO3'
SET @INvtId = 'I211688'

select  'EXEC ACTU_COST_VENTA '+''''+LTRIM(RTRIM(i.BatNbr))+''''+','+''''+LTRIM(RTRIM(i.RefNbr))+''''+','+''''+LTRIM(RTRIM(i.InvtID))+''''+','+ CAST(a.unitprice AS char(10)), ExtCost, BatNbr, RefNbr, * 
from intran I INNER JOIN 
(select invtid, QTY, unitprice, Trandate from intran A where invtid = @INvtId AND PerPost = @PERPOST AND SiteID = @siteid AND TRANTYPE = 'AS') A ON I.invtid = A.invtid and I.QTY = A.QTY and I.Trandate = A.Trandate
where i.invtid = @INvtId AND i.PerPost = @PERPOST AND i.SiteID = @siteid AND i.TRANTYPE = 'IN'

--DELETE from Batch where BatNbr =  '046047' AND Module = 'IN'
--DELETE from intran where BatNbr = '046047'
--DELETE from GLTran where BatNbr = '046047' and Module = 'IN'

--I250029                                                      
--EXEC ACTU_COST_VENTA '003271','01232019','I211037',1.15         
       
/**************************************** PARA REGULARIZAR COSTO (VENTAS, ENSAMBLES, TRANSFERENCIAS Y VENTAS) **********************************************/
        
        
  

DECLARE @PERPOST CHAR(6)
DECLARE @INvtId char(7)
DECLARE @siteid char(8)

SET @PERPOST = '202001'
SET @siteid = 'CFCUSCO1'
--SET @INvtId = 'I280003'

select  'EXEC ACTU_COST_VENTA '+''''+LTRIM(RTRIM(i.BatNbr))+''''+','+''''+LTRIM(RTRIM(i.RefNbr))+''''+','+''''+LTRIM(RTRIM(i.InvtID))+''''+','+ CAST(a.unitprice AS char(10)), ExtCost, BatNbr, RefNbr, * 
from intran I INNER JOIN 
(select invtid, QTY, unitprice, Trandate from intran A where invtid IN (
'I210105',
'I210114',
'I210115',
'I210116',
'I210117',
'I210129',
'I210132',
'I210133',
'I213093'
) AND PerPost = @PERPOST AND SiteID = @siteid AND TRANTYPE = 'AS') A ON I.invtid = A.invtid and I.QTY = A.QTY and I.Trandate = A.Trandate
where i.invtid IN (
'I210105',
'I210114',
'I210115',
'I210116',
'I210117',
'I210129',
'I210132',
'I210133',
'I213093'
) AND i.PerPost = @PERPOST AND i.SiteID = @siteid AND i.TRANTYPE = 'IN'



select  'EXEC ACTU_COST_SI '+''''+LTRIM(RTRIM(BatNbr))+''''+','+''''+LTRIM(RTRIM(InvtID))+''''+','+''''+'0.01'+'''', UnitPrice, BatNbr, PerPost, UnitPrice, SiteID, * 
from intran A where invtid = 'I211688' AND PerPost = '202001' --AND RefNbr = 'SALDOINICI' --AND SiteID = 'CFCUSCO1' 
AND TranType = 'AS' --AND BatNbr > '038762'
ORDER BY A.BatNbr ASC

        

--AJUSTE
--I213433   
DECLARE @XPERPOST CHAR(6)
DECLARE @XINvtId char(7)
DECLARE @Xsiteid char(8)

SET @XPERPOST = '202003'
SET @Xsiteid = 'CFCUSCO3'
SET @XINvtId = 'I211688'

select  'EXEC ACTU_COST_SI '+''''+LTRIM(RTRIM(i.BatNbr))+''''+','+''''+LTRIM(RTRIM(i.InvtID))+''''+','+ CAST(B.unitprice AS char(10)), TranType, B.UnitPrice, * 
from intran I INNER JOIN 
(select invtid, QTY, unitprice, Trandate 
from intran A 
where invtid = @XINvtId AND PerPost = @XPERPOST AND SiteID = @Xsiteid AND TRANTYPE = 'AS') B ON I.invtid = B.invtid and I.Trandate = B.Trandate --
--and I.QTY = B.QTY 
where i.invtid = @XINvtId AND i.PerPost = @XPERPOST AND i.SiteID = @Xsiteid AND i.TRANTYPE = 'AJ'




--AJUSTE CON TRA VENTAS
DECLARE @XPERPOST CHAR(6)
DECLARE @XINvtId char(7)
DECLARE @Xsiteid char(8)

SET @XPERPOST = '202003'
SET @Xsiteid = 'CFCUSCO3'
SET @XINvtId = 'I211688'

select  'EXEC ACTU_COST_SI '+''''+LTRIM(RTRIM(i.BatNbr))+''''+','+''''+LTRIM(RTRIM(i.InvtID))+''''+','+ CAST(B.unitprice AS char(10)), TranType, B.UnitPrice, * 
from intran I INNER JOIN 
(select invtid, QTY, unitprice, Trandate 
from intran A 
where invtid = @XINvtId AND PerPost = @XPERPOST AND SiteID = @Xsiteid AND TRANTYPE = 'CG') B ON I.invtid = B.invtid and I.Trandate = B.Trandate --
--and I.QTY = B.QTY 
where i.invtid = @XINvtId AND i.PerPost = @XPERPOST AND i.SiteID = @Xsiteid AND i.TRANTYPE = 'AJ'



select InvtAcct, BatNbr, RefNbr, RcptDate, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType, * 
from INTran where BatNbr = '042067' and InvtID = 'I250219'
select acct, PerPost, TranDesc, Qty,CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef, * 
from GLTran where RefNbr in (select RcptNbr from INTran where BatNbr = '042067') and Module = 'PO' and TranDesc = 'I250219'

-- exec recargar_kardex
        


--SELECT InvtAcct, BatNbr, RefNbr, RcptNbr, InvtID, TranDesc, * FROM INTran WHERE BatNbr = '041071' and InvtID = 'I250284'
--select * from GLTran where BatNbr = '041071' and TranDesc = 'I250284'
--select * from APDoc where PONbr = '001531'



--select * from APDoc where BatNbr = '004781'
--select * from APTran where BatNbr = '004781'
--select * from GLTran where BatNbr = '004781' and Module = 'AP'
/*
SELECT * FROM INTran WHERE BatNbr = '039098' AND InvtID = 'I213439'

SELECT * FROM GLTran WHERE BatNbr = '039098' AND TranDesc = 'TRES JAMONES                  '

EXEC ACTU_COST_KIT '039098','I213439', '4.05'

select  BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType, * 
from intran where BatNbr = '039098' AND PerPost = '201811' AND SiteID = 'CFCUSCO2' AND TranType = 'AS'

select TranDesc, Qty,CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef, *  
-- update t set DrAmt = 1, CuryDrAmt = 1
from GLTran t where batnbr = '039098' --and TranDesc like '%TAMAL DE ALCACHOFA            %'-- and LineRef = '00035'

*/

--PARA LAS TRANSFERENCIAS

SELECT BatNbr, RefNbr, PerPost, InvtAcct, InvtID, TranDesc, Qty, UnitPrice, TranAmt, RcptNbr, TranType, LineNbr, LineRef,* FROM INTRAN WHERE BatNbr = '004158' --and InvtID = 'I250219'
SELECT BatNbr, RefNbr, PerPost, Acct, TranDesc, CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, LineNbr, LineRef,* FROM GLTran WHERE BatNbr = '004158' --and TranDesc = 'PULLPA DE LÚCUMA              '

select * from TrnsfrDoc where TrnsfrDocNbr = '000493'

SELECT BatNbr, RefNbr, PerPost, InvtAcct, InvtID, TranDesc, Qty, TranAmt, UnitPrice, RcptNbr, TranType, Rlsed, LineNbr, LineRef, * 
-- update a set perpost = '202002'
FROM INTran a WHERE BatNbr = '004155' --and InvtID = 'I250219'
SELECT BatNbr, RefNbr, PerPost, Acct, TranDesc, CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, Posted, LineNbr, LineRef, * 
-- update a set perpost = '202002'
FROM GLTran A WHERE BatNbr = '004155' AND Module = 'IN' --and TranDesc = 'I250219'


