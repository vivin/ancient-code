DEFINT A-Z
DECLARE SUB colour (cno%, r%, g%, b%)
CLS
PRINT "1 increases amount of Red, 2 - green, 3 - blue"
PRINT "q decreases amount of Red, w - green, e - blue"
PRINT "a increases amount of Red and Blue, s - Red and Green, d - Blue and Green"
PRINT "z decreases amount of Red and Blue, x - Red and Green, c - Blue and Green"
PRINT "v increases amount of Red, Green and Blue"
PRINT "b decreases amount of Red, Green and Blue"
PRINT "p clears screen and paints screen with colour"
PRINT "r resets all values to 0"
DO
LOOP WHILE INKEY$ = ""
SCREEN 13
rc = 0
gc = 0
bc = 0
y:
y$ = INKEY$
u$ = LCASE$(y$)
FOR n = 260 TO 320
LINE (n, 0)-(n, 20), 0
NEXT n
LOCATE 1, 10
PRINT "Red:"; rc; "Green:"; gc; "Blue:"; bc; "                      "

IF u$ = "1" THEN rc = rc + 1 ELSE GOTO w
IF rc > 64 THEN rc = 0
colour 1, rc, gc, bc
CIRCLE (160, 100), 40, 1
PAINT (160, 100), 1, 1
GOTO y

w: IF u$ = "2" THEN gc = gc + 1 ELSE GOTO e
IF gc > 64 THEN gc = 0
colour 1, rc, gc, bc
CIRCLE (160, 100), 40, 1
PAINT (160, 100), 1, 1
GOTO y

e: IF u$ = "3" THEN bc = bc + 1 ELSE GOTO a
IF bc > 64 THEN bc = 0
colour 1, rc, gc, bc
CIRCLE (160, 100), 40, 1
PAINT (160, 100), 1, 1
GOTO y

a: IF u$ = "q" THEN rc = rc - 1 ELSE GOTO s
IF rc < 0 THEN rc = 64
colour 1, rc, gc, bc
CIRCLE (160, 100), 40, 1
PAINT (160, 100), 1, 1
GOTO y

s: IF u$ = "w" THEN gc = gc - 1 ELSE GOTO d
IF gc < 0 THEN gc = 64
colour 1, rc, gc, bc
CIRCLE (160, 100), 40, 1
PAINT (160, 100), 1, 1
GOTO y

d: IF u$ = "e" THEN bc = bc - 1 ELSE GOTO rg
IF bc < 0 THEN bc = 64
colour 1, rc, gc, bc
CIRCLE (160, 100), 40, 1
PAINT (160, 100), 1, 1
GOTO y

rg: IF u$ = "a" THEN rc = rc + 1: gc = gc + 1 ELSE GOTO rb
IF rc > 64 THEN rc = 0
IF gc > 64 THEN gc = 0
colour 1, rc, gc, bc
CIRCLE (160, 100), 40, 1
PAINT (160, 100), 1, 1
GOTO y

rb: IF u$ = "s" THEN rc = rc + 1: bc = bc + 1 ELSE GOTO bg
IF rc > 64 THEN rc = 0
IF bc > 64 THEN bc = 0
colour 1, rc, gc, bc
CIRCLE (160, 100), 40, 1
PAINT (160, 100), 1, 1
GOTO y

bg: IF u$ = "d" THEN bc = bc + 1: gc = gc + 1 ELSE GOTO rgm
IF bc > 64 THEN bc = 0
IF gc > 64 THEN gc = 0
colour 1, rc, gc, bc
CIRCLE (160, 100), 40, 1
PAINT (160, 100), 1, 1
GOTO y

rgm: IF u$ = "z" THEN rc = rc - 1: gc = gc - 1 ELSE GOTO rbm
IF rc < 0 THEN rc = 64
IF gc < 0 THEN gc = 64
colour 1, rc, gc, bc
CIRCLE (160, 100), 40, 1
PAINT (160, 100), 1, 1
GOTO y

rbm: IF u$ = "x" THEN rc = rc - 1: bc = bc - 1 ELSE GOTO bgm
IF rc < 0 THEN rc = 64
IF bc < 0 THEN bc = 64
colour 1, rc, gc, bc
CIRCLE (160, 100), 40, 1
PAINT (160, 100), 1, 1
GOTO y

bgm: IF u$ = "c" THEN gc = gc - 1: bc = bc - 1 ELSE GOTO rgb
IF gc < 0 THEN gc = 64
IF bc < 0 THEN bc = 64
colour 1, rc, gc, bc
CIRCLE (160, 100), 40, 1
PAINT (160, 100), 1, 1
GOTO y

rgb: IF u$ = "v" THEN rc = rc + 1: gc = gc + 1: bc = bc + 1 ELSE GOTO rgbm
IF rc > 64 THEN rc = 0
IF gc > 64 THEN gc = 0
IF bc > 64 THEN bc = 0
colour 1, rc, gc, bc
CIRCLE (160, 100), 40, 1
PAINT (160, 100), 1, 1
GOTO y

rgbm: IF u$ = "b" THEN rc = rc - 1: gc = gc - 1: bc = bc - 1 ELSE GOTO pt
IF rc < 0 THEN rc = 64
IF gc < 0 THEN gc = 64
IF bc < 0 THEN bc = 64
colour 1, rc, gc, bc
CIRCLE (160, 100), 40, 1
PAINT (160, 100), 1, 1
GOTO y

pt: IF u$ = "p" THEN CLS : GOTO doit ELSE GOTO rst
doit:
PAINT (100, 100), 1
DO
LOOP WHILE INKEY$ = ""
CLS
GOTO y

rst: IF u$ = "r" THEN rc = 0: bc = 0: gc = 0
GOTO y

SUB colour (cno, r, g, b)
OUT &H3C8, cno
OUT &H3C9, r
OUT &H3C9, g
OUT &H3C9, b
END SUB

