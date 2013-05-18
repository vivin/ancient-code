SCREEN 9
CLS
SCREEN 9
X = 120
Y = 140
Z = 150
C = 1: O = 1
ColourForCone:
COLOR C
DrawCircle:
CIRCLE (X, Y), Z
X = X + 1
Y = Y + 1
Z = Z - 1
IF Z < 1 THEN GOTO Coordinates ELSE GOTO DrawCircle
Coordinates:
Z = 150
Y = 140
C = C + 1
Z = 150
O = O + 1
IF O > 5 THEN GOTO TitleDraw:  ELSE GOTO ColourForCone
'----------------------------------------------------------------------------'

TitleDraw:
PSET (260, 100), 7
DRAW "U50 R25 U10 L60 D10 R25 D50 R10"
PAINT (255, 85), 9, 7
PSET (320, 100), 7
DRAW "U60 R10 D25 R25 U25 R10 D60 L10 U25 L25 D25 L10"
PAINT (325, 75), 9, 7
PSET (420, 100), 7
DRAW "U60 R40 D12 L30 D12 R20 D12 L20 D12 R30 D12 L40"
PAINT (425, 85), 9, 7
CIRCLE (215, 49), 10, 15, , 1.5533
CIRCLE (235, 49), 10, 15, 1.6, 3.2
CIRCLE (235, 35), 10, 15, 3, 4.7
CIRCLE (215, 35), 10, 15, 4.7, .2
PAINT (226, 42), 7, 15
PAINT (224, 42), 7, 15
CIRCLE (450, 108), 10, 15, , 1.5533
CIRCLE (470, 108), 10, 15, 1.6, 3.2
CIRCLE (470, 94), 10, 15, 3, 4.7
CIRCLE (450, 94), 10, 15, 4.7, .2
PAINT (461, 102), 7, 15
PSET (120, 200), 7
DRAW "u25r60d10l50d25r50d45l60u10r50u25l50u20"
PSET (220, 175), 7
DRAW "d80r10ta-20u50ta20d50ta0r10u80l10d55ta20u50ta-20d50ta0u55l10"
PSET (320, 255), 7
DRAW "ta-20u85ta20d85ta0l10ta20u65ta-20d65ta0l8"
PSET (341, 230), 0
DRAW "ta-20u10ta0r26ta21d10ta0l36"
PSET (341, 230), 7
DRAW "r36"
PSET (346, 220), 7
DRAW "r26"
PSET (441, 255), 7
DRAW "u80r10ta20d50ta-20u50ta0r10d80l10u55ta-20d50ta20u50ta0d55l10"
PSET (541, 255), 7
DRAW "u80r10d80l10"
PAINT (125, 195), 9, 7
PAINT (225, 180), 9, 7
PAINT (325, 250), 9, 7
PAINT (446, 250), 9, 7
PAINT (546, 250), 9, 7
CIRCLE (111, 183), 10, 15, , 1.5533
CIRCLE (131, 183), 10, 15, 1.6, 3.2
CIRCLE (131, 169), 10, 15, 3, 4.7
CIRCLE (111, 169), 10, 15, 4.7, .2
PAINT (122, 176), 7, 15
CIRCLE (543, 261), 10, 15, , 1.5533
CIRCLE (563, 261), 10, 15, 1.6, 3.2
CIRCLE (563, 247), 10, 15, 3, 4.7
CIRCLE (543, 247), 10, 15, 4.7, .2
PAINT (554, 254), 7, 15
PLAY "mll2e-de-dl8e-dcgf+e-dce-dcgf+e-dc e-dc gf+e-dce-dcgf+e-dl2c"
'----------------------------------------------------------------------------'

CLS
SCREEN 7
C = 1
FOR i = 1 TO 2000
X = INT(RND * 640) + 1
Y = INT(RND * 320) + 1
PSET (X, Y), C
C = C + 1
IF C > 15 THEN C = 1
NEXT i

LOCATE 1, 40
PRINT "OM! OM! OM!"
LOCATE 4, 30
PRINT "This is  Swami Kripananda. Are you interested to know your future?"
INPUT "", L$
LOCATE 9, 1
PRINT "Nonono! Don't be impatient. First answer my questions!"
LOCATE 12, 1
INPUT "Tell me your name:", name$
Age:
LOCATE 14, 1
INPUT "Please tell me your age:", Age
IF Age >= 21 THEN PRINT "This program is meant for children!": GOTO Age
LOCATE 15, 1: PRINT "                                               "
INPUT "Enter your date of birth:", dob$
'----------------------------------------------------------------------------'

