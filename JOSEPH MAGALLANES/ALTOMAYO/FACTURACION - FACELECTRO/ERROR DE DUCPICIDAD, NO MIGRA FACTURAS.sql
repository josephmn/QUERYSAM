USE AMFACTELECT
GO

SELECT * FROM DOCUMENTO WHERE SERIE_COMPROBANTE = 'B005' AND NRO_COMPROBANTE = '44169'

--PROCESO LAISSON PARA MIGRAR FACTURA
--exec FE_migrarDocumento2 'H','B050044264'


--VERIFICACION DE LOS DOCUMENTOS EN TB_VENTASFE
DECLARE @InvcNbr CHAR(11)
SET @InvcNbr = 'B050044270'

select LineRef, * from tb_ventasFE where InvcNbr =@InvcNbr --id_tipoVenta
select LineRef, * from [ALTOMAYO-TEMP].AM2018APP.dbo.tb_ventasFE where InvcNbr = @InvcNbr



--CONSULTA A DISTINCT PARA INSERT
DECLARE @indetificador char(1)
SET @indetificador = 'H'  -- "C" CALLAO ALMACEN, "X" CHICLAYO, "H" HUANCAYO, "S" CALLAO OFICINA

--select distinct ARBatNbr from (
select distinct top 9999999 invcnbr,custid,ARBatNbr from dbo.tb_ventasFE WHERE --perpost >='201612' and                                 
ltrim(rtrim(ARBatNbr)) <>'' --and invcdate >='2016-11-28 00:00:00'  --and invcnbr ='F700000006'-- status ='A'   --(CUSTID = '20395592344')                                      
and   (case when PerPost <= '201612' then '00'+right(left(invcnbr,3),2)+'-'+right(ltrim(rtrim(invcnbr)),6)  else left(invcnbr,1)+'0'+right(left(invcnbr,3),2)+'-'+right(ltrim(rtrim(invcnbr)),5)  end)  
collate Modern_Spanish_CI_AS not in                    
(select num_doc_venta from DOCUMENTO )                                 
AND (CASE when left(invcnbr,3) in ('F01','B01','F02','B02','F16','B16','C78') THEN 'C'                                 
   when left(invcnbr,3) in ('F03','B03','F04','B04','F66','B66','C01') THEN 'X'                                
   when left(invcnbr,3) in ('F05','B05','F06','B06','F58','B58','C37') THEN 'H'                                
   when left(invcnbr,3) in ('F08','B08','F09','B09','F10','B10','F68','B15','C15','C16') THEN 'S' END) = @indetificador  --and InvcNbr  = 'B050044270'                               
--order by invcnbr    )x         


-- SELECT A LAS TABLAS INVOLUCRADAS
DECLARE @BatNbr char(6), @InvcNbrr char(11)
SET @BatNbr = '004012' 
SET @InvcNbrr = 'B050044166'

SELECT ARBATNBR, INVCNBR, * FROM [ALTOMAYO-TEMP].AM2018APP.dbo.tb_ventasFE WHERE ARBATNBR = @BatNbr AND INVCNBR = @InvcNbrr
SELECT BATNBR, REFNBR, doctype, user6, * FROM [ALTOMAYO-TEMP].AM2018APP.dbo.ARDOC WHERE BATNBR = @BatNbr AND REFNBR = @InvcNbrr
SELECT batnbr, refnbr, ACCT, invtid, qty, LineRef, CustId,* FROM [ALTOMAYO-TEMP].AM2018APP.dbo.ARTRAN where BATNBR = @BatNbr AND REFNBR = @InvcNbrr


-- ERROR DE DUPLICIDAD

 SELECT BATNBR, REFNBR, doctype, user6, * FROM [ALTOMAYO-TEMP].AM2018APP.dbo.ARDOC WHERE BATNBR = '004012' --AND REFNBR = 'B050044166'

 select BATNBR, REFNBR, doctype, user6,* 
 --update ar set User6 = '03' 
 from [ALTOMAYO-TEMP].AM2018APP.dbo.ARDOC ar where BATNBR = '004012'

