DECLARE SUB colour (a%, b%, c%, d%)
SHELL "pcx prod.pcx"
SHELL "pcx pack.pcx"
SCREEN 13
DEFINT A-Z
FOR i = 0 TO 64 'Palette
  colour i, 64 - i, 64 - i, 64 - i
  colour 64 + i, i + 64, i + 64, 0
  colour i + 63, 0, 0, 64 - i
NEXT
y = 0
FOR i = 64 TO 128
PSET (0, y), i
DRAW "r320"
y = y + 1
NEXT i
y = 190
FOR i = 64 TO 128
PSET (0, y), i
DRAW "r320"
y = y - 1
NEXT i
y = 64
x = 0
FOR i = 0 TO 64
PSET (x, y), i
DRAW "d60"
x = x + 1
NEXT i

x = 320
FOR i = 0 TO 64
PSET (x, y), i
DRAW "d60"
x = x - 1
NEXT i

st$ = "LOADING PROGRAM....."
i = 128
r = 12
c = 11
FOR j = 1 TO LEN(st$)
2 COLOR i
LOCATE r, c
PRINT MID$(st$, j, 1)
i = i - 1
FOR m = 1 TO 4000
NEXT m
IF i = 64 THEN GOTO 1 ELSE GOTO 2
1 i = 128
c = c + 1
NEXT j
DO
LOOP WHILE INKEY$ = ""
CLS
CHAIN "projmenu.bas"

SUB colour (a, b, c, d)
OUT &H3C8, a
OUT &H3C9, b
OUT &H3C9, c
OUT &H3C9, d
END SUB