char1$ = "You're basically a pessimistic, egoistic, snobbish, foolish and dum person. So if you wanna make friends, FORGET IT!!"
char2$ = "You're basically an optimistic, interesting, modest, smart and witty person. Throughout your life you will have many friends."
char3$ = "You're unkind, cruel and a tyrant. If you are thinking of going into politics, you might become Hitler II."
char4$ = "You're studious and interested in scientific stuff. You are rational and logical. You are not influenced by emotions. You work out everything by logic. Infact, you'd make a good vulcan in StarTrek!"
char5$ = "You're and extremely studious person. You donot generally mix with people. So people feel that you are antisocial. But you can be warm and friendly when you want."
char6$ = "You're ZZZZ...."
char7$ = "You're are a person with extremes of character. Sometimes your are friendly and affectionate at other times you are barbaric."
char8$ = "You're a sympathetic and sensitive person. You hate to see people in trouble. You also feel hurt easily."
char9$ = "Ha Ha Ha! You're funny!"
char10$ = "You're a very intersesting person."
wealth1$ = "Aha! I can see you coming on Lifestyles of the Rich and Famous!"
wealth2$ = "Aha! I can see you coming on Lifestyles of the Poor and Unknown!"
wealth3$ = "I can see that you are going to be a very rich person!"
wealth4$ = "I can see you sitting on the street."
wealth5$ = "I can see a mansion as big as New York, with 1001 rooms, 10 swimming pools, an 18 hole golf course, 5 tennis courts and.... I think you know what I mean."
wealth6$ = "I can see you sitting at a meeting making a million dollar business deal."
wealth7$ = "I can see you in a house made of tin that's as big as a mouse hole."
wealth8$ = "I can see you in your private 747-400."
wealth9$ = "Ouch! The glare of gold, silver and diamonds is blinding me!"
wealth10$ = "I can see you checking into a 5-Star hotel."
prfssn1$ = "I can see you wearing a parachute and jumping out of an airplane. A SKYDIVER!!"
prfssn2$ = "I can see you in a lab mixing many chemicals. A CHEMIST!!"
prfssn3$ = "I can see you in an astronaut suit, doing a space walk."
prfssn4$ = "You are piloting a space craft from a Moonbase XX-76DeltaLuna-EZ to Marsbase ZX-22OmegaMars-QZ"
prfssn5$ = "You are cutting someone's hair and fashioning it into wierd shapes. A HAIRDRESSER!"
prfssn6$ = "You have a palette in one hand and a brush in the other."
prfssn8$ = "You are standing next to a black board that has the following equation on it ã(233[x{x-4á+22á}+ã{ã+988}ä{x{x+44523}/ãá}+åæçãâè+siné*2Coséëìí]}, P î R"
prfssn9$ = "You are wearing glasses and standing next to a particle accelerator."
prfssn10$ = "You are sitting in front of a computer typing in a program that has about 1,000,000,000 lines of code."
studies1$ = "You are an above average student with an IQ of 927. You're percentage is somewhere between 130% and 190%."
studies2$ = "You are an above average student with an IQ of 160. You always get 100%."
studies3$ = "You are an above average student. You always get in the 90s."
studies4$ = "You are an above average student. You get in your 80s and 90s."
studies5$ = "You are an average student. You get in your 60s and 70s."
studies6$ = "You are an OK student. You get in your 40s and 50s."
studies7$ = "You fail."
studies8$ = "100 in Math, 100 in Science, 98 in Social Studies, 99 in.... Need I say more?"
studies9$ = "0 in Math, 0.05 in Science, 1 in Social Studies, -9 in....Need I say more?"
studies10$ = "Wow! You really have some good scores!"
nearfut1$ = "You are going to break your arm and leg."
nearfut2$ = "You are going to be in deep trouble!"
nearfut3$ = "Your heart is going to pump in the next second."
nearfut4$ = "You are going to watch the rest of the exhibition, go home, have dinner and sleep."
nearfut5$ = "You are going to win a lottery."
nearfut6$ = "You are going to breathe."
nearfut7$ = "You will win some prizes very soon!"
nearfut8$ = "Duh!"
nearfut9$ = "You are going to get some money."
nearfut10$ = "You are going to wake up tomorrow."
'----------------------------------------------------------------------------'

