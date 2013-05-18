CLS
SCREEN 13
RANDOMIZE TIMER
c = 16
0 t = 0
1 t$ = STR$(t)
t = VAL(t$)
x = INT(RND * 320) + 1
y = INT(RND * 200) + 1
PSET (x, y), c
d2$ = "ta" + t$ + "u1"
d$ = "ta" + t$ + "g40f40u80"
DRAW d$
x = POINT(0)
y = POINT(1)
LOCATE 1, 1
t = t + 1
c = c + 1
IF c > 31 THEN c = 16
IF t > 360 THEN GOTO 0
GOTO 1

