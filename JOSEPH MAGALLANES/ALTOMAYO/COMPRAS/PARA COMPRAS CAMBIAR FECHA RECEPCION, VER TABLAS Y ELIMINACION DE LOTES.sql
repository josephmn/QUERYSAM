
--EXEC recargar_kardex

SELECT * 
-- DELETE
FROM PurchOrd WHERE PONbr = '000003'
SELECT * 
-- DELETE
FROM PurOrdDet WHERE PONbr = '000003'


SELECT * 
-- update PurchOrd set VendName = '3T CORPORATION S.A.', VendId = '20600128117' 
from PurchOrd where PONbr = '000189'
SELECT * from PurOrdDet where PONbr = '000189'
SELECT * FROM POReqHdr where ReqNbr = '000189'
SELECT * FROM POreqDet where ReqNbr = '000189'

-- DELETE from PurchOrd where PONbr = '000367'
-- DELETE from PurOrdDet where PONbr = '000367'
-- DELETE FROM POReqHdr where ReqNbr = '000367'
-- DELETE FROM POreqDet where ReqNbr = '000367'


--- PARA CAMBIAR LA GUIA MAL INGRESADA
SELECT User5, * 
-- UPDATE POReceipt SET USER5 = 'T001004446'
FROM POReceipt WHERE BatNbr = '011000'


SELECT RcptDate, User5, * 
-- UPDATE POReceipt SET USER5 = '001-049245'
-- UPDATE POReceipt SET RcptDate = '2020-05-13'
FROM POReceipt WHERE PONbr = '000189' AND User5 = '001-2608  '


select PONBR, * from aptran where PONBR = '000145'


select siteid, QTYONHAND, * from itemsite where invtid = '20628' and siteid = 'MARKETING '



SELECT STATUS, * 
-- UPDATE B SET STATUS = 'B'
FROM BATCH B WHERE BATNBR = '000145' AND MODULE = 'PO'


--------------------para cambiar la fecha de recepcion ---------------------- PARA TAMBIEN CAMBIAR EL ALMACEN POR ERROR




select Status, *  
-- UPDATE poreceipt SET RcptDAte = '2019-03-25'
-- UPDATE poreceipt SET PerClosed = '201906', PerEnt = '201906'
from poreceipt where batnbr ='019186'

select PC_Status, perpost, SITEID,*  
-- UPDATE POTRAN SET RcptDAte = '2019-03-25'
-- UPDATE POTRAN SET SITEID = 'LIMCEN'
-- UPDATE POTRAN SET PERPOST = '201906'
FROM POTRAN where batnbr ='019186'

select PerPost, Rlsed, * 
-- UPDATE INTran SET RcptDAte = '2019-03-25'
-- UPDATE INTRAN SET PERPOST = '201906'
from INTran where RcptNbr in (select rcptnbr from poreceipt where batnbr ='019186') AND TranType = 'RC'

select PerPost, Rlsed, Posted, * 
-- UPDATE GLTran set TranDate = '2019-03-25'
-- UPDATE GLTran set PERPOST = '201906'
FROM GLTran where refnbr in (select rcptnbr from poreceipt where batnbr ='019186')  and module ='PO'





-------------------------------se realizan el cambio solo a estas tablas--------------------------------------------
select perpost, Status,*  from batch where batnbr ='005160' and module  ='po'
select User5, * from poreceipt where batnbr ='005160'
select perpost, SiteId, *  
-- update POTRAN set siteid = 'LIMINSUMOS'
FROM POTRAN where batnbr ='005160'
select * from INTran where RcptNbr in (select rcptnbr from poreceipt where batnbr ='005160') AND TranType = 'RC'
select * FROM gltran where refnbr in (select rcptnbr from poreceipt where batnbr ='005160')  and module ='PO'
---------------------------------------------------------------------------

select * 
-- update poreceipt set user5 = '001-046928'
from poreceipt where batnbr ='013867'

select * from APDoc where PONbr = '001560'

/**** PARA SACAR EL LOTE NO LIBERADO ****/

--delete from poreceipt where batnbr ='004534'
--delete FROM POTRAN where batnbr ='004534'
--delete FROM gltran  where refnbr in (select rcptnbr from poreceipt where batnbr ='004534')  and module ='po'
--delete from batch where batnbr ='004534' and module  ='po'



/**************************************/

--ORDERNES DE COMPRAS MARKETING
-- 20554060812
-- 
SELECT VendId, * 
-- update po set VendId = '20554060812'
FROM PurchOrd po WHERE PONBR = '000145'









------------ primero validar recepcion--------

select perpost, Status,*  from batch where batnbr ='000599' and module  ='po'
select User5, * from poreceipt where batnbr ='000599'
select perpost, SiteId, *  
-- update POTRAN set siteid = 'LIMINSUMOS'
FROM POTRAN where batnbr ='000599'
select InvtID, TranDesc, * from INTran where RcptNbr in (select rcptnbr from poreceipt where batnbr ='000599') AND TranType = 'RC'
select * FROM gltran where refnbr in (select rcptnbr from poreceipt where batnbr ='000599')  and module ='PO'




--- eliminar lote segun batnbr de recepcion y OC----
/*
delete from batch where batnbr ='000600' and module  ='po'
delete from poreceipt where batnbr ='000600'
delete FROM POTRAN where batnbr ='000600'
delete from INTran where RcptNbr in (select rcptnbr from poreceipt where batnbr ='000600') AND TranType = 'RC'
delete FROM gltran where refnbr in (select rcptnbr from poreceipt where batnbr ='000600')  and module ='PO'


delete from PurchOrd where PONbr = '000087'
delete from PurOrdDet where PONbr = '000087'

*/








