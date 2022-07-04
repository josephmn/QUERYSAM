select te.id,te.TotalMN,te.numero,te.activo,te.fecha,te.fechacrea,te.observacion,u.login,* from gen.transferenciaefectivo te
inner JOIN SEG.Usuario U ON TE.IdUsuariocrea = U.Id  
where u.login='RICHARD' and day(te.fechanegocio)=22 and 
MONTH(te.fechanegocio)=6 order by te.totalmn desc



update gen.transferenciaefectivo set activo=0,FechaModifica=GETDATE() 
where Id in ('LIM01CEN000000002784','LIM01CEN000000002785',
'LIM01CEN000000002790','LIM01CEN000000002799','LIM01CEN000000002762',
'LIM01CEN000000002791','LIM01CEN000000002793','LIM01CEN000000002761')


