/*
-- PARA CUANDO NO APARECE PARA ENVIAR DE BAJA
SELECT * 
-- UPDATE [VEFACTURAELECTRONICABATHD] SET id_documento = 'L000003093'
FROM [dbo].[VEFACTURAELECTRONICABATHD] WHERE id_documento IN ('X000003093') --,'X000003093')

SELECT * 
-- UPDATE [VEFACTURAELECTRONICABATHD] SET id_documento = 'L000003094'
FROM [dbo].[VEFACTURAELECTRONICABATHD] WHERE id_documento IN ('X000003094') --,'X000003093')
*/

--select * from ComprobanteRelacionado where CodProveedor = '20545569346' order by FechaEmisionComp asc

-- C : EMITIDO (PENDIENTE A PROCESAR)
-- A : ACEPTADO (ACEPTADO X SUNAT)
-- E : ENVIADO COMPROBANTE DE BAJA (ENVIO A SUNAT)
-- X : NO VALIDO

--declare @NroProc varchar(10)
--set @NroProc = 'X000000123'

-- select * from ComprobanteRelacionado where codProveedor = '20521955351'
--SELECT * 
---- update proveevor set NombreComercial = 'CORPORACION GMC S.A.C.', RazonSocial = 'CORPORACION GMC S.A.C.'
--FROM Proveevor where CodProveedor = '20521955351'
-- SELECT * FROM ComprobanteRetencion WHERE Serie = 'R001' ORDER BY Correlativo DESC

select *
-- DELETE
-- UPDATE x set estado = 'A', num_doc_elect = 'R00200123' --es_anulado = 1, fecha = '2018-05-25'
-- UPDATE X SET FECHA = '2021-08-27'
-- UPDATE X SET es_anulado = 1 --, enviado_externo = 1
-- UPDATE x set estado = 'C'
-- update x set ImporteTotalRetenidoOrig = 11.93 ,ImporteTotalRetenidoSol = 39.08
-- UPDATE X SET Serie = 'R001', es_anulado = 1, CertnbrNew = 'R001-00352', CertnbrOrig = 'R001-00352'
from ComprobanteRetencion x where NroProc IN ('C000001269') --,'X000000125')

select *
-- UPDATE P set ImporteTotalCompOrig = '415.50', ImporteTotalCompSol= '415.50', ImporteTotalCompSinRetOrig = (415.50-12.46), ImporteTotalCompSinRetSol = (415.50-12.46), ImporteTotalRetencionOrig = '12.46', ImporteTotalRetencionSol = '12.46', Nrodocumento='F001-00000119', Correlativo = '00000119'
-- UPDATE P set ImporteTotalCompOrig = '857.75', ImporteTotalCompSol= '857.75', ImporteTotalCompSinRetOrig = '832.02', ImporteTotalCompSinRetSol = '832.02', ImporteTotalRetencionOrig = '25.73', ImporteTotalRetencionSol = '25.73'
-- UPDATE p set TipoDocumento = '01', Serie = '0001', nrodocumento = replace(nrodocumento,'TEMP','0001')
-- UPDATE p set TipoDocumento = '01'
-- UPDATE p set FechaEmisionComp = '2021-08-27'
-- UPDATE P SET CORRELATIVO = '00001964', Nrodocumento = '0001-00001964'
-- update p set ImporteTotalRetencionOrig = 11.93 , ImporteTotalRetencionSol = 39.08 
-- UPDATE p set Certnbr = 'R001-00352'
-- delete top (1)
-- DELETE
--insert into ComprobanteRelacionado (NroProc, Certnbr, CodProveedor, TipoDocumento, Nrodocumento, Serie, Correlativo, LoteProviAP, RefProviAP, NumeroPago, FechaEmisionComp, 
--MonedaComprobante, TipoCambioComp, ImporteTotalCompOrig, ImporteTotalCompSol, ImporteTotalCompSinRetOrig, ImporteTotalCompSinRetSol, ImporteTotalRetencionOrig, ImporteTotalRetencionSol)

