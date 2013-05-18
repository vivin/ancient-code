DEFINT A-Z
DECLARE SUB colour (cno%, r%, g%, b%)
SCREEN 13
sm = 1
1 globalr = 1
FOR i = 1 TO 64
colour i, xglobalr, 0, globalr * sm
globalr = globalr + 1
NEXT i
i = 1
x:
LINE (x, y)-(x, y + 200), i
i = i + 1
IF i > 64 THEN i = 1
x = x + 1
IF x > 320 THEN GOTO yx
GOTO x
yx:
globalr = 1
sm = sm + 1
IF sm > 10 THEN sm = 1
'PLAY "p64"
GOTO 1

SUB colour (cno, r, g, b)
OUT &H3C8, cno
OUT &H3C9, r
OUT &H3C9, g
OUT &H3C9, b
END SUB

