
/*****************************************************************************/
/*****************************************************************************/

/********************		EN ALTOMAYO	 (INICCIO)		   *******************/

/*****************************************************************************/
/*****************************************************************************/

/**************** INSERT A TABLA FE DEL SOLOMON *************************/

/*********** tabla tb_ventasFE *************/

USE [AM2018APP]
GO

/****** Object:  Table [dbo].[tb_ventasFE]    Script Date: 05/10/2018 10:36:41 a.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tb_ventasFE](
	[ShipperID] [varchar](15) NULL,
	[InvcNbr] [char](15) NULL,
	[CustID] [char](15) NULL,
	[InvcDate] [smalldatetime] NULL,
	[ShipCity] [char](30) NULL,
	[SlsPerid] [char](10) NULL,
	[ShipState] [char](3) NULL,
	[ValorVta] [float] NULL,
	[Afecto] [float] NULL,
	[No_Afecto] [float] NULL,
	[IGV] [float] NULL,
	[Otros_tax] [float] NULL,
	[All_Tax_Total] [float] NULL,
	[TotInvc] [float] NULL,
	[PerClosed] [char](6) NULL,
	[PerPost] [char](6) NULL,
	[Status] [varchar](1) NULL,
	[CpnyID] [char](10) NULL,
	[ARBatNbr] [char](10) NULL,
	[CustOrdNbr] [varchar](25) NULL,
	[OrdNbr] [varchar](25) NULL,
	[doctype] [char](2) NULL,
	[SOTypeID] [varchar](4) NULL,
	[Behavior] [varchar](4) NULL,
	[TipoDoc] [char](10) NULL,
	[cancelled] [int] NULL,
	[FactRel] [char](10) NULL,
	[TaxRate] [float] NULL,
	[ShipToID] [char](10) NULL,
	[NroGuia] [varchar](20) NULL,
	[FechaGuia] [smalldatetime] NULL,
	[Producto] [char](30) NULL,
	[Totinvcline] [float] NULL,
	[TotCostline] [float] NULL,
	[Expr1] [float] NULL,
	[SiteID] [char](10) NULL,
	[INbatnbr] [char](10) NULL,
	[Marcpre] [char](10) NULL,
	[ZONARUTA] [char](10) NULL,
	[semana] [char](2) NULL,
	[NomSemana] [varchar](100) NULL,
	[DescProducto] [varchar](150) NULL,
	[TaxCat] [varchar](10) NULL,
	[UnitDesc] [char](10) NULL,
	[SlsPrice] [float] NULL,
	[TaxID00] [char](5) NULL,
	[curyTotInvc] [float] NULL,
	[TotInvcD] [float] NULL,
	[CuryTaxAmt00] [float] NULL,
	[TaxAmt00] [float] NULL,
	[EstadoVenta] [char](20) NULL,
	[PrecioReferencial] [float] NULL,
	[CurySlsPrice] [float] NULL,
	[TermsSH] [char](2) NULL,
	[CuruIdSH] [char](4) NULL,
	[curyRateSH] [float] NULL,
	[DueDAteSH] [smalldatetime] NULL,
	[LineRef] [char](6) NULL,
	[EXPORT] [char](2) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



/************ proceso insert ******************/

delete from tb_ventasFE 
--where perpost >='201612' and 
--perpost in ( rtrim(year(getdate())) + right('00'+ rtrim(month(getdate())),2),rtrim(year(getdate())) + right('00'+ rtrim((case when month(getdate()) <> 1 then month(getdate()) -1 else 12 end)),2))

insert into tb_ventasFE 
(ShipperID, InvcNbr, CustID, InvcDate, ShipCity, SlsPerid, ShipState, ValorVta, Afecto, No_Afecto, IGV, Otros_tax, All_Tax_Total, TotInvc, 
PerClosed, PerPost, Status, CpnyID, ARBatNbr, CustOrdNbr, OrdNbr, doctype, SOTypeID, Behavior, TipoDoc, cancelled, FactRel, TaxRate, ShipToID, 
NroGuia, FechaGuia, Producto, Totinvcline, TotCostline, Expr1, SiteID, INbatnbr, Marcpre, ZONARUTA, semana, NomSemana, DescProducto, TaxCat, 
UnitDesc, SlsPrice, TaxID00, curyTotInvc, TotInvcD, CuryTaxAmt00, TaxAmt00, EstadoVenta, PrecioReferencial, CurySlsPrice, TermsSH, CuruIdSH, 
curyRateSH, DueDAteSH, LineRef, EXPORT)
select F.ShipperID, InvcNbr, CustID, InvcDate, ShipCity, SlsPerid, ShipState, ValorVta, Afecto, No_Afecto, IGV, Otros_tax, All_Tax_Total, TotInvc, 
PerClosed, PerPost, Status, CpnyID, ARBatNbr, CustOrdNbr, OrdNbr, doctype, SOTypeID, Behavior, TipoDoc, cancelled, FactRel, TaxRate, ShipToID, 
NroGuia, FechaGuia, Producto, Totinvcline, TotCostline, Expr1, SiteID, INbatnbr, Marcpre, ZONARUTA, semana, NomSemana, DescProducto, TaxCat, 
UnitDesc, SlsPrice, TaxID00, curyTotInvc, TotInvcD, CuryTaxAmt00, TaxAmt00, EstadoVenta, PrecioReferencial, CurySlsPrice, TermsSH, CuruIdSH, 
curyRateSH, DueDAteSH, LineRef, (CASe WHEN X.shipperid IS NULL THEN 'GV' ELSE 'XP' END )EXPORT from VentasFE  F
LEFT JOIN NEWSHEXPORT X ON F.ShipperID  = X.shipperid
WHERE TIPODOC <> 'od' and invcnbr not in ('f02-272','f02-273')