--select 'C000000533', 'R001-00386', '20600128117', TipoDocumento, '0001-00012984', Serie, '00000000', '0000000', '000000', '1', '2018-06-26', MonedaComprobante, TipoCambioComp, 
--'6728.02', '6728.02', (6728.02-201.84), (6728.02-201.84), '201.84', '201.84' 

from ComprobanteRelacionado p where NroProc IN ('C000001269') --,'X000000125') --and Nrodocumento <> '0001-00012978' 
--and Correlativo = '00000438'
--0001-00001964
select *
-- DELETE 
-- UPDATE P set FechaLotePagoDoc = '2021-08-27'
-- update p set TipoCambioPagoDoc = 3.275
-- update p set NumCompCompra = replace(NumCompCompra,'TEMP','0001')
-- UPDATE P SET NumCompCompra = '0001-00001964'
-- update p set DMontoTotalPagoDocSol = TipoCambioPagoDoc*DMontoPagoPagoDocOrig 
-- update p set DMontoTotalSinRetPagoDocSol = 1268.24375 --DMontoTotalPagoDocSol - (TipoCambioPagoDoc * 387.25)
-- UPDATE P SET FechaLotePagoDoc = '2021-02-01'
-- UPDATE p set Certnbr = 'R001-00352'
from PagoRetencion P where NumProc IN ('C000001269')  --,'X000000125')
--and LoteCompCompra = '006657'


--insert into PagoRetencion 
--(NumProc, Certnbr, NumCompCompra, LoteCompCompra, RefCompCompra, LotePagoDoc, ReferenciaLotePagoDoc, FechaLotePagoDoc, MonedaPagoDoc, TipoCambioPagoDoc, 
--DMontoPagoPagoDocOrig, DMontoTotalPagoDocSol, DMontoTotalSinRetPagoDocOrig, DMontoTotalSinRetPagoDocSol)
--SELECT NroProc, Certnbr, Nrodocumento, LoteProviAP, RefProviAP, '000000', '000000', '2019-01-08 00:00:00', MonedaComprobante, TipoCambioComp, 
--ImporteTotalCompOrig, ImporteTotalCompSol , ImporteTotalCompSinRetOrig, ImporteTotalCompSinRetSol from ComprobanteRelacionado where NroProc IN ('X000003038') --AND Nrodocumento = 'F001-00000312'

--SELECT * FROM PagoRetencion WHERE NumProc IN ('X000000508')
----delete from PagoRetencion where NumProc IN ('X000000623')
--select 'X000000647', 'R002-00103', 'F001-00000301', '001917', '001194', '000000', '000000', '2018-05-22 00:00:00', MonedaPagoDoc, TipoCambioPagoDoc, 
--'649.1', '649.1', '629.63', '629.63' from PagoRetencion where NumProc = 'C000000547'


--select 698.70 - 20.96
--X000000355
--X000000153
--S0000000498
/**
UPDATE PagoRetencion

SET 
DMontoPagoPagoDocOrig = '832.85',	DMontoTotalPagoDocSol = '832.85', 
DMontoTotalSinRetPagoDocOrig = '807.86',	DMontoTotalSinRetPagoDocSol = '807.86' where NumProc IN ('X000000125')

UPDATE ComprobanteRetencion
SET cod_zona = 'X', Serie = 'R002' where NroProc IN ('X000000125')

*/
--referecnia
--select * from ComprobanteRetencion x where NroProc IN ('X000001660') 

--select * from ComprobanteRelacionado x where NroProc IN ('X000001660') 

--select * from PagoRetencion x where NumProc IN ('X000001660') 


