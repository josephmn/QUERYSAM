
sp_helptext cronoPagofechas




ALTER view cronoPagofechas 
as      
--select  '2018-04-15 00:00:00' fecha26A ,'2018-04-26 00:00:00' fecha6 ,'2018-04-30 00:00:00' fecha15,'2018-05-06 00:00:00' fecha26,'2018-05-15 00:00:00'fecha30         
--select  '2018-12-26 00:00:00' fecha26A ,'2019-01-06 00:00:00' fecha6 ,'2019-01-15 00:00:00' fecha15,'2019-01-26 00:00:00' fecha26,'2019-01-31 00:00:00' fecha30     
select  '2019-04-26 00:00:00' fecha26A ,'2019-05-06 00:00:00' fecha6 ,'2019-05-15 00:00:00' fecha15,'2019-05-26 00:00:00' fecha26,'2019-05-31 00:00:00' fecha30 



select * from VS_CronogramaPagoSemanas where invcnbr  like'%131'

select * from VS_CronogramaPagoSemanas WHERE VENDID = '20556111651' AND INVCNBR = '0000001914'

SELECT * FROM VS_CronogramaPagoSemanas WHERE batnbr IN ('008779','009575','008767')


/*************************************************************************************/

alter  VIEW [dbo].[VS_CronogramaPagoSemanas]  
AS  
select 'Reembolso caja chica' Concepto ,1 Orden ,'01' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate <= fecha6 and  VendId in ('44444444','12121212','22222222','66666666','23232323')  
union all  
select 'Reembolso caja chica' Concepto ,1 Orden ,'OT' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate > fecha6 and  VendId in ('44444444','12121212','22222222','66666666','23232323')  

union all  
select 'Viaticos' Concepto ,2 Orden ,'01' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate <= fecha6 and  VendId in ('19936035','19992444','17521042','16766003','29638655','41639317','44107903','40053619','42622439','43876994','42150338')  
union all  
select 'Viaticos' Concepto ,2 Orden ,'OT' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate > fecha6 and  VendId in ('19936035','19992444','17521042','16766003','29638655','41639317','44107903','40053619','42622439','43876994','42150338')  

union all  
select 'Servicio de seguridad' Concepto ,4 Orden ,'01' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate <= fecha6 and  Acct IN('959301','949301')  
union all  
select 'Servicio de seguridad' Concepto ,4 Orden ,'OT' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate > fecha6 and  Acct IN('959301','949301')  

union all  
select 'Servicios degustacion' Concepto ,5 Orden ,'01' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate <= fecha6 and  Acct IN('957106','957101') and batnbr not in ('000737','006334','006097')  
union all  
select 'Servicios degustacion' Concepto ,5 Orden ,'OT' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate > fecha6 and  Acct IN('957106','957101') and batnbr not in ('000737','006334','006097')  
union all  

select 'Servicios  Publicidad' Concepto ,6 Orden ,'01' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate <= fecha6 and  Acct IN('957104','957111','957109')  AND batnbr NOT IN ('003295')
union all  
select 'Servicios  Publicidad' Concepto ,6 Orden ,'OT' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate > fecha6 and  Acct IN('957104','957111','957109')  

union all   
select 'Servicios  Publicidad' Concepto ,6 Orden ,'01' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate <= fecha6 --and  Acct IN('957104','957111')  
and VendId   in ('20107099892','20306302621','20466806774','20479381390')  

union all  
select 'Servicios  Publicidad' Concepto ,6 Orden ,'OT' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate > fecha6 --and  Acct IN('957104','957111')  
and VendId   in ('20107099892','20306302621','20466806774','20479381390','20556111651')  
  
union all  
select 'Asesoria (financiera, legal y negocios)' Concepto ,7 Orden ,'01' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate <= fecha6 and  Acct IN('942101','942102','957112')  

