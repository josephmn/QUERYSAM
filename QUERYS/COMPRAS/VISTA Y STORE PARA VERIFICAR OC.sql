

sp_helptext  OCCMI 
OCCMI



use [amcaf2015app]
go



alter procedure AM_VERIRIFCAROC
--Funcion : Carga para Spread1 en Verificar Migracion OC
--Usuario : Laisson Gadel Gasla Baudat
--Sistema : Solomon IV
--Ultima Fecha de Modificacion : 04/12/2015 
@periodo char(6)
as
begin
SELECT * FROM TEMPORAL_OC where periodo like @periodo
order by numerocorrelativo desc
end
go


EXEC AM_VERIRIFCAROC '201511'

SELECT * FROM AM_VERIFICAOC where  nombrelocal ='CUZCO CAFETERIA 02'
and fechanegocio ='2015-12-01'  
 and numerocorrelativo ='00000235'

SELECT * FROM AM_VERIFICAOC WHERE NUMEROCORRELATIVO ='00000001'

SELECT OC_SOLOMON FROM AM_VERIFICAOC WHERE 
FECHANEGOCIO  = '2015-12-01'  AND  numerocorrelativo = '00000235' 


SELECT OC_SOLOMON FROM AM_VERIFICAOC WHERE NOMBRELOCAL = '44'  AND  
FECHANEGOCIO  = '2015-12-01' 
AND  numerocorrelativo = '00000235' 



ALTER view AM_VERIFICAOC
AS
--Funcion : Lista y compara OC y Recepcion en Invictus AM y Solomon AM-C
--Usuario : Laisson Gadel Gasla Baudat
--Sistema : Solomon IV
--Ultima Fecha de Modificacion : 04/12/2015 
select 
fechanegocio,
numeroCorrelativo,
(select distinct top 1 RvCorrelativo from SGRPAM.SGRPAM2016.GEN.V_RelacionMovimiento where Mid =M.id )CorrelativoRecep,
isnull((select PONbr from PurchOrd where user1 = M.id collate Modern_Spanish_CI_AS ),'') OC_Solomon,  
isnull(( select top 1 batnbr from  poreceipt where ponbr in ( isnull((select PONbr from PurchOrd where user1 = M.id collate Modern_Spanish_CI_AS ),''))),'') Lote_recp_Solomon  
,NombreClienteProveedor as proveedorx,Nombrelocal,round(totalmn,2)totalmn,estado,periodo
 FROM SGRPAM.SGRPAM2016.GEN.v_Movimiento M   
where   
 --numero ='00000015' and   
movimiento ='ORDEN DE COMPRA' and  estado <> 'ANULADO'  
and nombrelocal ='CUZCO CAFETERIA 01'
AND CorrelativoRecep  ='00000063'







use [am2015app]
go

delete from TEMPORAL_OC

alter proc BULLK_TEMPORAL_OC
@periodo char(6)
AS
begin
delete from TEMPORAL_OC
--select * INTO TEMPORAL_OC  from AM_VERIFICAOC 
--where  periodo like '201511'
--order by numeroCorrelativo desc
insert into TEMPORAL_OC (fechanegocio,numeroCorrelativo,CorrelativoRecep,OC_Solomon,
Lote_recp_Solomon,proveedorx,Nombrelocal,totalmn,estado,periodo)
select fechanegocio,
isnull(numeroCorrelativo,'')numeroCorrelativo,
isnull(CorrelativoRecep,'')CorrelativoRecep,
isnull(OC_Solomon,'')OC_Solomon,
isnull(Lote_recp_Solomon,'')Lote_recp_Solomon,
proveedorx,
Nombrelocal,
totalmn,estado,
periodo from AM_VERIFICAOC
where periodo like @periodo
order by fechanegocio desc
end



