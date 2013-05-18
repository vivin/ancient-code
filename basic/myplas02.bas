'***
DECLARE SUB PalSet (Pal.Palette$, Pal.MinCol%, Pal.MaxCol%)
DECLARE SUB PalRotate (Pal.Palette$, Pal.MinCol%, Pal.MaxCol%, Pal.Shift%)

CLS
SCREEN 13

CONST Pal.Colors% = 256
DIM Pal$: Pal$ = SPACE$(Pal.Colors% * 3)
MYPI! = 8 * ATN(1) / 240
FOR Colr% = 0 TO 239
  R1% = 32 + SIN((Colr% + 0) * MYPI!) * 31
  G1% = 32 + SIN((Colr% + 80) * MYPI!) * 31
  B1% = 32 + SIN((Colr% + 160) * MYPI!) * 31
  Offset% = ((Colr% + 16) * 3)
  MID$(Pal$, Offset% + 1, 1) = CHR$(R1%)
  MID$(Pal$, Offset% + 2, 1) = CHR$(G1%)
  MID$(Pal$, Offset% + 3, 1) = CHR$(B1%)
NEXT Colr%

CALL PalSet(Pal$, 16, 255)


FOR X% = 0 TO 319
  FOR Y% = 0 TO 199
    IF RND > .8 THEN PSET (X%, Y%), INT(RND * 240) + 16
  NEXT Y%
NEXT X%

FOR I% = 1 TO 1
  FOR X% = 0 TO 319
    FOR Y% = 0 TO 199
      Temp% = POINT(X%, Y%)
      IF POINT(X% - 1, Y%) > 0 AND Temp% = 0 THEN PSET (X%, Y%), POINT(X% - 1, Y%)
      IF POINT(X% + 1, Y%) > 0 AND Temp% = 0 THEN PSET (X%, Y%), POINT(X% + 1, Y%)
      'IF POINT(X%, Y% - 1) > 0 AND Temp% = 0 THEN PSET (X%, Y%), POINT(X%, Y% - 1)
      IF POINT(X%, Y% + 1) > 0 AND Temp% = 0 THEN PSET (X%, Y%), POINT(X%, Y% + 1)
    NEXT Y%
  NEXT X%
NEXT I%

FOR X% = 0 TO 319
  FOR Y% = 0 TO 199
    IF POINT(X%, Y%) = 0 THEN PSET (X%, Y%), INT(RND * 240) + 16
  NEXT Y%
NEXT X%

Smooth% = 3

FOR I% = 1 TO Smooth%
  FOR X% = 0 TO 319
    FOR Y% = 0 TO 199
      Col1% = 0
      Col2% = 0
      Col3% = 0
      Col4% = 0
      IF Y% > 0 THEN Col1% = POINT(X%, Y% - 1) - 16
      IF Y% < 199 THEN Col2% = POINT(X%, Y% + 1) - 16
      IF X% < 319 THEN Col3% = POINT(X% + 1, Y%) - 16
      IF X% > 0 THEN Col4% = POINT(X% - 1, Y%) - 16
      Col% = (Col1% + Col2% + Col3% + Col4%) / (SGN(Col1%) + SGN(Col2%) + SGN(Col3%) + SGN(Col4%))
      'Col% = (Col% + POINT(X%, Y%) - 16) / 2
      Col% = Col% + 16
      PSET (X%, Y%), Col%
    NEXT Y%
  NEXT X%
NEXT I%

DO
  CALL PalRotate(Pal$, 16, 255, 2)
  FOR I% = 1 TO 30000: NEXT I%
LOOP UNTIL INKEY$ > ""

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

  Pal.Palette$ = Pal.TempPal$
 
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

