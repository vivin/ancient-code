'PCUBE.BAS by Matt Bross
'Homepage - http://www.GeoCities.Com/SoHo/7067/
'Email    - oh_bother@GeoCities.Com

DEFINT A-Z
REM RICH GELDREICH
DECLARE FUNCTION GetByte% ()
DECLARE SUB BufferWrite (a%)
DECLARE SUB MakeGif (a$, ScreenX%, ScreenY%, Xstart%, YStart%, Xend%, Yend%, NumColors%, AdaptorType%)
DECLARE SUB PutByte (a%)
DECLARE SUB PutCode (a%)

DECLARE SUB ScanLeftSide (X1%, Y1%, C1%, X2%, Y2%, C2%, PSide%)
DECLARE SUB ScanRightSide (X1%, Y1%, C1%, X2%, Y2%, C2%, PSide%)
DECLARE SUB ScanConvert (X1%, Y1%, C1%, X2%, Y2%, C2%, PSide%)
DECLARE SUB TextureMap (MinY%, MaxY%)

DECLARE SUB SetPal (c%, R%, G%, B%)
DECLARE SUB ReadPal (c%)

CONST TRUE% = -1, FALSE% = NOT TRUE, PI# = 22 / 7
CONST TOP = 0, LEFT = 1, RIGHT = 2, BOTTOM = 3

RANDOMIZE TIMER
'ON ERROR GOTO ErrorHandler
TYPE PointType
  X AS INTEGER       'X coordinate
  Y AS INTEGER       'Y coordinate
  Z AS INTEGER       'Z coordinate
  SHADE AS INTEGER   'shade of points
  Distance AS INTEGER'distance from the origin (0, 0, 0)
END TYPE
TYPE PolyType
  C1 AS INTEGER      'number of the first point of a polygon
  C2 AS INTEGER      'number of the second point of a polygon
  C3 AS INTEGER      'number of the third point of a polygon
  C4 AS INTEGER      'number of the forth point of a polygon
  culled AS INTEGER  'TRUE if the polygon isn't visible
  AvgZ AS INTEGER    'used to sort Z coordinates of polygons
  Tex AS INTEGER     'texture of the polygon
END TYPE
TYPE FillType
  X1 AS LONG         'starting Y coordinate
  X2 AS LONG         'ending Y coordinate
  Clr1 AS INTEGER    'starting color
  Clr2 AS INTEGER    'ending color
  PX1 AS INTEGER     'starting x coordinate of picture
  PX2 AS INTEGER     'ending x coordinate of picture
  PY1 AS INTEGER     'starting y coordinate of picture
  PY2 AS INTEGER     'ending y coordinate of picture
END TYPE
TYPE RGB
  R AS INTEGER
  G AS INTEGER
  B AS INTEGER
END TYPE
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%INFO%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SCREEN 0, 0, 0, 0: WIDTH 80, 25: CLS
PRINT "PCUBE.BAS by Matt Bross, 1997"
PRINT
PRINT "3D ANIMATION FOR THE QBASIC LANGUAGE"
PRINT "COPYRIGHT MATT BROSS.  USE FREELY AS"
PRINT "LONG AS CREDIT IS GIVEN."
PRINT
PRINT "--------CONTROLS--------"
PRINT "      0 - reset rotation"
PRINT "      5 - stop rotation"
PRINT "      S - reset location"
PRINT "      A - stop translation"
PRINT "   2, 8 - rotate around x axis"
PRINT "   4, 6 - rotate around y axis"
PRINT "   -, + - rotate around z axis"
PRINT "   I, K - translate vertically"
PRINT "   J, L - translate horizontally"
PRINT "   Z, X - translate depthwise"
PRINT "<SPACE> - reverse palette rotation"
PRINT "      V - random palette rotation"
PRINT " Esc - exit"
PRINT "----CASE INSENSITIVE----"
PRINT
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%VARIABLES%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SRX = 320: SRY = 200  'SRX, SRY = the screen's resolution
DX = SRX \ 2: DY = SRY \ 2 'DX, DY = center of screen
D& = 200: SD = 340 'viewer's distance from object
'%%%%%%%%%%%%%%%%%%%%%%%%%%GOURAUD SHADE ARRAYS%%%%%%%%%%%%%%%%%%%%%%%%%
REM $DYNAMIC
DIM SHARED Scan(199) AS FillType
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%GIF STUFF%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DIM SHARED OutBuffer$, OStartAddress, OAddress, OEndAddress, Oseg
DIM SHARED CodeSize, CurrentBit, Char&, BlockLength
DIM SHARED Shift(7) AS LONG
DIM SHARED X, Y, Minx, MinY, MaxX, MaxY, Done, GIFFile, LastLoc&
ShiftTable: DATA 1, 2, 4, 8, 16, 32, 64, 128
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%SIN TABLES%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
'SIN\COS table for 2 PI radians and then scale 1024 times for faster math.
DIM SHARED SINTABLE(459) AS LONG
FOR i = 0 TO 459 'COS(X) = SIN(X + 90)
  SINTABLE(i) = COS(i * PI / 180) * 1024 'use 1024 to shift binary digits