GO 

insert into tb_ventasFE (
ShipperID, InvcNbr, CustID, InvcDate, ShipCity, SlsPerid, ShipState, ValorVta, Afecto, No_Afecto, IGV, Otros_tax, All_Tax_Total, TotInvc, 
PerClosed, PerPost, Status, CpnyID, ARBatNbr, CustOrdNbr, OrdNbr, doctype, SOTypeID, Behavior, TipoDoc, cancelled, FactRel, TaxRate, ShipToID, 
NroGuia, FechaGuia, Producto, Totinvcline, TotCostline, Expr1, SiteID, INbatnbr, Marcpre, ZONARUTA, semana, NomSemana, DescProducto, TaxCat, 
UnitDesc, SlsPrice, TaxID00, curyTotInvc, TotInvcD, CuryTaxAmt00, TaxAmt00, EstadoVenta, PrecioReferencial, CurySlsPrice, TermsSH, CuruIdSH, 
curyRateSH, DueDAteSH, LineRef, EXPORT
)
select ShipperID, InvcNbr, CustID, InvcDate, ShipCity, SlsPerid, ShipState, ValorVta, Afecto, No_Afecto, IGV, Otros_tax, All_Tax_Total, TotInvc, 
PerClosed, PerPost, Status, CpnyID, ARBatNbr, CustOrdNbr, OrdNbr, doctype, SOTypeID, Behavior, TipoDoc, cancelled, FactRel, TaxRate, ShipToID, 
NroGuia, FechaGuia, Producto, Totinvcline, TotCostline, Expr1, SiteID, INbatnbr, Marcpre, ZONARUTA, semana, NomSemana, DescProducto, TaxCat, 
UnitDesc, SlsPrice, TaxID00, curyTotInvc, TotInvcD, CuryTaxAmt00, TaxAmt00, EstadoVenta, PrecioReferencial, CurySlsPrice, TermsSH, CuruIdSH, 
curyRateSH, DueDAteSH, LineRef, '' EXPORT from AM2017APP.DBO.tb_ventasFE  WHERE invcnbr in (
			select invcnbr from PLCMInvcnbr where invcnbr not in ( 
				select invcnbr from soshipheader
				union all
				select refnbr from ardoc

			)
)


/*****************************************************************************/
/*****************************************************************************/

/********************			EN ALTOMAYO	 (FIN)		   *******************/

/*****************************************************************************/
/*****************************************************************************/


/****************************************************************************************************************************************/

/*****************************************************************************/
/*****************************************************************************/

/********************		EN FECELECTRO	 (INICCIO)	   *******************/

/*****************************************************************************/
/*****************************************************************************/

/************ TABLAS DE FACELECTRO tb_ventasFE ****************/

USE [AMFACTELECT]
GO