/******************************/ ---insert retencion se borro de solomon
/*
INSERT INTO ComprobanteRetencion (NroProc, cod_zona, NroLote, NroReferencia, CertnbrOrig, CertnbrNew, Serie, Correlativo, Fecha, RegimenRetencion, 
TasaRetencion, Comentario, MonedaImporteRetenido, TipoCambioRetencion, ImporteTotalRetenidoOrig, ImporteTotalRetenidoSol, MonedaTotalPagado, 
ImporteTotalPagadoOrig, ImporteTotalPagadoSol, CodEmisor, num_doc_elect, estado, es_anulado, enviado_mail, enviado_externo)

select 'X000001490', cod_zona, NroLote, '000116', 'R002-00116', 'R002-00116', Serie, '00116', '2018-06-20', RegimenRetencion, TasaRetencion, Comentario, 
MonedaImporteRetenido, TipoCambioRetencion, ImporteTotalRetenidoOrig, ImporteTotalRetenidoSol, MonedaTotalPagado, ImporteTotalPagadoOrig, 
ImporteTotalPagadoSol, CodEmisor, '', 'C', 1, enviado_mail, enviado_externo from ComprobanteRetencion x where NroProc IN ('C000000487') --,'X000000125')


INSERT INTO ComprobanteRelacionado (NroProc, Certnbr, CodProveedor, TipoDocumento, Nrodocumento, Serie, Correlativo, LoteProviAP, RefProviAP, NumeroPago, 
FechaEmisionComp, MonedaComprobante, TipoCambioComp, ImporteTotalCompOrig, ImporteTotalCompSol, ImporteTotalCompSinRetOrig, ImporteTotalCompSinRetSol, 
ImporteTotalRetencionOrig, ImporteTotalRetencionSol)

select 'X000001490', 'R002-00116', CodProveedor, TipoDocumento, Nrodocumento, Serie, Correlativo, '000000', '000000', NumeroPago, 
FechaEmisionComp, MonedaComprobante, TipoCambioComp, ImporteTotalCompOrig, ImporteTotalCompSol, ImporteTotalCompSinRetOrig, ImporteTotalCompSinRetSol, 
ImporteTotalRetencionOrig, ImporteTotalRetencionSol from ComprobanteRelacionado where NroProc IN ('C000000487')


INSERT INTO PagoRetencion (NumProc, Certnbr, NumCompCompra, LoteCompCompra, RefCompCompra, LotePagoDoc, ReferenciaLotePagoDoc, FechaLotePagoDoc, 
MonedaPagoDoc, TipoCambioPagoDoc, DMontoPagoPagoDocOrig, DMontoTotalPagoDocSol, DMontoTotalSinRetPagoDocOrig, DMontoTotalSinRetPagoDocSol)

select 'X000001490', 'R002-00116', NumCompCompra, '000000', '000000', LotePagoDoc, ReferenciaLotePagoDoc, FechaLotePagoDoc, 
MonedaPagoDoc, TipoCambioPagoDoc, DMontoPagoPagoDocOrig, DMontoTotalPagoDocSol, DMontoTotalSinRetPagoDocOrig, DMontoTotalSinRetPagoDocSol 
from PagoRetencion where NumProc IN ('X000001461') --,'X000000125')
*/

