
use am2015sysag
go



/*

select * from am2015appag.ResumenAprobacionLIG

select * from AppPH2015Jul.ResumenAprobacionLIG


sp_helptext ResumenAprobacionLIG

 sp_helptext prptcontrol1  'AP053'



Select * from RptControl   
Where RptControl.ReportNbr like 'AP053'   
Order by ReportNbr   

       Select * from Screen  
           where Screen.Number LIKE 'AP05300'  
           order by Number   

sp_helptext 'Screen_Number' 'AP05300'


 Screen_Number 'AP05300'


insert into screen (module,name,number,screentype)
values ('GA','Res. Liq. de Gastos','AP05300','R')



SP_HELPTEXT 'template_all_roi'      'AP053',  'SYSADMIN',  '%' 

       Select AvailableToPublic, Descr, levelnbr, LowerLevels, RecType, ScrnNbr, TemplateId, UserId from Template  
           where Template.ScrnNbr like 'AP053'  
                and (Template.UserId like 'SYSADMIN' or Template.UserId = ' ')  
                and Template.TemplateId like '%'  
                order by ScrnNbr,UserId,TemplateId,RecType  


SELECT * FROM TEMPLATE



Select COUNT ( DISTINCT InternetAddress ) From Access where ScrnNbr LIKE '%%' AND ScrnNbr <> 'MENU' AND ScrnNbr <> '96010' AND ScrnNbr <> '40400' AND ScrnNbr NOT LIKE 'RDT%' AND UserId <> 'MasterAccess' AND InternetAddress <> 'AMDES1RDP-Tcp#144' AND ScrnNbr NOT LIKE 'TM%%%' AND ScrnNbr NOT LIKE 'PP%%%'



UserAccess 'SYSADMIN','AM2015APPAG','AMDES1RDP-Tcp#144',33

       Select * from Access  
           WHERE Access.UserId          like 'SYSADMIN'  
             AND Access.DatabaseName    like 'AM2015APPAG'  
             AND Access.InternetAddress like 'AMDES1RDP-Tcp#144'  
             AND Access.SessionCntr     =    34   





AP053
APL01


use [amcaf2015app]
go

000193


SELECT perpost,status,rlsed,* FROM BATCH WHERE batnbr ='009191' and MODULE  ='PO'
SELECT rlsed,* FROM PORECEIPT where   batnbr = '009191'-- where rcptdate  ='2015-09-29'
SELECT *  FROM POTRAN where batnbr ='009191' --and  rcptnbr ='000029'
select rlsed,posted,* from gltran  where batnbr ='006263' and module ='PO'--AND where refnbr ='000029' and MODULE  ='PO'
009191    

SELECT *  FROM POTRAN where batnbr ='006263' and  rcptnbr ='000193'
SELECT *  FROM POTRAN where rcptnbr ='000193'

009191    


UPDATE BATCH SET CURYDRTOT  = 41 , DRTOT = 41  WHERE BATNBR  ='017364' AND MODULE  ='PO'
UPDATE PORECEIPT SET RCPTCTRLQTY  = 41  ,RCPTQTY = 41 WHERE BATNBR  ='017364'




015275
-------------------------------se realizan el cambio solo a estas tablas--------------------------------------------
select perpost,*  from batch where batnbr ='005570' and module  ='po'
select *  from poreceipt where batnbr ='005570'
select perpost,*  FROM POTRAN where batnbr ='005570'
select *  FROM gltran  where refnbr in (select rcptnbr from poreceipt where batnbr ='005570')  and module ='po'
---------------------------------------------------------------------------


select *  FROM intran where batnbr ='015275'
25,239.01 
*/
  1692
select * from intran where perpost ='201612' and tranamt =1692


20161200	000371POA	M0001	913101
20161200	000371POA	M0002	614202


select * from POReceipt  where CuryRcptAmt  =1692


select *  from poreceipt where rcptnbr  ='000193'

select status,* from  PurchOrd where ponbr ='001452'
SELECT * FROM  PurOrdDet where ponbr ='001452'

USE [AMCAF2016app]
GO
/*
delete from purchord where ponbr ='000361'
delete from PurOrdDet where ponbr ='000361'
*/


select status,* from  PurchOrd where lastrcptdate  ='2016-03-05'

select status,* from  PurchOrd where ponbr ='000196'
SELECT * FROM  PurOrdDet where ponbr ='000196'

update PurchOrd set status ='O', openpo=1 where ponbr ='000361'
select distinct status from purchord

SELECT rlsed,* FROM PORECEIPT where PONBR  ='000041'

select status,* from  PurchOrd where ponbr ='000813'
SELECT * FROM  PurOrdDet where ponbr ='000085'

SELECT PONBR,InvtID,COUNT(InvtID) FROM  PurOrdDet 
GROUP BY PONBR,InvtID HAVING COUNT(InvtID) >1


