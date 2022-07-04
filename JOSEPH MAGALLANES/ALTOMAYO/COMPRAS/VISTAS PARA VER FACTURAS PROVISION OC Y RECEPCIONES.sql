
/*** reporte de andrea 03-04-2019 ****/

SELECT A.PONbr, A.VendId, A.VendName, A.UsuarioCrea, A.FechaCrea, 
B.InvtID, B.TranDesc, B.PurchUnit, B.CuryUnitCost, B.QtyOrd, B.QtyRcvd, CuryCostReceived, B.CuryId, B.CuryRate, B.RcptStage, B.ReqdDate, B.PromDate, B.VouchStage,
C.BatNbr, C.SiteId, C.RcptQty, C.CuryUnitCost, C.CuryExtCost, C.RcptDate, C.TranType FROM JM_PurchOrd_CAB A 
LEFT JOIN JM_PurOrdDet_DET B ON A.PONbr = B.PONbr 
LEFT JOIN JM_POTran_DET C ON B.PONbr = C.PONbr AND B.SiteId = C.SiteId AND B.InvtID =C.InvtID AND B.LineId = C.POLineID
WHERE B.SiteId <> 'CIXSUMIN' AND B.InvtID NOT LIKE 'M%' AND B.InvtID NOT LIKE 'GTO%' --AND A.Status IN ('Orden Abierta','Completada')
--AND A.PONbr = '000046' 
ORDER BY A.PONbr ASC, C.BatNbr ASC




--SELECT * FROM APDoc WHERE RefNbr = '001558'

ALTER VIEW JM_PurchOrd_CAB
AS
select PONbr, (CASE POType WHEN 'OR' THEN 'Orden Regular' WHEN 'DP' THEN 'Orden Negociada' WHEN 'BL' THEN 'Orden Programada' ELSE 'Orden Estandar' END) POType, 
(CASE Status WHEN 'M' THEN 'Completada' WHEN 'O' THEN 'Orden Abierta' WHEN 'P' THEN 'Orden Compra' WHEN 'Q' THEN 'Cotizacion' ELSE 'Cancelada' END) Status,
VendId, VendName, Buyer UsuarioCrea, PODate FechaCrea, 
(CASE RcptStage WHEN 'N' THEN 'No Recibido' WHEN 'P' THEN 'Parcialm Recibido' WHEN 'F' THEN 'Totalm Recibido' WHEN 'X' THEN 'Recep no Esperadas' ELSE '' END) RcptStage, Terms, 
(CASE VouchStage WHEN 'N' THEN 'No Facturado' WHEN 'P' THEN 'Parcialm Facturado' WHEN 'F' THEN 'Totalm Facturado' ELSE '' END) VouchStage, CuryId, CuryRate, CuryRateType, TaxID00, POAmt, 
CuryPOAmt, RcptTotAmt, CuryRcptTotAmt from PurchOrd --where PONbr = '000007'

ALTER VIEW JM_PurOrdDet_DET
AS
select PONbr, LineId, LineNbr, LineRef, (CASE POType WHEN 'OR' THEN 'Orden Regular' WHEN 'DP' THEN 'Orden Negociada' WHEN 'BL' THEN 'Orden Programada' ELSE 'Orden Estandar' END) POType,
(CASE PurchaseType WHEN 'DL' THEN 'Description Line' WHEN 'FR' THEN 'Freight Charges' WHEN 'GI' THEN 'Goods for Inventory' 
WHEN 'GS' THEN 'Goods for Sales Order' WHEN 'MI' THEN 'Misc Charges' WHEN 'GN' THEN 'Non-Inventory Goods' WHEN 'SE' THEN 'Services for Expens' ELSE '' END) PurchaseType, SiteId,
InvtID, TranDesc, UnitCost, CuryUnitCost, QtyOrd, QtyRcvd, CuryCostReceived,
CuryCostVouched, ExtCost, CuryExtCost, CuryId, CuryMultDiv, CuryRate,
(CASE RcptStage WHEN 'N' THEN 'No Recibido' WHEN 'P' THEN 'Parcialm Recibido' WHEN 'F' THEN 'Totalm Recibido' WHEN 'X' THEN 'Recep no Esperadas' ELSE '' END) RcptStage, ReqdDate, PromDate,
(CASE VouchStage WHEN 'N' THEN 'No Facturado' WHEN 'P' THEN 'Parcialm Facturado' WHEN 'F' THEN 'Totalm Facturado' ELSE '' END) VouchStage from PurOrdDet --where PONbr = '000007'

ALTER VIEW JM_POReceipt_CAB
AS
select PONbr, BatNbr, APRefno, rcptnbr, CuryId, CuryMultDiv, CuryRate, CuryRateType, RcptCtrlQty, RcptQtyTot, CuryRcptCtrlAmt, RcptAmtTot, CuryRcptAmtTot, RcptCtrlAmt,
(CASE RcptType WHEN 'R' THEN 'Recepcion' WHEN 'X' THEN 'Devolucion' ELSE '' END) RcptType, Rlsed, RcptDate,
(CASE DfltFromPO WHEN 'A' THEN 'Normal' WHEN 'D' THEN 'Fecha Prometida' ELSE 'Niguno' END) DfltFromPO from POReceipt --WHERE PONbr = '000007'