NEXT i                                   'over 6 bits.
'%%%%%%%%%%%%%%%%%%%%%%%%DOUBLE BUFFERING ARRAYS%%%%%%%%%%%%%%%%%%%%%%%%
DIM SHARED ScnBuf(32001)   'DIM array to serve as page in SCREEN 13
ScnBuf(0) = 320 * 8 'set length (x) * 8
ScnBuf(1) = 200     'set height (y)
DEF SEG = VARSEG(ScnBuf(2)) 'get segment of beginning of array data
Aofs& = VARPTR(ScnBuf(2))   'get offset of beginning of array data
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%LIGHT TABLES%%%%%%%%%%%%%%%%%%%%%%%%%%%%
'Location of light source in spherical coordinates
L1 = 70: L1 = L1 MOD 360: IF L1 < 0 THEN L1 = L1 + 360
L2 = 40: L2 = L2 MOD 360: IF L2 < 0 THEN L2 = L2 + 360
S1& = SINTABLE(L1 + 90): C1& = SINTABLE(L1)
S2& = SINTABLE(L2 + 90): C2& = SINTABLE(L2)
LX = S1& * C2& \ 8192: LY = S1& * S2& \ 8192 '8192 = 1024 * 1024 \ 128
LZ = C1& \ 8 '8 = 1024 \ 128
'find distance from light source to origin (0, 0, 0)
LightDistance& = SQR(LX * LX + LY * LY + LZ * LZ) * 8 '8 = 1024 \ 128
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%LOAD OBJECT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
RESTORE ObjectData
READ MaxPoints, MaxPolys
DIM Points(MaxPoints) AS PointType     'at start
DIM ScnPnts(MaxPoints) AS PointType    'after rotation
DIM SX(MaxPoints), SY(MaxPoints)       'points drawn to screen
FOR i = 1 TO MaxPoints 'Load and Center Points
  READ X, Y, Z: Points(i).X = X: Points(i).Y = Y: Points(i).Z = Z
  CX = CX + X: CY = CY + Y: CZ = CZ + Z
NEXT i
CX = CX \ MaxPoints: CY = CY \ MaxPoints: CZ = CZ \ MaxPoints
FOR i = 1 TO MaxPoints
  Points(i).X = Points(i).X - CX
  Points(i).Y = Points(i).Y - CY
  Points(i).Z = Points(i).Z - CZ
  X = Points(i).X: Y = Points(i).Y: Z = Points(i).Z
  'find distance from point to the origin (0, 0, 0)
  PointDistance& = SQR(X * X + Y * Y + Z * Z) * 1024&
  Points(i).Distance = PointDistance& * LightDistance& \ 1048576 '1024 * 1024
  ScnPnts(i).Distance = Points(i).Distance
NEXT i
'Load Polygon Data
DIM SHARED P(MaxPolys) AS PolyType 'stores all polygon data
FOR i = 1 TO MaxPolys: READ P(i).C1, P(i).C2, P(i).C3, P(i).C4: NEXT i

