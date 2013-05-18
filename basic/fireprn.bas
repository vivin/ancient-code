'***
' Description : FirePrint! - Custom text print subroutine for
'               VGA Mode 13
' Written by  : Andrew L. Ayers
' Date        : 07/24/96
'
' This little routine allows you to place a "burning" text
' string on the mode 13 screen. This routine was based on
' a routine by Martin Lindhe. Both are essentially the same,
' though this one is cleaner. Remember, the better the machine,
' the better the effect. Also, smaller strings will look better.
'
' You may use this routine in any manner you like, as long
' as you give Mr. Lindhe and myself credit in an appropriate
' manner.
'
' I wish to thank Martin Lindhe for providing the inspiration
' to do this routine.
'
DECLARE SUB FirePrint (h%, v%, a$, tilt%)
'
SCREEN 13
'
' Set up an all "red" palette
'
FOR t = 0 TO 63: PALETTE t, t: NEXT t
'
' Call the routine once for a simple "flame" effect,
' or over and over (as done here) for a great "burning"
' effect! Use uppercase for best effect.
'
DO
  CALL FirePrint(18, 12, "FIRE!", 0)
LOOP UNTIL INKEY$ <> ""

SUB FirePrint (h%, v%, a$, tilt%)
  '
  ' Print the string in bright "red"
  '
  COLOR 63: LOCATE v%, h%: PRINT a$
  '
  ' Set up start and end locations for the burn
  '
  sx% = (h% * 8) - 8: ex% = ((h% + LEN(a$)) * 8) - 8
  sy% = (v% * 8) - 16: ey% = (v% * 8) - 8
  '
  FOR y% = sy% TO ey%
    FOR x% = sx% TO ex%
      '
      ' Take the current color, subtract a random amount for
      ' red flame "fade", and plot the new point
      '
      col% = POINT(x%, y%) - RND * 25: IF col% < 0 THEN col% = 0
      '
      PSET (x% + tilt%, y% - 1), col%
      '
    NEXT x%
  NEXT y%
  '
END SUB

