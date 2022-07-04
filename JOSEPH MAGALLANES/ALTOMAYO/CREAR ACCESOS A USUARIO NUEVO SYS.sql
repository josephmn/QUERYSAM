


--select * from swa_customer where ruc = '43842817'



--select * from aaa


[dbo].[AccessDetRights]

[dbo].[AccessRights]

SELECT * FROM  CMCASHAL


SELECT * FROM AccessRights WHERE UserId = 'CMCASHAL'

INSERT INTO AccessRights 
(CompanyID, DatabaseName, RecType, UserId)

SELECT CompanyID, DatabaseName, RecType, 'CMCASHAL' 
FROM AccessRights WHERE UserId = 'KMCARARE'

--CMCASHAL



INSERT INTO [dbo].[AccessDetRights]
(CompanyID, DatabaseName, DeleteRights, InitRights, InsertRights, RecType, ScreenNumber, UpdateRights, UserId, ViewRights)

SELECT  
CompanyID, DatabaseName, DeleteRights, InitRights, InsertRights, RecType, ScreenNumber, UpdateRights, 'CMCASHAL', ViewRights
FROM [AccessDetRights] WHERE UserId = 'KMCARARE'





