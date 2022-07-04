
--- QUITAR RECEPCION

SELECT * FROM PurchOrd WHERE PONbr = '000079'

SELECT * FROM PurOrdDet WHERE PONbr = '000079'

SELECT RcptNbr, * 
-- delete
FROM POReceipt WHERE PONbr = '000079'

SELECT * 
-- delete
FROM POTran WHERE BatNbr = '003267'

SELECT BatNbr, RefNbr, * 
-- delete
FROM INTran WHERE RcptNbr IN ('000156') AND TranType = 'RC'

SELECT * 
-- delete
FROM GLTran WHERE RefNbr = '000156' AND Module = 'PO'







-- REGRESAR OC PARA RECEPCIONAR

SELECT * 

FROM PurchOrd WHERE PONbr = '000129'

SELECT * 
-- UPDATE PurchOrd set CuryRcptTotAmt = 0, PerClosed = '', RcptStage = 'N', RcptTotAmt = 0, Status = 'O'
FROM PurchOrd WHERE PONbr = '000079'


SELECT * FROM PurOrdDet WHERE PONbr = '000129'

SELECT * 
-- UPDATE PurOrdDet set CostReceived = 0, CuryCostReceived = 0, OpenLine = 1, QtyRcvd = 0, RcptStage = 'N', TaxID00 = ''
FROM PurOrdDet WHERE PONbr = '000079'




















