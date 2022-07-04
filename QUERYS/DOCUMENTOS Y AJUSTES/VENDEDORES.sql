pvrec_all 'vendor_all'



sp_helptext pvrec_all


select vendor.vendid,vendor.name,vendor.taxregnbr,vendor.phone,vendor.zip from vendor (FASTFIRSTROW) 
 where vendid like  '%'   order by vendid


select * from vendor where vendid='20100000000'
select * from vendor where vendid='20490092081'

    
update vendor SET addr1 ='AV EJERCITO 328',REMITADDR1 ='AV EJERCITO 328' ,USER1='' WHERE VENDID= '20490092081'
update vendor SET USER2='' WHERE VENDID= '20490092081'


	insert into vendor (Addr1, Addr2, APAcct, APSub, Attn, BkupWthld, City, ClassID, ContTwc1099, Country, Crtd_DateTime, Crtd_Prog, Crtd_User, Curr1099Yr, 
	CuryId, CuryRateType, DfltBox, DfltOrdFromId, DfltPurchaseType, DirectDeposit, EMailAddr, ExpAcct, ExpSub, Fax, LUpd_DateTime, LUpd_Prog, LUpd_User, 
	MultiChk, Name, Next1099Yr, NoteID, PayDateDflt, PerNbr, Phone, PmtMethod, PPayAcct, PPaySub, RcptPctAct, RcptPctMax, RcptPctMin, RemitAddr1, RemitAddr2, 
	RemitAttn, RemitCity, RemitCountry, RemitFax, RemitName, RemitPhone, RemitSalut, RemitState, RemitZip, S4Future01, S4Future02, S4Future03, S4Future04, 
	S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, Salut, State, Status, TaxDflt, TaxId00, TaxId01, TaxId02, 
	TaxId03, TaxLocId, TaxPost, TaxRegNbr, Terms, TIN, User1, User2, User3, User4, User5, User6, User7, User8, Vend1099, VendId, Zip)


