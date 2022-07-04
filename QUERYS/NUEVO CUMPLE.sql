
  AMenvioCumpleaños '201612'



1	SqlMailCoffee	1	SMTPhosting	1
2	SqlMailCoffee1	2	reportes@cafealtomayo.com.pe	1

EXECUTE msdb.dbo.sysmail_help_profileaccount_sp  
   @profile_name = 'SqlEnvioMail';  
   

   
EXECUTE msdb.dbo.sysmail_add_profileaccount_sp
@profile_name = 'SqlEnvioMail',
@account_name = 'SMTPhosting',
@sequence_number = 10



In the Object Explorer, connect to an instance of the SQL Server Database Engine and then expand that instance.
Right-click SQL Server Agent, and then click Properties.
On the Alert System page, check Enable Mail Profile.
If the Enable Mail Profile checkbox is not available, SQL Mail or Database Mail is not configured properly. For more information, see Database Mail How-to Topics and SQL Mail How-to Topics.
Select either Database Mail or SQL Mail from the Mail system list. If you choose SQL Mail, select a profile in the Mail profile box. If no profiles are listed, enter the name of the profile to use.
Restart the SQL Server Agent service for your changes to take effect. For more information, see How to: Restart the SQL Server Agent Service (SQL Server Management Studio).
   
   
‘Default Mail Profile
EXEC sp_configure 'database mail XPs', 1;
GO
RECONFIGURE WITH OVERRIDE;
GO
------------------
  
alter proc AMenvioCumpleaños --'201410'      
@periodo char(6)      
as      
DECLARE  @cuerpo NVARCHAR(1000)     
DECLARE  @catidad  NVARCHAR(100)      
DECLARE  @numero  NVARCHAR(100)       
DECLARE  @local NVARCHAR(1000)       
DECLARE  @documento NVARCHAR(1000)      
Declare @Tabla Nvarchar(1000)          
Declare @Fila Nvarchar(1000)          
Declare @Estilo Nvarchar(1000)     
Declare @Mensaje Nvarchar(1000)           
--select cantidad,numero,local,documento from V_repetidos      
  SET @cuerpo  =''    
  SET @catidad  =''    
  SET @numero  =''    
  SET @local  =''    
  SET @documento  =''    
  set @Estilo =''    
     
set @Estilo='      
<style type="text/css">      
#customers      
{      
font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;      
width:50%;      
border-collapse:collapse;      
}      
#customers td, #customers th       
{      
font-size:0.8em;      
border:1px solid #98bf21;      
padding:3px 7px 2px 7px;      
             
}      
#customers th       
{      
font-size:0.9em;      
text-align:center;      
padding-top:5px;      
padding-bottom:4px;      
background-color:#5836bd;      
color:#ffffff;      
}      
#customers tr.alt td       
{      
color:#000000;      
background-color:#EAF2D3;      
}      
#customers td.nn        
{      
font-size:0.6em;      
text-align:center;      
padding-top:5px;      
padding-bottom:4px;      
font-weight: bold;      
}      
</style>'      
set @Mensaje=''      
set @Tabla=''      
set @Fila=''      
      
set @Tabla='<table id="customers" ><th> DNI </th> <th> Nombre </th> <th> Fecha Nacimiento </th> <th> Zona </th>'      
      
DECLARE cClientes CURSOR FOR      
 select PERID cantidad,PERNOMBRE numero,PERFNAC local,ZONA documento      
 from am2016app.dbo.pa_cumpleanios where FECHACORREO =  convert(varchar, getdate(), 101)      
OPEN cClientes      
FETCH cClientes INTO   @catidad,@numero,@local,@documento      
WHILE (@@FETCH_STATUS = 0 )      
BEGIN      
set @Fila=@Fila + '<tr><td>' + @catidad + '</td>' + '<td> ' + @numero +'</td>'+ '<td> ' + @local +'</td>'+ '<td> ' + @documento  +'</td> </tr>'      
  --set @Fila=@Fila + '<tr><td>' + @nombre + '</td>' + '<td> ' + @Zona +'</td> </tr>'      
      
FETCH cClientes INTO   @catidad,@numero,@local,@documento      
END      
CLOSE cClientes      
DEALLOCATE cClientes      
      
begin      
 SET @Tabla=@Estilo + @Tabla + @Fila + '</table>'      
 SET @Mensaje = 'Relacion de personal ALTOMAYO que cumple años el dia de hoy  '+  convert(varchar, getdate(), 105)  + '<br><BR>' + @Tabla + '<BR> ...!!'      
 EXEC msdb.dbo.sp_send_dbmail                               
  @recipients = 'manuel.rojas@cafealtomayo.com.pe;manuel.calderon@cafealtomayo.com.pe;luis.urpay@altomayoretail.pe;roxana.diaz@cafealtomayo.com.pe;fabian.rodriguez@altomayoretail.pe;laison.gasla@cafealtomayo.com.pe',                        
  @copy_recipients = 'manuel.rojas@cafealtomayo.com.pe',                            
  @importance = 'HIGH',                           
  @subject    = 'CUMPLEAÑOS ALTOMAYO '   ,                         
  @body    = @Mensaje  ,                 
   @body_format='HTML',                
  @profile_name ='SQLMAILFAC';      
       
end   