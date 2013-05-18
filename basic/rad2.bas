'***
DEFINT A-Z
DECLARE SUB pal ()
DECLARE SUB glow (col, r, g, B)
COMMON SHARED intsy%
1.11 CLS
CLEAR
RANDOMIZE TIMER
EFCT = INT(RND * 7)  '0-5, 0:siamese, 1:normal, 2:circles, 3:tape, 4:NORMAL, 5:circle&sine
lastefct = EFCT
totchange = INT(RND * 1500) + 1500                'how many cycles it takes to restart
intsy% = 4                           '0-4, how bright line is
IF intsy% > 4 OR intsy% < 0 THEN intsy% = 4
faderate = 1      'how quickly it takes to change to a color, 0=fastest
changerate = 100   ' how often it changes colors
dots = 58' + 52     ' how many dots make up the circles
'IF COMMAND$ <> "" THEN dots = VAL(COMMAND$)
lns = INT(RND * 10) + 1       'if lines connect both circle, 0-4 no, 5-10 yes
move = INT(RND * 3) + 1      'how many spaces it moves a round, 1-3
IF lns < 5 THEN lns = 0
IF lns >= 5 THEN lns = 1
maxsize = INT(RND * 20) + 1       'determine size of radius
IF maxsize = 1 THEN maxsize = 70
IF maxsize = 2 THEN maxsize = 90
IF maxsize = 3 THEN maxsize = 150
IF maxsize = 4 THEN maxsize = 100
IF maxsize = 5 THEN maxsize = 130
IF maxsize <= 20 AND maxsize >= 6 THEN maxsize = 120
DIM x%(dots + 1)                    'set arrays
DIM y%(dots + 1)
DIM x2%(dots + 1)
DIM y2%(dots + 1)
DIM oldx%(dots + 1)
DIM oldy%(dots + 1)
DIM oldx2%(dots + 1)
DIM oldy2%(dots + 1)
DIM c%(dots + 1)
jk = INT(RND * 600)                 'set coordinates
jk2 = INT(RND * 460)
g = INT(RND * 2): g2 = INT(RND * 2)
CLS
SCREEN 12
dk = 1: zr = 1
pal
WINDOW (-maxsize, -maxsize)-(640 + maxsize, 480 + maxsize)    'set screen size
r = 1
z = 15
pi# = 3.1415926#
1 mssize = maxsize
FOR i = 1 TO dots + 1               'set up info for circles so no fist lines seen
	 IF r = 1 THEN z = z + 1 ELSE z = z - 1
	 IF z >= 15 THEN r = 0
	 IF z <= 1 THEN r = 1
	 IF pick = 8 THEN z = INT(RND * 15) + 1
	 c%(i) = z
	 x%(i) = jk + COS((i + (360 / dots) * i) * pi# / 180) * mssize / 3
	 y%(i) = jk2 - SIN((x%(i) + (360 / dots) * i) * pi# / 180) * mssize
	 x2%(i) = jk + COS((i + (360 / dots) * i) * pi# / 180) * mssize / 3
	 y2%(i) = jk2 - SIN((x2%(i) + (360 / dots) * i) * pi# / 180) * mssize
	 oldx%(i) = x%(i): oldy%(i) = y%(i)
	 oldx2%(i) = x2%(i): oldy2%(i) = y2%(i)
NEXT i
x%(dots + 1) = x%(1): y%(dots + 1) = y%(1)
oldx%(dots + 1) = x%(1): oldy%(dots + 1) = y%(1)
x2%(dots + 1) = x2%(1): y2%(dots + 1) = y2%(1)
oldx2%(dots + 1) = x2%(1): oldy2%(dots + 1) = y2%(1)
d# = pi# / 180
a# = 360 / dots
DO                         'main do loop
	 a$ = INKEY$             'gets key press
	 IF a$ = CHR$(32) THEN GOTO 1.11   'if space bar pushed then cycle again
	 IF g = 1 THEN jk = jk + move ELSE jk = jk - move      'x movement
	 IF jk >= 640 THEN g = 0
	 IF jk <= 0 THEN g = 1
	 IF g2 = 1 THEN jk2 = jk2 + move ELSE jk2 = jk2 - move    'y movement
	 IF jk2 >= 480 THEN g2 = 0
	 IF jk2 <= 0 THEN g2 = 1
	 IF zr = 1 THEN dk = dk + 1 ELSE dk = dk - 1       'degree scheme for up then down again
	 IF dk > 360 THEN zr = 0
	 IF dk <= 1 THEN zr = 1
	 FOR i = 0 TO dots + 1
			df# = a# * i
			IF EFCT = 0 THEN        'siamese effect
	 x%(i) = jk + COS((y%(i) + df#) * d#) * mssize
	 y%(i) = jk2 - SIN((df# + df#) * d#) * mssize
	 x2%(i) = jk + COS((dk / 2 + df#) * d#) * (mssize + dk / 2) / 2
	 y2%(i) = jk2 - SIN((y%(i) + df#) * d#) * (mssize + dk) / 2
	 GOTO 45.45
			END IF
			IF EFCT = 1 THEN        'plain connected sinewaves
	 x%(i) = jk + COS((y%(i) + df#) * d#) * mssize
	 y%(i) = jk2 - SIN((-dk + df#) * d#) * mssize
	 x2%(i) = jk + COS((dk / 2 + df#) * d#) * (mssize + 50) / 2
	 y2%(i) = jk2 - SIN((y%(i) + df#) * d#) * (mssize + dk) / 2
	 GOTO 45.45
			END IF
			IF EFCT = 2 THEN        'circles
	 x%(i) = jk + COS((-dk * (dk / 180) + df#) * d#) * mssize
	 y%(i) = jk2 - SIN((dk * (dk / 180) + df#) * d#) * mssize
	 x2%(i) = jk + COS((dk * (dk / 180) + df#) * d#) * mssize
	 y2%(i) = jk2 - SIN((-dk * (dk / 180) + df#) * d#) * mssize
	 GOTO 45.45
			END IF
			IF EFCT = 3 THEN        'tape
	 x%(i) = jk + COS((y%(i) + df#) * d#) * mssize
	 y%(i) = jk2 - SIN((dk + df#) * d#) * mssize
	 x2%(i) = x%(i) + COS((-dk / 2 + df#) * d#) * dk / 3
	 y2%(i) = y%(i) - SIN((x2%(i) + df#) * d#) * -dk / 3
	 GOTO 45.45
			END IF
			IF EFCT = 4 THEN        'connected sinewave
	 x%(i) = jk + COS((y%(i) + df#) * d#) * mssize
	 y%(i) = jk2 - SIN((-dk + df#) * d#) * mssize
	 x2%(i) = jk + COS((dk / 2 + df#) * d#) * (mssize + 50) / 2
	 y2%(i) = jk2 - SIN((y%(i) + df#) * d#) * (mssize + dk) / 2
	 GOTO 45.45
			END IF
			IF EFCT = 5 THEN         'circle and sinewave connected
	 x%(i) = jk + COS((dk + dk / 180 + df#) * d#) * mssize
	 y%(i) = jk2 - SIN((x%(i) + dk / 180 + df#) * d#) * mssize
	 x2%(i) = x%(i) + COS((100 + dk / 180 + df#) * d#) * mssize
	 y2%(i) = jk2 - SIN((jk2 + dk / 180 + df#) * d#) * mssize
	 GOTO 45.45
			END IF
			IF EFCT = 6 THEN        'really stretchy tape
	 x%(i) = jk + COS((y%(i) + df#) * d#) * mssize
	 y%(i) = jk2 - SIN((dk + df#) * d#) * mssize
	 xb = x%(i) + COS((-dk / 2 + df#) * d#) * dk / 3
	 yb = y%(i) - SIN((x2%(i) + df#) * d#) * -dk / 3
	 x2%(i) = xb + COS((-dk / 2 + df#) * d#) * dk / 3
	 y2%(i) = yb - SIN((x2%(i) + df#) * d#) * -dk / 3
			END IF
45.45
			IF i = 0 THEN iz = dots + 1 ELSE iz = i   'actually draw everything
			LINE (x%(iz), y%(iz))-(x%(iz - 1), y%(iz - 1)), c%(iz)
			LINE (x2%(iz), y2%(iz))-(x2%(iz - 1), y2%(iz - 1)), c%(iz)
			IF lns = 1 THEN
	 LINE (x%(iz), y%(iz))-(x2%(iz), y2%(iz)), c%(iz)
	 LINE (oldx%(iz), oldy%(iz))-(oldx2%(iz), oldy2%(iz)), 0    'erase old
			END IF
			IF zk < 3 THEN zk = zk + 1
			IF zk = 2 THEN CLS
			LINE (oldx%(iz), oldy%(iz))-(oldx%(iz - 1), oldy%(iz - 1)), 0
			LINE (oldx2%(iz), oldy2%(iz))-(oldx2%(iz - 1), oldy2%(iz - 1)), 0
			oldx%(iz - 1) = x%(iz): oldy%(iz - 1) = y%(iz)
			oldx2%(iz - 1) = x2%(iz): oldy2%(iz - 1) = y2%(iz)
			oldjk = jk: oldjk2 = jk2
	 NEXT i
	 IF pall = 0 THEN PALLL = PALLL + 1            'if glow cycle > waitforcycle then do
	 IF PALLL > changerate THEN
			PALLL = 0: pall = 1:
			DO
	 pick = INT(RND * 20) + 1           'pick a glow scheme
			LOOP UNTIL pick <> oldpick
	 END IF
	 IF pall = 1 THEN                         'carry out the glow change
			IF pick > 15 THEN pick = 4
			IF faderate > 0 THEN
	 db = db + 1
	 IF db <= faderate THEN GOTO 67
	 db = 0
			END IF                                 '  R     G     B
			izr = izr + 1
			IF izr > 15 THEN izr = 0: pall = 0: oldpick = pick: pick = 0
			IF pick = 1 THEN glow 16 - izr, 0, izr * intsy%, 0 'green
			IF pick = 2 THEN glow 16 - izr, izr * intsy%, 0, 0 'red
			IF pick = 3 THEN glow 16 - izr, 0, 0, izr * intsy%  'blue
			IF pick = 4 THEN glow 16 - izr, izr * intsy%, izr * intsy%, 0  'gold
			IF pick = 5 THEN glow 16 - izr, 0, izr * intsy%, izr * intsy%       'light blue
			IF pick = 6 THEN glow 16 - izr, izr * intsy%, 0, izr * intsy%     'purple
			IF pick = 7 THEN glow 16 - izr, izr * intsy%, izr * intsy%, izr * intsy%        'silver
			IF pick = 8 THEN PALETTE: izr = 0: pall = 0: oldpick = pick: pick = 0'true colors     R   G   B
			IF pick = 9 THEN glow izr, 0, (15 - izr) * intsy%, izr * intsy%    'green to blue
			IF pick = 10 THEN glow izr, (15 - izr) * intsy%, izr * intsy%, 0         'red to yellow
			IF pick = 11 THEN glow izr, izr * intsy%, 0, (15 - izr) * intsy%     'blue to red
			IF pick = 12 THEN glow izr, izr * intsy%, izr * intsy%, (15 - izr) * intsy%   'blue to yellow
			IF pick = 13 THEN glow izr, izr * intsy%, (15 - izr) * intsy%, (15 - izr) * intsy%'light blue to red
			IF pick = 14 THEN glow izr, (15 - izr) * intsy%, izr * intsy%, (15 - izr) * intsy%   'purple to green
			IF pick = 15 THEN glow izr, izr * intsy%, (15 - izr) * intsy%, (15 - izr) * intsy%   'red to light blue
	 END IF
67
LOOP UNTIL a$ <> ""          'goes until any key except space is pushed
SYSTEM                       'end program

SUB glow (col, r, g, B)
OUT 968, col        'effected color
OUT 969, r          'red content
OUT 969, g          'green content
OUT 969, B          'blue content
END SUB

SUB pal
pick = INT(RND * 15) + 1
FOR izr = 1 TO 15
			IF pick = 1 THEN glow 16 - izr, 0, izr * intsy%, 0 'green
			IF pick = 2 THEN glow 16 - izr, izr * intsy%, 0, 0 'red
			IF pick = 3 THEN glow 16 - izr, 0, 0, izr * intsy%  'blue
			IF pick = 4 THEN glow 16 - izr, izr * intsy%, izr * intsy%, 0  'gold
			IF pick = 5 THEN glow 16 - izr, 0, izr * intsy%, izr * intsy%       'light blue
			IF pick = 6 THEN glow 16 - izr, izr * intsy%, 0, izr * intsy%     'purple
			IF pick = 7 THEN glow 16 - izr, izr * intsy%, izr * intsy%, izr * intsy%        'silver
			IF pick = 8 THEN PALETTE     'true colors     R   G   B
			IF pick = 9 THEN glow izr, 0, (15 - izr) * intsy%, izr * intsy%    'green to blue
			IF pick = 10 THEN glow izr, (15 - izr) * intsy%, izr * intsy%, 0         'red to yellow
			IF pick = 11 THEN glow izr, izr * intsy%, 0, (15 - izr) * intsy%     'blue to red
			IF pick = 12 THEN glow izr, izr * intsy%, izr * intsy%, (15 - izr) * intsy%   'blue to yellow
			IF pick = 13 THEN glow izr, izr * intsy%, (15 - izr) * intsy%, (15 - izr) * intsy%'light blue to red
			IF pick = 14 THEN glow izr, (15 - izr) * intsy%, izr * intsy%, (15 - izr) * intsy%   'purple to green
			IF pick = 15 THEN glow izr, izr * intsy%, (15 - izr) * intsy%, (15 - izr) * intsy%   'red to light blue
NEXT izr
END SUB

