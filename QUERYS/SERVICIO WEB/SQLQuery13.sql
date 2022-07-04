SP_HELPTEXT  Dbnav_ImpFactura_1



select * from cab_movi ORDER BY NU_CORRELA DESC 
select * from cab_movi ORDER BY NU_CORRELA DESC 

update cab_movi set ch_status ='T' , dt_fecinici = getdate(),dt_fectermi =getdate(),ch_FecInici ='2016-11-14'






s10212895836    elect * from bd_movistar .dbo.cab_movi 

select * from res2016app .dbo.cab_movi order by nu_correla desc

select siteid,invcdate,shipperid,* from newsh where s4future12  in ('1000001','1000002','1000003')

select* from soshipheader where shipperid ='BDH0020232'

SELECT top 10 * FROM xAM_PedNexSolH WHERE   (NX_ch_HorInicioNum <=  GpoHoraMaxNum) and (SoAd_ShipToId = 'DEFAULT') and (rtrim(convert(char(30),NX_dt_FecInici,1)) = rtrim(convert(char(30),getdate(),1))) order by NX_ch_CodDistr,NX_nu_Correla  

1000001
1000002                       
1000003                       
                       
CREATE Proc Dbnav_ImpFactura_1  
 @Parm1  varchar(10),  
 @Parm2  varchar(10),  
 @Parm3  varchar(4),  
 @Parm4  varchar(10),  
 @Parm5  smalldatetime,  
 @Parm6 varchar(47),  
 @Parm7 varchar(5)  
As  
 Select *  
 FROM           
 dbo.xAMEmbPorImp_1  
 WHERE   
 (CpnyID =  @Parm1) And   
 (SiteID = @Parm2) And  
 (SOTypeID = @Parm3) and   
 (GpoDesp = @Parm4) and  
 (InvcDate <=  @Parm5) And   
 (PerContServ  between (Select periodoinicio FROM dbo.xAMPeriodosActivos Where dbo.xAMPeriodosActivos.UsuarioId = @Parm6 and dbo.xAMPeriodosActivos.Pantalla = @Parm7) and (Select periodofin FROM dbo.xAMPeriodosActivos Where dbo.xAMPeriodosActivos.UsuarioI
d = @Parm6 and dbo.xAMPeriodosActivos.Pantalla = @Parm7)) /*and  
 (PerContOrd   between (Select periodoinicio FROM dbo.xAMPeriodosActivos Where dbo.xAMPeriodosActivos.UsuarioId = @Parm6 and dbo.xAMPeriodosActivos.Pantalla = @Parm7) and (Select periodofin FROM dbo.xAMPeriodosActivos Where dbo.xAMPeriodosActivos.UsuarioI
d = @Parm6 and dbo.xAMPeriodosActivos.Pantalla = @Parm7)) */  
 Order By  
 OrdDate,SlsperID,CustID
 
 SP_HELPTEXT  xAMEmbPorImp_1
 
 
 CREATE VIEW dbo.xAMEmbPorImp_1        
AS        
SELECT    newsh. S4FUTURE12,*
FROM         dbo.newsh INNER JOIN        
                      dbo.SoAddress ON  RTRIM(LTRIM(dbo.newsh.CustID)) = RTRIM(LTRIM( dbo.SoAddress.CustId ))     
                   
WHERE     (dbo.newsh.Cancelled = 0) AND (dbo.newsh.CreditHold = 0) AND (dbo.newsh.Status = 'O') AND         
                      (dbo.newsh.NextFunctionClass = '0100') AND (dbo.newsh.NextFunctionID = '4099999')  AND NEWSH.S4FUTURE12 ='1000003'
                      
    SELECT NextFunctionClass,NextFunctionID ,Cancelled,CreditHold,Status,CUSTID,ShipToId,* FROM NEWSH WHERE S4FUTURE12 ='1000003'
    
    SELECT ShipToId,CUSTID,* FROM SoAddress WHERE CUSTID ='19247373'
    
     19247373
     
     SP_HELPTEXT  xAMEmbPorImp_1      
     
     
     CREATE VIEW dbo.xAMEmbPorImp_1        
AS        
SELECT     dbo.newsh.CpnyID, dbo.newsh.Crtd_User, dbo.newsh.CuryID, dbo.newsh.CuryTotMerch,         
                      dbo.newsh.CuryTotTax, dbo.newsh.CuryTotInvc, dbo.newsh.CustID, dbo.SoAddress.Name AS CustName,         
                      dbo.newsh.ETADate, GETDATE() AS FechaActual, dbo.Salesperson.S4Future12 AS GpoDesp, dbo.newsh.InvcDate,         
                      dbo.newsh.InvcNbr, dbo.newsh.S4Future12 AS NroPedNext, dbo.newsh.OrdDate, LEFT(RTRIM(CONVERT(varchar(50),         
                      dbo.newsh.InvcDate, 112)), 6) AS PerContInvc, LEFT(RTRIM(CONVERT(varchar(50), dbo.newsh.OrdDate, 112)), 6) AS PerContOrd,         
                      LEFT(RTRIM(CONVERT(varchar(50), GETDATE(), 112)), 6) AS PerContServ, 0 AS Selection, dbo.newsh.ShipperID, dbo.newsh.SiteID,         
                      dbo.newsh.SlsperID, ISNULL(dbo.Salesperson.Name, '') AS SlsperName, dbo.newsh.SOTypeID, dbo.newsh.TotMerch,         
                      dbo.newsh.TotTax, dbo.newsh.TotInvc, CONVERT(timestamp, '') AS tstmap        
FROM         dbo.newsh INNER JOIN        
                      dbo.SoAddress ON dbo.newsh.CustID = dbo.SoAddress.CustId and dbo.newsh.ShipToId=dbo.SoAddress.ShipToId  LEFT OUTER JOIN        
                      dbo.Salesperson ON dbo.newsh.SlsperID = dbo.Salesperson.SlsperId        
WHERE     (dbo.newsh.Cancelled = 0) AND (dbo.newsh.CreditHold = 0) AND (dbo.newsh.Status = 'O') AND         
                      (dbo.newsh.NextFunctionClass = '0100') AND (dbo.newsh.NextFunctionID = '4099999')  AND NEWSH.S4FUTURE12 ='1000003'
                      
                      
ALTER TABLE cab_movi
MODIFY ch_codruta char(7)      

          ALTER TABLE cab_movi
ALTER COLUMN ch_codruta char(7)              