DECLARE SUB colour (Cno%, r%, g%, b%)
DEFINT A-Z
SCREEN 12
FOR i = 1 TO 15
colour i, k, 0, r
r = r + 4
k = k + 4
NEXT i
d = 16384
i = 1
x = 320
y = 480
1 CIRCLE (x, y - d), d, i
'IF s = 1 THEN 3
2 PAINT (x, y - d - d / 4), i, i
3 d = d / 2
'IF d > 100 THEN s = 1
IF d < 2 THEN 5
i = i + 1
GOTO 1
5 DO
LOOP WHILE INKEY$ = ""

SUB colour (Cno, r, g, b)
OUT &H3C8, Cno
OUT &H3C9, r
OUT &H3C9, g
OUT &H3C9, b
END SUB

