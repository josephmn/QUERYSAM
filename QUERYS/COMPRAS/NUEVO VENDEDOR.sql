--- INSERTAR NUEVO VENDEDOR

insert into vendor (Addr1, Addr2, APAcct, APSub, Attn, BkupWthld, City, ClassID, ContTwc1099, Country, Crtd_DateTime, Crtd_Prog, Crtd_User, Curr1099Yr, 
	CuryId, CuryRateType, DfltBox, DfltOrdFromId, DfltPurchaseType, DirectDeposit, EMailAddr, ExpAcct, ExpSub, Fax, LUpd_DateTime, LUpd_Prog, LUpd_User, 
	MultiChk, Name, Next1099Yr, NoteID, PayDateDflt, PerNbr, Phone, PmtMethod, PPayAcct, PPaySub, RcptPctAct, RcptPctMax, RcptPctMin, RemitAddr1, RemitAddr2, 
	RemitAttn, RemitCity, RemitCountry, RemitFax, RemitName, RemitPhone, RemitSalut, RemitState, RemitZip, S4Future01, S4Future02, S4Future03, S4Future04, 
	S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, Salut, State, Status, TaxDflt, TaxId00, TaxId01, TaxId02, 
	TaxId03, TaxLocId, TaxPost, TaxRegNbr, Terms, TIN, User1, User2, User3, User4, User5, User6, User7, User8, Vend1099, VendId, Zip)

	VALUES (
	'', '', '421213', '0000000RE000', '', 0, '', '42130', 0, 'PE', 
	 getdate(), '03270', 'SYSADMIN', '2015', 'SOL', '', '', 'DEFAULT', 
	'GI', '', '', '949403', '0000000RE000', '', getdate(), '03270', 
	'SYSADMIN', 0, 'BLOCK INTERNACIONAL E.I.R.L', '2015', 0, 'D', '201509', '', 'C', 
	'422101', '0000000RE000', 'N', 0, 0, '', '', '', '', 
	'', '', 'BLOCK INTERNACIONAL E.I.R.L', '', '', '', '', '', 
	'', 0, 0, 0, 0, '1900-01-01 00:00:00', '1900-01-01 00:00:00', 
	0, 0, '', '', '', '', 'A', 'V', 'IGV1', '', '', '', 
	'', '', '20455376506', '01', '', 'BLOCK INTERNACIONAL E.I.R.L', 
	'', 0, 0, '', '', '1900-01-01 00:00:00', 
	'1900-01-01 00:00:00', 0, '20455376506', '')


SELECT * FROM VENDOR WHERE NAME  like '%COFFE%'


SELECT * FROM PURCHORD WHERE PONBR ='000487'


UPDATE PURCHORD SET VENDID ='20492107957' ,VENDNAME ='COFFEE AND ARTS'
WHERE PONBR ='000487'


