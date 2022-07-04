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


/*************************************************************************/
/*************************************************************************/
/****************  NUEVA LOGICA PARA LA EXPORTACIONES  *******************/
/*************************************************************************/
/*************************************************************************/


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
 INNER JOIN documento Z ON X.DOC_FACTELECT = Z.num_doc_venta AND Z.num_doc_elect = ''

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

		END 
 
 end	
FETCH EXPORTACION INTO @invcNbr,@Custid,@num_doc_venta,@id_documentoXP,@periodoXP,@variable
END
CLOSE EXPORTACION
DEALLOCATE EXPORTACION

