

use [AM2017SYS]
go
    

select * from Screen 

   
insert into screen(Module,Name,Number,ScreenType)
values ('PL','Asignar Sede Usuario','PE77700','S')    
    

   Select * from AccessRights  
           where AccessRights.RecType  like  'U' 
             and AccessRights.UserId   like '%'
             and AccessRights.CompanyID like 'ALTOMAYO'
           order by RecType, UserId, CompanyID   
accessrights_type_usrid_db  'U',  'AJTAMPEN',  'ALTOMAYO'


SP_HELPTEXT 'accessrights_type_usrid_db'

    
           
           
           
       SELECT A.USERID,U.USERNAME,A.SCREENNUMBER,E.NAME,A.* FROM     accessdetrights A
       INNER JOIN SCREEN E ON A.SCREENNUMBER = E.NUMBER
       INNER JOIN USERREC U ON A.USERID = U.USERID
       AND A.SCREENNUMBER LIKE 'PE77700%' --PROCESO DIARIO VENTAS
       
       
       
       SELECT * FROM accessdetrights WHERE SCREENNUMBER  = 'PE77700'
       
       
       INSERT INTO accessdetrights (CompanyID,DatabaseName,DeleteRights, InitRights, InsertRights, RecType, ScreenNumber, UpdateRights, UserId,ViewRights)
       VALUES ('ALTOMAYO','',0,0,0,'U','PE77700',1,'SYSADMIN',1)
       
       
       
     

      
       
      UPDATE accessdetrights SET DeleteRights =0,InsertRights =0,UpdateRights =0 WHERE SCREENNUMBER  = 'PL41000' AND USERID NOT IN ('SYSADMIN')
       
            UPDATE accessdetrights SET DeleteRights =0,InsertRights =1,UpdateRights =0 WHERE SCREENNUMBER  = 'PL41000' AND USERID  IN ('AJTAMPEN') 
       select * from screen where number  ='XVVS100'
       

       
       
           update accessdetrights set updaterights= 1  where rectype= 'U'  and companyid= 'ALTOMAYO' and screennumber= 'XVVS100' 
                   
           update a set   rectype= 'U' 
           from accessdetrights a
           WHERE  a.screennumber= 'XVVS100' AND USERID ='YWVELLEO'
           

------------------------------------------------------           
                  
INSERT INTO accessdetrights (CompanyID,DatabaseName,DeleteRights, InitRights, InsertRights, RecType, ScreenNumber, UpdateRights, UserId,ViewRights)
VALUES ('ALTOMAYO','',0,0,0,'U','PE77700',1,'SYSADMIN',1)                  
------------------------------------------------------           
           
DECLARE   --003160
 --delete from wrkreleasebad
@USUARIO VARCHAR(10)  
DECLARE cClientes CURSOR FOR
	
	SELECT USERID FROM USERREC 	
			        
OPEN cClientes 
FETCH cClientes INTO @USUARIO 
WHILE (@@FETCH_STATUS = 0 )
BEGIN
 begin 
-- PRUEBA USER MJROVAL --
INSERT INTO accessdetrights (CompanyID,DatabaseName,DeleteRights, InitRights, InsertRights, RecType, ScreenNumber, UpdateRights, UserId,ViewRights)
VALUES ('ALTOMAYO','',0,0,0,'U','AP04300',1,@USUARIO,1)       
  
 end	
FETCH cClientes INTO @USUARIO
END
CLOSE cClientes
DEALLOCATE cClientes
go


           
-- PRUEBA USER MJROVAL --
INSERT INTO accessdetrights (CompanyID,DatabaseName,DeleteRights, InitRights, InsertRights, RecType, ScreenNumber, UpdateRights, UserId,ViewRights)
VALUES ('ALTOMAYO','',0,0,0,'U','PE77700',1,'AJTAMPEN',1)       
           
           


           
           
           
           
           
           
           
           
           
    