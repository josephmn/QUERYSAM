

sp_helptext  xAMPasarClte_D_Sol_Nextel2

  
  
CREATE proc [dbo].[xAMPasarClte_D_Sol_Nextel2]               
@CodCliente char(11)              
as              
--SET NOCOUNT ON              
--BEGIN TRAN              
 DELETE MAE_CLI  where  ch_CodClien='20511908745'               
 ----danny-- IF @@ERROR <> 0  BEGIN GOTO ERROR END              
              
    INSERT INTO MAE_CLI (ch_coddistr,ch_codclien,ch_codcanal,vc_nomclien,ch_codruta,int_ordvisi,ch_codven,ch_diavisi,ch_conpago,vc_ruc,vc_giro,vc_direccion,
    nu_concredi,nu_lincredi,ch_habencue,ch_encuesta,ch_forpago,ch_ffvv_01,ch_ffvv_02, ch_ffvv_03, ch_ffvv_04,ch_lstprecio)               
    select 'ch_CodDistr'= case left(c.user5,1)                
       when 'L' then '01'   -- Lima              
       when 'P' then '03'   -- Piura              
       when 'T' then '04'   -- Trujillo              
       ELSE  ( case left(c.user5,2)     
       when '01' then (case when c.slsperid in ('463') THEN '06' else '01'end)  -- Chiclayo               
        when '03' then '02' -- Chiclayo              
        when '09' then '02' -- Chiclayo              
        when '14' then '02' -- Chiclayo              
        when '18' then '05' -- Huancayo              
        else ( case left(c.user5,3)                
         when 'F01'  then (CASE  WHEN c.fax IN ('LIMA','LIBO','LIME')  THEN '01' --IN ('LFV1','LFV2','LFV3','LFV4','LFV5','LFV6','LFV7')  THEN '01' -- lIMA            
             -- ELSE '06'         
   END)  --SURCO              
         when 'F03' THEN '02'  -- Chiclayo              
         when 'F10' THEN '03'  -- Piura              
         when 'F02' thEN '04'  -- Trujillo              
         when 'F12' THEN '05'  -- Huancayo              
         when 'F14' THEN '07'  -- Arequipa              
         when 'F06' THEN '99'  -- Limcen              
         when 'F07' THEN '99'  -- Limcen              
         when 'F08' THEN '99'  -- Limcen              
         when 'F09' THEN '99'  -- Limcen              
         when 'F11' THEN '99'  -- Limcen        
   when 'F15' THEN '08'  -- Chincha               
   when 'F16' THEN '09'  -- Cusco        
         
         else '99' end )               
        end )      
                    
       end,              
       'ch_CodClien'=LEFT(c.custid,11), 'ch_CodCanal'= right(rtrim(s.s4future01),2),              
           'vc_NomClien' = LEFT(c.Name,50), 'ch_CodRuta'= LEFT(c.user5,7), 'int_OrdVisi'=1,               
        'ch_CodVen'= case when LEFT((SELECT e.slsperid FROM [192.168.10.51].AM2017APP.dbo.XAMMAE_RUTA e where Zonarutaid=LEFT(c.user5,7)),6) IS NULL THEN left(c.slsperid,6) ELSE LEFT((SELECT d.slsperid FROM [192.168.10.51].AM2017APP.dbo.XAMMAE_RUTA d     
  
  
  
  
  
  
where Zonarutaid=LEFT(c.user5,7)),6) END , --left(slsperid,6)              
           'ch_DiaVisi'='1', 'ch_ConPago'= 'C' ,--case when c.terms='01' then 'C' else '' end,              
       'vc_Ruc'=LEFT(c.TAXLOCID,11), 'vc_Giro'='',              
           'vc_Direccion'= LEFT(rtrim(c.addr1) + ' ' + left(rtrim(c.addr2),20),50) ,'nu_ConCredi'=0,'nu_LinCredi'=c.crlmt,               
           'ch_HabEncue'='0', 'ch_Encuesta'='0', 'ch_ForPago'='03', 'ch_FFVV_01'='01', 'ch_FFVV_02'='', 'ch_FFVV_03'='', 'ch_FFVV_04'='','ch_LstPrecio'=right(rtrim(s.s4future01),4)              
    FROM   [192.168.10.51].AM2017APP.dbo.customer c inner join [192.168.10.51].AM2017APP.dbo.soaddress s             
   on c.custid = s.custid             
    where  RTRIM(c.user5) NOT IN ('LSINACT','LSINRUT') AND c.status='A' and s.shiptoid = 'DEFAULT'            
       and  c.custid='20511908745'              
       and ( left(c.user5,2) in ('01','02','05','07','08','10','11','12','13','15','16','17','18','19','03','09','14','04','20','21','22')               
        or left(c.user5,1) in ('L','P','T','F'))               
 --danny-- IF @@ERROR <> 0  BEGIN GOTO ERROR END              
--  COMMIT TRAN              
 --danny--  RETURN              
 --danny--ERROR:              
--ROLLBACK TRAN              
 --danny--RETURN   
  
  
  
  