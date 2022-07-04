


declare @fech varchar(10) declare @dia char(2) declare @tienda char(2)
declare @mes char(2)
set  @mes='09'
set @dia ='22'
set @fech=@dia + '-' + @mes +'-2017'
set @tienda = '44'


/*
select * from cf_tiendasite
--select *from cf_tiendasite where  descripcion like'%piu%'
select ExportadoPA,ReferenciaPA,ExportadoFN,referenciaFN,fecha,fechanegocio,*  
--update CF_RegVtas set ExportadoFN='018851',referenciaFN='311B018568',ExportadoPA ='',ReferenciaPA =''
--delete 
from CF_RegVtas where chk_num ='EMCHICLA000000009289'  and  ExportadoFN='019836'
EMCHICLA000000009288
EMCHICLA000000009289
*/

select * from CF_ControlArchivos WHERE nombArchivo like @dia+@mes+'15%' and NumTienda =  @tienda
set @fech='2017-'+  @mes +'-'+ @dia 
select *  from CFM_RegVtas where FechaNegocio =@fech and NumTienda =  @tienda

select *  from CF_ResItem where FechaNegocio =@fech and NumTienda =  @tienda
select *  from CF_DetDesc where FechaNegocio =@fech and NumTienda =  @tienda
select *  from CF_DetPago where FechaNegocio =@fech and NumTienda =  @tienda

select *  from CF_RegVtas where FechaNegocio =@fech and NumTienda =  @tienda order by NumDoc
select sum(total)  from CF_RegVtas where FechaNegocio =@fech and NumTienda =  @tienda
select sum(Subtotal),sum(igv),sum(total)  from CF_RegVtas where FechaNegocio =@fech and NumTienda =  @tienda
select 'Sin No Pago', sum(Subtotal),sum(igv),sum(total)  from CF_RegVtas where FechaNegocio =@fech and NumTienda =  @tienda and user06 <>'NOPAGO'

select ExportadoFN,sum(Subtotal),sum(igv),sum(total),(select sum( (CASE WHEN DOCTYPE = 'CM' THEN origdocamt*-1 ELSE origDocAmt end )) from ardoc where batnbr = ExportadoFN)AR  from CF_RegVtas where FechaNegocio =@fech and NumTienda =  @tienda
group by ExportadoFN
select ExportadoPA,sum(Subtotal),sum(igv),sum(total),(select sum( (CASE WHEN DOCTYPE = 'CM' THEN origdocamt*-1 ELSE origDocAmt end )) from ardoc where batnbr = ExportadoPA)AR from CF_RegVtas where FechaNegocio =@fech and NumTienda =  @tienda
group by ExportadoPA

select 'deposito'
select * from CFM_DetPago2 where   FechaNegocio =@fech and NumTienda in(  @tienda,'99')
    

select *  from CF_RegVtas where FechaNegocio =@fech and NumTienda =  @tienda and user06='NOPAGO'
--select distinct Numdoc  from CF_RegVtas where FechaNegocio =@fech and NumTienda =  @tienda

--select *  from CF_ResItemAJ where FechaNegocio =@fech

set @fech='2017'+@mes+ @dia 
--select * from CFM_DetPagoTipo where NumTienda=@tienda and FechaNegocio =@fech
select *  from CFM_DetDesc where FechaNegocio =@fech and NumTienda =  @tienda
select *  from CFM_DetPago where FechaNegocio =@fech and NumTienda =  @tienda order by NumtenderMedia
select NumtenderMedia,sum(Total)  from CFM_DetPago where FechaNegocio =@fech and NumTienda =  @tienda group by NumtenderMedia
select *  from CFM_ResItem where FechaNegocio =@fech and NumTienda =  @tienda
select *  from CFM_RegVtas where FechaNegocio =@fech and NumTienda =  @tienda order by chk_num
select sum(total) from (select distinct Numdoc,total  from CFM_RegVtas where FechaNegocio =@fech and NumTienda =  @tienda) as T

select * from CF_DetPago

select *from CFM_DetPago2 where   FechaNegocio =@fech and NumTienda =  @tienda
select *from CFM_DetPago2 where exportadotr ='' AND NumTienda ='99' and (eOrigen like 'CAJP%' or Edestino like 'CAJP%')
/*

select *from CFM_DetPago2 where referencia like '%ext.%' and total > 1000

select *  
--delete 
from CFM_DetPago where FechaNegocio ='20140918' and NumTienda =  '6' and chk_num='CFTARAPO000000019460' order by NumtenderMedia
*/
--select *from CFM_DetPago2 where  Num20140924  Tienda in( '27','99') FechaNegocio =@fech and   @tienda

