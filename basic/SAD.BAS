DECLARE SUB colour (Cno%, r%, g%, b%)
DEFINT A-Z
SCREEN 13
FOR i = 1 TO 32
colour i, r, r, r
r = r + 1
NEXT i
RANDOMIZE TIMER
FOR n = 1 TO 200
FOR i = 1 TO 32
xpos = INT(RND * 320) + 1
ypos = INT(RND * 200) + 1
CIRCLE (xpos, ypos), 2, i
NEXT i
NEXT n

FOR i = 33 TO 64
colour i, i + 32, i + 64, b
NEXT i

xpos = INT(RND * 320) + 1
ypos = INT(RND * 200) + 1
PAINT (xpos, ypos), i

SUB colour (Cno, r, g, b)
OUT &H3C8, Cno
OUT &H3C9, r
OUT &H3C9, g
OUT &H3C9, b
END SUB

