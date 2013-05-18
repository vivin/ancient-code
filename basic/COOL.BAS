DECLARE SUB colour (a%, b%, C%, d%)
DEFINT A-Z
DIM melt(32767)
SCREEN 13
x = 0

FOR i = 0 TO 63 'Palette
  colour i, 64 - i, 64 - i, 32 - i
  colour 64 + i, i, 0, 32 - i
  colour i + 128, 63, i, 0
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

DO
LOOP WHILE INKEY$ = ""
CLS
INPUT "INTERVAL (from 0 to 10):", n
CLS
0 t = 0
DO
t$ = STR$(t)
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
LOOP WHILE INKEY$ = ""
CLS

INPUT "Please enter increment of radius:", r
CLS
FOR i = 0 TO 63 'Palette
  colour i, 64 - i, 64 - i, 32 - i'grau
  colour 32 + i, i + 32, 0, 0'rot
  colour i + 32, 32, i, i'rot-orange
NEXT
RADIUS = 5: i = 1
70 CIRCLE (160, 100), RADIUS, i, , , 5
80 RADIUS = RADIUS + r: i = i + 1
90 IF i < 191 THEN 100 ELSE i = 1
100 IF RADIUS > 700 THEN 110 ELSE 70
110 RADIUS = 5: i = 1
120 CIRCLE (160, 100), RADIUS, i, , , -.9
130 IF i < 191 THEN 140 ELSE i = 1
140 RADIUS = RADIUS + r: i = i + 1
150 IF RADIUS > 700 THEN 160 ELSE 120
151 LOCATE 20, 1
160
DO
LOOP WHILE INKEY$ = ""
RANDOMIZE TIMER
FOR m = 1 TO 320 STEP 2
LINE (m, 0)-(m, 200), 0
FOR j = 1 TO 5000
NEXT j
NEXT m

FOR m = 1 TO 200 STEP 2
LINE (0, m)-(320, m), 0
FOR j = 1 TO 5000
NEXT j
NEXT m

FOR m = 0 TO 320 STEP 2
LINE (m, 0)-(m, 200), 0
FOR j = 1 TO 5000
NEXT j
NEXT m
mos:

FOR i = 0 TO 63 'Palette
  colour i, 64 - i, 64 - i, 64 - i'grau
  colour 32 + i, i + 32, 0, 0'rot
  colour i + 32, 32, i, i'rot-orange
NEXT

z = 0
q = 0
i = 1
1 PSET (z, q), i
DRAW "u50d100u50l50r100"
z = z + 1
q = q + 1
i = i + 1
IF i > 191 THEN i = 1
FOR k = 1 TO 6000
NEXT k
IF z > 300 THEN GOTO lox:
GOTO 1

lox:

z = 320
q = 0
i = 1
5 PSET (z, q), i
DRAW "u50d100u50l50r100"
z = z - 1
q = q + 1
i = i + 1
IF i > 191 THEN i = 1
FOR k = 1 TO 6000
NEXT k
IF z < 0 THEN GOTO xlox:
GOTO 5
xlox:

z = 160
q = 0
i = 1
6 CIRCLE (z, q), 10, i
'z = z + 1
q = q + 1
i = i + 1
IF i > 191 THEN i = 1
FOR k = 1 TO 6000
NEXT k
IF q > 210 THEN GOTO nlox:
GOTO 6
nlox:

7 CIRCLE (z, q), r, i
PAINT (z, q), r, r
i = i + 1
IF i > 191 THEN i = 1
FOR k = 1 TO 6000
NEXT k
r = r - 1
IF r < 0 THEN GOTO mlox:
GOTO 7
mlox:

SUB colour (a, b, C, d)
OUT &H3C8, a
OUT &H3C9, b
OUT &H3C9, C
OUT &H3C9, d
END SUB

