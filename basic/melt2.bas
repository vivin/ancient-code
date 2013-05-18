'***
'*** Made by Tim Kostka.  Visit my homepage:
'    "http://www.geocities.com/SiliconValley/Heights/8967/index.htm"

DECLARE SUB MeltScreen (SMode%)

'*** All you have to do to use this is call MeltScreen with the current
'    screen mode as a parameter.  Fore instance if you were using screen
'    mode 13 (320x200 - 256 colors), then call it like this:
'      CALL MeltScreen(13)
'    If you're in screen mode 12, use this:
'      CALL MeltScreen(12)
'    If you only call it once, it won't do much to the screen.  The more
'    times you call it, the more the screen melts.  It's customizable by
'    changing the variables inside of the sub.


'*** This part shows a demo in screen mode 13
  SCREEN 13
  FOR I% = 1 TO 200
    LINE (INT(RND * 320), INT(RND * 200))-(INT(RND * 320), INT(RND * 200)), INT(RND * 256)
  NEXT I%
  DO
    CALL MeltScreen(13)
  LOOP UNTIL INKEY$ > ""

'*** This part shows a demo in screen mode 12
  SCREEN 12
  FOR I% = 1 TO 200
    LINE (INT(RND * 640), INT(RND * 480))-(INT(RND * 640), INT(RND * 480)), INT(RND * 16)
  NEXT I%
  DO
    CALL MeltScreen(12)
  LOOP UNTIL INKEY$ > ""

SUB MeltScreen (SMode%)

  SELECT CASE SMode%
    CASE 2, 8
      MaxX% = 639: MaxY% = 199
      BlockWidth% = 15: Shift% = 2
    CASE 3
      MaxX% = 719: MaxY% = 347
      BlockWidth% = 15: Shift% = 2
    CASE 4
      MaxX% = 639: MaxY% = 399
      BlockWidth% = 15: Shift% = 2
    CASE 9, 10
      MaxX% = 639: MaxY% = 349
      BlockWidth% = 15: Shift% = 2
    CASE 12, 11
      MaxX% = 639: MaxY% = 479
      BlockWidth% = 15: Shift% = 2
    CASE 13, 1, 7
      MaxX% = 319: MaxY% = 199
      BlockWidth% = 5: Shift% = 1
    END SELECT
 
  DIM Block%(3000)
  X1% = INT(RND * (MaxX% + BlockWidth%)) - BlockWidth%
  X2% = X1% + BlockWidth%
  IF X1% < 0 THEN X1% = 0
  IF X2% > MaxX% THEN X2% = MaxX%
  GET (X1%, 0)-(X2%, MaxY% - Shift%), Block%(0)
  PUT (X1%, Shift%), Block%(0), PSET
  LINE (X1%, 0)-(X2%, Shift% - 1), 0, BF
  ERASE Block%

END SUB

