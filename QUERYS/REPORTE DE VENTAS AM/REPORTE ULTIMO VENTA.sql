SELECT   
Lote, Correlativo, FechaEmision, FechaVenc, TipoDoc, NroSerieS, NroSerie, Numero, UltConsoli, TipoDocIdent, TaxLocId, Nomb_RazonSocial, valFacexp, BaseImponible, Exonerada, Inafecto, IGV, OtrosTributos, Percepcion, ImportTotal, TipoCambio, FR_Fecha, TipoDocFactRel, FR_SerieS, FR_Serie, FR_NroComprob, ValorFob, Activo  
  
FROM (  
select *from XVR_Sales_ReportResumen  
--UNION ALL  
--select *from AMCAF2015APP.DBO.XVR_Sales_ReportResumen  
) x    
 where   PerPost = '201511'




