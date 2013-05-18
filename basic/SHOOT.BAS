REM Define Target Objects and Main Sprites
REM The Target Objects are:
REM 1. Disk
REM 2. Target Board
REM 3. FunnyFace
REM 4. Ball
REM 5. Bell
REM The Main Sprites are:
REM 1. Gun
REM 2. Bullet
'----------------------------------------------------------------------------'
REM Allocate Memory for Animation Objects

DIM Gun(1000)
DIM Bullet(100)
DIM Disk(1000)
DIM TargetBoard(1000)
DIM FunnyFace(500)
DIM Ball(500)
DIM Bell(1000)

'----------------------------------------------------------------------------'

SCREEN 9
REM Draw Gun

PSET (320, 160), 1
DRAW "r60h25u20l10d20g25"
PAINT (350, 140), 1, 1
CIRCLE (330, 165), 5, 7
PAINT (330, 165), 7, 7
CIRCLE (370, 165), 5, 7
PAINT (370, 165), 7, 7
PSET (350, 140), 2
DRAW "f5l10e5"
PAINT (352, 143), 2, 2
PSET (340, 150), 7
DRAW "r20d8l20u8"
PAINT (354, 154), 0, 7
PSET (340, 154), 2
DRAW "r5e2f4e2r7"
CIRCLE (331, 155), 4, 4
PAINT (331, 155), 4, 4
CIRCLE (369, 155), 4, 4
PAINT (369, 155), 4, 4
GET (305, 105)-(395, 180), Gun
'----------------------------------------------------------------------------'
REM Draw Bullet
CLS
CIRCLE (320, 160), 5, 4
PAINT (320, 160), 4
GET (310, 150)-(330, 170), Bullet

'----------------------------------------------------------------------------'
REM Draw Disk
CLS
PSET (320, 160), 8
DRAW "r60u30l5u10r5u10l60d50"
PAINT (350, 120), 8, 8
CIRCLE (350, 126), 8, 0
PAINT (350, 126), 0, 0
PSET (346, 140), 0
DRAW "d10"
PSET (352, 140), 0
DRAW "d10"
CIRCLE (349, 139), 3, 0, , 3.14159
CIRCLE (349, 150), 3, 0, 3.14159
PAINT (349, 140), 0, 0
GET (310, 95)-(390, 170), Disk

'----------------------------------------------------------------------------'
REM Draw Target Board
CLS
CIRCLE (320, 160), 40, 4
PAINT (320, 160), 4, 4
CIRCLE (320, 160), 30, 1
PAINT (320, 160), 1, 1
CIRCLE (320, 160), 20, 2
PAINT (320, 160), 2, 2
CIRCLE (320, 160), 10, 14
PAINT (320, 160), 14, 14
GET (275, 125)-(367, 195), TargetBoard

'----------------------------------------------------------------------------'
REM Draw Funny Face
CLS
CIRCLE (320, 160), 30, 14
PAINT (320, 160), 14, 14
CIRCLE (310, 150), 5, 0
PAINT (310, 150), 0, 0
CIRCLE (330, 150), 5, 0
PAINT (330, 150), 0, 0
CIRCLE (320, 160), 20, 0, 3.141592654#
GET (285, 135)-(355, 185), FunnyFace

'----------------------------------------------------------------------------'
REM Draw Ball
CLS
c = 1
FOR i = 1 TO 30
CIRCLE (320, 160), i, c
c = c + 1
IF c > 15 THEN c = 1
NEXT i
GET (285, 135)-(355, 185), Ball

'----------------------------------------------------------------------------'
REM Draw Bell
CLS
CIRCLE (320, 160), 20, 14, , 3.14159654#
PSET (300, 160), 14
DRAW "ta-8d30"
PSET (340, 160), 14
DRAW "ta8d30"
CIRCLE (288, 190), 5, 14, 4.7123
CIRCLE (351, 190), 5, 14, 3, 5
PSET (290, 194), 14
DRAW "ta0r58"
CIRCLE (320, 140), 5, 14
PAINT (320, 140), 14, 14
PAINT (320, 180), 14, 14
GET (275, 130)-(365, 200), Bell

