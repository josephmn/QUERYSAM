
SELECT (CASE WHEN ELTIO > 1 THEN 'REPETIDOS-->MONTO->'+X.InvtID ELSE 'UNICO' END) INDICADOR, 
PONbr, VendId, VendName, InvtID, TranDesc, PurchUnit, QtyOrd, AAA, QtyRcvd, QtyFaltante, '' CCC,
CONVERT(VARCHAR(10),ReqdDate,120) ReqdDate, 
CONVERT(VARCHAR(10),PromDate,120) PromDate, 
CONVERT(VARCHAR(10),RcptDate,120) RcptDate, Comentario, RcptStage FROM (
SELECT TOP 99999 (ROW_NUMBER() OVER (PARTITION BY A.PONBR, B.InvtID, B.QtyOrd ORDER BY A.PONbr ASC)) ELTIO,
A.PONbr, A.VendId, A.VendName, 
B.InvtID, B.TranDesc, B.PurchUnit, B.QtyOrd, B.QtyOrd AAA, B.QtyRcvd, (B.QtyOrd - B.QtyRcvd) QtyFaltante,
B.ReqdDate, B.PromDate, C.RcptDate, '' Comentario, B.RcptStage--, 
--B.VouchStage,
--C.BatNbr, C.SiteId, C.RcptQty, C.CuryUnitCost, C.CuryExtCost,  C.TranType 
FROM JM_PurchOrd_CAB A 
LEFT JOIN JM_PurOrdDet_DET B ON A.PONbr = B.PONbr 
LEFT JOIN JM_POTran_DET C ON B.PONbr = C.PONbr AND --B.SiteId = C.SiteId AND 
B.InvtID =C.InvtID AND B.LineId = C.POLineID
WHERE B.SiteId <> 'CIXSUMIN' AND B.InvtID NOT LIKE 'M%' AND B.InvtID NOT LIKE 'GTO%' 
AND A.FechaCrea > = '2019-05-01'
--AND A.Status IN ('Orden Abierta','Completada')
--AND A.PONbr = '000046' 
ORDER BY A.PONbr ASC, C.BatNbr ASC
) X
