CLS
FOR i = 1 TO LEN(name$)
IF MID$(name$, i, 1) = " " THEN GOTO SwamiSpeak ELSE R$ = R$ + MID$(name$, i, 1)
NEXT i
'----------------------------------------------------------------------------'

SwamiSpeak:
CLS
C = 1
FOR i = 1 TO 2000
X = INT(RND * 640) + 1
Y = INT(RND * 320) + 1
PSET (X, Y), C
C = C + 1
IF C > 15 THEN C = 1
NEXT i
LOCATE 5, 1: PRINT "Okay "; R$
LOCATE 10, 1
PRINT "Now I am going to tell things about you and your future. Listen carefully. What I say here may not come  true  because the  future is  governed  by our present actions."
FOR i = 1 TO 200000
NEXT i
GOTO 1

'----------------------------------------------------------------------------'
SwamiDraw:
SCREEN 9
C = 1
FOR i = 1 TO 2000
X = INT(RND * 640) + 1
Y = INT(RND * 320) + 1
PSET (X, Y), C
C = C + 1
IF C > 15 THEN C = 1
NEXT i
CIRCLE (300, 190), 125, 1, 2, 3.5
CIRCLE (198, 224), 15, 1, 3, 4.5
PSET (196, 235), 1
DRAW "ta-10r125ta0u40ta-10l95"
CIRCLE (225, 213), 20, 1, 2, 3
CIRCLE (221, 184), 20, 1, 3.5, 4.9
PSET (220, 199), 1
DRAW "ta0l20"
CIRCLE (330, 200), 100, 1, 2.5, 3.14
CIRCLE (340, 180), 125, 1, 6, .9
CIRCLE (448, 213), 15, 1, 5, .6
PSET (452, 223), 1
DRAW "ta18l125ta0u40ta18r95"
CIRCLE (432, 203), 20, 1, .5, 2.1
CIRCLE (432, 173), 20, 1, 4.9, .00000001#
PSET (432, 188), 1
DRAW "ta0r20"
CIRCLE (322, 188), 100, 1, , .56
CIRCLE (323, 168), 130, 1, 4, 5.577
PSET (249, 107), 1
DRAW "r168"
PAINT (299, 127), 15, 1
PSET (320, 217), 8
DRAW "r12d30l12u30"
PAINT (325, 222), 8, 8
PSET (423, 230), 4
DRAW "r70"
CIRCLE (493, 267), 50, 4, 4.7, 1.6
PSET (493, 304), 4
PSET (193, 235), 4
DRAW "ta-10r50l50ta0l20"
CIRCLE (173, 271), 49, 4, 1.6, 4.7
PSET (172, 307), 4
DRAW "ta1r323"
PSET (494, 303), 4
DRAW "ta0r10"
CIRCLE (323, 168), 130, 4, 4, 5.577
PAINT (350, 300), 6, 4
CIRCLE (333, 100), 70, 8, , , .9
PAINT (333, 100), 8, 8
CIRCLE (333, 100), 86, 7, 3.14, , 1.21
CIRCLE (333, 100), 66, 7, 3.14, , .9
PSET (267, 100), 7
DRAW "l5"
PSET (399, 100), 7
DRAW "r5"
PAINT (333, 170), 7, 7
PSET (286, 140), 7
DRAW "ta10r48"
PSET (379, 140), 7
DRAW "ta-10l48"
PSET (384, 135), 7
DRAW "ta-10l55"
PSET (282, 135), 7
DRAW "ta10r48"
PAINT (302, 135), 7, 7
CIRCLE (300, 90), 10, 15
PAINT (300, 90), 15, 15
CIRCLE (300, 90), 4, 0
PAINT (300, 90), 0, 0
CIRCLE (365, 90), 10, 15
PAINT (365, 90), 15, 15
CIRCLE (365, 90), 4, 0
PAINT (365, 90), 0, 0
PSET (325, 120), 14
CIRCLE (325, 118), 5, 0, -3.14
PSET (325, 118), 0
DRAW "ta0r5"
PAINT (325, 119), 0, 0
CIRCLE (340, 118), 5, 0, -3.14
PSET (340, 118), 0
DRAW "r5"
PAINT (340, 119), 0, 0
PSET (330, 99), 0
DRAW "ta-20d18"
PSET (335, 99), 0
DRAW "ta20d18"
CIRCLE (333, 55), 75, 6, -5.81, -3.61
PAINT (333, 35), 6, 6
PSET (319, 25), 14
DRAW "tah10r14e10f10r14g10f10l14g10h10l14e10"
PAINT (319, 34), 14, 14
FOR Z = 1 TO 5
PSET (322, 144), 0
DRAW "r20"
FOR i = 1 TO 10000
NEXT i
PSET (322, 144), 8
DRAW "r20"
CIRCLE (332, 144), 5, 0
PAINT (332, 144), 0, 0
CIRCLE (300, 90), 10, 8
CIRCLE (365, 90), 10, 8
PAINT (300, 90), 8, 8
PAINT (365, 90), 8, 8
FOR i = 1 TO 1500
NEXT i
CIRCLE (300, 90), 10, 15
PAINT (300, 90), 15, 15
CIRCLE (300, 90), 4, 0
PAINT (300, 90), 0, 0
CIRCLE (365, 90), 10, 15
PAINT (365, 90), 15, 15
CIRCLE (365, 90), 4, 0
PAINT (365, 90), 0, 0
FOR i = 1 TO 10000
NEXT i
CIRCLE (332, 144), 5, 8
PAINT (332, 144), 8
CIRCLE (332, 144), 10, 0, , , .2
PAINT (332, 144), 0, 0
FOR i = 1 TO 10000
NEXT i
CIRCLE (332, 144), 10, 8, , , .2
PAINT (332, 144), 8, 8
NEXT Z
RETURN
'----------------------------------------------------------------------------'

