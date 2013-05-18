'***
DECLARE SUB Makepalette ()
DECLARE SUB Set13Pixel (X%, Y%, Colr%)
DECLARE SUB Splitbox (X1%, Y1%, X2%, Y2%)
DECLARE SUB RoPal ()
DECLARE SUB Newcolor (xa%, ya%, X%, Y%, xb%, yb%)
DECLARE FUNCTION IsVGA% ()
DECLARE FUNCTION Get13Pixel% (X%, Y%)

DEFINT A-Z

TYPE RGBType
  R AS INTEGER
  G AS INTEGER
  B AS INTEGER
END TYPE

DIM SHARED Maxx, Max.y, rough!, Max.color, PAL(512) AS RGBType
Maxx = 319
Max.y = 199
Max.color = 255
rough! = 4

RANDOMIZE TIMER
SCREEN 13

Makepalette

Set13Pixel 0, 0, (RND * Max.color) + 1      'set the corners
Set13Pixel 0, Max.y, (RND * Max.color) + 1
Set13Pixel Maxx, 0, (RND * Max.color) + 1
Set13Pixel Maxx, Max.y, (RND * Max.color) + 1

t# = TIMER
Splitbox 0, 0, Maxx, Max.y
t# = TIMER - t#

RoPal                    'rotate the palette

END

FUNCTION Get13Pixel% (X%, Y%)
Get13Pixel% = POINT(X%, Y%)
END FUNCTION

SUB Makepalette      'this builds a 255 smooth color palette

FOR c% = 1 TO 63     'from red to yellow, start with one
  cn% = 63 - c%
  PAL(c%).R = 63
  PAL(c%).G = c%
  PAL(c%).B = 0
NEXT c%
FOR c% = 0 TO 63
  cn% = 63 - c%
  ci% = c% + 64
  PAL(ci%).R = cn%
  PAL(ci%).G = cn%
  PAL(ci%).B = c%
NEXT c%
FOR c% = 0 TO 63
  cn% = 63 - c%
  ci% = c% + 128
  PAL(ci%).R = 0
  PAL(ci%).G = c%
  PAL(ci%).B = 63
NEXT c%
FOR c% = 0 TO 63
  cn% = 63 - c%
  ci% = c% + 192
  PAL(ci%).R = c%
  PAL(ci%).G = cn%
  PAL(ci%).B = cn%
NEXT c%

FOR c = 1 TO Max.color           'copy array to second half
  col% = PAL(c).R
  PAL(c + Max.color).R = col%
  col% = PAL(c).G
  PAL(c + Max.color).G = col%
  col% = PAL(c).B
  PAL(c + Max.color).B = col%
NEXT c
FOR X = 1 TO Max.color             'actual VGA palette setting code
  OUT &H3C8, X               'attribute   from red to yellow
  OUT &H3C9, PAL(X).R        'red?
  OUT &H3C9, PAL(X).G        'green?
  OUT &H3C9, PAL(X).B        'blue?
NEXT X
END SUB

SUB Newcolor (xa, ya, X, Y, xb, yb)       'puts a new color based on average
                                          'of surrounding pixels plus a
                                          'random value
IF Get13Pixel%(X, Y) <> 0 THEN EXIT SUB
avg = ABS(xa - xb) + ABS(ya - yb)
colour = (Get13Pixel%(xa, ya) + Get13Pixel%(xb, yb)) / 2 + (RND - .5) * avg * rough!
IF colour < 1 THEN colour = 1
IF colour > Max.color THEN colour = Max.color
Set13Pixel X, Y, colour
END SUB

SUB RoPal         'this "rotates" the palette for animation
                  'rather than moving the RGB data, I build two
                  'copies, and loop through both.
DO
FOR I = 0 TO Max.color
  FOR X = 1 TO Max.color
    OUT &H3C8, X                 'attribute
    OUT &H3C9, PAL(X + I).R      'red?
    OUT &H3C9, PAL(X + I).G      'green?
    OUT &H3C9, PAL(X + I).B      'blue?
    AA$ = INKEY$
    IF AA$ <> "" THEN EXIT SUB
  NEXT X%
NEXT I

LOOP                           'loop until quit
END SUB

SUB Set13Pixel (X%, Y%, Colr%)
PSET (X%, Y%), Colr%
END SUB

SUB Splitbox (X1, Y1, X2, Y2)            'this is the main subroutine
                                         '
IF (X2 - X1 < 2) AND (Y2 - Y1 < 2) THEN EXIT SUB

X = (X1 + X2) / 2
Y = (Y1 + Y2) / 2
Newcolor X1, Y1, X, Y1, X2, Y1
Newcolor X2, Y1, X2, Y, X2, Y2
Newcolor X1, Y2, X, Y2, X2, Y2
Newcolor X1, Y1, X1, Y, X1, Y2
IF Get13Pixel(X, Y) = 0 THEN
  colour = (Get13Pixel(X1, Y1) + Get13Pixel(X2, Y1) + Get13Pixel(X2, Y2) + Get13Pixel(X1, Y2)) / 4
    IF colour < 1 THEN colour = 1
    IF colour > Max.color THEN colour = Max.color
    Set13Pixel X, Y, colour
END IF


Splitbox X1, Y1, X, Y
Splitbox X, Y1, X2, Y
Splitbox X, Y, X2, Y2
Splitbox X1, Y, X, Y2

END SUB

