--------- 
exec InsertvendPVFD
go
exec sp_repot_fv1_Job1 100
go
exec sp_repot_fv_ActuaVta
go





------------------ TB VENTAS
delete from tb_ventas where --perpost ='201305'
perpost in ( rtrim(year(getdate())) + right('00'+ rtrim(month(getdate())),2),rtrim(year(getdate())) + right('00'+ rtrim((case when month(getdate()) <> 1 then month(getdate()) -1 else 12 end)),2))
go
insert into tb_ventas 
select *from ventas where --perpost ='201305'
perpost in ( rtrim(year(getdate())) + right('00'+ rtrim(month(getdate())),2),rtrim(year(getdate())) + right('00'+ rtrim((case when month(getdate()) <> 1 then month(getdate()) -1 else 12 end)),2))
go

exec llena_inct
go

--------------------------



SELECT
    vs_repot_fv1_job."Periodo", vs_repot_fv1_job."id_sup", vs_repot_fv1_job."nombreSup", vs_repot_fv1_job."vend", vs_repot_fv1_job."nomVen", vs_repot_fv1_job."zona", vs_repot_fv1_job."VtaEfect", vs_repot_fv1_job."Avance", vs_repot_fv1_job."cuoT", vs_repot_fv1_job."VtaALTOM", vs_repot_fv1_job."cuoALTOM", vs_repot_fv1_job."VtaELBO", vs_repot_fv1_job."VtaKIMBO", vs_repot_fv1_job."cuoKIMBO", vs_repot_fv1_job."VtaMALTO", vs_repot_fv1_job."cuoMALTO", vs_repot_fv1_job."VtaOTROS", vs_repot_fv1_job."cuoACL", vs_repot_fv1_job."VtaACL", vs_repot_fv1_job."cuoATM", vs_repot_fv1_job."VtaATM", vs_repot_fv1_job."cuoAGO", vs_repot_fv1_job."VtaAGO"
FROM
    "RES2016APP"."dbo"."vs_repot_fv1_job" vs_repot_fv1_job
ORDER BY
    vs_repot_fv1_job."Periodo" ASC
    
    sp_helptext  vs_repot_fv1_job
    
    
 alter view vs_repot_fv1_job    
as    
select distinct    
Periodo,id_sup,nombreSup,vend,nomVen,zona,NombreZona,round(VtaTotal,2)VtaTotal,round(VtaEfect,2)VtaEfect,round(Avance,2)Avance,marca,round(cobT,2)cobT,round(cuoT,2)cuoT,round(NumVta,2)NumVta,round(NumDev,2)NumDev,    
round(VtaALT,2)VtaALTOM,round(cuoALT,2)cuoALTOM,round(cobALT,2)cobALTOM,round(VtaRET,2) VtaCAFET,round(cuoRET,2)cuoCAFET, round(cobRET,2)cobCAFET,round(VtaELB ,2)VtaELBO,round(cuoELB ,2)cuoELBO,round(cobELB ,2)cobELBO,round(VtaKIM,2)VtaKIMBO,     
round(cuoKIM,2)cuoKIMBO,    
round(cobKIM,2)cobKIMBO,round(VtaMON,2)VtaMALTO,round(cuoMON,2)cuoMALTO,round(cobMON,2)cobMALTO ,round(VtaMCH,2)VtaMCHIA,round(cuoMCH,2)cuoMCHIA,round(cobMCH,2)cobMCHIA,round( VtaOTR,2)VtaOTROS,round(cuoOTR,2)cuoOTROS,round(cobOTR,2)cobOTROS,RI_ID,     
 fecha  , round (cuoACL,2)cuoACL, round(VtaACL,2)VtaACL, round(cuoATM,2)cuoATM,  round(VtaATM,2)VtaATM,round(cuoAGO,2)cuoAGO, round(VtaAGO,2)VtaAGO  
from tempFV3 T inner join salesperson S on T.vend = S.slsperid  where ri_id=100 and S.user5 <> 'I'  



---------------------------



sp_helptext  sp_repot_fv_ActuaVta 
 
 CREATE procedure InsertvendPVFD  
as  
declare @perpost char(6)  
set @perpost = (select ltrim(year(getdate()))  + right('00'+ ltrim(month(getdate())-1),2))  
  
--select @perpost  
  
--- inset into tbZonaVendedor  
insert into tbZonaVendedor(periodo,zona,SlsPerid,nameVen,SlsSupid,nameSup,tstamp)  
  