/****** Object:  Table [dbo].[tb_ventasFE]    Script Date: 05/10/2018 10:39:59 a.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tb_ventasFE](
	[ShipperID] [varchar](15) NULL,
	[InvcNbr] [char](15) NULL,
	[CustID] [char](15) NULL,
	[InvcDate] [smalldatetime] NULL,
	[ShipCity] [char](30) NULL,
	[SlsPerid] [char](10) NULL,
	[ShipState] [char](3) NULL,
	[ValorVta] [float] NULL,
	[Afecto] [float] NULL,
	[No_Afecto] [float] NULL,
	[IGV] [float] NULL,
	[Otros_tax] [float] NULL,
	[All_Tax_Total] [float] NULL,
	[TotInvc] [float] NULL,
	[PerClosed] [char](6) NULL,
	[PerPost] [char](6) NULL,
	[Status] [varchar](1) NULL,
	[CpnyID] [char](10) NULL,
	[ARBatNbr] [char](10) NULL,
	[CustOrdNbr] [varchar](25) NULL,
	[OrdNbr] [varchar](25) NULL,
	[doctype] [char](2) NULL,
	[SOTypeID] [varchar](4) NULL,
	[Behavior] [varchar](4) NULL,
	[TipoDoc] [char](10) NULL,
	[cancelled] [int] NULL,
	[FactRel] [char](10) NULL,
	[TaxRate] [float] NULL,
	[ShipToID] [char](10) NULL,
	[NroGuia] [varchar](20) NULL,
	[FechaGuia] [smalldatetime] NULL,
	[Producto] [char](30) NULL,
	[Totinvcline] [float] NULL,
	[TotCostline] [float] NULL,
	[Expr1] [float] NULL,
	[SiteID] [char](10) NULL,
	[INbatnbr] [char](10) NULL,
	[Marcpre] [char](10) NULL,
	[ZONARUTA] [char](10) NULL,
	[semana] [char](2) NULL,
	[NomSemana] [varchar](100) NULL,
	[DescProducto] [varchar](150) NULL,
	[TaxCat] [varchar](10) NULL,
	[UnitDesc] [char](10) NULL,
	[SlsPrice] [float] NULL,
	[TaxID00] [char](5) NULL,
	[curyTotInvc] [float] NULL,
	[TotInvcD] [float] NULL,
	[CuryTaxAmt00] [float] NULL,
	[TaxAmt00] [float] NULL,
	[EstadoVenta] [char](20) NULL,
	[PrecioReferencial] [float] NULL,
	[CurySlsPrice] [float] NULL,
	[TermsSH] [char](2) NULL,
	[CuruIdSH] [char](4) NULL,
	[curyRateSH] [float] NULL,
	[DueDAteSH] [smalldatetime] NULL,
	[LineRef] [char](6) NULL,
	[EXPORT] [char](2) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


/**************** paso 2 carga de SOLOMON (tb_ventasFE) a Tabla FACELECTRO (tb_ventasFE) **********************/


/************ INICIO (PROC FE_migrarDocumentoINV) *************/

           
CREATE PROC FE_migrarDocumentoINV            
@indetificador char(1)            
as            
BEGIN                      
            
declare @invcnbr varchar(15)            
declare @custid varchar(15)            
declare @ARBatNbr varchar(10)            
declare @idDocumento varchar(15)            
DECLARE cDocumento CURSOR FOR            
--select distinct  invcnbr,(case when custid='88888888888' then '88888888'when tipoDoc='03' then '88888888' else custid end )custid,ARBatNbr from [ALTOMAYO-TEMP].AMCAF2018APP.dbo.tb_ventasFE WHERE perpost >='201612' --and invcdate ='2016-11-12 00:00:00'  


  
    
--and invcnbr ='F700000006'-- status ='A'   --(CUSTID = '20395592344')                  
--and   left(invcnbr,1)+'0'+right(left(invcnbr,3),2)+'-'+right(ltrim(rtrim(invcnbr)),5)  collate Modern_Spanish_CI_AS not in   (select num_doc_venta from DOCUMENTO )              
select distinct  invcnbr,custid,ARBatNbr from dbo.tb_ventasFE WHERE --perpost >='201612' and             
ltrim(rtrim(ARBatNbr)) <>'' --and invcdate >='2016-11-28 00:00:00'  --and invcnbr ='F700000006'-- status ='A'   --(CUSTID = '20395592344')                  
and   left(invcnbr,1)+'0'+right(left(invcnbr,3),2)+'-'+right(ltrim(rtrim(invcnbr)),5)  collate Modern_Spanish_CI_AS not in   (select num_doc_venta from DOCUMENTO )             
AND (CASE when left(invcnbr,3) in ('F11','B11','F12','B12','F13','B13','F77') THEN 'D'             
   when left(invcnbr,3) in ('F14','B14','F15','B15','F16','B16') THEN 'E' END) =  @indetificador          
order by invcnbr            
OPEN cDocumento             
FETCH cDocumento INTO @invcnbr,@custid,@ARBatNbr            
WHILE (@@FETCH_STATUS = 0 )            
BEGIN            
 begin            
            
set @idDocumento = @indetificador+right('0000000000'+rtrim(isnull((select right(ltrim(rtrim(max(id_documento))),10)+0 from documento where LEFT(ltrim(rtrim(id_documento)),1)=@indetificador ),0)+1),10)            
            
