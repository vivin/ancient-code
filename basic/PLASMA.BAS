'              ============Alan's Plasma Version 5.0=============
'                           *  Coded by Alan King  *
'                                November 1996
'This program creates a plasma effect by averaging two points' colors and
'adds a random "noise" to that value. All created clouds are tileable,
'meaning the left edge matches the right and the top matches the bottom.
'
DECLARE SUB AltrntPal ()
DECLARE SUB Instruct ()
DECLARE SUB DrawPlasma ()
DECLARE SUB LivePalRot (S%)
DECLARE SUB MakeRGBPal ()
DECLARE SUB PaletteRot ()
DECLARE SUB InputCommand (Cmnd$)
RANDOMIZE TIMER
DIM SHARED StartRes%, StartNoise%, NoiseReduction, TotalColors%, S%, d%
DIM SHARED ReportTime$, StartI%, StartZ%, Z%, I%, ScreenX%, ScreenY%

        StartRes% = 32          'Starting res. Powers of two for best result.
        StartNoise% = 1         '"Noise" in the paltette transition
        NoiseReduction = 0      'Reduction of noise per resolution increase
        TotalColors% = 193      'Total colors. Default 193. Max 255.
        ScreenX% = 320          'Size of plasma on X-Axis
        ScreenY% = 200          'Size of plasma on Y-Axis
        ReportTime$ = "n"       'Report the elapsed render time (y or n).
       
CLS 0

Instruct

CLS 0
SCREEN 13
REDIM SHARED Pal.G(1 TO TotalColors% * 2) AS INTEGER
REDIM SHARED Pal.R(1 TO TotalColors% * 2) AS INTEGER
REDIM SHARED Pal.B(1 TO TotalColors% * 2) AS INTEGER

COLOR 1
PRINT "INITIALIZING PALETTE...PLEASE WAIT"

S% = 1
d% = 1

MakeRGBPal  'MakeRGBPal creates a RGB palette with 193 values

CLS
VIEW (0, ScreenY% - 1)-(ScreenX% - 1, 0)

DrawPlasma



SUB AltrntPal
       
'This section alternates the "center" of the color bands.

        RndmAdj.R% = RND * TotalColors%
        RndmAdj.G% = RND * TotalColors%
        RndmAdj.B% = RND * TotalColors%
        FOR Col% = 1 TO TotalColors%
        Pal.R(Col%) = Pal.R(Col% + RndmAdj.R%)
        Pal.G(Col%) = Pal.G(Col% + RndmAdj.G%)
        Pal.B(Col%) = Pal.B(Col% + RndmAdj.B%)
        NEXT Col%

'This section copies the palette to the second half of the color arrays.
      
        FOR PalCopy% = 1 TO TotalColors%
        Pal.R(PalCopy% + TotalColors%) = Pal.R(PalCopy%)
        Pal.G(PalCopy% + TotalColors%) = Pal.G(PalCopy%)
        Pal.B(PalCopy% + TotalColors%) = Pal.B(PalCopy%)
        NEXT PalCopy%

END SUB

SUB DrawPlasma

CLS 0

Start:

'This section resets all values in the "start" loop

X% = 0
Y% = 0
CurrentI% = 0
Noise% = StartNoise%
Res% = StartRes%
RndmNoise% = 0
redraw: 'This loop drops the draws a more detailed grid with each
        'iteration until the resolution <= 1.

IF ReportTime$ = "y" THEN TimeStart# = TIMER
FOR Y% = 0 TO ScreenY% STEP Res%
        FOR X% = 0 TO ScreenX% STEP Res%
        IF Noise% > 0 THEN RndmNoise% = RND * (2 * Noise%) - Noise%
        Col% = (POINT(X%, Y%) + POINT(X% + Res%, Y% + Res%) + POINT(X%, Y% + Res%) + POINT(X% + Res%, Y%)) / 4 + RndmNoise%
        IF Y% + Res% >= ScreenY% THEN Col% = POINT(X%, 0) + RndmNoise%
        IF X% + Res% >= ScreenX% THEN Col% = POINT(0, Y%) + RndmNoise%
        IF Res% = StartRes% THEN Col% = RND * (2 * TotalColors%) - TotalColors%
        IF Col% < 1 THEN Col% = 1
        IF Col% > TotalColors% THEN Col% = TotalColors%
        IF Res% > 1 THEN LINE (X%, Y%)-(X% + Res%, Y% + Res%), Col%, BF
        IF Res% <= 1 THEN PSET (X%, Y%), Col%
        NEXT X%

LivePalRot S%

Cmnd$ = INKEY$
IF Cmnd$ <> "" THEN
InputCommand Cmnd$
END IF

NEXT Y%
       
IF Res% <= 1 THEN
IF ReportTime$ = "y" THEN PRINT TIMER - TimeStart#: SLEEP
PaletteRot
END IF
LET Res% = Res% / 2
IF NoiseReduction = 0 THEN GOTO redraw
Noise% = Noise% / NoiseReduction
GOTO redraw
END SUB