/*
select * from [dbo].[VEFACTURAELECTRONICA] where id_documento = 'X000001660'

select * from [dbo].[VEFACTURAELECTRONICABATHC]  

select * from [dbo].[VEFACTURAELECTRONICABATHD] where id_documento = 'X000001660'


select *
-- UPDATE x set estado = 'C' , num_doc_elect = ''--'R00200123' --es_anulado = 1, fecha = '2018-05-25'
from ComprobanteRetencion x where NroProc IN ('X000001660') --,'X000000125')

--INSERT INTO VEFACTURAELECTRONICA (id_documento, xmlbase64, nombrexml, valorcodbarras, cdrxml)
--VALUES('X000001660','','20394862704-20-R002-00000123','20394862704|R002|00123||37.02|2018-07-02|6|20602491391|','<?xml version="1.0" encoding="utf-8"?><Retention xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="urn:sunat:names:specification:ubl:peru:schema:xsd:Retention-1"><ext:UBLExtensions><ext:UBLExtension><ext:ExtensionContent><ds:Signature Id="SignatureSP"><SignedInfo xmlns="http://www.w3.org/2000/09/xmldsig#"><CanonicalizationMethod Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315" /><SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1" /><Reference URI=""><Transforms><Transform Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature" /></Transforms><DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1" /><DigestValue>jJLrMLc4xY4/ulE3DHNe91s3qS4=</DigestValue></Reference></SignedInfo><SignatureValue xmlns="http://www.w3.org/2000/09/xmldsig#">Mhl84Usi+DMtV9rGHBjq7ErAcI05yS2MraTvK2vk7862syYGRowyMyYdrC/wlRKdlrYbiy0mYWPAuZg2Ls7r+KU2tft9wG1vy8KfyW6swmYCm7HGSLPIxQgnNbcA/Miew8ouou7TfepLBQ0c+LuKW0NaALY9BnyLyU7GbMYRCqTL3aZm+7oK+rlrfVNJfrL8NwEIauLr2OeLM+2MrekYc3UMpxQWCi2oM2VeT5sKwajQwwiC7lXnuUhWSuW9zMQzIgwrJ99Xr7jbgQXYMR3LWmiy+M0s+N0BgChyvWrqzpOnV+Uz1XAE6uEx09Wg+sbmVrz3PL9WUaGyV8IJsoPIZQ==</SignatureValue><KeyInfo xmlns="http://www.w3.org/2000/09/xmldsig#"><X509Data><X509SubjectName>C=PE, CN=EDWARD CHAVEZ VILCACHAGUA, G=EDWARD, SN=CHAVEZ VILCACHAGUA, T=CONTADOR, OU=20394862704, OU=CONTABILIDAD, O=ALTOMAYO PERU S.A.C., OID.1.3.6.1.4.1.17326.30.4=DNI, OID.1.3.6.1.4.1.17326.30.3=20394862704, OID.1.3.6.1.4.1.17326.30.2=RUC, SERIALNUMBER=10861882, S=LIMA-LIMA, L=LIMA, Description=Qualified Certificate: RACER-PFVP-SW-KPSC, E=contadorgeneral@cafealtomayo.com.pe</X509SubjectName><X509Certificate>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</X509Certificate></X509Data></KeyInfo></ds:Signature></ext:ExtensionContent></ext:UBLExtension></ext:UBLExtensions><cbc:UBLVersionID>2.0</cbc:UBLVersionID><cbc:CustomizationID>1.0</cbc:CustomizationID><cac:Signature><cbc:ID>IDSignSP</cbc:ID><cac:SignatoryParty><cac:PartyIdentification><cbc:ID>20394862704</cbc:ID></cac:PartyIdentification><cac:PartyName><cbc:Name>ALTOMAYO PERU S.A.C</cbc:Name></cac:PartyName></cac:SignatoryParty><cac:DigitalSignatureAttachment><cac:ExternalReference><cbc:URI>#SignatureSP</cbc:URI></cac:ExternalReference></cac:DigitalSignatureAttachment></cac:Signature><cbc:ID>R002-00000123</cbc:ID><cbc:IssueDate>2018-07-02</cbc:IssueDate><cac:AgentParty><cac:PartyIdentification><cbc:ID schemeID="6">20394862704</cbc:ID></cac:PartyIdentification><cac:PartyName><cbc:Name>AM</cbc:Name></cac:PartyName><cac:PostalAddress><cbc:ID>140101</cbc:ID><cbc:StreetName>CAR.PANAMERICANA NORTE NRO. 3.5 (ALMACEN 1)</cbc:StreetName><cbc:CitySubdivisionName>LAMBAYEQUE</cbc:CitySubdivisionName><cbc:CityName>LAMBAYEQUE</cbc:CityName><cbc:CountrySubentity>CHICLAYO</cbc:CountrySubentity><cbc:District>CHICLAYO</cbc:District><cac:Country><cbc:IdentificationCode>PE</cbc:IdentificationCode></cac:Country></cac:PostalAddress><cac:PartyLegalEntity><cbc:RegistrationName>ALTOMAYO PERU S.A.C</cbc:RegistrationName></cac:PartyLegalEntity></cac:AgentParty><cac:ReceiverParty><cac:PartyIdentification><cbc:ID schemeID="6">20602491391</cbc:ID></cac:PartyIdentification><cac:PartyName><cbc:Name>PASTELERÍA Y PANADERÍA MICAELA  S.A.C.</cbc:Name></cac:PartyName><cac:PartyLegalEntity><cbc:RegistrationName>PASTELERÍA Y PANADERÍA MICAELA  S.A.C.</cbc:RegistrationName></cac:PartyLegalEntity></cac:ReceiverParty><sac:SUNATRetentionSystemCode>01</sac:SUNATRetentionSystemCode><sac:SUNATRetentionPercent>3.00</sac:SUNATRetentionPercent><cbc:Note>Se emite con facturas del periodo 07/2018</cbc:Note><cbc:TotalInvoiceAmount currencyID="PEN">37.02</cbc:TotalInvoiceAmount><sac:SUNATTotalPaid currencyID="PEN">1196.83</sac:SUNATTotalPaid><sac:SUNATRetentionDocumentReference><cbc:ID schemeID="01">F001-00000584</cbc:ID><cbc:IssueDate>2018-06-13</cbc:IssueDate><cbc:TotalInvoiceAmount currencyID="PEN">405.55</cbc:TotalInvoiceAmount><cac:Payment><cbc:ID>1</cbc:ID><cbc:PaidAmount currencyID="PEN">405.55</cbc:PaidAmount><cbc:PaidDate>2018-07-02</cbc:PaidDate></cac:Payment><sac:SUNATRetentionInformation><sac:SUNATRetentionAmount currencyID="PEN">12.17</sac:SUNATRetentionAmount><sac:SUNATRetentionDate>2018-06-13</sac:SUNATRetentionDate><sac:SUNATNetTotalPaid currencyID="PEN">393.38</sac:SUNATNetTotalPaid><cac:ExchangeRate><cbc:SourceCurrencyCode>PEN</cbc:SourceCurrencyCode><cbc:TargetCurrencyCode>PEN</cbc:TargetCurrencyCode><cbc:CalculationRate>1.000000</cbc:CalculationRate><cbc:Date>2018-06-13</cbc:Date></cac:ExchangeRate></sac:SUNATRetentionInformation></sac:SUNATRetentionDocumentReference><sac:SUNATRetentionDocumentReference><cbc:ID schemeID="01">F001-00000589</cbc:ID><cbc:IssueDate>2018-06-14</cbc:IssueDate><cbc:TotalInvoiceAmount currencyID="PEN">828.30</cbc:TotalInvoiceAmount><cac:Payment><cbc:ID>1</cbc:ID><cbc:PaidAmount currencyID="PEN">828.30</cbc:PaidAmount><cbc:PaidDate>2018-07-02</cbc:PaidDate></cac:Payment><sac:SUNATRetentionInformation><sac:SUNATRetentionAmount currencyID="PEN">24.85</sac:SUNATRetentionAmount><sac:SUNATRetentionDate>2018-06-14</sac:SUNATRetentionDate><sac:SUNATNetTotalPaid currencyID="PEN">803.45</sac:SUNATNetTotalPaid><cac:ExchangeRate><cbc:SourceCurrencyCode>PEN</cbc:SourceCurrencyCode><cbc:TargetCurrencyCode>PEN</cbc:TargetCurrencyCode><cbc:CalculationRate>1.000000</cbc:CalculationRate><cbc:Date>2018-06-14</cbc:Date></cac:ExchangeRate></sac:SUNATRetentionInformation></sac:SUNATRetentionDocumentReference></Retention>')




/*************************/

