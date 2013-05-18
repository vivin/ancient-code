DECLARE SUB DrawBorder (text$, StartLocr%, StartLocc%, BorderColour%, TextColour%)
DECLARE SUB DrawBox (TopLeftPtR%, TopLeftPtC%, BottomRightPtR%, BottomRightPtC%, BoxColour%)
CLS
DrawBox 5, 4, 10, 10, 1
DrawBorder "Vivin", 10, 10, 2, 4

DEFINT A-Z
SUB DrawBorder (text$, StartLocr%, StartLocc%, BorderColour%, TextColour%)

TextLen = LEN(text$)
TopLeftEdger = StartLocr - 1
TopLeftEdgec = StartLocc - 1
BottomLeftEdger = StartLocr + 1
BottomLeftEdgec = TopLeftEdgec
TopRightEdger = TopLeftEdger
TopRightEdgec = StartLocc + TextLen
BottomRightEdger = BottomLeftEdger
BottomRightEdgec = TopRightEdgec

COLOR TextColour
LOCATE StartLocr, StartLocc
PRINT text$

COLOR BorderColour
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

SUB DrawBox (TopLeftPtR%, TopLeftPtC%, BottomRightPtR%, BottomRightPtC%, BoxColour%)

COLOR BoxColour

LOCATE TopLeftPtR, TopLeftPtC
PRINT CHR$(201)
LOCATE BottomRightPtR, BottomRightPtC
PRINT CHR$(188)
LOCATE TopLeftPtR, BottomRightPtC
PRINT CHR$(187)
LOCATE BottomRightPtR, TopLeftPtC
PRINT CHR$(200)

FOR i = TopLeftPtC + 1 TO BottomRightPtC - 1
LOCATE TopLeftPtR, i
PRINT CHR$(205)
LOCATE BottomRightPtR, i
PRINT CHR$(205)
NEXT i

FOR i = TopLeftPtR + 1 TO BottomRightPtR - 1
LOCATE i, TopLeftPtC
PRINT CHR$(186)
LOCATE i, BottomRightPtC
PRINT CHR$(186)
NEXT i

END SUB

