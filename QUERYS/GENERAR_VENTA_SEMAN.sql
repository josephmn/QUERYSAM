



select *  from fincom 
select *  from prodcom
select *  from prodope
 

ALTER PROC TSP_GEN_VENTASEMANA
--FUNCION  : LLena tablas fincom/prodcom/prodope semana ACT
--SISTEMA  : Solomon IV
--USUARIO  : Gasla Baudat Laisson Gadel
--ULTIMA MOD  :14/10/2016
AS
BEGIN
 DECLARE @NEWCOD CHAR(6)
 DECLARE @INISEMANA DATETIME
 DECLARE @FINSEMANA DATETIME
 DECLARE @contador INT
 SET @NEWCOD  = (SELECT TOP 1   RIGHT( '000000' + CAST( (NUMSEMANA+1)  AS VARCHAR) ,6 )NEWSEMANA FROM FINCOM ORDER BY NUMSEMANA DESC )
 SET @INISEMANA  = (SELECT TOP 1  dateadd(day,1, FECH_FIN_SEM) FROM FINCOM ORDER BY NUMSEMANA DESC  )
 SET @FINSEMANA  = ( select dateadd(day,6,@INISEMANA)NEXT_FECH  )
 set @contador   = (select top 1 cast (numsemana  as integer )CONT From FINCOM order by numsemana desc )
SET @CONTADOR  = @CONTADOR+1
 
 INSERT INTO  fincom ( codregistro ,numsemana ,  fechreg  ,fech_ini_sem  ,fech_fin_sem   ,fcajaacum     ,fsoles      ,fdolares       ,ftipocamb   ,fdifecamb      ,fciclcaja    ,fdproinve    ,fdprocxc    ,fdprocxp      ,         fciclcajadia     ,      fciclcajames   ,        fcompexte   ,           fcosttotal       ,      fgastadmige      ,      fgastadmipor    ,       vtotreccom       ,      valtperf      ,         vmedperf      ,         vbajperf   )
 VALUES (@NEWCOD,@contador,GETDATE(),@INISEMANA ,@FINSEMANA,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0 )
             
 INSERT INTO  prodcom (codregistro, pcodprod, pdesprod  ,pstocktrad  ,ppvp ,pprecompmen      ,      pprecompmay      ,      pnumcompet   ,porden  )
 SELECT @NEWCOD , pcodprod ,pdesprod ,pstocktrad , ppvp ,pprecompmen      ,      pprecompmay      ,      pnumcompet   , porden  FROM PRODCOM WHERE CODREGISTRO  ='000008' 
 
  INSERT INTO PRODOPE( codregistro ,opecodprod, opedesprod   ,opeorden    )
  SELECT  @NEWCOD,opecodprod, opedesprod   ,opeorden  FROM  PRODOPE WHERE CODREGISTRO  ='000008'
 

END





