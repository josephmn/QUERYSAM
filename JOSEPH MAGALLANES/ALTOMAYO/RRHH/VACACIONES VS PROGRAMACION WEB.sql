
SELECT * FROM pa_cronogramamensual WHERE v_mes = 3

-- truncate table pa_solicitudvacaciones

SELECT * FROM pa_solicitudvacaciones

--INSERT INTO pa_solicitudvacaciones 
--(v_dni, d_finicio, d_ffin, i_estado, d_aprobacion, v_crtd_user, d_crtd_date, v_lupd_user, d_lupd_date)

--SELECT perid, fechainicio, fechafin, 2, '1900-01-01', '88888888', getdate(), '88888888', getdate() FROM (
--SELECT DISTINCT perid, min(fechainicio) fechainicio, max(fechafin) fechafin 
--FROM [ALTOMAYO-WEB].[AM2021APP].dbo.PAPermisoVacacion WHERE user6 = '202105' and tipo = 'V'
--GROUP BY perid
--) X INNER JOIN 
--(
--SELECT PerId DNI, DIAS DIASX 
--FROM [ALTOMAYO-WEB].[AM2021APP].dbo.PALiqVacacion 
--WHERE PeriodoId = '202105' AND PerId NOT LIKE '%X'
--) Y ON X.perid = Y.DNI
--WHERE X.perid IN ('70777866')


--select * from pa_cronogramamensual where v_dni = '70777866'

--select * from pa_cronogramamensual where v_dni = '71469061' and v_mes = 4
--select * from pa_solicitudvacaciones where v_dni = '71469061'


select * 
-- update pa_solicitudvacaciones set i_estado = 2
from pa_solicitudvacaciones where month(d_finicio) <> 7


select * from pa_estados_procesos

SELECT * FROM pa_cronogramamensual
where v_dni in 
(
'10025100',
'001251391',
'09497086',
'76001361',
'77683117',
'44481609'
)
and v_mes = 3

SELECT ltrim(rtrim(v_dni)) 
-- delete
FROM pa_cronogramamensual
where v_mes = 3

