

SELECT COPrinted, POPrinted, ReqCntr, * 
-- DELETE 
-- UPDATE POReqHdr SET COPrinted = 0, POPrinted = 0, ReqCntr = 0
FROM POReqHdr WHERE PONbr = '000191' --AND CuryID = 'SOL'

SELECT * FROM POReqHist WHERE ReqNbr = '000191'



SELECT A.PONbr, A.VendId, A.VendName, A.UsuarioCrea, A.FechaCrea, 
B.InvtID, B.TranDesc, B.PurchUnit, B.CuryUnitCost, B.QtyOrd, B.QtyRcvd, CuryCostReceived, B.CuryId, B.CuryRate, B.RcptStage, B.ReqdDate, B.PromDate, B.VouchStage,
C.BatNbr, C.SiteId, C.RcptQty, C.CuryUnitCost, C.CuryExtCost, C.RcptDate, C.TranType FROM JM_PurchOrd_CAB A 
LEFT JOIN JM_PurOrdDet_DET B ON A.PONbr = B.PONbr 
LEFT JOIN JM_POTran_DET C ON B.PONbr = C.PONbr AND B.SiteId = C.SiteId AND B.InvtID =C.InvtID AND B.LineId = C.POLineID
WHERE --B.SiteId <> 'CIXSUMIN' AND B.InvtID NOT LIKE 'M%' AND B.InvtID NOT LIKE 'GTO%' --AND A.Status IN ('Orden Abierta','Completada')
--AND 
A.PONbr = '000191' 
ORDER BY A.PONbr ASC, C.BatNbr ASC




SELECT PONbr, Crtd_User, InvtID, TranDesc, --CuryCostReceived, CuryCostReturned, CuryCostVouched, 
CuryExtCost, CuryId, 
CuryMultDiv, CuryRate, CuryUnitCost, ExtCost, QtyOrd, LineID, LineNbr, LineRef, TaxAmt00, TaxAmt01, 
TaxAmt02, TaxAmt03, TaxCalced, TaxCat, TaxID00, TaxID01, TaxID02, TaxID03, TaxIdDflt, UnitCost FROM PurOrdDet WHERE PONbr = '000159'

SELECT PONbr, Crtd_User, InvtID, TranDesc, --CuryCostReceived, CuryCostReturned, CuryCostVouched, 
CuryExtCost, CuryId, 
CuryMultDiv, CuryRate, CuryUnitCost, ExtCost, QtyOrd, LineID, LineNbr, LineRef, TaxAmt00, TaxAmt01, 
TaxAmt02, TaxAmt03, TaxCalced, TaxCat, TaxID00, TaxID01, TaxID02, TaxID03, TaxIdDflt, UnitCost FROM PurOrdDet WHERE PONbr = '000191'




SELECT ReqNbr, InvtID, Descr, CuryExtCost, CuryId, 
CuryMultDiv, CuryRate, CuryUnitCost, ExtCost, Qty, LineID, LineNbr, LineRef, TaxAmt00, TaxAmt01, 
TaxAmt02, TaxAmt03, TaxCalced, TaxCat, TaxID00, TaxID01, TaxID02, TaxID03, TaxIdDflt, UnitCost 
FROM POReqDet WHERE ReqNbr = '000159'

SELECT ReqNbr, InvtID, Descr, CuryExtCost, CuryId, 
CuryMultDiv, CuryRate, CuryUnitCost, ExtCost, Qty, LineID, LineNbr, LineRef, TaxAmt00, TaxAmt01, 
TaxAmt02, TaxAmt03, TaxCalced, TaxCat, TaxID00, TaxID01, TaxID02, TaxID03, TaxIdDflt, UnitCost 
FROM POReqDet WHERE ReqNbr = '000191'




select 
-- update b set b.CuryId = a.CuryId, b.CuryRate = a.CuryRate, b.UnitCost = a.UnitCost
-- update b set b.ExtCost = round(b.CuryExtCost * b.CuryRate,2)
a.PONbr,a.Crtd_User,a.InvtID,a.TranDesc,a.CuryExtCost,a.CuryId,a.CuryMultDiv,a.CuryRate,a.CuryUnitCost,a.ExtCost,a.QtyOrd,a.TaxCat,a.TaxID00,a.UnitCost,
b.ReqNbr,b.Crtd_User,b.InvtID,b.Descr,b.CuryExtCost,b.CuryId,b.CuryMultDiv,b.CuryRate,b.CuryUnitCost,b.ExtCost,b.Qty,b.UnitCost
from POReqDet b 
inner join PurOrdDet a on a.PONbr = b.ReqNbr and a.InvtID = b.InvtID and a.SiteId = b.SiteID
where a.PONbr = '000191'









