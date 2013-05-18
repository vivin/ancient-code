SCREEN 0
CLS
COLOR 15
text$ = "The following program is by CIPHER software. Leaders in Fake Info."
FOR i = 1 TO LEN(text$)
PRINT MID$(text$, i, 1);
PLAY "p32"
NEXT i
DO
LOOP WHILE INKEY$ = ""

Start:
SCREEN 0
maxz = 0
maxx = 0
CLS
SCREEN 0
LOCATE 1, 6
COLOR 1
PRINT "LECUSFOTI(tm) InTeRnEt mEsSaGe eNcOdEr/DeCoDeR pRoGrAm - VeRsIoN 1.1"
LOCATE 2, 6
PRINT "____________________________________________________________________"
COLOR 7
LOCATE 5, 6
PRINT "Do you wish to encode or decode [e/d | x for exit]:"
Loopy:
ed$ = INKEY$
edx$ = LCASE$(ed$)
IF edx$ = "e" THEN GOTO Encode
IF edx$ = "a" THEN GOTO Asciivals
IF edx$ = "x" THEN GOTO EndScreen
IF edx$ = "d" THEN GOTO Decode ELSE GOTO Loopy

Encode:
CLS
LOCATE 1, 6
COLOR 1
PRINT "LECUSFOTI(tm) InTeRnEt mEsSaGe eNcOdEr/DeCoDeR pRoGrAm - VeRsIoN 1.1"
LOCATE 2, 6
PRINT "____________________________________________________________________"

COLOR 7
LOCATE 5, 6
INPUT "Enter file to load [X for none]:", f$
IF LCASE$(f$) = "x" THEN GOTO FergetIt ELSE GOTO OpenIt
OpenIt:
f$ = f$ + ".ENC"
OPEN f$ FOR INPUT AS #1
maxz = 1
INPUT #1, EncText$
CLOSE #1

FergetIt:
CLS
LOCATE 1, 6
COLOR 1
PRINT "LECUSFOTI(tm) InTeRnEt mEsSaGe eNcOdEr/DeCoDeR pRoGrAm - VeRsIoN 1.1"
LOCATE 2, 6
PRINT "____________________________________________________________________"
COLOR 7
LOCATE 5, 1
COLOR 12
PRINT ", and ) are not accepted. Use them to your discretion in usage of decoded text."
COLOR 9
IF maxz = 0 THEN GOTO Ok ELSE GOTO NotOk
Ok:
LOCATE 13, 1
INPUT "Enter text to encode:", EncText$

Sa:
LOCATE 14, 1
INPUT "Enter name of file to save text as a precaution:", fl$
IF LEN(fl$) > 8 THEN BEEP: GOTO Sa
fl$ = fl$ + ".ENC"
OPEN fl$ FOR OUTPUT AS #1
PRINT #1, EncText$
CLOSE #1

NotOk:
FOR i = 1 TO LEN(EncText$)
IF MID$(EncText$, i, 1) = " " THEN GOTO Endloop
x = ASC(MID$(EncText$, i, 1))
x = x + 3
MID$(EncText$, i, 1) = CHR$(x)
Endloop:
NEXT i

CLS
LOCATE 1, 6
COLOR 1
PRINT "LECUSFOTI(tm) InTeRnEt mEsSaGe eNcOdEr/DeCoDeR pRoGrAm - VeRsIoN 1.1"
LOCATE 2, 6
PRINT "____________________________________________________________________"
COLOR 7
LOCATE 7, 6
PRINT EncText$
DO
LOOP WHILE INKEY$ = ""

CLS
LOCATE 1, 6
COLOR 1
PRINT "LECUSFOTI(tm) InTeRnEt mEsSaGe eNcOdEr/DeCoDeR pRoGrAm - VeRsIoN 1.1"
LOCATE 2, 6
PRINT "____________________________________________________________________"
COLOR 7
LOCATE 5, 1
PRINT "Would you like to save the text to a file? You can load and decode it(y/n):"

dud:
fil$ = INKEY$
f$ = LCASE$(fil$)
IF fil$ = "y" THEN GOTO Save
IF fil$ = "n" THEN CLS : GOTO Start ELSE GOTO dud

Save:
LOCATE 7, 6
INPUT "Enter file name:", filn$
IF LEN(filn$) > 8 THEN BEEP: GOTO Save
filn$ = filn$ + ".DEC"
OPEN filn$ FOR OUTPUT AS #1
PRINT #1, EncText$
CLOSE #1
CLS
GOTO Start
CLS

