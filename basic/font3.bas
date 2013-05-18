'*** Made by Tim Kostka.  Reach me at 'dkostka@salsgiver.com'
'    or 'dbaggio@geocities.com' or visit me QBasic homepage
'    at 'http://www.geocities.com/SiliconValley/Heights/8967/index.htm'

DECLARE SUB TextOutline (X%, Y%, Text$, Fore%, Back%)
DECLARE SUB TextShadow (X%, Y%, Text$, Fore%, Back%)

SCREEN 13
'***             +---- This the x coordinate of the text
'***             |  +----This is the y coordinate of the text
'***             |  |  +------+----This is the text to print
'***             |  |  |      |  ++----This is the foreground color
'***             |  |  |      |  ||  +----This is the background color
'***             |  |  |      |  ||  |
 CALL TextShadow(2, 5, "Hello!", 15, 7)
CALL TextOutline(2, 7, "Hello!", 15, 7)

SUB TextOutline (X%, Y%, Text$, Fore%, Back%)

  COLOR Fore%
  LOCATE Y%, X%: PRINT Text$
  IF Fore% = Back% THEN EXIT SUB
  FOR X1% = (X% - 1) * 8 - 1 TO (X% - 1) * 8 + 1 + LEN(Text$) * 8
    FOR Y1% = (Y% - 1) * 8 - 1 TO (Y% - 1) * 8 + 9
      IF POINT(X1% + 1, Y1%) = Fore% THEN
        IF POINT(X1%, Y1%) <> Fore% THEN PSET (X1%, Y1%), Back%
      ELSEIF POINT(X1% - 1, Y1%) = Fore% THEN
        IF POINT(X1%, Y1%) <> Fore% THEN PSET (X1%, Y1%), Back%
      ELSEIF POINT(X1%, Y1% - 1) = Fore% THEN
        IF POINT(X1%, Y1%) <> Fore% THEN PSET (X1%, Y1%), Back%
      ELSEIF POINT(X1%, Y1% + 1) = Fore% THEN
        IF POINT(X1%, Y1%) <> Fore% THEN PSET (X1%, Y1%), Back%
        END IF
    NEXT Y1%
  NEXT X1%

END SUB

SUB TextShadow (X%, Y%, Text$, Fore%, Back%)

  COLOR Fore%
  LOCATE Y%, X%: PRINT Text$
  IF Fore% = Back% THEN EXIT SUB
  FOR X1% = (X% - 1) * 8 - 1 TO (X% - 1) * 8 - 1 + LEN(Text$) * 8
    FOR Y1% = (Y% - 1) * 8 - 1 TO (Y% - 1) * 8 + 7
      IF POINT(X1% + 1, Y1% + 1) = Fore% THEN
        IF POINT(X1%, Y1%) <> Fore% THEN PSET (X1%, Y1%), Back%
        END IF
    NEXT Y1%
  NEXT X1%

END SUB

