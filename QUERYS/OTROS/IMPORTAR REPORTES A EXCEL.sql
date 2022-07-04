use [amcaf2015app]
go


sp_helptext  
pvrec_all 'tb_repors_xls_all'

select tb_repors_xls.codigo,tb_repors_xls.nombrereporte from tb_repors_xls (FASTFIRSTROW)  where codigo like  '%'   order by codigo


select * from tb_repors_xls

select* from amcaf2015app.dbo.tb_repors_xls 

insert into amcaf2015app.dbo.tb_repors_xls (codigo,nombreReporte,descripcion,RutaOrigen,RuraDestino,archivo,storeProc )
select codigo,nombreReporte,descripcion,RutaOrigen,RuraDestino,archivo,storeProc from am2015app.dbo.tb_repors_xls