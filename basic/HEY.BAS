DEFINT A-Z
DECLARE SUB colour (cno%, r%, g%, b%)
CLS
SCREEN 13
m = 0
n = 63
FOR c = 1 TO 63
colour c, m, 0, n
m = m + 1
n = n - 1
NEXT c
FOR c = 63 TO 127
colour c, m, 0, n
m = m - 1
n = n + 1
NEXT c

c = 0
ang = 0
dlen = 0
1 PSET (160, 100), c
d$ = "TA" + STR$(ang) + "u" + STR$(dlen) + "d" + STR$((2 * dlen)) + "u" + STR$(dlen) + "l" + STR$(dlen) + "r" + STR$((2 * dlen))
DRAW d$
dlen = dlen + 1
c = c + 1
ang = ang + 1
IF ang > 360 THEN ang = 0
IF dlen > 115 THEN END
GOTO 1

SUB colour (cno%, r%, g%, b%)
OUT &H3C8, cno
OUT &H3C9, r
OUT &H3C9, g
OUT &H3C9, b
END SUB