PRINT "Press a Key"
DO: LOOP UNTIL INKEY$ <> ""
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%SET PALETTE%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SCREEN 13: CLS
DIM R(1 TO 255), G(1 TO 255), B(1 TO 255)
DIM SHARED PalR AS RGB
RC = 1: GC = 1: BC = 1
FOR c = 0 TO 31
  i = c + c
  SetPal c, i, i, i            'gray
  SetPal c + 32, i, 0, 0       'red
  SetPal c + 64, i, i \ 2, 0   'orange
  SetPal c + 96, i, i, 0       'yellow
  SetPal c + 128, 0, i, 0      'green
  SetPal c + 160, 0, i, i      'cyan
  SetPal c + 192, 0, 0, i      'blue
  SetPal c + 224, i, 0, i      'purple
NEXT c
FOR i = 1 TO 255
  ReadPal i
  R(i) = PalR.R: G(i) = PalR.G: B = PalR.B
NEXT
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%LOAD TEXTURE%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DIM QTable(1 TO 3, 1 TO 3)
RESTORE QData

QData:
DATA  2, 3, 2
DATA  3, 1, 3
DATA  2, 3, 2

FOR j = 1 TO 3
  READ QTable(1, j), QTable(2, j), QTable(3, j)
NEXT

DIM SHARED PWidth%, PHeight%
PWidth% = 50: PHeight% = 50
DIM SHARED Texture(PWidth%, PHeight%)
'make random picture
FOR j = 0 TO PHeight%
  FOR i = 0 TO PWidth%
    PSET (i, j), RND * 10
  NEXT i
NEXT j

FOR i = 0 TO PWidth%
  Texture(i, 0) = POINT(i, 1)
  Texture(i, PHeight%) = POINT(i, PHeight%)
NEXT i
FOR j = 0 TO PHeight%
  Texture(0, j) = POINT(1, j)
  Texture(PWidth%, j) = POINT(PWidth%, j)
NEXT j

times = 6
'run through quantization array
FOR pass = 1 TO times
  FOR j = 1 TO PHeight% - 1
    FOR i = 1 TO PWidth% - 1
      c = POINT(i - 1, j - 1) * QTable(1, 1)
      c = c + POINT(i, j - 1) * QTable(2, 1)
      c = c + POINT(i + 1, j - 1) * QTable(3, 1)
      c = c + POINT(i - 1, j) * QTable(1, 2)
      c = c + POINT(i + 1, j) * QTable(3, 2)
      c = c + POINT(i - 1, j + 1) * QTable(1, 3)
      c = c + POINT(i, j + 1) * QTable(2, 3)
      c = c + POINT(i + 1, j + 1) * QTable(3, 3)
      c = c \ 8
      c = (c + Texture(i, j) * QTable(2, 2)) \ 2
      Texture(i, j) = c MOD 255
    NEXT i
  NEXT j

  FOR j = 1 TO PHeight% - 1
    Texture(0, j) = POINT(1, j)
    Texture(PWidth%, j) = POINT(PWidth% - 1, j)
  NEXT j
  FOR i = 1 TO PWidth% - 1
    Texture(i, 0) = POINT(i, 1)
    Texture(i, PHeight%) = POINT(i, PHeight% - 1)
  NEXT i

  Texture(0, 0) = POINT(1, 1)
  Texture(0, PHeight%) = POINT(1, PHeight% - 1)
  Texture(PWidth%, 0) = POINT(PWidth% - 1, 1)
  Texture(PWidth%, PHeight%) = POINT(PWidth% - 1, PHeight% - 1)

  FOR j = 1 TO PHeight% - 1
    FOR i = 1 TO PWidth% - 1
      PSET (i, j), Texture(i, j)
    NEXT i
  NEXT j
