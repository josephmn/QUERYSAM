


--- PARA REVISAR LOS PAGOS POR DOCUMENTOS, CLIENTES, NC Y DEUDA PENDIENTE DE TODOS LOS PERIODOS


SELECT * FROM DINAMIC_CXC_PA


/*

CREATE VIEW DINAMIC_CXC_PA  
-- PROCESO : VISTA DE TOTAL DE FACTURAS PARA VER LOS PAGOS POR DOCUMENTOS  
-- SISTEMA : SOLOMON IV  
-- USURIOA : JOSEPH CARLOS MAGALLANES NOLAZCO / LAISSON GASLA  
-- FECHA   : 15-10-2019  
AS  
SELECT ROW_NUMBER() OVER (PARTITION BY NRO_DOCUMENTO ORDER BY NRO_DOCUMENTO ASC) POST,   
NRO_DOCUMENTO, TIPO_DOC, RUC_CLIENTE, TIPO_CLIENTE, MONTO_SIN_IGV, PERIODO, FECHA_DOC, FECHA_VEN, COD_CREDITO, FECHA_PAGO, MONTO_PAGO, PERIODO_PAGO  
FROM (  
SELECT NRO_DOCUMENTO, TIPO_DOC, RUC_CLIENTE, TIPO_CLIENTE, MONTO_SIN_IGV, PERIODO, FECHA_DOC, FECHA_VEN, COD_CREDITO, FECHA_PAGO, SUM(MONTO_PAGO) MONTO_PAGO, PERIODO_PAGO  
FROM (  
SELECT  --AR.Batnbr,   
AR.RefNbr NRO_DOCUMENTO, (CASE AR.User6 WHEN '03' THEN 'BO' WHEN '01' THEN 'FAC' ELSE 'NC' END) TIPO_DOC,   
AR.CustId RUC_CLIENTE, C.ClassId TIPO_CLIENTE, (CASE WHEN AR.doctype  ='CM' THEN (ROUND((AR.OrigDocAmt / 1.18),2) * -1 ) ELSE  ROUND((AR.OrigDocAmt / 1.18),2) END) MONTO_SIN_IGV,   
AR.PerPost PERIODO, DocDate FECHA_DOC, DueDate FECHA_VEN, AR.Terms COD_CREDITO, --ISNULL(D.Descr,'') NOM_CREDITO,   
B.AdjgDocDate FECHA_PAGO, ROUND(B.AdjAmt/1.18,2) MONTO_PAGO, B.AdjgPerPost PERIODO_PAGO  
FROM ARDoc AR WITH(NOLOCK)  
LEFT JOIN ARAdjust B WITH(NOLOCK) ON B.AdjdRefNbr = AR.RefNbr and b.AdjgDocType <>'CM'  
INNER JOIN (SELECT DISTINCT RefNbr FROM ARTran WITH(NOLOCK) WHERE Acct IN ('701110','709110','741101')) T ON AR.REFNBR = T.RefNbr  
LEFT JOIN Customer C WITH(NOLOCK) ON AR.CustId = C.CustId  
LEFT JOIN Terms D WITH(NOLOCK) ON AR.Terms = D.TermsId  
WHERE DocType <>'PA' AND AR.OrigDocAmt > 0 AND AR.custid <> '00000000000'  and AR.User6 NOT in ('ND') AND AR.PerPost > = '201901'  
--and AR.RefNbr IN ( SELECT  top 1 RefNbr FROM ARTran WHERE Acct = '401110' and TranAmt > 0 and RefNbr  = AR.RefNbr)  
--and ar.RefNbr = 'B010001685'  
--AND AR.BatNbr  ='003488'  
) X GROUP BY NRO_DOCUMENTO, TIPO_DOC, RUC_CLIENTE, TIPO_CLIENTE, MONTO_SIN_IGV, PERIODO, FECHA_DOC, FECHA_VEN, COD_CREDITO, FECHA_PAGO, PERIODO_PAGO  
  
union all   
  
select x.RefNbr,   
(CASE x.User6 WHEN '03' THEN 'BO' WHEN '01' THEN 'FAC' ELSE 'NC' END) TIPO_DOC,  
x.CustId, C.ClassId TIPO_CLIENTE, ROUND(( X.OrigDocAmt / 1.18),2)MONTO_SIN_IGV,X.PERPOST ,X.DocDate , X.DueDate ,X.Terms, --ISNULL(x.Descr,'')  NOM_CREDITO,   
a.AdjgDocDate, ROUND((a.AdjAmt/1.18),2) MONTO_PAGO, a.AdjgPerPost PERIODO_PAGO from (        
select AR.batnbr,AR.User6, AR.refnbr,docdate,duedate,AR.custid,AR.slsperid,origdocamt,AR.terms,AR.PERPOST,D.Descr from ardoc AR  
LEFT JOIN (SELECT DISTINCT RefNbr FROM ARTran WITH(NOLOCK) WHERE Acct IN ('701110','709110','741101')) T ON AR.REFNBR = T.RefNbr  
LEFT JOIN Customer C WITH(NOLOCK) ON AR.CustId = C.CustId  
LEFT JOIN Terms D WITH(NOLOCK) ON AR.Terms = D.TermsId  
where DOCTYPE <>'PA' and  AR.custid <> '00000000000'  and AR.User6 NOT in ('ND') AND AR.PerPost > = '201901' --AND AR.RefNbr = 'F010009863'  
)x     
--INNER JOIN TERMS T ON X.TERMS = T.termsid      
inner join aradjust a on X.refnbr = a.adjdrefnbr AND A.AdjgDocType ='CM'    
inner join customer c on X.custid  = c.custid         
inner join salesperson s on X.slsperid = s.slsperid  
) ZZ  
  
/*  
SELECT ROW_NUMBER() OVER (PARTITION BY NRO_DOCUMENTO ORDER BY NRO_DOCUMENTO ASC) POST,   
NRO_DOCUMENTO, RUC_CLIENTE, TIPO_CLIENTE, MONTO_SIN_IGV, PERIODO, FECHA_DOC, FECHA_VEN, COD_CREDITO, NOM_CREDITO, FECHA_PAGO, SUM(MONTO_PAGO) MONTO_PAGO, PERIODO_PAGO  
FROM (  
SELECT  --AR.Batnbr,   
AR.RefNbr NRO_DOCUMENTO, AR.CustId RUC_CLIENTE, C.ClassId TIPO_CLIENTE, T.MONTO_SIN_IGV, AR.PerPost PERIODO, DocDate FECHA_DOC, DueDate FECHA_VEN,   
AR.Terms COD_CREDITO, ISNULL(D.Descr,'') NOM_CREDITO, B.AdjgDocDate FECHA_PAGO, ROUND(B.AdjAmt/1.18,2) MONTO_PAGO, B.AdjgPerPost PERIODO_PAGO  
FROM ARDoc AR WITH(NOLOCK)  
INNER JOIN ARAdjust B WITH(NOLOCK) ON B.AdjdRefNbr = AR.RefNbr  
INNER JOIN (SELECT RefNbr, SUM(TRANAMT) MONTO_SIN_IGV FROM ARTran WITH(NOLOCK) WHERE Acct LIKE '70%' AND S4Future11 = '' GROUP BY RefNbr) T ON B.AdjdRefNbr = T.RefNbr  
LEFT JOIN Customer C WITH(NOLOCK) ON AR.CustId = C.CustId  
LEFT JOIN Terms D WITH(NOLOCK) ON AR.Terms = D.TermsId  
WHERE DocType <> 'PA'  
--AND AR.RefNbr = 'F010010664'  
) X GROUP BY NRO_DOCUMENTO, RUC_CLIENTE, TIPO_CLIENTE, MONTO_SIN_IGV, PERIODO, FECHA_DOC, FECHA_VEN, COD_CREDITO, NOM_CREDITO, FECHA_PAGO, PERIODO_PAGO  
*/  


*/

