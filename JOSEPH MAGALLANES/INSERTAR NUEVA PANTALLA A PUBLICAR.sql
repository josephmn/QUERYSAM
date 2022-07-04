
USE AM2019SYS
GO

SELECT * FROM Screen WHERE Module = '' and ScreenType = 'S'

select * from Screen WHERE Name like '%ELIMINAR BOLETAS%'

INSERT INTO Screen (Module,Name,Number,ScreenType)
VALUES
--('OP','PLANIFICACION SEMANAL FINAL','PLFIN01','S'),
('PE','Asistenci Cusco CAF','RASC000','R')

--DELETE FROM Screen
--WHERE Module = 'OP' AND Number = 'OPPXRFE'

--OPEPS02
--OPPXRFE

select * from Screen WHERE Number LIKE 'RASI0%'