--------------------------------------------------------------
--ACTUALIZAR MONTOS ORDEN COMPRA
----------------------------------------------------------------
/*
select status,* from  PurchOrd where ponbr ='000445'

select * FROM  PurOrdDet where ponbr ='000445'



2 dos unidades    costo   3.7288  
sub total 7.4576   
total   8.80 
 

select * 
--update  P set curypoamt =8.8  , poamt  =8.8 , curyrcpttotamt = 7.4576  , rcpttotamt  = 7.4576 
FROM PurchOrd P WHERE PONBR ='000445'


select *  
--UPDATE  D SET costreceived  =7.4576 ,curycostreceived =7.4576   , curyextcost  =8.8  ,curyunitcost =3.7288 ,extcost =8.8 , qtyord =2.00 ,qtyrcvd =2.00 ,unitcost =3.7288
from PurOrdDet d where ponbr ='000445'

----------------------------------------------------------------

select status,vendid,vendname,poamt,* from  PurchOrd where ponbr ='000685' 

select status,vendid,vendname,poamt,* from  PurchOrd where ponbr ='000725' 



select * FROM  PurOrdDet where ponbr ='000691'


UPDATE PURCHORD   SET VENDID ='20450752496' ,VENDNAME ='F & J LA CANASTA SOC.COM.RESPO' WHERE PONBR = '000685'


SELECT NAME,*  FROM VENDOR WHERE VENDID  ='20450752496'