--delete  from CFM_RegVtas where FechaNegocio =@fech and NumTienda =  @tienda 
--delete    from CFM_DetDesc where FechaNegocio =@fech and NumTienda =  @tienda
--delete    from CFM_DetPago where FechaNegocio =@fech and NumTienda =  @tienda
--delete from CFM_RegVtas where FechaNegocio ='20110623' and NumTienda='3' and chk_Num='308' and NumCajero='456'
--select distinct Numdoc  from CFM_RegVtas where FechaNegocio =@fech and NumTienda =  @tienda and 
--Numdoc not in (select distinct Numdoc  from CF_RegVtas where FechaNegocio =@fech and NumTienda =  @tienda)
--
--select *  from CFM_RegVtas where FechaNegocio =@fech and NumTienda =  @tienda and 
--Numdoc in (select distinct Numdoc  from CFM_RegVtas where FechaNegocio =@fech and NumTienda =  @tienda and 
--Numdoc not in (select distinct Numdoc  from CF_RegVtas where FechaNegocio =@fech and NumTienda =  @tienda))

--------update CF_ControlArchivos set Exportado='  WHERE nombArchivo like '260912%' and NumTienda =  '3' and NombArchivo='260912SM.CSV'
--------delete from CF_ControlArchivos WHERE nombArchivo like '010512%' and NumTienda =  '20'
-- select * from CF_ControlArchivos WHERE nombArchivo like '151210%' and NumTienda =  '3' and NombArchivo='010812SM.CSV'

