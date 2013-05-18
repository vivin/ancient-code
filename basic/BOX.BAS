DECLARE SUB DrawBorder (text$, StartLocr%, StartLocc%)


DEFINT A-Z
'
SUB DrawBorder (text$, StartLocr%, StartLocc%)

CLS

TextLen = LEN(text$)
TopLeftEdger = StartLocr - 1
TopLeftEdgec = StartLocc - 1
BottomLeftEdger = StartLocr + 1
BottomLeftEdgec = TopLeftEdgec
TopRightEdger = TopLeftEdger
TopRightEdgec = StartLocc + TextLen
BottomRightEdger = BottomLeftEdger
BottomRightEdgec = TopRightEdgec

LOCATE StartLocr, StartLocc
PRINT text$
LOCATE TopLeftEdger, TopLeftEdgec
PRINT CHR$(201)
LOCATE BottomLeftEdger, BottomLeftEdgec
PRINT CHR$(200)
LOCATE TopRightEdger, TopRightEdgec
PRINT CHR$(187)
LOCATE BottomRightEdger, BottomRightEdgec
PRINT CHR$(188)

FOR i = StartLocc TO (StartLocc + TextLen) - 1
LOCATE TopLeftEdger, i
PRINT CHR$(205)
LOCATE BottomLeftEdger, i
PRINT CHR$(205)
NEXT i

LOCATE StartLocr, StartLocc - 1
PRINT CHR$(186)
LOCATE StartLocr, StartLocc + TextLen
PRINT CHR$(186)
END SUB

