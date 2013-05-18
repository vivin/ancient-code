

DEFINT A-Z
DECLARE FUNCTION GetByte% ()
DECLARE SUB BufferWrite (a%)
DECLARE SUB MakeGif (a$, ScreenX%, ScreenY%, Xstart%, YStart%, Xend%, Yend%, NumColors%, AdaptorType%)
DECLARE SUB PutByte (a%)
DECLARE SUB PutCode (a%)
DECLARE SUB pal (c%, R%, G%, B%)
CONST TRUE = -1, FALSE = NOT TRUE

'GS3DO.BAS by Matt Bross, 1997
'HOMEPAGE - http://www.GeoCities.Com/SoHo/7067/
'EMAIL    - oh_bother@GeoCities.Com
'
'This is an increible 3D program if I say so myself.  But be warned, it is
'EXTREMELY SLOW!  With then pyramid object included with this .BAS file It
'updates the screen six times per second on my 75MHz Pentium, better than
'the old vesion but still bearly enough speed for animation.  In the future
'I plan to add texture mapping, and faster and less math, and overall faster
'code (if aanyone's good at assembly, help me.  I can plot pixels in screen
'13 using bios and that's about it).
'
'The sorting algorithm was originaly written by Ryan Wellman, which I
'modifidied for my own purposes.  I made the 3D program with help from 3D
'tutorials by Lithium /VLA, Shade3D.BAS by Rich Geldreich; and gouraud fill
'with Luke Molnar's (of M/K Productions) gorau.bas. The GIF support is from
'Rich Geldreich's MakeGif.BAS.
'
'completely RANDOMIZE
RANDOMIZE TIMER: DO: RANDOMIZE TIMER: LOOP UNTIL RND > .5
ON ERROR GOTO ErrorHandler
TYPE PointType
  x AS INTEGER      'X coordinate
  y AS INTEGER      'Y coordinate
  z AS INTEGER      'Z coordinate
  shade AS INTEGER  'shade of points
  dis AS SINGLE     'distance from the origin (0, 0, 0)
END TYPE
TYPE PolyType
  C1 AS INTEGER     'number of the first point of a polygon
  C2 AS INTEGER     'number of the second point of a polygon
  C3 AS INTEGER     'number of the third point of a polygon
  culled AS INTEGER 'TRUE if the polygon isn't visible
  AvgZ AS INTEGER   'used to sort Z coordinates of polygons
END TYPE
TYPE FillType
  Y1 AS INTEGER     'starting Y coordinate
  Y2 AS INTEGER     'ending Y coordinate
  clr1 AS INTEGER   'starting color
  clr2 AS INTEGER   'ending color
END TYPE
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%INFO%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SCREEN 0, 0, 0, 0: WIDTH 80, 25: CLS
PRINT "GS3DO.BAS by Matt Bross, 1997"
PRINT "HOMEPAGE - http://www.GeoCities.Com/SoHo/7067/"
PRINT "EMAIL    - oh_bother@GeoCities.Com"
PRINT
PRINT "3D ANIMATION FOR THE QBASIC LANGUAGE"
PRINT "COPYRIGHT MATT BROSS.  USE FREELY AS"
PRINT "LONG AS CREDIT IS GIVEN."
PRINT
PRINT "--------CONTROLS--------"
PRINT "   0 - reset rotation"
PRINT "   5 - stop rotation"
PRINT "   S - reset location"
PRINT "   A - stop translation"
PRINT "2, 8 - rotate around x axis"
PRINT "4, 6 - rotate around y axis"
PRINT "-, + - rotate around z axis"
PRINT CHR$(24); ", "; CHR$(25); " - translate vertically"
PRINT CHR$(27); ", "; CHR$(26); " - translate horizontally"
PRINT "Z, X - translate depthwise"
PRINT " Esc - exit"
PRINT "----CASE INSENSITIVE----"
PRINT
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%VARIABLES%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
'SRX = the screen's x resolution
'SRY = the screen's y resolution
SRX = 320: SRY = 200
'DX = the X coordinate of the center of the screen
'DY = the Y coordinate of the center of the screen
DX = SRX \ 2: DY = SRY \ 2
'D = the viewer's distance then object: SD = controls perspective
D = 350: SD = 140
'MaxSpin = controls the maxium rotation speed
'MaxSpeed = controls the maxium translation speed
MaxSpin = 20: MaxSpeed = 10
'NumClr = the number of palette values to assign to shading each color
NumClr = 63
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%GIF STUFF%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DIM SHARED OutBuffer$, OStartAddress, OAddress, OEndAddress, Oseg
DIM SHARED CodeSize, CurrentBit, Char&, BlockLength
DIM SHARED Shift(7) AS LONG
DIM SHARED x, y, Minx, MinY, MaxX, MaxY, Done, GIFFile, LastLoc&
ShiftTable:
DATA 1, 2, 4, 8, 16, 32, 64, 128
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%SIN TABLES%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
'create SINe and COSine tables for 360 degrees in radians, and then scale
'1024 times for faster math.
'$DYNAMIC
DIM SINx(360) AS LONG, COSx(360) AS LONG
FOR i = 0 TO 360
  SINx(i) = SIN(i * (22 / 7) / 180) * 1024 'use 1024 to shift binary digits
  COSx(i) = COS(i * (22 / 7) / 180) * 1024 'over 6 bits.
