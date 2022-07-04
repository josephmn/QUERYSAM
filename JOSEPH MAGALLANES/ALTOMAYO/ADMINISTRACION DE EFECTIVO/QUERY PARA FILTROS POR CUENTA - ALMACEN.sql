
/****** Object:  Stored Procedure dbo.CashAcct_By_Name    Script Date: 4/7/98 12:49:20 PM ******/
ALTER Proc CashAcct_By_Name 
@parm1 varchar (10), 
@parm2 varchar(10), 
@parm3 varchar (24), 
@parm4 varchar (4) 

as

declare @Dato1 int
declare @Dato2 int

declare @xUserId varchar(20)
declare @xUserId1 varchar(20)

--select @Dato1 = COUNT(*) from AM2019SYS..Access WHERE UserId = 'SAINGCHA' AND ScrnNbr = '20200'
--select @Dato2 = COUNT(*) from AM2019SYS..Access WHERE UserId = 'HAMORCOT' AND ScrnNbr = '20200'
--select @Dato2 = COUNT(*) from AM2019SYS..Access WHERE UserId = 'JALVDEL' AND ScrnNbr = '20200'

select @xUserId = UserId from AM2019SYS..Access WHERE UserId = 'SAINGCHA' AND ScrnNbr = '20200'
select @xUserId = UserId from AM2019SYS..Access WHERE UserId = 'JLTAICAL' AND ScrnNbr = '20200'
select @xUserId1 = UserId from AM2019SYS..Access WHERE UserId = 'HAMORCOR' AND ScrnNbr = '20200'
select @xUserId1 = UserId from AM2019SYS..Access WHERE UserId = 'JALVDEL' AND ScrnNbr = '20200'

--if (@xUserId = 'SAINGCHA' or @xUserId = 'JLTAICAL')
--	begin
--		select * from CashAcct, Currncy
--		where cpnyid like @parm1 and bankacct like @parm2 and banksub like @parm3 and CashAcct.curyid like @parm4 
--		and active =  1 and cashacct.curyid = currncy.curyid   and banksub like 'IQPU%'
--		order by CpnyID, BankAcct, Banksub 
--	end
--else
--	begin
--		if (@xUserId1 = 'HAMORCOR' or @xUserId1 = 'JALVDEL')
--			BEGIN
--				select * from CashAcct, Currncy
--				where cpnyid like @parm1 and bankacct like @parm2 and banksub like @parm3 and CashAcct.curyid like @parm4 
--				and active =  1 and cashacct.curyid = currncy.curyid   and banksub like 'CHNO%'
--				order by CpnyID, BankAcct, Banksub 
--			END
--		ELSE
			BEGIN
				select * from CashAcct, Currncy
				where cpnyid like @parm1 and bankacct like @parm2 and banksub like @parm3 and CashAcct.curyid like @parm4 
				and active =  1 and cashacct.curyid = currncy.curyid   
				order by CpnyID, BankAcct, Banksub 
			END
	--end



SELECT * 
-- update SOAddress set ShipToId = 'DEFAULT'
FROM SOAddress where CustId = '10165899232'
SELECT * FROM SOAddress where CustId = '72130767'


