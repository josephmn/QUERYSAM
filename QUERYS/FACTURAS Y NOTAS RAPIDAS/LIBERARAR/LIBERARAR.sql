

----------------------------------------------------
---------   SEGUIMIENTO LIBERARAR ------------------
----------------------------------------------------

SP_HELPTEXT LIBERARAR ------------------------------
CREATE proc liberarAR  
@batnbr char(6)  
as  
BEGIN  
--select *from WrkReleaseBad  
--delete from WrkReleaseBad  
--eXEC pa_liberarconError @batnbr--'011124'  
exec pa_liberarconError @batnbr  
  
--EXEC pp_WrkReleaseRec '010324','AR','liberaDiarioVenta',1  
EXEC pp_WrkReleaseRec @batnbr,'AR','liberaDiarioVenta',1  
  
EXEC pp_08400 'liberaDiarioVenta', 'SYSADMIN'  
  
EXEC pp_CleanWrkRelease  'liberaDiarioVenta'  
  
END  
------------------------------------------------------


  
  
  
  


