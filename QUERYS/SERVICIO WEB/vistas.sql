alter view swa_inventory
as

select I.invtid ,I.descr NombreProd, I.user1 Marca , X.descr,I.user6 CodLinea,S.descripcion NomLinea,A.ProdLineId CodSubLinea, P.descr NomSubLinea, DfltSOUnit UnidadMedida 
,CONVERT(decimal(8,3) ,A.Weight) Peso
from AM2016APP.dbo.inventory  I inner join AM2016APP.dbo.inventoryAdg A on I.invtid = A.invtid
inner join AM2016APP.dbo.productline P on P.ProdLineId =  A.ProdLineId 
inner join AM2016APP.dbo.xAMSubLinea S on S.SubLineaId =  I.user6
inner join AM2016APP.dbo.xammarcas X on X.idmarca =  I.user1

GO
 
alter proc uspswa_inventoryListar
as
select top 100 * from swa_inventory

GO

ALTER view swa_customer
as
select TOP 100 custid CodCliente,custid DniRuc,BillName NombreCliente,ClassId ClaseCliente, Fax ZonaVenta,PriceClassID ClasePrecio,Slsperid CodVendedor, Terms CondicionCredito, BillZip CodRuta,
rtrim(BillAddr1) + ' '+ rtrim(BillAddr2) Direccion , attn Contacto ,
(select  CONVERT(decimal(8,3) ,isnull(sum(case when doctype in ('CM','PA') then docbal *-1 else  docbal  end ),0)) from AM2016APP.dbo.ardoc where custid =c.custid and docbal <>0 and user6 <> 'OD') Deuda,
(case when (select count(*)from AM2016APP.dbo.newsh where custid =c.custid and cancelled =0) >0 then 'true' else 'False' end ) DespachoPendiente,
 convert(varchar,isnull((select  top 1 Orddate from (select custid,Orddate from AM2016APP.dbo.newsh union all select custid,Orddate from AM2016APP.dbo.soshipheader ) x where custid =c.custid order by Orddate desc),'1900-01-01 00:00:00'), 111) UltimaVisita
from AM2016APP.dbo.customer C WHERE STATUS ='A' AND LEFT(custid,5) <>'0000' 


GO 

create proc uspswa_customerListar
as
select top 100 * from swa_customer


create proc uspswa_customerListarRuc
@custid varchar (15)
as
select top 100 * from swa_customer where CodCliente = @custid

create proc uspswa_customerListarVendedot
@slsperid varchar (3)
as
select top 100 * from swa_customer where CodVendedor = @slsperid


GO
alter view swa_SalesPerson
as
select Slsperid CodVendedor,Name NombreCliente,'1111' Psw, s4future11 CodSupervisor, User6 ZonaVenta from AM2016APP.dbo.SalesPerson 

select * from AM2016APP.dbo.SalesPerson 
GO 

alter proc uspswa_SalesPersonListar
as
select top 100 CodVendedor,NombreCliente,CodSupervisor,ZonaVenta from swa_SalesPerson
go

alter proc uspswa_SalesPersonLogin
@Idswa_SalesPerson char(6),
@Psw char(6)
as
select top 100 CodVendedor,NombreCliente,CodSupervisor,ZonaVenta from swa_SalesPerson where CodVendedor = @Idswa_SalesPerson and Psw = @Psw


GO


CREATE VIEW [dbo].[swa_StockProd]    
AS      
select SiteID_Sol CodAlmacen,InvtID_Sol CodPro,QtyNewDisp Disponible   from AM2016APP.dbo.xAMNewItemSiteT

go 
uspswa_StockProd '25054','CIXPROD'

alter proc [dbo].[uspswa_StockProd]  
@CodProd varchar(10),
@CodAlmacen varchar(10)    
AS      
select CodAlmacen,CodPro,CONVERT(decimal(8,2) , Disponible )Disponible   from swa_StockProd where CodAlmacen = @CodAlmacen and CodPro =@CodProd

go


alter view swa_Precioventa
as

select   right(rtrim(ch_CodProd),5)CodProd ,nu_Corte corte,nu_Precio1 Precio,SlsUnit UnidMed,
(CASE WHEN SlsUnit='UND' THEN 'Unidad' WHEN SlsUnit='DISP' THEN 'Display' WHEN SlsUnit='KG' THEN 'Kilogramo' 
WHEN SlsUnit='GR' THEN 'Gramo' WHEN SlsUnit='LT' THEN 'Litro' WHEN SlsUnit='ML' THEN 'MiliLitro' 
WHEN SlsUnit='OZS' THEN 'Onzas' WHEN SlsUnit='MT' THEN 'Metros' WHEN SlsUnit='OZL' THEN 'OnzasL'END) NomUnidad, 0.00 Stock
from AM2016APP.dbo.xAM_ListPrecioSol


