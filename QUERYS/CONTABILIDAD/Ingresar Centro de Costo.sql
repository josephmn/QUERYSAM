

acctxref_acct  'COFFEARTS',  '999999'

sp_helptext 'acctxref_acct'


--insert into terms (applyto,cod,creditchk,crtd_datetime,crtd_prog,crtd_user,cycle,descr,discintrv,discpct,disctype,dueintrv,
--duetype,frequency,lupd_datetime,lupd_prog,lupd_user,nbrinstall,noteid,options,
--s4future01,s4future02,s4future03,s4future04,s4future05,s4future06,
--s4future07,s4future08,s4future09,s4future10,s4future11,s4future12,termsid,termstype,
--USER1,USER2,USER3,USER4,USER5,USER6,USER7,USER8)
--values 
--('B',0,1,'2015-09-29','21270','SYSADMIN',0,'Letra a 80 Dias',0,0,'D',80,'D','M','2015-09-29','21270','SYSADMIN',
--1,0,'E','','',0,0,0,0,'2015-09-29','2015-09-29',0,0,'','','20','S','','',0,0,'','','2015-09-29','2015-09-29')


sp_helptext subacct_sub

select * from subacct

--insert into subacct (active,consolsub,crtd_datetime,crtd_prog,crtd_user,descr,lupd_datetime,lupd_prog,lupd_user,noteid,
--s4future01,s4future02,s4future03,s4future04,s4future05,s4future06,
--s4future07,s4future08,s4future09,s4future10,s4future11,s4future12,sub,
--USER1,USER2,USER3,USER4,USER5,USER6,USER7,USER8
--) 
--values 
--(
--1,'CACUCAFVIS','2015-09-29','01270','SYSADMIN','Cafet CUSCO CAFET-VISA','2015-09-29','01270','SYSADMIN'
--,0,'','',0,0,0,0,'1900-01-01','1900-01-01',0,0,'','','CACUCAFVIS','','',0,0,'','','1900-01-01','1900-01-01'
--)



select * from subacct where consolsub ='cacucaf000'


--update subacct set descr ='Cafet CUSCO-CAFET-FINAN'where consolsub ='cacucaf000'