'----------------------------------------------------------------------------'
'----------------------------------------------------------------------------'
REM Opening Screen
CLS

INPUT "Press C NOW if you want to skip the Introduction.", A$
IF A$ = "C" OR A$ = "c" THEN GOTO Menu ELSE GOTO Intro

Intro:
SCREEN 13
FOR c = 16 TO 31
LOCATE 12, 10
COLOR c
PRINT "VSP Productions presents..."
PLAY "P28"
NEXT c
PLAY "p1"
FOR c = 31 TO 16 STEP -1
PLAY "P28"
LOCATE 12, 10
COLOR c
PRINT "VSP Productions presents..."
NEXT c
FOR c = 16 TO 31
LOCATE 12, 17
COLOR c
PRINT "A VSP Game..."
PLAY "P28"
NEXT c

PLAY "p1"
FOR c = 31 TO 16 STEP -1
LOCATE 12, 17
COLOR c
PLAY "P28"
PRINT "A VSP Game..."
NEXT c
FOR c = 16 TO 100
LOCATE 12, 6
COLOR c
PRINT "S H O O T I N G  G A L L E R Y"
PLAY "P28"
LOCATE 13, 6
PRINT "______________________________"
NEXT c
PLAY "p1"
FOR c = 100 TO 16 STEP -1
LOCATE 12, 6
COLOR c
PRINT "S H O O T I N G  G A L L E R Y"
LOCATE 13, 6
PRINT "______________________________"
PLAY "p64"
NEXT c
FOR c = 16 TO 31
LOCATE 12, 14
COLOR c
PRINT "Programmed by..."
PLAY "p28"
NEXT c
PLAY "p1"
FOR c = 31 TO 16 STEP -1
LOCATE 12, 14
COLOR c
PRINT "Programmed by..."
PLAY "p28"
NEXT c
CLS
c = 15
x = 0
y = 10
PSET (x, y), 15
DRAW "f10e10"
PSET (x + 25, y), 15
DRAW "d10"
PSET (x + 30, y), 15
DRAW "f10e10"
PSET (x + 55, y), 15
DRAW "d10"
PSET (x + 60, y), 15
DRAW "d10u10f10u10"
PSET (x + 85, y), 15
DRAW "r10l10d5r10d5l10"
PSET (x + 110, y), 15
DRAW "d10u10r5d5l5"
PSET (x + 115, y + 10), 15
DRAW "e10f10h5l9"
PSET (x + 140, y), 15
DRAW "d10r5"
PSET (x + 150, y), 15
DRAW "d10"
PSET (x + 155, y + 10), 15
DRAW "e10f10h5l9"
PSET (x + 180, y), 15
DRAW "d10u10l5r10"
PSET (x + 190, y), 15
DRAW "d10u5r5u5d10"
FOR i = 1 TO 150000
NEXT i
FOR c = 16 TO 115
PSET (x, y), c
DRAW "f10e10"
PSET (x + 25, y), c
DRAW "d10"
PSET (x + 30, y), c
DRAW "f10e10"
PSET (x + 55, y), c
DRAW "d10"
PSET (x + 60, y), c
DRAW "d10u10f10u10"
PSET (x + 85, y), c
DRAW "r10l10d5r10d5l10"
PSET (x + 110, y), c
DRAW "d10u10r5d5l5"
PSET (x + 115, y + 10), c
DRAW "e10f10h5l9"
PSET (x + 140, y), c
DRAW "d10r5"
PSET (x + 150, y), c
DRAW "d10"
PSET (x + 155, y + 10), c
DRAW "e10f10h5l9"
PSET (x + 180, y), c
DRAW "d10u10l5r10"
PSET (x + 190, y), c
DRAW "d10u5r5u5d10"
PLAY "p64"
x = x + 1
y = y + 1
NEXT c
PSET (x, y), 14
DRAW "f10e10"
PSET (x + 25, y), 14
DRAW "d10"
PSET (x + 30, y), 14
DRAW "f10e10"
PSET (x + 55, y), 14
DRAW "d10"
PSET (x + 60, y), 14
DRAW "d10u10f10u10"
PSET (x + 85, y), 14
DRAW "r10l10d5r10d5l10"
PSET (x + 110, y), 14
DRAW "d10u10r5d5l5"
PSET (x + 115, y + 10), 14
DRAW "e10f10h5l9"
PSET (x + 140, y), 14
DRAW "d10r5"
PSET (x + 150, y), 14
DRAW "d10"
PSET (x + 155, y + 10), 14
DRAW "e10f10h5l9"
PSET (x + 180, y), 14
DRAW "d10u10l5r10"
PSET (x + 190, y), 14
DRAW "d10u5r5u5d10"
FOR i = 1 TO 250000
NEXT i
c = 0
FOR i = 1 TO 99
PSET (x, y), c
DRAW "f10e10"
PSET (x + 25, y), c
DRAW "d10"
PSET (x + 30, y), c
DRAW "f10e10"
PSET (x + 55, y), c
DRAW "d10"
PSET (x + 60, y), c
DRAW "d10u10f10u10"
PSET (x + 85, y), c
DRAW "r10l10d5r10d5l10"
PSET (x + 110, y), c
DRAW "d10u10r5d5l5"
PSET (x + 115, y + 10), c
DRAW "e10f10h5l9"
PSET (x + 140, y), c
DRAW "d10r5"
PSET (x + 150, y), c
DRAW "d10"
PSET (x + 155, y + 10), c
DRAW "e10f10h5l9"
PSET (x + 180, y), c
DRAW "d10u10l5r10"
PSET (x + 190, y), c
DRAW "d10u5r5u5d10"
PLAY "p64"
x = x - 1
y = y - 1
NEXT i

