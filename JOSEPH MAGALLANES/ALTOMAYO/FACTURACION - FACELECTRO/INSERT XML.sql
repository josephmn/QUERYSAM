
select * from [dbo].[VEFACTURAELECTRONICA]

/*
select top 5 * from [dbo].[VEFACTURAELECTRONICABATHC]
select top 5 * from [dbo].[VEFACTURAELECTRONICABATHD]

*/



--INSERT INTO VEFACTURAELECTRONICA (id_documento,xmlbase64,nombrexml,valorcodbarras,cdrxml)
--values('H0000121372','','20394862704-01-F005-020973','20394862704|01|F005|020973|||2019-10-09|6|10200153877|','')

/*
INSERT INTO VEFACTURAELECTRONICA (id_documento,xmlbase64,nombrexml,valorcodbarras,cdrxml)
values('H0000072513','','20394862704-01-F005-12848','20394862704|01|F005|12848|||2018-08-27|6|20444654008|','<?xml version="1.0" encoding="UTF-8"?><ar:ApplicationResponse xmlns:ar="urn:oasis:names:specification:ubl:schema:xsd:ApplicationResponse-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><ext:UBLExtensions><ext:UBLExtension><ext:ExtensionContent><Signature xmlns="http://www.w3.org/2000/09/xmldsig#"><SignedInfo><CanonicalizationMethod Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#WithComments"/><SignatureMethod Algorithm="http://www.w3.org/2001/04/xmldsig-more#rsa-sha512"/><Reference URI=""><Transforms><Transform Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature"/><Transform Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#WithComments"/></Transforms><DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/><DigestValue>omepYhelfnHUqLnIZNISk4C6/Mk=</DigestValue></Reference></SignedInfo><SignatureValue>bdgBFHHJTpRYWF6sJ9phrMgxwc77xJ9ww5bPHMuNl2UN0hc0fwGyXvKQVC+TbxZ8eImBcWyiQVSK63Y1wGW60UrbQAQ8keOAlh7txDh0bQIv/dqSbs6uXjaxRWiJ6qtP/F7k3QlRctqglIp2iItIQ0lZgXFpwDsurwBJ/0GxY+lmk/z84hJQMMuxxcKtdXE2bxTobYcEXbT1RNqjg3YuYlDkKdo//tM02hVYc+08Uf8dIgmh9OanNFcS0aVehcx+G3vgTi/nMB9HMOQHJreIPj1HSmG+WjyVCWWJzj6b/tLXKsc0Ve59hmSZS2XPfGQlOHAvD5Q53XjR+dxGfV+ZHw==</SignatureValue><KeyInfo><X509Data><X509Certificate>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</X509Certificate><X509IssuerSerial><X509IssuerName>CN=GeoTrust RSA CA 2018, OU=www.digicert.com, O=DigiCert Inc, C=US</X509IssuerName><X509SerialNumber>13956682602747601529145667586552812000</X509SerialNumber></X509IssuerSerial></X509Data></KeyInfo><Proposito>Cumple proposito</Proposito><Revocacion>Cumple revocacion</Revocacion><TSL>Cumple tsl</TSL><Expiracion>No ha expirado</Expiracion></Signature></ext:ExtensionContent></ext:UBLExtension></ext:UBLExtensions><cbc:UBLVersionID>2.0</cbc:UBLVersionID><cbc:CustomizationID>1.0</cbc:CustomizationID><cbc:ID>201802647895343</cbc:ID><cbc:IssueDate>2018-09-03</cbc:IssueDate><cbc:IssueTime>18:32:37</cbc:IssueTime><cbc:ResponseDate>2018-09-04</cbc:ResponseDate><cbc:ResponseTime>04:50:06</cbc:ResponseTime><cac:Signature><cbc:ID>SignSUNAT</cbc:ID><cac:SignatoryParty><cac:PartyIdentification><cbc:ID>20131312955</cbc:ID></cac:PartyIdentification><cac:PartyName><cbc:Name>SUNAT</cbc:Name></cac:PartyName></cac:SignatoryParty><cac:DigitalSignatureAttachment><cac:ExternalReference><cbc:URI>#SignSUNAT</cbc:URI></cac:ExternalReference></cac:DigitalSignatureAttachment></cac:Signature><cac:SenderParty><cac:PartyIdentification><cbc:ID>20131312955</cbc:ID></cac:PartyIdentification></cac:SenderParty><cac:ReceiverParty><cac:PartyIdentification><cbc:ID>20394862704</cbc:ID></cac:PartyIdentification></cac:ReceiverParty><cac:DocumentResponse><cac:Response><cbc:ReferenceID>F005-12848</cbc:ReferenceID><cbc:ResponseCode>0</cbc:ResponseCode><cbc:Description>La Factura numero F005-12848, ha sido aceptada</cbc:Description></cac:Response><cac:DocumentReference><cbc:ID>F005-12848</cbc:ID></cac:DocumentReference><cac:RecipientParty><cac:PartyIdentification><cbc:ID>6 -20444654008     </cbc:ID></cac:PartyIdentification></cac:RecipientParty></cac:DocumentResponse></ar:ApplicationResponse>')
*/


SELECT * FROM cliente WHERE id_cliente = '10200153877'

SELECT estado, num_doc_elect, * 
-- update t set estado = 'A', num_doc_elect = 'F005020973'
FROM documento t WHERE id_documento = 'H0000121372'

SELECT * FROM detalle_documento WHERE id_documento = 'H0000121372'