union all  
select 'Asesoria (financiera, legal y negocios)' Concepto ,7 Orden ,'OT' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate > fecha6 and  Acct IN('942101','942102','957112')  
--union all  
--select 'Degustacion (apoyo e impulso)' Concepto ,8 Orden ,'01' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate <= fecha6 and  Acct IN('957106')  
--union all  
--select 'Degustacion (apoyo e impulso)' Concepto ,8 Orden ,'OT' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate > fecha6 and  Acct IN('957106')  
union all  
select 'Senati' Concepto ,9 Orden ,'01' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate <= fecha6 and  Acct IN('945001','955001','915001')   
union all  
select 'Senati' Concepto ,9 Orden ,'OT' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate > fecha6 and  Acct IN('945001','955001','915001')   
--union all  
--select 'Retenciones Judiciales (personal)' Concepto ,10 Orden ,'01' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate <= fecha6 and  Acct like '41%' AND invcnbr not like '%LIQ%'  
--union all  
--select 'Retenciones Judiciales (personal)' Concepto ,10 Orden ,'OT' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate > fecha6 and  Acct like '41%'  AND invcnbr not like '%LIQ%'  
union all  
select 'Inversiones y Plan de compras (ACTIVOS FIJOS)' Concepto ,11 Orden ,'01' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate <= fecha6 and  (Acct like '33%' OR Acct like '34%' OR Acct in ('954102') )   
union all  
select 'Inversiones y Plan de compras (ACTIVOS FIJOS)' Concepto ,11 Orden ,'OT' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate > fecha6 and  (Acct like '33%' OR Acct like '34%'  OR Acct in ('954102') )   
union all  
select 'Fletes transportistas' Concepto ,12 Orden ,'00' Semana,*from vs_SaldoDoc , cronoPagofechas where   duedate <= fecha26A and  (Acct IN('951110','951113','911113','911110')  or ( Acct like '43%' and vendid in ('20174513245','20418220822')))  
union all  
select 'Fletes transportistas' Concepto ,12 Orden ,'02' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate <= fecha15 and  duedate > fecha26A and  ( Acct IN('951110','951113','911113','911110') or ( Acct like '43%' and vendid in ('20174513245','20418220822')))  

union all  
select 'Fletes transportistas' Concepto ,12 Orden ,'03' Semana,*from vs_SaldoDoc , cronoPagofechas where duedate > fecha15 and  duedate <= fecha26 and  (Acct IN('951110','951113','911113','911110')  or ( Acct like '43%' and vendid in ('20174513245','20418220822')))  
union all  
select 'Fletes transportistas' Concepto ,12 Orden ,'OT' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate > fecha26 and ( Acct IN('951110','951113','911113','911110') or ( Acct like '43%' and vendid in ('20174513245','20418220822')))  
union all  
select 'Compra exterior - materia prima ' Concepto ,13 Orden ,'02' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate <= fecha15  and    BatNbr in ( Select BatNbr from APTran where Acct like '42%') AND   
VendId  IN ('20100000024','20100000041','20100000095','20100000099','20100000105')  

union all  

select 'Compra exterior - materia prima ' Concepto ,13 Orden ,'04' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate > fecha15 /*and  duedate <= fecha30*/ and  BatNbr in ( Select BatNbr from APTran where Acct like '42%') AND VendId  IN ('20100000024', 
'20100000041','20100000095','20100000099','20100000105')  
union all 
 
select 'Compra exterior - materia prima ' Concepto ,13 Orden ,'OT' Semana,*from vs_SaldoDoc , cronoPagofechas where  /*duedate > fecha30 and */   BatNbr in ( Select BatNbr from APTran where Acct like '42%') AND   
VendId  IN ('20100000041','20100000095','20100000099','20100000105') 



union all  
select 'Compra exterior - materia prima + Impuestos aduaneros' Concepto ,13 Orden ,'02' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate <= fecha15  and    BatNbr in ( Select BatNbr from APTran where Acct like '42%') AND VendId  IN ('20102027010'





)  
union all  
select 'Compra exterior - materia prima + Impuestos aduaneros' Concepto ,13 Orden ,'04' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate > fecha15 and /* duedate <= fecha30 and */ BatNbr in ( Select BatNbr from APTran where Acct like '42%')
AND VendId  IN ('20102027010')  

union all  
select 'Compra exterior - materia prima + Impuestos aduaneros' Concepto ,13 Orden ,'OT' Semana,*from vs_SaldoDoc , cronoPagofechas where  /*duedate > fecha30 and */   BatNbr in ( Select BatNbr from APTran where Acct like '42%') AND VendId  IN ('20102027010') 
 
 
 
