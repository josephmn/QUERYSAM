--DECLARE @FACTOR DECIMAL (30,4)   
--DECLARE @FROMUNIT VARCHAR (30)   
--DECLARE @TOUNIT  VARCHAR (30)  
--DECLARE @OPERACION VARCHAR (1)   
--DECLARE CUR_CON_UNID CURSOR FOR
--select C.Factor,
--(select Abreviatura  from [192.168.10.93].SGRP2015. GEN.UnidadMedida where Id =IdUnidadOrigen ) AS ORIGEN ,
--(select Abreviatura  from  [192.168.10.93].SGRP2015.GEN.UnidadMedida where Id =IdUnidadDestino ) AS DESTINO,
--C.Operacion from  [192.168.10.93].SGRP2015. GEN.ConversionUnidad C  	                    
--OPEN CUR_CON_UNID 
--FETCH CUR_CON_UNID INTO @FACTOR,@FROMUNIT,@TOUNIT ,@OPERACION
--WHILE (@@FETCH_STATUS = 0 )
--BEGIN
-- begin
--	 DECLARE @CONTADOR INT 
--	 SET @CONTADOR =(SELECT COUNT(*) FROM INUNIT WHERE  cnvfact =@FACTOR and fromunit =@FROMUNIT and tounit =@TOUNIT and multdiv =@OPERACION  )
--	 if @CONTADOR = 0 
--	 BEGIN
--		insert into inunit (ClassID,CnvFact,Crtd_DateTime,Crtd_Prog,Crtd_User,FromUnit,InvtId,LUpd_DateTime,LUpd_Prog,LUpd_User,MultDiv,NoteID,S4Future01,
--		S4Future02,S4Future03,S4Future04,S4Future05,S4Future06,S4Future07,S4Future08,S4Future09,S4Future10,S4Future11,S4Future12,ToUnit,UnitType,User1,
--		User2,User3,User4,User5,User6,User7,User8) 
--		values 
--		('*',@FACTOR,'2015-09-30','','',@FROMUNIT,'*','2015-09-30','','',@OPERACION,0,'','',0,0,0,0,'2015-09-30','2015-09-30',0,0,'','',
--		 @TOUNIT,1,'','',0,0,'','','2015-09-30','2015-09-30')		
--     END 
-- end	
--FETCH CUR_CON_UNID INTO @FACTOR,@FROMUNIT,@TOUNIT ,@OPERACION
--END
--CLOSE CUR_CON_UNID
--DEALLOCATE CUR_CON_UNID
--
--
--SELECT ROUND(CNVFACT,4)CNVFACT,FROMUNIT,TOUNIT,MULTDIV FROM INUNIT
--WHERE FROMUNIT ='' AND TOUNIT
--ORDER BY FROMUNIT,TOUNIT ASC 
--
--	SELECT S.* FROM ( select C.Factor,
--(select Abreviatura  from [192.168.10.93].SGRP2015. GEN.UnidadMedida where Id =IdUnidadOrigen ) AS ORIGEN ,
--(select Abreviatura  from  [192.168.10.93].SGRP2015.GEN.UnidadMedida where Id =IdUnidadDestino ) AS DESTINO,
--C.Operacion from  [192.168.10.93].SGRP2015. GEN.ConversionUnidad C )S WHERE  LEN(S.ORIGEN) <7 
--AND LEN(S.DESTINO)< 7
--ORDER BY S.ORIGEN,S.DESTINO ASC
--
--SELECT*  FROM SUBACCT
--
--
--
--
--
--
--
----DELETE FROM INUNIT2
--
----insert into inunit2 (ClassID,CnvFact,Crtd_DateTime,Crtd_Prog,Crtd_User,FromUnit,InvtId,LUpd_DateTime,LUpd_Prog,LUpd_User,MultDiv,NoteID,S4Future01,
----S4Future02,S4Future03,S4Future04,S4Future05,S4Future06,S4Future07,S4Future08,S4Future09,S4Future10,S4Future11,S4Future12,ToUnit,UnitType,User1,
----User2,User3,User4,User5,User6,User7,User8) 
--
----select ClassID,CnvFact,Crtd_DateTime,Crtd_Prog,Crtd_User,FromUnit,InvtId,LUpd_DateTime,LUpd_Prog,LUpd_User,MultDiv,NoteID,S4Future01,
----S4Future02,S4Future03,S4Future04,S4Future05,S4Future06,S4Future07,S4Future08,S4Future09,S4Future10,S4Future11,S4Future12,ToUnit,UnitType,User1,
----User2,User3,User4,User5,User6,User7,User8 from inunit
--
--
----SELECT * FROM [192.168.10.93].SGRP2015.GEN.UnidadMedida WHERE LEN(ABREVIATURA) >6
--
----------------------------------------------------------------------------------------------------------------**
--DECLARE @FACTOR DECIMAL (30,4)   
--DECLARE @FROMUNIT VARCHAR (30)   
--DECLARE @TOUNIT  VARCHAR (30)  
--DECLARE @OPERACION VARCHAR (1)   
--DECLARE CUR_CON_UNID CURSOR FOR
--select C.Factor,
--(select Abreviatura  from [192.168.10.93].SGRP2015. GEN.UnidadMedida where Id =IdUnidadOrigen ) AS ORIGEN ,
--(select Abreviatura  from  [192.168.10.93].SGRP2015.GEN.UnidadMedida where Id =IdUnidadDestino ) AS DESTINO,
--C.Operacion from  [192.168.10.93].SGRP2015. GEN.ConversionUnidad C  	                    
--OPEN CUR_CON_UNID 
--FETCH CUR_CON_UNID INTO @FACTOR,@FROMUNIT,@TOUNIT ,@OPERACION
--WHILE (@@FETCH_STATUS = 0 )
--BEGIN
-- begin
--	 DECLARE @CONTADOR INT 
--	 SET @CONTADOR =(SELECT COUNT(*) FROM INUNIT WHERE  cnvfact =@FACTOR and fromunit =@FROMUNIT and tounit =@TOUNIT and multdiv =@OPERACION  )
--	 if @CONTADOR = 0 
--	 BEGIN
--		insert into inunit (ClassID,CnvFact,Crtd_DateTime,Crtd_Prog,Crtd_User,FromUnit,InvtId,LUpd_DateTime,LUpd_Prog,LUpd_User,MultDiv,NoteID,S4Future01,
--		S4Future02,S4Future03,S4Future04,S4Future05,S4Future06,S4Future07,S4Future08,S4Future09,S4Future10,S4Future11,S4Future12,ToUnit,UnitType,User1,
--		User2,User3,User4,User5,User6,User7,User8) 
--		values 
--		('*',@FACTOR,'2015-09-30','','',@FROMUNIT,'*','2015-09-30','','',@OPERACION,0,'','',0,0,0,0,'2015-09-30','2015-09-30',0,0,'','',
--		 @TOUNIT,1,'','',0,0,'','','2015-09-30','2015-09-30')		
--     END 
-- end	
--FETCH CUR_CON_UNID INTO @FACTOR,@FROMUNIT,@TOUNIT ,@OPERACION
--END
--CLOSE CUR_CON_UNID
--DEALLOCATE CUR_CON_UNID
---------------------------------------------------------------------------------------------------
--
--DECLARE @FACTOR DECIMAL (30,4)   
--DECLARE @FROMUNIT VARCHAR (30)   
--DECLARE @TOUNIT  VARCHAR (30)  
--DECLARE @OPERACION VARCHAR (1)   
--DECLARE CUR_CON_UNID CURSOR FOR
--
--  select cnvfact , fromunit,tounit,multdiv from [amcaf2015app].[dbo].[inunit]   
--  	                    
--OPEN CUR_CON_UNID 
--FETCH CUR_CON_UNID INTO @FACTOR,@FROMUNIT,@TOUNIT ,@OPERACION
--WHILE (@@FETCH_STATUS = 0 )
--BEGIN
-- begin
--	 DECLARE @CONTADOR INT 
--	 SET @CONTADOR =(SELECT COUNT(*) FROM [am2015app].[dbo].[inunit]  WHERE  cnvfact =@FACTOR and fromunit =@FROMUNIT and tounit =@TOUNIT and multdiv =@OPERACION  )
--	 if @CONTADOR = 0 
--	 BEGIN
--		insert into [am2015app].[dbo].[inunit] (ClassID,CnvFact,Crtd_DateTime,Crtd_Prog,Crtd_User,FromUnit,InvtId,LUpd_DateTime,LUpd_Prog,LUpd_User,MultDiv,NoteID,S4Future01,
--		S4Future02,S4Future03,S4Future04,S4Future05,S4Future06,S4Future07,S4Future08,S4Future09,S4Future10,S4Future11,S4Future12,ToUnit,UnitType,User1,
--		User2,User3,User4,User5,User6,User7,User8) 
--		values 
--		('*',@FACTOR,'2015-09-30','','',@FROMUNIT,'*','2015-09-30','','',@OPERACION,0,'','',0,0,0,0,'2015-09-30','2015-09-30',0,0,'','',
--		 @TOUNIT,1,'','',0,0,'','','2015-09-30','2015-09-30')		
--     END 
-- end	
--FETCH CUR_CON_UNID INTO @FACTOR,@FROMUNIT,@TOUNIT ,@OPERACION
--END
--CLOSE CUR_CON_UNID
--DEALLOCATE CUR_CON_UNID
--
--
--select* from inunit2
