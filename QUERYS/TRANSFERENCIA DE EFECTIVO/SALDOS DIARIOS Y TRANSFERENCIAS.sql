
-----------------------------------INVICTUS---------------------------

--select * from CF_DetPago where NumTienda =  '8'
--
--and  cast(FechaNegocio as smalldatetime) =  '06/22/2015'  and Tipo IN   ('MASTERCARD','VISA')
--
--select * from catran where trandate ='2015-06-22' and banksub  ='caiqcaf000'
--
--select * from gltran where module ='ca' and  trandate ='2015-06-22' and sub ='caiqcaf000'
select NumTienda,cast(FechaNegocio as smalldatetime)as FechaNegocio,TIPO,Total,ExportadoTr  from CFM_DetPagoTipo 
where NumTienda =  '18'  and  (FechaNegocio) =  '20150704' 

select * from cfm_detpago2 where referencia='EXT197931'

-- EXTRAIGO LOTE  VISA--
SELECT * FROM CATRAN WHERE REFNBR ='VISA' AND TRANDATE ='2015-06-23' AND BANKSUB ='CAIQCAF000'
-- EXTRAIGO LOTE MASTERCARD
SELECT * FROM CATRAN WHERE REFNBR ='MASTERCARD' AND TRANDATE ='2015-06-19' AND BANKSUB ='CAIQCAF000'


023806

select * from cfm_detpago2 where referencia='3635'

update cfm_detpago2 set Exportadotr='' where Exportadotr='023806' and referencia='EXT197931'

SELECT PerPost,posted,* FROM GLTRAN WHERE BATNBR='026782' AND MODULE  ='CA' -- BIEN 

SELECT PerPost,posted,* FROM GLTRAN WHERE BATNBR='028596' AND MODULE  ='CA' --MAL

           


UPDATE GLTran  SET Crtd_Prog ='20020', Crtd_User ='MFSERCAN' , LUpd_Prog  ='20020',LUpd_User ='MFSERCAN' WHERE BatNbr  ='028595' AND Module  ='CA'

Crtd_Prog
20020   

028593    
          
          LUpd_User
MFSERCAN  
---SE VERIFICA TRANSFERENCIA EN BATCH,CATRAN,GLTRAN (MASTERCARD)
SELECT status,rlsed,PerPost,* FROM BATCH WHERE BATNBR ='028593' AND MODULE ='CA'
SELECT PerPost,refnbr,tranamt,curytranamt,refnbr,trandate,* FROM CATRAN WHERE BATNBR='028593' --AND REFNBR ='VISA'
SELECT PerPost,posted,* FROM GLTRAN WHERE BATNBR='028593' AND MODULE  ='CA'



delete from CATRAN where BATNBR='023806' and refnbr='EXT197931'
delete from gltran wHERE BATNBR='023806' AND MODULE  ='CA' and refnbr='EXT197931' 


update gltran set Crtd_Prog  ='20020' ,LUpd_Prog ='MFSERCAN' where BatNbr  ='026782' and Module  ='CA'

Crtd_Prog
        

update CATRAN SET  trandate  ='2016-09-21' where batnbr  ='001622'
update gltran  SET TRANDATE ='2016-09-21' , AppliedDate  = '2016-09-21' where batnbr  ='001622' and module  ='CA'





SELECT '--------------------------- '
SELECT status,rlsed,* FROM BATCH WHERE BATNBR ='027792' AND MODULE ='CA'
SELECT * FROM CATRAN WHERE BATNBR='027792' --AND REFNBR ='VISA'
SELECT posted,* FROM GLTRAN WHERE BATNBR='027792' AND MODULE  ='CA'


SELECT status,rlsed,* FROM BATCH WHERE BATNBR ='027792' AND MODULE ='CA'
SELECT tranamt,curytranamt,refnbr,trandate,* FROM CATRAN WHERE CuryID='DOL' AND batnbr='000483' ---BATNBR='018415' --/AND REFNBR ='VISA'
SELECT posted,* FROM GLTRAN WHERE BATNBR='000483' AND MODULE  ='CA'












