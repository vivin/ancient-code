'***
'*** original source modified by Tim Kostka
'*** 'http://www.geocities.com/SiliconValley/Heights/8967/index.htm'

DECLARE SUB Intro ()
DECLARE SUB Setscr ()
DECLARE SUB Tmr ()
DECLARE SUB Main ()
DECLARE SUB Number ()
DECLARE SUB LED (num$)
SCREEN 12
CLS
Setscr
Intro
Main
END

SUB Intro
PRINT
PRINT "    A             B"
Setscr
LOCATE 10, 10: PRINT "* * * * * * * * About this demo * * * * * * * * "
LOCATE 11, 10: PRINT "*                                              *"
LOCATE 12, 10: PRINT "*              --Timer and number--            *"
LOCATE 13, 10: PRINT "* Timer-- A digital clock.                     *"
LOCATE 14, 10: PRINT "* Number- You enter a number, and the display  *"
LOCATE 15, 10: PRINT "*         displays it.                         *"
LOCATE 16, 10: PRINT "*                                              *"
LOCATE 17, 10: PRINT "*                 --The windows--              *"
LOCATE 18, 10: PRINT "*                                              *"
LOCATE 19, 10: PRINT "* A-- This is where the numbers are displayed. *"
LOCATE 20, 10: PRINT "* B-- This is where the messages are displayed.*"
LOCATE 21, 10: PRINT "*                (Press any key)               *"
LOCATE 22, 10: PRINT "* * * * * * * * * * * * * * * * * * * * * * * * "
DO WHILE INKEY$ = "": LOOP
END SUB

SUB LED (num$)
num$ = LTRIM$(RTRIM$(num$))
n% = VAL(num$)

num2% = VAL(RIGHT$(num$, 1))
num1% = VAL(LEFT$(num$, 1))
IF LEN(num$) = 1 THEN
num1% = 0
END IF
SELECT CASE num1%
        CASE 1
        upperright% = 12: lowerright% = 12: upperleft% = 4: lowerleft% = 4: up% = 4: mid% = 4: low% = 4
        CASE 2
        upperright% = 12: lowerright% = 4: upperleft% = 4: lowerleft% = 12: up% = 12: mid% = 12: low% = 12
        CASE 3
        upperright% = 12: lowerright% = 12: upperleft% = 4: lowerleft% = 4: up% = 12: mid% = 12: low% = 12
        CASE 4
        upperright% = 12: lowerright% = 12: upperleft% = 12: lowerleft% = 4: up% = 4: mid% = 12: low% = 4
        CASE 5
        upperright% = 4: lowerright% = 12: upperleft% = 12: lowerleft% = 4: up% = 12: mid% = 12: low% = 12
        CASE 6
        upperright% = 4: lowerright% = 12: upperleft% = 12: lowerleft% = 12: up% = 12: mid% = 12: low% = 12
        CASE 7
        upperright% = 12: lowerright% = 12: upperleft% = 12: lowerleft% = 4: up% = 12: mid% = 4: low% = 4
        CASE 8
        upperright% = 12: lowerright% = 12: upperleft% = 12: lowerleft% = 12: up% = 12: mid% = 12: low% = 12
        CASE 9
        upperright% = 12: lowerright% = 12: upperleft% = 12: lowerleft% = 4: up% = 12: mid% = 12: low% = 12
        CASE 0
        upperright% = 12: lowerright% = 12: upperleft% = 12: lowerleft% = 12: up% = 12: mid% = 4: low% = 12
END SELECT
SELECT CASE num2%
        CASE 1
        upperright2% = 12: lowerright2% = 12: upperleft2% = 4: lowerleft2% = 4: up2% = 4: mid2% = 4: low2% = 4
        CASE 2
        upperright2% = 12: lowerright2% = 4: upperleft2% = 4: lowerleft2% = 12: up2% = 12: mid2% = 12: low2% = 12
        CASE 3
        upperright2% = 12: lowerright2% = 12: upperleft2% = 4: lowerleft2% = 4: up2% = 12: mid2% = 12: low2% = 12
        CASE 4
        upperright2% = 12: lowerright2% = 12: upperleft2% = 12: lowerleft2% = 4: up2% = 4: mid2% = 12: low2% = 4
        CASE 5
        upperright2% = 4: lowerright2% = 12: upperleft2% = 12: lowerleft2% = 4: up2% = 12: mid2% = 12: low2% = 12
        CASE 6
        upperright2% = 4: lowerright2% = 12: upperleft2% = 12: lowerleft2% = 12: up2% = 12: mid2% = 12: low2% = 12
        CASE 7
        upperright2% = 12: lowerright2% = 12: upperleft2% = 12: lowerleft2% = 4: up2% = 12: mid2% = 4: low2% = 4
        CASE 8
        upperright2% = 12: lowerright2% = 12: upperleft2% = 12: lowerleft2% = 12: up2% = 12: mid2% = 12: low2% = 12
        CASE 9
        upperright2% = 12: lowerright2% = 12: upperleft2% = 12: lowerleft2% = 4: up2% = 12: mid2% = 12: low2% = 12
        CASE 0
        upperright2% = 12: lowerright2% = 12: upperleft2% = 12: lowerleft2% = 12: up2% = 12: mid2% = 4: low2% = 12
