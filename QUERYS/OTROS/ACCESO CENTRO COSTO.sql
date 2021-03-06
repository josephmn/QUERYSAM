--
--select * from account
--select * from cashacct

USE [CA2015APP]
GO

DECLARE @centro_costo VARCHAR(30)
DECLARE @cuenta VARCHAR(10)
DECLARE @user varchar(30)
SET @user ='krquitor'
DECLARE CUR_CENTRO_COSTO CURSOR FOR		
SELECT BANKSUB FROM CASHACCT        
OPEN CUR_CENTRO_COSTO 
FETCH CUR_CENTRO_COSTO INTO @centro_costo 
WHILE (@@FETCH_STATUS = 0 )
BEGIN
 begin
  DECLARE @INT INT 
  SELECT @INT =(SELECT COUNT(*) FROM XAMRESTRICCION WHERE USERID=@user AND TIPO='SUBCUENTABANCO' AND DATO =@centro_costo )
    if @INT = 0
    BEGIN
    INSERT INTO XAMRESTRICCION (USERID,TIPO,DATO)	  VALUES
    (@user,'SUBCUENTABANCO',@centro_costo)
    END

  SELECT @INT =(SELECT COUNT(*) FROM XAMRESTRICCION WHERE USERID=@user AND TIPO='SUBCUENTABANCOD' AND DATO =@centro_costo )
    if @INT = 0
    BEGIN
    INSERT INTO XAMRESTRICCION (USERID,TIPO,DATO)	  VALUES
    (@user,'SUBCUENTABANCOD',@centro_costo)
    END
 end	
FETCH CUR_CENTRO_COSTO INTO @centro_costo
END
CLOSE CUR_CENTRO_COSTO
DEALLOCATE CUR_CENTRO_COSTO


---//*/***************************************
SELECT * FROM XAMRESTRICCION WHERE USERID  LIKE 'PAMARPAU'

DECLARE @centro_costo VARCHAR(30)
DECLARE @cuenta VARCHAR(10)
DECLARE @user varchar(30)
SET @user ='krquitor'
DECLARE CUR_CUENTA CURSOR FOR		
select acct from account       
OPEN CUR_CUENTA
FETCH CUR_CUENTA INTO @centro_costo 
WHILE (@@FETCH_STATUS = 0 )
BEGIN
 begin
  DECLARE @INT INT 
  SELECT @INT =(SELECT COUNT(*) FROM XAMRESTRICCION WHERE USERID=@user AND TIPO='CUENTABANCOO' AND DATO =@centro_costo )
    if @INT = 0
    BEGIN
    INSERT INTO XAMRESTRICCION (USERID,TIPO,DATO)	VALUES
    (@user,'CUENTABANCOO',@centro_costo)
    END

  SELECT @INT =(SELECT COUNT(*) FROM XAMRESTRICCION WHERE USERID=@user AND TIPO='CUENTABANCOD' AND DATO =@centro_costo )
    if @INT = 0
    BEGIN
    INSERT INTO XAMRESTRICCION (USERID,TIPO,DATO)	  VALUES
    (@user,'CUENTABANCOD',@centro_costo)
    END
 end	
FETCH CUR_CUENTA INTO @centro_costo
END
CLOSE CUR_CUENTA
DEALLOCATE CUR_CUENTA



SELECT  *FROM XAMRESTRICCION WHERE USERID='LAFLOQUI' AND DATO ='101000'







--*- cuentabancoo
--CUENTABANCOD

--subcuentabanco
--SUBCUENTABANCOD