1 CLS
C = 1
FOR i = 1 TO 2000
X = INT(RND * 640) + 1
Y = INT(RND * 320) + 1
PSET (X, Y), C
C = C + 1
IF C > 15 THEN C = 1
NEXT i
PRINT "Let me speak to you about your character.": FOR i = 1 TO 20000: NEXT i: GOSUB SwamiDraw
Randslctchar:
CLS
SCREEN 7
COLOR 14
RANDOMIZE TIMER
cslctno = INT(RND * 10) + 1
IF cslctno = 1 THEN LOCATE 10, 1: PRINT char1$
IF cslctno = 2 THEN LOCATE 10, 1: PRINT char2$
IF cslctno = 3 THEN LOCATE 10, 1: PRINT char3$
IF cslctno = 4 THEN LOCATE 10, 1: PRINT char4$
IF cslctno = 5 THEN LOCATE 10, 1: PRINT char5$
IF cslctno = 6 THEN LOCATE 10, 1: PRINT char6$
IF cslctno = 7 THEN LOCATE 10, 1: PRINT char7$
IF cslctno = 8 THEN LOCATE 10, 1: PRINT char8$
IF cslctno = 9 THEN LOCATE 10, 1: PRINT char9$
IF cslctno = 10 THEN LOCATE 10, 1: PRINT char10$
COLOR 15
FOR i = 1 TO 150000: NEXT i

CLS
C = 1
FOR i = 1 TO 2000
X = INT(RND * 640) + 1
Y = INT(RND * 320) + 1
PSET (X, Y), C
C = C + 1
IF C > 15 THEN C = 1
NEXT i
PRINT "Let me speak to you about how much money you will make in your life.": FOR i = 1 TO 100000: NEXT i: GOSUB SwamiDraw
Randslctw:
CLS
SCREEN 7
COLOR 14
RANDOMIZE TIMER
wslctno = INT(RND * 10) + 1
IF wslctno = 1 THEN LOCATE 10, 1: PRINT wealth1$
IF wslctno = 2 THEN LOCATE 10, 1: PRINT wealth2$
IF wslctno = 3 THEN LOCATE 10, 1: PRINT wealth3$
IF wslctno = 4 THEN LOCATE 10, 1: PRINT wealth4$
IF wslctno = 5 THEN LOCATE 10, 1: PRINT wealth5$
IF wslctno = 6 THEN LOCATE 10, 1: PRINT wealth6$
IF wslctno = 7 THEN LOCATE 10, 1: PRINT wealth7$
IF wslctno = 8 THEN LOCATE 10, 1: PRINT wealth8$
IF wslctno = 9 THEN LOCATE 10, 1: PRINT wealth9$
IF wslctno = 10 THEN LOCATE 10, 1: PRINT wealth10$
COLOR 15
FOR i = 1 TO 150000: NEXT i

