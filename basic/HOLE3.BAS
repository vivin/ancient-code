DEFINT A-Z
DECLARE FUNCTION RAD% (angle!)
DECLARE FUNCTION DEG! (angle%)
DECLARE SUB Info ()
DECLARE SUB ReadPal ()
DECLARE SUB MeltSub ()
DECLARE SUB Spin (rotate)
DECLARE SUB TABLE ()
DECLARE SUB RotPal ()
DECLARE SUB GetKey ()
DECLARE SUB SprSub ()
DECLARE SUB Fire ()
DECLARE SUB SetScr ()
DECLARE SUB DrawHole ()
DECLARE SUB PPSET (x%, y%, c1%)
DECLARE SUB SetPal (c2%, Red%, Green%, Blue%)
COMMON SHARED UserFireInput, x, y, mx, my, c1, c2
COMMON SHARED Red, Green, Blue
COMMON SHARED RedChange, GreenChange, BlueChange
COMMON SHARED ReStart, Done, Melt, Ani, UseFire, SprRot, k$, dir
COMMON SHARED imsx, imsy, ix, iy, cx, cy
COMMON SHARED MeltAmount

CONST TRUE = -1, FALSE = NOT TRUE, PI = 22 / 7

'type to save palette
TYPE PaletteType
  Red AS INTEGER
  Green AS INTEGER
  Blue AS INTEGER
END TYPE

TYPE ImageType
  clr AS INTEGER
  dis AS INTEGER
END TYPE

'variables for sprite rotation
imsx = 20: imsy = 20         'image size x: image size y
cx = imsx / 2: cy = imsy / 2 'center of rotation x: center of rotation y
ix = 160: iy = 200 - imsx    'x location on screen: y location on screen

MeltAmount = 100            'How many times melt per loop

'dim sprites
DIM SHARED Spr(222)                      'little circle thing
DIM SHARED SprMask(222)                  'its mask
DIM SHARED SprBkg(222)                   'its background
DIM SHARED FireBkg(222)                  'fires background
DIM SHARED Image(imsx, imsy) AS ImageType'spinning thing
DIM SHARED Melt(2)                       'melt routine

DIM SHARED Old(255) AS PaletteType       'arrays to save old palette

DIM SHARED SINx(360) AS SINGLE           'Look up table
DIM SHARED COSx(360) AS SINGLE

TABLE                                    'Create Lookup table for rotation
Info

SCREEN 13: CLS : RANDOMIZE TIMER

UserFireInput = 10         'controls the speed that the fire changes
                           'the greater the slower the fire changes
ReadPal                    'Save old palette

FOR c = 0 TO 255           'black screen
SetPal c, 0, 0, 0
NEXT

SetScr                     'gets sprites, draws screen

Red = 0: Green = 0: Blue = 0
FOR c = 90 TO 76 STEP -1   'set fire palette
  Red = Red + 3
  SetPal c, Red, 0, 0
NEXT

Red = 0: Green = 20: Blue = 0
FOR c = 75 TO 64 STEP -1   'set palette for sprite animation
  Green = Green + 2
  SetPal c, Red, Green, Blue
NEXT

Red = 30: Green = 0: Blue = 0
FOR c = 92 TO 92 + imsy    'set palette for sprite rotation
  Red = Red
  Green = Green
  Blue = Blue + 2
  SetPal c, Red, Green, Blue
NEXT

SetPal 91, 63, 63, 63      'set palette for letters

DEF SEG = &HA000           'define the segment for PPSET routine
start:
RedChange = INT(RND * 2)   'controls red color rotation
GreenChange = INT(RND * 2) 'controls green color rotation
BlueChange = INT(RND * 2)  'controls blue color rotation
IF RedChange = 0 AND GreenChange = 0 AND BlueChange = 0 THEN GOTO start
                           'make sure the palette isn't all black
dir = -dir                 'controls the direction of the palette rotate

DO

IF UseFire = TRUE THEN Fire 'calls Fire routine
                          
IF Ani = TRUE THEN SprSub   'calls Sprite Animation routine (sort of slow)

RotPal                      'calls Palette Rotate routine for WormHole Effect

IF SprRot = TRUE THEN
  Spin RotateAngle          'calls Sprite Rotation routine (very slow)
  RotateAngle = RotateAngle + 10