union all  
select 'Liquidacion de beneficios sociales' Concepto ,15 Orden ,'02' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate <= fecha15  and  Acct like '41%' AND invcnbr  like '%LIQ%'  
union all  
select 'Liquidacion de beneficios sociales' Concepto ,15 Orden ,'04' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate > fecha15 /*and  duedate <= fecha30 */and Acct like '41%' AND invcnbr  like '%LIQ%'  
union all  
select 'Liquidacion de beneficios sociales' Concepto ,15 Orden ,'OT' Semana,*from vs_SaldoDoc , cronoPagofechas where /* duedate > fecha30 and*/  Acct like '41%' AND invcnbr  like '%LIQ%'  
union all  
select 'Servicio courier' Concepto ,16 Orden ,'02' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate <=  fecha15 and Acct IN( '941201','951201')   
union all  
select 'Servicio courier' Concepto ,16 Orden ,'OT' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate > fecha15 and  Acct IN( '941201','951201')   
union all  
select 'Servicios publicos (agua, Luz, telefonos, internet, otros)' Concepto ,17 Orden ,'00' Semana,*from vs_SaldoDoc , cronoPagofechas   
where  duedate <=  fecha26A and ((Acct IN( '946301','956301','946101','956101','946401','956401','946501','956501','916101','916301','916401','916501') and   VendId not in ('44444444','12121212','22222222','66666666','23232323'))  
 or  (Acct like '42%' and invcnbr like '45359864')  or  ( vendid = '20100017491' and duedate >=  '2018-01-01 00:00:00.000' ))  
union all  
select 'Servicios publicos (agua, Luz, telefonos, internet, otros)' Concepto ,17 Orden ,'03' Semana,*from vs_SaldoDoc , cronoPagofechas   
where  duedate <=  fecha26 and  duedate >  fecha26A and ((Acct IN( '946301','956301','946101','956101','946401','956401','946501','956501','916101','916301','916401','916501') and   VendId not in ('44444444','12121212','22222222','66666666','23232323')) 







 or  (Acct like '42%' and invcnbr like '45359864')  or  ( vendid = '20100017491' and duedate >=  '2018-01-01 00:00:00.000'  ))  

union all  
select 'Servicios publicos (agua, Luz, telefonos, internet, otros)' Concepto ,17 Orden ,'OT' Semana,*from vs_SaldoDoc , cronoPagofechas   
where  duedate > fecha26 and ((Acct IN( '946301','956301','946101','956101','946401','956401','946501','956501','916101','916301','916401','916501') and   VendId not in ('44444444','12121212','22222222','66666666','23232323'))  
 or  (Acct like '42%' and invcnbr like '45359864')  or  ( vendid = '20100017491'  and duedate >=  '2018-01-01 00:00:00.000' ))  
 union all
 
   
select 'Compra insumos (nacionales)' Concepto ,18 Orden ,'00' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate <=  fecha26A and  ( Acct like '60%' or Acct in( '946001','956001','913102')) AND 
VendId NOT IN ('20100000024','20100000041','20100000095','20100000099','20100000105','20102027010','20377832699')  and batnbr not in ('003797')
union all  
select 'Compra insumos (nacionales)' Concepto ,18 Orden ,'03' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate <=  fecha26 and duedate >  fecha26A and duedate >  fecha26A and  ( Acct like '60%' or Acct in( '946001','956001','913102')) AND VendId 

NOT IN ('20100000024','20100000041','20100000095','20100000099','20100000105','20102027010')  --AND  VendId = '20108475081'
union all  
select 'Compra insumos (nacionales)' Concepto ,18 Orden ,'OT' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate > fecha26 and --VendId = '20108475081'  
( Acct like '60%' or Acct in( '946001','956001','913102')) AND VendId NOT IN ('20100000024','20100000041','20100000095','20100000099','20100000105','20102027010')   and batnbr not in ('003797')
UNION ALL
select 'Compra insumos (nacionales)' Concepto ,18 Orden ,'OT' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate > fecha26 AND Acct = '421213' AND VendId = '20108475081'  --AND batnbr = '008779'

union all  
select 'Alquileres locales / otros' Concepto ,19 Orden ,'00' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate <=  fecha26A and Acct IN(  '945201','955201','915201','945104','955104','915104')   and VendId not in ('20100000024    ','20552504641    ') and batnbr not in ('006429')
union all  

