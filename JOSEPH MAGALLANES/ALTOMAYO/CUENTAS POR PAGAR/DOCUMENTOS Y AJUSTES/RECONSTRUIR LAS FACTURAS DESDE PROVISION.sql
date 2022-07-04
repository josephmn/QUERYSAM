





SELECT XA.BatNbr, XA.SFUTURE00, XA.Ruc, XA.NroDoc, XA.USER8, (LTRIM(RTRIM(A.Serie)) + RIGHT(LTRIM(RTRIM(A.NroDoc)),8)) NEW_NroDoc, A.NroDoc 
-- UPDATE XA SET XA.NroDoc = (LTRIM(RTRIM(A.Serie)) + RIGHT(LTRIM(RTRIM(A.NroDoc)),8)), XA.SFuture00 = (LTRIM(RTRIM(A.Serie)) + RIGHT(LTRIM(RTRIM(A.NroDoc)),8))
FROM xApDetTran  XA INNER JOIN (
SELECT H.LiqGasId, D.VendID, D.Serie, D.NroDoc, Item FROM APLiqGastoH H 
INNER JOIN APLiqGastoD D ON H.LiqGasId = D.LiqGasId 
WHERE H.LiqGasId = '000225' ) A ON XA.user8 = A.Item AND XA.Ruc = A.VendID

WHERE BatNbr = '001344'


























