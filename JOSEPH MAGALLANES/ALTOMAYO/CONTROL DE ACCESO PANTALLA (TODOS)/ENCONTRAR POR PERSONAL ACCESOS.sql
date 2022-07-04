

select * 
-- update s set hora_sal = '19:01:00', observacion = ''
from asistencia_am s where perid = '10861882' AND FECHA = '2018-07-31'

select * 
-- update s set hora_sal = '19:36:16', 
from asistencia_am s where perid = '72130767' AND FECHA = '2018-08-01'

SELECT * 
-- update t set hora_sal = '2018-08-01 19:36:16.727'
FROM ASISTENCIA_TEMP t WHERE PER_COD = '43068653' AND FECHA = '2018-08-01'




SELECT * FROM xAMRestriccion WHERE UserId = 'RMDIABAZ'
SELECT * FROM xAMPeriodosActivos WHERE UsuarioID = 'MACALBRA'
SELECT * FROM xAMPeriodosActivos WHERE UsuarioID = 'OLLAVALV'

select * from AM2018SYS..AccessDetRights sd
inner join am2018sys..Screen dd  on sd.ScreenNumber = dd.Number
where userid = 'RMDIABAZ' and dd.ScreenType = 'S' and dd.Module = 'PE'

SELECT DISTINCT UsuarioID, pantalla, DescPantalla, ur.UserName FROM xAMPeriodosActivos  xa
inner join  [AM2018SYS].dbo.userrec ur on xa.UsuarioID = ur.UserId
WHERE Pantalla IN (SELECT Pantalla FROM xAMPeriodosActivos WHERE UsuarioID = 'RMDIABAZ')

--where UserId = 'RMDIABAZ'

SELECT * FROM AM2018SYS..UserRec u
inner join am2018app..personal p on u.username like p.pernombre where p.perstatus = 'R'



SELECT pernombre FROM PERSONAL WHERE perstatus = 'R'


select distinct UserId 
from AM2018SYS..AccessDetRights AC
LEFT JOIN am2018sys..Screen S ON AC.ScreenNumber = s.Number
where ScreenNumber in (
'PE001','PE00100','PE00102','PE002','PE00201','PE00203','PE003','PE004','PE005','PE006','PE007','PE008','PE00900','PE00901','PE00904',
'PE010','PE011','PE012','PE01200','PE013','PE01400','PE01500','PE01501','PE019','PE020','PE02200','PE02300','PE03900','PE040','PE042','PE050','PE05100','PE05101','PE05102','PE05200',
'PE05201','PE056','PE05900','PEAVA00','SETUPPE') --and userid = 'AGLESAST'



select *
from AM2018SYS..AccessDetRights AC
LEFT JOIN am2018sys..Screen S ON AC.ScreenNumber = s.Number
where ScreenNumber in (
'PE001','PE00100','PE00102','PE002','PE00201','PE00203','PE003','PE004','PE005','PE006','PE007','PE008','PE00900','PE00901','PE00904',
'PE010','PE011','PE012','PE01200','PE013','PE01400','PE01500','PE01501','PE019','PE020','PE02200','PE02300','PE03900','PE040','PE042','PE050','PE05100','PE05101','PE05102','PE05200',
'PE05201','PE056','PE05900','PEAVA00','SETUPPE') and userid = 'VACHOZEL'


SELECT * 
-- DELETE
FROM AM2018SYS..AccessDetRights WHERE userid = 'VACHOZEL' AND ScreenNumber IN (
'PE001','PE00100','PE00102','PE002','PE00201','PE00203','PE003','PE004','PE005','PE006','PE007','PE008','PE00900','PE00901','PE00904',
'PE010','PE011','PE012','PE01200','PE013','PE01400','PE01500','PE01501','PE019','PE020','PE02200','PE02300','PE03900','PE040','PE042','PE050','PE05100','PE05101','PE05102','PE05200',
'PE05201','PE056','PE05900','PEAVA00','SETUPPE'
)


