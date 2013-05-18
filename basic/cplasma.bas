'***
DECLARE SUB SetPal (start.slot%, end.slot%)
DECLARE SUB ReadRGB (red%, grn%, blu%, slot%)
DECLARE SUB WriteRGB (red%, grn%, blu%, slot%)
'
DIM oldr%(255), oldg%(255), oldb%(255), A%(300), C%(300)
'
SCREEN 13
'
' Save old palette, set palette to black to
' hide the build process...
'
FOR t% = 0 TO 255
  CALL ReadRGB(oldr%(t%), oldg%(t%), oldb%(t%), t%)
  CALL WriteRGB(0, 0, 0, t%)
NEXT t%
'
' TPI = 2 x PI - Do NOT mess with, needed for SIN Calcs
' FREQ = Frequency (Duh!)   - Go ahead and mess with these two...
' AMPLITUDE = (Double Duh!)
'
TPI = 6.28318: FREQ% = 4: AMPLITUDE% = 15
'
' Create Sinusoidal Multicolored Backdrop Thingy!
'
SCALE = (TPI * FREQ%) / 320
'
FOR Y% = 0 TO 199
  RAD = 0
  COLR% = COLR% + 1: IF COLR% > 255 THEN COLR% = 1
  LINE (0, Y%)-(0, Y%), COLR%
  FOR X% = 0 TO 319 STEP 8
    YPOS% = Y% + SIN(RAD) * AMPLITUDE%
    LINE -(X%, YPOS%), COLR%
    RAD = RAD + (SCALE * 6)
  NEXT X%
NEXT Y%
'
' Warp it sinusoidally in a horizontal fashion!
'
RAD = 0
FREQ% = 8: AMPLITUDE% = 15
SCALE = (TPI * FREQ%) / 200
'
FOR Y% = 0 TO 199
  XPOS% = INT(SIN(RAD) * AMPLITUDE%)
  GET (0, Y%)-(319 - XPOS%, Y%), A%
  IF XPOS% >= 0 THEN
    GET (319 - XPOS%, Y%)-(319, Y%), C%
    PUT (XPOS%, Y%), A%, PSET
    PUT (0, Y%), C%, PSET
  ELSE
    GET (ABS(XPOS%), Y%)-(319, Y%), A%
    GET (0, Y%)-(ABS(XPOS%), Y%), C%
    PUT (0, Y%), A%, PSET
    PUT (319 + XPOS%, Y%), C%, PSET
  END IF
  RAD = RAD + SCALE
NEXT Y%
'
' Mask off ugly portions
'
LINE (0, 0)-(319, 17), 0, BF
LINE (0, 174)-(319, 199), 0, BF
LINE (0, 0)-(35, 199), 0, BF
LINE (289, 0)-(319, 199), 0, BF
'
' Create a custom 256 color palette
'
CALL WriteRGB(63, 63, 63, 1)   ' From all white
CALL WriteRGB(63, 0, 0, 63)    ' to red, and then
CALL WriteRGB(0, 63, 0, 127)   ' to green, then
CALL WriteRGB(0, 0, 63, 191)   ' to blue, and finally
CALL WriteRGB(63, 63, 63, 255) ' back to white...
'
CALL SetPal(1, 63)             ' Each of these lines
CALL SetPal(63, 127)           ' create a portion of
CALL SetPal(127, 191)          ' the color spread. The
CALL SetPal(191, 255)          ' two arguments are the
                               ' start and ending slots
                               ' for the spread...

'
' Rotate palette - this isn't how you would do it
' for speed (for more speed, inline the read/write code
' to eliminate subroutine calling overhead), but it
' does show how to do it. Notice the "sparklies" along
' the right hand edge. These are only apparent if your
' computer is fast enough. I believe this has to do with
' the registers being updated faster than the video card
' can keep up with or sothing like that. If anyone knows
' how to fix this, go for it!
'
DO
  '
  CALL ReadRGB(ored%, ogrn%, oblu%, 1)     ' Read in slot 1.
  '
  FOR t% = 1 TO 254
    CALL ReadRGB(red%, grn%, blu%, t% + 1) ' Read slots 2-255, then
    CALL WriteRGB(red%, grn%, blu%, t%)    ' shift to slots 1-254.
  NEXT t%
  '
  CALL WriteRGB(ored%, ogrn%, oblu%, 255)  ' Write what was in slot 1 to
                                           ' slot 255.
LOOP UNTIL INKEY$ <> ""
'
CLS

'
' Reset original RGB values
'
FOR t% = 0 TO 255
  CALL WriteRGB(oldr%(t%), oldg%(t%), oldb%(t%), t%)
NEXT t%

SUB ReadRGB (red%, grn%, blu%, slot%)
  '
  OUT &H3C7, slot% ' Read RGB values from slot
  '
  red% = INP(&H3C9)
  grn% = INP(&H3C9)
  blu% = INP(&H3C9)
  '
END SUB

SUB SetPal (start.slot%, end.slot%)
  '
  num.slots% = end.slot% - start.slot%
  '
  CALL ReadRGB(sr%, sg%, sb%, start.slot%)
  CALL ReadRGB(er%, eg%, eb%, end.slot%)
  '
  rr% = ABS(er% - sr%): rg% = ABS(eg% - sg%): rb% = ABS(eb% - sb%)
  rs% = SGN(er% - sr%): gs% = SGN(eg% - sg%): bs% = SGN(eb% - sb%)
  '
  stepr = (rr% / num.slots%) * rs%
  stepg = (rg% / num.slots%) * gs%
  stepb = (rb% / num.slots%) * bs%
  '
  r = sr%: g = sg%: b = sb%
  wr% = r: wg% = g: wb% = b
  '
  FOR t% = start.slot% TO end.slot%
    '
    CALL WriteRGB(wr%, wg%, wb%, t%)
    '
    r = r + stepr: wr% = r
    g = g + stepg: wg% = g
    b = b + stepb: wb% = b
    '
  NEXT t%
  '
END SUB

SUB WriteRGB (red%, grn%, blu%, slot%)
  '
  OUT &H3C8, slot% ' Write RGB values to slot
  '
  OUT &H3C9, red%
  OUT &H3C9, grn%
  OUT &H3C9, blu%
  '
END SUB

