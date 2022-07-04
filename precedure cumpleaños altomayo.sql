
CREATE proc [dbo].[CUMPLEANIOSAM] --'201410'                            
@periodo char(6)                            
as                            
DECLARE  @cuerpo VARCHAR(max) = ''                            
DECLARE  @catidad  VARCHAR(100) = ''                            
DECLARE  @numero  VARCHAR(100) = ''                            
DECLARE  @local VARCHAR(100) = ''                            
DECLARE  @documento VARCHAR(100) = ''                            
Declare @Tabla varchar(max)                                
Declare @Fila varchar(max)                                
Declare @Estilo varchar(1000) =''                            
Declare @Mensaje varchar(max)                                 
--select cantidad,numero,local,documento from V_repetidos                            
                            
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
 from [am2018app].[dbo].pa_cumpleanios where FECHACORREO =               
 (convert(varchar,year(getdate()), 120)) +'-'+(convert(varchar,month(getdate()), 120)+'-'+(convert(varchar,day(getdate()), 120)))              
 --'2018-01-11' --convert(varchar, GETDATE(), 103)                
                                 
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
  @recipients ='asistentesocial@cafealtomayo.com.pe;manuel.calderon@cafealtomayo.com.pe;personal@cafealtomayo.com.pe',                                                  
  @copy_recipients ='sistemas@cafealtomayo.com.pe;laison.gasla@cafealtomayo.com.pe;joel.vasquez@cafealtomayo.com.pe;joseph.magallanes@cafealtomayo.com.pe;soporte@cafealtomayo.com.pe',                                      
  @importance = 'HIGH',                                                 
  @subject    = 'Alerta de Cumpleaños',                                                  
@body    = @Mensaje  ,                                       
  @body_format='HTML',                                      
  @profile_name ='SqlMailCoffee';                                 
end 