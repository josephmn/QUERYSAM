


exec Dbnav_xAMDespEmbD_1 'LIMCEN','S000000929'



SELECT * FROM ARDOC

sp_helptext Dbnav_xAMDespEmbD_1

CREATE Proc Dbnav_xAMDespEmbD_1  
 @Parm1  varchar(10),  
 @Parm2  varchar(10)  
As  
 Select *  
 FROM           
 dbo.xAMDespEmbD_1  
 WHERE   
 (SiteIDD =@Parm1) And  
 (NroDespachoD =  @Parm2)   
 Order By  
 InvcNbr,InvcDate,SlsperID,CustID


use [AM2015APP]
GO
select * from dbo.xamdespembd_1 where siteidd LIKE '%LIMPT' and shipperid='FLI0001691'



select * from dbo.xamdespembd where shipperid='FLI0001667'

sp_helptext pv_xamgrupodesp

select * from xamgrupodesp

select * from dbo.xamdespembd_1 where  shipperid='FLI0001667'


sp_helptext ARDoc_CpnyID_Rlsed3


select * from ardoc where refnbr like '%160063443%'


USE [AM2015APP]
GO


ARDEBUG '005857'


LIBERARAR '005857'





SELECT STATUS,* FROM BATCH WHERE BATNBR='005857'

SELECT RLSED,* FROM ARDOC WHERE BATNBR='005857'

SELECT RLSED,* FROM ARTRAN WHERE BATNBR='005857'

SELECT RLSED,* FROM GLTRAN WHERE BATNBR='005857'












