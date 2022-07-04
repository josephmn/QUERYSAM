


insert into ProductLine 
(COGSAcct, COGSSub, Crtd_DateTime, Crtd_Prog, Crtd_User, Descr, DiscAcct, DiscSub, FrtAcct, 
FrtSub, InvAcct, InvSub, LUpd_DateTime, LUpd_Prog, LUpd_User, NoteID, ProdLineID, ProdMgrID, 
S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, 
S4Future09, S4Future10, S4Future11, S4Future12, SlsAcct, SlsSub, User1, User10, User2, User3, 
User4, User5, User6, User7, User8, User9)

	SELECT COGSAcct, COGSSub, Crtd_DateTime, Crtd_Prog, Crtd_User, 'MANTENIMIENTO', DiscAcct, DiscSub, FrtAcct, 
FrtSub, InvAcct, InvSub, LUpd_DateTime, LUpd_Prog, LUpd_User, NoteID, 'MAN', ProdMgrID, 
S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, 
S4Future09, S4Future10, S4Future11, S4Future12, SlsAcct, SlsSub, User1, User10, User2, User3, 
User4, User5, User6, User7, User8, User9
	-- delete
	FROM ProductLine where Descr = 'COMBOS'


INSERT INTO xAMSubLinea (SubLineaID, Descripcion, Crtd_User, Crtd_DateTime, LUpd_User, LUpd_DateTime, user01, user02, user03, user04, user05, user06, user07, user08, user09, user10)

SELECT 'TAL', 'TALLER', Crtd_User, Crtd_DateTime, LUpd_User, LUpd_DateTime, user01, user02, user03, user04, user05, user06, user07, user08, user09, user10
FROM  xAMSubLinea WHERE SubLineaID = 'MAN'


INSERT INTO xAMLineaSubLinea (LineaID, SubLineaID, Status, Crtd_User, Crtd_DateTime, LUpd_User, LUpd_DateTime, user01, user02, user03, user04, user05, user06, user07, user08, user09, user10)

SELECT 'MAN', 'TAL', Status, Crtd_User, Crtd_DateTime, LUpd_User, LUpd_DateTime, user01, user02, user03, user04, user05, user06, user07, user08, user09, user10
FROM  xAMLineaSubLinea WHERE SubLineaID = 'MAN'

SELECT * 
-- DELETE
FROM xAMLineaSubLinea WHERE SubLineaID = 'MAN'

--SELECT LEN('DISPOSITIVOS ELECTRÓNICOS')		  DEL
--SELECT LEN('NEUMÁTICA Y ELECTRO NEUMÁTICA')	  NEL
--SELECT LEN('DISPOSITIVOS ELÉCTRICOS')			  DIE
--SELECT LEN('EPPS')							  EPP
--SELECT LEN('INSUMOS CODIFICADORAS')			  ISC
--SELECT LEN('MECÁNICA')						  MEC
--SELECT LEN('GRASAS ADITIVOS')				      GRA
--SELECT LEN('TALLER')						      TAL

INSERT INTO xAMMarcas (idmarca, descr, Crtd_User, Crtd_DateTime, LUpd_User, LUpd_DateTime, User01, User02, User03, User04, User05, User06, User07, User08, User09, User10)

SELECT 'MAN', 'MANTENIMIENTO', Crtd_User, Crtd_DateTime, LUpd_User, LUpd_DateTime, User01, User02, User03, User04, User05, User06, User07, User08, User09, User10
FROM xAMMarcas WHERE idmarca = 'MON'



SELECT Buyer, ChkOrdQty, ClassID, COGSAcct, COGSSub, CountStatus, Crtd_Prog, Crtd_User, Descr, DfltPOUnit,	DfltSalesAcct,	DfltSalesSub, DfltSite,	DfltSOUnit,	DfltWhseLoc,DiscAcct, DiscSub,
InvtAcct, InvtID, InvtSub, PPVAcct, PPVSub, StkUnit, TaxCat, User1, User6
-- SELECT *
FROM Inventory WHERE INVTID = 'M261001'
SELECT * FROM InventoryADG WHERE INVTID = 'M261001'

-- USER6

/*
select * from xAMLineaSubLinea

create proc xAMSubLinea_todos
@parm1 varchar(4), @parm2 varchar(10)
as
SELECT * 
FROM  xAMSubLinea inner join xAMLineaSubLinea on xAMSubLinea.SubLineaID = xAMLineaSubLinea.SubLineaID ---WHERE xAMLineaSubLinea.SubLineaID = 'MAN'
where xAMLineaSubLinea.LineaID LIKE 'MAN' and xAMSubLinea.SubLineaID  like 'MAN'
ORDER BY xAMSubLinea.SubLineaID 



SELECT LEN('DISPOSITIVOS ELECTRÓNICOS')
SELECT LEN('NEUMÁTICA Y ELECTRO NEUMÁTICA')
SELECT LEN('DISPOSITIVOS ELÉCTRICOS')
SELECT LEN('EPPS')
SELECT LEN('INSUMOS CODIFICADORAS')
SELECT LEN('MECÁNICA')
SELECT LEN('GRASAS ADITIVOS')
SELECT LEN('TALLER')

*/
                      