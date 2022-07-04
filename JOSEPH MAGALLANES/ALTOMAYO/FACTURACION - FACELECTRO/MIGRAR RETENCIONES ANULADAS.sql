

SELECT * from PagoRetencion where NumProc = 'X000003044'
SELECT * from ComprobanteRelacionado where NroProc = 'X000003044'
SELECT * from ComprobanteRetencion where NroProc = 'X000003044'

SELECT * FROM ComprobanteRelacionado WHERE Certnbr = 'R002-00236'


--create proc error_retencion_V10000
--as
declare @NroProc1 varchar(15)
declare @xLote char(6)
declare @xPoveedor char(11)

declare @con11 int
declare @con22 int

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'refCompronRelacionado_Conerror'))                                  
begin DROP TABLE refCompronRelacionado_Conerror end      

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'refPagoRetencion_Conerror'))                                  
begin DROP TABLE refPagoRetencion_Conerror end     

--delete ERROR_RETENCION

DECLARE error_retencion CURSOR FOR

select NroProc, Nrolote, cfam.codproveedor --, rt.*
--INTO ERROR_RETENCION 
from ComprobanteRetencion  rt
left join [ALTOMAYO-WEB].AMCAF2019APP.DBO.tbviewRetenCabFE cfam on rt.NroLote = cfam.lote
where rt.num_doc_elect ='' and rt.estado ='C' and rt.NroProc NOT IN (SELECT NroProc FROM ERROR_RETENCION) AND rt.NroProc > 'X000002960' AND NroLote = '000025'


