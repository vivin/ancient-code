DECLARE SUB ClearBuffer ()
 
  DECLARE SUB PalRotate (Pal.Palette$, Pal.MinCol%, Pal.MaxCol%, Pal.NumPal.Colors%)
  DECLARE SUB PalCopy (Pal.PaletteA$, Pal.PaletteB$, Pal.MinCol%, Pal.MaxCol%)
  DECLARE SUB PalChangeAuto (Pal.PaletteA$, Pal.PaletteB$, Pal.MinCol%, Pal.MaxCol%, Pal.Percent!)
  DECLARE SUB PalRestoreStep (Pal.Palette$, Pal.MinCol%, Pal.MaxCol%, Pal.Percent!)
  DECLARE SUB PalRestoreAuto (Pal.Palette$, Pal.MinCol%, Pal.MaxCol%, Pal.Percent!)
  DECLARE SUB PalDimStep (Pal.Palette$, Pal.MinCol%, Pal.MaxCol%, Pal.Percent!)
  DECLARE SUB PalDimAuto (Pal.Palette$, Pal.MinCol%, Pal.MaxCol%, Pal.Percent!)
  DECLARE SUB PalSet (Pal.Palette$, Pal.MinCol%, Pal.MaxCol%)
  DECLARE SUB PalGet (Pal.Palette$, Pal.MinCol%, Pal.MaxCol%)

CONST Pal.Colors% = 16

DIM Pal$: Pal$ = SPACE$(Pal.Colors% * 3)
DIM Pal2$: Pal2$ = SPACE$(Pal.Colors% * 3)

GOSUB SetupDemo: ClearBuffer
GOSUB IOAutoDemo: ClearBuffer
GOSUB IOStepDemo: ClearBuffer
GOSUB ChangeDemo: ClearBuffer
GOSUB RotateDemo: ClearBuffer

SCREEN 0
WIDTH 80, 25

END

RotateDemo:
  CLS
  FOR I% = 0 TO 15: LINE (I% * 10, I% * 10)-(639 - (I% * 10), 479 - (I% * 10)), I%, BF: NEXT I%
  DO
    StopAt! = TIMER + .1
    WHILE TIMER < StopAt!: WEND
    CALL PalRotate(Pal$, 5, 10, 1): CALL PalGet(Pal$, 0, 15)
  LOOP UNTIL INKEY$ > ""
  RETURN

ChangeDemo:
  CALL PalChangeAuto(Pal$, Pal2$, 0, 15, 1.5): SLEEP
  SLEEP
  CALL PalChangeAuto(Pal2$, Pal$, 0, 15, 1.5): SLEEP
  SLEEP
  RETURN

IOStepDemo:
  FOR A! = 0 TO 100 STEP 1: CALL PalDimStep(Pal$, 0, 15, A!): NEXT A!
  SLEEP
  FOR A! = 0 TO 100 STEP 1: CALL PalRestoreStep(Pal$, 0, 15, A!): NEXT A!
  SLEEP
  RETURN

IOAutoDemo:
  CALL PalDimAuto(Pal$, 0, 15, 1)
  SLEEP
  CALL PalRestoreAuto(Pal$, 0, 15, 1)
  SLEEP
  RETURN

SetupDemo:
  SCREEN 12
  FOR I% = 1 TO 200
    LINE (INT(RND * 640), INT(RND * 480))-(INT(RND * 640), INT(RND * 480)), INT(RND * 15) + 1
  NEXT I%
  CALL PalGet(Pal$, 0, 15)
  CALL PalSet(Pal$, 0, 15)
  CALL PalCopy(Pal$, Pal2$, 8, 15)
  RETURN

SUB ClearBuffer

  WHILE INKEY$ <> "": WEND

END SUB