NEXT i
'%%%%%%%%%%%%%%%%%%%%%%%%%%GOURAUD SHADE ARRAYS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
'$STATIC
DIM scan(320) AS FillType 'DIM gouraud shading array
REDIM coord(1 TO 3)
'%%%%%%%%%%%%%%%%%%%%%%%%DOUBLE BUFFERING ARRAYS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
'$STATIC
DIM SHARED aofs&
DIM SHARED ScnBuf(32001) 'DIM array to serve as page in SCREEN 13
ScnBuf(0) = 320 * 8 'set length (x)
ScnBuf(1) = 200     'set height (y)
DEF SEG = VARSEG(ScnBuf(2)) 'get segment of beginning of array data
aofs& = VARPTR(ScnBuf(2))   'get offset of beginning of array data
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%LIGHT TABLES%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
'$DYNAMIC
DIM LX(256), LY(256), LZ(256)
'Location of light source in spherical coordinates
l1 = 70: l2 = 40: a1! = l1 / 57.29: a2! = l2 / 57.29
s1! = SIN(a1!): C1! = COS(a1!): s2! = SIN(a2!): C2! = COS(a2!)
LX = 128 * s1! * C2!: LY = 128 * s1! * s2!: LZ = 128 * C1!

'find length of segment from light source to origin (0, 0, 0)
ldis! = SQR(LX * LX + LY * LY + LZ * LZ) / 128
FOR a = -128 TO 128
  LX(a + 128) = LX * a 'make light source lookup tables for shading
  LY(a + 128) = LY * a
  LZ(a + 128) = LZ * a
NEXT a
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%LOAD OBJECT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
'Load Points Data
RESTORE PointData: READ MaxPoints
DIM POINTS(1 TO MaxPoints) AS PointType     'at start
DIM ScnPnts(1 TO MaxPoints) AS PointType    'after rotation
DIM SX(1 TO MaxPoints), SY(1 TO MaxPoints)  'points drawn to screen
FOR i = 1 TO MaxPoints
  READ x, y, z: POINTS(i).x = x: POINTS(i).y = y: POINTS(i).z = z
  'find distance from point to the origin (0, 0, 0)
  dis! = SQR(x * x + y * y + z * z)
  POINTS(i).dis = dis! * ldis!: ScnPnts(i).dis = dis! * ldis!
NEXT i

'Load Polygon Data
RESTORE PolyData: READ MaxPolys
DIM SHARED P(MaxPolys) AS PolyType 'stores all polygon data
FOR i = 1 TO MaxPolys: READ P(i).C1, P(i).C2, P(i).C3: NEXT i

PRINT "Press a Key"
DO: LOOP UNTIL INKEY$ <> ""

'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%SET PALETTE%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SCREEN 13: CLS
s! = 0: ClrStep! = 63 / NumClr
FOR a = 0 TO NumClr
  pal a, c, c, c
  s! = s! + ClrStep!: c = INT(s!)
NEXT a
'%%%%%%%%%%%%%%%%%%%%%%%%%%%LOOK UP VARIABLES%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
zero = 0: one = 1: three6d = 360