ALTER VIEW JM_POTran_DET
AS
select PONbr, BatNbr, LineId, LineNbr, LineRef, PerPost, POLineID, POLineNbr, POLIneRef, InvtId, TranDesc, Qty, CuryId, CuryMultDiv, CuryRate, CuryTranAmt, QtyVouched, RcptMultDiv, RcptConvFact, RcptQty,  
UnitCost, CuryUnitCost, UnitDescr, UnitMultDiv, UnitWeight, RcptDate, CostVouched, CuryCostVouched, ExtCost, CuryExtCost, RcptUnitDescr, S4Future12, SiteId, Trandate, 
(CASE TranType WHEN 'R' THEN 'Recepcion' WHEN 'X' THEN 'Devolucion' ELSE '' END) TranType,  User7 PromDate, VendId,
(CASE VouchStage WHEN 'N' THEN 'No Facturado' WHEN 'P' THEN 'Parcialm Facturado' WHEN 'F' THEN 'Totalm Facturado' ELSE '' END) VouchStage,
(CASE PurchaseType WHEN 'DL' THEN 'Description Line' WHEN 'FR' THEN 'Freight Charges' WHEN 'GI' THEN 'Goods for Inventory' 
WHEN 'GS' THEN 'Goods for Sales Order' WHEN 'MI' THEN 'Misc Charges' WHEN 'GN' THEN 'Non-Inventory Goods' WHEN 'SE' THEN 'Services for Expens' ELSE '' END) PurchaseType
from POTran P where BatNbr in (select BatNbr from JM_POReceipt_CAB where PONbr = P.PONbr)



-- SELECT * FROM GLTran WHERE BatNbr = (SELECT rcptnbr FROM POReceipt WHERE BatNbr = '000237') AND Module = 'PO'


--select * from APDoc

-- select * from APTran where PONbr in (select * from)
/*
000237    
000781    
001191    
001718    
001719    
001720    
*/



--SELECT * FROM OC_MASTER2019  

CREATE VIEW OC_MASTER_AM2019
AS
SELECT 
X.PONbr, X.UsuarioCrea, X.FechaCrea, X.VendId, X.VendName, X.Status, (CASE WHEN X.QtyRcvd = 0 THEN 'F' WHEN (X.QtyOrd - X.QtyRcvd) = 0 THEN 'C' ELSE 'P' END) ControlPO, X.Terms, 
X.LineId, X.LineNbr,
(CASE LTRIM(RTRIM((ROW_NUMBER() OVER (PARTITION BY X.LineId ORDER BY X.LineId ASC)))) WHEN 10 THEN 'F'+ 
CAST((ROW_NUMBER() OVER (PARTITION BY X.PONbr, X.LineId ORDER BY X.LineId ASC)) AS VARCHAR(3))  ELSE 'F0'+ CAST((ROW_NUMBER() OVER (PARTITION BY X.PONbr, X.LineId ORDER BY X.LineId ASC)) AS VARCHAR(3)) END ) NFac,
(CASE LTRIM(RTRIM((ROW_NUMBER() OVER (PARTITION BY X.LineId ORDER BY X.LineId ASC)))) WHEN 10 THEN 'L'+ 
CAST((ROW_NUMBER() OVER (PARTITION BY X.PONbr, X.LineId ORDER BY X.LineId ASC)) AS VARCHAR(3))  ELSE 'L0'+ CAST((ROW_NUMBER() OVER (PARTITION BY X.PONbr, X.LineId ORDER BY X.LineId ASC)) AS VARCHAR(3)) END ) NLote,
(CASE LTRIM(RTRIM((ROW_NUMBER() OVER (PARTITION BY X.LineId ORDER BY X.LineId ASC)))) WHEN 10 THEN 'Q'+ 
CAST((ROW_NUMBER() OVER (PARTITION BY X.PONbr, X.LineId ORDER BY X.LineId ASC)) AS VARCHAR(3))  ELSE 'Q0'+ CAST((ROW_NUMBER() OVER (PARTITION BY X.PONbr, X.LineId ORDER BY X.LineId ASC)) AS VARCHAR(3)) END ) QtyxF,
(CASE LTRIM(RTRIM((ROW_NUMBER() OVER (PARTITION BY X.LineId ORDER BY X.LineId ASC)))) WHEN 10 THEN 'C'+ 
CAST((ROW_NUMBER() OVER (PARTITION BY X.PONbr, X.LineId ORDER BY X.LineId ASC)) AS VARCHAR(3))  ELSE 'C0'+ CAST((ROW_NUMBER() OVER (PARTITION BY X.PONbr, X.LineId ORDER BY X.LineId ASC)) AS VARCHAR(3)) END ) NCosto,
(CASE LTRIM(RTRIM((ROW_NUMBER() OVER (PARTITION BY X.LineId ORDER BY X.LineId ASC)))) WHEN 10 THEN 'D'+ 
CAST((ROW_NUMBER() OVER (PARTITION BY X.PONbr, X.LineId ORDER BY X.LineId ASC)) AS VARCHAR(3))  ELSE 'D0'+ CAST((ROW_NUMBER() OVER (PARTITION BY X.PONbr, X.LineId ORDER BY X.LineId ASC)) AS VARCHAR(3)) END ) NFProm,
X.LineRef, X.SiteId, X.InvtID, X.TranDesc, X.QtyOrd, X.QtyRcvd, X.UnitCost, X.CuryUnitCost, X.CuryId, X.ExtCost, X.CuryRate, 
X.CuryExtCost, X.RcptStage, X.PromDate, X.VouchStage,
--ISNULL((SELECT BatNbr FROM APDoc WHERE RefNbr = ISNULL(Y.APRefno,'')),'') LOTE_AP, 
ISNULL((SELECT 
(CASE WHEN ISNUMERIC(InvcNbr) <> 1 THEN LTRIM(RTRIM(S4future12))+RIGHT('00000000000' + CAST(right(left(InvcNbr,11),7) AS VARCHAR),11) 
ELSE LTRIM(RTRIM(S4future12))+RIGHT(('00000000000' + CAST(CAST(SUBSTRING(InvcNbr,5,11) AS INTEGER) AS VARCHAR)),8) END)
 InvcNbr FROM APDoc WHERE BatNbr = ISNULL((SELECT BatNbr FROM APDoc WHERE RefNbr = ISNULL(Y.APRefno,'')),'')),'') InvcNbr,