exec fe_clienteCusco @custid            
            
 if rtrim(ltrim(@ARBatNbr))  = ''            
 BEGIN            
             
 insert into documento(id_documento, val_batnbr_ar, val_refnbr_ar, id_cliente, num_doc_venta, serie_comprobante, nro_comprobante, cod_ref_zona,             
 id_tipo_doc, fec_venta, fec_venci_pago, forma_pago, moneda, valor_tipo_cambio, valor_igv_Orig, valor_igv_Soles, m_total_venta_Orig,             
m_total_venta_Soles, estado, num_doc_elect, estransgratuita, descom, es_anulado, enviado_email, enviado_exte
rno, NroOrdenComp,NumGuia, fechaGuia, TipoDocRel)            
            
             
 select id_documento, val_batnbr_ar, val_refnbr_ar, id_cliente, num_doc_venta, serie_comprobante, nro_comprobante, cod_ref_zona,             
 id_tipo_doc, fec_venta, fec_venci_pago, forma_pago, moneda, valor_tipo_cambio,            
 round((case when id_tipo_doc = '07' and valor_igv_Orig <0 then valor_igv_Orig *-1 else valor_igv_Orig end ),2) valor_igv_Orig,             
 round((case when id_tipo_doc = '07' and valor_igv_Soles <0 then valor_igv_Soles *-1 else valor_igv_Soles end ),2) valor_igv_Soles,             
 round((case when id_tipo_doc = '07' and m_total_venta_Orig <0 then m_total_venta_Orig *-1 else m_total_venta_Orig end ),2) m_total_venta_Orig,             
 round((case when id_tipo_doc = '07' and m_total_venta_Soles <0 then m_total_venta_Soles *-1 else m_total_venta_Soles end ),2) m_total_venta_Soles,             
 estado, num_doc_elect, estransgratuita, descom, es_anulado, enviado_email, enviado_externo, NroOrdenComp,NumGuia, fechaGuia, TipoDocRel from (            
 select distinct @idDocumento id_documento,'' val_batnbr_ar,left(v.invcnbr,1)+'0'+right(left(v.invcnbr,3),2)+'-'+right(ltrim(rtrim(v.invcnbr)),5) val_refnbr_ar,@custid Id_cliente,            
 left(v.invcnbr,1)+'0'+right(left(v.invcnbr,3),2)+'-'+right(ltrim(rtrim(v.invcnbr)),5) num_doc_venta,left(v.invcnbr,1)+'0'+right(left(v.invcnbr,3),2) serie_comprobante, right(left(v.invcnbr,10),5)nro_comprobante,@indetificador cod_ref_zona,            
 v.tipoDoc id_tipo_doc,invcdate fec_venta,v.DueDAteSH fec_venci_pago,v.TermsSH forma_pago,v.CuruIdSH moneda,v.curyRateSH valor_tipo_cambio,             
 sum(v.CuryTaxAmt00 ) valor_igv_Orig,sum(v.TaxAmt00) valor_igv_Soles,sum((curyTotInvc + v.CuryTaxAmt00)) m_total_venta_Orig,sum((TotInvcD + v.TaxAmt00)) m_total_venta_Soles,            
 'C' estado ,'' num_doc_elect,( case  when EstadoVenta IN('MUESTRA','OBSEQUIO','BON','BONIFPEND')  then 1 else 0 end )  estransgratuita,0 descom,cancelled  es_anulado,0 enviado_email,0 enviado_externo,'' NroOrdenComp ,'' NumGuia   , invcdate fechaGuia,'' 


  
    
      
        
TipoDocRel          
 from  dbo.tb_ventasFE V             
 where v.invcnbr = @invcnbr and v.doctype in ('IN','CM','DM')            
 group by v.invcnbr,v.custid ,v.tipoDoc ,invcdate ,v.DueDAteSH ,v.TermsSH,v.CuruIdSH ,v.curyRateSH ,EstadoVenta,cancelled            
            
 ) X              
            
                          
 insert into detalle_documento(id_documento, LineId, CodProd,producto, und_prod, cantidad, precio_unit, CatId, TaxId, id_tipoVenta, val_venta_Orig, val_venta_Sol,             
 val_igv_Orig, val_igv_Sol, val_SubTotal_Orig, val_SubTotal_Sol, Precio_Orig)            
            
            
 select id_documento, LineId, CodProd, producto, und_prod, cantidad, precio_unit, CatId, TaxId, id_tipoVenta, val_venta_Orig, val_venta_Sol,             
 val_igv_Orig, val_igv_Sol, val_SubTotal_Orig, val_SubTotal_Sol, Precio_Orig from (            
 select @idDocumento id_documento,right('000'+rtrim(ROW_NUMBER() OVER(ORDER BY LineRef ASC)),3) AS LineId,   ltrim(rtrim(producto))CodProd,          
 rtrim(isnull(DescProducto,'')) +' '+ (case when EstadoVenta='NORMAL' and TotInvcD =0  then '-Bonif-Transf' else '' end)            
 producto , UnitDesc und_prod ,            
 (case when Expr1 <0 then Expr1 *-1 else Expr1 end )  cantidad,            
 isnull((case when LEFT(InvcNbr,1 )='B' then ( case when EstadoVenta='NORMAL' and SlsPrice =0 then PrecioReferencial else SlsPrice end ) *1.18 else ( case when EstadoVenta='NORMAL' and SlsPrice =0 then PrecioReferencial else SlsPrice end ) end),0) precio_
unit ,            
 TaxCat CatId,(case when TaxCat ='AFECTO' then 'IGV' else '' end ) TaxId,'GV' id_tipoVenta,            
 ( case when EstadoVenta='NORMAL' then round((case when Expr1 <0 then  (curyTotInvc + v.CuryTaxAmt00) *-1 else  (curyTotInvc + v.CuryTaxAmt00) end ),2) else Expr1 * PrecioReferencial end ) val_venta_Orig,            
 ( case when EstadoVenta='NORMAL' then round((case when Expr1 <0 then (TotInvcD + v.TaxAmt00) *-1 else (TotInvcD + v.TaxAmt00) end ),2) else Expr1 * PrecioReferencial end ) val_venta_Sol,        
 round((case when Expr1 <0 then v.CuryTaxAmt00 *-1 else v.CuryTaxAmt00 end ),2)  val_igv_Orig,            
 round((case when Expr1 <0 then v.TaxAmt00 *-1 else v.TaxAmt00 end ),2)  val_igv_Sol,            
 ( case when EstadoVenta='NORMAL' then round((case when Expr1 <0 then curyTotInvc *-1 else curyTotInvc end ),2)  else Expr1 * PrecioReferencial end ) val_SubTotal_Orig,            
 ( case when EstadoVenta='NORMAL' then round((case when Expr1 <0 then TotInvcD *-1 else TotInvcD end ),2)  else Expr1 * PrecioReferencial end ) val_SubTotal_Sol,            
 isnull((case when LEFT(InvcNbr,1 )='B' then ( case when EstadoVenta='NORMAL' and CurySlsPrice =0 then PrecioReferencial else CurySlsPrice end ) *1.18 else ( case when EstadoVenta='NORMAL' and CurySlsPrice =0 then PrecioReferencial else CurySlsPrice end  


 
)    
      
        
          
 end),0)  Precio_Orig,LineRef            
 from dbo.tb_ventasFE V             
 where InvcNbr = @invcnbr  and doctype in ('IN','CM','DM')             
 )x             
 order by LineRef asc            
             
 END            
             
