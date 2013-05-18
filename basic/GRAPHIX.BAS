TYPE PaletteType

Red AS INTEGER

Green AS INTEGER

Blue AS INTEGER

END TYPE

DECLARE SUB colour (a%, b%, C%, d%)

DEFINT A-Z

DIM melt(32767)

DECLARE SUB Palette.Set (nColor%, pInfo AS PaletteType)

DECLARE SUB Palette.Get (nColor%, pInfo AS PaletteType)

DECLARE SUB Palette.Fadeout ()

DECLARE SUB Palette.FadeIn ()

DIM SHARED Pal AS PaletteType

DIM SHARED pData(0 TO 255, 1 TO 3)

SCREEN 13
x = 0

FOR i = 0 TO 63 'Palette
  colour i, 64 - i, 64 - i, 64 - i
  colour 64 + i, i, 0, 64 - i
  colour i + 128, 63, i, 0
NEXT

'GOTO mozzxc

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

mozzx:
FOR i = 0 TO 64 'Palette
  colour i, 64 - i, 64 - i, 64 - i
  colour 64 + i, i + 64, i + 64, 0
  colour i + 63, 0, 0, 64 - i
NEXT

z = 0
q = 0
i = 1
1 PSET (z, q), i
DRAW "u25d50u25l25r50d25l50u50r50d50"
z = z + 1
q = q + 1
i = i + 1
IF i > 191 THEN i = 1
FOR k = 1 TO 6000
NEXT k
IF z > 175 THEN GOTO lox:
GOTO 1

lox:

z = 320
q = 0
i = 1
5 PSET (z, q), i
DRAW "u25d50u25l25r50d25l50u50r50d50"
z = z - 1
q = q + 1
i = i + 1
IF i > 191 THEN i = 1
FOR k = 1 TO 6000
NEXT k
IF z < 143 THEN GOTO xlox:
GOTO 5
xlox:

z = 0
q = 200
i = 1
91 PSET (z, q), i
DRAW "u25d50u25l25r50d25l50u50r50d50"
z = z + 1
q = q - 1
i = i + 1
IF i > 191 THEN i = 1
FOR k = 1 TO 6000
NEXT k
IF z > 175 THEN GOTO alox:
GOTO 91

alox:

z = 320
q = 200
i = 1
15 PSET (z, q), i
DRAW "u25d50u25l25r50d25l50u50r50d50"
z = z - 1
q = q - 1
i = i + 1
IF i > 191 THEN i = 1
FOR k = 1 TO 6000
NEXT k
IF z < 143 THEN GOTO glox:
GOTO 15
glox:

SLEEP

Palette.Fadeout

SLEEP

Palette.FadeIn

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
RANDOMIZE TIMER

mozzxc:
FOR i = 0 TO 64 'Palette
  colour i, 64 - i, 64 - i, 64 - i
  colour 64 + i, i + 32, i + 32, 0
  colour i + 63, 0, 0, 64 - i
NEXT


x = 160
y = 100
i = 0
FOR sc = 1 TO 5000
56 PSET (x, y), i
98 angle = INT(RND * 360) + 1
angle$ = STR$(angle)
i$ = STR$(i)
d$ = "ta" + angle$ + "u1" + "c" + i$
DRAW d$
i = i + 1
IF i > 191 THEN i = 0
x = POINT(0)
y = POINT(1)
IF x > 320 OR x < 0 THEN x = 160: GOTO 56
IF y > 200 OR y < 0 THEN y = 100: GOTO 56
NEXT sc
CLS
SHELL "pcx cool!.pcx"

SUB colour (a, b, C, d)
OUT &H3C8, a
OUT &H3C9, b
OUT &H3C9, C
OUT &H3C9, d
END SUB

SUB Palette.FadeIn

DIM tT(1 TO 3)

FOR i = 1 TO 64

WAIT &H3DA, 8, 8

  FOR O = 0 TO 255

    Palette.Get O, Pal

    tT(1) = Pal.Red

    tT(2) = Pal.Green

    tT(3) = Pal.Blue

    IF tT(1) < pData(O, 1) THEN tT(1) = tT(1) + 1

    IF tT(2) < pData(O, 2) THEN tT(2) = tT(2) + 1

    IF tT(3) < pData(O, 3) THEN tT(3) = tT(3) + 1

    Pal.Red = tT(1)

    Pal.Green = tT(2)

    Pal.Blue = tT(3)

    Palette.Set O, Pal

  NEXT O

NEXT i



END SUB

SUB Palette.Fadeout

DIM tT(1 TO 3)

FOR i = 0 TO 255

  Palette.Get i, Pal

  pData(i, 1) = Pal.Red

  pData(i, 2) = Pal.Green

  pData(i, 3) = Pal.Blue

NEXT i

FOR i = 1 TO 64

WAIT &H3DA, 8, 8

  FOR O = 0 TO 255

    Palette.Get O, Pal

    tT(1) = Pal.Red

    tT(2) = Pal.Green

    tT(3) = Pal.Blue

    IF tT(1) > 0 THEN tT(1) = tT(1) - 1

    IF tT(2) > 0 THEN tT(2) = tT(2) - 1

    IF tT(3) > 0 THEN tT(3) = tT(3) - 1

    Pal.Red = tT(1)

    Pal.Green = tT(2)

    Pal.Blue = tT(3)

    Palette.Set O, Pal

  NEXT O

NEXT i

END SUB

SUB Palette.Get (nColor%, pInfo AS PaletteType)

OUT &H3C6, &HFF

OUT &H3C7, nColor%

pInfo.Red = INP(&H3C9)

pInfo.Green = INP(&H3C9)

pInfo.Blue = INP(&H3C9)

END SUB

SUB Palette.Set (nColor%, pInfo AS PaletteType)

OUT &H3C6, &HFF

OUT &H3C8, nColor%

OUT &H3C9, pInfo.Red

OUT &H3C9, pInfo.Green

OUT &H3C9, pInfo.Blue

END SUB

