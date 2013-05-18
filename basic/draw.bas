'           ÛßßßÜ                         ÛßßßÜ                 O
'           Û    Û                        Û    Û    
'           Û    Û  ÜßßÜ ÜßßßÜÛ Û     Û   ÛÜÜÜÜß  ÜßßßÜÛ  ÜßßÜ  Û ÜßßßÜ
'           Û    Û  Û    Û    Û  Û Ü Û    Û    Û  Û    Û  ßÜ    Û Û
'           ÛÜÜÜÜß  Û    ßÜÜÜßÛ   Û Û     ÛÜÜÜÜß  ßÜÜÜßÛ  ßÜÛÜ  Û ßÜÜÜß
'
'
'                By Steven Sillick
'
'
'                ÿ


SCREEN 13
DIM Scoogley1%(30000)
DIM Scoogley2%(30000)
GET (1, 31)-(319, 190), Scoogley1%
GET (1, 31)-(319, 199), Scoogley2%

PRINT "DRAW YOUR BASIC FILES!!!!!"
INPUT "PLEASE TYPE IN THE FILE NAME..."; c$
IF c$ = "" THEN END
IF LEFT$(c$, 4) = ".bas" THEN OPEN c$ FOR OUTPUT AS #1 ELSE c$ = c$ + ".bas": OPEN c$ FOR OUTPUT AS #1
CLS

PRINT #1, "' This program has at least one picture made from Draw Basic."
PRINT #1, ""
PRINT #1, "SCREEN 13"
PRINT #1, "DIM Scoogley1%(30000)"
PRINT #1, "DIM Scoogley2%(30000)"
PRINT #1, "GET (1, 31)-(319, 199), Scoogley1%"
PRINT #1, "GET (1, 31)-(319, 199), Scoogley2%"
PRINT #1, ""


CLOSE #1


SCREEN 13
PALETTE 15, 60 * 65793
PALETTE 7, 40 * 65793
PALETTE 8, 20 * 65793
 a = 160: b = 100
 PSET (a, b), 15: DIM a%(3): GET (a, b)-(a, b), a%

IF a$ = "1" OR a$ = "2" OR a$ = "3" OR a$ = "4" OR a$ = "5" OR a$ = "6" OR a$ = "7" OR a$ = "8" OR a$ = "9" AND baleush = 1 THEN PSET (a, b), col: baleush = 0

DO
PUT (a, b), a%, XOR

LET a$ = INKEY$
IF a$ = CHR$(0) + "G" OR a$ = CHR$(0) + "H" OR a$ = CHR$(0) + "I" THEN b = b - 1
IF a$ = CHR$(0) + "G" OR a$ = CHR$(0) + "K" OR a$ = CHR$(0) + "O" THEN a = a - 1
IF a$ = CHR$(0) + "I" OR a$ = CHR$(0) + "M" OR a$ = CHR$(0) + "Q" THEN a = a + 1
IF a$ = CHR$(0) + "O" OR a$ = CHR$(0) + "P" OR a$ = CHR$(0) + "Q" THEN b = b + 1
IF col > 0 THEN COLOR col ELSE COLOR 1

IF a$ = "C" THEN
LOCATE 1, 1:
INPUT "How much red?"; red:
IF red > 14 THEN PALETTE col, red:

INPUT "How much green?"; grn:
IF red > 14 OR grn > 14 THEN PALETTE col, red + grn * 256:

INPUT "How much blue?"; blu:
PALETTE col, red + grn * 256 + blu * 65536

cal = red + 256 * grn + blu * 65536

OPEN c$ FOR APPEND AS #1

c1000000 = INT(cal / 1000000) * 1000000
c100000 = INT((cal - c1000000) / 100000) * 100000
c10000 = INT((cal - c1000000 - c100000) / 10000) * 10000
c1000 = INT((cal - c1000000 - c100000 - c10000) / 1000) * 1000
c100 = INT((cal - c1000000 - c100000 - c10000 - c1000) / 100) * 100
c10 = INT((cal - c1000000 - c100000 - c10000 - c1000 - c100) / 10) * 10
c1 = INT((cal - c1000000 - c100000 - c10000 - c1000 - c100 - c10) / 1) * 1


c1000000 = c1000000 / 1000000 + 48
   c100000 = c100000 / 100000 + 48
      c10000 = c10000 / 10000 + 48
         c1000 = c1000 / 1000 + 48
            c100 = c100 / 100 + 48
               c10 = c10 / 10 + 48
                  c1 = c1 / 1 + 48

d100 = INT(col / 100)
d10 = col - d100 * 100
d10 = INT(d10 / 10)
d1 = col - (d100 * 100 + d10 * 10)
d100 = d100 + 48
d10 = d10 + 48
d1 = d1 + 48

b$ = "PALETTE " + CHR$(d100) + CHR$(d10) + CHR$(d1) + ", " + CHR$(c1000000) + CHR$(c100000) + CHR$(c10000) + CHR$(c1000) + CHR$(c100) + CHR$(c10) + CHR$(c1)

