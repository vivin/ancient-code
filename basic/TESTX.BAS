DECLARE SUB colour (a%, b%, c%, d%)
DEFINT A-Z
DIM melt(32767)
SCREEN 13
1 x = 0
RANDOMIZE TIMER
r1 = INT(RND * 64) + 1
r2 = INT(RND * 64) + 1
r3 = INT(RND * 63) + 1
g1 = INT(RND * 64) + 1
g2 = INT(RND * 64) + 1
g3 = INT(RND * 63) + 1
nrsel1 = INT(RND * 64) + 1
nrsel2 = INT(RND * 64) + 1
nrsel3 = INT(RND * 64) + 1

FOR i = 0 TO 63 'Palette
  colour i, r1 - i, g1 - i, b1 - i
  colour i + 64, r2 - i, g2 - i, b2 - i
  colour i + 128, r3 - i, g3 - i, b3 - i
NEXT
r = 200
FOR i = 1 TO 191
CIRCLE (160, 100), r, i
PAINT (160, 100), i, i
r = r - 1
'FOR n = 1 TO 9999
'NEXT n
LOCATE 1, 1
NEXT i
DO

LOOP WHILE INKEY$ = ""
RANDOMIZE TIMER
m:
FOR i = 1 TO 4000
  x = RND * 251
  y = RND * 130
  GET (x, y)-(x + 60, y + 60), melt
  PUT (x, y + 1), melt, PSET
NEXT i

FOR i = 1 TO 4000
  x = RND * 251
  y = RND * 130
  GET (x, y)-(x + 60, y + 60), melt
  PUT (x + 1, y), melt, PSET
NEXT i

FOR i = 1 TO 4000
  x = RND * 251
  y = RND * 130
  GET (x, y)-(x + 60, y + 60), melt
  PUT (x + 1, y + 1), melt, PSET
NEXT i

GOTO m
DO
LOOP WHILE INKEY$ = ""
GOTO 1

SUB colour (a, b, c, d)
OUT &H3C8, a
OUT &H3C9, b
OUT &H3C9, c
OUT &H3C9, d
END SUB