ELSE            
            
 BEGIN            
            
            
 insert into documento(id_documento, val_batnbr_ar, val_refnbr_ar, id_cliente, num_doc_venta, serie_comprobante, nro_comprobante, cod_ref_zona,             
 id_tipo_doc, fec_venta, fec_venci_pago, forma_pago, moneda, valor_tipo_cambio, valor_igv_Orig, valor_igv_Soles, m_total_venta_Orig,             
 m_total_venta_Soles, estado, num_doc_elect, estransgratuita, descom, es_anulado, enviado_email, enviado_externo, NroOrdenComp,NumGuia, fechaGuia, TipoDocRel)            
            
            
 select id_documento, val_batnbr_ar, val_refnbr_ar, id_cliente, num_doc_venta, serie_comprobante, nro_comprobante, cod_ref_zona,             
 id_tipo_doc, fec_venta, fec_venci_pago, forma_pago, moneda, valor_tipo_cambio,            
 round((case when id_tipo_doc = '07' and valor_igv_Orig <0 then valor_igv_Orig *-1 else valor_igv_Orig end ),2) valor_igv_Orig,             
 round((case when id_tipo_doc = '07' and valor_igv_Soles <0 then valor_igv_Soles *-1 else valor_igv_Soles end ),2) valor_igv_Soles,             
 round((case when id_tipo_doc = '07' and m_total_venta_Orig <0 then m_total_venta_Orig *-1 else m_total_venta_Orig end ),2) m_total_venta_Orig,             
 round((case when id_tipo_doc = '07' and m_total_venta_Soles <0 then m_total_venta_Soles *-1 else m_total_venta_Soles end ),2) m_total_venta_Soles,             
 estado, num_doc_elect, estransgratuita, descom, es_anulado, enviado_email, enviado_externo, NroOrdenComp,NumGuia, fechaGuia, TipoDocRel from (            
 select distinct @idDocumento id_documento,BatNbr val_batnbr_ar,left(RefNbr,1)+'0'+right(left(RefNbr,3),2)+'-'+right(ltrim(rtrim(RefNbr)),5) val_refnbr_ar,@custid Id_cliente,            
 left(RefNbr,1)+'0'+right(left(RefNbr,3),2)+'-'+right(ltrim(rtrim(RefNbr)),5) num_doc_venta,left(RefNbr,1)+'0'+right(left(RefNbr,3),2) serie_comprobante, right(left(refnbr,10),5)nro_comprobante,@indetificador cod_ref_zona,            
 A.user6 id_tipo_doc,DocDate fec_venta,A.dueDate fec_venci_pago,A.Terms forma_pago,A.curyId moneda,CuryRate valor_tipo_cambio,             
 sum(v.CuryTaxAmt00 ) valor_igv_Orig,sum(v.TaxAmt00) valor_igv_Soles,sum((curyTotInvc + v.CuryTaxAmt00)) m_total_venta_Orig,sum((TotInvcD + v.TaxAmt00)) m_total_venta_Soles,            
 'C' estado ,'' num_doc_elect,( case  when EstadoVenta IN('MUESTRA','OBSEQUIO','BON','BONIFPEND')  then 1 else 0 end )   estransgratuita,0 descom,cancelled  es_anulado,0 enviado_email,0 enviado_externo,'' NroOrdenComp ,'' NumGuia  , DocDate fechaGuia,'' T
ipoDocRel          
 from  [ALTOMAYO-TEMP].AMCAF2018APP.dbo.ARDOC A inner join dbo.tb_ventasFE V on  A.RefNbr = V.InvcNbr  collate Modern_Spanish_CI_AS           
 where A.refnbr = @invcnbr and A.doctype in ('IN','CM','DM')            
 group by BatNbr,refnbr,a.custid ,A.user6 ,DocDate ,A.dueDate ,A.Terms,A.curyId ,CuryRate ,EstadoVenta,cancelled, A.doctype             
 ) X             
              
                         insert into detalle_documento(id_documento, LineId,CodProd, producto, und_prod, cantidad, precio_unit, CatId, TaxId, id_tipoVenta, val_venta_Orig, val_venta_Sol,             
 val_igv_Orig, val_igv_Sol, val_SubTotal_Orig, val_SubTotal_Sol, Precio_Orig)            
            
            
 select id_documento, LineId, CodProd, producto, und_prod, cantidad, precio_unit, CatId, TaxId, id_tipoVenta, val_venta_Orig, val_venta_Sol,             
 val_igv_Orig, val_igv_Sol, val_SubTotal_Orig, val_SubTotal_Sol, Precio_Orig from (            
 select @idDocumento id_documento,right('000'+rtrim(ROW_NUMBER() OVER(ORDER BY V.LineRef ASC)),3) AS LineId,    ltrim(rtrim(producto))CodProd,        
 rtrim(isnull(DescProducto,T.trandesc)) +' '+ (case when EstadoVenta='NORMAL' and TotInvcD =0  then '-Bonif-Transf' else '' end)            
 producto , V.UnitDesc und_prod ,            
 (case when Expr1 <0 then Expr1 *-1 else Expr1 end )  cantidad,            
 isnull((case when LEFT(InvcNbr,1 )='B' then ( case when EstadoVenta='NORMAL' and SlsPrice =0 then PrecioReferencial else SlsPrice end ) *1.18 else ( case when EstadoVenta='NORMAL' and SlsPrice =0 then PrecioReferencial else SlsPrice end ) end),0) precio_
unit ,            
 T.TaxCat CatId,(case when T.TaxCat ='AFECTO' then 'IGV' else '' end ) TaxId,'GV' id_tipoVenta,            
 ( case when EstadoVenta='NORMAL' or A.doctype in ('DM') then round((case when Expr1 <0 then  (curyTotInvc + v.CuryTaxAmt00) *-1 else  (curyTotInvc + v.CuryTaxAmt00) end ),2) else Expr1 * PrecioReferencial end ) val_venta_Orig,            
 ( case when EstadoVenta='NORMAL' or A.doctype in ('DM') then round((case when Expr1 <0 then (TotInvcD + v.TaxAmt00) *-1 else (TotInvcD + v.TaxAmt00) end ),2) else Expr1 * PrecioReferencial end ) val_venta_Sol,            
 round((case when Expr1 <0 then v.CuryTaxAmt00 *-1 else v.CuryTaxAmt00 end ),2)  val_igv_Orig,            
 round((case when Expr1 <0 then v.TaxAmt00 *-1 else v.TaxAmt00 end ),2)  val_igv_Sol,            
 ( case when EstadoVenta='NORMAL' or A.doctype in ('DM') then round((case when Expr1 <0 then curyTotInvc *-1 else curyTotInvc end ),2)  else Expr1 * PrecioReferencial end ) val_SubTotal_Orig,            
 ( case when EstadoVenta='NORMAL' or A.doctype in ('DM') then round((case when Expr1 <0 then TotInvcD *-1 else TotInvcD end ),2)  else Expr1 * PrecioReferencial end ) val_SubTotal_Sol,            
 isnull((case when LEFT(InvcNbr,1 )='B' then ( case when EstadoVenta='NORMAL' and CurySlsPrice =0 then PrecioReferencial else CurySlsPrice end ) *1.18 else ( case when EstadoVenta='NORMAL' and CurySlsPrice =0 then PrecioReferencial else CurySlsPrice end )


  
  
 end),0)  Precio_Orig,T.LineRef            
 from dbo.tb_ventasFE V             
 Inner join [ALTOMAYO-TEMP].AMCAF2018APP.dbo.ARDOC A on  V.ARBatNbr  collate Modern_Spanish_CI_AS   = A.batnbr  and V.invcnbr  collate Modern_Spanish_CI_AS   = A.Refnbr         
 left JOIN  [ALTOMAYO-TEMP].AMCAF2018APP.dbo.ARTRAN T on A.batnbr = T.batnbr and A.refnbr = T.refnbr --and  T.invtid = V.producto and T.qty = V.Expr1            
 where A.refnbr = @invcnbr  and A.doctype in ('IN','CM','DM') AND T.ACCT not like  '1%' and T.ACCT not like  '4%'             
  
            
 )x             
 order by LineRef asc            
            
            
 END            
            
 end             
