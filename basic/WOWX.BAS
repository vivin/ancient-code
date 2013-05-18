DECLARE SUB colour (Cno%, r%, g%, b%)
DEFINT A-Z
SCREEN 13
RANDOMIZE TIMER
r = g = b = 0
cchange = INT(RND * 3) + 1
1 FOR i = 1 TO 255
colour i, r, g, b
IF cchange = 1 THEN r = r + 1: colseed = 1
IF cchange = 2 THEN g = g + 1: colseed = 2
IF cchange = 3 THEN b = b + 1: colseed = 3
IF r > 256 THEN r = 1
IF g > 256 THEN g = 1
IF b > 256 THEN b = 1
NEXT i
IF colseed = 1 THEN b = b + 1
IF colseed = 2 THEN r = r + 1
IF colseed = 3 THEN g = g + 1
IF r > 256 THEN r = 1
IF g > 256 THEN g = 1
IF b > 256 THEN b = 1
ang = INT(RND * 360) + 1
ang$ = STR$(ang)
i$ = STR$(ki)
d$ = "ta" + ang$ + "c" + i$ + "u5r1d5l1u5"
DRAW d$
x = POINT(0)
y = POINT(1)
IF x > 320 THEN PSET (160, 100), ki
IF y > 200 THEN PSET (160, 100), ki
IF x < 0 THEN PSET (160, 100), ki
IF y < 0 THEN PSET (160, 100), ki
ki = ki + 1
GOTO 1

SUB colour (Cno, r, g, b)
OUT &H3C8, Cno
OUT &H3C9, r
OUT &H3C9, g
OUT &H3C9, b
END SUB