select 'Alquileres locales / otros' Concepto ,19 Orden ,'03' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate <=  fecha26 and  duedate >  fecha26A and Acct IN(  '945201','955201','915201','945104','955104','915104')  and VendId not in ('20100000024    ','20552504641    ') and batnbr not in ('006429')
union all  
select 'Alquileres locales / otros' Concepto ,19 Orden ,'OT' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate > fecha26 and  Acct IN(  '945201','955201','915201','945104','955104','915104')  and VendId  not in ('20100000024    ','20552504641    '
)  and batnbr not in ('006429')
union all  
select 'Combustible' Concepto ,20 Orden ,'00' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate <=  fecha26A  and Acct IN( '916106','956106','916201')  
union all  
select 'Combustible' Concepto ,20 Orden ,'03' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate <=  fecha26 and duedate >  fecha26A and Acct IN( '916106','956106','916201')  
union all  
select 'Combustible' Concepto ,20 Orden ,'OT' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate > fecha26 and  Acct IN( '916106','956106','916201')  
union all  
select 'Seguros( Sctr Salud, persión , rimac seguros' Concepto ,21 Orden ,'02' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate <=  fecha15 and Acct IN( '957301','947301','917301','941105','951105')  
union all  
select 'Seguros( Sctr Salud, persión , rimac seguros' Concepto ,21 Orden ,'OT' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate > fecha15 and  Acct IN( '957301','947301','917301','941105','951105')  
union all  
select 'Vales de consumo (cuota venta distribuidores  )' Concepto ,22 Orden ,'01' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate <=  fecha6 and Acct IN( '957110') and batnbr not in ('000737','005506','006623')  
union all  
select 'Vales de consumo (cuota venta distribuidores  )' Concepto ,22 Orden ,'OT' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate > fecha6 and  Acct IN( '957110') and batnbr not in ('000737','005506','006623')  
union all  
select 'Servicios de Empacado (ALEMSA)' Concepto ,23 Orden ,'04' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate <=  fecha30 and Acct IN( '919403')  
union all  
select 'Servicios de Empacado (ALEMSA)' Concepto ,23 Orden ,'OT' Semana,*from vs_SaldoDoc , cronoPagofechas where  duedate > fecha30 and  Acct IN( '919403')  
union all  
select 'Haberes del personal' Concepto ,24 Orden ,'04' Semana,*from vs_SaldoDoc , cronoPagofechas where  /*duedate <=  fecha30 and */(Acct like '41%' )  AND invcnbr not like '%LIQ%'  
union all  
select 'Haberes del personal' Concepto ,24 Orden ,'OT' Semana,*from vs_SaldoDoc , cronoPagofechas where  /*duedate > fecha30 and  */(Acct like '41%' )  AND invcnbr not like '%LIQ%'  
  /*
union all  
--  
  
  
select 'Reembolso caja chica' Concepto ,1 Orden ,'01' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate <= fecha6 and  VendId in ('44444444','12121212','22222222','66666666','23232323')  
union all  
select 'Reembolso caja chica' Concepto ,1 Orden ,'OT' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate > fecha6 and  VendId in ('44444444','12121212','22222222','66666666','23232323')  
union all  
select 'Viaticos' Concepto ,2 Orden ,'01' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate <= fecha6 and  VendId in ('19936035','19992444','17521042','16766003','29638655','41639317','44107903','40053619','42622439','43876994','42150338')  








union all  
select 'Viaticos' Concepto ,2 Orden ,'OT' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate > fecha6 and  VendId in ('19936035','19992444','17521042','16766003','29638655','41639317','44107903','40053619','42622439','43876994','42150338')  
union all  
select 'Servicio de seguridad' Concepto ,4 Orden ,'01' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate <= fecha6 and  Acct IN('959301','949301')  
union all  
select 'Servicio de seguridad' Concepto ,4 Orden ,'OT' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate > fecha6 and  Acct IN('959301','949301')  
union all  
select 'Servicios degustacion' Concepto ,5 Orden ,'01' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate <= fecha6 and  Acct IN('957106') and batnbr not in ('000737')  
union all  
select 'Servicios degustacion' Concepto ,5 Orden ,'OT' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate > fecha6 and  Acct IN('957106') and batnbr not in ('000737')  
union all  
select 'Servicios  Publicidad' Concepto ,6 Orden ,'01' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate <= fecha6 and  Acct IN('957104')  
union all  
select 'Servicios  Publicidad' Concepto ,6 Orden ,'OT' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate > fecha6 and  Acct IN('957104')  
union all  
select 'Asesoria (financiera, legal y negocios)' Concepto ,7 Orden ,'01' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate <= fecha6 and  Acct IN('942101','942102')  
union all  
select 'Asesoria (financiera, legal y negocios)' Concepto ,7 Orden ,'OT' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate > fecha6 and  Acct IN('942101','942102')  
--union all  
--select 'Degustacion (apoyo e impulso)' Concepto ,8 Orden ,'01' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate <= fecha6 and  Acct IN('957106')  
--union all  
--select 'Degustacion (apoyo e impulso)' Concepto ,8 Orden ,'OT' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate > fecha6 and  Acct IN('957106')  
union all  
select 'Senati' Concepto ,9 Orden ,'01' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate <= fecha6 and  Acct IN('945001','955001','915001')   
union all  
select 'Senati' Concepto ,9 Orden ,'OT' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate > fecha6 and  Acct IN('945001','955001','915001')   
--union all  
--select 'Retenciones Judiciales (personal)' Concepto ,10 Orden ,'01' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate <= fecha6 and  Acct like '41%'   
--union all  
--select 'Retenciones Judiciales (personal)' Concepto ,10 Orden ,'OT' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate > fecha6 and  Acct like '41%'   
union all  
select 'Inversiones y Plan de compras (ACTIVOS FIJOS)' Concepto ,11 Orden ,'01' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate <= fecha6 and  (Acct like '33%' OR Acct like '34%'  )   
union all  
select 'Inversiones y Plan de compras (ACTIVOS FIJOS)' Concepto ,11 Orden ,'OT' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate > fecha6 and  (Acct like '33%' OR Acct like '34%'  )   
union all  
select 'Fletes transportistas' Concepto ,12 Orden ,'00' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where   duedate <= fecha26A and ( Acct IN('951110','951113','911113','911110')  or ( Acct like '43%' and vendid in ('20174513245','20418220822')))  

------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------



union all  
select 'Fletes transportistas' Concepto ,12 Orden ,'02' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate <= fecha15 and   duedate > fecha26A and ( Acct IN('951110','951113','911113','911110') or ( Acct like '43%' and vendid in ('20174513245',


'20418220822')
  
))  
union all  
select 'Fletes transportistas' Concepto ,12 Orden ,'03' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where duedate > fecha15 and  duedate <= fecha26 and ( Acct IN('951110','951113','911113','911110')  or ( Acct like '43%' and vendid in ('20174513245','2


0418220822')))


union all  
select 'Fletes transportistas' Concepto ,12 Orden ,'OT' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate > fecha26 and ( Acct IN('951110','951113','911113','911110') or ( Acct like '43%' and vendid in ('20174513245','20418220822')))  
union all  
select 'Compra exterior - materia prima + Impuestos aduaneros' Concepto ,13 Orden ,'02' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate <= fecha15  and    BatNbr in ( Select BatNbr from APTran where Acct like '60%') AND   
VendId NOT IN ('20100000024','20100000041','20100000095','20100000099','20100000105')  
union all  
select 'Compra exterior - materia prima + Impuestos aduaneros' Concepto ,13 Orden ,'04' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate > fecha15/* and  duedate <= fecha30 */and  BatNbr in ( Select BatNbr from APTran where Acct like '60%') A