--select *from CF_ControlArchivos WHERE nombArchivo like '011010%' and NumTienda =  '7'
/*

select  -17.63,igv*-3.17,total*-20.8,*  from CFM_RegVtas --where FechaNegocio ='20101031' and NumTienda =  '6' and NumDoc='20111009-01-0091739'
--update CFM_RegVtas set --SubTotal= 0 ,igv=0,total=0 --,
NumDocAnulacion= '20150120-02-0288316'
where   chk_num='CFIQUITO000000001216' FechaNegocio ='20130305' and NumTienda =  '3' and NumDoc='20130306-01-0158862'

SELECT *  from CFM_RegVtas where FechaNegocio ='2015-02-28' and fecha ='2015-03-03'

update CFM_RegVtas set fecha ='2015-02-28'  from CFM_RegVtas where FechaNegocio ='2015-02-28' and fecha ='2015-03-03'
update CF_RegVtas set fecha ='2013-12-23'  from CF_RegVtas where FechaNegocio ='2015-02-28' and fecha ='2015-03-03'

update CF_RegVtas set fecha ='2014-07-25'  from CF_RegVtas where chk_num='CFAREQUI000000024060'
update CFM_RegVtas set fecha ='2014-07-25'  from CFM_RegVtas where chk_num='CFAREQUI000000024060'

EMTRUJIL000000006486
EMTRUJIL000000006487
update CFM_RegVtas set FechaNegocio ='2013-12-23', c1='CREDITO'  from CFM_RegVtas where chk_num='LIM01CEN000000033590'

select *  from CF_RegVtas where chk_num='CFIQUITO000000010163'
select *  from CFM_RegVtas where chk_num='CFIQUITO000000010163'

CFIQUITO000000010161
CFIQUITO000000010162
CFIQUITO000000010163

select numtienda,fechaNegocio ,fecha,count(*)  from CFM_RegVtas 
where fechaNegocio >= '2014-09-01 00:00:00'
group by numtienda,fechaNegocio,fecha

select *  from CFM_RegVtas

select *  from CF_RegVtas where numDoc like '%20150703-02-0296999%'
select *  from CFM_RegVtas where numDoc like '%20150703-02-0296999%'

delete  from CF_RegVtas where chk_num='CFIQUITO000000010163'
delete from CFM_RegVtas where chk_num='CFIQUITO000000010163'

update CFM_RegVtas set c1='CREDITO'  from CFM_RegVtas where chk_num='CFAREQUI000000021163'
update CF_RegVtas set c1='CREDITO', user06 ='NOPAGO'  from CF_RegVtas where chk_num='CFAREQUI000000021163'
update CFM_RegVtas set NumTienda ='29'  from CFM_RegVtas where chk_num='LIM01CEN000000000020'
update CFM_RegVtas set tipoDoc ='03'  from CFM_RegVtas where chk_num='LIM01CEN000000000034'
NumTienda
31 
LIM01CEN000000000035
LIM01CEN000000000034

select FechaNegocio,*  from CFM_RegVtas where NumTienda =  '6' and FechaNegocio='2014-01-31'   and  fecha ='2014-02-01' 
select FechaNegocio,*  from CF_RegVtas  where NumTienda =  '6' and FechaNegocio='2014-01-31'   and  fecha ='2014-02-01'   
select distinct c1   from CF_RegVtas 


update CFM_RegVtas set  FechaNegocio ='2014-02-01'   from CFM_RegVtas where NumTienda =  '6' and FechaNegocio='2014-01-31'   and  fecha ='2014-02-01' 
update CF_RegVtas  set  fecha ='2014-02-02'  from CF_RegVtas  where  NumTienda =  '30' and FechaNegocio='2014-01-30'   and  fecha ='2014-02-01 

update CFM_RegVtas set FechaNegocio ='2013-12-31',  fecha ='2013-12-31'  from CFM_RegVtas where chk_num='LIM01CEN000000033593'
select *  from CFM_RegVtas where total < 0  order by numtienda , fecha
select *  from CFM_RegVtas where  NumDoc like '%010366%'-- NumTienda =  '23' and
select *  from CF_RegVtas where  NumDoc like '%010366%' --NumTienda =  '23' and

select *  
--update CFM_RegVtas set chk_num=''
from CFM_RegVtas where chk_num='CFAPIURA000000048653'
select *  
--update CF_RegVtas set chk_num=''
from CF_RegVtas where chk_num='CFAPIURA000000048653' --and  ExportadoFN ='019584'

select *from CF_RegVtas where NumDocAnulacion in (')
select *from CF_RegVtas where NumDocAnulacion in (')

select fecha,fechanegocio,*  from CF_RegVtas where ExportadoFN ='015794' and exportadoPA ='
select fecha,fechanegocio,*  from CF_RegVtas where exportadoPA ='005611'
select *  from CF_RegVtas where referenciaFN in('161F061907')

select ExportadoPA,ReferenciaPA,ExportadoFN,referenciaFN,*  
--update CFM_RegVtas set numDoc ='0-01979'
from CFM_RegVtas where  chk_Num ='CFAREQUI000000025064' 

select ExportadoPA,ReferenciaPA,ExportadoFN,referenciaFN,*  
--update CF_RegVtas set numDoc ='0-01979'
from CF_RegVtas where  chk_Num ='CFAREQUI000000025064' 

CFAREQUI000000025064
select ExportadoPA,ReferenciaPA,ExportadoFN,referenciaFN,*  
--update CF_RegVtas set ExportadoFN ='',referenciaFN =''
-- delete 
from CF_RegVtas where  ExportadoFN ='004825'  and ruc ='8888888' and ExportadoPA =' and ruc ='8888888' and NumDoc < '1000000'
017157    
017816    
017817     



 
select ExportadoPA,ReferenciaPA,ExportadoFN,referenciaFN,*  
--update CF_RegVtas set ExportadoPA ='',ReferenciaPA =''
-- delete 
from CF_RegVtas where  ExportadoPA ='012502'  and exportadoPA <>'' and exportadoPA ='019583' and fechanegocio ='2013-12-27 00:00:00'
   
017538    
017957    
017958     

  
select ExportadoPA,ReferenciaPA,ExportadoFN,referenciaFN,fecha,fechanegocio,*  
--update CF_RegVtas set ExportadoPA ='018054'--,ReferenciaPA ='272B036167'
-- delete 
from CF_RegVtas where  ExportadoPA ='018056' 


select ExportadoPA,ReferenciaPA,ExportadoFN,referenciaFN,fecha,fechanegocio,*  
--update CFM_RegVtas set chk_num=''--ExportadoFN='',referenciaFN='',ExportadoPA ='',ReferenciaPA =''
--delete 
from CFM_RegVtas where chk_num ='LIM01CEN000000000081'  and  ExportadoFN='019836'


select ExportadoPA,ReferenciaPA,ExportadoFN,referenciaFN,fecha,fechanegocio,*  
--update CF_RegVtas set ReferenciaPA ='0220000375',referenciaFN ='0220000375'
-- delete 
from CF_RegVtas where  referenciaFN like '%B170000713'

                 
select *  from CFM_RegVtas where NumDoc like '%0000053%'
select *  from CF_RegVtas where NumDoc like '%0000053%' 

select *  from CFM_RegVtas where razonsocial1 like '%0006164%'
select *  from CF_RegVtas where razonsocial1 like '%0006164%' 

select *  from CFM_RegVtas where  ruc like '%70035508%' order by numdoc
select *  from CF_RegVtas where  ruc like '%70035508%' order by numdoc

select *  from CFM_RegVtas where NumTienda =  '14' and ruc like '%20341841357%' order by numdoc
select *  from CF_RegVtas where NumTienda =  '14' and ruc like '%20341841357%' order by numdoc
select *from ardoc where custid ='02810505'
select *from aradjust where custid ='02810505'

select *  from CFM_RegVtas where FechaNegocio ='20110204' and NumTienda =  '3' and NumDoc='20110204-01-0062159'

select *  from CF_RegVtas where FechaNegocio ='20101031' and NumTienda =  '6' and NumDoc='20100906-99-0005802'
select *  from CF_RegVtas where FechaNegocio ='20101105' and NumTienda =  '3' and NumDoc='20101105-01-0052598'

select *  from CFm_RegVtas where  chk_num='LIM01CEN000000033459' --NumTienda =  '6' and FechaNegocio ='20131014' and
select *  from CF_RegVtas where FechaNegocio ='20131014' and NumTienda =  '6' and chk_num='CFTARAPO000000054186'
CFJOCPLA000000000539
EMTRUJIL000000006486
EMTRUJIL000000006487
update CFm_RegVtas set  NumDoc='00-0184' from CFm_RegVtas where  chk_num='CFJOCPLA000000000539' --NumTienda =  '6' and FechaNegocio ='20131014' and
update CF_RegVtas set  NumDoc='00-0184' from CF_RegVtas where  chk_num='CFJOCPLA000000000539'-- FechaNegocio ='20131014' and NumTienda =  '6'
update CFm_RegVtas set  tipodoc='03' from CFm_RegVtas where  chk_num='LIM01CEN000000033459'
update CF_RegVtas set  user06=',referenciaFN ='161F-85170' from CF_RegVtas where  chk_num='CFAREQUI000000095377'

select fecha,fechanegocio,ExportadoFN,referenciaFN,ExportadoPA,referenciaPA,*  from CF_RegVtas where NumTienda =  '16' and fecha = '2013-12-21 00:00:00' order by NumDoc desc
select *  from CF_RegVtas where ExportadoFN ='013828'

select *  from CFM_RegVtas where  NumTienda =  '16' and  fecha ='2014-03-05'    and FechaNegocio='2014-03-05'  and chk_num in (select chk_num  from CF_RegVtas where ExportadoFN ='005280')
select *  from CF_RegVtas  where  NumTienda =  '16' and  fecha ='2014-03-05'    and FechaNegocio='2014-03-05'  and ExportadoFN ='005280'

select *from ardoc where batnbr in (select distinct ExportadoFN from CF_RegVtas where NumTienda ='30'and fecha ='2014-01-30' and FechaNegocio='2014-01-28'  )

update ardoc set  user8='2014-01-27'  from ardoc where batnbr in (select distinct  ExportadoFN 
from CF_RegVtas  where  NumTienda =  '30' and  fecha ='2014-01-27'    and FechaNegocio='2014-01-25'  )

update CFM_RegVtas set  fecha='2014-03-02'  from CFM_RegVtas 
where  NumTienda =  '16' and  fecha ='2014-03-05'    and FechaNegocio='2014-03-02'  and chk_num in (select chk_num  from CF_RegVtas where ExportadoFN ='005126')

update CF_RegVtas  set  fecha='2014-03-02'  from CF_RegVtas  
where  NumTienda =  '16' and  fecha ='2014-03-05'    and FechaNegocio='2014-03-02'  and ExportadoFN ='005126'

update CFM_RegVtas set  FechaNegocio='2014-06-27'  from CFM_RegVtas where chk_num ='CFVIVAND000000004580'
update CF_RegVtas  set   FechaNegocio='2014-06-27' from CF_RegVtas  where chk_num ='CFVIVAND000000004580'


SELECT *FROM ARDOC WHERE CUSTID ='44102628'
and fecha < '2013-11-29 00:00:00'

select fechanegocio,ExportadoFN,referenciaFN,*  from CF_RegVtas 
where ruc ='20504311342' and fecha >= '2014-03-01 00:00:00'


SELECT *
--update ardoc set user6 ='01'
FROM ARDOC WHERE refnbr ='080F000451' and user6 ='OD'

select fechanegocio,Fecha,*  from CFM_RegVtas where NumTienda='28'
select fechanegocio,Fecha,ExportadoFN,referenciaFN,*  from CF_RegVtas where NumTienda='28'

--compara temporal 1 (sin lotes) con temportal 2 (con lotes)
select * from CFM_RegVtas where  --NumTienda not in (36,37) --and 
Chk_Num not in (select Chk_Num from CF_RegVtas )

and fecha = '2014-11-04'
ui
--pendientes AR
select fechanegocio,ExportadoFN,referenciaFN,*  from CF_RegVtas 
where ExportadoFN ='' and fecha >= '2015-01-01 00:00:00'

-- pendintes Aplicaciones
select fecha,fechanegocio,ExportadoFN,referenciaFN,*  from CF_RegVtas 
where ExportadoPA ='' and fecha > '2015-01-01 00:00:00'   and user06 ='' and total <>0
order by CF_RegVtas.fecha

select *from (
select distinct numtienda,fechanegocio,(select distinct numtienda from CF_DetPago where numtienda = C.numtienda and convert(varchar, fechanegocio, 112)=C.fechanegocio ) a
from CFM_DetPago C
) x where a is  null
order by fechanegocio

select  convert(varchar, fechanegocio, 112),*from CF_DetPago where exportadotr ='' 


-- pendientes depositos
select *from CFM_DetPago2 where exportadotr =''
select *from CFM_DetPago2 where referencia like '%20080%'

update CFM_DetPago2 set exportadotr ='' from CFM_DetPago2 where exportadotr ='009392' 

--delete from CFM_DetPago2 where referencia like '%CAIQ%' and Exportadotr=''
--delete from CFM_DetPago2 where exportadotr =''

      
select Fecha,NumDoc,count(*)  from CF_RegVtas 
where ExportadoFN ='' --and fecha = '2013-11-20'
group by Fecha,NumDoc





select * from (
select NumTienda,NumDoc,count(*)a  from CF_RegVtas 
--where ExportadoFN =' --and fecha = '2013-11-20'
group by NumTienda,NumDoc
) X
where a>1


select NumTienda,NumDoc,*  from CF_RegVtas where NumDoc='20140118-01-0058286'

select *from CFM_DetPago2 where exportadotr =''
select *from CFM_DetPago2 where referencia like '%144950%'
select *from CFM_DetPago2 where chk_num ='CFAPIURA000000000975'
*/

