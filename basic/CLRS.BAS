DECLARE SUB colour (a%, b%, c%, d%)
DEFINT A-Z
SCREEN 13
x = 0
FOR i = 0 TO 63 'Palette
  colour i, 64 - i, 64 - i, 64 - i 'grau
  colour 64 + i, i + 64, 0, 0'rot
  colour i + 128, i + 63, i, 0'rot-orange
NEXT
FOR i = 1 TO 180
LINE (x, 0)-(x, 400), i
x = x + 1
LOCATE 1, 1
COLOR i
NEXT i

SUB colour (a, b, c, d)
OUT &H3C8, a
OUT &H3C9, b
OUT &H3C9, c
OUT &H3C9, d
END SUB

