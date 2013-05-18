'***
'                                  C O O L
'                              G R A P H I C S
'F5 to run
'By S.M Soft 1997
'E-Mail:smsoft@geocities.com
'Homepage:http://www.geocities.com/SiliconValley/Way/5458
'If you like this you will also like our other grahpics demo's.
'To get them visit our homepage and you can download them all
'as soon as they come out!!!
'Our page is updated dayly!!!














DECLARE SUB GRA3 ()
DECLARE SUB GRA2 ()
DECLARE SUB GRA ()
DECLARE SUB COOL2 ()
DECLARE SUB COOL ()
DECLARE SUB TWOTUN ()
DECLARE SUB EYE2 ()
DECLARE SUB EYE ()
DECLARE SUB COOL4 ()
DECLARE SUB COOL3 ()
DECLARE SUB C ()
SCREEN 13
PRINT
PRINT
PRINT
PRINT
title:
SCREEN 13
CLS
COLOR 2
PRINT ""
PRINT "       S.M SOFT AS A LAMB GRAPHICS! "
PRINT "                                  "
PRINT "             1.Start in order"
PRINT "             2.Randomize"
PRINT "             3.About"
PRINT "             4.Exit"
PLAY "MB T100 O3 L8 GFE-FGGG"
keys:
a$ = INKEY$
IF a$ = "1" THEN GOTO START
IF a$ = "2" THEN GOTO RAND
IF a$ = "3" THEN GOTO about
GOTO keys
START:
SCREEN 13
EYE
COOL
EYE2
C
COOL3
TWOTUN
COOL4
GRA
GRA2
GRA3
GOTO START
RAND:
RANDOMIZE TIMER
X = INT(RND * 12 + 1)
IF X = 1 THEN EYE
IF X = 2 THEN COOL
IF X = 4 THEN COOL3
IF X = 5 THEN C
IF X = 6 THEN EYE2
IF X = 7 THEN COOL3
IF X = 8 THEN COOL4
IF X = 9 THEN TWOTUN
IF X = 10 THEN GRA
IF X = 11 THEN GRA2
IF X = 12 THEN GRA3
GOTO RAND
about:
SCREEN 9: SCREEN 0
COLOR 2
PRINT
PRINT
PRINT
PRINT
PRINT
PRINT "      ******************By James Simmonds 1997*************************"
PRINT "      ****************Alot of graphics demo's in 1!!!******************"
PRINT "      ************This programme took 1 month to compleate*************"
PRINT "      ****************But give me a break I am only 12*****************"
PRINT "      ************I go to the Grange School in stourbrige**************"
PRINT "      ***********It is the tenth best school in the contry*************"
PRINT "      **********************But is still sucks!!!**********************"
PRINT "      ****************We need more members of S.M Soft*****************"
PRINT "      *************If you want to be in S.M Soft E-Mail us*************"
PRINT "      ******************For more visit our homepage at:****************"
PRINT "      ***********http:\\geocities\siliconvalley\way\5458***************"
PRINT "      *****************We also do Acorn Arcermdes software*************"
PRINT "      ***************Our latest Arc programme is called Weave**********"
PRINT "      *****************Weave will be out for QBasic soon!**************"
PRINT "      ****************Press any key to go to title screen**************"
SLEEP
GOTO title

SUB C
CLS
FOR X = 1 TO 200
 FOR y = 1 TO 320: NEXT y
 LINE (X, X)-(X, 500), X
 CIRCLE (150, 90), X, X
 CIRCLE (150, 110), X, X
 LINE ((320 - X), 500)-((320 - X), X), X
 LINE (X, X)-(1, X), X
 LINE (X, X)-(320, X), X
NEXT X
END SUB

SUB COOL
CLS
FOR X = 1 TO 100
CIRCLE (100, 90), X, X
CIRCLE (200, 90), X, X
CIRCLE (150, 45), X, X
CIRCLE (150, 140), X, X
FOR y = 1 TO 500: NEXT y
NEXT X
END SUB

SUB COOL3
CLS
FOR X = 1 TO 100
CIRCLE (100, 90), X, X
CIRCLE (200, 90), X, X
FOR y = 1 TO 500: NEXT y
NEXT X
FOR X = 1 TO 1500: NEXT X
FOR X = 31 TO 100
CIRCLE (150, 90), X, X
FOR y = 1 TO 500: NEXT y
NEXT X
FOR X = 150 TO 20 STEP -1
CIRCLE (80, 90), X, X
CIRCLE (220, 90), X, X
FOR y = 1 TO 500: NEXT y
NEXT X
FOR X = 1 TO 80
 FOR y = 1 TO 320: NEXT y
 LINE (X, X)-(X, 500), X
 LINE ((320 - X), 500)-((320 - X), X), X
 LINE (X, X)-(1, X), X
 LINE (X, X)-(320, X), X
NEXT X
FOR X = 110 TO 1 STEP -1
 FOR y = 1 TO 320: NEXT y
 LINE (X, X)-(X, 500), X
 LINE ((320 - X), 500)-((320 - X), X), X
 LINE (X, X)-(1, X), X
 LINE (X, X)-(320, X), X
NEXT X

END SUB

SUB COOL4
CLS
FOR X = 17 TO 200
CIRCLE (120, 90), X, X
CIRCLE (180, 90), X, X
CIRCLE (150, 90), X, X
FOR y = 1 TO 1500: NEXT y
NEXT X
END SUB

SUB EYE
CLS
FOR X = 1 TO 500
CIRCLE (150, 90), X, X, , , 14 / X
NEXT X
FOR X = 1 TO 500
CIRCLE (150, 90), X, X, , , X / 23
NEXT X
END SUB

SUB EYE2
CLS
a = 1
FOR X = 1 TO 200
CIRCLE (150, 30), X, a
CIRCLE (150, 150), X, a
a = a + 1
NEXT X
FOR X = 1 TO 7000: NEXT X
END SUB

SUB GRA
 CLS
 FOR X = 1 TO 200
 FOR y = 1 TO 320: NEXT y
 LINE (X, X)-(X, 500), X
 LINE ((320 - X), 500)-((320 - X), X), X
 LINE (X, X)-(X, X), X
 LINE (X, X)-(X, X), X
CIRCLE (150, X), X, X
NEXT X
END SUB

SUB GRA2
CLS
FOR X = 1 TO 200
CIRCLE (150, X), X, X, , , 50 / X
CIRCLE (150, 90), X, X
FOR y = 1 TO 500: NEXT y
NEXT X
END SUB

SUB GRA3
CLS
FOR X = 50 TO 150
CIRCLE (100, 90), X, X
CIRCLE (130, 90), X, X
CIRCLE (200, 90), X, X
CIRCLE (170, 90), X, X
CIRCLE (150, 90), X, X
CIRCLE (150, 70), X, X
CIRCLE (150, 110), X, X
FOR DEL = 1 TO 1500: NEXT DEL
NEXT X

END SUB

SUB TWOTUN
CLS
FOR X = 1 TO 500
CIRCLE (130, X), X, X
CIRCLE (160, X), X, X
CIRCLE (190, X), X, X
NEXT X
END SUB