'----------------------------------------------------------------------------'
REM Menu
Menu:
CLS
SCREEN 13
x = 0
y = 0
FOR c = 16 TO 31
PSET (x, y), c
DRAW "r320"
PLAY "p32"
y = y + 1
NEXT c
y = 193
FOR c = 16 TO 31
PSET (x, y), c
DRAW "r320"
PLAY "p32"
y = y - 1
NEXT c
x = 0
y = 16
FOR c = 31 TO 16 STEP -1
PSET (x, y), c
DRAW "d161"
PLAY "p32"
x = x + 1
NEXT c
x = 319
y = 16
FOR c = 31 TO 16 STEP -1
PSET (x, y), c
DRAW "d161"
PLAY "p32"
x = x - 1
NEXT c
PSET (100, 45), 12
DRAW "d110r110u130l110d120"
FOR i = 16 TO 31
COLOR i
LOCATE 5, 17
PRINT "M E N U"
LOCATE 6, 17
PRINT "_______"
LOCATE 9, 18
PRINT "Start"
LOCATE 12, 16
PRINT "---------"
LOCATE 15, 18
PRINT "Help?"
LOCATE 18, 16
PRINT "Quit Game"
PLAY "p28"
NEXT i
r = 9
PlayerChoice:
y$ = INKEY$
IF y$ = "8" THEN GOTO CC
IF y$ = "5" THEN GOTO CC2
IF y$ = "S" OR y$ = "s" THEN GOTO Selection ELSE GOTO PlayerChoice
CC:
IF r = 9 THEN LOCATE r, 18: COLOR 15: PRINT "Start"
IF r = 12 THEN LOCATE r, 16: COLOR 15: PRINT "---------"
IF r = 15 THEN LOCATE r, 18: COLOR 15: PRINT "Help?"
IF r = 18 THEN LOCATE r, 16: COLOR 15: PRINT "Quit Game"
IF r = 9 THEN r = r + 9: GOTO PrintOut:  ELSE r = r - 3: GOTO PrintOut