'------------------------------>BEGIN MAIN LOOP<-----------------------------
DO
'*********************************GET KEY************************************
k$ = UCASE$(INKEY$)
SELECT CASE k$
  CASE "0"
    R1 = zero: R2 = zero: R3 = zero
    D1 = zero: D2 = zero: D3 = zero
  CASE "5"
    D1 = zero: D2 = zero: D3 = zero
  CASE "A"
    MX = zero: MY = zero: MZ = zero
  CASE "S"
    MX = zero: MY = zero: MZ = zero
    MMX = zero: MMY = zero: MMZ = zero
  CASE "2"
    D1 = D1 - one
  CASE "8"
    D1 = D1 + one
  CASE "4"
    D2 = D2 - one
  CASE "6"
    D2 = D2 + one
  CASE "+", "="
    D3 = D3 - one
  CASE "-"
    D3 = D3 + one
  CASE CHR$(0) + "H"
    MY = MY + one
  CASE CHR$(0) + "P"
    MY = MY - one
  CASE CHR$(0) + "K"
    MX = MX + one
  CASE CHR$(0) + "M"
    MX = MX - one
  CASE "Z"
    MZ = MZ + one
  CASE "X"
    MZ = MZ - one
  CASE CHR$(27)
    GOTO ShutDown
  CASE "G"
    INPUT "SAVE SCREEN as .GIF"; s$
    IF LEFT$(UCASE$(s$), 1) = "Y" THEN
      INPUT "Input Filename:", file$
      IF RIGHT$(UCASE$(file$), 4) <> ".GIF" THEN file$ = file$ + ".GIF"
      PUT (0, 0), ScnBuf, PSET
      MakeGif file$, 320, 200, 0, 0, 319, 199, 256, 2
    END IF
END SELECT
'*********************************ROTATION***********************************
'keep rotation speed undercontrol
IF D1 > MaxSpin THEN D1 = MaxSpin
IF D2 > MaxSpin THEN D2 = MaxSpin
IF D2 > MaxSpin THEN D2 = MaxSpin
IF D1 < -MaxSpin THEN D1 = -MaxSpin
IF D2 < -MaxSpin THEN D2 = -MaxSpin
IF D2 < -MaxSpin THEN D2 = -MaxSpin
'keep SINes and COSines in array limits
R1 = (R1 + D1) MOD three6d
R2 = (R2 + D2) MOD three6d
R3 = (R3 + D3) MOD three6d
IF R1 < zero THEN R1 = three6d + R1
IF R2 < zero THEN R2 = three6d + R2
IF R3 < zero THEN R3 = three6d + R3
'********************************TRANSLATION*********************************
'Keep translation speed from becoming uncontrolable
IF MX > MaxSpeed THEN MX = MaxSpeed
IF MY > MaxSpeed THEN MY = MaxSpeed
IF MZ > MaxSpeed THEN MZ = MaxSpeed
IF MX < -MaxSpeed THEN MX = -MaxSpeed
IF MY < -MaxSpeed THEN MY = -MaxSpeed
IF MZ < -MaxSpeed THEN MZ = -MaxSpeed
MMX = MMX + MX: MMY = MMY + MY: MMZ = MMZ + MZ
'Keeps variables within limits of integers
IF MMX > 32767 THEN MMX = 32767
IF MMY > 250 THEN MMY = 250
IF MMZ > 120 THEN MMZ = 120
IF MMX < -32767 THEN MMX = -32767
IF MMY < -120 THEN MMY = -120
IF MMZ < -327 THEN MMZ = -327
'*******************************MOVE OBJECT**********************************
FOR i = 1 TO MaxPoints
'rotate points around the Y axis
  TEMPX = (POINTS(i).x * COSx(R2) - POINTS(i).z * SINx(R2)) \ 1024
  TEMPZ = (POINTS(i).x * SINx(R2) + POINTS(i).z * COSx(R2)) \ 1024
'rotate points around the X axis
  ScnPnts(i).z = (TEMPZ * COSx(R1) - POINTS(i).y * SINx(R1)) \ 1024
  TEMPY = (TEMPZ * SINx(R1) + POINTS(i).y * COSx(R1)) \ 1024
'rotate points around the Z axis
  ScnPnts(i).x = (TEMPX * COSx(R3) + TEMPY * SINx(R3)) \ 1024
  ScnPnts(i).y = (TEMPY * COSx(R3) - TEMPX * SINx(R3)) \ 1024
