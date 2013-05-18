DECLARE SUB colour (a%, b%, c%, d%)
DEFINT A-Z
DIM melt(32767)
SCREEN 13
x = 0
FOR i = 0 TO 63 'Palette
  colour i, 64 - i, 64 - i, 64 - i'grau
  colour 64 + i, i + 64, 0, 0'rot
  colour i + 128, 63, i, i'rot-orange
NEXT
r = 200
x = 1
FOR i = 1 TO 191
CIRCLE (160, 100), r, i
PAINT (160, 100), i, i
r = r - 1
FOR n = 1 TO 9999
NEXT n
LOCATE 1, 1
x = x + 1
NEXT i
RANDOMIZE TIMER
FOR i = 1 TO 4000
  x = RND * 251
  y = RND * 130
  GET (x, y)-(x + 60, y + 60), melt
  PUT (x, y + 1), melt, PSET
NEXT i

DO
LOOP WHILE INKEY$ = ""

SUB colour (a, b, c, d)
OUT &H3C8, a
OUT &H3C9, b
OUT &H3C9, c
OUT &H3C9, d
END SUB

