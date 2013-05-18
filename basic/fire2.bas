DEFINT A-Z
SCREEN 13
FOR col = 1 TO 63
PALETTE col, col
NEXT
COLOR 63
LOCATE 10, 10
PRINT "-QuickBasic-"

FOR y = 60 TO 82
FOR x = 70 TO 170
DEF SEG
IF POINT(x, y) = 63 THEN
DEF SEG = &HA000
POKE x + y * 320&, RND * 30 + 30
DEF SEG
END IF
NEXT x
NEXT y
'SLEEP

f! = 72
DO
FOR y = 60 TO f!
f! = f! + .005
    FOR x = 70 TO 170
        col = (POINT(x + RND * 2 - 1, y) + POINT(x, y + 1)) / 2 - RND * 2
        IF col < 0 THEN col = 0
        DEF SEG = &HA000
        POKE x + y * 320&, col
        DEF SEG
    NEXT
NEXT
k$ = INKEY$
IF k$ <> "" THEN CLS : SCREEN 12: END
LOOP

