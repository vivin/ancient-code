

'The QBasic Page
'http://qbasic.com
'
'This is the complete txtreng.bas file. I switched over to NetScape's

'USENET thingy, and it let me attach the whole file. Sorry about all the

'other pieces, it took me a while to think of trying NS.

'

'Anyway, this engine is slow, but it does add simple textures. I'm sure

'some intelligent person out there could speed it up, but that person

'sure as hell ain't me.

'

'I in no way am responsible for the engine itself; all I added was the

'textures(and I changed the background a bit, but, it's still mostly

'someone else's freeware program).

'

'Victor Woeltjen, "Pissant"

'



' note from Peter Cooper (peco@trenham.demon.co.uk)

' -  this is very very slow but it works

'    compile it for speed, you can download compiled version from my

'    web site





DECLARE SUB CreateBackground ()

DECLARE SUB GetKeypress (Keycode%)



CONST UpArrow = -72, DnArrow = -80, LArrow = -75, RArrow = -77



RANDOMIZE TIMER

DIM Grid%(1 TO 12, 1 TO 12)

DIM STable!(0 - 31 TO 360 + 32), CTable!(0 - 31 TO 360 + 32)

DIM Textures(1 TO 15, 1 TO 4, 1 TO 30)

PX! = 9: PY! = 11    'the starting coordinates of the player's location

Stride! = 3          'the distance covered in one "step" by the player

                     '   by pressing the up or down arrow keys

Heading% = 0         'the heading of the player (in degrees)

Turn% = 5            'number of degrees of rotation produced by

                     '   pressing the right or left arrow keys



FOR Y% = 1 TO 12

  FOR X% = 1 TO 12

    READ Grid%(X%, Y%)

  NEXT

NEXT



FOR TexturesL = 1 TO 15

FOR TexY% = 1 TO 30

FOR TexX% = 1 TO 4

    READ Textures(TexturesL, TexX%, TexY%)

NEXT

NEXT

NEXT



Factor! = (ATN(1) * 8) / 360

FOR A% = 0 TO 359

  Angle! = CSNG(A%) * Factor!

  STable!(A%) = SIN(Angle!) * .1

  CTable!(A%) = COS(Angle!) * .1

NEXT

FOR A% = -31 TO -1

  STable!(A%) = STable!(A% + 360)

  CTable!(A%) = CTable!(A% + 360)

NEXT

FOR A% = 360 TO 360 + 32

  STable!(A%) = STable!(A% - 360)

  CTable!(A%) = CTable!(A% - 360)

NEXT



SCREEN 7, , 0, 0

PRINT

PRINT

PRINT "            RAYCASTER DEMO"

PRINT

PRINT "      UP ARROW........Move Forward"

PRINT "      DOWN ARROW......Move Backward"

PRINT "      RIGHT ARROW.....Turn Right"

PRINT "      LEFT ARROW......Turn Left"

PRINT

PRINT

PRINT "            Please wait...";



CALL CreateBackground

BEEP

LOCATE , 1

PRINT "        Press any key to begin...";

DO WHILE LEN(INKEY$): LOOP: DO UNTIL LEN(INKEY$): LOOP



ViewPg% = 0: WorkPg% = 1: BG1% = 2: BG2% = 3

SCREEN , , WorkPg%, ViewPg%

GOSUB ComputeView



DO 'Main loop

CALL GetKeypress(Keycode%)

