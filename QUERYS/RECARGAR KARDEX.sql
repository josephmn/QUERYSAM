

exec recargar_kardex 

SP_helptext 'recargar_kardex'

 carrier_all  '%'
 
 sp_helptext carrier_all
 
 
 SELECT *  
 FROM Carrier  
 WHERE CarrierID LIKE '%'  
 ORDER BY   CRTD_DATETIME DESC
 
 SELECT S4Future12,* FROM NEWSH WHERE S4Future12 ='M1'
 select * from  newSL
 
 
  SP_HELPTEXT  xAM_Nex_DET_MOVI
  ------------------------------------------------------------------------------------
  
  
  create proc amsp_customeredi
  @ruc varchar(11)
  @siteid varchar(20)
    
  as 
  begin
  declare @slsperid char(3)
  select @slsperid
      
  insert customeredi (agreenbrflg,apptnbrflg,arrivaldateflg,batchnbrflg,bidnbrflg,bolflg,bolnoteid , bolrptformat, buyerreqd, certid, checkshiptoid, cogsacct, cogssub, contractnbrflg, conttracklevel,creditmgrid , creditrule, crossdockflg, Crtd_DateTime, Crtd_Prog, Crtd_User, custcommclassid, CustId, custitemreqd,deliverydateflg , deptflg, dfltbuyerid, DiscAcct, DiscSub, divflg, edsouser10flg, edsouser1flg, edsouser2flg,edsouser3flg , edsouser4flg, edsouser5flg, edsouser6flg, edsouser7flg, edsouser8flg, edsouser9flg, equipnbrflg,fobflg , fobid, foblocqualflg, fobtrantypeflg, frtacct, frtsub, geocode, glclassid, graceper, gsa, heightflg,impconvmeth , internalnoteid, intvendornbr, intvendornbrflg, invcnoteid, labelreqd, lenflg, LUpd_DateTime,LUpd_Prog , LUpd_User, majoraccount, mannoteid, minorder, minwt, miscacct, miscsub, multidestmeth,nbrcartonsflg , NoteId, origsourceid, outbndtemplate, plandateflg, poreqd, proflg, promonbrflg, psnoteid,ptnoteid , quotenbrflg, regionid, requestdateflg, S4Future01, S4Future02,
  S4Future03, S4Future04, S4Future05,S4Future06 , S4Future07, S4Future08, S4Future09, s4future10,s4future11,s4future12,salespersonflg,salesregionflg,scacflg,scheduleddateflg,sdqmarkforflg,sepdestord,shipdateflg,shipmentlabel,shipmthpayflg,shipnbdateflg,shipnldateflg,shiptorefnbrflg,shipviaflg,shipweekofflg,singlecontainer,siteid,slsacct,slssub,sotypeid,souser10flg,souser1flg,souser2flg,souser3flg,souser4flg,souser5flg,souser6flg,souser7flg,souser8flg,souser9flg,subnbrflg,substok,territoryid,trackingnbrflg,useediprice,user1,user10,user2,user3,user4,user5,user6,user7,user8,user9,usernoteid1,usernoteid2,usernoteid3,volumeflg,website,weightflg,widthflg) values(0, 0, 0, 0, 0, 0,0, '', 0, '', 0, '692120', '0000-000-000', 0, '','', 'B', 0, convert (smalldatetime, getdate()), '08260',  'SYSADMIN' , '',  '8888888' , 0,0, 0, '', '741101', '0000-000-000', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '702120', '0000-000-000', '', '', 0, 0, 0, '', 0, '',0, 0, 0, 0, convert(smalldatetime, getdate()) , '08260',  'SYSADM
  IN' , '', 0, 0, 0, '702120', '0000-000-000', '', 0, 0, '', '', 0,0, 0, 0, 0, 0, 0, '', 0, '', '', 0, 0, 0, 0, ' ', ' ', 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0,0, 0, 0, 0, 0,  'CAPISCO' ,'701110', '0000-000-000', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', ' ', '', '', '', 0, 0, '', '', ' ', 0, 0, 0, 0, '', 0, 0)

   end


  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  