CC2:
IF r = 9 THEN LOCATE r, 18: COLOR 15: PRINT "Start"
IF r = 12 THEN LOCATE r, 16: COLOR 15: PRINT "---------"
IF r = 15 THEN LOCATE r, 18: COLOR 15: PRINT "Help?"
IF r = 18 THEN LOCATE r, 16: COLOR 15: PRINT "Quit Game"
IF r = 18 THEN r = r - 9: GOTO PrintOut:  ELSE r = r + 3: GOTO PrintOut

PrintOut:
IF r = 9 THEN LOCATE r, 18: COLOR 9: PRINT "Start": GOTO PlayerChoice
IF r = 12 THEN LOCATE r, 16: COLOR 9: PRINT "---------": GOTO PlayerChoice
IF r = 15 THEN LOCATE r, 18: COLOR 9: PRINT "Help?": GOTO PlayerChoice
IF r = 18 THEN LOCATE r, 16: COLOR 9: PRINT "Quit Game": GOTO PlayerChoice
GOTO PlayerChoice

Selection:
IF r = 9 THEN GOTO StartGame
IF r = 15 THEN GOTO Help
IF r = 18 THEN GOTO ShowRights
GOTO PlayerChoice

'----------------------------------------------------------------------------'
REM Help
Help:
CLS
SCREEN 9
LOCATE 1, 35
PRINT "Help"
LOCATE 2, 35
PRINT "----"
LOCATE 5, 1
PRINT "Shooting Gallery(TM) is a  game  of  aim  and  skill. Your aim  is to  shoot theobjects that move across the screens. You  are  awarded 10 points for every hit.Press S in the menu to choose something. F is to shoot. Press X  to exit anytimein the game."
PUT (5, 125), Gun
LOCATE 12, 15
PRINT "This is your gun."
PUT (400, 150), Bullet
LOCATE 12, 55
PRINT "This is your bullet."
PUT (10, 200), TargetBoard
LOCATE 16, 15
PRINT "This is a Target Board. - 10 pts"
PUT (400, 180), Disk
LOCATE 16, 61
PRINT "This is a Disk. - 20 pts"
PUT (12, 265), FunnyFace
LOCATE 21, 15
PRINT "This is a Funny Face. - 30 pts"
PUT (405, 260), Ball
LOCATE 21, 61
PRINT "This is a ball. - 20 pts"
LOCATE 24, 1
INPUT "Press ENTER to continue...", A
CLS
PUT (300, 100), Bell
LOCATE 15, 37
PRINT "This is a Bell. - 15 pts"
INPUT "Press ENTER to continue...", A
GOTO Menu
'----------------------------------------------------------------------------'
StartGame:
IF dodo = 1 THEN GOTO TargetSelect
GunX = 200
GunY = 229
dodo = 1
TargetSelect:
TargetNo = INT(RND * 5) + 1
IF TargetNo = 1 THEN GOTO ShootDisk
IF TargetNo = 2 THEN GOTO ShootTargetBoard
IF TargetNo = 3 THEN GOTO ShootFunnyFace
IF TargetNo = 4 THEN GOTO ShootBall
IF TargetNo = 5 THEN GOTO ShootBell
'----------------------------------------------------------------------------'
ShootDisk: 'Collision Check
SCREEN 9
LOCATE 25, 2
PRINT "Score:"; Score
LOCATE 24, 26
PRINT "Shooting Gallery(TM) (C) 1997--->"
PUT (GunX, GunY), Gun, PSET
DiskMovt:
k = 0
FOR DiskX = 500 TO 0 STEP -1
   PUT (DiskX, 0), Disk, PSET
   FOR i = 1 TO 250
   NEXT i
   IF k = 1 THEN GOTO NextBulletYDisk
   GOTO GunMovtDisk
