

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
select * from eclientes1

select 
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(diavisita,'+ü','A'),'+ë','E'),'+ì','I'),'+ì','I'),'+ì','I'),'+æ','Ñ') nombre_dis, 
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(NombreCliente,'+ü','A'),'+ë','E'),'+ì','I'),'+ì','I'),'+ì','I'),'+æ','Ñ') NombreCliente,
--REPLACE(diavisita,'+ì','I'), 
* from eclientes1 where diavisita like '%+%'

--03-MI+ëRCOLES
--MUOZ CABRERA EDICTA

--NombreCliente
--PISCO ESCOBAR DE DAVAN MARIA ISABEL
