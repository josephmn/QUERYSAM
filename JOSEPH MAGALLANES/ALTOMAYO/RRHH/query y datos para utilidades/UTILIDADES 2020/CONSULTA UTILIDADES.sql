select count(*) from DiaUtilidades
select count(*) from DiaUtilidades where numerosemana = 1

select (select count(*) from DiaUtilidades) - (select count(*) from DiaUtilidades where numerosemana = 1)

select A.perid, B.fecha, A.estado, 
(CASE DATENAME(MONTH,B.fecha) 
WHEN 'January' THEN 'ENERO'
WHEN 'February' THEN 'FEBRERO' 
WHEN 'March' THEN 'MARZO'
WHEN 'April' THEN 'ABRIL'
WHEN 'May' THEN 'MAYO'
WHEN 'June' THEN 'JUNIO'
WHEN 'July' THEN 'JULIO'
WHEN 'August' THEN 'AGOSTO'
WHEN 'September' THEN 'SEPTIEMBRE'
WHEN 'October' THEN 'OCTUBRE'
WHEN 'November' THEN 'NOVIEMBRE'
ELSE 'DICIEMBRE' END) MES --, CASE WHEN THEN ELSE END
from PAAsistD A
INNER JOIN PAAsistH B ON A.asistid = B.asistid
WHERE B.perpost >= '202001' AND B.perpost <= '202012' AND perid = '72130767'

SELECT A.perid, A.nombre, A.estado, B.fecha
from PAAsistD A
INNER JOIN PAAsistH B ON A.asistid = B.asistid
WHERE B.perpost >= '202001' AND B.perpost <= '202012' AND A.estado = 0 --AND perid = '72130767'

--0 
--1 --
--3 --
--4 --
--6
--9


-- 0 : LICENCIA    
-- 1 : ASISTIO    
-- 2 :     
-- 3 : FALTO (SIN GOZE)    
-- 4 : VACACIONES    
-- 5 : DESCUENTOS (CON / SIN DESCUENTO)    
-- 6 : SUSPENCION (SIN GOZE)    
-- 8 : SUBSIDIOS (MATERNIDAD)    
-- 9 : SUBSIDIOS (ENFERMEDAD O DISCAPACIDAD)    
