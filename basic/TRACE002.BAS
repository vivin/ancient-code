DECLARE SUB colour (Cno%, r%, g%, b%)
DEFINT A-Z
SCREEN 13
r = 63
k = 63
FOR i = 1 TO 63
colour i, r, r, k
r = r - 1
NEXT i
colour 66, 63, 63, 63
DIM ax(2500)
DIM k(100, 100)
COLOR 15
PRINT "Graphix"
GET (0, 0)-(60, 60), ax
PUT (200, 100), ax
x = 195
y = 100
FOR l = 0 TO 66
FOR m = 0 TO 66
k(l, m) = POINT(x, y)
x = x + 1
IF x > 266 THEN x = 195: y = y + 1
NEXT m
'x = x - 1
NEXT l
CLS
'PAINT (100, 100), 66
n = 0
c = 0
x = 0
y = 0
FOR l = 0 TO 66
FOR m = 0 TO 66
IF k(l, m) = 15 THEN PSET (x, y), c
x = x + 1
c = c + 1
IF x > 71 THEN x = 0: y = y + 1: c = 0
NEXT m
'x = x + 1
NEXT l
n = 63
1 r = n
k = 63
FOR i = 1 TO 63
colour i, r, r, k
r = r - 1
IF r = 0 THEN r = 63
IF r = n THEN GOTO 5
NEXT i
5 n = n - 1
FOR j = 1 TO 1000
NEXT j
GOTO 1

SUB colour (Cno, r, g, b)
OUT &H3C8, Cno
OUT &H3C9, r
OUT &H3C9, g
OUT &H3C9, b
END SUB