--select distinct OMRVentas_OM_AR.periodo, xAMZonaVenta.ZonaVentaId as zona,OMRVentas_OM_AR.Vendedor_Cod  as SlsPerid,  
select distinct periodo=@perpost, xAMZonaVenta.ZonaVentaId as zona,OMRVentas_OM_AR.Vendedor_Cod  as SlsPerid,  
(select name from salesperson S where S.slsperid=OMRVentas_OM_AR.Vendedor_Cod) as name,  
IsNull((Select SaPe.S4Future11 FROM SalesPerson SaPe Where SaPe.SlsPerID = dbo.OMRVentas_OM_AR.Vendedor_Cod),'Verif'),  
IsNull((Select SaPe1.Name FROM SalesPerson SaPe1 Where SaPe1.SlsPerID = (Select SaPe.S4Future11 FROM SalesPerson SaPe Where SaPe.SlsPerID = dbo.OMRVentas_OM_AR.Vendedor_Cod)),'Verificar Tabla Vendedor'),  
null as tstamp  
from OMRVentas_OM_AR   
--LEFT OUTER JOIN Customer ON OMRVentas_OM_AR.Cliente_Cod = customer.custid   
INNER JOIN Salesperson ON OMRVentas_OM_AR.Vendedor_Cod = Salesperson.SlsperId   
INNER JOIN xAMZonaVenta ON OMRVentas_OM_AR.ZonaVta = xAMZonaVenta.ZonaVentaId  
where OMRVentas_OM_AR.periodo=@perpost and OMRVentas_OM_AR.Vendedor_Cod not in (select SlsPerid from tbZonaVendedor where periodo =@perpost )  
--xAMZonaVenta.ZonaVentaId ='CHNO'  
  
  
  
--declare @perpost char(6)  
set @perpost = (select ltrim(year(getdate()))  + right('00'+ ltrim(month(getdate())),2))  
  
--select @perpost  
  
--- inset into tbZonaVendedor  
insert into tbZonaVendedor(periodo,zona,SlsPerid,nameVen,SlsSupid,nameSup,tstamp)  
  
--select distinct OMRVentas_OM_AR.periodo, xAMZonaVenta.ZonaVentaId as zona,OMRVentas_OM_AR.Vendedor_Cod  as SlsPerid,  
select distinct periodo=@perpost, xAMZonaVenta.ZonaVentaId as zona,OMRVentas_OM_AR.Vendedor_Cod  as SlsPerid,  
(select name from salesperson S where S.slsperid=OMRVentas_OM_AR.Vendedor_Cod) as name,  
IsNull((Select SaPe.S4Future11 FROM SalesPerson SaPe Where SaPe.SlsPerID = dbo.OMRVentas_OM_AR.Vendedor_Cod),'Verif'),  
IsNull((Select SaPe1.Name FROM SalesPerson SaPe1 Where SaPe1.SlsPerID = (Select SaPe.S4Future11 FROM SalesPerson SaPe Where SaPe.SlsPerID = dbo.OMRVentas_OM_AR.Vendedor_Cod)),'Verificar Tabla Vendedor'),  
null as tstamp  
from OMRVentas_OM_AR   
--LEFT OUTER JOIN Customer ON OMRVentas_OM_AR.Cliente_Cod = customer.custid   
INNER JOIN Salesperson ON OMRVentas_OM_AR.Vendedor_Cod = Salesperson.SlsperId   
INNER JOIN xAMZonaVenta ON OMRVentas_OM_AR.ZonaVta = xAMZonaVenta.ZonaVentaId  
where OMRVentas_OM_AR.periodo=@perpost and OMRVentas_OM_AR.Vendedor_Cod not in (select SlsPerid from tbZonaVendedor where periodo =@perpost )  
--xAMZonaVenta.ZonaVentaId ='CHNO'  
  
  
  
  
insert into tbZonaVendedor(periodo,zona,SlsPerid,nameVen,SlsSupid,nameSup,tstamp)  
  
select periodo,zona,v.perid,'',H.perid,'',null as tstamp  
from PV_FuerzaDirectaH H inner join PV_FuerzaDirectaV V on V.pvfdH_id = h.pvfdH_id   
where rtrim(ltrim(v.perid))+rtrim(ltrim(periodo)) not in (select rtrim(ltrim(SlsPerid))+rtrim(ltrim(periodo)) from tbZonaVendedor)  
  
  
  
  
 sp_TempFV31
 
 
 
 select*  from  TempFV3