DECLARE SUB colour (Cno%, r%, g%, b%)
DEFINT A-Z
SCREEN 13
1 FOR i = 1 TO 63
colour i, r, 0, 0
'n = 1
ang = INT(RND * 360) + 1
ang$ = STR$(ang)
i$ = STR$(i)
d$ = "ta" + ang$ + "c" + i$ + "u1"
DRAW d$
r = r + 1
NEXT i
GOTO 1

SUB colour (Cno, r, g, b)
OUT &H3C8, Cno
OUT &H3C9, r
OUT &H3C9, g
OUT &H3C9, b
END SUB