NextDiskX:
NEXT DiskX

GunMovtDisk:
U$ = INKEY$
IF U$ = "4" THEN GOTO GoLeftDisk
IF U$ = "6" THEN GOTO GoRightDisk
IF U$ = "X" OR U$ = "x" THEN CLS : GOTO ScoreDisplay
IF U$ = "F" OR U$ = "f" THEN FOR f = 100 TO 200 STEP 20: SOUND f, 1: NEXT f: GOTO FireDisk
IF DiskX <= 10 THEN CLS : GOTO TargetSelect ELSE GOTO NextDiskX
                                  
GoLeftDisk:
GunX = GunX - 7
IF GunX < 5 THEN GunX = GunX + 7
PUT (GunX, GunY), Gun, PSET
GOTO NextDiskX
GoRightDisk:
GunX = GunX + 7
IF GunX > 400 THEN GunX = GunX - 7
PUT (GunX, GunY), Gun, PSET
GOTO NextDiskX

FireDisk:
FOR BulletY = GunY - 10 TO GunY - 219 STEP -1
PUT (GunX + 35, BulletY), Bullet, PSET
IF GunX + 35 >= DiskX AND GunX + 35 <= DiskX + 50 AND BulletY <= 35 THEN PLAY "o0l32cdeddedf": Score = Score + 20: CLS : GOTO TargetSelect:  ELSE GOTO ContinueDisk
ContinueDisk:                                                                                                   
k = 1
GOTO NextDiskX
k = 0
NextBulletYDisk:
NEXT BulletY
GOTO GunMovtDisk

'----------------------------------------------------------------------------'

ShootTargetBoard: 'Collision Check
SCREEN 9
LOCATE 25, 2
PRINT "Score:"; Score
LOCATE 24, 26
PRINT "Shooting Gallery(TM) (C) 1997--->"
PUT (GunX, GunY), Gun, PSET
TBMovt:
k = 0
FOR TBX = 500 TO 0 STEP -1
   PUT (TBX, 0), TargetBoard, PSET
   FOR i = 1 TO 250
   NEXT i
   IF k = 1 THEN GOTO NextBulletYTB
   GOTO GunMovtTB
NextTBX:
NEXT TBX

GunMovtTB:
U$ = INKEY$
IF U$ = "4" THEN GOTO GoLeftTB
IF U$ = "6" THEN GOTO GoRightTB
IF U$ = "X" OR U$ = "x" THEN CLS : GOTO ScoreDisplay
IF U$ = "F" OR U$ = "f" THEN FOR f = 100 TO 200 STEP 20: SOUND f, 1: NEXT f: GOTO FireTB
IF TBX <= 10 THEN CLS : GOTO TargetSelect ELSE GOTO NextTBX
                                 
GoLeftTB:
GunX = GunX - 7
IF GunX < 5 THEN GunX = GunX + 7
PUT (GunX, GunY), Gun, PSET
GOTO NextTBX
GoRightTB:
GunX = GunX + 7
IF GunX > 400 THEN GunX = GunX - 7
PUT (GunX, GunY), Gun, PSET
GOTO NextTBX

FireTB:
FOR BulletY = GunY - 10 TO GunY - 219 STEP -1
PUT (GunX + 35, BulletY), Bullet, PSET
IF GunX + 35 >= TBX AND GunX + 35 <= TBX + 50 AND BulletY <= 35 THEN PLAY "o0l32cdeddedf": Score = Score + 10: CLS : GOTO TargetSelect:  ELSE GOTO ContinueTB
ContinueTB:
k = 1
GOTO NextTBX
k = 0
NextBulletYTB:
NEXT BulletY
GOTO GunMovtTB

'----------------------------------------------------------------------------'

