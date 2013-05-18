DECLARE SUB colour (Cno%, r%, g%, b%)
DEFINT A-Z
SCREEN 13
i = 0
1 colour i, r, 0, r
r = r + 1
IF s = 1 THEN 5
PAINT (100, 100), i
s = 1
5 FOR k = 1 TO 10000
NEXT k
GOTO 1

SUB colour (Cno, r, g, b)
OUT &H3C8, Cno
OUT &H3C9, r
OUT &H3C9, g
OUT &H3C9, b
END SUB