ND   
VendId NOT IN ('20100000024','20100000041','20100000095','20100000099','20100000105')  

union all  
select 'Compra exterior - materia prima + Impuestos aduaneros' Concepto ,13 Orden ,'OT' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where /*  duedate > fecha30 and */ BatNbr in ( Select BatNbr from APTran where Acct like '60%') AND   
VendId NOT IN ('20100000024','20100000041','20100000095','20100000099','20100000105')  
union all  
select 'Liquidacion de beneficios sociales' Concepto ,15 Orden ,'02' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate <= fecha15  and  Acct like '41%' AND invcnbr  like '%LIQ%'  
union all  
select 'Liquidacion de beneficios sociales' Concepto ,15 Orden ,'04' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate > fecha15 and  /*duedate <= fecha30 and*/ Acct like '41%' AND invcnbr  like '%LIQ%'  
union all  
select 'Liquidacion de beneficios sociales' Concepto ,15 Orden ,'OT' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where /* duedate > fecha30 and*/  Acct like '41%' AND invcnbr  like '%LIQ%'  
union all  
select 'Servicio courier' Concepto ,16 Orden ,'02' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate <=  fecha15 and Acct IN( '941201','951201')   
union all  
select 'Servicio courier' Concepto ,16 Orden ,'OT' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate > fecha15 and  Acct IN( '941201','951201')   
union all  
select 'Servicios publicos (agua, Luz, telefonos, internet, otros)' Concepto ,17 Orden ,'00' Semana,*from vs_SaldoDoc2016 , cronoPagofechas   
where  duedate <=  fecha26A and Acct IN( '946301','956301','946101','956101','946401','956401','946501','956501','916101','916301','916401','916501') and   VendId not in ('44444444','12121212','22222222','66666666','23232323')  
  
  --------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------
  
  
  
