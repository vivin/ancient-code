DECLARE SUB colour (Cno%, r%, g%, b%)
DEFINT A-Z
SCREEN 13
FOR i = 1 TO 64
colour i, r, r, r
r = r + 1
NEXT i
r = 0
FOR i = 1 TO 63
CIRCLE (160, 100), r, i
PAINT (160, 100), i, i
PLAY "p64"
r = r + 1
NEXT i

SUB colour (Cno, r, g, b)
OUT &H3C8, Cno
OUT &H3C9, r
OUT &H3C9, g
OUT &H3C9, b
END SUB

