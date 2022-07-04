SELECT DocBal, CustId, * FROM ARDoc WHERE refnbr = 'F090001517'
union all
SELECT DocBal, * FROM ARDoc WHERE refnbr = 'F090001507'


SELECT DocBal, * FROM [OCTUBREAPP]..ARDoc WHERE refnbr = 'F090001517'
union all
SELECT DocBal, * FROM [OCTUBREAPP]..ARDoc WHERE refnbr = 'F090001507'


select * from ARAdjust where AdjdRefNbr = 'F090001507'
select * from ARAdjust where AdjdRefNbr = 'F090001517'


select * from ARAdjust where AdjgRefNbr = 'F090001517'
select * from ARAdjust where AdjgRefNbr = 'F090001507'

--select * from ARAdjust where CustId = '20502476271' and AdjgDocDate = '2021-10-28'
--023054    

select * from AR_Balances where custid = '20502476271'



select * from ARAdjust where CustId = '20502476271'


select sum(CuryOrigDocAmt) from ARDoc where CustId = '20502476271' and DocType = 'IN'  and CuryDocBal = 0 AND RefNbr = 'F010024033'

select SUM(AdjAmt) from ARAdjust where CustId = '20502476271' and AdjgDocType = 'PA' and S4Future11 <> 'V' AND AdjdRefNbr = 'F010024033'
select SUM(AdjAmt) from ARAdjust where CustId = '20502476271' and AdjgDocType = 'CM' and S4Future11 <> 'V' AND AdjdRefNbr = 'F010024033'



select sum(CuryOrigDocAmt) from ARDoc where CustId = '20502476271' and DocType = 'IN' and CuryDocBal <> 0


select RefNbr, DocType, * from ARDoc where CustId = '20502476271' and DocType = 'IN' and PerPost = '202110' and DocBal > 0

-- 438061.29

select * from PLCMInvcnbr WHERE RefNbr = 'F090001507'


select Crtd_DateTime, * from ARDoc where CustId = '20502476271' and DocType = 'IN'  and CuryDocBal = 0 AND RefNbr = 'F010024033' --2021-11-02 09:43:00
select Crtd_DateTime, * from ARDoc where CustId = '20502476271' and  RefNbr = 'F090001507' --2021-10-28 00:00:00

select * from ARAdjust where CustId = '20502476271' and AdjgDocType = 'PA' and S4Future11 <> 'V' AND AdjdRefNbr = 'F010024033' --2021-11-02 09:43:00
select * from ARAdjust where CustId = '20502476271' and AdjgDocType = 'CM' and S4Future11 <> 'V' AND AdjdRefNbr = 'F010024033' --2021-11-02 09:43:00


select Crtd_User, Crtd_DateTime, * from ARDoc where CustId = '20502476271' and  RefNbr = 'F010024033' --2021-09-30 10:44:00
select Crtd_User, Crtd_DateTime, * from ARDoc where CustId = '20502476271' and  RefNbr = 'F090001507' --2021-10-28 00:00:00
select Crtd_User, Crtd_DateTime, * from ARAdjust where CustId = '20502476271' and AdjgDocType = 'PA' and S4Future11 <> 'V' AND AdjdRefNbr = 'F010024033' --2021-11-02 09:43:00





SELECT Docbal, * FROM ARDoc WHERE refnbr = 'F090001517'
--union all
SELECT Docbal, * 
-- update ARDoc set ApplBatSeq = 0, BatSeq = 0, CuryDocBal = 647.91, Docbal = 647.91
FROM ARDoc WHERE refnbr = 'F090001507'





