--------------------------------------


-- CAMBIAR CONDICION DE PAGO


--------------------------------------

TERMS, DUEDATE 
02	Factura a 15 Dias             
03	Factura a 30 Dias             
04	Factura a 45 Dias             
05	Factura a 60 Dias             
06	Factura a 90 Dias             
07	Factura a 120 Dias            
08	Factura a 10 Dias             
09	Factura a 21 Dias             
10	Factura a 3 Dias              
11	Factura a 7 Dias              






declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='005924' -- LOTE 
set @refnbr ='F010002020' --DOCUMENTO
SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'
select perpost,batnbr,docbal,curydocbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,duedate,terms,* from ardoc c where batnbr= @batnbr and refnbr = @refnbr
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran c
where batnbr= @batnbr  and refnbr like @refnbr 
--select  *from catran where batnbr =@batnbr
select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran g
where batnbr = @batnbr and module = 'AR' and refnbr like @refnbr 
select * from aradjust where adjbatnbr =@batnbr and adjdrefnbr =@refnbr
go


IN	F030002030	Contado                       	28/02/2017	0.00	95,408.05
IN	F030002031	Contado                       	28/02/2017	0.00	9,871.88

el 30/03/2017


select slsperid,docdate,duedate,terms,refnbr,doctype,* from ardoc where refnbr  in ('F030002031') 

select TERMSID,slsperid,*  from soshipheader where invcnbr  in ('F010002020')--,'F160071200','F160071251','F160071276')
   
set dateformat ymd
update ardoc set terms ='03', duedate= '2017-03-30' where batnbr  ='001884' and refnbr in ('F030002030','F030002031')
UPDATE soshipheader  SET TERMSID  ='04' WHERE INVCNBR  in ('F660035272')

--------------------------------------------------------------------------------------------------------------------------
/*

update ardoc set  duedate  ='2016-07-31' where batnbr  ='006572' and refnbr = 'F160069765'
update ardoc set terms ='05' where batnbr  ='013203' and refnbr = 'F660026485'
update ardoc set terms ='05' where batnbr  ='013203' and refnbr = 'F660026484'
update ardoc set  duedate  ='2016-07-31' where batnbr  ='006572' and refnbr = 'F160069765'

select TERMSID,*  from soshipheader where invcnbr  ='F160071017' 

UPDATE soshipheader  SET TERMSID  ='03' WHERE INVCNBR  in ('F030002030','F030002031')

sp_helptext  dvnb_tb_CobrVendD 

select *from tb_CobrVendD where perpost = '201610' 
and SlsperidCob =  '001'   and refnbr in ('F160070743','F160071200','F160071251','F160071276')
order by perpost,slsperid,custid,refnbr  


select *from tb_CobrVendD



update  tb_CobrVendD set slsperidCob  ='091' , nameslsper ='Alan Peralta Nieves'where refnbr  in ('F160070743','F160071200','F160071251','F160071276')
slsperidCob
001
Alan Peralta Nieves              




 select module,name,number,screentype from screen     