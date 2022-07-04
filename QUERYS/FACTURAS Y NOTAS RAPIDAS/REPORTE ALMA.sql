
sp_helptext  vcliecondicion 




---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 PERIODO	LOTE_IN	DOCUMENTO	RUC	DATOS	MONTO	CODVEND	VENDEDOR	FECHADOC	LOTEPAGO	FECHAVENC	MONTOPAGO	TIPOPAGO	FECHAPAGO	DIAS	CONDICION	
201609	009076    	F160070672	20538277721    	ECONOMYSA S.A.C.              	12,606.33	511       	Hilda Rondon Flores           	15/08/2016	010524    	14/09/2016	12,606.33	PA	19/09/2016	-5	Vencido	
																
																
AHORA																
																
 PERIODO	LOTE_IN	FECHA EMISION	DOCUMENTO	RUC	RAZON SOCIAL	IMPORTE DOC	CODVEND	VENDEDOR	COND CREDITO	LOTEPAGO	FECHAVENC	MONTOPAGO	TIPOPAGO	FECHAPAGO	DIAS	CONDICION
201609	009076    	15/08/2016	F160070672	20538277721    	ECONOMYSA S.A.C.              	12,606.33	511       	Hilda Rondon Flores           	Factura a 30 dias	010524    	14/09/2016	12,606.33	PA	19/09/2016	-5	Vencido
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM VCLIECONDICION2



alter view VCLIECONDICION2    
--Funcion  : Lista clientes catalogados por orden de pago    
--Sistema  : Solomon IV    
--Autor    : Laisson Gasla Baudat    
--Ultima fecha Mod : 28/09/2016    
AS    
select a.perappl perpost, x.batnbr LOTE_IN,x.docdate FECHA_EMISION,a.adjgrefnbr DOCUMENTO,x.custid RUC,c.name RAZON_SOCIAL, x.origdocamt IMPORTE_DOC,X.slsperid CODVEND,s.name VENDEDOR,t.descr COND_CREDITO,
a.adjbatnbr LOTEPAGO,x.duedate FECHAVENC,X.refnbr DOCPAGO ,  A.adjamt MONTOPAGO,A.adjgdoctype TIPOPAGO,a.dateappl FECHAPAGO,DATEDIFF ( dd , a.dateappl , x.duedate ) DIASDIF,    
(case    
when x.duedate >a.dateappl and month(x.duedate )= month(a.dateappl) then 'Pagado en fecha'     
 when x.duedate >a.dateappl and month(x.duedate )> month(a.dateappl) then 'Adelantado'      
 when x.duedate < a.dateappl then 'Vencido'    
when x.docdate = x.duedate  or x.duedate  = a.dateappl then 'Pagado en fecha'    
    
--when x.terms = '01' then 'Contado'    
end )CONDICION    
  from (    
select batnbr,refnbr,docdate,duedate,custid,slsperid,origdocamt,terms,PERPOST from ardoc where DOCTYPE <>'PA' and  custid <> '00000000000'  
--perpost IN  ('201607','201608')  AND  refnbr ='B580174806'--and docdate < duedate    
)x  
INNER JOIN TERMS T ON X.TERMS = T.termsid  
inner join    
aradjust a on X.refnbr = a.adjdrefnbr AND A.AdjgDocType ='CM'
inner join customer c on X.custid  = c.custid     
inner join salesperson s on X.slsperid = s.slsperid    















alter view VCLIECONDICION    
--Funcion  : Lista clientes catalogados por orden de pago    
--Sistema  : Solomon IV    
--Autor    : Laisson Gasla Baudat    
--Ultima fecha Mod : 28/09/2016    
AS    
select a.perappl perpost, x.batnbr LOTE_IN,x.docdate FECHA_EMISION,x.refnbr DOCUMENTO,x.custid RUC,c.name RAZON_SOCIAL, x.origdocamt IMPORTE_DOC,y.slsperid CODVEND,s.name VENDEDOR,t.descr COND_CREDITO,
a.adjbatnbr LOTEPAGO,x.duedate FECHAVENC,A.adjamt MONTOPAGO,A.adjgdoctype TIPOPAGO,a.dateappl FECHAPAGO,DATEDIFF ( dd , a.dateappl , x.duedate ) DIASDIF,    
(case    
when x.duedate >a.dateappl and month(x.duedate )= month(a.dateappl) then 'Pagado en fecha'     
 when x.duedate >a.dateappl and month(x.duedate )> month(a.dateappl) then 'Adelantado'      
 when x.duedate < a.dateappl then 'Vencido'    
when x.docdate = x.duedate  or x.duedate  = a.dateappl then 'Pagado en fecha'    
    
--when x.terms = '01' then 'Contado'    
end )CONDICION    
  from (    
select batnbr,refnbr,docdate,duedate,custid,slsperid,origdocamt,terms,PERPOST from ardoc where DOCTYPE IN ('IN','CM') and  custid <> '00000000000'  
--perpost IN  ('201607','201608')  AND  refnbr ='B580174806'--and docdate < duedate    
)x  
INNER JOIN TERMS T ON X.TERMS = T.termsid  
left join    
aradjust a on X.refnbr = a.adjdrefnbr     
inner join customer c on X.custid  = c.custid     
inner join     
(    
select batnbr, slsperid,custid,refnbr from ardoc where doctype  ='PA'      
)    
y on a.adjbatnbr = y.batnbr  and a.custid = y.custid and a.AdjgRefNbr = y.refnbr    
inner join salesperson s on y.slsperid = s.slsperid    
--where x.refnbr='F160071254'    
--a.perappl  IN  ('201607','201608')     
--and     
/*    
union all     
select r.perpost, r.batnbr LOTE_IN,r.refnbr DOCUMENTO,r.origdocamt MONTO,r.custid RUC,k.name DATOS,r.slsperid CODVEND,p.name VENDEDOR,r.docdate FECHADOC,r.duedate FECHAVENC,    
'No lote'LOTEPAGO,r.origdocamt MONTOPAGO,r.doctype TIPOPAGO,r.docdate FECHAPAGO,0 DIASDIF,'Contado'CONDICION    
  from (    
select batnbr,refnbr,docdate,duedate,custid,slsperid,origdocamt,terms,doctype,PERPOST from ardoc where DOCTYPE IN ('IN','CM')and terms ='01'    
--perpost IN  ('201607','201608')  AND  refnbr ='B580174806'--and docdate < duedate    
)r     
inner join customer k on r.custid  = k.custid     
inner join salesperson p on r.slsperid = p.slsperid    
--where r.refnbr = 'F160071254'    
*/    
    
 
 

 
 
 select doctype,* from ardoc where refnbr  ='F160071287'