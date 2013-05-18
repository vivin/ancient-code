DECLARE SUB DrawBox (TopLeftPtR%, TopLeftPtC%, BottomRightPtR%, BottomRightPtC%, BoxColour%)
CLS
DrawBox 1, 1, 22, 80, 9


DEFINT A-Z
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

