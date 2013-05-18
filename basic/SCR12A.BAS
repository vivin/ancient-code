DECLARE SUB colour (Cno%, r%, g%, b%)
DEFINT A-Z
SCREEN 12
k = 15
FOR i = 1 TO 15
colour i, k, 0, r
r = r + 4
NEXT i
1 x = INT(RND * 640) + 1
y = INT(RND * 480) + 1
d = 15
FOR i = 1 TO 15
CIRCLE (x, y), d, i
PAINT (x, y), i, i
d = d - 1
NEXT i
GOTO 1

SUB colour (Cno, r, g, b)
OUT &H3C8, Cno
OUT &H3C9, r
OUT &H3C9, g
OUT &H3C9, b
END SUB

