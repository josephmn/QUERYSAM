



select*  from  [RES2016APP].[dbo].[xammarcas ]

insert into [RES2016APP].[dbo].[xammarcas ] (idmarca,DESCR,Crtd_User,Crtd_DateTime,LUpd_User,LUpd_DateTime)
SELECT idmarca,DESCR,Crtd_User,Crtd_DateTime,LUpd_User,LUpd_DateTime FROM [BACKAM2016APP].[dbo].[xammarcas ] WHERE idmarca IN ('ACL','AGO','ATM')


Crtd_User
SYSADMIN

LUpd_User
SYSADMIN

idmarca
ALT  

Crtd_DateTime
2010-02-26 12:06:00

LUpd_DateTime
2010-02-26 12:06:00