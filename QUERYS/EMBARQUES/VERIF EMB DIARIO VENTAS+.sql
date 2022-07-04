

select  perpost,arbatnbr,invcnbr,user1,SHIPPERID,sotypeid,cancelled,nextFunctionClass, S4Future11,S4Future12,status,inbatnbr,perpost,PERCLOSED,nextFunctionClass,NextFunctionID,ShipRegisterID,*
from soshipheader nolock
--UPDATE soshipheader SET status='C',ShipRegisterID='',inbatnbr='',arbatnbr='',PERCLOSED='201606',nextFunctionClass='',NextFunctionID=''
where 
--shipperid in('BLI0000524')
--invcnbr in('B660108806')
invcnbr in (select invcnbr from soshipheader 
where cancelled =1 and arbatnbr ='' and ShipRegisterID='' and perpost ='201606' and invcnbr not in (select refnbr from ardoc) and invcnbr<>'')




select  invcnbr,user1,SHIPPERID,sotypeid,cancelled, status,inbatnbr,perpost,PERCLOSED,nextFunctionClass,NextFunctionID,ShipRegisterID,*
from soshipheader nolock
--UPDATE SOSHIPHEADER SET PERCLOSED='201502',status='C',cancelled=0,nextFunctionClass='',NextFunctionID=''--,ShipRegisterID='',perpost='201305',PERCLOSED='201305',arbatnbr='',inbatnbr ='',nextFunctionClass='',NextFunctionID=''
where  cancelled=1  and
--SHIPPERID in ('FCH0004346')
 inbatnbr=''  and sotypeid not like 'NC%' and status='O'



SELECT *   FROM SOSHIPHEADER  WHERE INVCNBR  ='B660118118'