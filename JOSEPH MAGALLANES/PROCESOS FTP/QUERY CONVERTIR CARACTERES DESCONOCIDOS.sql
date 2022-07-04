
--select top 0 * into altomayo_carteras2 from altomayo_carteras

--insert into altomayo_carteras2 (cod_rut, cod_ven, cod_mes, cod_pro, cod_dis, nombre_rut, nombres_ven, nombre_mes, nombre_pro, nombre_dis, visitas, clientes, cliente_cod, periodo_ven)
--select * from altomayo_carteras

select * from altomayo_carteras where periodo_ven = '032018'

alter table altomayo_carteras1 alter column [nombre_rut] varchar(100)

--delete from altomayo_carteras

--insert into altomayo_carteras (cod_rut, cod_ven, cod_mes, cod_pro, cod_dis, nombre_rut, nombres_ven, nombre_mes, nombre_pro, nombre_dis, visitas, clientes, cliente_cod, periodo_ven)

select
cod_rut, 
cod_ven, 
cod_mes, 
cod_pro, 
cod_dis, 
replace(nombre_rut,'+Ê','—') nombre_rut, 
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(replace(replace(nombres_ven,'+Ê','—'),'+Ù','—'),'+‹','⁄'),'¥+¢','—'),'E¥+¢','…'),'?A','—A'),'+Ï','Õ'),'TORREJ—N','TORREJ”N'),'?O','—O') nombres_ven, 
nombre_mes, 
REPLACE(REPLACE(REPLACE(nombre_pro,'A+ÊE','A—E'),'A¥+¢E','A—E'),'E+ÊA','E—A') nombre_pro, 
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(nombre_dis,'A+ÊE','A—E'),'A¥+¢E','A—E'),'E+ÊA','E—A'),'A√?E','A—E'),'E√?A','E—A'),'E¥+¢A','E—A'),'E?A','E—A') nombre_dis, 
visitas, 
clientes, 
cliente_cod, 
periodo_ven
from altomayo_carteras2



INSERT_DAT_ECONOMYSA_CARTERA

INSERT_DAT_TCA_CLIENTES

