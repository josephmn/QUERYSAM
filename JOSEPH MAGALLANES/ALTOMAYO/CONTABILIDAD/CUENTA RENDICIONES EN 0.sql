/**** cuenta en 0 ****/

SELECT
    GLTran."Acct", GLTran."BatNbr", GLTran."CrAmt", GLTran."DrAmt", GLTran."ExtRefNbr", GLTran."Id", GLTran."Module", GLTran."PerPost", 
	GLTran."Posted", GLTran."RefNbr", GLTran."TranDate", GLTran."TranType",
    Account."Descr",
    Vendor."Name",
    Customer."Name"
FROM
    { oj (("AM2018APP"."dbo"."GLTran" GLTran LEFT OUTER JOIN "AM2018APP"."dbo"."Vendor" Vendor ON
        GLTran."Id" = Vendor."VendId")
     LEFT OUTER JOIN "AM2018APP"."dbo"."Customer" Customer ON
        GLTran."Id" = Customer."CustId")
     LEFT OUTER JOIN "AM2018APP"."dbo"."Account" Account ON
        GLTran."Acct" = Account."Acct"}
WHERE
    GLTran."Posted" <> 'U' AND GLTran."Acct" = '469902' AND Vendor."VendId" = '42622439' AND GLTran."PerPost" IN ('201804','201805','201806')
ORDER BY
    GLTran."Acct" ASC,
    GLTran."Id" ASC

SELECT * FROM GLTRAN WHERE RefNbr = '004779'
006022
004927    

SELECT BatNbr, RefNbr,Cramt, CuryCrAmt, * FROM GLTran WHERE BatNbr = '006022' AND ID = '42622439'

select * from GLTran
-- update GLTRAN set Cramt = 27.75, CuryCrAmt = 8.48 ,CuryDrAmt = 0, DrAmt = 0
where RefNbr = '004927' and Acct = '469902'



select Cramt, CuryCrAmt, TranType, DrAmt, CuryDrAmt, * from GLTran
-- update GLTRAN set Cramt = 27.75, CuryCrAmt = 8.48 ,CuryDrAmt = 0 , DrAmt = 0
where BatNbr = '005811' AND Module = 'AP' --RefNbr = '005428' AND Acct = '469902'


--SELECT * FROM APAdjust WHERE AdjBatNbr = '006157'


--SELECT * FROM GLTran WHERE Module = 'AP' AND RefNbr = '004779'


select Cramt, CuryCrAmt, TranType, DrAmt, CuryDrAmt, * from GLTran
-- update GLTRAN set Cramt = 27.75, CuryCrAmt = 8.48 ,CuryDrAmt = 0 , DrAmt = 0
where BatNbr = '004927' AND Module = 'AP' --AND RefNbr = '004779' --AND Acct = '469902'


select Cramt, CuryCrAmt, TranType, DrAmt, CuryDrAmt, * from GLTran
-- update GLTRAN set Cramt = 0, CuryCrAmt = 0 ,CuryDrAmt = 8.48 , DrAmt = 27.75
where BatNbr = '006157' AND RefNbr = '004927' --AND Acct = '469902'