CLS
PRINT "Let me speak about your future profession.": FOR i = 1 TO 100000: NEXT i: GOSUB SwamiDraw
Randslctp:
CLS
SCREEN 7
COLOR 14
RANDOMIZE TIMER
pslctno = INT(RND * 10) + 1
IF pslctno = 1 THEN LOCATE 10, 1: PRINT prfssn1$
IF pslctno = 2 THEN LOCATE 10, 1: PRINT prfssn2$
IF pslctno = 3 THEN LOCATE 10, 1: PRINT prfssn3$
IF pslctno = 4 THEN LOCATE 10, 1: PRINT prfssn4$
IF pslctno = 5 THEN LOCATE 10, 1: PRINT prfssn5$
IF pslctno = 6 THEN LOCATE 10, 1: PRINT prfssn6$
IF pslctno = 7 THEN LOCATE 10, 1: PRINT prfssn7$
IF pslctno = 8 THEN LOCATE 10, 1: PRINT prfssn8$
IF pslctno = 9 THEN LOCATE 10, 1: PRINT prfssn9$
IF pslctno = 10 THEN LOCATE 10, 1: PRINT prfssn10$
COLOR 15
FOR i = 1 TO 150000: NEXT i

CLS
PRINT "Let me speak about your academics.": FOR i = 1 TO 100000: NEXT i: GOSUB SwamiDraw
Randslcta:
CLS
SCREEN 7
COLOR 14
RANDOMIZE TIMER
aslctno = INT(RND * 10) + 1
IF aslctno = 1 THEN LOCATE 10, 1: PRINT studies1$
IF aslctno = 2 THEN LOCATE 10, 1: PRINT studies2$
IF aslctno = 3 THEN LOCATE 10, 1: PRINT studies3$
IF aslctno = 4 THEN LOCATE 10, 1: PRINT studies4$
IF aslctno = 5 THEN LOCATE 10, 1: PRINT studies5$
IF aslctno = 6 THEN LOCATE 10, 1: PRINT studies6$
IF aslctno = 7 THEN LOCATE 10, 1: PRINT studies7$
IF aslctno = 8 THEN LOCATE 10, 1: PRINT studies8$
IF aslctno = 9 THEN LOCATE 10, 1: PRINT studies9$
IF aslctno = 10 THEN LOCATE 10, 1: PRINT studies10$
COLOR 15
FOR i = 1 TO 150000: NEXT i

CLS
PRINT "Let me speak about what is going to happen to you in the NEAR FUTURE!.": FOR i = 1 TO 100000: NEXT i: GOSUB SwamiDraw
Randslctnf:
CLS
SCREEN 7
COLOR 14
RANDOMIZE TIMER
nfslctno = INT(RND * 10) + 1
IF nfslctno = 1 THEN LOCATE 10, 1: PRINT nearfut1$
IF nfslctno = 2 THEN LOCATE 10, 1: PRINT nearfut2$
IF nfslctno = 3 THEN LOCATE 10, 1: PRINT nearfut3$
IF nfslctno = 4 THEN LOCATE 10, 1: PRINT nearfut4$
IF nfslctno = 5 THEN LOCATE 10, 1: PRINT nearfut5$
IF nfslctno = 6 THEN LOCATE 10, 1: PRINT nearfut6$
IF nfslctno = 7 THEN LOCATE 10, 1: PRINT nearfut7$
IF nfslctno = 8 THEN LOCATE 10, 1: PRINT nearfut8$
IF nfslctno = 9 THEN LOCATE 10, 1: PRINT nearfut9$
IF nfslctno = 10 THEN LOCATE 10, 1: PRINT nearfut10$
COLOR 15
FOR i = 1 TO 150000: NEXT i

CLS
SCREEN 2
SCREEN 0
PRINT "I hope you were'nt insulted by this program because it was meant as pure fun."
FOR i = 1 TO 10000
NEXT i
CLS
LOCATE 10, 11
PRINT "Swami(tm) was developed by Vivin Suresh Paliath using Basic"
LOCATE 11, 15
PRINT "Swami(tm) Copyright(C) 1996--> Vivin Corporations"
LOCATE 12, 30
PRINT "All Rights Reserved"
FOR i = 1 TO 100000
NEXT i


