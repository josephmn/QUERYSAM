
CREATE VIEW dbo.xAM_PedNexSolH  
AS  
SELECT       
CONVERT(char,dbo.xAM_Nex_CAB_MOVI.nu_Correla)  AS NX_nu_Correla,   
dbo.xAM_Nex_CAB_MOVI.ch_CodDistr AS NX_ch_CodDistr,   
dbo.xAM_Nex_CAB_MOVI.ch_CodVende AS NX_ch_CodVende,   
dbo.xAM_Nex_CAB_MOVI.ch_CodRuta AS NX_ch_CodRuta,   
dbo.xAM_Nex_CAB_MOVI.ch_CodClien AS NX_ch_CodClien,   
dbo.xAM_Nex_CAB_MOVI.ch_HorInicio AS NX_ch_HorInicio,   
CONVERT(float, SUBSTRING(dbo.xAM_Nex_CAB_MOVI.ch_HorInicio, 1, 2)) + round(CONVERT(float, SUBSTRING(dbo.xAM_Nex_CAB_MOVI.ch_HorInicio, 4, 2)) / 60,2) AS NX_ch_HorInicioNum,   
dbo.xAM_Nex_CAB_MOVI.ch_HorTermi AS NX_ch_HorTermi,   
dbo.xAM_Nex_CAB_MOVI.ch_Status AS NX_ch_Status,   
dbo.xAM_Nex_CAB_MOVI.ch_ForPago AS NX_ch_ForPago,   
dbo.xAM_Nex_CAB_MOVI.ch_NoPedido AS NX_ch_NoPedido,   
dbo.xAM_Nex_CAB_MOVI.dt_FecInici AS NX_dt_FecInici,   
dbo.xAM_Nex_CAB_MOVI.dt_FecTermi AS NX_dt_FecTermi,   
dbo.xAM_Nex_CAB_MOVI.ch_FecInici AS NX_ch_FecInici,   
dbo.xAM_Nex_CAB_MOVI.vc_NroNextel AS NX_vc_NroNextel,   
dbo.xAM_Nex_CAB_MOVI.ch_CodCanal AS NX_ch_CodCanal,   
dbo.Customer.Name AS Cust_Name,   
dbo.Customer.User2 as Cust_User2,  
dbo.Customer.BillAddr1 AS Cust_BillAddr1,   
dbo.Customer.BillAddr2 AS Cust_BillAddr2,   
dbo.Customer.BillAttn AS Cust_BillAttn,   
dbo.Customer.BillCity AS Cust_BillCity,   
dbo.Customer.BillCountry AS Cust_BillCountry,   
dbo.Customer.BillFax AS Cust_BillFax,   
dbo.Customer.BillName AS Cust_BillName,   
dbo.Customer.BillPhone AS Cust_BillPhone,   
dbo.Customer.BillSalut AS Cust_BillSalut,   
dbo.Customer.BillState AS Cust_BillState,   
dbo.Customer.BillZip AS Cust_BillZip,   
Cust_CrLmt = CASE WHEN dbo.Customer.CrLmt <> 0 then dbo.Customer.CrLmt else 999999999999999 end,   
dbo.Customer.TaxID00 AS Cust_TaxID00,   
dbo.Customer.Terms AS Cust_Terms,   
dbo.Customer.priceclassid as Cust_PriceClassId,  
IsNull(dbo.CustSlsper.CreditPct,0) AS Cust_CreditPct,   
dbo.SOAddress.Addr1 AS SoAd_Addr1,   
dbo.SOAddress.Addr2 AS SoAd_Addr2,   
dbo.SOAddress.ShipToId AS SoAd_ShipToId,   
dbo.SOAddress.Attn AS SoAd_Attn,   
dbo.SOAddress.City AS SoAd_City,   
dbo.SOAddress.Country AS SoAd_Country,   
dbo.SOAddress.Name AS SoAd_Name,  
dbo.SOAddress.Phone AS SoAd_Phone,   
dbo.SOAddress.State AS SoAd_State,   
dbo.SOAddress.Zip AS SoAd_Zip,   
dbo.xAMGrupoDesp.Codigo AS Gpo_Codigo,   
dbo.xAMGrupoDesp.Descripcion AS Gpo_Desc,   
'GpoHoraMax'= CASE   
WHEN DatePart(WeekDay, dbo.xAM_Nex_CAB_MOVI.dt_FecInici)=1 then dbo.xAMSiteGrupoDesp.HoraMaxDomingo01   
WHEN DatePart(WeekDay, dbo.xAM_Nex_CAB_MOVI.dt_FecInici)=2 then dbo.xAMSiteGrupoDesp.HoraMaxLunes02   
WHEN DatePart(WeekDay, dbo.xAM_Nex_CAB_MOVI.dt_FecInici)=3 then dbo.xAMSiteGrupoDesp.HoraMaxMartes03   
WHEN DatePart(WeekDay,dbo.xAM_Nex_CAB_MOVI.dt_FecInici)=4 then dbo.xAMSiteGrupoDesp.HoraMaxMiercoles04   
WHEN DatePart(WeekDay, dbo.xAM_Nex_CAB_MOVI.dt_FecInici)=5 then dbo.xAMSiteGrupoDesp.HoraMaxJueves05   
WHEN DatePart(WeekDay, dbo.xAM_Nex_CAB_MOVI.dt_FecInici)=6 then dbo.xAMSiteGrupoDesp.HoraMaxViernes06   
WHEN DatePart(WeekDay,dbo.xAM_Nex_CAB_MOVI.dt_FecInici)=7 then dbo.xAMSiteGrupoDesp.HoraMaxSabado07   
end,   
'GpoHoraMaxNum'= CASE   
WHEN DatePart(WeekDay, dbo.xAM_Nex_CAB_MOVI.dt_FecInici)=1 then CONVERT(float, SUBSTRING(dbo.xAMSiteGrupoDesp.HoraMaxDomingo01, 1, 2)) + round(CONVERT(float, SUBSTRING(dbo.xAMSiteGrupoDesp.HoraMaxDomingo01, 4, 2)) / 60,2)  
WHEN DatePart(WeekDay, dbo.xAM_Nex_CAB_MOVI.dt_FecInici)=2 then CONVERT(float, SUBSTRING(dbo.xAMSiteGrupoDesp.HoraMaxLunes02, 1, 2)) + round(CONVERT(float, SUBSTRING(dbo.xAMSiteGrupoDesp.HoraMaxLunes02, 4, 2)) / 60,2)  
WHEN DatePart(WeekDay, dbo.xAM_Nex_CAB_MOVI.dt_FecInici)=3 then CONVERT(float, SUBSTRING(dbo.xAMSiteGrupoDesp.HoraMaxMartes03, 1, 2)) + round(CONVERT(float, SUBSTRING(dbo.xAMSiteGrupoDesp.HoraMaxMartes03, 4, 2)) / 60,2)  
WHEN DatePart(WeekDay,dbo.xAM_Nex_CAB_MOVI.dt_FecInici)=4 then CONVERT(float, SUBSTRING(dbo.xAMSiteGrupoDesp.HoraMaxMiercoles04, 1, 2)) + round(CONVERT(float, SUBSTRING(dbo.xAMSiteGrupoDesp.HoraMaxMiercoles04, 4, 2)) / 60,2)  
WHEN DatePart(WeekDay, dbo.xAM_Nex_CAB_MOVI.dt_FecInici)=5 then CONVERT(float, SUBSTRING(dbo.xAMSiteGrupoDesp.HoraMaxJueves05, 1, 2)) + round(CONVERT(float, SUBSTRING(dbo.xAMSiteGrupoDesp.HoraMaxJueves05, 4, 2)) / 60,2)  
WHEN DatePart(WeekDay, dbo.xAM_Nex_CAB_MOVI.dt_FecInici)=6 then CONVERT(float, SUBSTRING(dbo.xAMSiteGrupoDesp.HoraMaxViernes06, 1, 2)) + round(CONVERT(float, SUBSTRING(dbo.xAMSiteGrupoDesp.HoraMaxViernes06, 4, 2)) / 60,2)  
WHEN DatePart(WeekDay,dbo.xAM_Nex_CAB_MOVI.dt_FecInici)=7 then CONVERT(float, SUBSTRING(dbo.xAMSiteGrupoDesp.HoraMaxSabado07, 1, 2)) + round(CONVERT(float, SUBSTRING(dbo.xAMSiteGrupoDesp.HoraMaxSabado07, 4, 2)) / 60,2)  
end,   
dbo.xAMSiteDistrib.SiteId AS SolSiteID,   
dbo.xAMSiteDistrib.WhSeloc AS SolWhSeloc,   
dbo.xAMEquSolNextel.TipoDocSolomon AS SolTipoDoc,   
dbo.xAMEquSolNextel.SOTypeID AS SolSOTypeID,  
dbo.Site.S4Future10 AS Site_DiasCierre  
FROM         dbo.xAMSiteDistrib   
INNER JOIN dbo.xAMGrupoDesp   
INNER JOIN dbo.xAM_Nex_CAB_MOVI   
INNER JOIN dbo.Customer ON dbo.xAM_Nex_CAB_MOVI.ch_CodClien = dbo.Customer.CustId ON dbo.xAMGrupoDesp.Codigo = dbo.Customer.S4Future11 ON dbo.xAMSiteDistrib.ch_CodDistr = dbo.xAM_Nex_CAB_MOVI.ch_CodDistr   
INNER JOIN dbo.SOAddress ON dbo.xAM_Nex_CAB_MOVI.ch_CodClien = dbo.SOAddress.CustId   
INNER JOIN dbo.Site ON dbo.xAMSiteDistrib.SiteId = dbo.Site.SiteId   
INNER JOIN dbo.xAMSiteGrupoDesp ON dbo.xAMSiteDistrib.SiteId = dbo.xAMSiteGrupoDesp.SiteId AND dbo.xAMGrupoDesp.Codigo = dbo.xAMSiteGrupoDesp.GrupoDespID   
INNER JOIN dbo.xAMEquSolNextel ON dbo.xAMSiteGrupoDesp.SiteId = dbo.xAMEquSolNextel.SiteId AND  dbo.xAMSiteGrupoDesp.GrupoDespID = dbo.xAMEquSolNextel.GrupoDespID AND dbo.xAM_Nex_CAB_MOVI.ch_ForPago = dbo.xAMEquSolNextel.TipoDocNextel   
LEFT OUTER JOIN dbo.CustSlsper ON dbo.xAM_Nex_CAB_MOVI.ch_CodClien = dbo.CustSlsper.CustID   
WHERE   (dbo.xAM_Nex_CAB_MOVI.ch_Status = 'T') AND (dbo.xAM_Nex_CAB_MOVI.ch_NoPedido = ') and  (dbo.xAMSiteDistrib.SiteId in (SELECT DISTINCT SITEID  FROM XAMSITEDISTRIB))  





