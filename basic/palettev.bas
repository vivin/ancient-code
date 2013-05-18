'*** Questions?  Contact 'dkostka@salsgiver.com' or visit
  '  'http://www.geocities.com/SiliconValley/Heights/8967/index.htm'

'*** This program includes some very useful subs that allow the user
  '  to modify the on-screen palette very easily.

'-----------------------------------------------------------------------------

'*** This sub will set the screen's palette to the one you specify
  DECLARE SUB PalSet (Pal$)

'*** This will return the current palette into the variable specified
  DECLARE SUB PalGet (Pal$)

'*** This fades the text back in  Change the Percent to make it faster
  '  It will only change the colors from MinCol% to MaxCol%
  DECLARE SUB PalRestore (MinCol%, MaxCol%, Percent!, Pal$)
 
'*** Same as above, but fades the palette out
  DECLARE SUB PalDim (MinCol%, MaxCol%, Percent!, Pal$)

'*** This rotates the palette by Shift% colors  It will only affect the
  '  colors from MinCol% to MaxCol%
  DECLARE SUB PalRotate (MinCol%, MaxCol%, Shift%, Pal$)

'-----------------------------------------------------------------------------

'*** Sets the current screen mode
  SCREEN 13

'*** This is used to hold the current palette
  DIM Pal AS STRING * 768

'*** This sets up the palette with all those flourescent colors
  MYPI! = 8 * ATN(1) / 240
  FOR Colr = 0 TO 239
    R1 = 32 + SIN((Colr + 0) * MYPI!) * 31
    G1 = 32 + SIN((Colr + 80) * MYPI!) * 31
    B1 = 32 + SIN((Colr + 160) * MYPI!) * 31
    Offset = ((Colr + 16) * 3)
    MID$(Pal, Offset + 1, 1) = CHR$(R1)
    MID$(Pal, Offset + 2, 1) = CHR$(G1)
    MID$(Pal, Offset + 3, 1) = CHR$(B1)
  NEXT Colr
  MID$(Pal, 15 * 3 + 1) = CHR$(63) + CHR$(63) + CHR$(63)

'*** This sets the current palette to the one made above
  CALL PalSet(Pal)

'*** This draws the boxes around the screen
  Col% = 15
  DO
    Col% = Col% + 1
    X% = ((Col% - 16) / (256 - 16)) * 159
    Y% = ((Col% - 16) / (256 - 16)) * 99
    LINE (X%, Y%)-(319 - X%, 199 - Y%), Col%, BF
  LOOP UNTIL Col% = 255

'*** This loop will rotate the palette until a key is pressed
  COLOR 15
  LOCATE 1, 1: PRINT "PalRotate"
  DO
    CALL PalRotate(16, 255, 5, Pal)
  LOOP UNTIL INKEY$ > ""

'*** This fades in and out the palette until a key is pressed
  COLOR 15
  LOCATE 1, 1: PRINT "PalDim and PalRestore"
  DO
    CALL PalDim(16, 255, 5, Pal)
    CALL PalRestore(16, 255, 5, Pal)
  LOOP UNTIL INKEY$ > ""

  END

SUB PalDim (MinCol%, MaxCol%, Percent!, Pal$)

  DEF SEG = &HA000
  OUT &H3C7, 0: OUT &H3C8, 0
 
  Pal2$ = SPACE$(768)
 
  FOR A! = 1 TO 0 STEP (Percent! / 100) * -1
    Pal2$ = Pal$
    FOR I% = MinCol% * 3 + 1 TO MaxCol% * 3
      MID$(Pal2$, I%, 1) = CHR$(ASC(MID$(Pal$, I%, 1)) * A!)
    NEXT I%
    FOR I% = 1 TO 768: OUT &H3C9, ASC(MID$(Pal2$, I%, 1)): NEXT I%
  NEXT A!

END SUB

SUB PalGet (Pal$)

  Pal$ = ""
 
  DEF SEG = &HA000
  OUT &H3C7, 0: OUT &H3C8, 0

  FOR I% = 1 TO 768
    Pal$ = Pal$ + CHR$(INP(&H3C9))
  NEXT I%


END SUB

SUB PalRestore (MinCol%, MaxCol%, Percent!, Pal$)

  DEF SEG = &HA000
  OUT &H3C7, 0: OUT &H3C8, 0

  Pal2$ = SPACE$(768)
 
  FOR A! = 0 TO 1 STEP Percent! / 100
    Pal2$ = Pal$
    FOR I% = MinCol% * 3 + 1 TO MaxCol% * 3
      MID$(Pal2$, I%, 1) = CHR$(ASC(MID$(Pal$, I%, 1)) * A!)
    NEXT I%
    FOR I% = 1 TO 768: OUT &H3C9, ASC(MID$(Pal2$, I%, 1)): NEXT I%
  NEXT A!
END SUB

SUB PalRotate (MinCol%, MaxCol%, Shift%, Pal$)

  DEF SEG = &HA000
 
  Temp$ = LEFT$(Pal$, MinCol% * 3)

  Temp2$ = MID$(Pal$, MinCol% * 3 + 1, (MaxCol% - MinCol% + 1) * 3)
  Temp2$ = RIGHT$(Temp2$, Shift% * 3) + LEFT$(Temp2$, ((MaxCol% - MinCol% + 1) * 3) - (Shift% * 3))

  Temp3$ = RIGHT$(Pal$, (255 - MaxCol%) * 3)
  Pal$ = Temp$ + Temp2$ + Temp3$
  OUT &H3C7, 0: OUT &H3C8, 0
  FOR I = 1 TO 768: OUT &H3C9, ASC(MID$(Pal$, I, 1)): NEXT I

END SUB

SUB PalSet (Pal$)

  DEF SEG = &HA000
  OUT &H3C7, 0: OUT &H3C8, 0
 
  FOR I% = 1 TO 768
    OUT &H3C9, ASC(MID$(Pal$, I%, 1))
  NEXT I%

END SUB