'******************************CONVERT 3D TO 2D******************************
TEMPZ = ScnPnts(i).z + MMZ - SD
IF TEMPZ < zero THEN  'only calulate points visible by viewer
  SX(i) = (D * ((ScnPnts(i).x + MMX) / TEMPZ)) + DX
  SY(i) = (D * ((ScnPnts(i).y + MMY) / TEMPZ)) + DY
END IF
'*******************************SHADE POINTS*********************************
X1 = ScnPnts(i).x: Y1 = ScnPnts(i).y: Z1 = ScnPnts(i).z
s = CINT((X1 * LX + Y1 * LY + Z1 * LZ) \ ScnPnts(i).dis) + 128
  IF s < zero THEN s = zero
  IF s > 256 THEN s = 256
shade = (LX(s) + LY(s) + LZ(s)) \ 3
  IF shade < zero THEN shade = zero
  IF shade > NumClr THEN shade = NumClr
ScnPnts(i).shade = shade
NEXT
FOR i = 1 TO MaxPolys
'*************************CULL NON-VISIABLE POLYGONS*************************
'this isn't perfect yet so I REMmed it, so for more speed unrem the following
coord(1) = P(i).C1: coord(2) = P(i).C2: coord(3) = P(i).C3
'X1 = ScnPnts(coord(1)).x: X2 = ScnPnts(coord(2)).x: X3 = ScnPnts(coord(3)).x
'Y1 = ScnPnts(coord(1)).y: Y2 = ScnPnts(coord(2)).y: Y3 = ScnPnts(coord(3)).y
Z1 = ScnPnts(coord(1)).z: Z2 = ScnPnts(coord(2)).z: Z3 = ScnPnts(coord(3)).z
'cull1 = X3 * ((Y1 * Z2) - (Z1 * Y2)): cull2 = Y3 * ((X1 * Z2) - (Z1 * X2))
'cull3 = Z3 * ((X1 * Y2) - (Y1 * X2))
'IF cull1 + cull2 + cull3 = zero THEN P(i).culled = TRUE ELSE P(i).culled = FALSE
'******************FIND AVERAGE Z COORDINATE OF EACH POLYGON*****************
P(i).AvgZ = (Z1 + Z2 + Z3) \ 3
NEXT i
'******************SORT POLGONS BY THEIR AVERAGE Z COORDINATE****************
increment = MaxPolys + 1
DO
increment = increment \ 2
FOR index = 1 TO MaxPolys - increment
  IF P(index).AvgZ > P(index + increment).AvgZ THEN
  SWAP P(index), P(index + increment)
    IF index > increment THEN
    cutpoint = index
    DO
    index = (index - increment): IF index < 1 THEN index = 1
      IF P(index).AvgZ > P(index + increment).AvgZ THEN
        SWAP P(index), P(index + increment)
      ELSE
        index = cutpoint: EXIT DO
      END IF
    LOOP
    END IF
  END IF
NEXT index
LOOP UNTIL increment <= 1
'******************************DRAW POLYGONS*********************************
'Clear screen buffer.  Use a 320 by 200 BLOADable graphic here instead for
'a background.
ERASE ScnBuf: ScnBuf(0) = 2560: ScnBuf(1) = SRY

