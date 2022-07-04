
--SELECT * FROM Batch where BatNbr = '000265' and Module = 'AP'
--SELECT * FROM APDoc where BatNbr = '000265'
--SELECT * FROM APTran where BatNbr = '000265'
--SELECT * FROM GLTran where BatNbr = '000265' and Module = 'AP'

-- DELETE FROM Batch where BatNbr = '000265' and Module = 'AP'
-- DELETE FROM APDoc where BatNbr = '000265'
-- DELETE FROM APTran where BatNbr = '000265'
-- DELETE FROM GLTran where BatNbr = '000265' and Module = 'AP'

--select InvcNbr from  AST_MIGRAR
--intersect
--select InvcNbr from APDoc


--select InvcNbr from APDoc
--where InvcNbr in (select InvcNbr from  AST_MIGRAR)
 
-- 0000000002 -
-- 0000000004 -
-- 0000000032 -
-- 0000000052 -
-- 0000000129 -
-- 0000000222 -
-- 0000000320 -
-- 0000000867 -
-- 0000000994 -
-- 0000001138 -
-- 0000002179 -

select * 
-- update a set InvcNbr = 'Y000000217'
from AST_MIGRAR a where InvcNbr = '0000026988' --and RefNbr = '014198'

select InvcNbr, RefNbr, * 
-- update a set InvcNbr = 'Y000000217'
from AM2021APP..APDoc a where InvcNbr = '0000026988' and Acct = '421213' and RefNbr = '014491'

select ExtRefNbr, RefNbr, acct, * 
-- update a set ExtRefNbr = '0000026988'
from AM2021APP..APTran a where 
--BATNBR = '016316' AND acct = '421213'
ExtRefNbr = '0000026988' and Acct = '421213' and RefNbr = '014491'




/*
SELECT * FROM Vendor WHERE VENDID = '20600965001'
SELECT * FROM AM2021APP..Vendor WHERE VENDID = '20600965001'

--INSERT INTO VENDOR
--(Addr1, Addr2, APAcct, APSub, Attn, BkupWthld, City, ClassID, ContTwc1099, Country, Crtd_DateTime, Crtd_Prog, Crtd_User, Curr1099Yr, CuryId, CuryRateType, DfltBox, 
--DfltOrdFromId, DfltPurchaseType, DirectDeposit, EMailAddr, ExpAcct, ExpSub, Fax, LUpd_DateTime, LUpd_Prog, LUpd_User, MultiChk, Name, Next1099Yr, NoteID, PayDateDflt, 
--PerNbr, Phone, PmtMethod, PPayAcct, PPaySub, RcptPctAct, RcptPctMax, RcptPctMin, RemitAddr1, RemitAddr2, RemitAttn, RemitCity, RemitCountry, RemitFax, RemitName, 
--RemitPhone, RemitSalut, RemitState, RemitZip, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, 
--S4Future11, S4Future12, Salut, State, Status, TaxDflt, TaxId00, TaxId01, TaxId02, TaxId03, TaxLocId, TaxPost, TaxRegNbr, Terms, TIN, User1, User2, User3, User4, User5, 
--User6, User7, User8, Vend1099, VendId, Zip)

--SELECT Addr1, Addr2, APAcct, APSub, Attn, BkupWthld, City, ClassID, ContTwc1099, Country, Crtd_DateTime, Crtd_Prog, Crtd_User, Curr1099Yr, CuryId, CuryRateType, DfltBox, 
--DfltOrdFromId, DfltPurchaseType, DirectDeposit, EMailAddr, ExpAcct, ExpSub, Fax, LUpd_DateTime, LUpd_Prog, LUpd_User, MultiChk, Name, Next1099Yr, NoteID, PayDateDflt, 
--PerNbr, Phone, PmtMethod, PPayAcct, PPaySub, RcptPctAct, RcptPctMax, RcptPctMin, RemitAddr1, RemitAddr2, RemitAttn, RemitCity, RemitCountry, RemitFax, RemitName, 
--RemitPhone, RemitSalut, RemitState, RemitZip, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, 
--S4Future11, S4Future12, Salut, State, Status, TaxDflt, TaxId00, TaxId01, TaxId02, TaxId03, TaxLocId, TaxPost, TaxRegNbr, Terms, TIN, User1, User2, User3, User4, User5, 
--User6, User7, User8, Vend1099, VendId, Zip FROM  AM2021APP..Vendor where vendid not in (select vendid from VENDOR)
*/