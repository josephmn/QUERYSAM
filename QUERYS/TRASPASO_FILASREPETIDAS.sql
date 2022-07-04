



DROP TABLE XAMRESTRICCION


SELECT * FROM XAMRESTRICCION



Create Unique Clustered Index XAMRESTRICCION0 On XAMRESTRICCION (userid,tipo,dato)


SELECT * FROM XAMRESTRICCION_TEMPORAL ORDER BY 1,2,3 

DELETE FROM XAMRESTRICCION


DELETE FROM XAMRESTRICCION_TEMPORAL WHERE USERID='SYSADMIN' AND DATO=''

select * from xamrestriccion_temporal ORDER BY 1,2,3



INSERT INTO XAMRESTRICCION (USERID,DATO,TIPO)
SELECT USERID,DATO,TIPO FROM XAMRESTRICCION_TEMPORAL


SELECT * FROM XAMRESTRICCION_TEMPORAL WHERE TIPO='CAFETERIAS'



SELECT userid,tipo,dato ,count(*)
FROM xamrestriccion
GROUP BY userid, tipo,dato
HAVING count(*) > 1



select * from  xamrestriccion_temporal where userid='sysadmin' and tipo ='liberacion' and dato ='08400' 


set rowcount = 1



INSERT INTO XAMRESTRICCION (USERID,DATO,TIPO)
SELECT USERID,DATO,TIPO FROM XAMRESTRICCION_TEMPORAL




SELECT USERID, DATO,TIPO,col4=count(*)
INTO holdkey
FROM XAMRESTRICCION_TEMPORAL
GROUP BY USERID,DATO,TIPO
HAVING count(*) > 1


---  INSERTO LAS FILAS DUPLICADAS EN LA TABLA HOLDKEY
INSERT INTO HOLDKEY (USERID,DATO,TIPO)
SELECT USERID,DATO,TIPO 
FROM XAMRESTRICCION_TEMPORAL
GROUP BY USERID,DATO,TIPO
HAVING COUNT(*) >1


---- SE INSERTA EN HOLDUPS ELIMINANDO LOS DUPLICADOS 

SELECT * FROM HOLDKEY

INSERT INTO HOLDUPS (USERID,DATO,TIPO)
SELECT DISTINCT XT.USERID,XT.DATO,XT.TIPO FROM XAMRESTRICCION_TEMPORAL XT,HOLDKEY HK
WHERE XT.USERID=HK.USERID AND
      XT.DATO=HK.DATO AND
      XT.TIPO=HK.TIPO 



SELECT USERID,DATO,TIPO,COUNT(*)
FROM HOLDUPS
GROUP BY USERID,DATO,TIPO



DELETE XAMRESTRICCION_TEMPORAL FROM XAMRESTRICCION_TEMPORAL ,HOLDKEY
WHERE 
XAMRESTRICCION_TEMPORAL.USERID=HOLDKEY.USERID AND
XAMRESTRICCION_TEMPORAL.DATO=HOLDKEY.DATO AND
XAMRESTRICCION_TEMPORAL.TIPO=HOLDKEY.TIPO  


SELECT * FROM HOLDUPS


SELECT COUNT(*) FROM XAMRESTRICCION_TEMPORAL

INSERT INTO XAMRESTRICCION ( USERID,DATO,TIPO)
SELECT USERID,DATO,TIPO FROM XAMRESTRICCION_TEMPORAL


SELECT  USERID,DATO,TIPO,COUNT(*) FROM XAMRESTRICCION
GROUP BY USERID,DATO,TIPO HAVING COUNT(*)>1




INSERT INTO XAMRESTRICCION_TEMPORAL ( USERID,DATO,TIPO)
SELECT USERID,DATO,TIPO FROM HOLDUPS