END IF

GetKey                      'gets keyboard input

IF ReStart = TRUE THEN ReStart = FALSE: GOTO start
IF Done = TRUE THEN Done = FALSE: GOTO finish
IF Melt = TRUE THEN MeltSub 'melts the background (this sub is not mine and
                            'I found it somewhere and I don't know whose
                            'it is, but it looks cool here.  So thanks to
                            'whoever wrote it.
LOOP
finish:

FOR c = 0 TO 255            'restores old palette
SetPal c, Old(c).Red, Old(c).Green, Old(c).Blue
NEXT

DEF SEG
SCREEN 0, 0, 0, 0
WIDTH 80, 25
END

FUNCTION DEG! (angle)
'changes degrees to radians
DEG! = angle * PI / 180
END FUNCTION

SUB DrawHole
'draws hole
CLS
x = 160
dir = 1
FOR s = 0 TO 450
  y = -(SQR(s) * 10) + 200
   IF c >= 62 THEN c = 0 ELSE c = c + 1
     CIRCLE (x, y), s, c + 1, , , 1 / 2
     CIRCLE (x, y + 1), s, c + 1, , , 1 / 2
     CIRCLE (x, y + 2), s, c + 1, , , 1 / 2
NEXT
END SUB

SUB Fire STATIC

IF first = 0 THEN

first = 1

CIRCLE (160, 100), 10, 76, 3.1, 6.25
GET (150, 90)-(170, 110), FireBkg

ELSE

FireDelay = FireDelay + 1
IF FireDelay >= UserFireInput THEN FireDelay = 0
IF FireDelay = 0 THEN
PUT (150, 90), FireBkg, PSET
  FOR fy = 110 TO 90 STEP -1
  FOR fx = 170 TO 150 STEP -1
    p1 = POINT(fx, fy)
      IF p1 > 75 AND p1 < 84 THEN
        o = INT(RND * 5)
        p2 = POINT(fx, fy - 1)
          IF p2 < 64 THEN PPSET fx, fy - 1, p1 + o
      END IF
  NEXT
  NEXT
END IF

END IF
END SUB

SUB GetKey
k$ = INKEY$: k$ = UCASE$(k$)

IF k$ = "4" THEN mx = mx - 1
IF k$ = "6" THEN mx = mx + 1
IF k$ = "2" THEN my = my + 1
IF k$ = "8" THEN my = my - 1
IF k$ = " " THEN ReStart = TRUE
IF k$ = "Q" THEN Done = TRUE
IF k$ = CHR$(27) THEN Done = TRUE
IF k$ = "M" THEN
    IF Melt = FALSE THEN Melt = TRUE: EXIT SUB
    IF Melt = TRUE THEN Melt = FALSE
END IF
IF k$ = "F" THEN
    IF UseFire = FALSE THEN UseFire = TRUE: EXIT SUB
    IF UseFire = TRUE THEN UseFire = FALSE
END IF
IF k$ = "S" THEN
    IF Ani = FALSE THEN Ani = TRUE: EXIT SUB
    IF Ani = TRUE THEN Ani = FALSE
END IF
IF k$ = "R" THEN
    IF SprRot = FALSE THEN SprRot = TRUE: EXIT SUB
    IF SprRot = TRUE THEN SprRot = FALSE
END IF
END SUB

SUB Info
CLS
PRINT "Hole.bas by Matt Bross"
PRINT "Homepage--> http://www.geocities.com/SoHo/7067/"
PRINT "Email-----> oh_bother@geocities.com"
PRINT ""
PRINT "Use as you like as long as I am given some credit"
PRINT ""
PRINT "I know that the wormhole effect is very like the one by Lucifer Productions,"
PRINT "but I swear not a line of code was stolen."
PRINT ""
PRINT "CONTROLS"
PRINT "--------"
PRINT "SPACE BAR-Change hole color/direction"
PRINT "S/s-Starts/stops sprite animation"
PRINT "R/r-Starts/stops sprite rotation"
PRINT "M/m-Starts/stops melting routine"
PRINT "F/f-Starts/stops fire routine"
PRINT "Q/q/ESC-quits"
PRINT "NUM PAD controls sprite in Sprite animation"
PRINT "Make sure your NUM LOCK is on"
DO: LOOP UNTIL INKEY$ <> ""
END SUB

