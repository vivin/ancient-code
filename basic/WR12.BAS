DECLARE SUB colour (Cno%, r%, g%, b%)
DEFINT A-Z
CLS
RANDOMIZE TIMER
k = INT(RND * 64) + 1
j = INT(RND * 64) + 1
1 SCREEN 13
y$ = INKEY$
FOR i = 1 TO 15
colour i, r, 0, 0
IF y$ = "i" THEN sk = 1
IF y$ = "o" THEN sk = 0
IF y$ = "r" THEN RUN
IF sk = 1 THEN r = r - 1: IF r < 0 THEN r = 15
IF sk = 0 THEN r = r + 1: IF r > 256 THEN r = 0
k = k - 1
IF k < 0 THEN k = 256
j = j - 1
IF j < 0 THEN j = 256
NEXT i
IF h = 1 THEN GOTO 3 ELSE GOTO 2
2 x = 160
dir = 1
FOR s = 0 TO 450
  y = -(SQR(s) * 10) + 200
   IF c >= 62 THEN c = 0 ELSE c = c + 1
     CIRCLE (x, y), s, c + 1, , , 1 / 2
     CIRCLE (x, y + 1), s, c + 1, , , 1 / 2
     CIRCLE (x, y + 2), s, c + 1, , , 1 / 2
NEXT
3 h = 1
GOTO 1

SUB colour (Cno, r, g, b)
OUT &H3C8, Cno
OUT &H3C9, r
OUT &H3C9, g
OUT &H3C9, b
END SUB