NEXT pass
'------------------------------>BEGIN MAIN LOOP<------------------------
t# = TIMER
DO
'*********************************GET KEY*******************************
DEF SEG = 0: K = INP(&H60): WHILE LEN(INKEY$): WEND
DEF SEG = VARSEG(ScnBuf(2))
SELECT CASE K
  CASE &H52 '0
    R1 = 0: R2 = 0: R3 = 0
    D1 = 0: D2 = 0: D3 = 0
  CASE &H4C '5
    D1 = 0: D2 = 0: D3 = 0
  CASE &H1E 'A
    MX = 0: MY = 0: MZ = 0
  CASE &H1F 'S
    MX = 0: MY = 0: MZ = 0
    MMX = 0: MMY = 0: MMZ = 0
  CASE &H50 '2
    D1 = D1 - 1
  CASE &H48 '8
    D1 = D1 + 1
  CASE &H4B '4
    D2 = D2 - 1
  CASE &H4D '6
    D2 = D2 + 1
  CASE &HD '+, =
    D3 = D3 - 1
  CASE &HC  '_, -
    D3 = D3 + 1
  CASE &H17 'I
    MY = MY + 1
  CASE &H25 'K
    MY = MY - 1
  CASE &H24 'J
    MX = MX + 1
  CASE &H26 'L
    MX = MX - 1
  CASE &H2C 'Z
    MZ = MZ + 1
  CASE &H2D 'D
    MZ = MZ - 1
  CASE 1 'ESC
    GOTO ShutDown
  CASE &H22 'G
    INPUT "SAVE SCREEN as .GIF"; S$
    IF LEFT$(UCASE$(S$), 1) = "Y" THEN
      INPUT "Input Filename:", file$
      IF RIGHT$(UCASE$(file$), 4) <> ".GIF" THEN file$ = file$ + ".GIF"
      PUT (0, 0), ScnBuf, PSET
      MakeGif file$, 320, 200, 0, 0, 319, 199, 256, 2
    END IF
  CASE &H39 'SPACE
    RC = -RC: GC = -GC: BC = -BC
  CASE &H2F 'V
    RC = INT(RND * 5) - 3
    GC = INT(RND * 5) - 3
    BC = INT(RND * 5) - 3
END SELECT
'*********************************ROTATION******************************
'keep SINes and COSines in array limits
R1 = (R1 + D1) MOD 360: IF R1 < 0 THEN R1 = 360 + R1
R2 = (R2 + D2) MOD 360: IF R2 < 0 THEN R2 = 360 + R2
R3 = (R3 + D3) MOD 360: IF R3 < 0 THEN R3 = 360 + R3
'********************************TRANSLATION****************************
MMX = MMX + MX: MMY = MMY + MY: MMZ = MMZ + MZ
'Keeps variables within limits of integers
IF MMX > 32767 THEN MMX = 32767
IF MMY > 250 THEN MMY = 250
IF MMZ > 120 THEN MMZ = 120
IF MMX < -32767 THEN MMX = -32767
IF MMY < -120 THEN MMY = -120
IF MMZ < -327 THEN MMZ = -327
'*******************************MOVE OBJECT*****************************
S1& = SINTABLE(R1 + 90): C1& = SINTABLE(R1)
S2& = SINTABLE(R2 + 90): C2& = SINTABLE(R2)
S3& = SINTABLE(R3 + 90): C3& = SINTABLE(R3)
FOR i = 1 TO MaxPoints
'rotate points around the Y axis
  TEMPX = (Points(i).X * C2& - Points(i).Z * S2&) \ 1024
  TEMPZ = (Points(i).X * S2& + Points(i).Z * C2&) \ 1024
'rotate points around the X axis
  ScnPnts(i).Z = (TEMPZ * C1& - Points(i).Y * S1&) \ 1024
  TEMPY = (TEMPZ * S1& + Points(i).Y * C1&) \ 1024
'rotate points around the Z axis
  ScnPnts(i).X = (TEMPX * C3& + TEMPY * S3&) \ 1024
  ScnPnts(i).Y = (TEMPY * C3& - TEMPX * S3&) \ 1024
'******************************CONVERT 3D TO 2D*************************
TEMPZ = ScnPnts(i).Z + MMZ - SD
IF TEMPZ < zero THEN  'only calculate points visible by viewer
  SX(i) = D& * (ScnPnts(i).X + MMX) \ TEMPZ + DX
  SY(i) = D& * (ScnPnts(i).Y + MMY) \ TEMPZ + DY