FOR i = 1 TO MaxPolys
  IF P(i).culled = FALSE THEN
    'load points
    coord(1) = P(i).C1: coord(2) = P(i).C2: coord(3) = P(i).C3
    'find highest and lowest Y coordinates
    xmin = SRX: xmax = zero
    IF SX(coord(1)) > xmax THEN xmax = SX(coord(1))
    IF SX(coord(2)) > xmax THEN xmax = SX(coord(2))
    IF SX(coord(3)) > xmax THEN xmax = SX(coord(3))
    IF SX(coord(1)) < xmin THEN xmin = SX(coord(1))
    IF SX(coord(2)) < xmin THEN xmin = SX(coord(2))
    IF SX(coord(3)) < xmin THEN xmin = SX(coord(3))
    'keep min's and max's in the limits of the screen
    IF xmin < zero THEN xmin = zero
    IF xmax > SRX THEN xmax = SRX
    IF xmin > SRX THEN EXIT FOR
    IF xmax < zero THEN EXIT FOR
    IF SY(coord(1)) AND SY(coord(2)) AND SY(coord(3)) < zero THEN EXIT FOR
    IF SY(coord(1)) AND SY(coord(2)) AND SY(coord(3)) > SRY THEN EXIT FOR

    ERASE scan

    FOR j = 1 TO 3
      k = j + 1: IF k > 3 THEN k = 1
      VAL1 = coord(j): VAL2 = coord(k)
      IF SX(VAL1) > SX(VAL2) THEN SWAP VAL1, VAL2
      Y1 = SY(VAL1): X1 = SX(VAL1): Y2 = SY(VAL2): X2 = SX(VAL2)
      col1 = ScnPnts(VAL1).shade: Col2 = ScnPnts(VAL2).shade
      XDelta = X2 - X1: YDelta = Y2 - Y1: CDelta = Col2 - col1
      IF XDelta <> zero THEN
        YSlope = (YDelta / XDelta) * 128
        CSlope = (CDelta / XDelta) * 128
      ELSE
        YSlope = zero
        CSlope = zero
      END IF

      YVal& = Y1 * 128: CVal& = col1 * 128
      IF X1 < zero THEN X1 = zero
      IF X2 > SRX THEN X2 = SRX

      FOR f = X1 TO X2
        IF scan(f).Y1 = zero THEN
          scan(f).Y1 = YVal& \ 128
          scan(f).clr1 = CVal& \ 128
        ELSE
          scan(f).Y2 = YVal& \ 128
          scan(f).clr2 = CVal& \ 128
        END IF
        YVal& = YVal& + YSlope
        CVal& = CVal& + CSlope
      NEXT f
  NEXT j

  FOR f = xmin TO xmax
 
    IF scan(f).Y1 > scan(f).Y2 THEN
      Y1 = scan(f).Y2: Y2 = scan(f).Y1
      col1 = scan(f).clr2: Col2 = scan(f).clr1
    ELSE
      Y1 = scan(f).Y1: Y2 = scan(f).Y2
      col1 = scan(f).clr1: Col2 = scan(f).clr2
    END IF

    YDelta = Y2 - Y1: CDelta = Col2 - col1
    IF YDelta = zero THEN YDelta = 1
    CSlope = (CDelta / YDelta) * 128: CVal& = col1 * 128

    FOR j = scan(f).Y1 TO scan(f).Y2
    'clip polygon to screen (set boundries)
    IF f < SRX AND f > zero AND j > zero AND j < SRY THEN
      pixel = CVal& \ 128: IF pixel > NumClr THEN pixel = NumClr
      'write pixel to screen buffer
      POKE aofs& + f + j * 320&, pixel
    END IF
      CVal& = CVal& + CSlope
    NEXT j
  NEXT f
END IF
NEXT i

PUT (zero, zero), ScnBuf, PSET 'dump array to screen, like PCOPY
'******************************FRAME COUNTER*********************************
'LOCATE 1, 1: PRINT fps: frame = frame + 1
'LOCATE 2, 1: PRINT TIMER - D#: D# = TIMER
'IF TIMER > t# THEN t# = TIMER + 1: fps = frame: frame = zero
LOOP
'------------------------------>END MAIN LOOP<-------------------------------
ShutDown:
DEF SEG
SCREEN 0, 0, 0, 0: WIDTH 80, 25: CLS
PRINT "Final Location of Points"
PRINT " X", " Y", " Z": PRINT STRING$(31, "-")
FOR i = 1 TO MaxPoints
PRINT ScnPnts(i).x + MMX, ScnPnts(i).y + MMY, ScnPnts(i).z + MMZ: NEXT
PRINT : PRINT "Free space"
PRINT " String Array   Stack"
PRINT STRING$(21, "-")
PRINT FRE(""); FRE(-1); FRE(-2): END

PointData:
'Max Points
DATA 5
'location on points (x, y, z)
DATA 0, 0, 10,  0, 0, -10,  10, 0, 0,  -10, 0, 0,  0, -10, 0

PolyData:
'Max Polygons
DATA 24
'The points above can be numbered, the first data stament is 1.  The points
'listed make triangles.  They must be labeled like so (I don't understand why
'there is some flaw in the shading routine, this is what is slowing this down
'the most.  Someone please show me why.)
'DATA 1,2,3, 1,3,2, 2,1,3, 2,3,1 'points 1,2,3
DATA 5,1,4, 5,4,1, 1,4,5, 1,5,4
DATA 5,4,2, 5,2,4, 4,2,5, 4,5,2
DATA 5,2,3, 5,3,2, 2,3,5, 2,5,2
DATA 5,3,1, 5,1,3, 1,3,5, 1,5,3
DATA 2,3,1, 2,1,3, 3,1,2, 3,2,1
DATA 2,1,4, 2,4,1, 1,4,2, 1,2,4