PRINT #1, b$
CLOSE #1
END IF

IF a$ = "c" THEN LOCATE 1, 1: INPUT "Which color #?"; col: LINE (1, 0)-(320, 35), 0, BF

IF a$ = "s" THEN LOCATE 1, 1: INPUT "What size?"; sizeof: LINE (1, 0)-(320, 35), 0, BF

IF a$ = " " THEN GOSUB PRINTto

IF a$ = "l" THEN g = 1: LINE (1, 1)-(319, 30), 0, BF
IF a$ = "d" THEN g = 2: LINE (1, 1)-(319, 30), 0, BF
IF a$ = "b" THEN g = 4: LINE (1, 1)-(319, 30), 0, BF
IF a$ = "B" THEN g = 5: LINE (1, 1)-(319, 30), 0, BF
IF a$ = "p" THEN g = 8: LINE (1, 1)-(319, 30), 0, BF
IF a$ = "P" THEN g = 9: LINE (1, 1)-(319, 30), 0, BF

IF a$ = "m" OR a$ = "M" THEN
GOSUB HardPart
PLAY "l4gl8dl4el8dl4e"
CLS
SCREEN 0: WIDTH 80

PRINT "Music Maker"
PRINT "Press C or c to change length"
PRINT "Press A - G to make a note"
PRINT "M to toggle background or foreground."
PRINT "< or > to raise key"

b$ = ""
czx = 8
IF g = 3 OR g = 6 OR g = 7 THEN g = g - 2

mb$ = "mb"
DO
LET a$ = INKEY$

LOCATE czx, 1: PRINT "PLAY ,"; b$; ","


IF a$ = "m" OR a$ = "M" THEN IF mb$ = "mf" THEN mb$ = "mb"
IF a$ = "m" OR a$ = "M" THEN IF mb$ = "mb" THEN mb$ = "mf": b$ = b$ + mb$: length = length + 2
IF a$ = "a" OR a$ = "A" OR a$ = "B" OR a$ = "b" OR a$ = "c" OR a$ = "C" OR a$ = "d" OR a$ = "D" OR a$ = "e" OR a$ = "E" OR a$ = "f" OR a$ = "F" OR a$ = "g" OR a$ = "G" OR a$ = "<" OR a$ = ">" THEN b$ = b$ + a$:  length = length + 1
IF a$ = CHR$(0) + CHR$(8) THEN b$ = LEFT$(b$, length)
IF a$ = " " THEN
OPEN c$ FOR APPEND AS #1
PRINT #1, "PLAY "' b$'
CLOSE #1
czx = czx + 1
INPUT "Do you have more music?"; a$
IF a$ <> "y" THEN a$ = "q"
END IF


LOOP WHILE a$ <> "q"
a$ = ""
SCREEN 13
IF hard = 1 THEN PUT (1, 31), Scoogley2%, PSET
IF hard = 0 THEN PUT (1, 31), Scoogley1%, PSET
END IF


IF a$ = "H" OR a$ = "h" THEN
IF hard = 0 THEN hard = 1
IF hard = 1 THEN hard = 0
GOSUB HardPart
END IF



IF a > 319 AND hard = 0 THEN a = 1:   hard = 1: GOSUB HardPart
IF a < 1 AND hard = 0 THEN a = 319:   hard = 1: GOSUB HardPart
IF b < 30 AND hard = 0 THEN b = 199:  hard = 1: GOSUB HardPart
IF b > 199 AND hard = 0 THEN b = 31:  hard = 1: GOSUB HardPart

IF a > 319 AND hard = 1 THEN a = 1:   hard = 0: GOSUB HardPart
IF a < 1 AND hard = 1 THEN a = 319:   hard = 0: GOSUB HardPart
IF b < 31 AND hard = 1 THEN b = 199:  hard = 0: GOSUB HardPart
IF b > 199 AND hard = 1 THEN b = 31:  hard = 0: GOSUB HardPart

PUT (a, b), a%

LOCATE 1, 1: PRINT "Color: "; col
LOCATE 1, 21: PRINT "Frame: "; hard + 1
LOCATE 2, 1: PRINT "Size of: "; sizeof

IF g = 1 THEN PRINT "Mode: Lines(not boxed)p1"
IF g = 2 THEN PRINT "Mode: Circles"
IF g = 3 THEN PRINT "Mode: Lines(not boxed)p2"
IF g = 4 THEN PRINT "Mode: Boxes(not filled)p1"
IF g = 5 THEN PRINT "Mode: Boxes(filled)p1"
IF g = 6 THEN PRINT "Mode: Boxes(not filled)p2"
IF g = 7 THEN PRINT "Mode: Boxes(filled)p2"
IF g = 8 THEN PRINT "Mode: Paint"
IF g = 9 THEN PRINT "Mode: Pset(non area circle)"

PRINT "X:"; a; "Y:"; b

LOOP WHILE a$ <> "q"
END