insert into TEMPORAL_OC (fechanegocio,numeroCorrelativo,CorrelativoRecep,OC_Solomon,
Lote_recp_Solomon,proveedorx,Nombrelocal,totalmn,estado,periodo)
select fechanegocio,
isnull(numeroCorrelativo,'')numeroCorrelativo,
isnull(CorrelativoRecep,'')CorrelativoRecep,
isnull(OC_Solomon,'')OC_Solomon,
isnull(Lote_recp_Solomon,'')Lote_recp_Solomon,
proveedorx,
Nombrelocal,
totalmn,estado,
periodo from AM_VERIFICAOC
where periodo like '201512'
order by fechanegocio desc


select * from  TEMPORAL_OC 


sp_helptext DBNavkardexINV

sp_helptext recargar_kardex


sp_helptext kardexINV


sp_helptext Vs_SolomonKardex  


------------------------------------------------------------------------------------------------------
CREATE view Vs_SolomonKardex      
as      
select *,isnull((select rtrim(batnbr)+' '+ (case when status in('P','U') then 'LIB' else 'NOLIB' end ) from batch where   user1 collate Modern_Spanish_CI_AS = (rtrim(ltrim(idmovimiento))+'J') ),'') Lote,''LoteAsociado      
from [SGRPAM].SGRPAM2016.DBO.Vs_SolomonKardex where movimiento in('AJUSTE DE INVENTARIO','ENTRADA DE INSUMO')      
union all      
select *,isnull((select rtrim(batnbr)+' '+ (case when status in('P','U') then 'LIB' else 'NOLIB' end )  from batch where   user1 collate Modern_Spanish_CI_AS = (rtrim(ltrim(idmovimiento))+'T') ) ,''),''LoteAsociado      
from [SGRPAM].SGRPAM2016.DBO.Vs_SolomonKardex where movimiento in('SALIDA POR TRANSFERENCIA')      
union all      
select *,isnull((select rtrim(s4future11)+' '+ (case when status in('P','U','R') then 'LIB' else 'NOLIB' end ) from trnsfrdoc where batnbr in (select batnbr from batch where   user1 collate Modern_Spanish_CI_AS = (rtrim(ltrim(MovAsociado))+'T') ) ),''),  
  
  
    
isnull(( select batnbr + (case when status in('P','U') then 'LIB' else 'NOLIB' end ) from batch where   user1 collate Modern_Spanish_CI_AS = (rtrim(ltrim(MovAsociado))+'T') ) ,'')LoteAsociado      
from [SGRPAM].SGRPAM2016.DBO.Vs_SolomonKardex where movimiento in('ENTRADA POR TRANSFERENCIA')      
union all      
select *,isnull((select top 1 rtrim(batnbr)+' '+ (case when status in('R','C') then 'LIB' else 'NOLIB' end )  from poreceipt where POnbr in (select PONbr from PurchOrd where   user1 collate Modern_Spanish_CI_AS = (rtrim(ltrim(MovAsociado))) ) ),''),      
isnull( (select PONbr from PurchOrd where   user1 collate Modern_Spanish_CI_AS = (rtrim(ltrim(MovAsociado))) ) ,'')      
from [SGRPAM].SGRPAM2016.DBO.Vs_SolomonKardex where movimiento in('RECEPCION DE COMPRA')   and idmovimiento not in ( 'CFCUZCO2000000000092','CFCUZCO2000000000435')    
union all      
select *,ISNULL( (select top 1 status from (    
select  (case WHEN status in ('P','U') then 'LIB' ELSE 'NOLIB' END)  status from batch where batnbr in (      
select distinct ExportadoEns  from CF_ResItem  where numtienda collate Modern_Spanish_CI_AS =IDENTIFICADOR and fechanegocio=V.fechanegocio       
union all      
select distinct ExportadoSal from CF_ResItem  where numtienda collate Modern_Spanish_CI_AS =IDENTIFICADOR and fechanegocio=V.fechanegocio       
) and module ='IN' ) x order by status asc) ,'NOGEN')    
    
,''LoteAsociado      
from [SGRPAM].SGRPAM2016.DBO.Vs_SolomonKardex V where movimiento in('DOCUMENTO DE VENTA') 





