'***
DECLARE SUB FastScroll (XSpeed%, YSpeed%)
'
DEFINT A-Z
'
DIM a1(32 * 64 * 11), a2(32 * 64 * 11), a3(32 * 64 * 11)
'
SCREEN 13
'
COLOR 7: LOCATE 10, 6: PRINT "Please wait...Building font": COLOR 0
'
FOR T = 15 TO 255: PALETTE T, 0: NEXT T
'
A$ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ!?.-'"
'
FOR T = 0 TO 30
  GOSUB DrawLetter
  GOSUB GetLetter
NEXT T
'
SCREEN 0: CLS 0: SCREEN 13
'
B$ = "YA. ANOTHER SCROLLER. WE LOVE THEM. DONT WE?...    "
'
DO
  FOR TT = 1 TO LEN(B$)
    T = INSTR(A$, MID$(B$, TT, 1)) - 1
    GOSUB PutLetter
    FOR X = 0 TO 7
      CALL FastScroll(-8, 0)
      LINE (311, 0)-(319, 199), 0, BF
    NEXT X
  NEXT TT
LOOP UNTIL UCASE$(INKEY$) = "Q"
'
STOP
'
DrawLetter:
  '
  LINE (0, 0)-(8, 8), 0, BF
  LINE (0, 100)-(319, 199), 0, BF
  '
  COLOR 255: LOCATE 1, 1: PRINT MID$(A$, T + 1, 1)
  '
  SCALE = 8
  '
  FOR y = 0 TO (SCALE - 1)
    FOR X = 1 TO 1 * SCALE
      IF POINT(X - 1, y) = 255 THEN
        LINE (X * SCALE, 100 + y * SCALE)-(X * SCALE + SCALE, 100 + y * SCALE + SCALE), 15, BF
      END IF
    NEXT X
  NEXT y
  '
  FOR y = 0 TO SCALE * SCALE
    C = (16 * ABS(y < 31)) + INT(y / 2)
    FOR X = 0 TO SCALE * SCALE
      IF POINT(X, 100 + y) THEN
        PSET (X, 100 + y), C
      END IF
    NEXT X
  NEXT y
  '
  RETURN

GetLetter:
  '
  IF T >= 0 AND T < 10 THEN GET (0, 100)-(64, 160), a1(T * 32 * 64)
  IF T >= 10 AND T < 20 THEN GET (0, 100)-(64, 160), a2((T - 10) * 32 * 64)
  IF T >= 20 AND T < 30 THEN GET (0, 100)-(64, 160), a3((T - 20) * 32 * 64)
  '
  RETURN

PutLetter:
  '
  IF T >= 0 AND T < 10 THEN PUT (255, 68), a1(T * 32 * 64), PSET
  IF T >= 10 AND T < 20 THEN PUT (255, 68), a2((T - 10) * 32 * 64), PSET
  IF T >= 20 AND T < 30 THEN PUT (255, 68), a3((T - 20) * 32 * 64), PSET
  '
  RETURN

SUB FastScroll (XSpeed%, YSpeed%)
  '
  DIM Temp%(502)
  '
  XStep% = 40: YStep% = 25
  '
  IF XSpeed% < 0 OR YSpeed% < 0 THEN
    FOR y% = 0 TO 199 STEP YStep%
      FOR X% = 0 TO 319 STEP XStep%
        IF (XSpeed% <> 0 AND X% = 0) OR (YSpeed% <> 0 AND y% = 0) THEN
          GET (X% - XSpeed%, y% - YSpeed%)-(X% + XStep% - 1, y% + YStep% - 1), Temp%
          PUT (X%, y%), Temp%, PSET
        ELSE
          GET (X%, y%)-(X% + XStep% - 1, y% + YStep% - 1), Temp%
          PUT (X% + XSpeed%, y% + YSpeed%), Temp%, PSET
        END IF
      NEXT X%
    NEXT y%
  ELSE
    FOR y% = 199 TO 0 STEP -YStep%
      FOR X% = 319 TO 0 STEP -XStep%
        IF (XSpeed% <> 0 AND X% = 319) OR (YSpeed% <> 0 AND y% = 199) THEN
          GET (X% - (XStep% - 1), y% - (YStep% - 1))-(X% - XSpeed%, y% - YSpeed%), Temp%
          PUT (X% - (XStep% - 1) + XSpeed%, y% - (YStep% - 1) + YSpeed%), Temp%, PSET
        ELSE
          GET (X% - (XStep% - 1), y% - (YStep% - 1))-(X%, y%), Temp%
          PUT (X% - (XStep% - 1) + XSpeed%, y% - (YStep% - 1) + YSpeed%), Temp%, PSET
        END IF
      NEXT X%
    NEXT y%
  END IF
  '
END SUB