ShootFunnyFace: 'Collision Check
SCREEN 9
LOCATE 25, 2
PRINT "Score:"; Score
LOCATE 24, 26
PRINT "Shooting Gallery(TM) (C) 1997--->"
PUT (GunX, GunY), Gun, PSET
FFMovt:
k = 0
FOR FFX = 500 TO 0 STEP -1
   PUT (FFX, 0), FunnyFace, PSET
   FOR i = 1 TO 250
   NEXT i
   IF k = 1 THEN GOTO NextBulletYFF
   GOTO GunMovtFF
NextFFX:
NEXT FFX

GunMovtFF:
U$ = INKEY$
IF U$ = "4" THEN GOTO GoLeftFF
IF U$ = "6" THEN GOTO GoRightFF
IF U$ = "X" OR U$ = "x" THEN CLS : GOTO ScoreDisplay
IF U$ = "F" OR U$ = "f" THEN FOR f = 100 TO 200 STEP 20: SOUND f, 1: NEXT f: GOTO FireFF
IF FFX <= 10 THEN CLS : GOTO TargetSelect ELSE GOTO NextFFX
                                
GoLeftFF:
GunX = GunX - 7
IF GunX < 5 THEN GunX = GunX + 7
PUT (GunX, GunY), Gun, PSET
GOTO NextFFX
GoRightFF:
GunX = GunX + 7
IF GunX > 400 THEN GunX = GunX - 7
PUT (GunX, GunY), Gun, PSET
GOTO NextFFX

FireFF:
FOR BulletY = GunY - 10 TO GunY - 219 STEP -1
PUT (GunX + 35, BulletY), Bullet, PSET
IF GunX + 35 >= FFX AND GunX + 35 <= FFX + 50 AND BulletY <= 35 THEN PLAY "o0l32cdeddedf": Score = Score + 30: CLS : GOTO TargetSelect:  ELSE GOTO ContinueFF
ContinueFF:
k = 1
GOTO NextFFX
k = 0
NextBulletYFF:
NEXT BulletY
GOTO GunMovtFF

'----------------------------------------------------------------------------'
ShootBall: 'Collision Check
SCREEN 9
LOCATE 25, 2
PRINT "Score:"; Score
LOCATE 24, 26
PRINT "Shooting Gallery(TM) (C) 1997--->"
PUT (GunX, GunY), Gun, PSET
BMovt:
k = 0
FOR BX = 500 TO 0 STEP -1
   PUT (BX, 0), Ball, PSET
   FOR i = 1 TO 250
   NEXT i
   IF k = 1 THEN GOTO NextBulletYB
   GOTO GunMovtB
NextBX:
NEXT BX

GunMovtB:
U$ = INKEY$
IF U$ = "4" THEN GOTO GoLeftB
IF U$ = "6" THEN GOTO GoRightB
IF U$ = "X" OR U$ = "x" THEN CLS : GOTO ScoreDisplay
IF U$ = "F" OR U$ = "f" THEN FOR f = 100 TO 200 STEP 20: SOUND f, 1: NEXT f: GOTO FireB
IF BX <= 10 THEN CLS : GOTO TargetSelect ELSE GOTO NextBX
                                
GoLeftB:
GunX = GunX - 7
IF GunX < 5 THEN GunX = GunX + 7
PUT (GunX, GunY), Gun, PSET
GOTO NextBX
GoRightB:
GunX = GunX + 7
IF GunX > 400 THEN GunX = GunX - 7
PUT (GunX, GunY), Gun, PSET
GOTO NextBX

FireB:
FOR BulletY = GunY - 10 TO GunY - 219 STEP -1
PUT (GunX + 35, BulletY), Bullet, PSET
IF GunX + 35 >= BX AND GunX + 35 <= BX + 50 AND BulletY <= 35 THEN PLAY "o0l32cdeddedf": Score = Score + 20: CLS : GOTO TargetSelect:  ELSE GOTO ContinueB
ContinueB:
k = 1
GOTO NextBX
k = 0
NextBulletYB:
NEXT BulletY
GOTO GunMovtB

