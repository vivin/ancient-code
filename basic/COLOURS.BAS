'Done by Vivin Suresh Paliath
'Donot ERASE THIS
'If I see this anywhere in your progs, i take it u copied it. U're dead meat
'I donot give anyone the authority to use this code unless i'm asked and even
'then i still may not give it. Donot modify this code and donot compile it
'and distribute it in your name.

DECLARE SUB colour (Cno%, r%, g%, b%)
DEFINT A-Z
SCREEN 13
int1 = 50
int2 = 50
int3 = 0
FOR i = 1 TO 50
colour i, int1, 0, int3
int1 = int1 - 1
int3 = int3 + 1
NEXT i

int3 = 0

FOR i = 51 TO 101
colour i, 0, int2, int3
int2 = int2 - 1
int3 = int3 + 1
NEXT i

int3 = 50
int1 = 0

FOR i = 102 TO 152
colour i, int1, 0, int3
int3 = int3 - 1
int1 = int1 + 1
NEXT i

r = 50
FOR i = 1 TO 50
CIRCLE (52, 100), r, i
PAINT (52, 100), i, i
r = r - 1
LOCATE 1, 1
NEXT i

r = 50
FOR i = 51 TO 101
CIRCLE (152, 100), r, i
PAINT (152, 100), i, i
r = r - 1
LOCATE 1, 1
NEXT i

r = 50
FOR i = 102 TO 152
CIRCLE (252, 100), r, i
PAINT (252, 100), i, i
r = r - 1
LOCATE 1, 1
NEXT i

DO
LOOP WHILE INKEY$ = ""

CLS
x = 100
y = 0
x1 = 220
y = 0
r = 0
r1 = 0
FOR i = 1 TO 152
CIRCLE (x, y), r, i
CIRCLE (x1, y1), r1, i
x = x + .5
y = y + 1
x1 = x1 - .5
y1 = y1 + 1
r = r + 1
r1 = r1 + 1
NEXT i
DO
LOOP WHILE INKEY$ = ""
CLS
again:
topx = 0
topy = 0
downx = 320
downy = 200
i = 1
FOR mn = 1 TO 800
LINE (topx, topy)-(downx, downy), i
IF upndown = 0 THEN topx = topx + 1: downx = downx - 1
IF upndown = 1 THEN topy = topy + 1: downy = downy - 1
IF topy > 200 OR downy < 0 THEN topy = 200: downy = 0: upndown = 0
IF topx > 320 OR downx < 0 THEN topx = 320: downx = 0: upndown = 1
i = i + 1
IF i > 152 THEN i = 1
NEXT mn
DO
LOOP WHILE INKEY$ = ""
CLS
x = 160
y = 100
i = 31
56 PSET (x, y), i
98 angle = INT(RND * 360) + 1
angle$ = STR$(angle)
i$ = STR$(i)
d$ = "ta" + angle$ + "u1" + "c" + i$
DRAW d$
i = i + 1
IF i > 152 THEN i = 1
x = POINT(0)
y = POINT(1)
y$ = INKEY$
IF y$ = "x" THEN GOTO l
IF x > 320 OR x < 0 THEN x = 160: GOTO 56
IF y > 200 OR y < 0 THEN y = 100: GOTO 56
GOTO 56
l:
CLS
INPUT "Enter interval:", n
CLS
m: t = 0
DO
t$ = STR$(t)
t = VAL(t$)
PSET (160, 100), i
d2$ = "ta" + t$ + "u1"
d$ = "ta" + t$ + "u75"
DRAW d$
x = POINT(0)
y = POINT(1)
LOCATE 1, 1
t = t + n
i = i + 1
IF i > 152 THEN i = 1
IF t > 360 THEN GOTO m
LOOP WHILE INKEY$ = ""
CLS

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
IF i > 152 THEN i = 1
IF t > 360 THEN GOTO 0
LOOP WHILE INKEY$ = ""
CLS
INPUT "Enter interval:", n
CLS
n: t = 0
DO
t$ = STR$(t)
t = VAL(t$)
PSET (160, 100), i
d2$ = "ta" + t$ + "u1"
d$ = "ta" + t$ + "g45f45l45"
DRAW d$
x = POINT(0)
y = POINT(1)
LOCATE 1, 1
t = t + n
i = i + 1
IF i > 152 THEN i = 1
IF t > 360 THEN GOTO n
LOOP WHILE INKEY$ = ""
CLS

SUB colour (Cno, r, g, b)
OUT &H3C8, Cno
OUT &H3C9, r
OUT &H3C9, g
OUT &H3C9, b
END SUB