ErrorHandler:
RESUME NEXT

REM $STATIC
'Puts a byte into the disk buffer... when the disk buffer is full it is
'dumped to disk.
SUB BufferWrite (a) STATIC

    IF OAddress = OEndAddress THEN  'are we at the end of the buffer?
        PUT GIFFile, , OutBuffer$   ' yup, write it out and
        OAddress = OStartAddress    '  start all over
    END IF
    POKE OAddress, a                'put byte in buffer
    OAddress = OAddress + 1         'increment position
END SUB

'This routine gets one pixel from the display.
FUNCTION GetByte STATIC

    GetByte = POINT(x, y)           'get the "byte"
    x = x + 1                       'increment X coordinate
    IF x > MaxX THEN                'are we too far?
        LINE (Minx, y)-(MaxX, y), 0 'a pacifier for impatient users
        x = Minx                    'go back to start
        y = y + 1                   'increment Y coordinate
        IF y > MaxY THEN            'are we too far down?
            Done = TRUE             ' yup, flag it then
        END IF
    END IF
END FUNCTION

'
'-----------------------------------------------------------------------------
'    PDS 7.1 & QB4.5 GIF Compression Routine v1.00 By Rich Geldreich 1992
'-----------------------------------------------------------------------------
'
'A$          = output filename
'ScreenX     = X resolution of screen(320, 640, etc.)
'ScreenY     = Y resolution of screen(200, 350, 480, etc.)
'XStart      = <-upper left hand corner of area to encode
'YStart      = < "                                      "
'Xend        = <-lower right hand corner of area to encode
'Yend        = < "                                       "
'NumColors   = # of colors on screen(2, 16, 256)
'AdaptorType = 1 for EGA 2 for VGA
'NOTE: EGA palettes are not supported in this version of MakeGIF.
'
SUB MakeGif (a$, ScreenX, ScreenY, Xstart, YStart, Xend, Yend, NumColors, AdaptorType)
    'hash table's size - must be a prime number!
    CONST Table.Size = 7177

    DIM Prefix(Table.Size - 1), Suffix(Table.Size - 1), code(Table.Size - 1)
   
    'The shift table contains the powers of 2 needed by the
    'PutCode routine. This is done for speed. (much faster to
    'look up an integer than to perform calculations...)
    RESTORE ShiftTable
    FOR a = 0 TO 7: READ Shift(a): NEXT
   
    'MinX, MinY, MaxX, MaxY have the encoding window
    Minx = Xstart: MinY = YStart
    MaxX = Xend: MaxY = Yend
   
    'Open GIF output file
    GIFFile = FREEFILE                  'use next free file
    OPEN a$ FOR BINARY AS GIFFile
   
    'Put GIF87a header at beginning of file
    B$ = "GIF87a"
    PUT GIFFile, , B$
   
    'See how many colors are in this image...
    SELECT CASE NumColors
        CASE 2              'monochrome image
            BitsPixel = 1   '1 bit per pixel
            StartSize = 3   'first LZW code is 3 bits
            StartCode = 4   'first free code
            StartMax = 8    'maximum code in 3 bits

        CASE 16             '16 colors images
            BitsPixel = 4   '4 bits per pixel
            StartSize = 5   'first LZW code is 5 bits
            StartCode = 16  'first free code
            StartMax = 32   'maximum code in 5 bits
       
        CASE 256            '256 color images
            BitsPixel = 8   '8 bits per pixel
            StartSize = 9   'first LZW code is 9 bits
            StartCode = 256 'first free code
            StartMax = 512  'maximum code in 9 bits
    END SELECT
    'This following routine probably isn't needed- I've never
    'had to use the "ColorBits" variable... With the EGA, you
    'have 2 bits for Red, Green, & Blue. With VGA, you have 6 bits.
    SELECT CASE AdaptorType
        CASE 1
            ColorBits = 2               'EGA
        CASE 2
            ColorBits = 6               'VGA
    END SELECT
    
    PUT GIFFile, , ScreenX  'put screen's dimensions
    PUT GIFFile, , ScreenY
    'pack colorbits and bits per pixel
    a = 128 + (ColorBits - 1) * 16 + (BitsPixel - 1)
    PUT GIFFile, , a
    'throw a zero into the GIF file
    a$ = CHR$(0)
    PUT GIFFile, , a$
    'Get the RGB palette from the screen and put it into the file...
    SELECT CASE AdaptorType
    CASE 1
        STOP
        'EGA palette routine not implemented yet
    CASE 2
        OUT &H3C7, 0
        FOR a = 0 TO NumColors - 1
            'Note: a BIOS call could be used here, but then we have to use
            'the messy CALL INTERRUPT subs...
            R = (INP(&H3C9) * 65280) \ 16128 'C=R * 4.0476190(for 0-255)
            G = (INP(&H3C9) * 65280) \ 16128
            B = (INP(&H3C9) * 65280) \ 16128
            a$ = CHR$(R): PUT GIFFile, , a$
            a$ = CHR$(G): PUT GIFFile, , a$
            a$ = CHR$(B): PUT GIFFile, , a$
        NEXT
    END SELECT
   
    'write out an image descriptor...
    a$ = ","                        '"," is image seperator
    PUT GIFFile, , a$               'write it
    PUT GIFFile, , Minx             'write out the image's location
    PUT GIFFile, , MinY
    ImageWidth = (MaxX - Minx + 1)  'find length & width of image
    ImageHeight = (MaxY - MinY + 1)
    PUT GIFFile, , ImageWidth       'store them into the file
    PUT GIFFile, , ImageHeight
    a$ = CHR$(BitsPixel - 1)        '# bits per pixel in the image
    PUT GIFFile, , a$
   
    a$ = CHR$(StartSize - 1)        'store the LZW minimum code size
    PUT GIFFile, , a$
   
    'Initialize the vars needed by PutCode
    CurrentBit = 0: Char& = 0
    
    MaxCode = StartMax          'the current maximum code size
    CodeSize = StartSize        'the current code size
    ClearCode = StartCode       'ClearCode & EOF code are the
    EOFCode = StartCode + 1     '  first two entries
    StartCode = StartCode + 2   'first free code that can be used
    NextCode = StartCode        'the current code
   
    OutBuffer$ = STRING$(5000, 32)  'output buffer; for speedy disk writes
    a& = SADD(OutBuffer$)           'find address of buffer
    a& = a& - 65536 * (a& < 0)
    Oseg = VARSEG(OutBuffer$) + (a& \ 16)   'get segment + offset >> 4
    OAddress = a& AND 15                  'get address into segment
    OEndAddress = OAddress + 5000         'end of disk buffer
    OStartAddress = OAddress              'current location in disk buffer
    DEF SEG = Oseg

    GOSUB ClearTree                       'clear the tree & output a
    PutCode ClearCode                     '  clear code
   
    x = Xstart: y = YStart          'X & Y have the current pixel
    Prefix = GetByte                'the first pixel is a special case
    Done = FALSE                    'True when image is complete
    
    DO 'while there are more pixels to encode

        DO 'until we have a new string to put into the table

            IF Done THEN 'write out the last pixel, clear the disk buffer
                         'and fix up the last block so its count is correct
               
                PutCode Prefix  'write last pixel
                PutCode EOFCode 'send EOF code
               
                IF CurrentBit <> 0 THEN
                    PutCode 0       'flush out the last code...
                END IF
                PutByte 0

                OutBuffer$ = LEFT$(OutBuffer$, OAddress - OStartAddress)
                PUT GIFFile, , OutBuffer$
                a$ = ";" + STRING$(8, &H1A) 'the 8 EOF chars is not standard,
                                            'but many GIF's have them, so how
                                            'much could it hurt?
                PUT GIFFile, , a$
               
                a$ = CHR$(255 - BlockLength) 'correct the last block's count
                PUT GIFFile, LastLoc&, a$
               
                CLOSE GIFFile
                EXIT SUB
            ELSE 'get a pixel from the screen and see if we can find
                 'the new string in the table
                Suffix = GetByte
                GOSUB Hash        'is it there?
                IF Found = TRUE THEN Prefix = code(index) 'yup, replace the
                                    'prefix:suffix string with whatever
                                    'code represents it in the table
            END IF
        LOOP WHILE Found  'don't stop unless we find a new string
        
        PutCode Prefix    'output the prefix to the file
       
        Prefix(index) = Prefix  'put the new string in the table
        Suffix(index) = Suffix
        code(index) = NextCode  'we've got to keep track if what code this is!
       
        Prefix = Suffix         'Prefix=the last pixel pulled from the screen
       
        NextCode = NextCode + 1   'get ready for the next code
        IF NextCode = MaxCode + 1 THEN  'can an output code ever exceed
                                        'the current code size?
            'yup, increase the code size

            MaxCode = MaxCode * 2
            
        'Note: The GIF89a spec mentions something about a deferred clear
        'code. When the clear code is deferred, codes are not entered
        'into the hash table anymore. When the compression of the image
        'starts to fall below a certain threshold, the clear code is
        'sent and the hash table is cleared. The overall result is
        'greater compression, because the table is cleared less often.
        'This version of MakeGIF doesn't support this, because some GIF
        'decoders crash when they attempt to enter too many codes
        'into the string table.

            IF CodeSize = 12 THEN       'is the code size too big?
                PutCode ClearCode       'yup; clear the table and
                GOSUB ClearTree         'start over
                NextCode = StartCode
                CodeSize = StartSize
                MaxCode = StartMax


            ELSE
                CodeSize = CodeSize + 1 'just increase the code size if
            END IF                      'it's not too high( not > 12)
        END IF
        
    LOOP 'while we have more pixels
