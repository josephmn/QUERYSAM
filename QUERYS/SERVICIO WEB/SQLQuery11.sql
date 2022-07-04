

SELECT * FROM CUSTOMER WHERE SLSPERID ='100' AND CUSTID   ='19247373'
SELECT * FROM SOADDRESS WHERE CUSTID ='19247373'

select nu_correla,* from cab_movi s order by s.nu_correla desc 

S4Future02
PUNTONEX                      
SELECT SHIPPERID ,S4Future02,S4Future12,CUSTID,SITEID,* FROM NEWSH ORDER BY INVCDATE DESC 

delete from cab_movi where nu_correla in (1000001,1000002,1000003)
delete from det_movi where nu_correla in (1000001,1000002,1000003)

delete from newsh where shipperid  in ('BDH0020229','BDH0020230','BDH0020231')
delete from newsl where shipperid  in ('BDH0020229','BDH0020230','BDH0020231')

BDH0020229     
BDH0020230     
BDH0020231     
1000003     
'20529332182    '


select custid,* from customer where slsperid ='184' 
 S4Future12
28        

  PUNTONEX                      
    
CREATE  proc  xAMPasarCAByDET_MOVI3          
as        
declare @nu_correla as varchar(10)        
--********************************************************        
-- MARCAR LOS PEDIDOS IMPORTADOS A EMBARQUES *************        
--********************************************************           
declare CD_Cursor  cursor for        
select nu_correla from BD_MOVISTAR.dbo.CAB_MOVI         
WHERE nu_correla in (select nu_correla from CAB_MOVI  WHERE ch_status = 'S' AND ch_nopedido=' ) and  ch_status = 'T' AND ch_nopedido='     
FOR READ ONLY         
Open CD_Cursor         
        
Fetch next from CD_Cursor         
into @nu_correla        
        
--BEGIN TRAN         
        
--IF @@ERROR <> 0  BEGIN GOTO ERROR END        
         
 while (@@fetch_status = 0 )        
 Begin        
 UPDATE BD_MOVISTAR.dbo.CAB_MOVI   SET  ch_status = 'S' WHERE nu_correla   = @nu_correla        
 -- print 'SE VA A OCULTAR EL PROCESO'    
  Fetch next from CD_Cursor         
  into @nu_correla        
 end        
        
 close CD_Cursor        
 Deallocate CD_Cursor        
       
--IF @@ERROR <> 0  BEGIN GOTO ERROR END        
--  COMMIT TRAN        
--  RETURN        
--ERROR:        
--ROLLBACK TRAN        
--RETURN        
        
--********************************************************        
-- PASAR LOS PENDIENTES **********************************        
--********************************************************        
declare CD_Cursor  cursor for        
select nu_correla from BD_MOVISTAR.dbo.CAB_MOVI        
WHERE nu_correla not in (select nu_correla from CAB_MOVI ) and  ch_status = 'T'  FOR READ ONLY --AND ch_nopedido=' --AND ch_nopedido='        
Open CD_Cursor         
        
Fetch next from CD_Cursor         
into @nu_correla        
        
--BEGIN TRAN         
        
--IF @@ERROR <> 0  BEGIN GOTO ERROR END        
  PRINT 'INICIA WHILE'       
 while (@@fetch_status = 0 )        
 Begin        
 PRINT 'NUMERO CORRELATIVO ACTUAL -->' + CAST(@nu_correla AS VARCHAR )  
   
 PRINT 'INSERTA DET'  
  INSERT INTO DET_MOVI (nu_Correla ,ch_CodProd ,ch_CodTran ,ch_BueEst ,ch_FecEnt, vc_NomProd ,nu_Qlitros ,nu_Empaques ,nu_Unidades,    
nu_UniTotal,nu_UniXEmp,vc_Linea, vc_SubLinea, nu_Total,nu_TotIgv ,nu_TotDsct ,nu_Igv ,nu_Dscto ,ch_Bonifica, qfaccon1,ch_CodPromo ,ch_CodMotDe ,ch_fecVenci,    
 nu_Precio,ch_Lin, ch_UniCom ,nu_FacConve ,ch_kits, nu_PreDev ,id ,ch_NumItem ,ch_CodAlm, nu_Peso ,nu_Kgr ,ch_Tipo, ch_NomImpuesto ,nu_ValImpuesto    
)                                 
SELECT nu_Correla ,ch_CodProd ,ch_CodTran ,ch_BueEst ,ch_FecEnt, vc_NomProd ,nu_Qlitros ,nu_Empaques ,nu_Unidades,    
nu_UniTotal,nu_UniXEmp,vc_Linea, vc_SubLinea, nu_Total,nu_TotIgv ,nu_TotDsct ,nu_Igv ,nu_Dscto ,ch_Bonifica, qfaccon1,ch_CodPromo ,ch_CodMotDe ,ch_fecVenci,    
 nu_Precio,ch_Lin, ch_UniCom ,nu_FacConve ,ch_kits, nu_PreDev ,id ,ch_NumItem ,ch_CodAlm, nu_Peso ,nu_Kgr ,ch_Tipo, ch_NomImpuesto ,nu_ValImpuesto FROM BD_MOVISTAR.dbo.DET_MOVI  WHERE nu_correla   =  @nu_correla     
  PRINT 'FIN INSERTA DET'  
   PRINT '              '  
                   
   PRINT 'INSERTA CAB'      
  INSERT INTO CAB_MOVI  ( nu_Correla,ch_CodDistr, ch_CodVende, ch_CodRuta, ch_CodClien, ch_HorInicio, ch_HorTermi, vc_NomClien ,    
ch_Status ,ch_ForPago ,ch_Retomado, nu_Total,nu_Dscto ,nu_Igv ,nu_PesTotal ,ch_NoPedido, ch_Calcular, vc_NomVende,dt_FecInici,dt_FecTermi ,ch_FecInici ,ch_FecTermi ,ch_Repaso,    
 ch_FueRuta ,ch_TipDoc, vc_Giro,vc_NroNextel, ch_CodMotDe, ch_CodCanal ,id )            
  select  nu_Correla,ch_CodDistr, ch_CodVende, ch_CodRuta, ch_CodClien, ch_HorInicio, ch_HorTermi, vc_NomClien ,    
ch_Status ,ch_ForPago ,ch_Retomado, nu_Total,nu_Dscto ,nu_Igv ,nu_PesTotal ,ch_NoPedido, ch_Calcular, vc_NomVende,dt_FecInici,dt_FecTermi ,ch_FecInici ,ch_FecTermi ,ch_Repaso,    
 ch_FueRuta ,ch_TipDoc, vc_Giro,vc_NroNextel, ch_CodMotDe, ch_CodCanal ,id  from BD_MOVISTAR.dbo.cab_MOVI  WHERE nu_correla   =  @nu_correla        
  PRINT 'FIN INSERTA CAB'    
  Fetch next from CD_Cursor    
  into @nu_correla        
 end        
  PRINT 'FIN WHILE'    
 close CD_Cursor        
 Deallocate CD_Cursor        
     
   