SUB PalChangeAuto (Pal.PaletteA$, Pal.PaletteB$, Pal.MinCol%, Pal.MaxCol%, Pal.Percent!)

  DEF SEG = &HA000

  IF Pal.MinCol% < 0 THEN Pal.MinCol% = 0
  IF Pal.MaxCol% > Pal.Colors% - 1 THEN Pal.MaxCol% = Pal.Colors% - 1

  Pal.TempPal$ = Pal.PaletteA$

  FOR A! = 0 TO 100 STEP Pal.Percent!
    FOR I% = Pal.MinCol% TO Pal.MaxCol%
      ByteA1% = ASC(MID$(Pal.PaletteA$, (I% * 3) + 1, 1))
      ByteA2% = ASC(MID$(Pal.PaletteA$, (I% * 3) + 2, 1))
      ByteA3% = ASC(MID$(Pal.PaletteA$, (I% * 3) + 3, 1))
      ByteB1% = ASC(MID$(Pal.PaletteB$, (I% * 3) + 1, 1))
      ByteB2% = ASC(MID$(Pal.PaletteB$, (I% * 3) + 2, 1))
      ByteB3% = ASC(MID$(Pal.PaletteB$, (I% * 3) + 3, 1))
     
      Byte1Diff% = (ByteB1% - ByteA1%)
      Byte2Diff% = (ByteB2% - ByteA2%)
      Byte3Diff% = (ByteB3% - ByteA3%)
     
      Byte1New% = ByteA1% + Byte1Diff% * (A! / 100)
      Byte2New% = ByteA2% + Byte2Diff% * (A! / 100)
      Byte3New% = ByteA3% + Byte3Diff% * (A! / 100)
     
      MID$(Pal.TempPal$, (I% * 3) + 1, 3) = CHR$(Byte1New%) + CHR$(Byte2New%) + CHR$(Byte3New%)
      OUT &H3C8, I%
      OUT &H3C9, ASC(MID$(Pal.TempPal$, (I% * 3) + 1, 1))
      OUT &H3C9, ASC(MID$(Pal.TempPal$, (I% * 3) + 2, 1))
      OUT &H3C9, ASC(MID$(Pal.TempPal$, (I% * 3) + 3, 1))
    NEXT I%
    WAIT &H3DA, 8
  NEXT A!

END SUB

SUB PalChangeStep (Pal.PaletteA$, Pal.PaletteB$, Pal.MinCol%, Pal.MaxCol%, Pal.Percent!)

  DEF SEG = &HA000

  IF Pal.MinCol% < 0 THEN Pal.MinCol% = 0
  IF Pal.MaxCol% > Pal.Colors% - 1 THEN Pal.MaxCol% = Pal.Colors% - 1

  Pal.TempPal$ = Pal.PaletteA$

  A! = Pal.Percent!
  FOR I% = Pal.MinCol% TO Pal.MaxCol%
    ByteA1% = ASC(MID$(Pal.PaletteA$, (I% * 3) + 1, 1))
    ByteA2% = ASC(MID$(Pal.PaletteA$, (I% * 3) + 2, 1))
    ByteA3% = ASC(MID$(Pal.PaletteA$, (I% * 3) + 3, 1))
    ByteB1% = ASC(MID$(Pal.PaletteB$, (I% * 3) + 1, 1))
    ByteB2% = ASC(MID$(Pal.PaletteB$, (I% * 3) + 2, 1))
    ByteB3% = ASC(MID$(Pal.PaletteB$, (I% * 3) + 3, 1))
    
    Byte1Diff% = (ByteB1% - ByteA1%)
    Byte2Diff% = (ByteB2% - ByteA2%)
    Byte3Diff% = (ByteB3% - ByteA3%)
    
    Byte1New% = ByteA1% + Byte1Diff% * (A! / 100)
    Byte2New% = ByteA2% + Byte2Diff% * (A! / 100)
    Byte3New% = ByteA3% + Byte3Diff% * (A! / 100)
    
    MID$(Pal.TempPal$, (I% * 3) + 1, 3) = CHR$(Byte1New%) + CHR$(Byte2New%) + CHR$(Byte3New%)
    OUT &H3C8, I%
    OUT &H3C9, ASC(MID$(Pal.TempPal$, (I% * 3) + 1, 1))
    OUT &H3C9, ASC(MID$(Pal.TempPal$, (I% * 3) + 2, 1))
    OUT &H3C9, ASC(MID$(Pal.TempPal$, (I% * 3) + 3, 1))
  NEXT I%
  WAIT &H3DA, 8

END SUB

SUB PalCopy (Pal.PaletteA$, Pal.PaletteB$, Pal.MinCol%, Pal.MaxCol%)

  IF Pal.MinCol% < 0 THEN Pal.MinCol% = 0
  IF Pal.MaxCol% > Pal.Colors% - 1 THEN Pal.MaxCol% = Pal.Colors% - 1
 
  MID$(Pal.PaletteB$, (Pal.MinCol% * 3) + 1, ((Pal.MaxCol% - Pal.MinCol%) + 1) * 3) = MID$(Pal.PaletteA$, (Pal.MinCol% * 3) + 1, ((Pal.MaxCol% - Pal.MinCol%) + 1) * 3)

END SUB