FETCH cDocumento INTO @invcnbr,@custid,@ARBatNbr            
END            
CLOSE cDocumento            
DEALLOCATE cDocumento            
            
-- llenar PLCMInvcnbr  masivo             
insert into PLCMInvcnbr (CpnyID, Custid, DocType, InvcNbr, LineNbr, RefNbr, ShipperID, User1, User2, User3, User4, User5, User6, User7, User8 )            
select *from [ALTOMAYO-TEMP].AMCAF2018APP.dbo.FE_PLCMInvcnbr where (InvcNbr like '%F%' or InvcNbr like '%B%' or RefNbr  like '%F%' or RefNbr like '%B%')            
and rtrim(ltrim(refnbr)) collate Modern_Spanish_CI_AS  not in (select rtrim(ltrim(refnbr)) from dbo.PLCMInvcnbr)            
            
END   
  
/************ FIN (PROC FE_migrarDocumentoINV) *************/






/***** TABLA EXPORT_PERU *******/

USE [AMFACTELECT]
GO

/****** Object:  Table [dbo].[EXPORT_PERU]    Script Date: 05/10/2018 10:43:03 a.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[EXPORT_PERU](
	[invcNbr] [char](10) NOT NULL,
	[Custid] [char](11) NOT NULL,
	[num_doc_venta] [char](10) NOT NULL,
	[id_documentoXP] [char](11) NOT NULL,
	[periodoXP] [char](6) NOT NULL,
	[variable] [char](2) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/**********************************/



