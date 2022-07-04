select   
rtrim(ltrim(batnbr))+'AP','M' + right('000'+ ltrim(ROW_NUMBER()OVER (PARTITION BY batnbr  ORDER BY batnbr)),3) Correlativo,convert(varchar, InvcDate, 103)InvcDate, convert(varchar, DueDate, 103) DueDate,tipodoc,nroserie,(case when TipoDoc ='50' then year(InvcDate) else '' end)  Anio,  
(case when TipoDoc <>'91' then NroComp else '' end) NroComp,  
0 Consolidado,  
(case when len(Ruc) = 8 then '1' when len(Ruc) = 11 and ( left(rtrim(ltrim(Ruc)),2)='10' or left(rtrim(ltrim(Ruc)),2)='20' or left(rtrim(ltrim(Ruc)),2)='15'  or left(rtrim(ltrim(Ruc)),2)='17'  )  then '6'  else '0' end  ) Tipo,  
ruc,rtrim(ltrim(Proveedor)) Proveedor,  
dbo.FormatearDecimal((case when round((case when doctype ='AD' then Gravado1 *-1 else Gravado1 end),2) <> 0 then ltrim( round((case when doctype ='AD' then Gravado1 *-1 else Gravado1 end),2)) else '0.00' end),2, 0, 12) GBase,  
dbo.FormatearDecimal(round((case when doctype ='AD' then IGV1 *-1 else IGV1 end),2),2, 0, 12) GIGV,  
dbo.FormatearDecimal(round((case when doctype ='AD' then Gravado2 *-1 else Gravado2 end),2),2, 0, 12)  GNBase,  
dbo.FormatearDecimal(round((case when doctype ='AD' then IGV2 *-1 else IGV2 end),2),2, 0, 12)  GNGIGV,  
dbo.FormatearDecimal(round((case when doctype ='AD' then Gravado3 *-1 else Gravado3 end),2),2, 0, 12)  NGBase,  
dbo.FormatearDecimal(round((case when doctype ='AD' then IGV3 *-1 else IGV3 end),2),2, 0, 12)  NGIGV,  
dbo.FormatearDecimal(round((case when doctype ='AD' then No_Afecto *-1 else No_Afecto end),2),2, 0, 12)  No_Afecto,  
dbo.FormatearDecimal(round((case when doctype ='AD' then ISC *-1 else ISC end),2),2, 0, 12)  ISC,  
dbo.FormatearDecimal(round((case when doctype ='AD' then (Otros_Tributos + RETENCIONES )  *-1 else (Otros_Tributos + RETENCIONES ) end),2),2, 0, 12)  OtraTax,  
dbo.FormatearDecimal(round((case when doctype ='AD' then (Afecto + No_Afecto + IGV1 + IGV2 + IGV3 + ISC + RETENCIONES + Otros_Tributos)  *-1 else (Afecto + No_Afecto + IGV1 + IGV2 + IGV3 + ISC + RETENCIONES + Otros_Tributos) end),2),2, 0, 12)  Total,  
dbo.FormatearDecimal((case when curyid ='DOL' then round(curyrate,3) else 0 end),3, 0, 12) TipoCambio,  
(case when FactRel  <> ''  then convert(varchar, FechaFactRela, 103) else '01/01/0001' end) FechaFactRela,  
(case when TipoCodFactRela  <> ''  then TipoCodFactRela else '00' end) TipoCodFactRela,  
(case when SerFactRela  <> ''  then SerFactRela else '-' end) SerFactRela,  
'' CodDepnAdua,  
(case when FactRel  <> ''  then FactRel else '-' end)FactRel,  
'-' NoDomiciliado,  
(case when user2 <> '' then convert(varchar, user7, 103) else '01/01/0001' end) FechaDetrac,  
(case when user2 <> '' then user2 else '0' end) NumeroDetrac,  
 Retencion,  
( case when ltrim(year(InvcDate))+ right('00' + ltrim(month (InvcDate)),2) = PerPost then 1 else 6 end ) Oportunidad  
FROM         xvr_regcom2009Xls  
where tipodoc not in ('OD','ND')   
 and PerPost ='201502'