SELECT status,rlsed ,* FROM BATCH WHERE BATNBR ='013634' AND MODULE ='CA'
SELECT rlsed,* FROM CATRAN WHERE BATNBR='013634' --AND REFNBR ='VISA'
SELECT rlsed,* FROM GLTRAN WHERE BATNBR='013634' AND MODULE  ='CA'

005541
005541

update catran set 
acct ='101000', --CUENTA RE REGISTRO
bankacct ='101000',-- CUENTA DE REGISTRO
banksub = 'CAPUEMB000',-- CENTRO DE COSTO DEL LOCAL
sub ='CAPUEMB000'-- CENTRO DE C0STO DEL LOCAL
where batnbr = '005541' and acct ='103101' --CUENTA DE CAMBIO


update gltran set
acct ='101000', -- CUENTA DE REGISTRO
sub ='CAPUEMB000'-- CENTRO DE COSTO DEL LOCAL
where batnbr ='005541' and module ='CA' and acct ='103101' --CUENTA DE CAMBIO


select * from cfm_detpago2 where  exportadotr ='002193' -- fechanegocio ='2015-08-10' and numtienda  ='99' 



SELECT status,* FROM BATCH WHERE BATNBR ='028544' AND MODULE ='CA'
SELECT * FROM CATRAN WHERE BATNBR='028544' --AND REFNBR ='VISA'
SELECT * FROM GLTRAN WHERE BATNBR='028544' AND MODULE  ='CA'




select *  from cfm_detpago2 where exportadotr ='006459'




select * from cfm_detpago2 where  REFERENCIA ='157796'  fechanegocio ='2015-08-10' and numtienda  ='99'


and exportadotr ='016180'
 and fechanegocio ='2015-08-10'   -- exportadotr ='016181'



select * from catran where curyid='DOL'



 --AND BANKSUB ='CAIQCAF000' AND TRSFTOBANKSUB = 'CAIQCAFMAS'
SELECT * FROM GLTRAN WHERE BATNBR ='016277' AND MODULE ='CA' --AND REFNBR ='VISA'
go



select* from catran where batnbr ='016788'

SELECT * FROM BATCH  WHERE BATNBR  ='016180' AND MODULE ='CA'
SELECT * FROM BATCH  WHERE MODULE ='CA'

--update batch set basecuryid='SOL' where batnbr ='016788' AND MODULE ='CA'







delete from batch where batnbr ='027792' and module  ='CA'
delete from catran where batnbr  ='027792'
delete from gltran where batnbr ='027792' and module  ='CA'





delete from (
select ROW_NUMBER() OVER (ORDER BY fechanegocio) AS id,* from cfm_detpago2 where exportadotr ='006251'
) where exportadotr ='006251' and id in (1,3)

update catran set tranamt =34.13 where batnbr ='002191' and linenbr =-32511





delete from cfm_detpago2 where exportadotr ='006251' and cast(tstamp as varchar) ='0x000000004A86C1E6'





 




-------------------------------ACTUALIZAR SEGUN TIPO(VISA,MASTERCARD) -------------------------------------------//
 update batch set crtot=201.5,ctrltot =201.5,curycrtot=201.5,curyctrltot=201.5,curydrtot=201.5, drtot=201.5
 where batnbr ='012514' and module ='CA'
 update catran set curytranamt =163 ,tranamt =163 where batnbr ='012514' AND REFNBR ='VISA' --CUENTAS 1010000 Y 103101
 update gltran set cramt =163,curycramt =163 where batnbr ='012514' and module ='CA' and acct ='101000' AND REFNBR ='VISA'
 update gltran set dramt =163,curydramt =163 where batnbr ='012514' and module ='CA' and acct ='103101' AND REFNBR ='VISA'

-------------------------------------------------------------------011728---------------------------------------------//

use [ca2015app]
go











