--FECHA DE FUNCIONES UTILES

--1. Para obtener el d�a de hoy.

SELECT GETDATE() 'Hoy'

--2. Para obtener el d�a de ayer.

SELECT DATEADD(d,-1,GETDATE()) 'Ayer'

--3. Inicio del d�a actual.

SELECT DATEADD(dd,DATEDIFF(dd,0,GETDATE()),0) 'Inicio de este d�a'

--4. Fin del d�a actual

SELECT DATEADD(ms,-3,DATEADD(dd,DATEDIFF(dd,0,GETDATE()),1)) 'Fin de este d�a'

--5. Inicio de ayer.

SELECT DATEADD(dd,DATEDIFF(dd,0,GETDATE()),-1) 'Inicio de ayer'

--6. Fin de ayer.

SELECT DATEADD(ms,-3,DATEADD(dd,DATEDIFF(dd,0,GETDATE()),0)) 'Fin de ayer'

--7. Primer d�a de la semana actual.

SELECT DATEADD(wk,DATEDIFF(wk,0,GETDATE()),0) 'Primer d�a de la semana actual'

--8. �ltimo d�a de la semana actual.

SELECT DATEADD(wk,DATEDIFF(wk,0,GETDATE()),6) '�ltimo d�a de la semana actual'

--9. Primer d�a de la semana pasada.

SELECT DATEADD(wk,DATEDIFF(wk,7,GETDATE()),0) 'Primer d�a de la semana pasada'

--10. �ltimo d�a de la semana pasada.

SELECT DATEADD(wk,DATEDIFF(wk,7,GETDATE()),6) '�ltimo d�a de la semana pasada'

--11. Primer d�a del mes actual.

SELECT DATEADD(mm,DATEDIFF(mm,0,GETDATE()),0) 'Primer d�a del mes actual'

--12. �ltimo d�a del mes actual.

SELECT DATEADD(ms,-3,DATEADD(mm,0,DATEADD(mm,DATEDIFF(mm,0,GETDATE())+1,0))) '�ltimo d�a del mes actual'

--13. Primer d�a del mes pasado.

SELECT DATEADD(mm,-1,DATEADD(mm,DATEDIFF(mm,0,GETDATE()),0)) 'Primer d�a del mes pasado'

--14. �ltimo d�a del mes pasado.

SELECT DATEADD(ms,-3,DATEADD(mm,0,DATEADD(mm,DATEDIFF(mm,0,GETDATE()),0))) '�ltimo d�a del mes pasado'

--15. Primer d�a de este a�o.

SELECT DATEADD(yy,DATEDIFF(yy,0,GETDATE()),0) 'Primer d�a de este a�o'

--16. �ltimo d�a de este a�o.

SELECT DATEADD(ms,-3,DATEADD(yy,0,DATEADD(yy,DATEDIFF(yy,0,GETDATE())+1,0))) '�ltimo d�a de este a�o'

--17. Primer d�a del a�o pasado.

SELECT DATEADD(yy,-1,DATEADD(yy,DATEDIFF(yy,0,GETDATE()),0)) 'Primer d�a del a�o pasado'

--18. �ltimo d�a del a�o pasado.

SELECT DATEADD(ms,-3,DATEADD(yy,0,DATEADD(yy,DATEDIFF(yy,0,GETDATE()),0))) '�ltimo d�a del a�o pasado'

--19. Primer d�a del pr�ximo mes.

SELECT DATEADD(mm,1,DATEADD(mm,DATEDIFF(mm,0,GETDATE()),0)) 'Primer d�a del pr�ximo mes'

--20. �ltimo d�a del pr�ximo mes.

SELECT DATEADD(ms,-3,DATEADD(mm,0,DATEADD(mm,(DATEDIFF(mm,0,GETDATE()),0)))'�ltimo d�a del pr�ximo mes'