/*********** PROCESO DE MIGRACION (INICIO) ************/

delete from documento  where id_documento  not in  (select id_documento from detalle_documento)

delete from tb_ventasFE

insert into tb_ventasFE
--select * from [altomayo-temp].AM2017APP.dbo.tb_ventasFE
select * from [ALTOMAYO-TEMP].AM2018APP.dbo.tb_ventasFE

insert into tb_ventasFE
select * from [ALTOMAYO-TEMP].AMCAF2018APP.dbo.tb_ventasFE

exec FE_migrarDocumentoINV 'D'
exec FE_migrarDocumentoINV 'E'

exec FE_migrarDocumento 'C' 
exec FE_migrarDocumento 'X' 
exec FE_migrarDocumento 'H' 
exec FE_migrarDocumento 'S'

--exec FE_migrarDocumento2016_A_2017 'C'
--exec FE_migrarDocumento2016_A_2017 'X'
--exec FE_migrarDocumento2016_A_2017 'H'
--exec FE_migrarDocumento2016_A_2017 'S'

 --exec FE_migrarDocumento2017_A_2018 'C'
 --exec FE_migrarDocumento2017_A_2018 'X'
 --exec FE_migrarDocumento2017_A_2018 'H'
 --exec FE_migrarDocumento2017_A_2018 'S'


update documento set id_cliente = '88888888888'
from documento  where year(fec_venta)='2018' and id_tipo_doc ='03' and serie_comprobante in ('B011','B014') AND id_cliente <>'88888888888' and len(id_cliente) = 8 
and num_doc_elect = ''

delete from documento  where id_documento  not in  (select id_documento from detalle_documento)


declare @id_documento varchar(15)
declare @valorventaH float
declare @totalD float
declare @igvD float
declare @subTotalD float