GO
exec uspswa_PrecioventaCorte '44061449','21004','100'
alter proc uspswa_PrecioventaCorte
@ruc varchar (15),
@CodProd varchar(6),
@cant int 
as

declare @ClasePrecio char(4)
set @ClasePrecio = ( select S4Future01 from AM2016APP.dbo.SOAddress where custid =@ruc and ShipToId ='DEFAULT' )

declare @slsperid char(4)
set @slsperid = ( select slsperid from AM2016APP.dbo.CUSTOMER where custid =@ruc  )
--select @slsperid
declare @siteid char(15)
set @siteid = ( select s4future02 from AM2016APP.dbo.salesperson where slsperid =@slsperid  )
--select @siteid


declare @Undmed char (4)
set @Undmed = (select (case when DfltSOUnit ='' then StkUnit else DfltSOUnit end ) from AM2016APP.dbo.inventory where invtid = @CodProd )

declare @Precio decimal(8,6)
 
--set @Precio = isnull((select DiscPrice from AM2016APP.dbo.xAM_ListPrecioPorClienteSol1 	where CustID =@ruc and InvtID = @CodProd   and SlsUnit=   @Undmed),0)

--if @Precio = 0 
--	begin
--		set @Precio = isnull(( select top 1 nu_Precio1 from AM2016APP.dbo.xAM_ListPrecioSol where ch_LstPrecio = @ClasePrecio  and ( right(rtrim(ch_CodProd),5) = @CodProd  )
--							and nu_Corte <= @cant and SlsUnit= @Undmed order by nu_Corte desc
--				  ),0)

--	select @Precio Precio

--	end 

declare @cont int
set @cont = isnull((select count(*) from AM2016APP.dbo.xAM_ListPrecioPorClienteSol1 	where CustID =@ruc and InvtID = @CodProd  and SlsUnit= @Undmed ),0)

if @cont > 0 
	BEGIN 
		select top 1  InvtID CodProd,1 corte,CONVERT(decimal (8,4),DiscPrice) Precio,SlsUnit UnidMed ,(CASE WHEN SlsUnit='UND' THEN 'Unidad' WHEN SlsUnit='DISP' THEN 'Display' WHEN SlsUnit='KG' THEN 'Kilogramo' 
WHEN SlsUnit='GR' THEN 'Gramo' WHEN SlsUnit='LT' THEN 'Litro' WHEN SlsUnit='ML' THEN 'MiliLitro' 
WHEN SlsUnit='OZS' THEN 'Onzas' WHEN SlsUnit='MT' THEN 'Metros' WHEN SlsUnit='OZL' THEN 'OnzasL'END) NomUnidad,(select CONVERT(decimal(8,2) , Disponible )   from swa_StockProd where CodAlmacen = @siteid and CodPro =@CodProd)  Stock
		from AM2016APP.dbo.xAM_ListPrecioPorClienteSol1 	where CustID =@ruc and InvtID = @CodProd  and SlsUnit= @Undmed 

	END 
	ELSE
	BEGIN
		select top 1  right(rtrim(ch_CodProd),5) CodProd,nu_Corte corte,CONVERT(decimal (8,4),nu_Precio1) Precio,SlsUnit UnidMed,(CASE WHEN SlsUnit='UND' THEN 'Unidad' WHEN SlsUnit='DISP' THEN 'Display' WHEN SlsUnit='KG' THEN 'Kilogramo' 
WHEN SlsUnit='GR' THEN 'Gramo' WHEN SlsUnit='LT' THEN 'Litro' WHEN SlsUnit='ML' THEN 'MiliLitro' 
WHEN SlsUnit='OZS' THEN 'Onzas' WHEN SlsUnit='MT' THEN 'Metros' WHEN SlsUnit='OZL' THEN 'OnzasL'END) NomUnidad, (select CONVERT(decimal(8,2) , Disponible )   from swa_StockProd where CodAlmacen = @siteid and CodPro =@CodProd)  Stock
		from AM2016APP.dbo.xAM_ListPrecioSol where ch_LstPrecio = @ClasePrecio  and ( right(rtrim(ch_CodProd),5) = @CodProd  )  and nu_Corte <= @cant and SlsUnit= @Undmed order by nu_Corte desc
	END



