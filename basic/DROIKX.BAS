CLS
INPUT "INTERVAL:", n
SCREEN 13
c = 16
0 t = 0
1 t$ = STR$(t)
t = VAL(t$)
PSET (160, 100), c
d2$ = "ta" + t$ + "u1"
d$ = "ta" + t$ + "u75r75d75l75"
DRAW d$
x = POINT(0)
y = POINT(1)
LOCATE 1, 1
t = t + n
c = c + 1
IF c > 31 THEN c = 16
IF t > 360 THEN GOTO 0
GOTO 1

