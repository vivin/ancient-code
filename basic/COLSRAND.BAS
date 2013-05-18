DECLARE SUB colour (Cno%, r%, g%, b%)
DEFINT A-Z
SCREEN 13
int1 = 50
int2 = 50
int3 = 0
FOR i = 31 TO 81
colour i, int1, 32, int3
int1 = int1 - 1
int3 = int3 + 1
NEXT i

int3 = 0

FOR i = 82 TO 132
colour i, 32, int2, int3
int2 = int2 - 1
int3 = int3 + 1
NEXT i

int3 = 50
int1 = 0

FOR i = 133 TO 183
colour i, int1, 32, int3
int3 = int3 - 1
int1 = int1 + 1
NEXT i


r = 50
FOR i = 31 TO 81
CIRCLE (52, 100), r, i
PAINT (52, 100), i, i
r = r - 1
LOCATE 1, 1
NEXT i

r = 50
FOR i = 82 TO 132
CIRCLE (152, 100), r, i
PAINT (152, 100), i, i
r = r - 1
LOCATE 1, 1
NEXT i

r = 50
FOR i = 133 TO 183
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
FOR i = 31 TO 183
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
i = 31
1 LINE (topx, topy)-(downx, downy), i
IF upndown = 0 THEN topx = topx + 1: downx = downx - 1
IF upndown = 1 THEN topy = topy + 1: downy = downy - 1
IF topy > 200 OR downy < 0 THEN topy = 200: downy = 0: upndown = 0
IF topx > 320 OR downx < 0 THEN topx = 320: downx = 0: upndown = 1
i = i + 1
IF i > 183 THEN i = 31
GOTO 1


SUB colour (Cno, r, g, b)
OUT &H3C8, Cno
OUT &H3C9, r
OUT &H3C9, g
OUT &H3C9, b
END SUB

