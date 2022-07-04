

select RefNbr, DocType, S4Future03, * from apdoc where BatNbr = '' --RefNbr = '000378'


--delete from APDoc where BatNbr = '000444' and S4Future03 = '0'

--20491860295

select BatNbr, count(RefNbr) from apdoc group by BatNbr,RefNbr  having RefNbr > 1


select BatNbr , * from apdoc  where BatNbr = '000444'