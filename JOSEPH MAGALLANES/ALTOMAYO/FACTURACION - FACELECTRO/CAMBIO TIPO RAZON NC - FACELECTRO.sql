

/************* PARA CAMBIO DE TIPO NC EN FACTURACION ***********************/

-- SE ENCONTRO EL CAMBIO EN LA TABLA [MGTABGENFED] PARA QUE EN EL XML APAREZCA LA RAZON 03 - POR LAS EXPORTACIONES

SELECT * FROM [dbo].[MGTABGENFED] WHERE descripcion LIKE '%DESCR%'

SELECT * FROM [dbo].[MGTABGENFED] WHERE codelemento = '006'

SELECT * FROM [dbo].[MGTABGENFED] WHERE codelemento = '003'



SELECT * FROM [MGTABGENFED] WHERE codtabla = '009'