ISNULL(Y.APRefno,'') APRefno, ISNULL(Y.BatNbr,'') BatNbr2, ISNULL(Y.PerPost,'') PerPost2, ISNULL(Y.RcptQty,'') RcptQty2, ISNULL(Y.CuryId,'') CuryId2, ISNULL(Y.CuryRate,'') CuryRate2, 
ISNULL(Y.UnitCost,'') UnitCost2, ISNULL(Y.CuryUnitCost,'') CuryUnitCost2, ISNULL(Y.UnitDescr,'') UnitDescr2, ISNULL(Y.ExtCost,'') ExtCost2, 
ISNULL(Y.CuryExtCost,'') CuryExtCost2, ISNULL(Y.RcptUnitDescr,'') RcptUnitDescr2, ISNULL(Y.SiteId,'') SiteId2, ISNULL(Y.Trandate,'') Trandate2, ISNULL(Y.PromDate,'') PromDate2
FROM (
SELECT A.PONbr, A.UsuarioCrea, A.FechaCrea, A.VendId, A.VendName, A.Status, A.Terms, B.LineId, B.LineNbr, B.LineRef, B.SiteId, B.InvtID, B.TranDesc, B.QtyOrd, B.QtyRcvd, B.UnitCost, B.CuryUnitCost, B.CuryId, B.ExtCost, B.CuryRate, B.CuryExtCost,
B.RcptStage, B.PromDate, B.VouchStage FROM JM_PurchOrd_CAB A INNER JOIN JM_PurOrdDet_DET B on A.PONbr = B.PONbr
) X LEFT JOIN 
(SELECT ISNULL(W.APRefno,'') APRefno, Z.* FROM JM_POReceipt_CAB W LEFT JOIN 
JM_POTran_DET Z ON W.BatNbr = Z.BatNbr) Y ON X.PONbr = Y.PONbr and X.LineId = Y.POLineID AND X.LineRef = Y.POLIneRef AND X.InvtID = Y.InvtId
WHERE X.SiteId <> 'CIXSUMIN' -- AND X.PONbr = '000007'




DECLARE @cols NVARCHAR(MAX), @query NVARCHAR(MAX);
SET @cols = STUFF(
                 (
                     SELECT DISTINCT
                            ','+QUOTENAME(LTRIM(RTRIM(InvtId)))
                     FROM OC_MASTER2019 c FOR XML PATH(''), TYPE
                 ).value('.', 'nvarchar(max)'), 1, 1, '');
SET @query = 'SELECT [LineRef],[InvtId],'+@cols+'from (SELECT [LineRef],
           [InvtId],
           [QtyOrd],
           [InvcNbr]
    FROM [OC_MASTER2019]
    )x pivot (max(QtyOrd) for InvtId in ('+@cols+')) p';
EXECUTE (@query);





DECLARE @columns NVARCHAR(MAX), @sql NVARCHAR(MAX);
SET @columns = N'';
SELECT @columns+=N', p.'+QUOTENAME([Name])
FROM
(
    SELECT [LineRef] AS [Name]
    FROM [dbo].[OC_MASTER2019] AS p
    GROUP BY [LineRef]
) AS x;

SET @sql = N'
SELECT [InvtId], '+STUFF(@columns, 1, 2, '')+' FROM (
SELECT [InvtId], [QtyOrd], [InvcNbr]
    FROM [dbo].[OC_MASTER2019]) AS j PIVOT (SUM(QtyOrd) FOR [LineRef] in 
	   ('+STUFF(REPLACE(@columns, ', p.[', ',['), 1, 1, '')+')) AS p;';
EXEC sp_executesql





/*** PROCEDURE ****/

--EXEC CONSTRUCTOR_ORDER_DINAMICO









