
SELECT BatNbr, CustId, RefNbr, SlsperId, DocBal, CuryDocBal, CuryId, CuryRate, CuryOrigDocAmt, OrigDocAmt, PerClosed, PerPost, DocDate, DueDate, Terms, User6 FROM ARDoc where RefNbr = 'F010010546'
SELECT BatNbr, CustId, RefNbr, Acct, CuryRate, CuryTranAmt, CuryUnitPrice, TranAmt, Qty, PerPost, TranDate, S4Future11, SiteId, SlsperId, TaxCat, User6 FROM ARTran where RefNbr = 'F010010546'
SELECT BatNbr, Id, RefNbr, Acct, CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, Qty, CuryRateType, Module, PerPost, TranDate, S4Future11, User6 FROM GLTran where Module = 'AR' and RefNbr = 'F010010546' 
SELECT AdjBatNbr, CustId, AdjdRefNbr, AdjgDocDate, AdjgDocType, AdjgPerPost, AdjgRefNbr, CuryAdjdAmt, CuryAdjdCuryId, CuryAdjgAmt, PerAppl, LUpd_User FROM ARAdjust where AdjdRefNbr = 'F010010546'




SELECT * FROM (
SELECT A.CustId, C.ClassId, B.RefNbr, AdjgDocType, T.MONTO_SIN_IGV, (ROUND(CuryAdjdAmt/1.18,2)) CuryAdjdAmt, 
CuryAdjdCuryId, CuryAdjgAmt, PerAppl, B.PerPost, B.DocBal, B.DocDate, B.DueDate, 
(CASE WHEN (DATEDIFF(DAY,B.DocDate,B.DueDate))<0 THEN 0 ELSE (DATEDIFF(DAY,B.DocDate,B.DueDate)) END) DIF_DIAS, B.Terms, ISNULL(D.Descr,'') DESCRIPCION_TERMS
FROM ARAdjust A 
INNER JOIN ARDoc B ON A.AdjdRefNbr = B.RefNbr
INNER JOIN (SELECT RefNbr, SUM(TRANAMT) MONTO_SIN_IGV FROM ARTran WITH(NOLOCK) WHERE Acct LIKE '70%' AND S4Future11 = '' /*AND RefNbr = 'F050020221' */GROUP BY RefNbr) T ON A.AdjdRefNbr = T.RefNbr
LEFT JOIN Customer C ON A.CustId = C.CustId
LEFT JOIN Terms D ON B.Terms = D.TermsId
where 
--AdjdRefNbr = 'F050020221' AND
B.DocType <> 'PA'
) X WHERE DocBal >0






SELECT BatNbr, CustId, RefNbr, SlsperId, DocBal, CuryDocBal, CuryId, CuryRate, CuryOrigDocAmt, OrigDocAmt, PerClosed, PerPost, DocDate, DueDate, Terms, User6 FROM ARDoc where RefNbr = 'F050020221'
SELECT BatNbr, CustId, RefNbr, Acct, CuryRate, CuryTranAmt, CuryUnitPrice, TranAmt, Qty, PerPost, TranDate, S4Future11, SiteId, SlsperId, TaxCat, User6 FROM ARTran where RefNbr = 'F050020221'
SELECT BatNbr, Id, RefNbr, Acct, CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, Qty, CuryRateType, Module, PerPost, TranDate, S4Future11, User6 FROM GLTran where Module = 'AR' and RefNbr = 'F050020221' 
SELECT AdjBatNbr, CustId, AdjdRefNbr, AdjgDocType, AdjgPerPost, AdjgRefNbr, CuryAdjdAmt, CuryAdjdCuryId, CuryAdjgAmt, PerAppl, LUpd_User FROM ARAdjust where AdjdRefNbr = 'F050020221'


select * from ARDoc where RefNbr = 'F-21008'
select * from ARTran where RefNbr = 'F-21008'
select * from GLTran where RefNbr = 'F-21008'