OPEN error_retencion 
FETCH error_retencion INTO @NroProc1, @xLote, @xPoveedor
WHILE (@@FETCH_STATUS = 0 )
BEGIN
 begin
		
		/**** insert a la tabla temporal ****/

		select top 1 *
		into refCompronRelacionado_Conerror
		from ComprobanteRelacionado where NroProc IN (select distinct top 1 a.NroProc from ComprobanteRetencion a
		left join ComprobanteRelacionado b on a.NroProc = b.NroProc
		where es_anulado = 0 and b.CodProveedor = '20602491391' order by a.NroProc desc) 

		select top 1 *
		into refPagoRetencion_Conerror
		from PagoRetencion where NumProc IN (select distinct top 1 a.NroProc from ComprobanteRetencion a
		left join ComprobanteRelacionado b on a.NroProc = b.NroProc
		where es_anulado = 0 and b.CodProveedor = '20602491391' order by a.NroProc desc) 

		/**** insert a la tabla temporal ****/
		
		select @con11 = count(*) from PagoRetencion where NumProc = @NroProc1
		select @con22 = count(*) from ComprobanteRelacionado where NroProc = @NroProc1
		
		if @con11 = '' and @con22 = ''
		begin
			print 'ACA ENTRA, SE CAMBIO EL NROPROC : ' + CAST(@NroProc1 AS VARCHAR)
			
			INSERT INTO ERROR_RETENCION (NroProc)
			VALUES(@NroProc1)

			update refCompronRelacionado_Conerror set NroProc = @NroProc1 where Certnbr like 'R002%'
			update refPagoRetencion_Conerror set NumProc = @NroProc1 where Certnbr like 'R002%'

			insert into ComprobanteRelacionado 
			(NroProc, Certnbr, CodProveedor, TipoDocumento, Nrodocumento, Serie, Correlativo, LoteProviAP, RefProviAP, NumeroPago, FechaEmisionComp, MonedaComprobante, 
			TipoCambioComp, ImporteTotalCompOrig, ImporteTotalCompSol, ImporteTotalCompSinRetOrig, ImporteTotalCompSinRetSol, ImporteTotalRetencionOrig, ImporteTotalRetencionSol)

			--select CPR.NroProc, CPR.CertnbrOrig, @xPoveedor , ERR.TipoDocumento, ERR.Nrodocumento, ERR.Serie, ERR.Correlativo, ERR.LoteProviAP, ERR.RefProviAP,
			--ERR.NumeroPago, ERR.FechaEmisionComp, CPR.MonedaImporteRetenido, CPR.TipoCambioRetencion, CPR.ImporteTotalPagadoOrig, CPR.ImporteTotalPagadoSol, 
			--(CPR.ImporteTotalPagadoOrig-CPR.ImporteTotalRetenidoOrig) ImporteTotalCompSinRetOrig, (CPR.ImporteTotalPagadoSol-CPR.ImporteTotalRetenidoSol) ImporteTotalCompSinRetSol,
			--CPR.ImporteTotalRetenidoOrig ImporteTotalRetencionOrig, CPR.ImporteTotalRetenidoSol ImporteTotalRetencionSol
			--from refCompronRelacionado_Conerror ERR
			--INNER JOIN ComprobanteRetencion CPR ON CPR.NroProc = ERR.NROPROC
			--where ERR.Certnbr like 'R002%' and ERR.MonedaComprobante = 'SOL'

			select CPR.NroProc, CPR.CertnbrOrig, @xPoveedor , ERR.TipoDocumento, ERR.Nrodocumento, ERR.Serie, ERR.Correlativo, ERR.LoteProviAP, ERR.RefProviAP,
			ERR.NumeroPago, ERR.FechaEmisionComp, CPR.MonedaImporteRetenido, CPR.TipoCambioRetencion, ERR.ImporteTotalCompOrig, ERR.ImporteTotalCompSol, 
			ERR.ImporteTotalCompSinRetOrig, ERR.ImporteTotalCompSinRetSol, ERR.ImporteTotalRetencionOrig, ERR.ImporteTotalRetencionSol
			from refCompronRelacionado_Conerror ERR
			INNER JOIN ComprobanteRetencion CPR ON CPR.NroProc = ERR.NROPROC
			where ERR.Certnbr like 'R002%' and ERR.MonedaComprobante = 'SOL'


			insert into PagoRetencion 
			(NumProc, Certnbr, NumCompCompra, LoteCompCompra, RefCompCompra, LotePagoDoc, ReferenciaLotePagoDoc, FechaLotePagoDoc, 
			MonedaPagoDoc, TipoCambioPagoDoc, DMontoPagoPagoDocOrig, DMontoTotalPagoDocSol, DMontoTotalSinRetPagoDocOrig, DMontoTotalSinRetPagoDocSol)

			select c2.NroProc, c2.Certnbr, c2.Nrodocumento, c2.LoteProviAP, c2.RefProviAP, c3.LotePagoDoc, c3.ReferenciaLotePagoDoc, c1.Fecha, c1.MonedaImporteRetenido, c1.TipoCambioRetencion,
			C2.ImporteTotalCompOrig, C2.ImporteTotalCompSol, C2.ImporteTotalCompSinRetOrig, C2.ImporteTotalCompSinRetSol
			from 
			ComprobanteRetencion c1 
			inner join ComprobanteRelacionado c2 on c1.NroProc = c2.NroProc
			inner join refPagoRetencion_Conerror c3 on c1.NroProc = C3.NumProc 

			--update ComprobanteRetencion set es_anulado = 1,   from ComprobanteRetencion where NroProc = @NroProc1
			
			update c1 set es_anulado = 1, c1.ImporteTotalRetenidoOrig = c2.ImporteTotalRetencionOrig, 
			c1.ImporteTotalRetenidoSol = c2.ImporteTotalRetencionSol, c1.ImporteTotalPagadoOrig = c2.ImporteTotalCompOrig, c1.ImporteTotalPagadoSol = c2.ImporteTotalCompSol
			--select c1.*
			from 
			ComprobanteRetencion c1 
			inner join refCompronRelacionado_Conerror c2 on c1.NroProc = c2.NroProc
			

		end
 end	
FETCH error_retencion INTO @NroProc1, @xLote, @xPoveedor
END
CLOSE error_retencion
DEALLOCATE error_retencion
