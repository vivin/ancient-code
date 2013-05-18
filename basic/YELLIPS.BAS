DECLARE SUB colour (Cno%, r%, g%, b%)
DEFINT A-Z
SCREEN 12
FOR i = 1 TO 15
colour i, r, 0, r
r = r + 4
NEXT i
d! = .01
1  CIRCLE (300, 200), 100, c, , , d!
d! = d! + .01
IF c > 15 THEN c = 0

GOTO 1

SUB colour (Cno, r, g, b)
OUT &H3C8, Cno
OUT &H3C9, r
OUT &H3C9, g
OUT &H3C9, b
END SUB

