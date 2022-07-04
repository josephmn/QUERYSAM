

INSERT INTO xAMPeriodosActivos
(UsuarioID, Modulo, Pantalla, DescPantalla, PeriodoInicio, PeriodoFin, user01, user02, user03, user04, user05, user06, user07, user08, user09, user10)



SELECT
'CMCASHAL', Modulo, Pantalla, DescPantalla, PeriodoInicio, PeriodoFin, user01, user02, user03, user04, user05, user06, user07, user08, user09, user10
FROM xAMPeriodosActivos WHERE UsuarioID = 'KMCARARE'



insert into SIBuyer
(Buyer, BuyerName, Crtd_DateTime, Crtd_Prog, Crtd_User, LUpd_DateTime, LUpd_Prog, LUpd_User, NoteID, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, Status, User1, User2, User3, User4, User5, User6, User7, User8)

select 
'CMCASHAL', 'CYNTHIA MELISSA CASA HALANOCA', Crtd_DateTime, Crtd_Prog, Crtd_User, LUpd_DateTime, LUpd_Prog, LUpd_User, NoteID, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, Status, User1, User2, User3, User4, User5, User6, User7, User8
from SIBuyer WHERE Buyer = 'KMCARARE'




INSERT INTO xAMRestriccion
(UserId, Dato, Tipo, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, S4Future13, User01, User02, User03, User04, User05, User06, User07, User08, User09, User10, User11, User12, User13)
SELECT
'CMCASHAL', Dato, Tipo, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, S4Future13, User01, User02, User03, User04, User05, User06, User07, User08, User09, User10, User11, User12, User13
FROM xAMRestriccion
WHERE UserId = 'KMCARARE'




