
select doctype,batnbr,refnbr,docdate,* from ardoc where refnbr  like '%F270001034'

 RegularizarIGV2 '201611','2016-11-10','040089'

CREATE proc RegularizarIGV2 
@xPerpost char(6) ='201510'  
,@xDocDate char(10) ='2015-10-23'
,@BATNBR char(6)  ='030393'
as begin  
  
BEGIN TRANSACTION -- O solo BEGIN TRAN  
BEGIN TRY  

--exec EliminarProcesosSleep

set language english  
  
if (@xPerpost = '201301' or @xPerpost  = '201302' or @xPerpost  = '201303' or @xPerpost  = '201304'  or @xPerpost  = '201305' or @xPerpost  = '201306' or @xPerpost  = '201307')  
begin  
 raiserror('Periodo No Permitido',3,1)  
end  
else  
begin  
  
 print 'Eliminar Tablas Temporales'  
 delete from WrkRelease   
 delete from  HistDocSlsTax  
  
 declare @xAcct74 char(6),@xAcct70 char(6) ,@xAcct40 char(6)   
 set @xAcct74 ='741101'  
 set @xAcct70 ='701110'  
 set @xAcct40 ='401110'  
  
 print 'Algunas Ventas no aparecen en el Reg Ventas. Con este Query aparecen todas las que se han ingresado'  
 update D set user6 ='12' from batch D where 1 = 1  
 and module='AR' and user6='1' --and Crtd_User ='SYSADMIN'  
 and D.perpost = @xPerpost and S4Future09 = 1  
 and D.batnbr =@BATNBR

  
 print 'Actualizar IGV 40 Y Cta 70 ArDoc a partir del total'  
 update D set TaxTot00 = round((abs(OrigDocAmt)/1.18)*0.18,2),txblTot00 =round((abs(OrigDOcAmt)/1.18),2)  
 from  Ardoc  D   
 where 1 =1   
 and D.S4Future09 = 1  
 and D.perpost =@xPerpost  
 and D.batnbr =@BATNBR
 
 print 'Actualizar Cliente Varios'  
 update D set CustId = '88888888'  
 from  Ardoc  D   
 where 1 =1   
 and CustId like '%8888%'   
 and len(CustId) <> 8   
 and D.perpost =@xPerpost  
 and D.batnbr =@BATNBR
  
 print 'Llenamos la tabla temporal #Cta74'  
 IF OBJECT_ID('tempdb..#Cta74') IS NOT  NULL    
 DROP TABLE #Cta74  
    
 select D.BatNbr, D.RefNbr ,T.TranAmt,T.Crtd_User   
 into #Cta74  
 from  Artran  T   
 inner join Ardoc D on D.batNbr =T.batNbr and D.RefNbr = T.RefNbr and D.Crtd_User = T.Crtd_User    
 where 1 =1   
 and D.S4Future09 = 1  
 and D.perpost = @xPerpost  
 and T.Acct = @xAcct74  
 and T.tranAmt <> 0  
 and D.batnbr =@BATNBR

 print 'Actualizar CUENTA 70'  
 update A set tranAmt =round(abs(D.OrigDocAmt/1.18) + abs(isnull(C74.TranAmt,0)),2),CurytranAmt = round(abs(D.OrigDocAmt/1.18) + abs(isnull(C74.TranAmt,0)),2)  
 from artran A  
 inner join Ardoc D on A.batNbr = D.BatNbr and D.RefNbr = A.RefNbr and A.Crtd_User = D.Crtd_User  
 left join #Cta74 C74 on A.batNbr = C74.BatNbr and A.RefNbr = C74.RefNbr and A.Crtd_User = C74.Crtd_User  
 where 1 = 1  
 and A.Acct = @xAcct70  
 and A.perpost = @xPerpost   
 and A.tranAmt <> 0  
 and D.Doctype in ('CM','IN')  
 and D.S4Future09 = 1  
 and JrnlType ='AR'  
 and A.batnbr =@BATNBR
  
 print 'Llenamos la tabla temporal #Cta70'  
 IF OBJECT_ID('tempdb..#Cta70') IS NOT  NULL    
 DROP TABLE #Cta70  
    
 select D.BatNbr, D.RefNbr ,T.TranAmt,T.Crtd_User   
 into #Cta70  
 from  Artran  T   
 inner join Ardoc D on D.batNbr =T.batNbr and D.RefNbr = T.RefNbr and D.Crtd_User = T.Crtd_User    
 where 1 =1   
 and D.S4Future09 = 1  
 and D.perpost = @xPerpost  
 and T.Acct = @xAcct70  
 and T.tranAmt <> 0  
 and D.batnbr =@BATNBR
 --Actualizar ArTran Cta40 IGV  
 update T set TranAmt = round((abs(C70.tranAmt)-abs(C74.tranAMt))*0.18,2),CuryTranAmt =round((abs(C70.tranAmt)-abs(C74.tranAMt))*0.18,2)  
 from  Artran  T   
 inner join Ardoc D on D.batNbr =T.batNbr and D.RefNbr = T.RefNbr and D.Crtd_User = T.Crtd_User  
 inner join #Cta70 C70 on D.batNbr = C70.batNbr and D.RefNbr = C70.RefNbr and D.Crtd_User = C70.Crtd_User  
 inner join #Cta74 C74 on D.batNbr = C74.batNbr and D.RefNbr = C74.RefNbr and D.Crtd_User = C74.Crtd_User   
 where 1 =1   
 and D.S4Future09 = 1  
 and T.tranAmt <> 0  
 and T.Acct = @xAcct40  
 and D.perpost =@xPerpost  
 and D.batnbr =@BATNBR
 /* Confirmamos la transaccion*/  


 print 'Actualiza Cuenta 74 para que aparezca en haber'  

 print 'Actualiza Artran 74'
 update T set tranAmt = abs(tranAmt),CurytranAmt = abs(CurytranAmt),S4Future10=1,DrCr = case when DrCr ='C' then 'D' else 'C' end --mueve columna
 from  Artran  T   
 inner join Ardoc D on D.batNbr =T.batNbr and D.RefNbr = T.RefNbr and D.Crtd_User = T.Crtd_User  
 inner join Batch B on B.batNbr = D.batNbr and B.Crtd_User = D.Crtd_User
 where 1 =1   
 and B.Module ='AR'
 and B.Status ='P'
 and D.S4Future09 = 1  
 and D.perpost = @xPerpost  
 and D.rlsed =1
 and T.Acct = @xAcct74  
 and T.S4Future10 =0
 and T.tranAmt <> 0  
 and T.tranAmt < 0
 and D.batnbr =@BATNBR

 print 'Actualiza Gltran 74'
 update T set DrAmt = case when DrAmt = 0 then abs(CrAmt) else 0 end,CrAmt = case when CrAmt = 0 then abs(DrAmt) else 0 end 
 ,CuryDrAmt = case when CuryDrAmt = 0 then abs(CuryCrAmt) else 0 end,CuryCrAmt = case when CuryCrAmt = 0 then abs(CuryDrAmt) else 0 end
 ,S4Future10=1
 from gltran T
 inner join Ardoc D on D.batNbr =T.batNbr and D.RefNbr = T.RefNbr and D.Crtd_User = T.Crtd_User    
 inner join Batch B on B.batNbr = D.batNbr and B.Crtd_User = D.Crtd_User
 where 1 =1   
 and B.Module ='AR'
 and B.Status ='P' 
 and D.S4Future09 = 1  
 and D.rlsed =1
 and D.perpost = @xPerpost  
 and T.module ='AR'
 and T.Acct = @xAcct74  
 and T.S4Future10 =0
 and D.batnbr =@BATNBR

 update G set DrAmt  =case when DrAmt =0 then abs(CrAmt) else 0 end  ,CrAmt = case when CrAmt =0 then abs(DrAmt) else 0 end 
 ,CuryDrAmt  =case when DrAmt =0 then abs(CrAmt) else 0 end  ,CuryCrAmt = case when CrAmt =0 then abs(DrAmt) else 0 end
 from gltran G
 inner join Ardoc A on G.batNbr = A.batNbr and G.RefNbr = A.RefNbr and G.Crtd_USer = A.Crtd_User
 where 1 = 1
 and A.Crtd_User ='SYSADMIN'
 and G.Crtd_User ='SYSADMIN'
 and A.Perpost ='201603'
 and G.module ='AR'
 and ( G.DrAmt <0 or G.CrAmt<0)
 and A.batnbr =@BATNBR

end   

COMMIT TRANSACTION -- O solo COMMIT  
END TRY  
BEGIN CATCH  
 print 'Hay un error, deshacemos los cambios'      
 /* Hay un error, deshacemos los cambios*/  
    ROLLBACK TRANSACTION -- O solo ROLLBACK  
    PRINT 'Se ha producido un error!'  
END CATCH  
end













