ALTER PROC EXPORT_VENTAS
@PERIODO CHAR(6)
AS

DELETE FROM tb_exp_ventas
INSERT INTO (Lote,Correlativo,FechaVenc,TipoDoc,NroSerieS,NroSerie,Numero,UltConsoli,TipoDocIdent,
TaxLocId,Nomb_RazonSocial,valFacexp,BaseImponible,Exonerada,Inafecto,IGV,OtrosTributos,Percepcion,
ImportTotal,TipoCambio,FR_Fecha,TipoDocFactRel,FR_SerieS,FR_Serie,FR_NroComprob,ValorFob,Activo)
select          
rtrim(ltrim(ARBatNbr))+'AR' Lote,'M' + right('000000'+ ltrim(ROW_NUMBER()OVER (PARTITION BY ARBatNbr  ORDER BY ARBatNbr)),6) Correlativo ,  convert(varchar, InvcDate, 103)FechaEmision, convert(varchar, DateVenc, 103) FechaVenc,  TipoDoc,        
 '00'+ right( NroSerie,2) NroSerieS, NroSerie, Numero ,UltConsoli,        
(case when len(ltrim(X.custid ))  = 8 then  '1' when TipoDoc ='01' and  (len(ltrim(X.custid )) = 11 and (left(ltrim(X.custid ),2) ='10' or left(ltrim(X.custid ),2) = '20' or left(ltrim(X.custid ),2) ='15')) then '6'       
when X.custid  ='00000000000' then '0' else '1' end) TipoDocIdent,        
(case when X.custid  ='88888888888' then '-' when X.custid  ='00000000000' then '0' when TipoDoc ='03' and len(ltrim(X.custid ))  in (9,10,11) then right(left(rtrim(ltrim(X.custid )),10),8)         
when TipoDoc ='03' and len(ltrim(X.custid ))  < (8) then right('00000000'+ rtrim(ltrim(X.custid )) ,8)  else X.custid  end ) TaxLocId ,        
(case when cancelled = 1 then   'ANULADO' else (case when X.custid  ='88888888888' then 'CONSOLIDADO' else ( SELECT  Name FROM CUSTOMER WHERE CUSTID =X.custid ) end )  end) Nomb_RazonSocial ,dbo.FormatearDecimal(0,2, 0, 12) valFacexp,        
dbo.FormatearDecimal(round((case  when(ShipperID = '' and doctype='CM')  or (ShipperID = 'CAFETERIA' and doctype='CM') then  (ValorVta - No_Afecto) * -1 else  (ValorVta - No_Afecto) end ),2),2, 0, 12)  BaseImponible,        
dbo.FormatearDecimal(round((case when X.curyid = 'DOL'  and ((ShipperID = '' and doctype='CM') or (ShipperID = 'CAFETERIA' and doctype='CM')) then  0.0 when X.curyid = 'DOL'  then 0.0 else 0 end),2),2, 0, 12)  Exonerada,        
dbo.FormatearDecimal(round((case  when(ShipperID = '' and doctype='CM')  or (ShipperID = 'CAFETERIA' and doctype='CM') then  No_Afecto * -1 else   No_Afecto end ),2),2, 0, 12)  Inafecto,        
dbo.FormatearDecimal(round((case  when(ShipperID = '' and doctype='CM')  or (ShipperID = 'CAFETERIA' and doctype='CM') then  All_Tax_Total * -1 else   All_Tax_Total end ),2),2, 0, 12)  IGV,        
dbo.FormatearDecimal(round((case  when(ShipperID = '' and doctype='CM')  or (ShipperID = 'CAFETERIA' and doctype='CM') then  Otros_Tax * -1 else   Otros_Tax end ),2),2, 0, 12)  OtrosTributos,ROUND(Percepcion,2)Percepcion,        
dbo.FormatearDecimal(round((case  when(ShipperID = '' and doctype='CM')  or (ShipperID = 'CAFETERIA' and doctype='CM') then  TotInvc * -1 else   TotInvc end ),2),2, 0, 12)  ImportTotal,        
dbo.FormatearDecimal((case when ltrim(X.curyid) = 'DOL'  then curyrate else 0 end ),3, 0, 12)  TipoCambio,        
(case when FactRel <> ''  then convert(varchar, DateFactRel, 103) else '01/01/0001' end ) FR_Fecha,         
(case when TipoDocFactRel <> ''  then  TipoDocFactRel else '00'  end )TipoDocFactRel,        
(case when FactRel <> ''  then  '00'+ right( Left (FactRel, 3),2) else '-'  end ) FR_SerieS,        
(case when FactRel <> ''  then Left (FactRel, 3)  else '-'  end ) FR_Serie,        
(case when FactRel <> ''  then Right (Left (FactRel, 10), 7)  else '-'  end ) FR_NroComprob,        
dbo.FormatearDecimal(0,2, 0, 12) ValorFob,      
(case when X.custid  ='00000000000' then 2 else 1 end ) Activo     
 from XVR_Sales_Report2009XLS X         
 where   PerPost   = @PERIODO

