

------------CORRELATIVO VENTA / IMPRIMIR COMPROBANTE
SELECT * From SoType where CpnyID =  'ALTOMAYO'  and SOTypeID in (select Dato FROM xAMRestriccion Where UserId =  'SYSADMIN'  ) and SOTypeID =  'NCLI'

update SoType set LastInvcNbr  ='0001021'
LastInvcNbr
0001021   


SELECT * From SoType where CpnyID =  'ALTOMAYO' order by LastInvcNbr desc


select * from AM2015APP.dbo.SoType where CpnyID =  'ALTOMAYO' and   SOTypeID =  'NCLI'

UPDATE SoType SET LastInvcNbr  ='0001020' WHERE  CpnyID =  'ALTOMAYO'  and SOTypeID in (select Dato FROM xAMRestriccion Where UserId =  'SYSADMIN'  ) and SOTypeID =  'NCLI'
 and  LastInvcNbr  ='0001007'

UPDATE SoType SET LastShipperNbr  ='000248' WHERE  CpnyID =  'ALTOMAYO'  and SOTypeID in (select Dato FROM xAMRestriccion Where UserId =  'SYSADMIN'  ) and SOTypeID =  'NCLI'
 and  LastInvcNbr  ='0001020'


  

select LastInvcNbr,* from AM2016APP.dbo.SoType where CpnyID =  'ALTOMAYO' and   SOTypeID =  'NCLI'

INSERT INTO AM2016APP.dbo.SoType (User9,User6,User5,User2,User10,User1,StdOrdType,ShipperType,S4Future12,S4Future11,S4Future10,S4Future09,S4Future08,S4Future07,S4Future06,S4Future05,S4Future04,S4Future03,S4Future02,S4Future01,RequireTechAppr,RequireManRelease,RequireDetailAppr,OrdNbrType, NoteID,InvSub,InvcNbrType,InvAcct,ARSub, ARAcct,Active,AutoReleaseReturns,Behavior,CancelDays,COGSAcct,COGSSub,CpnyID,Crtd_DateTime,Crtd_Prog,Crtd_User,Descr,DiscAcct,DiscSub,Disp,EnterLotSer,FrtAcct,FrtSub,InvcNbrPrefix,
LastInvcNbr,LastOrdNbr,LastShipperNbr,LUpd_DateTime,LUpd_Prog,LUpd_User,MiscAcct,MiscSub,OrdNbrPrefix,ReturnOrderTypeID,ShipperPrefix,ShiptoType,SlsAcct,SlsSub,SOTypeID,User3,
User4,User7,User8,WholeOrdDiscAcct,WholeOrdDiscSub )
select User9,User6,User5, User2,User10,User1,StdOrdType,ShipperType,S4Future12, S4Future11, S4Future10, S4Future09, S4Future08,S4Future07,S4Future06 ,S4Future05,S4Future04,S4Future03,S4Future02,S4Future01,RequireTechAppr,RequireManRelease,RequireDetailAppr,OrdNbrType, NoteID,InvSub ,InvcNbrType,InvAcct, ARSub,ARAcct,Active,AutoReleaseReturns,Behavior,CancelDays,COGSAcct,COGSSub,CpnyID,Crtd_DateTime,Crtd_Prog,Crtd_User,Descr,DiscAcct,DiscSub,Disp,EnterLotSer,FrtAcct,FrtSub,InvcNbrPrefix,
LastInvcNbr,LastOrdNbr,LastShipperNbr,LUpd_DateTime,LUpd_Prog,LUpd_User,MiscAcct,MiscSub,OrdNbrPrefix,ReturnOrderTypeID,ShipperPrefix,ShiptoType,SlsAcct,SlsSub,SOTypeID,User3,
User4,User7,User8,WholeOrdDiscAcct,WholeOrdDiscSub   from RES2016APP.dbo.SoType where CpnyID =  'ALTOMAYO' and   SOTypeID =  'NCLI'


* from RES2016APP.dbo.SoType where CpnyID =  'ALTOMAYO' and   SOTypeID =  'NCLI'
WholeOrdDiscSub
0000-000-00-000                                     

InvcNbrPrefix
B04       LastInvcNbr
0000008        

            
select InvcNbrPrefix,LastInvcNbr,* from SoType where CpnyID =  'ALTOMAYO' and   SOTypeID =  'NCLI'                            
SELECT TOP 1  BatNbr ,RefNbr , * FROM ARDOC A WHERE RefNbr LIKE 'B02%' ORDER BY A.BatNbr DESC 



SELECT * FROM newSH WHERE ShipperID LIKE 'CBCH%' ORDER BY ShipperID DESC  



select distinct SOTypeID from SoType where CpnyID =  'ALTOMAYO'  AND SOTypeID LIKE '%H'




  ('B050005027','B050005034','B050005065')


select * from ardoc where RefNbr  ='B050005027'