/*
                   
select * from PurchOrd where ponbr ='001484'

update purchord set status  ='O' WHERE ponbr ='000120'


update purchord set vendid = '20600116941' , vendname ='CSS ALIMENTOS DEL PERU SAC' where ponbr = '001484' 


select vendid,name,* from vendor where vendid ='20600116941'
017364
017363
---------------------------------------------------------------------------
select *  from batch where batnbr ='017364' and module  ='po'
select *  from poreceipt where batnbr ='017364'
select *  FROM POTRAN where batnbr ='017364'
select *  FROM gltran  where refnbr in (select rcptnbr from poreceipt where batnbr ='017364')  and module ='po'
---------------------------------------------------------------------------
UNITCOST
CURYUNITCOST


QTY
FORMULA  :  UNTI  *  QTY
EXTCOST
COSTVOUCHER
CURYCOSTVOUCHER
CURYEXTCOST
BATCH : DRTOT , CURYDRTOT

UPDATE  BATCH SET STATUS  ='P' WHERE BATNBR  ='' AND MODULE  =''

*/
UPDATE BATCH SET CURYDRTOT  = 14 , DRTOT  = 14 WHERE BATNBR  ='017364' AND MODULE  ='PO'
UPDATE poreceipt SET RcptCtrlQty  = 14 , RcptQtyTot = 14 WHERE BatNbr  ='017364'

UPDATE POTran SET CuryUnitCost  = 6 , UnitCost  = 6  WHERE BatNbr  ='017364' AND LineNbr  ='000003'

*/

UPDATE POTran SET CuryUnitCost  = 26 ,UnitCost  = 26  WHERE BatNbr  ='017364' AND LineRef  ='00002'

UPDATE poreceipt SET RcptQtyTot = 41 WHERE BatNbr  ='017364'


select *  from batch where batnbr ='019083' and module  ='po'
select *  from poreceipt where ponbr  ='000120'
select *  FROM POTRAN where batnbr ='019083'
select *  FROM gltran  where refnbr in (select rcptnbr from poreceipt where batnbr ='019083')  and module ='po'



select *  from batch where batnbr ='000371' and module  ='po'
select *  from poreceipt where batnbr  ='000371'
select *  FROM POTRAN where batnbr ='000371'
select *  FROM gltran  where refnbr in (select rcptnbr from poreceipt where batnbr ='000371')  and module ='po'





select *  from POReceipt where PONbr  ='000371'



update batch set CuryEffDate = '2016-12-30', Crtd_DateTime ='2016-12-30' where BatNbr  ='000371' and Module ='PO'



select * from potran where rcptnbr  ='000371'

select * from intran where batnbr ='007724'
000841
---------CORREGIR FECHA RECEPCIONES 
008098        
*/
declare @lote  varchar(6)
declare @fecha datetime
set @lote  ='009248'
set @fecha ='2016-07-30'
UPDATE poreceipt set CuryEffDate  = @fecha , RcptDate = @fecha where batnbr  = @lote
update POTRAN set RcptDate = @fecha ,TranDate = @fecha ,user7  = @fecha where  batnbr  = @lote
update gltran set trandate  = @fecha , AppliedDate  = @fecha where refnbr in (select rcptnbr from poreceipt where batnbr =@lote)  and module ='po'
update intran set RcptDate = @fecha  where batnbr  =@lote


select * from poreceipt where  rcptnbr ='000841'










RcptDate
2016-07-04 00:00:00
AppliedDate
2016-06-30 00:00:00
2016-06-30 00:00:00
RcptDate
2016-06-30 00:00:00

TranDate
2016-06-30 00:00:00











select *  FROM POTRAN where rcptnbr ='000156'

sp_helptext 

000156POA
000156POA
000157POA
000157POA
000157POA
000157POA
000158POA
000158POA
000167POA
000167POA
000167POA
000167POA








update batch set crtot=855.99,ctrltot=855.99,curycrtot=855.99,curyctrltot=855.99
 from batch where batnbr ='003708' and module ='po'

update poreceipt set curyrcptamttot = 855.99, curyrcptctrlamt =855.99 , rcptamttot = 855.99, rcptctrlamt =855.99
 where batnbr  = '003708'


update  potran set vendid ='20564347982' where batnbr ='012070' --and invtid ='I250009'
update  potran set curyextcost = round(0.0572 * 9000,4) ,extcost  = round(0.0572 * 9000,4)
 where batnbr ='003708' and invtid ='I250009'


update gltran set id ='20564347982' where refnbr in (select rcptnbr from poreceipt where batnbr ='012070') 
 and module ='po' -- and linenbr =-32765

update gltran set cramt = 514.8 , curycramt  =514.8 where refnbr in (select rcptnbr from poreceipt where batnbr ='003708') 
 and module ='po' and linenbr =-32764


update poreceipt set perent ='201509', perclosed = '201509' where batnbr ='000365'
update potran set perent ='201509', perpost = '201509' where batnbr ='000365'






LotSerT_All 'ALTOMAYO', '000020', '000011', '%', '%'
sp_helptext POTran_All

select module ,* from batch
sp_helptext LotSerT_All

select* from podoc


POAlloc_All 'ALTOMAYO', '000009', '%', '%'

sp_helptext POAlloc_All


select*  from poalloc

sp_helptext poalloc

LotSerT_All 'ALTOMAYO', '000018', '000010', '%', '%'
POAlloc_All 'ALTOMAYO', '000029', '%', '%' 
sp_helptext POAlloc_All
  
 sp_helptext purorddet_ponbr  '000029', -32768,32767

    Select * from PurOrdDet where PONbr = '000029' 

select*  from gltran where module ='po'
purchord_cpnyid_ordnbr_d 'ALTOMAYO', '000279' 

sp_helptext purchord_cpnyid_ordnbr_d


select * from  PurchOrd  where ponbr ='000522'

select * from  PurOrdDet where ponbr ='000522'
--
--delete from  PurchOrd  where ponbr ='000427'
--
--delete from  PurOrdDet  where ponbr ='000302'













