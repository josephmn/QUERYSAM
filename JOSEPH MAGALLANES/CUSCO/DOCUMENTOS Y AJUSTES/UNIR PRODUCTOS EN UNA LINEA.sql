
declare @SubTOTAL float
declare @Total float
declare @CANTIDA float
declare @ORDEN char(6)
declare @PRODUCTO char(7)
declare @costoUnit float

set @ORDEN = '001025'
set @PRODUCTO = 'I250182'

set @SubTOTAL = (select sum(CostReceived) CostReceived from PurOrdDet where InvtID = @PRODUCTO and ponbr = @ORDEN)
set @Total = (((select sum(CostReceived) CostReceived from PurOrdDet where InvtID = @PRODUCTO and ponbr = @ORDEN))*1.18)
set @CANTIDA = (select sum(QtyOrd) QtyOrd from PurOrdDet where InvtID = @PRODUCTO and ponbr = @ORDEN)
set @costoUnit = round(((select sum(CostReceived) CostReceived from PurOrdDet where InvtID = @PRODUCTO and ponbr = @ORDEN)/(select sum(QtyOrd) QtyOrd from PurOrdDet where InvtID = @PRODUCTO and ponbr = @ORDEN)),4)

--print @costoUnit

-- SELECT * FROM PurchOrd where ponbr = @ORDEN
-- SELECT CostReceived, CuryCostReceived, CuryExtCost, ExtCost, QtyOrd, QtyRcvd, CuryUnitCost, UnitCost, @SubTOTAL, @Total, @CANTIDA, @costoUnit, InvtID, PurchUnit, TranDesc,* 
SELECT 
QtyOrd, QtyRcvd, CuryUnitCost, UnitCost, --cantidad, cantidadrecibida, costounitario,costo unit
CostReceived, CuryCostReceived, --montos bases
CuryExtCost, ExtCost, --costos + IGV
InvtID, PurchUnit, TranDesc, LineID, * 
-- delete   
-- 
-- update p set CostReceived = @SubTOTAL, CuryCostReceived = @SubTOTAL, QtyOrd = @CANTIDA, QtyRcvd = @CANTIDA, CuryUnitCost = @costoUnit, UnitCost = @costoUnit, CuryExtCost = @Total, ExtCost = @Total
-- update p set QtyOrd = 10030, QtyRcvd = 10030
FROM PurOrdDet p where ponbr = '001025' and InvtID = 'I250182' and LineID in (3,4)


--select * from GLTran where BatNbr = '000754'

SELECT CuryExtCost, ExtCost, Qty, RcptQty, CuryUnitCost, UnitCost, InvtId, LineId, * 

-- update p set CuryExtCost = @SubTOTAL, ExtCost = @SubTOTAL, Qty = @CANTIDA, RcptQty = @CANTIDA , CuryUnitCost = @costoUnit, UnitCost = @costoUnit
-- update p set Qty = '10030', RcptQty = '10030'
-- delete 
FROM POTran WHERE RcptNbr = '001025' and InvtId = 'I250182' and LineID in (3,4)




 

 --select * from POReceipt where PONbr = '000754'

















