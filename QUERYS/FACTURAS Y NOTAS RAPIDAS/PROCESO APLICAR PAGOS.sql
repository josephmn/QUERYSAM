select ExportadoPA, ReferenciaPA,ExportadoFN,ReferenciaFN from CF_RegVtas where NumTienda =  '33'
  and  cast(FechaNegocio as smalldatetime) =  '10/20/2015'   AND ExportadoFN<>'' 

select distinct ExportadoPA, ExportadoFN from CF_RegVtas where NumTienda =  '33' 
 and  cast(FechaNegocio as smalldatetime) =  '10/20/2015'   AND ExportadoFN<>''


----------------observado----------------------
select Rlsed,status from batch where module ='AR' and  Rlsed<>1 and status not in ('C','U','P') 
and batNbr= '030113' 
---------------------------------------------- 



select status,rlsed,* from batch

select Rlsed,status from batch where module ='CA' and  Rlsed<>1 and status not in ('C','U','P') and batNbr= '' 


select Rlsed,status from batch where module ='AR' and  Rlsed<>1 and status not in ('C','U','P') and batNbr= '030265' 

select Rlsed,status from batch where module ='CA' and  Rlsed<>1 and status not in ('C','U','P') and batNbr= '' 


select Rlsed,status from batch where module ='AR' and  Rlsed<>1 and status not in ('C','U','P') and batNbr= '030114' 

select Rlsed,status from batch where module ='CA' and  Rlsed<>1 and status not in ('C','U','P') and batNbr= '030158' 

select * from batch where module ='CA' and  batNbr= '030158' 

select distinct FechaNegocio as Fecha  from CF_RegVtas where NumTienda =  '33'  and  cast(FechaNegocio as smalldatetime) =  '10/20/2015'  and ExportadoFN<>'' AND  ReferenciaFN <>'' AND  ExportadoPA ='' AND  ReferenciaPA ='' AND USER06='NOPAGO' AND  NumTienda <> '99' 


select distinct left(curyId,3) FROM CF_RVLotesPPagoNC CF_RVLotesPPago 
INNER JOIN ARDoc ON CF_RVLotesPPago.ExportadoFN = ARDoc.BatNbr AND CF_RVLotesPPago.ReferenciaFN = ARDoc.RefNbr  
where ardoc.rlsed=1 and NumTienda <> '99' and ardoc.docbal >0 and CF_RVLotesPPago.NumTienda =  '33' 
 and  cast(ardoc.user8 as smalldatetime) =  '10/20/2015' 


select *  from CF_RVLotesPPagoNC where exportadofn ='030113'

select *  from ardoc where  cast(user8 as smalldatetime) =  '10/20/2015' 

select  ardoc.* FROM CF_RVLotesPPagoNC  CF_RVLotesPPago 
INNER JOIN ARDoc ON CF_RVLotesPPago.ExportadoFN = ARDoc.BatNbr 
AND CF_RVLotesPPago.ReferenciaFN = ARDoc.RefNbr  where ardoc.rlsed=1  
and user6 ='07' and applbatnbr = '' and NumTienda <> '99' and ardoc.docbal >0
 and CF_RVLotesPPago.NumTienda =  '33'  and  cast(ardoc.user8 as smalldatetime) =  '10/20/2015'  AND curyId=  '' 


select * from  CF_RVLotesPPagoNC where numtienda  ='33' and fechanegocio ='2015-10-20'






select  * from CF_RVLotesPPago where numtienda  ='33' and fechanegocio='2015-10-20'

select distinct left(curyId,3) FROM CF_RVLotesPPago 
INNER JOIN ARDoc ON CF_RVLotesPPago.ExportadoFN = ARDoc.BatNbr AND
 CF_RVLotesPPago.ReferenciaFN = ARDoc.RefNbr  where ardoc.rlsed=1 and 
NumTienda <> '99' and CF_RVLotesPPago.NumTienda =  '33'
  and  ardoc.user8 = '2015-10-20'


select * from ardoc where batnbr ='030113' and user8='2015-10-20'

select ardoc.* FROM CF_RVLotesPPago INNER JOIN ARDoc ON 
CF_RVLotesPPago.ExportadoFN = ARDoc.BatNbr AND CF_RVLotesPPago.ReferenciaFN = ARDoc.RefNbr
  where ardoc.rlsed=1 and NumTienda <> '99'  and CF_RVLotesPPago.NumTienda =  '33' 
 and  cast(ardoc.user8 as smalldatetime) =  '10/20/2015'  AND curyId=  '' 


select*  from ardoc where batnbr ='030113' and docbal >0




select  ardoc.* FROM CF_RVLotesPPagoNC  CF_RVLotesPPago
 INNER JOIN ARDoc ON CF_RVLotesPPago.ExportadoFN = ARDoc.BatNbr
 AND CF_RVLotesPPago.ReferenciaFN = ARDoc.RefNbr  where ardoc.rlsed=1  
and user6 ='07' and applbatnbr = '' and NumTienda <> '99' and ardoc.docbal >0 
and CF_RVLotesPPago.NumTienda =  '33' 
 and  cast(ardoc.user8 as smalldatetime) =  '10/20/2015'  AND curyId=  '' 


select*  from ardoc where batnbr ='030113' and user6 <>'07'


select distinct FechaNegocio as Fecha  from CF_RegVtas where NumTienda =  '33'  and  cast(FechaNegocio as smalldatetime) =  '10/20/2015'  and ExportadoFN<>'' AND  ReferenciaFN <>'' AND  ExportadoPA ='' AND USER06<>'NOPAGO'AND  ReferenciaPA =''  AND  NumTienda <> '99' 


select* 

select ardoc.* FROM CF_RVLotesPPago 
INNER JOIN ARDoc ON CF_RVLotesPPago.ExportadoFN = ARDoc.BatNbr 
AND CF_RVLotesPPago.ReferenciaFN = ARDoc.RefNbr  where ardoc.rlsed=1 and NumTienda <> '99'
and CF_RVLotesPPago.NumTienda =  '33'  and  cast(ardoc.user8 as smalldatetime) =  '10/20/2015'  AND curyId=  '' 




select*  from ardoc where docbal >0

select ardoc.* FROM CF_RVLotesPPago INNER JOIN ARDoc ON CF_RVLotesPPago.ExportadoFN = ARDoc.BatNbr AND CF_RVLotesPPago.ReferenciaFN = ARDoc.RefNbr  where ardoc.rlsed=1 and NumTienda <> '99' and CF_RVLotesPPago.NumTienda =  '33'  and  cast(ardoc.user8 as smalldatetime) =  '10/20/2015'  
select * from CF_TiendaSite where  NumTienda =  '33' 
