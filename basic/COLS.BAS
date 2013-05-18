SCREEN 13
DEFINT A-Z

define cour(a%, b%, c%, d%)
FOR i = 1 TO 63
colour i, i - 64, i - 64, i - 64
colour i, i + 64, 0, 0
NEXT

FOR i = 50 TO 190
LINE (y, 0)-(y, 400), i
y = y + 1
NEXT i



DEFSNG A-Z
DEFINT A-Z
'
OUT &HC38, a
OUT &HC39, b
OUT &HC39, c
OUT &HC39, d
END SUB

SUB cols
END SUB