'----------------------------------------------------------------------------'
ShootBell: 'Collision Check
SCREEN 9
LOCATE 25, 2
PRINT "Score:"; Score
LOCATE 24, 26
PRINT "Shooting Gallery(TM) (C) 1997--->"
PUT (GunX, GunY), Gun, PSET
BeMovt:
k = 0
FOR BeX = 500 TO 0 STEP -1
   PUT (BeX, 0), Bell, PSET
   FOR i = 1 TO 250
   NEXT i
   IF k = 1 THEN GOTO NextBulletYBe
   GOTO GunMovtBe
NextBeX:
NEXT BeX

GunMovtBe:
U$ = INKEY$
IF U$ = "4" THEN GOTO GoLeftBe
IF U$ = "6" THEN GOTO GoRightBe
IF U$ = "X" OR U$ = "x" THEN CLS : GOTO ScoreDisplay
IF U$ = "F" OR U$ = "f" THEN FOR f = 100 TO 200 STEP 20: SOUND f, 1: NEXT f: GOTO FireBe
IF BeX <= 10 THEN CLS : GOTO TargetSelect ELSE GOTO NextBeX
                                
GoLeftBe:
GunX = GunX - 7
IF GunX < 5 THEN GunX = GunX + 7
PUT (GunX, GunY), Gun, PSET
GOTO NextBeX
GoRightBe:
GunX = GunX + 7
IF GunX > 5 THEN GunX = GunX - 7
PUT (GunX, GunY), Gun, PSET
GOTO NextBeX

FireBe:
FOR BulletY = GunY - 10 TO GunY - 219 STEP -1
PUT (GunX + 35, BulletY), Bullet, PSET
IF GunX + 35 >= BeX AND GunX + 35 <= BeX + 50 AND BulletY <= 35 THEN PLAY "o5mlCCCmn": Score = Score + 15: CLS : GOTO TargetSelect:  ELSE GOTO ContinueBe
ContinueBe:                                                                                                
k = 1
GOTO NextBeX
k = 0
NextBulletYBe:
NEXT BulletY
GOTO GunMovtBe

'----------------------------------------------------------------------------'
ScoreDisplay:
9 CLS
SCREEN 13
PAINT (100, 100), 4, 4
r = 50
FOR i = 16 TO 31
CIRCLE (50, 100), r, i
PAINT (50, 100), i, i
r = r - 1
NEXT i
FOR i = 31 TO 16 STEP -1
CIRCLE (50, 100), r, i
PAINT (50, 100), i, i
r = r - 1
NEXT i
CIRCLE (50, 100), 19, 4
PAINT (50, 100), 4

r = 50
FOR i = 16 TO 31
CIRCLE (270, 100), r, i
PAINT (270, 100), i, i
r = r - 1
NEXT i
FOR i = 31 TO 16 STEP -1
CIRCLE (270, 100), r, i
PAINT (270, 100), i, i
r = r - 1
NEXT i
CIRCLE (270, 100), 19, 4
PAINT (270, 100), 4
LINE (120, 50)-(200, 150), 0, BF

f = 300
FOR count = 1 TO 5
FOR i = 16 TO 31
COLOR i
LOCATE 10, 19
PRINT "Score"
LOCATE 15, 19
PRINT Score
SOUND f, 1
f = f + 1
NEXT i

FOR i = 31 TO 16 STEP -1
COLOR i
LOCATE 10, 19
PRINT "Score"
LOCATE 15, 19
PRINT Score
SOUND f, 1
f = f - 1
NEXT i
NEXT count
CLS
ShowRights:
SCREEN 9
COLOR 9
LOCATE 6, 31
PRINT "Shooting Gallery"
LOCATE 8, 22
PRINT "Copyright(C) Vivin Corporations 1997-->"
LOCATE 10, 30
PRINT "All rights reserved"
PLAY "p1p1p1"
CHAIN "projmenu.bas"


