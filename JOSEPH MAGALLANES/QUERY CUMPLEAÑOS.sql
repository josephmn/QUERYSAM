use Am2018app
go
                         
--SELECT TOP 9999 P.PERID,P.PERNOMBRE,P.PERFNAC,P.PEREMP,P.PERSEXO,  FECHA-DIF AS FECHACORREO      
----CASE TDIA WHEN 0 THEN FECHA ELSE FECHA -1  END FECHACORREO      
--,TDIA AS TIPO       
--,XAMZONAVENTA.DESCRIPCION2 AS ZONA ,V.DIF      
--FROM PERSONALV P INNER JOIN PAASISTH ON (FECHA=CAST(CAST(YEAR(GETDATE())AS CHAR(4))+ '-' + CAST(MONTH(P.PERFNAC)AS CHAR(2))+ '-'+ CAST(DAY(P.PERFNAC)AS CHAR(2))AS SMALLDATETIME))      
--INNER JOIN V_DNACPERSONAL V ON V.PERID=P.PERID      
--LEFT JOIN XAMZONAVENTA ON XAMZONAVENTA.ZONAVENTAID=P.PERZONAID              
--WHERE P.PERSTATUS<>'R' AND MONTH(P.PERFNAC) = MONTH(P.PERFNAC)  and  MONTH(P.perfnac) = 11            
--ORDER BY DAY(P.PERFNAC)         



/*******************************/
/***** ALTOMAYO CUMPLEAÑOS *****/
/*******************************/ 

select P.perid as 'DNI PERSONAL',P.pernombre as 'NOMBRE Y APELLIDOS', P.perfnac as 'FECHA DE NACIMIENTO',X.Descripcion2 as 'LUGAR DE TRABAJO',
(case when P.persexo = 1 then 'M' else 'F' end) 'SEXO' ,(case when P.peremp = 'AM' then 'ALTOMAYO' else '' end) 'EMPRESA' from PERSONALV P 
inner join XAMZONAVENTA X on X.ZonaVentaId = P.perzonaid where MONTH(perfnac) = 11 and perstatus <> 'R' --and X.Descripcion2 = 'Oficina' 
order by DAY(perfnac) 