SUB InputCommand (Cmnd$)
SHARED ScreenX%
SHARED ScreenY%

        IF Cmnd$ = CHR$(32) THEN
        DrawPlasma
        END IF
       
        IF Cmnd$ = CHR$(43) AND S% < TotalColors% THEN S% = S% + 1: GOTO EndInptCmnd
        IF Cmnd$ = CHR$(45) AND S% > 1 THEN S% = S% - 1: GOTO EndInptCmnd
        IF Cmnd$ = CHR$(8) THEN : S% = TotalColors%: GOTO EndInptCmnd
        IF Cmnd$ = CHR$(61) THEN S% = 1: GOTO EndInptCmnd
        IF Cmnd$ = CHR$(122) AND d% = 1 THEN d% = 2: GOTO EndInptCmnd
        IF Cmnd$ = CHR$(122) AND d% = 2 THEN d% = 1: GOTO EndInptCmnd
       
        IF Cmnd$ = CHR$(97) THEN
        AltrntPal
        GOTO EndInptCmnd
        END IF
       
        IF Cmnd$ = CHR$(100) THEN
        MakeRGBPal
        GOTO EndInptCmnd
        END IF
       
        IF Cmnd$ = CHR$(114) THEN
        FOR Col% = 1 TO TotalColors% * 2
        Pal.R(Col%) = Pal.R(Col%) + 1
        NEXT Col%
        GOTO EndInptCmnd
        END IF
       
        IF Cmnd$ = CHR$(103) THEN
        FOR Col% = 1 TO TotalColors% * 2
        Pal.G(Col%) = Pal.G(Col%) + 1
        NEXT Col%
        GOTO EndInptCmnd
        END IF
       
        IF Cmnd$ = CHR$(98) THEN
        FOR Col% = 1 TO TotalColors% * 2
        Pal.B(Col%) = Pal.B(Col%) + 1
        NEXT Col%
        END IF
EndInptCmnd:
        StartZ% = Z%
        StartI% = I%

END SUB

SUB Instruct
COLOR 2
PRINT "                               INSTRUCTIONS"
PRINT
COLOR 2
PRINT "                       Spacebar:";
COLOR 1
PRINT " Start a new cloud."
COLOR 2
PRINT "                         +  key:";
COLOR 1
PRINT " Speed up color shifting."
COLOR 2
PRINT "                         -  key:";
COLOR 1
PRINT " Slow down color shifting."
COLOR 2
PRINT "                         =  key:";
COLOR 1
PRINT " Return to default speed."
COLOR 2
PRINT "                      Backspace:";
COLOR 1
PRINT " Freezes the cloud motion."
COLOR 2
PRINT "                         a  key:";
COLOR 1
PRINT " Alternate colors."
COLOR 2
PRINT "                         r  key:";
COLOR 1
PRINT " Shift all red values."
COLOR 2
PRINT "                         g  key:";
COLOR 1
PRINT " Shift all green values."
COLOR 2
PRINT "                         b  key:";
COLOR 1
PRINT " Shift all blue values."
COLOR 2
PRINT "                         d  key:";
COLOR 1
PRINT " Use default RGB palette."
COLOR 2
PRINT "                         z  key:";
COLOR 1
PRINT " Dissolve effect."
COLOR 2
PRINT "            Cntrl + Break  keys:";
COLOR 1
PRINT " Exit program."

FOR a = 1 TO 8
PRINT
NEXT a
PRINT "Press any key to continue."
SLEEP
END SUB

SUB LivePalRot (S%)
SHARED CurrentI%
IF CurrentI% > TotalColors% THEN CurrentI% = 0
FOR X2% = 1 TO TotalColors% STEP d%
OUT &H3C8, X2%
OUT &H3C9, Pal.R(X2% + CurrentI%)
OUT &H3C9, Pal.G(X2% + CurrentI%)
OUT &H3C9, Pal.B(X2% + CurrentI%)
NEXT X2%
CurrentI% = CurrentI% + S%
END SUB

SUB MakeRGBPal

'This section resets the RGB arrays.

        FOR Col% = 1 TO 2 * TotalColors%
        Pal.R(Col%) = 0
        Pal.G(Col%) = 0
        Pal.B(Col%) = 0
        NEXT Col%

'Use this section to define the palette colors.

        FOR Col% = 1 TO 63
        Pal.R(Col%) = 63 - Col%
        Pal.R(Col% + 130) = Col%
        Pal.G(Col%) = Col%
        Pal.G(Col% + 63) = 63 - Col%
        Pal.B(Col% + 63) = Col%
        Pal.B(Col% + 126) = 63 - Col%
        NEXT Col%

'This section copies the palette to the second half of the color arrays.
      
        FOR PalCopy% = 1 TO TotalColors%
        Pal.R(PalCopy% + TotalColors%) = Pal.R(PalCopy%)
        Pal.G(PalCopy% + TotalColors%) = Pal.G(PalCopy%)
        Pal.B(PalCopy% + TotalColors%) = Pal.B(PalCopy%)
        NEXT PalCopy%

'This section substitutes the colors to RGB.

        FOR Z% = 1 TO TotalColors%
        OUT &H3C8, Z%
        OUT &H3C9, Pal.R(Z%)
        OUT &H3C9, Pal.G(Z%)
        OUT &H3C9, Pal.B(Z%)
        NEXT Z%

END SUB

SUB PaletteRot
SHARED CurrentI%
SHARED StartI%
SHARED StartZ%
StartI% = CurrentI%
StartZ% = 1
DO
restart:
IF S% <= 0 THEN S% = 1
Cmnd$ = ""
FOR I% = StartI% TO TotalColors% STEP S%
  FOR Z% = StartZ% TO TotalColors% STEP d%
        OUT &H3C8, Z%
        OUT &H3C9, Pal.R(Z% + I%)
        OUT &H3C9, Pal.G(Z% + I%)
        OUT &H3C9, Pal.B(Z% + I%)
        Cmnd$ = INKEY$
        IF Cmnd$ <> "" THEN
        InputCommand Cmnd$
        GOTO restart
        END IF
  NEXT Z%
  StartZ% = 1
NEXT I%
StartI% = 1
LOOP
escape:
END SUB