go

exec uspswa_Precioventa '44061449','21004'

alter proc uspswa_Precioventa
@ruc varchar (15),
@CodProd varchar(6)
as

declare @ClasePrecio char(4)
set @ClasePrecio = ( select S4Future01 from AM2016APP.dbo.SOAddress where custid =@ruc and ShipToId ='DEFAULT' )

declare @slsperid char(4)
set @slsperid = ( select slsperid from AM2016APP.dbo.CUSTOMER where custid =@ruc  )
--select @slsperid
declare @siteid char(15)
set @siteid = ( select s4future02 from AM2016APP.dbo.salesperson where slsperid =@slsperid  )
--select @siteid

declare @Undmed char (4)
set @Undmed = (select (case when DfltSOUnit ='' then StkUnit else DfltSOUnit end ) from AM2016APP.dbo.inventory where invtid = @CodProd )

declare @cont int
set @cont = isnull((select count(*) from AM2016APP.dbo.xAM_ListPrecioPorClienteSol1 	where CustID =@ruc and InvtID = @CodProd   and SlsUnit=   @Undmed),0)

if @cont > 0 
	BEGIN 
		select  InvtID CodProd,1 corte,CONVERT(decimal (8,4),DiscPrice) Precio,SlsUnit UnidMed ,(CASE WHEN SlsUnit='UND' THEN 'Unidad' WHEN SlsUnit='DISP' THEN 'Display' WHEN SlsUnit='KG' THEN 'Kilogramo' 
WHEN SlsUnit='GR' THEN 'Gramo' WHEN SlsUnit='LT' THEN 'Litro' WHEN SlsUnit='ML' THEN 'MiliLitro' 
WHEN SlsUnit='OZS' THEN 'Onzas' WHEN SlsUnit='MT' THEN 'Metros' WHEN SlsUnit='OZL' THEN 'OnzasL'END) NomUnidad,(select CONVERT(decimal(8,2) , Disponible )   from swa_StockProd where CodAlmacen = @siteid and CodPro =@CodProd)  Stock
		from AM2016APP.dbo.xAM_ListPrecioPorClienteSol1 	where CustID =@ruc and InvtID = @CodProd   and SlsUnit=   @Undmed 

	END 
	ELSE
	BEGIN
		select  right(rtrim(ch_CodProd),5) CodProd,nu_Corte corte,CONVERT(decimal (8,4),nu_Precio1) Precio,SlsUnit UnidMed,(CASE WHEN SlsUnit='UND' THEN 'Unidad' WHEN SlsUnit='DISP' THEN 'Display' WHEN SlsUnit='KG' THEN 'Kilogramo' 
WHEN SlsUnit='GR' THEN 'Gramo' WHEN SlsUnit='LT' THEN 'Litro' WHEN SlsUnit='ML' THEN 'MiliLitro' 
WHEN SlsUnit='OZS' THEN 'Onzas' WHEN SlsUnit='MT' THEN 'Metros' WHEN SlsUnit='OZL' THEN 'OnzasL'END) NomUnidad, (select CONVERT(decimal(8,2) , Disponible )   from swa_StockProd where CodAlmacen = @siteid and CodPro =@CodProd)  Stock
		from AM2016APP.dbo.xAM_ListPrecioSol where ch_LstPrecio = @ClasePrecio  and ( right(rtrim(ch_CodProd),5) = @CodProd  ) and SlsUnit= @Undmed order by nu_Corte ASC
	END




create view swa_PriceClass
as
select PriceClassId CodClasePrecio,Descr NomClasePrecio from AM2016APP.dbo.PriceClass


create proc uspswa_PriceClassListar
as
select *from swa_PriceClass

create proc uspswa_PriceClassListarPorid
@IdPriceClass char(4)
as

select *from swa_PriceClass where CodClasePrecio=@IdPriceClass


create view swa_RazonDeVenta
as
select Codigo CodRazonVenta,descripcion NombRazoVenta,user05 Tipo,* from AM2016APP.dbo.xAMRazonDeVenta 



create proc uspswa_RazonDeVentaListar
as
select *from swa_RazonDeVenta

create proc uspswa_RazonDeVentaListarId
@Idswa_RazonDeVenta varchar (15)
as
select *from swa_RazonDeVenta where CodRazonVenta = @Idswa_RazonDeVenta





