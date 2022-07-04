


SELECT DfltPOUnit,DfltSOUnit,StkUnit,*
-- update Inventory set DfltPOUnit='CJA10',DfltSOUnit='CJA10',StkUnit='CJA10'
FROM Inventory Where invtid ='21738'

--SELECT * FRom InventoryADG Where invtid ='21785'

SELECT DfltPOUnit,DfltSOUnit,*
-- update itemsite set DfltPOUnit='CJA10',DfltSOUnit='CJA10'
FROM itemsite Where invtid ='21738'

--SELECT  shipperid,UnitDesc,*
---- update newSL set UnitDesc='CJA10'
--FRom newSL Where invtid ='21738'

--SELECT  UnitDesc,*
---- update SOShipLine set UnitDesc='CJA10'
--FRom SOShipLine Where invtid ='21738'

SELECT  UnitDesc,*
-- update intran set UnitDesc='CJA10'
FRom intran Where invtid ='21738'

/*
select *from Kit Where KitID  ='21784'
select *from AssyDoc Where KitID  ='21784'
*/




