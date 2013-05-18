DECLARE SUB PalSwitch (OldPal$, NewPal$, Percent!)
DECLARE SUB PalBlend (StartColor%, EndColor%, PalBlendPal$, PalNewPal$)
DECLARE SUB PalSet (PAL$)
DECLARE SUB PalGet (PAL$)
DECLARE SUB PalRestore (MinCol%, MaxCol%, Percent!, PAL$)
DECLARE SUB PalDim (MinCol%, MaxCol%, Percent!, PAL$)
DECLARE SUB PalRotate (MinCol%, MaxCol%, Shift%, PAL$)

SCREEN 13
DIM ColPal AS STRING * 768
DIM ColPal2 AS STRING * 768
DIM NewPal AS STRING * 768

MYPI! = 8 * ATN(1) / 240
FOR Colr = 0 TO 239
  R1 = 32 + SIN((Colr + 0) * MYPI!) * 31
  G1 = 32 + SIN((Colr + 80) * MYPI!) * 31
  B1 = 32 + SIN((Colr + 160) * MYPI!) * 31
  R2 = 32 + SIN((Colr + 10) * MYPI!) * 31
  G2 = 32 + SIN((Colr + 30) * MYPI!) * 31
  B2 = 32 + SIN((Colr + 50) * MYPI!) * 31
  OFFSET = ((Colr + 16) * 3)
  MID$(ColPal, OFFSET + 1, 1) = CHR$(R1)  '* RED
  MID$(ColPal, OFFSET + 2, 1) = CHR$(G1)  '* GREEN
  MID$(ColPal, OFFSET + 3, 1) = CHR$(B1)  '* BLUE
  MID$(ColPal2, OFFSET + 1, 1) = CHR$(R2)  '* RED
  MID$(ColPal2, OFFSET + 2, 1) = CHR$(G2)  '* GREEN
  MID$(ColPal2, OFFSET + 3, 1) = CHR$(B2)  '* BLUE
NEXT Colr
MID$(ColPal, 4) = CHR$(63) + CHR$(63) + CHR$(63)
MID$(ColPal2, 4) = CHR$(63) + CHR$(63) + CHR$(63)

ColT% = 15
DO
  ColT% = ColT% + 1
  X% = ((ColT% - 16) / (256 - 16)) * 159
  Y% = ((ColT% - 16) / (256 - 16)) * 99
  LINE (X%, Y%)-(319 - X%, 199 - Y%), ColT%, BF
LOOP UNTIL ColT% = 255

COLOR 1
LOCATE 1, 1: PRINT "PalSet    "
SLEEP
CALL PalSet(ColPal)
DO
LOOP UNTIL INKEY$ > ""

COLOR 1
LOCATE 1, 1: PRINT "PalSwitch"
CALL PalSwitch(ColPal, ColPal2, 5)
DO
LOOP UNTIL INKEY$ > ""

COLOR 1
LOCATE 1, 1: PRINT "PalBlend  "
CALL PalBlend(30, 170, ColPal, NewPal)
DO
LOOP UNTIL INKEY$ > ""

CALL PalSet(ColPal)

COLOR 1
LOCATE 1, 1: PRINT "PalRotate "
DO
  CALL PalRotate(16, 255, 5, ColPal)
LOOP UNTIL INKEY$ > ""

COLOR 1
LOCATE 1, 1: PRINT "PalDim    "
CALL PalDim(2, 255, 5, ColPal)
DO
LOOP UNTIL INKEY$ > ""

COLOR 1
LOCATE 1, 1: PRINT "PalRestore"
CALL PalRestore(2, 255, 5, ColPal)
DO
LOOP UNTIL INKEY$ > ""

END

SUB PalBlend (StartColor%, EndColor%, PalBlendPal$, PalNewPal$)

  DEF SEG = &HA000
 
  Byte11% = ASC(MID$(PalBlendPal$, StartColor% * 3 + 1))
  Byte21% = ASC(MID$(PalBlendPal$, StartColor% * 3 + 2))
  Byte31% = ASC(MID$(PalBlendPal$, StartColor% * 3 + 3))
 
  Byte12% = ASC(MID$(PalBlendPal$, EndColor% * 3 + 1))
  Byte22% = ASC(MID$(PalBlendPal$, EndColor% * 3 + 2))
  Byte32% = ASC(MID$(PalBlendPal$, EndColor% * 3 + 3))
 
  Byte1Diff% = Byte12% - Byte11%
  Byte2Diff% = Byte22% - Byte21%
  Byte3Diff% = Byte32% - Byte31%
 
  Byte1Min% = Byte11%
  Byte2Min% = Byte21%
  Byte3Min% = Byte31%
 
  TempPal$ = LEFT$(PalBlendPal$, StartColor% * 3)
 
  FOR I% = EndColor% TO StartColor% STEP -1
 
    Scale! = ((EndColor% - StartColor% + 1) - (I% - StartColor%)) / (EndColor% - StartColor% + 1)
   
    Byte1% = Byte1Diff% * Scale! + Byte1Min%
    Byte2% = Byte2Diff% * Scale! + Byte2Min%
    Byte3% = Byte3Diff% * Scale! + Byte3Min%
   
    TempPal$ = TempPal$ + CHR$(Byte1%) + CHR$(Byte2%) + CHR$(Byte3%)
 
  NEXT I%

  TempPal$ = TempPal$ + RIGHT$(PalBlendPal$, (255 - EndColor%) * 3)

  PalNewPal$ = TempPal$

  OUT &H3C7, 0: OUT &H3C8, 0
  FOR I = 1 TO 768: OUT &H3C9, ASC(MID$(PalNewPal$, I, 1)): NEXT I