SUB PalDimAuto (Pal.Palette$, Pal.MinCol%, Pal.MaxCol%, Pal.Percent!)

  DEF SEG = &HA000

  IF Pal.MinCol% < 0 THEN Pal.MinCol% = 0
  IF Pal.MaxCol% > Pal.Colors% - 1 THEN Pal.MaxCol% = Pal.Colors% - 1

  Pal.TempPal$ = Pal.Palette$
 
  FOR A! = 100 TO 0 STEP Pal.Percent! * -1
    FOR I% = Pal.MinCol% TO Pal.MaxCol%
      Byte1% = ASC(MID$(Pal.Palette$, (I% * 3) + 1, 1))
      Byte2% = ASC(MID$(Pal.Palette$, (I% * 3) + 2, 1))
      Byte3% = ASC(MID$(Pal.Palette$, (I% * 3) + 3, 1))
      MID$(Pal.TempPal$, (I% * 3) + 1, 3) = CHR$(Byte1% * (A! / 100)) + CHR$(Byte2% * (A! / 100)) + CHR$(Byte3% * (A! / 100))
      OUT &H3C8, I%
      OUT &H3C9, ASC(MID$(Pal.TempPal$, (I% * 3) + 1, 1))
      OUT &H3C9, ASC(MID$(Pal.TempPal$, (I% * 3) + 2, 1))
      OUT &H3C9, ASC(MID$(Pal.TempPal$, (I% * 3) + 3, 1))
    NEXT I%
    WAIT &H3DA, 8
  NEXT A!

END SUB

SUB PalDimStep (Pal.Palette$, Pal.MinCol%, Pal.MaxCol%, Pal.Percent!)

  DEF SEG = &HA000

  IF Pal.MinCol% < 0 THEN Pal.MinCol% = 0
  IF Pal.MaxCol% > Pal.Colors% - 1 THEN Pal.MaxCol% = Pal.Colors% - 1

  Pal.TempPal$ = Pal.Palette$

  A! = (Pal.Percent! * -1) + 100
  
  FOR I% = Pal.MinCol% TO Pal.MaxCol%
    Byte1% = ASC(MID$(Pal.Palette$, (I% * 3) + 1, 1))
    Byte2% = ASC(MID$(Pal.Palette$, (I% * 3) + 2, 1))
    Byte3% = ASC(MID$(Pal.Palette$, (I% * 3) + 3, 1))
    MID$(Pal.TempPal$, (I% * 3) + 1, 3) = CHR$(Byte1% * (A! / 100)) + CHR$(Byte2% * (A! / 100)) + CHR$(Byte3% * (A! / 100))
    OUT &H3C8, I%
    OUT &H3C9, ASC(MID$(Pal.TempPal$, (I% * 3) + 1, 1))
    OUT &H3C9, ASC(MID$(Pal.TempPal$, (I% * 3) + 2, 1))
    OUT &H3C9, ASC(MID$(Pal.TempPal$, (I% * 3) + 3, 1))
  NEXT I%
  WAIT &H3DA, 8

END SUB

SUB PalGet (Pal.Palette$, Pal.MinCol%, Pal.MaxCol%)

  DEF SEG = &HA000

  IF Pal.MinCol% < 0 THEN Pal.MinCol% = 0
  IF Pal.MaxCol% > Pal.Colors% - 1 THEN Pal.MaxCol% = Pal.Colors% - 1
 
  FOR I% = Pal.MinCol% TO Pal.MaxCol%
    OUT &H3C7, I%
    MID$(Pal.Palette$, (I% * 3) + 1, 3) = CHR$(INP(&H3C9)) + CHR$(INP(&H3C9)) + CHR$(INP(&H3C9))
  NEXT I%

END SUB

SUB PalRestoreAuto (Pal.Palette$, Pal.MinCol%, Pal.MaxCol%, Pal.Percent!)

  DEF SEG = &HA000

  IF Pal.MinCol% < 0 THEN Pal.MinCol% = 0
  IF Pal.MaxCol% > Pal.Colors% - 1 THEN Pal.MaxCol% = Pal.Colors% - 1

  Pal.TempPal$ = Pal.Palette$

  FOR A! = 0 TO 100 STEP Pal.Percent!
    FOR I% = Pal.MinCol% TO Pal.MaxCol%
      Byte1% = ASC(MID$(Pal.Palette$, (I% * 3) + 1, 1))
      Byte2% = ASC(MID$(Pal.Palette$, (I% * 3) + 2, 1))
      Byte3% = ASC(MID$(Pal.Palette$, (I% * 3) + 3, 1))
      MID$(Pal.TempPal$, (I% * 3) + 1, 3) = CHR$(Byte1% * (A! / 100)) + CHR$(Byte2% * (A! / 100)) + CHR$(Byte3% * (A! / 100))
      OUT &H3C8, I%
      OUT &H3C9, ASC(MID$(Pal.TempPal$, (I% * 3) + 1, 1))
      OUT &H3C9, ASC(MID$(Pal.TempPal$, (I% * 3) + 2, 1))
      OUT &H3C9, ASC(MID$(Pal.TempPal$, (I% * 3) + 3, 1))
    NEXT I%
    WAIT &H3DA, 8
  NEXT A!

