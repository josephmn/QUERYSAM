
SELECT RefNbr, PerPost, DocType, * FROM APDoc WHERE BatNbr = '006611'
SELECT RefNbr, PerPost, * FROM APTran WHERE BatNbr = '006611' 
SELECT RefNbr, PerPost, CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, ExtRefNbr, tstamp, * 
-- DELETE
FROM GLTran WHERE BatNbr = '006611' AND Module = 'AP' --AND tstamp IN (0x00000001C05B2146,0x00000001C05B2148,0x00000001C05B214A,0x00000001C05B214C)
SELECT AdjdRefNbr, AdjgPerPost, * FROM APAdjust WHERE AdjBatNbr = '006611'


SELECT RefNbr, PerPost, DocType, * FROM APDoc WHERE BatNbr = '006627'
SELECT RefNbr, PerPost, * FROM APTran WHERE BatNbr = '006627' 
SELECT RefNbr, PerPost, CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, ExtRefNbr, tstamp, * 
-- DELETE
FROM GLTran WHERE BatNbr = '006627' AND Module = 'AP' --AND tstamp IN (0x00000001C05B2146,0x00000001C05B2148,0x00000001C05B214A,0x00000001C05B214C)
SELECT AdjdRefNbr, AdjgPerPost, * FROM APAdjust WHERE AdjBatNbr = '006627'


SELECT RefNbr, PerPost, DocType, * FROM APDoc WHERE BatNbr = '007476'
SELECT RefNbr, PerPost, * FROM APTran WHERE BatNbr = '007476' 
SELECT RefNbr, PerPost, CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, ExtRefNbr, tstamp, * 
-- DELETE
FROM GLTran WHERE BatNbr = '007476' AND Module = 'AP' --AND tstamp IN (0x00000001C05B2146,0x00000001C05B2148,0x00000001C05B214A,0x00000001C05B214C)
SELECT AdjdRefNbr, AdjgPerPost, * FROM APAdjust WHERE AdjBatNbr = '007476'



--006728

SELECT RefNbr, PerPost, DocType, * FROM APDoc WHERE BatNbr = '006473'
SELECT RefNbr, PerPost, * FROM APTran WHERE BatNbr = '006473' 
SELECT RefNbr, PerPost, CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, ExtRefNbr, tstamp, * 
-- DELETE
FROM GLTran WHERE BatNbr = '006473' AND Module = 'AP' --AND tstamp IN (0x00000001C05B2146,0x00000001C05B2148,0x00000001C05B214A,0x00000001C05B214C)
SELECT AdjdRefNbr, AdjgPerPost, PerAppl, * 
-- update APAdjust set AdjgPerPost = '202007', PerAppl = '202007'
FROM APAdjust WHERE AdjBatNbr = '006473'



SELECT RefNbr, BatNbr, PerPost, DocType, * FROM APDoc WHERE RefNbr = '007356'
SELECT RefNbr, BatNbr, PerPost, * FROM APTran WHERE RefNbr = '007356'
SELECT RefNbr, BatNbr, PerPost, CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, ExtRefNbr, tstamp, * 
-- DELETE
FROM GLTran WHERE RefNbr = '007356' AND Module = 'AP' --AND tstamp IN (0x00000001C05B2146,0x00000001C05B2148,0x00000001C05B214A,0x00000001C05B214C)

SELECT AdjdRefNbr, AdjgPerPost, PerAppl, * 
-- update APAdjust set AdjgPerPost = '202007', PerAppl = '202007'
FROM APAdjust WHERE AdjdRefNbr = '007356' --and tstamp in (0x00000001C0A1FD02,0x00000001C0A1FD03)


