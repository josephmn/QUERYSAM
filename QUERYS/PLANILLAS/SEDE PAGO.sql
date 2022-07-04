

pvrec_all 'xamzonaventa_todos'

select xamzonaventa.zonaventaid,xamzonaventa.descripcion1,xamzonaventa.descripcion2
 from xamzonaventa (FASTFIRSTROW)  where user06='ca' and zonaventaid like  '%'  
 order by zonaventaid 

select  * from xamzonaventa

insert into xamzonaventa (zonaventaid,DESCRIPCION1,descripcion2,user06)
values  ('CAC2','','CAFETERIA CUSCO 2','CA')