Decode:

CLS
LOCATE 1, 6
COLOR 1
PRINT "LECUSFOTI(tm) InTeRnEt mEsSaGe eNcOdEr/DeCoDeR pRoGrAm - VeRsIoN 1.1"
LOCATE 2, 6
PRINT "____________________________________________________________________"

COLOR 7
LOCATE 5, 6
INPUT "Enter file to load [X for none]:", f$
IF LCASE$(f$) = "x" THEN GOTO FergetItX ELSE GOTO OpenItX
OpenItX:
f$ = f$ + ".DEC"
OPEN f$ FOR INPUT AS #1
maxx = 1
INPUT #1, DecText$
CLOSE #1

FergetItX:
CLS
LOCATE 1, 6
COLOR 1
PRINT "LECUSFOTI(tm) InTeRnEt mEsSaGe eNcOdEr/DeCoDeR pRoGrAm - VeRsIoN 1.1"
LOCATE 2, 6
PRINT "____________________________________________________________________"
COLOR 7
LOCATE 5, 7
COLOR 12
PRINT ", and ) are not accepted. Use them to your discretion in usage of decoded text."
COLOR 9
IF maxx = 0 THEN GOTO OkX ELSE GOTO NotOkX
OkX:
LOCATE 13, 1
INPUT "Enter text to decode:", DecText$

SaX:
LOCATE 14, 1
INPUT "Enter name of file to save text as a precaution:", fl$
IF LEN(fl$) > 8 THEN BEEP: GOTO SaX
fl$ = fl$ + ".DEC"
OPEN fl$ FOR OUTPUT AS #1
PRINT #1, DecText$
CLOSE #1

NotOkX:
FOR i = 1 TO LEN(DecText$)
IF MID$(DecText$, i, 1) = " " THEN GOTO EndloopX
x = ASC(MID$(DecText$, i, 1))
x = x - 3
MID$(DecText$, i, 1) = CHR$(x)
EndloopX:
NEXT i

CLS
LOCATE 1, 6
COLOR 1
PRINT "LECUSFOTI(tm) InTeRnEt mEsSaGe eNcOdEr/DeCoDeR pRoGrAm - VeRsIoN 1.1"
LOCATE 2, 6
PRINT "____________________________________________________________________"
COLOR 7
LOCATE 7, 6
PRINT DecText$
DO
LOOP WHILE INKEY$ = ""

CLS
LOCATE 1, 6
COLOR 1
PRINT "LECUSFOTI(tm) InTeRnEt mEsSaGe eNcOdEr/DeCoDeR pRoGrAm - VeRsIoN 1.1"
LOCATE 2, 6
PRINT "____________________________________________________________________"
COLOR 7
LOCATE 5, 1
PRINT "Would you like to save the text to a file? You can load and encode it(y/n):"

dudX:
fil$ = INKEY$
f$ = LCASE$(fil$)
IF fil$ = "y" THEN GOTO SaveX
IF fil$ = "n" THEN CLS : GOTO Start ELSE GOTO dudX

SaveX:
LOCATE 7, 6
INPUT "Enter file name:", filn$
IF LEN(filn$) > 8 THEN BEEP: GOTO SaveX
filn$ = filn$ + ".ENC"
OPEN filn$ FOR OUTPUT AS #1
PRINT #1, DecText$
CLOSE #1
CLS
GOTO Start

Asciivals:
CLS
PRINT "You have entered the SeCrEt mOdE! heheheh!"
FOR i = 1000 TO 1500
SOUND i, .04
NEXT i
FOR i = 0 TO 255
PRINT "Character "; CHR$(i); " has ASCII value "; i
DO
LOOP WHILE INKEY$ = ""
NEXT i
GOTO Start:
EndScreen:
CLS
COLOR 4
t$ = "Thankyou for using LECUSFOTI's ENCODER/DECODER..... Cya later..."
t2$ = "Exiting to Operating System..."
FOR i = 1 TO LEN(t$)
PRINT MID$(t$, i, 1);
PLAY "p32"
NEXT i
LOCATE 3, 1
COLOR 7
FOR i = 1 TO LEN(t2$)
PRINT MID$(t2$, i, 1);
PLAY "p32"
NEXT i
END