/*

      208020 S Jug Melon16 21384 
      208066 B Jug Melon16 21386 
      
select *  from CFM_ResItem where FechaNegocio ='20120412' and NumTienda =  3 and MENUITEM_NUMBER ='208066'
UPDATE CFM_ResItem set NLU_NUMBER ='21386'  from CFM_ResItem where FechaNegocio ='20120412' and NumTienda =  3 
and MENUITEM_NUMBER ='208066'

*/
/*

Subtotal......s/.6.78

IGV.........s/. 1.22

Total........s/.8
update CFM_RegVtas set --NumDocAnulacion = '20120811-01-0131236'--,--null,--FechaNegocio ='20120316'
SubTotal= -17.78 ,igv= -3.20 ,total=-20.98
--RazonSocial1= null , ruc = null
where FechaNegocio ='20130412' and NumTienda =  '3' and NumDoc='20130412-01-0162790'


update CFM_DetPago set --NumDocAnulacion is null,--FechaNegocio ='20120316'
Total= 12 ,Totalpropina= 12 
--RazonSocial1= null , ruc = null
where FechaNegocio ='20120517' and chk_Num='6274' and NumTienda =  '6' and Total =7
*/
--select *from catran where batnbr in('005468','005467')        
--
--select *from batch where batnbr in('005468','005467') and module ='CA'    
-- 
----update batch  set BaseCuryID=' where batnbr='005467'and module ='CA'  
--select *from batch  where batnbr='005467' and module ='CA'  
--  
--select *from cf_tiendasite
--select * from CFM_RegVtas where FechaNegocio =@fech and NumTienda =  @tienda and NumDocAnulacion is not null
--order by NumDoc


