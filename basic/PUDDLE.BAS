

'who says low-res graphics suck? This one I'm proud of.

CLS
SCREEN 13
RANDOMIZE TIMER

size = 60
rad = 3
pal = 65536
maxsp = 1
accel = .065
winX = 160
winY = 100
delay = 0
e = .4
ee = 0

IF size < 63 THEN x = size ELSE x = 63
FOR i = 1 TO size STEP 1
x = x - 1
IF x < 1 THEN x = 1
PALETTE i, x * pal
NEXT



DIM x(size), y(size)
DIM xx(size), yy(size), nx(size), ny(size)
DIM col(size)
DIM r(size)
DIM t(size), v(size), u(size)

minsp = -maxsp
maxX = 320 - winX
maxY = 200 - winY
x = maxX + size ^ 2
y = maxY + size ^ 2

FOR i = size TO 1 STEP -1
nx(i) = accel + accel
ny(i) = accel + accel
xx(i) = maxsp
yy(i) = maxsp
x = x - size
y = y - size
x(i) = x
y(i) = y
r(i) = i * rad
col(i) = i
NEXT

DO
FOR i = 1 TO delay STEP 1: NEXT

IF count < size THEN GOTO 10

FOR i = size / 10 TO 1 STEP -1

FOR j = 1 TO 10
CIRCLE (x(i * j), y(i * j)), r(i * j), col(i * j), , , e
'CIRCLE (320 - x(i * j), 200 - y(i * j)), r(i * j), col(i * j), , , 1
'CIRCLE (x(i * j), 200 - y(i * j)), r(i * j), col(i * j), , , 1
'CIRCLE (320 - x(i * j), y(i * j)), r(i * j), col(i * j), , , 1
NEXT

t(i) = x(i): v(i) = y(i): u(i) = r(i)
NEXT
10
count = count + 1
FOR i = size TO 1 STEP -1

IF i = 1 THEN
        xx(i) = xx(i) + nx(i)
        yy(i) = yy(i) + ny(i)
        IF xx(i) > maxsp THEN xx(i) = maxsp
        IF xx(i) < minsp THEN xx(i) = minsp
        IF yy(i) > maxsp THEN yy(i) = maxsp
        IF yy(i) < minsp THEN yy(i) = minsp

        x(i) = x(i) + xx(i)
        y(i) = y(i) + yy(i)
        IF x(i) > maxX THEN nx(i) = -RND * accel - accel
        IF x(i) < winX THEN nx(i) = RND * accel + accel
        IF y(i) > maxY THEN ny(i) = -RND * accel - accel
        IF y(i) < winY THEN ny(i) = RND * accel + accel
END IF
IF i > 1 THEN
        x(i) = x(i - 1)
        y(i) = y(i - 1)
END IF

NEXT

e = e + ee
IF e >= 1 THEN ee = -.001
IF e <= .1 THEN ee = .001
LOOP UNTIL INKEY$ <> ""


