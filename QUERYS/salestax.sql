

select* from salestax


--update salestax set purtaxsub ='0000000RE000',slstaxsub ='0000000RE000'




update salestax set taxrate =18 where taxid='IGV1'

select  * from salestax




insert into salestax2(AccruTaxAcct, AccruTaxSubAcct, AdjByTermsDisc, ApplTermDisc, ApplTermsDiscTax, APTaxPtDate, ARTaxPtDate,
 CatExcept00 ,CatExcept01, CatExcept02, CatExcept03, CatExcept04, CatExcept05, CatFlg, Crtd_DateTime ,          Crtd_Prog ,
Crtd_User,  Descr ,                         Exemption ,ExemTaxId , ExpTaxAcct, ExpTaxSub  ,              FilingLoc,  GroupDetCnt,
 GroupID  ,  GroupRule, InclFrt, InclInDocTot, Inclmisc, LiabTaxAcct, LiabTaxSub,       LocalCode ,      LongId  ,
   LUpd_DateTime,           LUpd_Prog ,LUpd_User,  Lvl2Exmpt, NewRateDate ,            NewTaxRate ,            NoteId,      OldTaxRate,
 OPTaxPtDate, POTaxPtDate, PrcTaxIncl, PurTaxAcct, PurTaxDiscAcct, PurTaxDiscSub ,           PurTaxSub  ,              RateAboveMax,
           S4Future01 ,                    S4Future02 ,                    S4Future03  ,           S4Future04  ,           S4Future05   ,
          S4Future06 ,            S4Future07  ,            S4Future08 ,             S4Future09,  S4Future10,  S4Future11, S4Future12,
 SlsTaxAcct ,SlsTaxDiscAcct, SlsTaxDiscSub ,           SlsTaxSub ,               TaxAuthLvl, TaxBasis, TaxCalcLvl,
 TaxCalcMeth, TaxCalcType, TaxId ,     TaxRate ,               TaxRvsdDate  ,           TaxType, TxblAdjPct ,            TxblMax,
  TxblMin ,               TxblMinMaxCuryID, User1,           User2 ,       User3 ,                 User4,                  User5 ,
     User6 ,     User7,                   User8 ,                  VendID,          VoucherTax)
select AccruTaxAcct, AccruTaxSubAcct, AdjByTermsDisc, ApplTermDisc, ApplTermsDiscTax, APTaxPtDate, ARTaxPtDate,
 CatExcept00 ,CatExcept01, CatExcept02, CatExcept03, CatExcept04, CatExcept05, CatFlg, Crtd_DateTime ,          Crtd_Prog ,
Crtd_User,  Descr ,                         Exemption ,ExemTaxId , ExpTaxAcct, ExpTaxSub  ,              FilingLoc,  GroupDetCnt,
 GroupID  ,  GroupRule, InclFrt, InclInDocTot, Inclmisc, LiabTaxAcct, LiabTaxSub,       LocalCode ,      LongId  ,
   LUpd_DateTime,           LUpd_Prog ,LUpd_User,  Lvl2Exmpt, NewRateDate ,            NewTaxRate ,            NoteId,      OldTaxRate,
 OPTaxPtDate, POTaxPtDate, PrcTaxIncl, PurTaxAcct, PurTaxDiscAcct, PurTaxDiscSub ,           PurTaxSub  ,              RateAboveMax,
           S4Future01 ,                    S4Future02 ,                    S4Future03  ,           S4Future04  ,           S4Future05   ,
          S4Future06 ,            S4Future07  ,            S4Future08 ,             S4Future09,  S4Future10,  S4Future11, S4Future12,
 SlsTaxAcct ,SlsTaxDiscAcct, SlsTaxDiscSub ,           SlsTaxSub ,               TaxAuthLvl, TaxBasis, TaxCalcLvl,
 TaxCalcMeth, TaxCalcType, TaxId ,     TaxRate ,               TaxRvsdDate  ,           TaxType, TxblAdjPct ,            TxblMax,
  TxblMin ,               TxblMinMaxCuryID, User1,           User2 ,       User3 ,                 User4,                  User5 ,
     User6 ,     User7,                   User8 ,                  VendID,          VoucherTax from salestax