END IF
'*******************************SHADE POINTS****************************
X1 = ScnPnts(i).X: Y1 = ScnPnts(i).Y: Z1 = ScnPnts(i).Z
S = (X1 * LX + Y1 * LY + Z1 * LZ) \ ScnPnts(i).Distance + 128
  SHADE = S \ 8
  IF SHADE < 0 THEN SHADE = 0
  IF SHADE > 31 THEN SHADE = 31
  ScnPnts(i).SHADE = SHADE
NEXT
FOR i = 1 TO MaxPolys
'*************************CULL NON-VISIABLE POLYGONS********************
Coord1 = P(i).C1: Coord2 = P(i).C2
Coord3 = P(i).C3: Coord4 = P(i).C4
Z1 = ScnPnts(Coord1).Z: Z2 = ScnPnts(Coord2).Z
Z3 = ScnPnts(Coord3).Z: Z4 = ScnPnts(Coord4).Z
'******************FIND AVERAGE Z COORDINATE OF EACH POLYGON************
P(i).AvgZ = (Z1 + Z2 + Z3 + Z4) \ 4
NEXT i
'******************SORT POLGONS BY THEIR AVERAGE Z COORDINATE***********
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
'******************************DRAW POLYGONS****************************
'clear screen buffer.  Use a 320 by 200 BLOADable graphic for a background.
ERASE ScnBuf: REDIM ScnBuf(32001): ScnBuf(0) = 2560: ScnBuf(1) = SRY

FOR K = 1 TO MaxPolys

X1 = SX(P(K).C1): Y1 = SY(P(K).C1): C1 = ScnPnts(P(K).C1).SHADE
X2 = SX(P(K).C2): Y2 = SY(P(K).C2): C2 = ScnPnts(P(K).C2).SHADE
X3 = SX(P(K).C3): Y3 = SY(P(K).C3): C3 = ScnPnts(P(K).C3).SHADE
X4 = SX(P(K).C4): Y4 = SY(P(K).C4): C4 = ScnPnts(P(K).C4).SHADE

YMin = Y1: YMax = Y1
IF Y2 < YMin THEN YMin = Y2
IF Y2 > YMax THEN YMax = Y2
IF Y3 < YMin THEN YMin = Y3
IF Y3 > YMax THEN YMax = Y3
IF Y4 < YMin THEN YMin = Y4
IF Y4 > YMax THEN YMax = Y4

ScanConvert X1, Y1, C1, X2, Y2, C2, TOP
ScanConvert X2, Y2, C2, X3, Y3, C3, RIGHT
ScanConvert X3, Y3, C3, X4, Y4, C4, BOTTOM
ScanConvert X4, Y4, C4, X1, Y1, C1, LEFT

TextureMap YMin, YMax

NEXT K

PUT (0, 0), ScnBuf, PSET 'dump array to screen, like PCOPY

'rotate palette
FOR i = 1 TO 255
  SetPal i, R(i), G(i), B(i)
  R(i) = (R(i) + RC) MOD 63: IF R < 0 THEN R = R + 63
  G(i) = (G(i) + BC) MOD 63: IF G < 0 THEN G = G + 63
  B(i) = (B(i) + GC) MOD 63: IF B < 0 THEN B = B + 63
NEXT

F& = F& + 1