ClearTree:
    FOR a = 0 TO Table.Size - 1       'clears the hashing table
        Prefix(a) = -1                '-1 = invalid entry
        Suffix(a) = -1
        code(a) = -1
    NEXT
RETURN
'this is only one of a plethora of ways to search the table for
'a match! I used a binary tree first, but I switched to hashing
'cause it's quicker(perhaps the way I implemented the tree wasn't
'optimal... who knows!)
Hash:
    'hash the prefix & suffix(there are also many ways to do this...)
     '?? is there a better formula?
    index = ((Prefix * 256&) XOR Suffix) MOD Table.Size
    '
    '(Note: the table size(7177 in this case) must be a prime number, or
    'else there's a chance that the routine will hang up... hate when
    'that happens!)
    '
    'Calculate an offset just in case we don't find what we want on the
    'first try...
    IF index = 0 THEN    'can't have Table.Size-0 !
        Offset = 1
    ELSE
        Offset = Table.Size - index
    END IF
    
    DO 'until we (1) find an empty entry or (2) find what we're lookin for
                                  
       
        IF code(index) = -1 THEN  'is this entry blank?
            Found = FALSE         'yup- we didn't find the string
            RETURN
        'is this entry the one we're looking for?
        ELSEIF Prefix(index) = Prefix AND Suffix(index) = Suffix THEN
            'yup, congrats you now understand hashing!!!
    
            Found = TRUE
            RETURN
        ELSE
            'shoot! we didn't find anything interesting, so we must
            'retry- this is what slows hashing down. I could of used
            'a bigger table, that would of speeded things up a little
            'because this retrying would not happen as often...
            index = index - Offset
            IF index < 0 THEN   'too far down the table?
                'wrap back the index to the end of the table
                index = index + Table.Size
            END IF
        END IF
    LOOP
END SUB

SUB pal (c, R, G, B)
OUT &H3C8, c
OUT &H3C9, R
OUT &H3C9, G
OUT &H3C9, B
END SUB

'Puts a byte into the GIF file & also takes care of each block.
SUB PutByte (a) STATIC
    BlockLength = BlockLength - 1   'are we at the end of a block?
    IF BlockLength <= 0 THEN        ' yup,
        BlockLength = 255           'block length is now 255
        LastLoc& = LOC(1) + 1 + (OAddress - OStartAddress) 'remember the pos.
        BufferWrite 255                                    'for later fixing
    END IF
    BufferWrite a   'put a byte into the buffer
END SUB

'Puts an LZW variable-bit code into the output file...
SUB PutCode (a) STATIC
    Char& = Char& + a * Shift(CurrentBit) 'put the char were it belongs;
    CurrentBit = CurrentBit + CodeSize    ' shifting it to its proper place
    DO WHILE CurrentBit > 7               'do we have a least one full byte?
        PutByte Char& AND 255             ' yup! mask it off and write it out
        Char& = Char& \ 256               'shift the bit buffer right 8 bits
        CurrentBit = CurrentBit - 8       'now we have 8 less bits
    LOOP 'until we don't have a full byte
END SUB


