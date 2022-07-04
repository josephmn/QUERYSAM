

----------ALTOMAYO-------
--REFNBR  = NRO NOTA CREDITO
SELECT * FROM PLCMInvcnbr WHERE REFNBR ='F090000222'

--INVCNBR FACTURA RELACIONADA
SELECT * FROM PLCMInvcnbr WHERE INVCNBR ='F050001568'
-------------------------


---facelectro
select * from PLCMInvcnbr where RefNbr  ='F009-00222'

--DELETE FROM PLCMInvcnbr where RefNbr  ='F009-00222'

--INSERT INTO PLCMInvcnbr (CpnyID,Custid,DocType,InvcNbr,LineNbr,RefNbr,ShipperID,User1,User2,User3,User4,User5,User6,User7,User8)
SELECT CpnyID,Custid,DocType,'PERRY',LineNbr,'F009-00222',ShipperID,User1,User2,User3,User4,'07','01',User7,User8 FROM [altomayo-temp].[am2018app].[dbo].[PLCMInvcnbr]
where refnbr  ='F090000222'


--SELECT * FROM [PLCMInvcnbr]
--where InvcNbr  ='F001-01813'



--UPDATE [PLCMInvcnbr]
--SET RefNbr = 'F009-00223' WHERE InvcNbr  ='F001-01813'



--SELECT * FROM documento WHERE serie_comprobante = 'F001' AND nro_comprobante = '01813'

