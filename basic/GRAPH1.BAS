DECLARE SUB colour (Cno%, r%, g%, b%)
DEFINT A-Z
SCREEN 13
DIM a(1000)
DIM b(1000)
DIM c(1000)
CLS
FOR i = 1 TO 64
colour i, r, g, b
r = r + 1
NEXT i
ang = 0
COLOR 15
1 ang$ = STR$(ang)
d$ = "TA" + ang$ + "u1"
DRAW d$
ang = ang + 1
a(n) = POINT(0)
b(n) = POINT(1)
c(n) = ang
n = n + 1
IF ang > 360 THEN GOTO 2
GOTO 1
2 PRINT n
CLS
mend = 0
6 FOR i = 1 TO n - 1
c$ = STR$(c(i))
PSET (a(i) + 80, b(i)), c
d$ = "TA" + a$ + "u5r5d5l5"
DRAW d$
'c = c + 1
IF m > 5 THEN c = c + 1: m = 0:  ELSE 7
IF c > 64 THEN c = 0
7 m = m + 1
NEXT i
9 FOR i = 1 TO 64
colour i, r, g, b
r = r + 1
NEXT i
b = b + 1
IF r > 256 THEN r = 0
IF b > 256 THEN b = 0
FOR i = 1 TO 9000
NEXT i
GOTO 9

SUB colour (Cno, r, g, b)
OUT &H3C8, Cno
OUT &H3C9, r
OUT &H3C9, g
OUT &H3C9, b
END SUB

