SCREEN 13
WINDOW (0, 160)-(320, 0)
DIM xcos(360)
DIM y(360)
1 FOR i = 1 TO 360
y(i) = SIN(i)
NEXT i
FOR i = 1 TO 360
PSET (x, y(i) + 100), 1
x = x + 1
NEXT i
DO
LOOP WHILE INKEY$ = ""


