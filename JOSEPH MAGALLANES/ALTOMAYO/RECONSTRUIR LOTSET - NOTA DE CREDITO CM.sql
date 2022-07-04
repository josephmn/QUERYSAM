
--CONSULTA EN TABLAS "NOTA DE CREDITO (CM)"

select qty,*
-- UPDATE LotSerT SET LotSerNbr='0213201802'
from LotSerT   where  (RefNbr IN ('RF015167'))  and   InvtID IN ('21767','21075','21731')

select  InvtID,*  from LotSerTSL where ShipperId    IN('NCLI000377') AND  InvtID IN ('21767','21075','21731')

SELECT * FROM LotSerT WHERE BatNbr = '001313'

SELECT BatNbr, InvtID, LineID, LineNbr, RefNbr, SiteId, qty, TranType, * FROM INTRAN WHERE (RefNbr IN ('RF015167'))


--REFERENCIA
select qty,*
-- UPDATE LotSerT SET LotSerNbr='0213201802'
from LotSerT   where  (RefNbr IN ('F060000005'))  and   InvtID IN ('21725')  
select  InvtID,*  from LotSerTSL where ShipperId    IN('NCLI000378') AND  InvtID IN ('21725')


--SELECT * FROM LotSerTSL WHERE SiteId = 'limcen' AND MONTH(FECHA) = 2 AND InvtId = '21725'   

--NCLI000378


--INSERT RECONSTRUIR LOTSET
/*

INSERT INTO LotSerT (BatNbr, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, CustID, ExpDate, INTranLineID, INTranLineRef, InvtID, InvtMult, KitID, LineNbr, LotSerNbr, 
LotSerRef, LUpd_DateTime, LUpd_Prog, LUpd_User, MfgrLotSerNbr, NoteID, ParInvtID, ParLotSerNbr, Qty, RcptNbr, RecordID, RefNbr, Rlsed, S4Future01, S4Future02, 
S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, ShipContCode, ShipmentNbr, SiteID, ToSiteID, 
ToWhseLoc, TranDate, TranSrc, TranTime, TranType, UnitCost, UnitPrice, User1, User2, User3, User4, User5, User6, User7, User8, WarrantyDate, WhseLoc)

SELECT '001313', CpnyID, '2018-02-14', Crtd_Prog, Crtd_User, CustID, '2018-02-14', '3', '00003', '21731', InvtMult, KitID, '3', LotSerNbr, 
LotSerRef, '2018-02-14', LUpd_Prog, LUpd_User, MfgrLotSerNbr, NoteID, ParInvtID, ParLotSerNbr, '720', RcptNbr, RecordID, 'RF015167', Rlsed, S4Future01, S4Future02, 
S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, ShipContCode, ShipmentNbr, 'LIMCEN', ToSiteID, 
ToWhseLoc, '2018-02-14', TranSrc, TranTime, TranType, '11.38', UnitPrice, User1, User2, User3, User4, User5, User6, User7, User8, '2018-02-14', WhseLoc 
FROM LotSerT   where  (RefNbr IN ('F060000005'))  and   InvtID IN ('21725')  

*/