GO

ALTER VIEW EXP_VENTAS 
AS
select          
rtrim(ltrim(ARBatNbr))+'AR' Lote,'M' + right('000000'+ ltrim(ROW_NUMBER()OVER (PARTITION BY ARBatNbr  ORDER BY ARBatNbr)),6) Correlativo ,  convert(varchar, InvcDate, 103)FechaEmision, convert(varchar, DateVenc, 103) FechaVenc,  TipoDoc,        
 '00'+ right( NroSerie,2) NroSerieS, NroSerie, Numero ,UltConsoli,        
(case when len(ltrim(X.custid ))  = 8 then  '1' when TipoDoc ='01' and  (len(ltrim(X.custid )) = 11 and (left(ltrim(X.custid ),2) ='10' or left(ltrim(X.custid ),2) = '20' or left(ltrim(X.custid ),2) ='15')) then '6'       
when X.custid  ='00000000000' then '0' else '1' end) TipoDocIdent,        
(case when X.custid  ='88888888888' then '-' when X.custid  ='00000000000' then '0' when TipoDoc ='03' and len(ltrim(X.custid ))  in (9,10,11) then right(left(rtrim(ltrim(X.custid )),10),8)         
when TipoDoc ='03' and len(ltrim(X.custid ))  < (8) then right('00000000'+ rtrim(ltrim(X.custid )) ,8)  else X.custid  end ) TaxLocId ,        
(case when cancelled = 1 then   'ANULADO' else (case when X.custid  ='88888888888' then 'CONSOLIDADO' else ( SELECT  Name FROM CUSTOMER WHERE CUSTID =X.custid ) end )  end) Nomb_RazonSocial ,dbo.FormatearDecimal(0,2, 0, 12) valFacexp,        
dbo.FormatearDecimal(round((case  when(ShipperID = '' and doctype='CM')  or (ShipperID = 'CAFETERIA' and doctype='CM') then  (ValorVta - No_Afecto) * -1 else  (ValorVta - No_Afecto) end ),2),2, 0, 12)  BaseImponible,        
dbo.FormatearDecimal(round((case when X.curyid = 'DOL'  and ((ShipperID = '' and doctype='CM') or (ShipperID = 'CAFETERIA' and doctype='CM')) then  0.0 when X.curyid = 'DOL'  then 0.0 else 0 end),2),2, 0, 12)  Exonerada,        
dbo.FormatearDecimal(round((case  when(ShipperID = '' and doctype='CM')  or (ShipperID = 'CAFETERIA' and doctype='CM') then  No_Afecto * -1 else   No_Afecto end ),2),2, 0, 12)  Inafecto,        
dbo.FormatearDecimal(round((case  when(ShipperID = '' and doctype='CM')  or (ShipperID = 'CAFETERIA' and doctype='CM') then  All_Tax_Total * -1 else   All_Tax_Total end ),2),2, 0, 12)  IGV,        
dbo.FormatearDecimal(round((case  when(ShipperID = '' and doctype='CM')  or (ShipperID = 'CAFETERIA' and doctype='CM') then  Otros_Tax * -1 else   Otros_Tax end ),2),2, 0, 12)  OtrosTributos,ROUND(Percepcion,2)Percepcion,        
dbo.FormatearDecimal(round((case  when(ShipperID = '' and doctype='CM')  or (ShipperID = 'CAFETERIA' and doctype='CM') then  TotInvc * -1 else   TotInvc end ),2),2, 0, 12)  ImportTotal,        
dbo.FormatearDecimal((case when ltrim(X.curyid) = 'DOL'  then curyrate else 0 end ),3, 0, 12)  TipoCambio,        
(case when FactRel <> ''  then convert(varchar, DateFactRel, 103) else '01/01/0001' end ) FR_Fecha,         
(case when TipoDocFactRel <> ''  then  TipoDocFactRel else '00'  end )TipoDocFactRel,        
(case when FactRel <> ''  then  '00'+ right( Left (FactRel, 3),2) else '-'  end ) FR_SerieS,        
(case when FactRel <> ''  then Left (FactRel, 3)  else '-'  end ) FR_Serie,        
(case when FactRel <> ''  then Right (Left (FactRel, 10), 7)  else '-'  end ) FR_NroComprob,        
dbo.FormatearDecimal(0,2, 0, 12) ValorFob,      
(case when X.custid  ='00000000000' then 2 else 1 end ) Activo   
 from XVR_Sales_Report2009XLS X   

GO

--****************************************************