END SUB

SUB PalRestoreStep (Pal.Palette$, Pal.MinCol%, Pal.MaxCol%, Pal.Percent!)

  DEF SEG = &HA000

  IF Pal.MinCol% < 0 THEN Pal.MinCol% = 0
  IF Pal.MaxCol% > Pal.Colors% - 1 THEN Pal.MaxCol% = Pal.Colors% - 1

  Pal.TempPal$ = Pal.Palette$

  A! = Pal.Percent!
 
  FOR I% = Pal.MinCol% TO Pal.MaxCol%
    Byte1% = ASC(MID$(Pal.Palette$, (I% * 3) + 1, 1))
    Byte2% = ASC(MID$(Pal.Palette$, (I% * 3) + 2, 1))
    Byte3% = ASC(MID$(Pal.Palette$, (I% * 3) + 3, 1))
    MID$(Pal.TempPal$, (I% * 3) + 1, 3) = CHR$(Byte1% * (A! / 100)) + CHR$(Byte2% * (A! / 100)) + CHR$(Byte3% * (A! / 100))
    OUT &H3C8, I%
    OUT &H3C9, ASC(MID$(Pal.TempPal$, (I% * 3) + 1, 1))
    OUT &H3C9, ASC(MID$(Pal.TempPal$, (I% * 3) + 2, 1))
    OUT &H3C9, ASC(MID$(Pal.TempPal$, (I% * 3) + 3, 1))
  NEXT I%
  WAIT &H3DA, 8

END SUB

SUB PalRotate (Pal.Palette$, Pal.MinCol%, Pal.MaxCol%, Pal.Shift%)

  DEF SEG = &HA000

  IF Pal.MinCol% < 0 THEN Pal.MinCol% = 0
  IF Pal.MaxCol% > Pal.Colors% - 1 THEN Pal.MaxCol% = Pal.Colors% - 1

  LeftSpace$ = MID$(Pal.Palette$, 1, Pal.MinCol% * 3)
  RightSpace$ = MID$(Pal.Palette$, (Pal.MaxCol% + 1) * 3 + 1)

  ChangingColors% = (Pal.MaxCol% - Pal.MinCol%) + 1
  IF Pal.Shift% > ChangingColors% - 1 THEN Pal.Shift% = ChangingColors% - 1

  Pal.ChangePal$ = MID$(Pal.Palette$, (Pal.MinCol% * 3) + 1, (ChangingColors% * 3))
 
  Lef$ = MID$(Pal.ChangePal$, (Pal.Shift% * 3) + 1)
  Rig$ = LEFT$(Pal.ChangePal$, Pal.Shift% * 3)

  Pal.TempPal$ = LeftSpace$ + Lef$ + Rig$ + RightSpace$

  FOR I% = Pal.MinCol% TO Pal.MaxCol%
    OUT &H3C8, I%
    OUT &H3C9, ASC(MID$(Pal.TempPal$, (I% * 3) + 1, 1))
    OUT &H3C9, ASC(MID$(Pal.TempPal$, (I% * 3) + 2, 1))
    OUT &H3C9, ASC(MID$(Pal.TempPal$, (I% * 3) + 3, 1))
  NEXT I%
  WAIT &H3DA, 8


END SUB

SUB PalSet (Pal.Palette$, Pal.MinCol%, Pal.MaxCol%)

  DEF SEG = &HA000
  'OUT &H3C6, Pal.Colors%

  IF Pal.MinCol% < 0 THEN Pal.MinCol% = 0
  IF Pal.MaxCol% > Pal.Colors% - 1 THEN Pal.MaxCol% = Pal.Colors% - 1

  FOR I% = Pal.MinCol% TO Pal.MaxCol%
    OUT &H3C8, I%
    OUT &H3C9, ASC(MID$(Pal.Palette$, (I% * 3) + 1, 1))
    OUT &H3C9, ASC(MID$(Pal.Palette$, (I% * 3) + 2, 1))
    OUT &H3C9, ASC(MID$(Pal.Palette$, (I% * 3) + 3, 1))
  NEXT I%
  WAIT &H3DA, 8

END SUB