union all  
select 'Servicios publicos (agua, Luz, telefonos, internet, otros)' Concepto ,17 Orden ,'03' Semana,*from vs_SaldoDoc2016 , cronoPagofechas   
where  duedate <=  fecha26 and   duedate >  fecha26A and  Acct IN( '946301','956301','946101','956101','946401','956401','946501','956501','916101','916301','916401','916501') and   VendId not in ('44444444','12121212','22222222','66666666','23232323')  






union all  
select 'Servicios publicos (agua, Luz, telefonos, internet, otros)' Concepto ,17 Orden ,'OT' Semana,*from vs_SaldoDoc2016 , cronoPagofechas   
where  duedate > fecha26 and  Acct IN( '946301','956301','946101','956101','946401','956401','946501','956501','916101','916301','916401','916501') and   VendId not in ('44444444','12121212','22222222','66666666','23232323')  
union all  
select 'Compra insumos (nacionales)' Concepto ,18 Orden ,'00' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate <=  fecha26A and Acct  IN( '604101','602101')  
union all  
select 'Compra insumos (nacionales)' Concepto ,18 Orden ,'03' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate <=  fecha26 and duedate > fecha26A and Acct  IN( '604101','602101')  
union all  
select 'Compra insumos (nacionales)' Concepto ,18 Orden ,'OT' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate > fecha26 and  Acct  IN( '604101','602101')  
union all  
select 'Alquileres locales / otros' Concepto ,19 Orden ,'00' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate <=  fecha26A and Acct IN(  '945201','955201','915201')  
union all  
select 'Alquileres locales / otros' Concepto ,19 Orden ,'03' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate <=  fecha26 and  duedate >  fecha26A and Acct IN(  '945201','955201','915201')  
union all  
select 'Alquileres locales / otros' Concepto ,19 Orden ,'OT' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate > fecha26 and  Acct IN(  '945201','955201','915201')  
union all  
select 'Combustible' Concepto ,20 Orden ,'03' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate <=  fecha26A and Acct IN( '916106')  
union all  
select 'Combustible' Concepto ,20 Orden ,'03' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate <=  fecha26 and  duedate >  fecha26A and Acct IN( '916106')  
union all  
select 'Combustible' Concepto ,20 Orden ,'OT' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate > fecha26 and  Acct IN( '916106')  
union all  
select 'Seguros( Sctr Salud, persión , rimac seguros' Concepto ,21 Orden ,'02' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate <=  fecha15 and Acct IN( '957301','947301','917301','941105','951105')  
and vendid not in ('20492497721','20458068471')  



--==========================================



union all  
select 'VENCIDOS 2016 – OBSERVADOS' Concepto ,21 Orden ,'OT' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  /*duedate <=  fecha30 and*/ Acct IN( '957301','947301','917301','941105','951105')  
and vendid in ('20492497721','20458068471')  
union all  
select 'Seguros( Sctr Salud, persión , rimac seguros' Concepto ,21 Orden ,'OT' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate > fecha15 and  Acct IN( '957301','947301','917301','941105','951105')  
union all  
select 'Vales de consumo (cuota venta distribuidores  )' Concepto ,22 Orden ,'01' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate <=  fecha6 and Acct IN( '957110') and batnbr not in ('000737')  
union all  
select 'Vales de consumo (cuota venta distribuidores  )' Concepto ,22 Orden ,'OT' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  duedate > fecha6 and  Acct IN( '957110') and batnbr not in ('000737')  
union all  
select 'Servicios de Empacado (ALEMSA)' Concepto ,23 Orden ,'04' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where  /*duedate <=  fecha30 and*/ Acct IN( '919403')  
union all  
select 'Servicios de Empacado (ALEMSA)' Concepto ,23 Orden ,'OT' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where /* duedate > fecha30 and*/ Acct IN( '919403')  
union all  
select 'Haberes del personal' Concepto ,24 Orden ,'04' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where /* duedate <=  fecha30 and */(Acct like '41%' )  AND invcnbr not like '%LIQ%'  
union all  
select 'Haberes del personal' Concepto ,24 Orden ,'OT' Semana,*from vs_SaldoDoc2016 , cronoPagofechas where /* duedate > fecha30 and  */(Acct like '41%' )  AND invcnbr not like '%LIQ%'  
*/

