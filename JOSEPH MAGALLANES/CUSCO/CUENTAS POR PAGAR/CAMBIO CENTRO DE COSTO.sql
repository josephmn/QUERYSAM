
SELECT * FROM BATCH WHERE BATNBR = '004007' AND MODULE = 'AP'

SELECT SUB, * 
-- UPDATE T SET SUB = 'CAC2000RE000'
FROM APDOC T WHERE BATNBR = '004007'

SELECT SUB, * 
-- UPDATE T SET SUB = 'CAC2000RE000'
FROM APTRAN T WHERE BATNBR = '004007' --AND SUB = 'CAC2-000-RE-000'

SELECT SUB, * 
-- UPDATE T SET SUB = '0000000RE000'
FROM GLTRAN T WHERE BATNBR = '004007' AND MODULE = 'AP' --AND SUB = 'CAC2-000-RE-000'

SELECT AdjgSub, * 
-- UPDATE T SET AdjgSub = 'CAC2000RE000'
FROM APADJUST T WHERE ADJBATNBR = '004007'


--SELECT * FROM APDOC_1



