SELECT CASE Keycode%

  CASE LArrow

    Heading% = (Heading% + Turn%) MOD 360

    GOSUB ComputeView

  CASE RArrow

    Heading% = (Heading% + (360 - Turn%)) MOD 360

    GOSUB ComputeView

  CASE UpArrow

    NewPX! = PX! - (STable!(Heading%) * Stride!)

    NewPY! = PY! - (CTable!(Heading%) * Stride!)

    IF Grid%(NewPX!, NewPY!) = 0 THEN

      PX! = NewPX!: PY! = NewPY!

      GOSUB ComputeView

    ELSE 'tried to walk through a wall

      SOUND 80, 1

    END IF

  CASE DnArrow

    NewPX! = PX! + (STable!(Heading%) * Stride!)

    NewPY! = PY! + (CTable!(Heading%) * Stride!)

    IF Grid%(NewPX!, NewPY!) = 0 THEN

      PX! = NewPX!: PY! = NewPY!

      GOSUB ComputeView

    ELSE 'tried to walk through a wall

      SOUND 80, 1

    END IF

  CASE 27

    EXIT DO

  CASE ELSE

    BEEP

  END SELECT

LOOP

SCREEN 0: WIDTH 80, 25

END



ComputeView:

PCOPY BG1%, WorkPg%: SWAP BG1%, BG2%

X1% = 0

FOR A% = Heading% + 32 TO Heading% - 31 STEP -1

  StepX! = STable!(A%): StepY! = CTable!(A%)

  XX! = PX!: YY! = PY!

  L% = 0

  DO

    XX! = XX! - StepX!: YY! = YY! - StepY!

    L% = L% + 1

    K% = Grid%(XX!, YY!)

  LOOP UNTIL K%

  DD% = 900 \ L%

  H% = DD% + DD%

  DT% = 100 - DD%

  ymoves = 0

  FOR Y = DT% TO DT% + H% STEP (H%) / 30

  ymoves = ymoves + 1

  FOR X = 1 TO 4

    IF ymoves > 30 THEN ymoves = 30

    LINE (X1% + X, DT% + ((ymoves - 1) * (H%) / 30))-(X1% + X + 1, DT% + ((ymoves) * (H%) / 30)), Textures(K%, X, ymoves), B

  NEXT

  NEXT

  'LINE (X1%, DT%)-STEP(4, H%), K%, BF

  X1% = X1% + 5

NEXT

SWAP WorkPg%, ViewPg%

SCREEN , , WorkPg%, ViewPg%

RETURN



' Level data

DATA  9,  1,  9,  1,  1,  1,  1,  1,  1,  1,  9,  1

DATA  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  9

DATA  9,  0,  2, 10,  0,  0,  0,  0,  0, 0,  0,  1

DATA  1,  0, 10,  2,  0,  0,  0,  0,  0,  0,  0,  9

DATA  9,  0,  0,  0,  0,  5,  0,  0,  0, 0,  0,  1

DATA  1,  0,  0,  0,  0,  4,  0,  0,  0,  0,  0,  9

DATA  9,  0,  0,  0,  0,  6,  0,  0,  0,  0,  0,  1

DATA  1,  0, 13,  0,  0,  4,  0,  0,  0, 12,  0,  9

DATA  9,  0,  5,  0,  0,  5,  0,  0,  0,  0,  0,  1

DATA  1,  0, 13,  0,  0,  0,  0,  0,  0, 12,  0,  9

DATA  9,  0,  5,  0,  0,  0,  0,  0,  0,  4,  0,  1

DATA  1,  9,  1,  9,  1,  9,  1,  9,  1,  9,  1,  9



'Texture data

'Text. 1

DATA 0, 8, 0, 0

DATA 8, 7, 8,

DATA 7, 7, 7, 8

DATA 7, 7, 7, 8

DATA 8, 8, 8, 0

DATA 8, 7,8,0

DATA 8, 7,8,0

DATA 8, 7,8,0

DATA 8, 7,8,0

DATA 8, 7,8,0

DATA 8, 7,8,0

DATA 8, 7,8,0

DATA 8, 8,8,8

DATA 7, 7,7,7

DATA 8, 8,8,8

DATA 8, 7,8,0

DATA 8, 7,8,0

DATA 8, 7,8,0

DATA 8, 7,8,0

DATA 8, 7,8,0

DATA 8, 7,8,0

DATA 8, 7,8,0

DATA 8, 7,8,0

DATA 8, 7,8,0

DATA 8, 7, 8, 0

