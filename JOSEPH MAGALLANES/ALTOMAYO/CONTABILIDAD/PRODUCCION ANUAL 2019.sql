
SELECT KitId 'Invtid', UPPER(b.Descr) Nombre, SUM(TotKitCntr) Cantidad, CostoPromGen 'Costo Promedio'

FROM [xAMViewCabKit] A
LEFT JOIN Inventory B ON A.kitid = B.Invtid

group by KitId, b.Descr, CostoPromGen

