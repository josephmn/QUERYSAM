
declare @batnbr char(6), @InvtID char(5), @periodo char(6), @cantidad int, @costo float, @fecha smalldatetime
set @batnbr = '006345' --- ingresar el lote
set @InvtID = '24006' --- ingresar el producto
set @periodo = '202006' --- ingresar periodo
set @cantidad = 10350 -- ingresar cantidad a cambiar correcta
set @costo = (select CuryUnitCost from POTRAN where batnbr = @batnbr) --extraer el costo unitario del producto
set @fecha = CONVERT(VARCHAR(20), GETDATE(), 112) --- colocar la fecha

/*
UPDATE B SET perpost = @periodo, CrTot = (@costo * @cantidad),	CtrlTot = (@costo * @cantidad),	
CuryCrTot = (@costo * @cantidad), CuryCtrlTot = (@costo * @cantidad), CuryDrTot = @cantidad, DrTot = @cantidad, CuryEffDate = @fecha
from batch B where batnbr = @batnbr and module = 'PO'

UPDATE RT SET RcptDate = @fecha , CuryEffDate = @fecha, CuryRcptAmtTot = (@costo * @cantidad), CuryRcptCtrlAmt = (@costo * @cantidad), 
RcptAmtTot = (@costo * @cantidad), RcptCtrlAmt = (@costo * @cantidad), RcptCtrlQty = @cantidad, RcptQtyTot = @cantidad
from poreceipt RT where batnbr = @batnbr

UPDATE PO SET perpost = @periodo, RcptDate = @fecha, CuryExtCost = (@costo * @cantidad), ExtCost = (@costo * @cantidad), QTY = @cantidad, RCPTQTY = @cantidad
FROM POTRAN PO where batnbr = @batnbr

--UPDATE G SET PerPost = '201805', TranDate = '2018-05-31', AppliedDate = '2018-05-31', CuryDrAmt = '2798', DrAmt = '2798'
--FROM gltran G where refnbr in (select rcptnbr from poreceipt where batnbr ='005225')  and module ='po' and acct = '201101'

--UPDATE G SET PerPost = '201805', TranDate = '2018-05-31', AppliedDate = '2018-05-31', CrAmt = '2798', CuryCrAmt = '2798'
--FROM gltran G where refnbr in (select rcptnbr from poreceipt where batnbr ='005225')  and module ='po' and acct = '614202'

UPDATE u  SET  TranDate = @fecha, RcptDate = @fecha, PERPOST = @periodo, TranAmt = (@costo * @cantidad), ExtCost = (@costo * @cantidad)
FROM INTRAN u WHERE BatNbr =  @batnbr

*/

select perpost, Status, CrTot, CtrlTot, CuryCrTot, CuryCtrlTot, CuryDrTot, DrTot, CuryEffDate, * from batch B where batnbr = @batnbr and module  ='po'

select RcptDate, CuryEffDate, CuryRcptAmtTot, CuryRcptCtrlAmt, RcptAmtTot, RcptCtrlAmt, RcptCtrlQty, RcptQtyTot, * from poreceipt RT where batnbr = @batnbr

select perpost, RcptDate, CuryExtCost, ExtCost, Qty, RCPTQTY, * FROM POTRAN PO where batnbr = @batnbr

--select PerPost, TranDate , * FROM gltran G where refnbr in (select rcptnbr from poreceipt where batnbr = @batnbr)  and module ='po' and acct = '201101'
select PerPost, TranDate , * FROM gltran G where refnbr in (select rcptnbr from poreceipt where batnbr = @batnbr)  and module ='po' --and acct = '614202'

SELECT  TranDate , RcptDate, * FROM INTRAN u WHERE BatNbr =  @batnbr

------------------------------------
---- esto cambiar al ultimo
------------------------------------

select OrigQty, QtyOnHand ,* 
-- update x set OrigQty = '200', QtyOnHand = '200'
from LotSerMst x where InvtID = @InvtID --and LotSerNbr = '06012018006'

select QTY, * 
-- UPDATE T SET QTY = '200'
FROM LotSerT T WHERE InvtID = @InvtID and SiteID = 'MARKETING' AND BatNbr = @batnbr

/*
UPDATE LOCATION 
SET qtyonhand = (select qtyonhand from itemsite where invtid = location.invtid and siteid=location.siteid)
where   whseloc='BUENESTADO' AND round(qtyonhand,1) <> round((select qtyonhand from itemsite where invtid = location.invtid and siteid=location.siteid),1)

----- cambio para el qtyonhand y qtyavail y costo (solo cuando se equivoque)

select QtyAvail, QtyOnHand, TotCost, * 
-- UPDATE T SET QtyAvail = '325', QtyOnHand = '325', TotCost = (325 * 13.99)
from itemsite T where InvtID = '20639'

*/

/*******/
---- HABILITAR PARA SEGUIR RECIBIR MAS STOCK

-- UPDATE PurchOrd SET Status = 'O' WHERE PONbr = '000116' and POType = 'OR'

select * from PurchOrd where Ponbr = '000116'
select * 
-- update pd set QtyRcvd = '121854', RcptStage = 'P'
from PurOrdDet pd where Ponbr = '000116'


/*******/ --PV DEL SOLOMON

--RegularPO_Cpnyid_PONbr



Create Proc RegularPO_Cpnyid_PONbr 
    @CpnyID varchar ( 10), 
    @PONbr varchar(10) 
as

Select Status, * from PurchOrd 
   Where CpnyID = 'ALTOMAYO' and PONbr LIKE '000116' and POType = 'OR' and Status IN ('P','O') 
   Order by PONbr 


 EXEC  POReceipt_PONbr '000098' 

 EXEC Purorddet_POnbr '000098', -32768, 32767 

EXEC POReceipt_PONbr '000116'
EXEC POReceipt_PONbr '000116' 
EXEC Purorddet_POnbr '000116', -32768, 32767 
EXEC Purorddet_POnbr '000116', -32768, 32767 
EXEC Terms_All '05' 
EXEC Terms_All '05'
EXEC RegularPO_Cpnyid_PONbr  'ALTOMAYO',  '000116' 
EXEC RegularPO_Cpnyid_PONbr  'ALTOMAYO',  '000116'


select * from purorddet where PONbr=  '000116'  and linenbr=  1 



/****** Object:  Stored Procedure dbo.POReceipt_PONbr    Script Date: 4/16/98 7:50:26 PM ******/
Create Procedure POReceipt_PONbr 
@parm1 varchar ( 10) 
As

Select Rlsed, * From POReceipt 
Where POReceipt.PONbr = '000116' And POReceipt.Rlsed = 0
Order By POReceipt.PONbr, POReceipt.RcptNbr 


-- Copyright 1998, 1999 by Solomon Software, Inc. All rights reserved.

select * from purorddet where PONbr= '000116'