DATA 8, 7, 8,2

DATA 8, 2, 8, 2

DATA 2, 10, 2, 2

DATA 2, 2, 10, 2

DATA 2, 2, 2, 2

'Text. 2

DATA 8, 8, 8, 8

DATA 8, 8, 8, 8

DATA 8, 7, 8, 7

DATA 7, 7, 7, 7

DATA 7, 15, 7, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 7, 15, 7, 15

DATA 7, 7, 7, 7

DATA 8, 7, 8, 7

DATA 8, 8, 8, 8

DATA 8, 8, 8, 8

'Text. 3

DATA 8, 8, 8, 8

DATA 8, 8, 8, 8

DATA 8, 7, 8, 7

DATA 7, 7, 7, 7

DATA 7, 15, 7, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 7, 15, 7, 15

DATA 7, 7, 7, 7

DATA 8, 7, 8, 7

DATA 8, 8, 8, 8

DATA 8, 8, 8, 8

'Text. 4

DATA 4, 4, 4, 4

DATA 4, 8, 4, 8

DATA 8, 7, 8, 7

DATA 7, 7, 7, 7

DATA 7, 15, 7, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 7, 15, 7, 15

DATA 7, 7, 7, 7

DATA 8, 7, 8, 7

DATA 4, 8, 4, 8

DATA 4, 4, 4, 4

'Text. 5

DATA 4, 8, 4, 8

DATA 8, 8, 8, 8

DATA 8, 7, 8, 7

DATA 7, 7, 7, 7

DATA 7, 15, 7, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 7, 15, 7, 15

DATA 7, 7, 7, 7

DATA 8, 7, 8, 7

DATA 8, 8, 8, 8

DATA 8, 4, 8, 4

'Text. 6

DATA 4, 6, 4, 6

DATA 4, 4, 4, 4

DATA 8, 4, 8, 4

DATA 7, 7, 7, 7

DATA 7, 15, 7, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 7, 15, 7, 15

DATA 7, 7, 7, 7

DATA 4, 7, 4, 7

DATA 4, 4, 4, 4

DATA 4, 6, 4, 6

'Text. 7

DATA 8, 8, 8, 8

DATA 8, 8, 8, 8

DATA 8, 7, 8, 7

DATA 7, 7, 7, 7

DATA 7, 15, 7, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 7, 15, 7, 15

DATA 7, 7, 7, 7

DATA 8, 7, 8, 7

DATA 8, 8, 8, 8

DATA 8, 8, 8, 8

'Text. 8

DATA 8, 8, 8, 8

DATA 8, 8, 8, 8

DATA 8, 7, 8, 7

DATA 7, 7, 7, 7

DATA 7, 15, 7, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 7, 15, 7, 15

DATA 7, 7, 7, 7

DATA 8, 7, 8, 7

DATA 8, 8, 8, 8

DATA 8, 8, 8, 8

'Text. 9

DATA 8, 8, 8, 8

DATA 8, 8, 8, 8

DATA 8, 7, 8, 7

DATA 7, 7, 7, 7

DATA 7, 15, 7, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 7, 15, 7, 15

DATA 7, 7, 7, 7

DATA 8, 7, 8, 7

DATA 8, 8, 8, 8

DATA 8, 8, 8, 8

'Text. 10

DATA 8, 8, 8, 8

DATA 8, 8, 8, 8

DATA 8, 7, 8, 7

DATA 7, 7, 7, 7

DATA 7, 15, 7, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 7, 15, 7, 15

DATA 7, 7, 7, 7

DATA 8, 7, 8, 7

DATA 8, 8, 8, 8

DATA 8, 8, 8, 8

'Text. 11

DATA 8, 8, 8, 8

DATA 8, 8, 8, 8

DATA 8, 7, 8, 7

DATA 7, 7, 7, 7

DATA 7, 15, 7, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 7, 15, 7, 15

DATA 7, 7, 7, 7

DATA 8, 7, 8, 7