LOOP
'------------------------------>END MAIN LOOP<--------------------------
ShutDown:
DEF SEG
SCREEN 0, 0, 0, 0: WIDTH 80, 25: CLS
PRINT "PCUBE.BAS by Matt Bross, 1997"
PRINT : PRINT "Frames Per Second:"; F& / (TIMER - t#)
PRINT : PRINT "Free space"
PRINT " String Array   Stack"
PRINT STRING$(21, "-")
PRINT FRE(""); FRE(-1); FRE(-2)
SLEEP
END

ErrorHandler:
RESUME NEXT

ObjectData:
DATA 8, 6
DATA -50,  50,  50
DATA  50,  50,  50
DATA  50, -50,  50
DATA -50, -50,  50
DATA -50,  50, -50
DATA  50,  50, -50
DATA  50, -50, -50
DATA -50, -50, -50

DATA 4, 3, 2, 1
DATA 5, 6, 7, 8
DATA 3, 4, 8, 7
DATA 1, 2, 6, 5
DATA 5, 8, 4, 1
DATA 2, 3, 7, 6

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

    GetByte = POINT(X, Y)           'get the "byte"
    X = X + 1                       'increment X coordinate
    IF X > MaxX THEN                'are we too far?
        LINE (Minx, Y)-(MaxX, Y), 0 'a pacifier for impatient users
        X = Minx                    'go back to start
        Y = Y + 1                   'increment Y coordinate
        IF Y > MaxY THEN            'are we too far down?
            Done = TRUE             ' yup, flag it then
        END IF
    END IF
END FUNCTION

'
'-----------------------------------------------------------------------
'   PDS 7.1 & QB4.5 GIF Compression Routine v1.00 By Rich Geldreich 1992
'-----------------------------------------------------------------------
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
   
    X = Xstart: Y = YStart          'X & Y have the current pixel
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
 CurrentBit = CurrentBit + CodeSize  ' shifting it to its proper place
DO WHILE CurrentBit > 7              'do we have a least one full byte?
   PutByte Char& AND 255             ' yup! mask it off and write it out
   Char& = Char& \ 256               'shift the bit buffer right 8 bits
   CurrentBit = CurrentBit - 8       'now we have 8 less bits
    LOOP 'until we don't have a full byte
END SUB

SUB ReadPal (c)
  OUT &H3C7, c
  PalR.R = INP(&H3C9)
  PalR.G = INP(&H3C9)
  PalR.B = INP(&H3C9)
END SUB

SUB ScanConvert (X1%, Y1%, C1%, X2%, Y2%, C2%, PSide)

IF Y1% < 0 THEN Y1% = 0
IF Y1% > 199 THEN Y1% = 199
IF Y2% < 0 THEN Y2% = 0
IF Y2% > 199 THEN Y2% = 199

IF Y2% < Y1% THEN
  ScanLeftSide X2%, Y2%, C2%, X1%, Y1%, C1%, PSide
ELSE
  ScanRightSide X1%, Y1%, C1%, X2%, Y2%, C2%, PSide
END IF

END SUB

SUB ScanLeftSide (X1%, Y1%, C1%, X2%, Y2%, C2%, PSide)

YDelta = (Y2% - Y1%)
IF YDelta = 0 THEN YDelta = 1
Xadd& = (X2% - X1%) * 512& \ YDelta
CSlope = (C2% - C1%) * 512& \ YDelta

SELECT CASE PSide
CASE TOP
  PX& = (PWidth% - 1) * 512&
  PY& = 0
  Pxadd& = -PWidth% * 512& \ YDelta
  PYadd& = 0
CASE RIGHT
  PX& = PWidth% * 512&
  PY& = PHeight% * 512&
  Pxadd& = 0
  PYadd& = -PHeight% * 512& \ YDelta
CASE BOTTOM
  PX& = 0
  PY& = PHeight% * 512&
  Pxadd& = PWidth% * 512& \ YDelta
  PYadd& = 0
CASE LEFT
  PX& = 0
  PY& = 0
  Pxadd& = 0
  PYadd& = PHeight% * 512& \ YDelta
END SELECT

X& = X1% * 512&
CVAL& = C1% * 512&
FOR Y% = 0 TO YDelta
  Scan(Y1% + Y%).X1 = X&        'polygon x
  Scan(Y1% + Y%).PX1 = PX&      'picture x
  Scan(Y1% + Y%).PY1 = PY&      'picture y
  Scan(Y1% + Y%).Clr1 = CVAL&   'shade
  X& = X& + Xadd&               'Next polygon x
  PX& = PX& + Pxadd&            'Next picture x
  PY& = PY& + PYadd&            'Next picture y
  CVAL& = CVAL& + CSlope
NEXT
END SUB

SUB ScanRightSide (X1%, Y1%, C1%, X2%, Y2%, C2%, PSide)

YDelta = Y2% - Y1%: IF YDelta = 0 THEN YDelta = 1
Xadd& = (X2% - X1%) * 512& \ YDelta
CSlope = (C2% - C1%) * 512& \ YDelta

SELECT CASE PSide
CASE TOP
  PX& = 0
  PY& = 0
  Pxadd& = PWidth% * 512& \ YDelta
  PYadd& = 0
CASE RIGHT
  PX& = PWidth% * 512&
  PY& = 0
  Pxadd& = 0
  PYadd& = PHeight% * 512& \ YDelta
CASE BOTTOM
  PX& = PWidth% * 512&
  PY& = PHeight% * 512&
  Pxadd& = -PWidth% * 512& \ YDelta
  PYadd& = 0
CASE LEFT
  PX& = 0
  PY& = PHeight% * 512&
  Pxadd& = 0
  PYadd& = -PHeight% * 512& \ YDelta
END SELECT

X& = X1% * 512&
CVAL& = C1% * 512&
FOR Y% = 0 TO YDelta
  Scan(Y1% + Y%).X2 = X&      'polygon x
  Scan(Y1% + Y%).PX2 = PX&    'picture x
  Scan(Y1% + Y%).PY2 = PY&    'picture y
  Scan(Y1% + Y%).Clr2 = CVAL& 'shading value
  X& = X& + Xadd&             'Next polygon x
  PX& = PX& + Pxadd&          'Next picture x
  PY& = PY& + PYadd&          'Next picture y
  CVAL& = CVAL& + CSlope
NEXT Y%
END SUB

SUB SetPal (c, R, G, B)
OUT &H3C8, c
OUT &H3C9, R
OUT &H3C9, G
OUT &H3C9, B
END SUB

SUB TextureMap (MinY%, MaxY%)

IF MinY% > 199 THEN EXIT SUB
IF MaxY% < 0 THEN EXIT SUB
IF MinY% < 0 THEN MinY% = 0
IF MaxY% > 199 THEN MaxY% = 199

Y& = MinY% * 320& + VARPTR(ScnBuf(2))

DEF SEG = VARSEG(ScnBuf(2))

FOR Y% = MinY% TO MaxY%
 
  PolyX1% = Scan(Y%).X1 \ 512 'get left polygon x
  PX1& = Scan(Y%).PX1         'get left picture x
  PY1& = Scan(Y%).PY1         'get left picture y
  C1 = Scan(Y%).Clr1

  PolyX2% = Scan(Y%).X2 \ 512
  PX2& = Scan(Y%).PX2
  PY2& = Scan(Y%).PY2
  C2 = Scan(Y%).Clr2
 
  LineWidth% = PolyX2% - PolyX1%  'what is the width of this polygon line
  IF LineWidth% <> 0 THEN
    Pxadd& = (PX2& - PX1&) \ LineWidth%
    PYadd& = (PY2& - PY1&) \ LineWidth%
    CSlope = (C2 - C1) \ LineWidth%
  ELSE
    Pxadd& = PX2& - PX1&
    PYadd& = PY2& - PY1&
    CSlope = C2 - C1
  END IF

  CVAL& = C1
  FOR X% = PolyX1% TO PolyX2%
    Col% = CVAL& \ 512
    TX = (PX1& \ 512): IF TX < 0 THEN TX = 0
    TY = (PY1& \ 512): IF TY < 0 THEN TY = 0
    IF TX > PWidth% THEN TX = PWidth%
    IF TY > PHeight% THEN TY = PHeight%
    Tex% = Texture(TX, TY)
    ColPlusTex% = Col% + Tex%
    IF (ColPlusTex% AND 31) <= Col% THEN
      ColPlusTex% = (Tex% \ 32) * 32 + 31
    END IF
    
    IF X% > 0 AND X% < 319 THEN POKE (X% + Y&), ColPlusTex%
    PX1& = PX1& + Pxadd&
    PY1& = PY1& + PYadd&
    CVAL& = CVAL& + CSlope
  NEXT

  Y& = Y& + 320

NEXT
END SUB