CREATE PROC CARGAR_TABLA_VENTAS
@PERPOST CHAR(6)
AS 
BEGIN
DELETE FROM tb_exp_ventas
INSERT INTO tb_exp_ventas (Lote,Correlativo,FechaEmision,FechaVenc,TipoDoc,NroSerieS,NroSerie,Numero,UltConsoli,TipoDocIdent,
TaxLocId,Nomb_RazonSocial,valFacexp,BaseImponible,Exonerada,Inafecto,IGV,OtrosTributos,Percepcion,
ImportTotal,TipoCambio,FR_Fecha,TipoDocFactRel,FR_SerieS,FR_Serie,FR_NroComprob,ValorFob,Activo)
select          
rtrim(ltrim(ARBatNbr))+'AR' Lote,'M' + right('000000'+ ltrim(ROW_NUMBER()OVER (PARTITION BY ARBatNbr  ORDER BY ARBatNbr)),6) Correlativo ,  convert(varchar, InvcDate, 103)FechaEmision, convert(varchar, DateVenc, 103) FechaVenc,  TipoDoc,        
 '00'+ right( NroSerie,2) NroSerieS, NroSerie, Numero ,UltConsoli,        
(case when len(ltrim(X.custid ))  = 8 then  '1' when TipoDoc ='01' and  (len(ltrim(X.custid )) = 11 and (left(ltrim(X.custid ),2) ='10' or left(ltrim(X.custid ),2) = '20' or left(ltrim(X.custid ),2) ='15')) then '6'       
when X.custid  ='00000000000' then '0' else '1' end) TipoDocIdent,        
(case when X.custid  ='88888888888' then '-' when X.custid  ='00000000000' then '0' when TipoDoc ='03' and len(ltrim(X.custid ))  in (9,10,11) then right(left(rtrim(ltrim(X.custid )),10),8)         
when TipoDoc ='03' and len(ltrim(X.custid ))  < (8) then right('00000000'+ rtrim(ltrim(X.custid )) ,8)  else X.custid  end ) TaxLocId ,        
(case when cancelled = 1 then   'ANULADO' else (case when X.custid  ='88888888888' then 'CONSOLIDADO' else ( SELECT  Name FROM CUSTOMER WHERE CUSTID =X.custid ) end )  end) Nomb_RazonSocial ,dbo.FormatearDecimal(0,2, 0, 12) valFacexp,        
dbo.FormatearDecimal(round((case  when(ShipperID = '' and doctype='CM')  or (ShipperID = 'CAFETERIA' and doctype='CM') then  (ValorVta - No_Afecto) * -1 else  (ValorVta - No_Afecto) end ),2),2, 0, 12)  BaseImponible,        
dbo.FormatearDecimal(round((case when X.curyid = 'DOL'  and ((ShipperID = '' and doctype='CM') or (ShipperID = 'CAFETERIA' and doctype='CM')) then  0.0 when X.curyid = 'DOL'  then 0.0 else 0 end),2),2, 0, 12)  Exonerada,        
dbo.FormatearDecimal(round((case  when(ShipperID = '' and doctype='CM')  or (ShipperID = 'CAFETERIA' and doctype='CM') then  No_Afecto * -1 else   No_Afecto end ),2),2, 0, 12)  Inafecto,        
dbo.FormatearDecimal(round((case  when(ShipperID = '' and doctype='CM')  or (ShipperID = 'CAFETERIA' and doctype='CM') then  All_Tax_Total * -1 else   All_Tax_Total end ),2),2, 0, 12)  IGV,        
dbo.FormatearDecimal(round((case  when(ShipperID = '' and doctype='CM')  or (ShipperID = 'CAFETERIA' and doctype='CM') then  Otros_Tax * -1 else   Otros_Tax end ),2),2, 0, 12)  OtrosTributos,ROUND(Percepcion,2)Percepcion,        
dbo.FormatearDecimal(round((case  when(ShipperID = '' and doctype='CM')  or (ShipperID = 'CAFETERIA' and doctype='CM') then  TotInvc * -1 else   TotInvc end ),2),2, 0, 12)  ImportTotal,        
dbo.FormatearDecimal((case when ltrim(X.curyid) = 'DOL'  then curyrate else 0 end ),3, 0, 12)  TipoCambio,        
(case when FactRel <> ''  then convert(varchar, DateFactRel, 103) else '01/01/0001' end ) FR_Fecha,         
(case when TipoDocFactRel <> ''  then  TipoDocFactRel else '00'  end )TipoDocFactRel,        
(case when FactRel <> ''  then  '00'+ right( Left (FactRel, 3),2) else '-'  end ) FR_SerieS,        
(case when FactRel <> ''  then Left (FactRel, 3)  else '-'  end ) FR_Serie,        
(case when FactRel <> ''  then Right (Left (FactRel, 10), 7)  else '-'  end ) FR_NroComprob,        
dbo.FormatearDecimal(0,2, 0, 12) ValorFob,      
(case when X.custid  ='00000000000' then 2 else 1 end ) Activo     
 from XVR_Sales_Report2009XLS X         
 where   PerPost   = @PERPOST
END
GO

