--delete from PagoRetencion where NumProc in (select  NroProc from ComprobanteRetencion where num_doc_elect ='' and estado ='C'  and es_anulado =0)
--delete from ComprobanteRelacionado  where NroProc in (select  NroProc from ComprobanteRetencion where num_doc_elect ='' and estado ='C'  and es_anulado =0)
--delete from ComprobanteRetencion where num_doc_elect ='' and estado ='C'  and es_anulado =0

exec LlenarRE_AM
exec LlenarRE_Cusco


declare @NroProc varchar(15)
declare @con1 int
declare @con2 int
DECLARE cap CURSOR FOR

select NroProc from ComprobanteRetencion  where num_doc_elect ='' and estado ='C'

OPEN cap 
FETCH cap INTO @NroProc
WHILE (@@FETCH_STATUS = 0 )
BEGIN
 begin
	select @con1 = count(*) from PagoRetencion where NumProc = @NroProc
	select @con2 = count(*) from ComprobanteRelacionado where NroProc = @NroProc
	if @con1 <> @con2
	BEGIN
		--DELETE from PagoRetencion where NumProc = @NroProc
		--DELETE from ComprobanteRelacionado where NroProc = @NroProc
		--DELETE from ComprobanteRetencion where NroProc = @NroProc
		PRINT 'PERRY'
	END 
 end	
