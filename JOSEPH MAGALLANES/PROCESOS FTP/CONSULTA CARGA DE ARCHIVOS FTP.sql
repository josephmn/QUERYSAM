use AMCUSTOMER
GO

/**** TCA ****/
select * from altomayo_carteras where periodo_ven = 
LEFT(RIGHT(CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(8)),4),2) /*--MES*/+CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(4)) and cliente_cod = 5
select * from altomayo_ventas where MONTH(fecha_ven) = MONTH(GETDATE()) and YEAR(fecha_ven) = YEAR(GETDATE()) and cliente_cod = 5
select * from altomayo_inventarios where periodo_inv = 
LEFT(RIGHT(CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(8)),4),2) /*--MES*/+CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(4)) /*--AÑO*/ 


/**** ECONOMYSA ****/
select * from altomayo_carteras where periodo_ven = 
LEFT(RIGHT(CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(8)),4),2) /*--MES*/+CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(4)) /*--AÑO*/  and cliente_cod = 1
select * from altomayo_ventas where MONTH(fecha_ven) = MONTH(GETDATE()) and YEAR(fecha_ven) = YEAR(GETDATE()) and cliente_cod = 1

--select DISTINCT fecha_ven from altomayo_ventas where MONTH(fecha_ven) = MONTH(GETDATE()) and YEAR(fecha_ven) = YEAR(GETDATE()) and cliente_cod = 1 ORDER BY fecha_ven ASC

--SELECT LEFT(RIGHT(CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(8)),4),2) /*--MES*/+CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(4)) /*--AÑO*/ 