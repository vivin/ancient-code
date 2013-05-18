'***
REM Here's a little Prime Numer Answerer.
REM Choose automatic or manually scan.
REM If you choose manually, then you'll see a lot of numers on the screen.
REM If one of them is a full number, then it isn't a Prime Number.
REM I recomend automatic scan,little bit slower though, which gives you the
REM answer directly on the screen.
REM Hope this program could help some day.
REM                      Andreas Wennstr”m, W.E.P

DECLARE SUB auto (var, svar!, ta!, tal!)
borjan:
CLS
LOCATE 8, 20
COLOR 2, 7
PRINT "Input your choise:"
LOCATE 9, 20
COLOR 2, 5
PRINT "A": COLOR 2, 7: LOCATE 9, 21: PRINT ".Manually       ": COLOR 2, 5: LOCATE 9, 37: PRINT "A"
LOCATE 10, 20: COLOR 2, 5
PRINT "B": COLOR 2, 7: LOCATE 10, 21: PRINT ".Automatic      ": COLOR 2, 5: LOCATE 10, 37: PRINT "B"
LOCATE 11, 20: COLOR 2, 5
PRINT "C": COLOR 2, 7: LOCATE 11, 21: PRINT ".Info           ": COLOR 2, 5: LOCATE 11, 37: PRINT "C"

svar1$ = INPUT$(1)

IF svar1$ > "c" THEN GOTO borjan
IF svar1$ = "b" THEN GOTO automat
IF svar1$ = "c" THEN
LOCATE 5, 5
CLS
COLOR 5, 9
LOCATE 5, 26
PRINT "--------------------"
LOCATE 6, 26
PRINT "I \       / I----  I"
LOCATE 7, 26
PRINT "I  \  I  /  I---   I"
LOCATE 8, 26
PRINT "I   \/ \/   I----- I"
LOCATE 9, 26
PRINT "I     PROGRAMS     I"
LOCATE 10, 26
PRINT "--------------------"
LOCATE 12, 20
PRINT "    Wennstrom Electronic Programs   "
LOCATE 15, 20
PRINT "      Prime Explorer. ver 1.0       "
LOCATE 17, 20
PRINT "   Programmed by Andreas Wennstrom  "
LOCATE 19, 20
PRINT "         SBAW@GEOCITIES.COM         "
DO
LOOP UNTIL INKEY$ = CHR$(13)
GOTO borjan
END IF

IF svar1$ = CHR$(27) THEN END
COLOR 0, 0
it:
CLS
COLOR 2, 7
INPUT "Input number"; tal
IF tal > 100000 THEN GOTO it
ta = tal
at = 23
1
svar = tal / ta
PRINT ta; svar
IF ta = tal - at THEN
at = at + 23
SLEEP
END IF
ta = ta - 1
IF ta = 0 THEN GOTO slut
GOTO 1


automat:
COLOR 2, 7
CLS
INPUT "Input number"; tal
IF tal = 4 THEN CLS : PRINT "4 was not a prime number.": END
ta = tal
auto2:
rak = rak + 1
ta = ta - 1
IF ta = 0 THEN CLS : PRINT tal; "was a prime number.": END
svar = tal / ta
var = ta
IF rak < 5 THEN COLOR 2, 7: PRINT "."
IF rak = 5 THEN : COLOR 2, 5: PRINT ":": rak = 0
IF INKEY$ = CHR$(27) THEN END
CALL auto(var, svar, ta, tal)
GOTO auto2
slut:

SUB auto (var, svar, ta, tal)
beg:
var = var - 1
COLOR 2, 7
IF INKEY$ = CHR$(27) THEN END
IF svar = var THEN CLS : PRINT tal; "was not a prime number.": END
IF var = 0 THEN GOTO slutet

GOTO beg
slutet:
END SUB

