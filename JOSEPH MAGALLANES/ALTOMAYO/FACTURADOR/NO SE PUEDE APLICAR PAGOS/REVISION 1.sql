SELECT
    xDespachoShippers."NroDespacho", xDespachoShippers."PlacaCamion", xDespachoShippers."FechaDespacho", xDespachoShippers."user05",
    xAMDocum_Afectos."InvcNbr_Primero", xAMDocum_Afectos."CantDocAfectos",
    Carrier."CarrierID", Carrier."Descr",
    SOShipHeader."Cancelled", SOShipHeader."CustID", SOShipHeader."InvcDate", SOShipHeader."InvcNbr", SOShipHeader."ShipAddr1", SOShipHeader."ShipAddr2", SOShipHeader."SlsperID", SOShipHeader."TermsID", SOShipHeader."TotInvc", SOShipHeader."User2",
    xDriver."DriverName",
    xam_embarques_marcados_ventas."marca",
    Terms."DueIntrv",
    Customer."Name", Customer."S4Future02",
    Territory."Descr",
    vs_Company."CpnyName"
FROM
    { oj (((((((("AM2018APP"."dbo"."xDespachoShippers" xDespachoShippers LEFT OUTER JOIN "AM2018APP"."dbo"."Carrier" Carrier ON
        xDespachoShippers."Transportista" = Carrier."CarrierID")
     INNER JOIN "AM2018APP"."dbo"."SOShipHeader" SOShipHeader ON
        xDespachoShippers."Shipperid" = SOShipHeader."ShipperID" AND
    xDespachoShippers."user05" = SOShipHeader."SiteID" AND
    xDespachoShippers."NroDespacho" = SOShipHeader."User1")
     LEFT OUTER JOIN "AM2018APP"."dbo"."xDriver" xDriver ON
        xDespachoShippers."LicenciaChofer" = xDriver."DriverLic")
     INNER JOIN "AM2018APP"."dbo"."xam_embarques_marcados_ventas" xam_embarques_marcados_ventas ON
        xDespachoShippers."Shipperid" = xam_embarques_marcados_ventas."shipperid")
     LEFT OUTER JOIN "AM2018APP"."dbo"."xAMDocum_Afectos" xAMDocum_Afectos ON
        xDespachoShippers."Shipperid" = xAMDocum_Afectos."shipperid")
     INNER JOIN "AM2018APP"."dbo"."Customer" Customer ON
        SOShipHeader."CustID" = Customer."CustId")
     LEFT OUTER JOIN "AM2018APP"."dbo"."Territory" Territory ON
        SOShipHeader."ShipCity" = Territory."Territory")
     INNER JOIN "AM2018APP"."dbo"."vs_Company" vs_Company ON
        SOShipHeader."CpnyID" = vs_Company."CpnyID")
    LEFT OUTER JOIN "AM2018APP"."dbo"."Terms" Terms ON
        SOShipHeader."TermsID" = Terms."TermsId"}
        WHERE SOShipHeader.User1  ='S000004751' AND SOShipHeader.Cancelled = '0'
ORDER BY
	SOShipHeader.InvcNbr asc
    --xDespachoShippers."user05" ASC,
    --xDespachoShippers."NroDespacho" ASC


select distinct User1, SiteID from SOShipHeader where ARBatNbr = '003996' and Cancelled = 0

select distinct arbatnbr from SOShipHeader where user1 in (select distinct User1 from SOShipHeader where ARBatNbr = '003996' and Cancelled = 1) --and Cancelled = 1


/*****************************************************************************************************************/
/************************ REVISION DE VISTA PANTALLA (APLICAR PAGOS EN BLOQUES) **********************************/
/*****************************************************************************************************************/

select BatNbr, RefNbr, Rlsed, * from ardoc where RefNbr in (select InvcNbr from SOShipHeader where user1 = 'S000004750' and Cancelled ='0') and RefNbr not in (

 SELECT ARDoc.RefNbr AS Documento
 
 --SOShipHeader.SlsperID as CodVendedor, SOShipHeader.CustID AS RUC, SOShipHeader.BillName AS NombClte, ARDoc.RefNbr AS Documento,       
 --       ARDoc.DocDate as FechaDoc, ARDoc.CuryOrigDocAmt as Monto, ARDoc.CuryDocBal as MontoAppl, ARDoc.CuryDocBal as Saldo ,       
 --       phedespacho.almacen, phedespacho.nrodespacho,       
 --       phedespacho.tipo as tipodespacho,ARDoc.BankAcct,ARDoc.BankSub,'1',null  	    
 FROM         phedespacho INNER JOIN      
        xDespachoShippers ON phedespacho.nrodespacho = xDespachoShippers.NroDespacho AND       
        phedespacho.almacen = xDespachoShippers.user05 INNER JOIN      
        SOShipHeader ON xDespachoShippers.Shipperid = SOShipHeader.ShipperID INNER JOIN      
        ARDoc ON SOShipHeader.InvcNbr = ARDoc.RefNbr AND SOShipHeader.ARBatNbr = ARDoc.BatNbr      
 WHERE     (ARDoc.DocBal > 0.0) AND (ARDoc.Rlsed = 1) AND (SOShipHeader.TermsID = '01') and phedespacho.almacen = 'cixpt' and phedespacho.nrodespacho = 'S000004750' 
 )


select BatNbr, RefNbr, CuryDocBal, DocBal, Rlsed, * from ARDoc where RefNbr in  (select InvcNbr from SOShipHeader where user1 = 'S000004750')

select * from phedespacho where nrodespacho = 'S000004750'

select Shipperid, User8, TermsId from SOShipHeader where user1 = 'S000004750'

select * from xDespachoShippers where Shipperid in (select Shipperid from SOShipHeader where user1 = 'S000004750')