DECLARE cap CURSOR FOR
	select id_documento,m_total_venta_Soles FROM documento WHERE estransgratuita = 0 and  num_doc_elect='' AND estado ='C' and es_anulado =0
OPEN cap 
FETCH cap INTO @id_documento,@valorventaH
WHILE (@@FETCH_STATUS = 0 )
BEGIN
 begin
 --select @id_documento,@valorventaH
 select @totalD= sum(val_venta_Sol),@igvD=SUM(val_igv_Sol),@subTotalD = SUM(val_SubTotal_Sol) from detalle_documento where id_documento = @id_documento
 if round((@valorventaH - @totalD),0) <> 0
 begin
 
	--delete from documento  where id_documento = @id_documento
	--delete from detalle_documento  where id_documento = @id_documento
 	
	PRINT 'DEOM'	

	--select @id_documento,@valorventaH ,round((@valorventaH - @totalD),0)
	--select @totalD,@igvD,@subTotalD
 end 
 
 end	
FETCH cap INTO @id_documento,@valorventaH
END
CLOSE cap
DEALLOCATE cap


--/**********************************************************************************************/
--/****************  NUEVA LOGICA PARA LA EXPORTACIONES  ********************/
--/**********************************************************************************************/
--/**********************************************************************************************/


declare @invcNbr char(10)
declare @Custid char(11)
declare @num_doc_venta char(10)
declare @id_documentoXP char(11)
declare @periodoXP char(6)
declare @variable char(2)

DECLARE EXPORTACION CURSOR FOR

SELECT InvcNbr, CustID, Z.num_doc_venta, Z.id_documento, perpost, EXPORT FROM (
SELECT DISTINCT InvcNbr, CustID, ShipperID, EXPORT, perpost, (case when PerPost <= '201612' then '00'+right(left(invcnbr,3),2)+'-'+right(ltrim(rtrim(invcnbr)),6)  
else left(invcnbr,1)+'0'+right(left(invcnbr,3),2)+'-'+right(ltrim(rtrim(invcnbr)),5)  end) DOC_FACTELECT
 FROM tb_ventasFE WHERE EXPORT = 'XP'  AND PerPost > = '201810' AND CustID = '20100000106'
 ) X
 INNER JOIN documento Z ON X.DOC_FACTELECT = Z.num_doc_venta AND --Z.num_doc_elect = ''
Z.id_documento NOT IN (SELECT id_documentoXP FROM EXPORT_PERU)

OPEN EXPORTACION 
FETCH EXPORTACION INTO @invcNbr,@Custid,@num_doc_venta,@id_documentoXP,@periodoXP,@variable
WHILE (@@FETCH_STATUS = 0 )
BEGIN
 begin
	
	if @Custid = '20100000106' and @periodoXP > = '201810' and @variable = 'XP'
		BEGIN
			
			PRINT 'ENTRA'

			UPDATE T SET precio_unit = Precio_Orig from detalle_documento T where id_documento = @id_documentoXP
			UPDATE T SET TaxId = '', id_tipoVenta = @variable, val_igv_Orig = 0, val_igv_Sol = 0, val_venta_Orig = round((cantidad * precio_unit),2)	
			from detalle_documento T where id_documento = @id_documentoXP

			UPDATE T SET val_venta_Sol = round((val_venta_Orig * d.valor_tipo_cambio),2), val_SubTotal_Orig = val_venta_Orig, 
			val_SubTotal_Sol = round((val_venta_Orig * d.valor_tipo_cambio),2), Precio_Orig = round((precio_unit * d.valor_tipo_cambio),2)
			from detalle_documento T inner join documento d on T.id_documento = d.id_documento where t.id_documento = @id_documentoXP

			update d set valor_igv_Orig = 0, valor_igv_Soles = 0, m_total_venta_Orig = (select sum(val_venta_Orig) from detalle_documento where id_documento = @id_documentoXP)
			FROM documento d where id_documento = @id_documentoXP

			update d set m_total_venta_Soles = round((m_total_venta_Orig * valor_tipo_cambio),2)
			FROM documento d where id_documento = @id_documentoXP

			INSERT INTO EXPORT_PERU (invcNbr,Custid,num_doc_venta,id_documentoXP,periodoXP,variable)
			VALUES (@invcNbr,@Custid,@num_doc_venta,@id_documentoXP,@periodoXP,@variable)

		END 
 
 end	
FETCH EXPORTACION INTO @invcNbr,@Custid,@num_doc_venta,@id_documentoXP,@periodoXP,@variable
END
CLOSE EXPORTACION
DEALLOCATE EXPORTACION


/*********** PROCESO DE MIGRACION (FIN) ************/
