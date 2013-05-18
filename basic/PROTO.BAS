DECLARE SUB colour (a%, b%, c%, d%)
DEFINT A-Z
SCREEN 13
x = 0
FOR i = 0 TO 63 'Palette
  colour i, 64 - i, 64 - i, 64 - i
  colour 64 + i, i + 64, 0, 0
  colour i + 128, 63, i, i
NEXT
r = 200
FOR i = 1 TO 191
CIRCLE (160, 100), r, i
PAINT (160, 100), i, i
r = r - 1
FOR n = 1 TO 9999
NEXT n
LOCATE 1, 1
NEXT i

DO
LOOP WHILE INKEY$ = ""

SUB colour (a, b, c, d)
OUT &H3C8, a
OUT &H3C9, b
OUT &H3C9, c
OUT &H3C9, d
END SUB

