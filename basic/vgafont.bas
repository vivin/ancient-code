'***
' Resizable VGA Font Routine
' Written by Bryan Flick
' (C) Copyright 1992, All Rights Reserved
 
' Below is a font routine that I wrote in QuickBASIC 4.5. With the PrintText
' subroutine, it is possible to print scalable characters, in any of 16
' colors, in either underline, italics, or shadow mode (or a combination of
' any three). Works only in VGA mode.
 
DEFINT A-Z: DIM Font(94, 8, 16), XS(8), YS(16): GOTO Start
 
PrintText:
' A$    = String to print
' Col1  = Color of font
' Col2  = Background color of font (used with shadow)
' T     = Tool (0=none, 1=underline, 2=italics, 4=shadow)
' X     = Starting X position       (in pixels)
' Y     = Starting Y position       (in pixels)
' XSize = Size of font horizontally (in pixels)
' YSize = Size of font vertically   (in pixels)
 
IX = XSize \ 8: IY = YSize \ 16
T1 = T AND 1
T2 = T AND 2: IF T2 <> 0 THEN T2 = 1
T3 = T AND 4: IF T3 <> 0 THEN T3 = 1
 
XS = IX * 8: YS = IY * 16
FOR I = 1 TO 8: XS(I) = IX: NEXT I
FOR I = 1 TO 16: YS(I) = IY: NEXT I
 
IF XS <> XSize THEN FOR I = 1 TO XSize - XS: XS(I) = XS(I) + 1: NEXT I
 
IF YS <> YSize THEN FOR I = 1 TO YSize - YS: YS(I) = YS(I) + 1: NEXT I
 
FOR I = 1 TO LEN(A$): C = ASC(MID$(A$, I, 1))
 
IF C = 13 THEN X = 0: Y = Y + YSize: IF Y < 480 GOTO Oops ELSE RETURN
IF C = 32 THEN X = X + XSize: IF X < 640 GOTO Oops ELSE RETURN
 
IF C >= 33 AND C <= 127 THEN Char = C - 32
 
TD1:    XS2 = Font(Char, 0, 0): XS3 = 0
        FOR A = 1 TO XS2: XS3 = XS3 + XS(A): NEXT A
        IF X + XS3 > 639 THEN RETURN
        X2 = X: Y2 = Y
        FOR K = 1 TO 16: Z1 = YS(K): IF Z1 = 0 THEN 96
        FOR J = 1 TO XS2: Z2 = XS(J): IF Z2 = 0 THEN 95
        IF Font(Char, J, K) = 0 GOTO TD2
        X9 = X + Z2 - 1: Y9 = Y + Z1 - 1
        IF T2 = 1 GOTO T2
        IF T3 = 1 THEN LINE (X + IX, Y + IY)-(X9 + IX, Y9 + IY), Col2, BF
        LINE (X, Y)-(X9, Y9), Col1, BF
        GOTO TD2
T2:     Q = (4 - K \ 2) * IX
        IF T3 = 1 THEN LINE (X + Q + IX, Y + IY)-(X9 + Q + IX, Y9 + IY), Col2, BF
        LINE (X + Q, Y)-(X9 + Q, Y9), Col1, BF
TD2:    X = X + Z2
95      NEXT J: X = X2: Y = Y + Z1
96      NEXT K: Y = Y2
        IF T1 = 1 THEN LINE (X, Y + YSize - 2)-(X + XS3, Y + YSize - 2), Col1
        IF T1 = 1 AND T3 = 1 THEN LINE (X + 1, Y + YSize - 1)-(X + XS3 + 1, Y + YSize - 1), Col2
        X = X + XS3 + 1
Oops:   NEXT I
 
RETURN
 
Start: SCREEN 12: COLOR 15: PRINT "Please wait...": COLOR 1
 
Char1 = 1
        FOR Char2 = 33 TO 126
        LOCATE 2, 1: PRINT CHR$(Char2)
        FOR J = 1 TO 16: FOR I = 1 TO 8
        Font(Char1, I, J) = POINT(I - 1, J + 15)
        NEXT I, J
        I = 8: A = 0
2691    FOR J = 1 TO 8: IF Font(Char1, I, J) <> 0 THEN A = 1
        NEXT J
        IF A = 0 THEN I = I - 1: IF I <> 1 THEN 2691
        Font(Char1, 0, 0) = I
        Char1 = Char1 + 1
        NEXT Char2
 
X = 0: Y = 0: T = 0: XSize = 8: YSize = 16
 
CLS : COLOR 15
 
A$ = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*)"
 
PRINT "This is a sample of the 8x16 font...": PRINT
Col1 = 10: X = 0: Y = 16: GOSUB PrintText
PRINT "This is a sample of the 8x16 font underlined...": PRINT
Col1 = 11: T = 1: X = 0: Y = 48: GOSUB PrintText
PRINT "This is a sample of the 8x16 font italicized...": PRINT
Col1 = 12: T = 2: X = 0: Y = 80: GOSUB PrintText
PRINT "This is a sample of the 8x16 font with shadows...": PRINT
Col1 = 13: Col2 = 5: T = 4: X = 0: Y = 112: GOSUB PrintText
PRINT "This is a sample of the 8x16 font underlined, italicized, with shadows... ": PRINT ""
Col1 = 14: Col2 = 6: T = 7: X = 0: Y = 144: GOSUB PrintText
PRINT "This is a sample of the 16x16 font...": PRINT
Col1 = 10: T = 0: X = 0: Y = 176: XSize = 16: GOSUB PrintText
PRINT "This is a sample of the 8x32 font...": PRINT : PRINT
Col1 = 11: X = 0: Y = 208: XSize = 8: YSize = 32: GOSUB PrintText
PRINT "This is a sample of the 32x32 HEADLINE font, with shadows!":
PRINT : PRINT : PRINT
Col1 = 12: Col2 = 4: T = 4: X = 0: Y = 256: XSize = 12: YSize = 24
GOSUB PrintText
PRINT TAB(29); "Written by Bryan Flick"
PRINT TAB(32); "53 Olde Mill Run"
PRINT TAB(30); "Stroudsburg, PA 18360"
PRINT TAB(27); "717-421-1764 (24 hour BBS)": PRINT
COLOR 11: PRINT TAB(21); "(C) Copyright 1992, All Rights Reserved"
SLEEP: END