END SUB

SUB PalDim (MinCol%, MaxCol%, Percent!, PalDimPal$)

  DEF SEG = &HA000
  OUT &H3C7, 0: OUT &H3C8, 0

  Pal2$ = SPACE$(768)

  FOR A! = 1 TO 0 STEP (Percent! / 100) * -1
    Pal2$ = PalDimPal$
    FOR I% = MinCol% * 3 + 1 TO (MaxCol% + 1) * 3
      MID$(Pal2$, I%, 1) = CHR$(ASC(MID$(PalDimPal$, I%, 1)) * A!)
    NEXT I%
    FOR I% = 1 TO 768: OUT &H3C9, ASC(MID$(Pal2$, I%, 1)): NEXT I%
  NEXT A!

END SUB

SUB PalGet (PalGetPal$)

  PalGetPal$ = ""

  DEF SEG = &HA000
  OUT &H3C7, 0: OUT &H3C8, 0

  FOR I% = 1 TO 768
    PalGetPal$ = PalGetPal$ + CHR$(INP(&H3C9))
  NEXT I%


END SUB

SUB PalRestore (MinCol%, MaxCol%, Percent!, PalRestorePal$)

  DEF SEG = &HA000
  OUT &H3C7, 0: OUT &H3C8, 0

  Pal2$ = SPACE$(768)

  FOR A! = 0 TO 1 STEP Percent! / 100
    Pal2$ = PalRestorePal$
    FOR I% = MinCol% * 3 + 1 TO (MaxCol% + 1) * 3
      MID$(Pal2$, I%, 1) = CHR$(ASC(MID$(PalRestorePal$, I%, 1)) * A!)
    NEXT I%
    FOR I% = 1 TO 768: OUT &H3C9, ASC(MID$(Pal2$, I%, 1)): NEXT I%
  NEXT A!

END SUB

SUB PalRotate (MinCol%, MaxCol%, Shift%, PalRotatePal$)

  DEF SEG = &HA000

  Temp$ = LEFT$(PalRotatePal$, MinCol% * 3)

  Temp2$ = MID$(PalRotatePal$, MinCol% * 3 + 1, (MaxCol% - MinCol% + 1) * 3)
  Temp2$ = RIGHT$(Temp2$, Shift% * 3) + LEFT$(Temp2$, ((MaxCol% - MinCol% + 1) * 3) - (Shift% * 3))

  Temp3$ = RIGHT$(PalRotatePal$, (255 - MaxCol%) * 3)
  PalRotatePal$ = Temp$ + Temp2$ + Temp3$
  OUT &H3C7, 0: OUT &H3C8, 0
  FOR I = 1 TO 768: OUT &H3C9, ASC(MID$(PalRotatePal$, I, 1)): NEXT I

END SUB

SUB PalSet (PalSetPal$)

  DEF SEG = &HA000
  OUT &H3C7, 0: OUT &H3C8, 0

  FOR I% = 1 TO 768
    OUT &H3C9, ASC(MID$(PalSetPal$, I%, 1))
  NEXT I%

END SUB

SUB PalSwitch (OldPal$, NewPal$, Percent!)

  DEF SEG = &HA000

  Pal2$ = SPACE$(768)

  FOR A! = 1 TO 0 STEP (Percent! / 100) * -1
   
    FOR I% = 1 TO 768
      BytePal1% = ASC(MID$(NewPal$, I%, 1))
      BytePal2% = ASC(MID$(OldPal$, I%, 1))
      Min% = BytePal1%
      Diff% = BytePal2% - BytePal1%
      MID$(Pal2$, I%, 1) = CHR$((Diff% * A!) + Min%)
    NEXT I%
   
    OUT &H3C7, 0: OUT &H3C8, 0
    FOR I% = 1 TO 768: OUT &H3C9, ASC(MID$(Pal2$, I%, 1)): NEXT I%
 
  NEXT A!

END SUB

