CLS
SCREEN 12
DIM scr9text(2500)
DIM k(100, 100)
LOCATE 1, 1
PRINT "Graphix"
GET (0, 0)-(60, 60), scr9text
CLS
PUT (0, 0), scr9text
x = 0
y = 0
FOR i = 1 TO 66
FOR j = 1 TO 66
IF POINT(x, y) > 0 THEN k(i, j) = 1
x = x + 1
IF x > 66 THEN x = 0: y = y + 1
NEXT j
NEXT i
SCREEN 13
c = 15
FOR l = 0 TO 66
FOR m = 0 TO 66
IF k(l, m) = 1 THEN PSET (x, y), c
x = x + 1
'c = c + 1
IF x > 67 THEN x = 0: y = y + 1: 'c = 0
NEXT m
'x = x + 1
NEXT l
LOCATE 12, 12
PRINT "Graphix"

