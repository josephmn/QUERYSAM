select 'update PAVacacionAno set Gozados = '+cast(bdias as varchar)+' where perid = '+''''+ltrim(rtrim(PerId))+''''+' and Ano = '+''''+Ano+'''' query, *
from (
select a.Ano, a.PerId, a.FechaInicio, a.FechaFin, a.Dias, a.Gozados, a.Acuenta, sum(b.user4) bdias
from PAVacacionAno a
inner join PAPermisoVacacion b on a.PerId = b.perid and a.Ano = b.user1 and b.tipo = 'V'
inner join personal c on a.perid = c.perid
where c.perstatus <> 'R'
group by a.Ano, a.PerId, a.FechaInicio, a.FechaFin, a.Dias, a.Gozados, a.Acuenta
) x where Gozados <> bdias


select * from PAVacacionAno where perid = '73738675'
select sum(user4), user1 from PAPermisoVacacion where perid = '73738675' and tipo = 'V'
group by user1
select * from PAPermisoVacacion where perid = '73738675' and tipo = 'V'
order by user1 asc


-- update PAVacacionAno set Gozados = 20 where perid = '73738675' and Ano = '2020'


select * 
-- update PAPermisoVacacion set fechainicio = '2022-04-01', fechafin = '2022-04-15', user4 = 15
from PAPermisoVacacion where idpermiso = '006828'

-- update PAVacacionAno set Gozados = 23 where perid = '48684773' and Ano = '2018'
-- update PAVacacionAno set Gozados = 29 where perid = '22422595' and Ano = '2020'
-- update PAVacacionAno set Gozados = 16 where perid = '76385676' and Ano = '2020'
-- update PAVacacionAno set Gozados = 2 where perid = '46203303' and Ano = '2020'


select a.*, b.perfing, dateadd(year,(year(getdate())- year(a.FechaFin)),b.perfing), year(a.FechaFin) anhio_actual, 
(case when (convert(varchar(10),getdate(),120)) between a.FechaInicio and a.FechaFin then a.Dias else 30 end) dia_anhio, convert(varchar(10),getdate(),120) fecha_actual
-- update a set a.Dias = (case when (convert(varchar(10),getdate(),120)) between a.FechaInicio and a.FechaFin then a.Dias else 30 end)
from PAVacacionAno a
inner join personal b on a.PerId = b.perid
where b.perstatus <> 'R' and --a.Ano <= '2020' and 
a.FechaFin < dateadd(year,(year(getdate())- year(b.perfing)),b.perfing) and
a.PerId = '44466241'


--select * from PAVacacionAno where PerId = '70194839'

select * 
-- update PAPermisoVacacion set fechafin = '2022-01-31', user4 = 15
from PAPermisoVacacion where idpermiso = '006680'

select * 
-- update PAPermisoVacacion set user1 = 2021, motivo = 'VACACION EXCEPCIONAL PORTAL MIGRACION'
from PAPermisoVacacion where idpermiso = '006801'



--insert into PAPermisoVacacion
--(idpermiso, perid, tipo, fechainicio, fechafin, motivo, peridautoriza, confirmado, user1, user2, user3, user4, user5, 
--user6, user7, user8, user9, user10, user11, user12, idmotivo, idjusti, Modalidad, HInicio, HFin, Tiempo, FRetorno, 
--Nro, Obs, Ctrl_Date_Ins, Ctrl_User_Ins, Ctrl_Date_Up, Ctrl_User_Up)

--select '006801', perid, tipo, '2022-02-01', '2022-02-02', motivo, peridautoriza, confirmado, user1, user2, user3, 2, user5, 
--user6, user7, user8, user9, user10, user11, user12, idmotivo, idjusti, Modalidad, HInicio, HFin, Tiempo, FRetorno, 
--Nro, Obs, Ctrl_Date_Ins, Ctrl_User_Ins, Ctrl_Date_Up, Ctrl_User_Up 
---- update PAPermisoVacacion set user2 = 'SYSADMIN', motivo = 'VACACIONES EXCEPCIONAL PORTAL MIGRACION'
--from PAPermisoVacacion where perid = '42150338' and idpermiso = '006799'


-- ASP_VACACION_PORTAL