PRINTto:
IF g = 8 THEN LOCATE 1, 1: PRINT "You have chose to paint. Confirmation required."
IF g = 8 THEN LOCATE 2, 1: INPUT "Do you wish to paint?"; yesno$
IF g = 8 AND yesno$ = "yes" THEN poq = 0
IF g = 8 AND yesno$ <> "yes" THEN RETURN

a100 = INT(b / 100)
a10 = b - a100 * 100
a10 = INT(a10 / 10)
a1 = b - (a100 * 100 + a10 * 10) + 48
a10 = a10 + 48
a100 = a100 + 48
n100 = INT(a / 100)
n10 = a - n100 * 100
n10 = INT(n10 / 10)
n1 = a - (n100 * 100 + n10 * 10) + 48
n10 = n10 + 48
n100 = n100 + 48
c100 = INT(col / 100)
c10 = col - c100 * 100
c10 = INT(c10 / 10)
c1 = col - (c100 * 100 + c10 * 10)
c100 = c100 + 48
c10 = c10 + 48
c1 = c1 + 48
s100 = INT(sizeof / 100)
s10 = sizeof - s100 * 100
s10 = INT(s10 / 10)
s1 = sizeof - (s100 * 100 + s10 * 10)
s100 = s100 + 48
s10 = s10 + 48
s1 = s1 + 48
IF g = 2 THEN
CIRCLE (a, b), sizeof, col
END IF
IF g = 2 THEN b$ = "CIRCLE (" + CHR$(n100) + CHR$(n10) + CHR$(n1)
IF g = 2 THEN b$ = b$ + ", " + CHR$(a100) + CHR$(a10) + CHR$(a1) + "), "
IF g = 2 THEN b$ = b$ + CHR$(s100) + CHR$(s10) + CHR$(s1) + ", " + CHR$(c100)
IF g = 2 THEN b$ = b$ + CHR$(c10) + CHR$(c1)

IF g = 1 OR g = 4 OR g = 5 THEN
b$ = "LINE (" + CHR$(n100) + CHR$(n10) + CHR$(n1) + ", " + CHR$(a100)
b$ = b$ + CHR$(a10) + CHR$(a1): c = a: d = b: g = g + 2: RETURN
END IF

IF g = 3 OR g = 6 OR g = 7 THEN
b$ = b$ + ")-(" + CHR$(n100) + CHR$(n10) + CHR$(n1)
b$ = b$ + ", " + CHR$(a100) + CHR$(a10) + CHR$(a1) + "), "
b$ = b$ + CHR$(c100) + CHR$(c10) + CHR$(c1):
END IF

IF g = 3 THEN LINE (a, b)-(c, d), col: g = g - 2: PUT (a, b), a%

IF g = 6 THEN
b$ = b$ + ", B": g = g - 2:  LINE (a, b)-(c, d), col, B: g = g - 2
END IF

IF g = 7 THEN
b$ = b$ + ", BF": g = g - 2: LINE (a, b)-(c, d), col, BF: g = g - 2
END IF

IF g = 8 THEN
PAINT (a, b), col: b$ = "PAINT (" + CHR$(n100) + CHR$(n10)
b$ = b$ + CHR$(n1) + ", " + CHR$(a100) + CHR$(a10) + CHR$(a1)
b$ = b$ + "), " + CHR$(c100) + CHR$(c10) + CHR$(c1)
END IF

IF g = 9 THEN
PSET (a, b), col: b$ = "PSET (" + CHR$(n100)
b$ = b$ + CHR$(n10) + CHR$(n1) + ", " + CHR$(a100)
b$ = b$ + CHR$(a10) + CHR$(a1) + "), "
b$ = b$ + CHR$(c100) + CHR$(c10) + CHR$(c1)
END IF

IF RIGHT$(c$, 4) <> ".bas" THEN
OPEN c$ + ".bas" FOR APPEND AS #1
ELSE
OPEN c$ FOR APPEND AS #1
END IF

PRINT #1, b$
CLOSE #1
PUT (a, b), a%
RETURN

HardPart:
IF hard = 1 THEN
GET (1, 31)-(319, 199), Scoogley1%
PUT (1, 31), Scoogley2%

OPEN c$ FOR APPEND AS #1

PRINT #1, ""
PRINT #1, "FOR i = 1 to 20000"
PRINT #1, "NEXT i"
PRINT #1, "GET (1, 31)-(319, 199), Scoogley1%"
PRINT #1, "PUT (1, 31), Scoogley2%"
PRINT #1, ""

CLOSE #1

CLS
END IF

IF hard = 0 THEN
GET (1, 31)-(319, 199), Scoogley2%
PUT (1, 31), Scoogley1%

OPEN c$ FOR APPEND AS #1

PRINT #1, ""
PRINT #1, "FOR i = 1 to 20000"
PRINT #1, "NEXT i"
PRINT #1, "GET (1, 31)-(319, 199), Scoogley2%"
PRINT #1, "PUT (1, 31), Scoogley1%"
PRINT #1, ""

CLOSE #1

CLS
END IF
RETURN

SUB nothing
END SUB

