
SELECT PERPOST, PERENT, Status,* 
-- UPDATE Batch SET PERENT = '201901', PERPOST = '201901'
FROM Batch WHERE BatNbr = '000054' AND Module = 'IN'
SELECT PERPOST, PERENT,* 
-- UPDATE INTran SET PERENT = '201901', PERPOST = '201901'
FROM INTran WHERE BatNbr = '000054'
SELECT PerPost, PerEnt,* FROM GLTran WHERE BatNbr = '000054' AND Module = 'IN'



SELECT * FROM sys.tables WHERE name LIKE '%SETUP%'


SELECT * FROM POSetup

SELECT CurrPerNbr, PerNbr, * 
-- UPDATE APSetup SET CurrPerNbr = '201901', PerNbr = '201901'
FROM APSetup

SELECT * 
-- UPDATE ARSetup SET PERNBR = '201801'
FROM ARSetup

SELECT * 
-- UPDATE CASetup SET CurrPerNbr = '201901', PERNBR = '201901'
FROM CASetup 

SELECT * FROM CMSetup
SELECT * FROM SOSetup
SELECT * FROM GESetup
SELECT * FROM AFSetup


SELECT * FROM MKSetup




SELECT PerNbr, * FROM INSetup
SELECT * FROM GLSetup

UPDATE GLSetup SET LastClosePerNbr = '201812', PerNbr = '201901', NbrPer = '12'
UPDATE INSetup SET PerNbr = '201901'






SELECT PerPost, PerEnt, * 
-- UPDATE Batch SET PerPost = '201901', PerEnt = '201901' 
FROM Batch WHERE Module = 'IN' AND PerPost = '201901'

SELECT PerPost, PerEnt, FiscYr, * 
-- UPDATE INTran SET PerPost = '201901', PerEnt = '201901', FiscYr = '2019'
FROM INTran WHERE BatNbr > '00006' AND REFNBR <> 'SALINICIAL'

SELECT PerPost, PerEnt, FiscYr, * 
-- UPDATE GLTran SET PerPost = '201901', PerEnt = '201901', FiscYr = '2019'
FROM GLTran WHERE Module = 'IN' AND REFNBR <> 'SALINICIAL'



------ AP
SELECT PerPost, PerEnt, * 
-- UPDATE Batch SET PerPost = '201901', PerEnt = '201901' 
FROM Batch WHERE Module = 'AP'
AND BatNbr NOT IN (
SELECT BatNbr FROM Batch WHERE Module = 'AP' AND Crtd_User = 'SYSADMIN')


SELECT PerPost, PerEnt, FiscYr, * 
-- UPDATE GLTRAN SET PerEnt = '201812'
FROM GLTran WHERE BatNbr IN (
SELECT DISTINCT BatNbr 
FROM Batch WHERE Module = 'AP'
AND BatNbr NOT IN (
SELECT BatNbr FROM Batch WHERE Module = 'AP' AND Crtd_User = 'SYSADMIN')
) AND PerPost <> '201812'



SELECT * FROM Batch WHERE BatNbr = '000032' AND Module = 'GL'
SELECT * FROM Batch WHERE BatNbr = '000033' AND Module = 'GL'
SELECT * FROM GLTran WHERE BatNbr = '000032' AND Module = 'GL'
SELECT * FROM GLTran WHERE BatNbr = '000033' AND Module = 'GL'

DELETE FROM Batch WHERE BatNbr IN ('000032','000033') AND Module = 'GL'