DATA 8, 8, 8, 8

DATA 8, 8, 8, 8

'Text. 12

DATA 8, 8, 8, 8

DATA 8, 8, 8, 8

DATA 8, 7, 8, 7

DATA 7, 7, 7, 7

DATA 7, 15, 7, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 7, 15, 7, 15

DATA 7, 7, 7, 7

DATA 8, 7, 8, 7

DATA 8, 8, 8, 8

DATA 8, 8, 8, 8

'Text. 13

DATA 8, 8, 8, 8

DATA 8, 8, 8, 8

DATA 8, 7, 8, 7

DATA 7, 7, 7, 7

DATA 7, 15, 7, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 7, 15, 7, 15

DATA 7, 7, 7, 7

DATA 8, 7, 8, 7

DATA 8, 8, 8, 8

DATA 8, 8, 8, 8

'Text. 14

DATA 8, 8, 8, 8

DATA 8, 8, 8, 8

DATA 8, 7, 8, 7

DATA 7, 7, 7, 7

DATA 7, 15, 7, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 7, 15, 7, 15

DATA 7, 7, 7, 7

DATA 8, 7, 8, 7

DATA 8, 8, 8, 8

DATA 8, 8, 8, 8

'Text. 15

DATA 8, 8, 8, 8

DATA 8, 8, 8, 8

DATA 8, 7, 8, 7

DATA 7, 7, 7, 7

DATA 7, 15, 7, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 15, 15, 15, 15

DATA 7, 15, 7, 15

DATA 7, 7, 7, 7

DATA 8, 7, 8, 7

DATA 8, 8, 8, 8

DATA 8, 8, 8, 8



DEFINT A-Z

DEFSNG A-Z



SUB CreateBackground



SCREEN , , 2, 0: CLS

' Sky

LINE (0, 0)-(319, 99), 0, BF

' Moon (Prev. a Sun)

CIRCLE (50, 30), 10, 8: PAINT (50, 30), 14, 8

'CIRCLE (53, 27), 2, 8: PAINT (53, 27), 8, 8

CIRCLE (43, 29), 10, 0: PAINT (43, 29), 0, 0

' Clouds moved after moon so they would overlap it

FOR Cnt% = 1 TO 10

  X% = INT(RND * 320)

  Y% = INT(RND * 80) + 10

  R% = INT(RND * 50)

  AR! = RND / 10

  CIRCLE (X%, Y%), R%, 15, , , AR!: PAINT (X%, Y%), 15

NEXT



 'Building (gray)

LINE (200, 20)-(220, 15), 8

LINE (220, 15)-(240, 20), 8

LINE (200, 20)-(200, 99), 8

LINE (240, 20)-(240, 99), 8

LINE (200, 99)-(240, 99), 8

PAINT (220, 50), 8

FOR Cnt% = 1 TO 20 ' Lights

  PSET (INT(RND * 38 + 201), INT(RND * 80 + 20)), 14

NEXT

LINE (200, 20)-(220, 15), 0 ' Building (border)

LINE (220, 15)-(240, 20), 0

LINE (219, 15)-(219, 99), 0

LINE (200, 20)-(200, 99), 0

LINE (240, 20)-(240, 99), 0

PCOPY 2, 3

FOR Y% = 100 TO 199

  FOR X% = 0 TO 319

    IF RND AND 1 THEN PSET (X%, Y%), 8

  NEXT

NEXT



SCREEN , , 3, 0

FOR Y% = 100 TO 199

  FOR X% = 0 TO 319

    IF RND AND 1 THEN PSET (X%, Y%), 8

  NEXT

NEXT



SCREEN , , 0, 0



END SUB



DEFINT A-Z

SUB GetKeypress (Keycode%)

DO: Ky$ = INKEY$: LOOP UNTIL LEN(Ky$)

Keycode% = ASC(Ky$): IF Keycode% = 0 THEN Keycode% = -ASC(MID$(Ky$, 2, 1))



END SUB