SUB MeltSub
'Melts screen
FOR t = 0 TO MeltAmount
MeltX = INT(RND * 318)
MeltY = INT(RND * 199)

GET (MeltX, MeltY)-(MeltX + 1, MeltY), Melt
PUT (MeltX, MeltY + 1), Melt, PSET
NEXT
END SUB

SUB PPSET (x, y, c)
'fast pset replacement
POKE y * 320& + x, c
END SUB

FUNCTION RAD (angle!)
'changes Radians to Degrees
RAD = angle! * 180 / PI
END FUNCTION

SUB ReadPal
'saves old palette
FOR c = 0 TO 255
OUT &H3C7, c
Old(c).Red = INP(&H3C9)
Old(c).Green = INP(&H3C9)
Old(c).Blue = INP(&H3C9)
NEXT
END SUB

SUB RotPal STATIC
'rotates pallette
IF dir = -1 THEN a = 1: b = 64: s = 1
IF dir = 1 THEN a = 64: b = 1: s = -1
  FOR i = a TO b STEP s
   SetPal i, Red, Green, Blue
     Red = Red + RedChange
     Green = Green + GreenChange
     Blue = Blue + BlueChange
   IF Red >= 63 THEN Red = 0
   IF Green >= 63 THEN Green = 0
   IF Blue >= 63 THEN Blue = 0
  NEXT
END SUB

'fast PALETTE replacement
SUB SetPal (c, Red, Green, Blue)
  OUT &H3C8, c
  OUT &H3C9, Red
  OUT &H3C9, Green
  OUT &H3C9, Blue
END SUB

SUB SetScr
'draws screen
CLS
FOR a = 0 TO imsx
LINE (0, a)-(imsx, a), a + 92
NEXT
LINE (0, 0)-(imsx, imsy), 0, B

FOR sy = 0 TO imsy
FOR sx = 0 TO imsx
a = sy - cy
b = sx - cx
Image(sx, sy).dis = CINT(SQR((a) ^ 2 + (b) ^ 2))
Image(sx, sy).clr = POINT(sx, sy)
NEXT: NEXT

CLS
LINE (20, 0)-(40, 20), 255, BF
CIRCLE (30, 10), 10, 0: PAINT (30, 10), 0
GET (20, 0)-(40, 20), SprMask

CLS
FOR r = 10 TO 0 STEP -1
CIRCLE (10, 10), r, r + 65: PAINT (10, 10), r + 65
NEXT
GET (0, 0)-(20, 20), Spr

DrawHole

x = 0: y = 0
GET (x, y)-(x + 20, y + 20), SprBkg
END SUB

SUB Spin (rotate)
'rotates sprite
FOR sy = 0 TO imsy
FOR sx = 0 TO imsx
a = sy - cx
b = sx - cx
d = (Image(sx, sy).dis)
      IF b = 0 THEN
        an = rotate + 90
        IF sy < cy THEN an = an + 180
        G = an MOD 360
        PPSET CINT(SINx(G) * d) + ix, CINT(COSx(G) * d) + iy, Image(sx, sy).clr
      ELSE
        an = RAD(ATN(a / b))
        an = an + 180 + rotate
        IF sx > cx THEN an = an + 180
        G = an MOD 360
        PPSET CINT(SINx(G) * d) + ix, CINT(COSx(G) * d) + iy, Image(sx, sy).clr
      END IF
NEXT
NEXT
END SUB

SUB SprSub STATIC
'animates sprite
IF x < 0 THEN x = 0
IF y < 0 THEN y = 0
IF x > 299 THEN x = 299
IF y > 179 THEN y = 179

WAIT &H3DA, 8

PUT (x, y), SprBkg, PSET
  x = x + mx
  y = y + my
    IF x < 0 THEN x = 0
    IF y < 0 THEN y = 0
    IF x > 299 THEN x = 299
    IF y > 179 THEN y = 179
  GET (x, y)-(x + 20, y + 20), SprBkg
PUT (x, y), SprMask, AND
PUT (x, y), Spr, OR

GetKey

END SUB

SUB TABLE
'make look up table and converts angles to degrees
FOR t = 0 TO 360
  SINx(t) = SIN(DEG(t))
  COSx(t) = COS(DEG(t))
NEXT
END SUB

