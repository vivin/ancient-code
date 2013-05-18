DECLARE SUB colour (Cno%, r%, g%, b%)
DEFINT A-Z
SCREEN 13
DIM a(100, 130)
FOR i = 1 TO 64
colour i, r, r, r
r = r + 1
NEXT i
k = 64
FOR i = 1 TO 64
CIRCLE (100, 100), k, i
PAINT (100, 100), i, i
k = k - 1
NEXT i
x = 40
y = 50
FOR i = 1 TO 100
FOR j = 1 TO 130
a(i, j) = POINT(x, y)
x = x + 1
IF x > 170 THEN x = 40: y = y + 1
NEXT j
NEXT i
OPEN "scandata.dat" FOR OUTPUT AS #1
FOR i = 1 TO 100
FOR j = 1 TO 130
PRINT #1, a(i, j)
NEXT j
NEXT i
CLOSE
DIM b(100, 130)
OPEN "scandata.dat" FOR INPUT AS #1
FOR i = 1 TO 100
FOR j = 1 TO 130
INPUT #1, a(i, j)
NEXT j
NEXT i
CLS
x = 40
y = 50
FOR i = 1 TO 100
FOR j = 1 TO 130
c = a(i, j)
PSET (x, y), c
x = x + 1
IF x > 170 THEN x = 40: y = y + 1
NEXT j
NEXT i

SUB colour (Cno, r, g, b)
OUT &H3C8, Cno
OUT &H3C9, r
OUT &H3C9, g
OUT &H3C9, b
END SUB