FETCH cap INTO @NroProc
END
CLOSE cap
DEALLOCATE cap
*/

-- REVERSION DE RETENCION

/*
--X000002438
--R00100342

select * 
-- UPDATE x set num_doc_elect = 'R00100342', estado = 'E', es_anulado = '1'
from ComprobanteRetencion x where NroProc IN ('X000002438','C000000494')

--R00100342
/*
select * 
-- 
from ComprobanteRetencion x where NroProc IN ('X000002438','C000000494')

select * from ComprobanteRelacionado p where NroProc IN ('X000002438','C000000494') 

select * from PagoRetencion P where NumProc IN ('X000002438','C000000494')
*/

select * 
-- UPDATE T SET id_documento = 'C900000494'
from [dbo].[VEFACTURAELECTRONICA] T where id_documento = 'C000000494'

select * from [dbo].VEFACTURAELECTRONICABATHC  

select * from [dbo].[VEFACTURAELECTRONICABATHD] where id_documento = 'C000000494'
*/


/***** ejemplo para insertar una retencion anulada *****/

/*
select *
from ComprobanteRetencion x where NroProc IN ('C000000524')

select *
from ComprobanteRelacionado p where NroProc IN ('C000000524')

select *
from PagoRetencion P where NumProc IN ('C000000524')



select *
-- delete
from ComprobanteRetencion where NroProc IN ('C000000547')

--insert into ComprobanteRelacionado 
--(NroProc, Certnbr, CodProveedor, TipoDocumento, Nrodocumento, Serie, Correlativo, LoteProviAP, RefProviAP, NumeroPago, FechaEmisionComp, 
--MonedaComprobante, TipoCambioComp, ImporteTotalCompOrig, ImporteTotalCompSol, ImporteTotalCompSinRetOrig, ImporteTotalCompSinRetSol, 
--ImporteTotalRetencionOrig, ImporteTotalRetencionSol)

select *
--'C000000547', 'R001-00386', '20600128117', TipoDocumento, Nrodocumento, Serie, Correlativo, LoteProviAP, RefProviAP, NumeroPago, FechaEmisionComp, 
--MonedaComprobante, TipoCambioComp, '6728.02', '6728.02', (6728.02-201.84), (6728.02-201.84), 
--'201.84', '201.84'
from ComprobanteRelacionado where NroProc IN ('C000000547')

select *
-- delete
from PagoRetencion where NumProc IN ('C000000547')
*/



---- ERRROR CUANDO NO ENVIA POR MAL CALCULO DE TIPO DE CAMBIO RETENCION (DOL)

/*

--CREATE PROC REG_RETENCION_DOL
--@NroProc VARCHAR(10)
--AS
select *
-- UPDATE ComprobanteRetencion SET ImporteTotalRetenidoSol = round(TipoCambioRetencion * ImporteTotalRetenidoOrig,2)
-- UPDATE ComprobanteRetencion SET ImporteTotalPagadoSol = round(TipoCambioRetencion * ImporteTotalPagadoOrig,2)
from ComprobanteRetencion where NroProc IN ('X000003148')

select *
-- UPDATE ComprobanteRelacionado SET ImporteTotalCompSinRetSol = ROUND(TipoCambioComp * ImporteTotalCompSinRetOrig,2)
from ComprobanteRelacionado where NroProc IN ('X000003148')

select *
-- UPDATE PagoRetencion SET DMontoTotalPagoDocSol = ROUND(TipoCambioPagoDoc * DMontoPagoPagoDocOrig,2), DMontoTotalSinRetPagoDocSol = ROUND(TipoCambioPagoDoc * DMontoTotalSinRetPagoDocOrig,2)
from PagoRetencion where NumProc IN ('X000003148')

*/