END SELECT

CLS
' Start of digit two.
'upper left
LINE (32, 12)-(32, 23), upperleft2%
LINE (33, 12)-(33, 23), upperleft2%
'top
LINE (34, 11)-(45, 11), up2%
LINE (34, 10)-(45, 10), up2%
'lower left
LINE (32, 26)-(32, 36), lowerleft2%
LINE (33, 26)-(33, 36), lowerleft2%
'center
LINE (34, 25)-(45, 25), mid2%
LINE (34, 24)-(45, 24), mid2%
'lowest
LINE (34, 38)-(45, 38), low2%
LINE (34, 37)-(45, 37), low2%
'upper right
LINE (46, 12)-(46, 23), upperright2%
LINE (47, 12)-(47, 23), upperright2%
'lower right
LINE (46, 26)-(46, 36), lowerright2%
LINE (47, 26)-(47, 36), lowerright2%
' Start of digit one.
'upper left
LINE (12, 12)-(12, 23), upperleft%
LINE (13, 12)-(13, 23), upperleft%
'top
LINE (14, 11)-(25, 11), up%
LINE (14, 10)-(25, 10), up%
'lower left
LINE (12, 26)-(12, 36), lowerleft%
LINE (13, 26)-(13, 36), lowerleft%
'center
LINE (14, 25)-(25, 25), mid%
LINE (14, 24)-(25, 24), mid%
'lowest
LINE (14, 38)-(25, 38), low%
LINE (14, 37)-(25, 37), low%
'upper right
LINE (26, 12)-(26, 23), upperright%
LINE (27, 12)-(27, 23), upperright%
'lower right
LINE (26, 26)-(26, 36), lowerright%
LINE (27, 26)-(27, 36), lowerright%

END SUB

SUB Main
CLS
PRINT ""
PRINT "   \ /    Timer or number? T/N? "
PRINT "   / \"
Setscr
DO
ch$ = INKEY$
LOOP WHILE ch$ = ""
IF ch$ = "T" OR ch$ = "t" THEN
        Tmr
ELSE
        Number
END IF
END SUB

SUB Number
LOCATE 3, 11: INPUT "Number: ", nm$
IF VAL(nm$) = 0 AND nm$ <> "0" THEN
CLS
PRINT
LOCATE 2, 8: PRINT " Input must be a number."
Setscr
DO WHILE INKEY$ = "": LOOP
ELSE
LED nm$
Setscr
END IF
LOCATE 2, 12: PRINT "Again? Y/N?"
Setscr
DO
ch2$ = INKEY$
LOOP WHILE ch2$ = ""
IF ch2$ = "Y" OR ch2$ = "y" THEN
        Main
ELSE
        END
END IF


END SUB

SUB Setscr
LINE (5, 4)-(5, 50), 5
LINE (5, 4)-(250, 4), 5
LINE (60, 4)-(60, 50), 5
LINE (5, 50)-(250, 50), 5
LINE (250, 4)-(250, 50), 5
END SUB

SUB Tmr
count% = 0
DO WHILE INKEY$ = ""
count% = count% + 1
IF count% = 99 THEN
CLS
LOCATE 2, 12: PRINT "Cannot count above 100."
DO WHILE INKEY$ = "": LOOP
END
END IF
SLEEP 1
i$ = STR$(count%)
LED i$
Setscr
LOCATE 2, 14: PRINT "Counting"
LOCATE 3, 10: PRINT "Press any key to stop."
Setscr
LOOP
Setscr
LOCATE 2, 12: PRINT "Again? Y/N?"
LOCATE 3, 10: PRINT "                      "
Setscr
DO
ch2$ = INKEY$
LOOP WHILE ch2$ = ""
IF ch2$ = "Y" OR ch2$ = "y" THEN
        Main
ELSE
        END
END IF

END SUB

