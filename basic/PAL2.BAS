DECLARE SUB colour (a%, b%, c%, d%)
DEFINT A-Z
DIM melt(32767)
SCREEN 13
x = 0
FOR i = 0 TO 63 'Palette
  colour i, 64 - i, 64 - i, 64 - i'grau
  colour 64 + i, i, 0, 0 'rot
  colour i + 128, 63, i, i + 32'rot-orange
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
RANDOMIZE TIMER
FOR i = 1 TO 4000
  x = RND * 251
  y = RND * 130
  GET (x, y)-(x + 60, y + 60), melt
  PUT (x, y + 1), melt, PSET
NEXT i

DO
LOOP WHILE INKEY$ = ""
INPUT "INTERVAL:", n
i = 1
0 t = 0
1 t$ = STR$(t)
t = VAL(t$)
PSET (160, 100), i
d2$ = "ta" + t$ + "u1"
d$ = "ta" + t$ + "u75r75d75l75"
DRAW d$
x = POINT(0)
y = POINT(1)
LOCATE 1, 1
t = t + n
i = i + 1
IF i > 191 THEN i = 1
IF t > 360 THEN GOTO 0
GOTO 1

SUB colour (a, b, c, d)
OUT &H3C8, a
OUT &H3C9, b
OUT &H3C9, c
OUT &H3C9, d
END SUB

