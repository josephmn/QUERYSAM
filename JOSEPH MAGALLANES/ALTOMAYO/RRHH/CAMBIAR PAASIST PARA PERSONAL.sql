
SELECT perid, perfing, * FROM Personal WHERE perfing > = '2020-06-15' AND perfing <= '2020-07-16'

SELECT perid, pernombre, perpaterno, * FROM Personal WHERE pernombre LIKE '%DIANA IVON%'

EXEC INSERT_PER_XFECHA '2020-08-20','44195967'

--EXEC INSERT_PER_XFECHA '2020-06-08','73535903'
--EXEC INSERT_PER_XFECHA '2020-06-09','73535903'
--EXEC INSERT_PER_XFECHA '2020-06-10','73535903'
--EXEC INSERT_PER_XFECHA '2020-06-11','73535903'
--EXEC INSERT_PER_XFECHA '2020-06-12','73535903'

--EXEC INSERT_PER_XFECHA '2020-06-13','45206375'
--EXEC INSERT_PER_XFECHA '2020-06-14','45206375'
--EXEC INSERT_PER_XFECHA '2020-06-15','45206375'
--EXEC INSERT_PER_XFECHA '2020-06-13','45206375'
--EXEC INSERT_PER_XFECHA '2020-06-14','45206375'
--EXEC INSERT_PER_XFECHA '2020-06-15','45206375'


--43204894  	2019-07-10 00:00:00
--45294800  	2019-07-10 00:00:00
--47925909  	2019-07-10 00:00:00
--77287803  	2019-07-10 00:00:00

--43503023  	2019-07-12 00:00:00
 
--47804145  	2019-07-15 00:00:00
--47968022  	2019-07-15 00:00:00

--43675459  	2019-07-17 00:00:00



--- PARA COLOCAN MAL UNA FALTA Y QUIEREN REGRESAR A COMO DIA NORMAL

-- REVISAR EL DIA A CAMBIAR
SELECT * FROM PAAsistH WHERE fecha >= '2020-06-06' AND FECHA < = '2020-06-06'



-- UPDATE CON EL CAMBIO
------------------------

-- 0 : LICENCIA    
-- 1 : ASISTIO    
-- 2 :     
-- 3 : FALTO (SIN GOZE)    
-- 4 : VACACIONES    
-- 5 : DESCUENTOS (CON / SIN DESCUENTO)    
-- 6 : SUSPENCION (SIN GOZE)    
-- 8 : SUBSIDIOS (MATERNIDAD)    
-- 9 : SUBSIDIOS (ENFERMEDAD O DISCAPACIDAD)    


SELECT * 
-- UPDATE PAAsistD SET estado = 1, justif = null, nrohoras = 8
-- UPDATE PAAsistD SET estado = 4, justif = null, nrohoras = 0  -- PARA VACACIONES
-- UPDATE PAAsistD SET estado = 3, justif = 0, nrohoras = 0  ---PARA FALTA
FROM PAAsistD WHERE perid IN
(
'48811065'
) AND asistid in (
SELECT asistid FROM PAAsistH WHERE fecha >= '2022-06-06' AND FECHA < = '2022-06-08'
)
and asistid in ('001994')
--,'001666','001667','001668','001669')


------consulta para ver los dias marcados
--SELECT perid, perfing, * FROM Personal WHERE perid = '77820619' -- perfing > = '2020-06-15' AND perfing <= '2020-07-16'

SELECT H.fecha, D.* 
FROM PAAsistH H
INNER JOIN PAAsistD D ON H.asistid = D.asistid
WHERE D.perid = '77820619' AND h.fecha >= '2021-08-02' AND h.fecha < = '2021-08-15'

--select perfing, * from personal where perid = '76980162'


SELECT * FROM PAAsistD WHERE perid = '45507329' AND asistid = '001459'



--- INSERTAR POR FECHAS CON DNI

EXEC INSERT_PER_XFECHA '2020-07-03','43548767'
EXEC INSERT_PER_XFECHA '2019-05-15','45095519'
--EXEC INSERT_PER_XFECHA '2019-07-20','43503023'



SELECT perfing, perid, user1, * 
FROM Personal P WHERE perfing > = '2019-06-01' ORDER BY P.perfing ASC


SELECT * FROM PAAsistD WHERE perid = '43154913'

SELECT perid, * FROM PERSONAL WHERE PERNOMBRE LIKE '%JORGE%' AND PERPATERNO LIKE '%RUEDA%'

-- LOPEZ JAUREGUI DIEGO  DEL DIA 03/09. 

-- 12/05 al 15/05 Jorge Rueda de Pi�rola  // 21-05-2020

--cambiar estado de Andrea diaz 46947830, fecha de solicitud 18/11/2019
SELECT * 
--UPDATE PAAsistD SET estado = 1, justif = null
FROM PAAsistD WHERE perid = '46947830' AND 
asistid = '001047'





SELECT * 
-- UPDATE PAPermisoVacacion SET MOTIVO = '', USER11 = '2020-06-06'
FROM PAPermisoVacacion WHERE PERID = '40640940' AND IDPERMISO = '005277'

SELECT * 
-- UPDATE PAPermisoVacacion SET MOTIVO = ''
FROM [AM2020APPSEP]..PAPermisoVacacion WHERE PERID = '40640940' AND IDPERMISO = '005277'
