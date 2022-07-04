

SELECT RAZON, LTRIM(RTRIM(LOCAL)) LOCAL, LTRIM(RTRIM(AREA)) AREA, LTRIM(RTRIM(Cargo)) Cargo, LTRIM(RTRIM(USUARIO)) USUARIO, LTRIM(RTRIM(Categoria)) EQUIPO, Marca, PULGADAS, ModeloX, HDD, RAM
FROM (
-- // EQUIPOS ASIGNADOS A USUARIOS (ENS) //
SELECT *

FROM (
SELECT TOP 9999999999 'EQUIPO ASIGNADO' DATO, * FROM (
SELECT Y.*, ISNULL(LTRIM(RTRIM(DET.PER_COD)),'') DNI, ISNULL(P.NOMBRES_COMPLETOS,'') USUARIO, P.NombreLocal Local, ISNULL(P.Area,'') Area, ISNULL(P.Cargo,'') Cargo FROM (
SELECT Z.Id, Z.Correlativo, Z.Categoria, Z.Marca,                
(CASE WHEN PROCESADOR_DATO = '' THEN (CASE WHEN CLASIFIC <> '' THEN CLASIFIC+' ' ELSE '' END)+Modelo+' '+Chipset ELSE Modelo END) Modelo, RAZON, '' PULGADAS, ModeloX, 

(
SELECT (LTRIM(RTRIM(CAPACIDAD)) + ' '+ Unidad) HDD FROM (
SELECT SUM(CAST(C.Capacidad AS FLOAT)) CAPACIDAD, D.Unidad, H.CorrelaENS
FROM EnsambladoD H
INNER JOIN Activos J ON H.Correlativo = J.Correlativo
INNER JOIN MODELO_HDD C ON J.CodModelo = C.Correlativo
INNER JOIN (SELECT Id, Unidad FROM CargarUnidades WHERE EnlaceUnid = 'CAPACIDAD_HDD') D ON C.UndCapacidad = D.Id
WHERE 
--CorrelaENS = 'ENS0000000001'AND 
H.Categoria = 'DISCO DURO INTERNO'
GROUP BY D.Unidad, H.CorrelaENS
) HDD  WHERE CorrelaENS = Z.Correlativo AND CorrelaENS NOT IN ('ENS0000000046','ENS0000000088','ENS0000000126')) HDD ,

(
SELECT (LTRIM(RTRIM(CAPACIDAD)) + ' '+ Unidad) RAM FROM (
SELECT SUM(CAST(C.Capacidad AS FLOAT)) CAPACIDAD, 'GB' UNIDAD, A.CorrelaENS
FROM EnsambladoD A
INNER JOIN Activos B ON A.Correlativo = B.Correlativo
INNER JOIN MODELO_MemoriaRAM C ON B.CodModelo = C.Correlativo
WHERE --CorrelaENS = 'ENS0000000001' AND 
A.Categoria = 'MEMORIA RAM'
GROUP BY  A.CorrelaENS
) RAM  WHERE CorrelaENS = Z.Correlativo) RAM ,
     
SERIEB, (CASE WHEN MARCAB = 'APPLE' THEN SERIEB ELSE (CASE WHEN CodActivo <> '' THEN CodActivo ELSE '' END) END) Serie, 
LEFT(Z.Correlativo,3) Nomen, (CASE WHEN NomEstado = 'ACTIVO' THEN 'OPERATIVO' ELSE NomEstado END) Estado, Observacion, Comentario FROM (

SELECT DISTINCT A.Id, A.Correlativo, E.Descripcion Categoria,      
          
ISNULL((SELECT LTRIM(RTRIM(Modelo)) Modelo  FROM EnsambladoD WHERE CorrelaENS = A.Correlativo AND Categoria = 'PLACA MADRE'),'')+' / '+                    
ISNULL((SELECT LTRIM(RTRIM(Modelo)) Modelo FROM EnsambladoD WHERE CorrelaENS = A.Correlativo AND Categoria = 'PROCESADOR'),'') Modelo,  

ISNULL((SELECT G.RazonProveedor FROM Activos G WHERE G.ModoAdquisicion = 13 AND G.Correlativo = B.Correlativo),'') RAZON,

ISNULL((SELECT LTRIM(RTRIM(Modelo)) Modelo FROM EnsambladoD WHERE CorrelaENS = A.Correlativo AND Categoria = 'PROCESADOR'),'') ModeloX, 
                  
(SELECT Marca FROM EnsambladoD WHERE CorrelaENS = A.Correlativo AND Categoria = 'PLACA MADRE') Marca,               
(CASE WHEN E.Descripcion IN (SELECT LTRIM(RTRIM(NomPlaca)) NomPlaca FROM TipoPlaca WHERE AfterF1 = 1) THEN B.Serie ELSE ISNULL(B.Serie,'') END ) Serie,
(SELECT LTRIM(RTRIM(Modelo)) Modelo FROM EnsambladoD WHERE CorrelaENS = A.Correlativo AND Categoria = 'PLACA MADRE') PLACAMADRE_DATO,                
ISNULL((SELECT LTRIM(RTRIM(Modelo)) Modelo FROM EnsambladoD WHERE CorrelaENS = A.Correlativo AND Categoria = 'PROCESADOR'),'') PROCESADOR_DATO, B.Marca MARCAB, B.SERIE SERIEB, ISNULL(CE.CodActivo,'') CodActivo,           
(CASE WHEN C.Clasificacion <> 0 THEN F.Cla_Descripcion ELSE '' END) CLASIFIC, D.Chipset, ST.NomEstado, C.Observacion, C.Comentario
FROM EnsambladoH A                    
INNER JOIN EnsambladoD B ON A.Correlativo = B.CorrelaENS                
INNER JOIN Activos C ON B.Correlativo = C.Correlativo                
INNER JOIN MODELO_PlacaMadre D ON C.CodModelo = D.Correlativo                
INNER JOIN TipoPlaca E ON D.TipoPlaca = E.Id                
LEFT JOIN ClasificacionEquipos F ON C.Clasificacion = F.ClaId     
LEFT JOIN GET_SERIE_X_CASE_ENSAMBLADO CE ON B.CorrelaENS = CE.CorrelaENS           
LEFT JOIN Estados ST ON A.Estado = ST.Id

--WHERE A.Estado IN (SELECT Id FROM Estados WHERE AfterF1 = 'ENSAMBLES' AND AfterF5 = 1)   --AND   A.Correlativo = 'ENS0000000086'      
--WHERE C.ModoAdquisicion <> 13  
--WHERE A.Correlativo = 'ENS0000000001'
) Z
) Y
LEFT JOIN AsignacionD DET ON Y.Correlativo = DET.Correlativo
LEFT JOIN PERSONAL_V P ON DET.PER_COD = P.PER_COD
) V WHERE V.USUARIO <> '' AND Estado = 'OPERATIVO'
ORDER BY Categoria, DNI
) Z

UNION ALL

--// EQUIPOS ASIGNADOS A UN USUARIO (RGA) //
SELECT * FROM (
SELECT TOP 999999999 * FROM (
SELECT 'EQUIPO ASIGNADO' DATO, A.Id, A.Correlativo, (CASE WHEN A.Categoria <> 33 THEN CA.Cat_Descripcion ELSE TD.NombreDis END) Categoria, 
A.Marca, A.Modelo, 

ISNULL((SELECT G.RazonProveedor FROM Activos G WHERE G.ModoAdquisicion = 13 AND G.Correlativo = A.Correlativo),'') RAZON,

ISNULL((SELECT LTRIM(RTRIM(PANEL+' "')) FROM MODELO_Monitor WHERE Correlativo = A.CODMODELO),'') PULGADAS, '' ModeloX,


'' HDD, '' RAM, A.Serie, ISNULL(A.CodActivo,'') SerieB, LEFT(A.Correlativo,3) Nomen, 
E.NomEstado Estado, A.Observacion, A.Comentario, ISNULL(LTRIM(RTRIM(AH.PER_COD)),'') DNI, ISNULL(V.NOMBRES_COMPLETOS,'') USUARIO, V.NombreLocal Local, 
ISNULL(V.Area,'') Area, ISNULL(V.Cargo,'') Cargo
FROM Activos A
INNER JOIN Estados E ON A.Est = E.Id
INNER JOIN CategoriaActivos CA ON A.Categoria = CA.CatId
LEFT JOIN AsignacionD AG ON AG.Correlativo = A.Correlativo
LEFT JOIN AsignacionH AH ON AH.Correlativo = AG.User1
LEFT JOIN PERSONAL_V V ON AH.PER_COD = V.PER_COD
LEFT JOIN MODELO_Varios MV ON MV.Correlativo = A.CodModelo
LEFT JOIN TipoDispositivo TD ON TD.Id = MV.TipoDispositivo
WHERE A.Correlativo NOT IN (SELECT Correlativo FROM EnsambladoD) --AND A.ModoAdquisicion <> 13
AND A.Est = 1
) X WHERE DNI <> ''
ORDER BY Categoria, DNI
) Z WHERE Categoria IN ('TECLADO','MOUSE','MONITORES')

) X 

ORDER BY Local, Area, DNI