--
--
--0000000000
--CAARCAF000
--CAAREMB000
--CAAYCAF000
--CAAYMAR000
--CACACAF000
--CACAMAR000
--CACCCAF000
--CACHCAF000
--CACHEMB000
--CACHMAR000
--CACICAF000
--CAIQ000000
--CAIQCAF000
--CAIQEMB000
--CAIQEMBMAS
--CAIQEMBVIS
--CAIQMAR000
--CAJPCAF000
--CAJUCAF000
--CAMPCAF000
--CAP1CAF000
--CAPICAF000
--CAPIEMB000
--CAPIEMBMAS
--CAPIEMBVIS
--CAPIMAR000
--CAPIMARMAS
--CAPJCAF000
--CAPMCAF000
--CAPUCAF000
--CAPUEMB000
--CAPUMAR000
--CASBCAF000
--CATACAF000
--CATAEMB000
--CATAEMBMAS
--CATAEMBVIS
--CATAMAR000
--CATBCAF000
--CATCCAF000
--CATCEMB000
--CATCEMBMAS
--CATCEMBVIS
--CATCMAR000
--CATJCAF000
--CATJEMB000
--CATJMAR000
--CATLEMB000
--CATLMAR000
--CATPCAF000
--CAVICAF000
--LIMA000000
--CACH000000
--LIMA000000
--CAPI000000
--CAPU000000
--CATJ000000
--CACA000000
--CAIQ000000
--CAIQCAF000
--CATA000000
--CACH000000
--CAARCAF000
--CATCCAF000
--CAP1CAF000
--LIMA000000
--CASBCAF000
--CAVICAF000
--CATBCAF000
--CATPCAF000
--CACCCAF000
--CAMP000000
--CAJP000000
--CAAYCAF000
--0000000000
--CAARCAFDIN
--CAARCAFMAS
--CAARCAFVIS
--CAAREMBDIN
--CAAREMBMAS
--CAAREMBVIS
--CAAYCAFDIN
--CAAYCAFMAS
--CAAYCAFVIS
--CAAYMARDIN
--CAAYMARMAS
--CAAYMARVIS
--CACACAFDIN
--CACACAFMAS
--CACACAFVIS
--CACAMARDIN
--CACAMARMAS
--CACAMARVIS
--CACCCAFDIN
--CACCCAFMAS
--CACCCAFVIS
--CACHCAFDIN
--CACHCAFMAS
--CACHCAFVIS
--CACHEMBDIN
--CACHEMBMAS
--CACHEMBVIS
--CACHMARDIN
--CACHMARMAS
--CACHMARVIS
--CACICAFDIN
--CACICAFMAS
--CACICAFVIS
--CAIQCAFDIN
--CAIQCAFMAS
--CAIQCAFVIS
--CAIQEMBMAS
--CAIQEMBVIS
--CAIQMARDIN
--CAIQMARMAS
--CAIQMARVIS
--CAJPCAFMAS
--CAJPCAFVIS
--CAJUCAFDIN
--CAJUCAFMAS
--CAJUCAFVIS
--CAMPCAFDIN
--CAMPCAFMAS
--CAMPCAFVIS
--CAP1CAFMAS
--CAP1CAFVIS
--CAPICAFDIN
--CAPICAFMAS
--CAPICAFVIS
--CAPIEMB000
--CAPIEMBMAS
--CAPIEMBVIS
--CAPIMARDIN
--CAPIMARMAS
--CAPIMARVIS
--CAPJCAFDIN
--CAPJCAFMAS
--CAPJCAFVIS
--CAPMCAFDIN
--CAPMCAFMAS
--CAPMCAFVIS
--CAPUCAFDIN
--CAPUCAFMAS
--CAPUCAFVIS
--CAPUEMBMAS
--CAPUEMBVIS
--CAPUMARDIN
--CAPUMARMAS
--CAPUMARVIS
--CASBCAFDIN
--CASBCAFMAS
--CASBCAFVIS
--CATACAFDIN
--CATACAFMAS
--CATACAFVIS
--CATAEMBMAS
--CATAEMBVIS
--CATAMARDIN
--CATAMARMAS
--CATAMARVIS
--CATBCAFMAS
--CATBCAFVIS
--CATCCAFMAS
--CATCCAFVIS
--CATCEMBMAS
--CATCEMBVIS
--CATCMARDIN
--CATCMARMAS
--CATCMARVIS
--CATJCAFDIN
--CATJCAFMAS
--CATJCAFVIS
--CATJEMB000
--CATJEMBDIN
--CATJEMBMAS
--CATJEMBVIS
--CATJMAR000
--CATJMARDIN
--CATJMARMAS
--CATJMARVIS
--CATLEMBDIN
--CATLEMBMAS
--CATLEMBVIS
--CATLMARDIN
--CATLMARMAS
--CATLMARVIS
--CATPCAFMAS
--CATPCAFVIS
--CAVICAF000
--CAVICAFDIN
--CAVICAFMAS
--CAVICAFVIS
--LIMA000000
--CAPICAFMAS
--CAPJCAFMAS
--CAPJCAFVIS
