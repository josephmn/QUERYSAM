

select * from eclientes
--select * from eproductos
--select * from estock
--select * from evendedores
--select * from eventas


BULK INSERT eclientes1 
FROM 'C:\ftp\clientes.csv' 
	WITH (
		CODEPAGE=65001,
		FIELDTERMINATOR = '|', 
		ROWTERMINATOR = '\n', --\n
		ERRORFILE = 'C:\ftp\clientes', 
		TABLOCK
		)

-- truncate table eclientes1
-- truncate table eproductos1
-- truncate table estock1
-- truncate table evendedores1
-- truncate table eventas1

select * from eclientes1
select * from eproductos1
select * from estock1
select * from evendedores1
select * from eventas1


declare 
@archivo varchar(max),
@fecha varchar(10),
@cmd nvarchar(500)

set @fecha = convert(varchar(10),getdate(),120)
set @archivo = 'C:\ftp\clientes.csv'
set @cmd = 'RENAME "'+@archivo+'" "clientes_'+@fecha+'.csv'+'"'

--print @cmd
exec master..xp_cmdshell @cmd



ALTER TABLE eclientes1
ALTER COLUMN DiaVisita VARCHAR(20) COLLATE SQL_Latin1_General_CP1_CI_AS  --_UTF8

-- ALTER DATABASE portaldistribuidor COLLATE French_CI_AS

select * from distribuidores where v_ruc = '20453668631'


select 
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(diavisita,'+ü','A'),'+ë','E'),'+ì','I'),'+ì','I'),'+ì','I'),'+æ','Ñ') nombre_dis, 
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(NombreCliente,'+ü','A'),'+ë','E'),'+ì','I'),'+ì','I'),'+ì','I'),'+æ','Ñ') NombreCliente,
--REPLACE(diavisita,'+ì','I'), 
* from eclientes1 where diavisita like '%+%'

--03-MI+ëRCOLES
--MUOZ CABRERA EDICTA

--NombreCliente
--PISCO ESCOBAR DE DAVAN MARIA ISABEL


CREATE TABLE control
(
i_id int identity(1,1) not null,
v_ruc varchar(20) not null,
v_archivo varchar(100) not null,
i_row_success int constraint control_row_success default(0),
i_row_error int constraint control_row_error default(0),
i_cantidad float constraint control_cantidad default(0),
i_venta float constraint control_monto default(0),
d_fecha datetime constraint control_fecha default(getdate()),
)

select * from eclientes1
--select * from eproductos1
--select * from estock1
--select * from evendedores1
--select * from eventas1
select * from control1

--select sum(CantidadUV) from eventas1
--select sum(VentaSinIGV) from eventas1

--truncate table eclientes1
--truncate table eproductos1
--truncate table estock1
--truncate table evendedores1
--truncate table eventas1
--truncate table control1



declare 
@cantidad float,
@monto float

select @cantidad = sum(CantidadUV), @monto = sum(VentaSinIGV) from eventas1

update control1 set i_cantidad = round(@cantidad,2), i_venta = round(@monto,2)
where v_archivo = 'ventas'