'FADE.BAS by Matt Bross
'Homepage - http://www.GeoCities.Com/SoHo/7067/
'Email    - oh_bother@GeoCities.Com
'
'This program fades the screen to any color.

DEFINT A-Z
DECLARE SUB Fade (rd%, gn%, be%)
DECLARE SUB SetRGB (c%, r%, g%, B%)
SCREEN 13: CLS
RANDOMIZE TIMER

'draw some random garbage
t = INT(RND * 1000)
FOR i = 0 TO t
k = INT(RND * 4)
c = INT(RND * 255)
x = INT(RND * 320)
y = INT(RND * 200)
  IF k = 0 THEN LINE (x, y)-(INT(RND * 320), INT(RND * 200)), c
  IF k = 1 THEN LINE (x, y)-(INT(RND * 320), INT(RND * 200)), c, B
  IF k = 2 THEN LINE (x, y)-(INT(RND * 320), INT(RND * 200)), c, BF
  IF k = 3 THEN CIRCLE (x, y), INT(RND * 50), c
  IF k = 4 THEN PSET (x, y), c
NEXT

PRINT "FADE.BAS by Matt Bross"
LOCATE 13, 11
PRINT "Press A Key To Fade"

SLEEP

'Fade to a random color.  Color is in "Red, Green, Blue" format
Fade INT(RND * 63), INT(RND * 63), INT(RND * 63)

SUB Fade (rd, gn, be)

'rd-red value to fade to
'gn-green value to fade to
'be-blue value to fade to

MaxPaletteValue = 255 'that are 255 palette attributes in SCREEN 13, change
REDIM check(MaxPaletteValue) 'for any other screen mode

DO
FOR i = 0 TO MaxPaletteValue

OUT &H3C7, i       'read from palette value i
red = INP(&H3C9)   'read current red value
green = INP(&H3C9) 'read current green value
blue = INP(&H3C9)  'read current blue value

'fade red
IF red < rd THEN red = red + 1
IF red > rd THEN red = red - 1
'fade green
IF green < gn THEN green = green + 1
IF green > gn THEN green = green - 1
'fade blue
IF blue < be THEN blue = blue + 1
IF blue > be THEN blue = blue - 1

'set red boundries
IF red < 0 THEN red = 0
IF red > 63 THEN red = 63
'set green bounries
IF green < 0 THEN green = 0
IF green > 63 THEN green = 63
'set blue boundries
IF blue < 0 THEN blue = 0
IF blue > 63 THEN blue = 63

'change palette
SetRGB i, red, green, blue

'checks if each palette value has changes to new color
IF check(i) = 0 AND red = rd AND green = gn AND blue = be THEN
  check(i) = -1 'that value has changed this color for the first time
  leave = leave + 1 'counts the number of palette values that has changed
END IF

IF leave = MaxPaletteValue THEN EXIT SUB

NEXT
LOOP
END SUB

'fast palette replacement
SUB SetRGB (c, r, g, B)
'c-color to change
OUT &H3C8, c
'r-red value 0 to 63
OUT &H3C9, r
'g-green
OUT &H3C9, g
'b-blue
OUT &H3C9, B
END SUB

