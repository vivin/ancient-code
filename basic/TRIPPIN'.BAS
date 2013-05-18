'PROGRAM NAME.........TRIPPIN.GRA ,TRIPPN5.GRA
'WRITTEN BY...........JOHN HARTMAN
'DATE..................03 -15 - 95,revised;03-16-95,03,20,95
'PURPOSE: PROGRAM TO EXIBIT GRAPHIC PROGRAMMING AND ALSO JUST TO TAKE
'         ON A LITTLE TRIP

'*************************** PROGRAM MAINLINE*********************************
GOSUB INTRO
GOSUB SELFDESTRUCT
GOSUB LANDSCAPE
GOSUB DECENDINGCIRCLES
GOSUB MOVINGTUNNEL
GOSUB LINESWEEP
GOSUB ENDING
END


'************************** INTRODUCTION ************************************
INTRO:
CLS
COLOR 7, 0
LOCATE 5, 20
INPUT "ENTER NAME ", NAME$
LOCATE 7, 20
PRINT "HI, "; NAME$; " HOW ARE YOU? (GOOD/NOT GOOD) ";
INPUT "", ANS$
LET ANS$ = UCASE$(ANS$)
IF ANS$ = "GOOD" THEN
LOCATE 9, 20
PRINT "HEY, THAT'S COOL I'M REALLY GLAD TO HEAR THAT. "; NAME$; "."
ELSEIF ANS$ = "NOT GOOD" THEN
LOCATE 9, 20
PRINT "I AM REALLY SORRY TO HEAR THAT "; NAME$; "."
ELSE
LOCATE 9, 20
INPUT "INVALID RESPONSE PLEASE TRY AGAIN. ", ANS$
END IF
LOCATE 11, 20
INPUT "WOULD YOU LIKE TO TAKE A TRIP? (Y/N)", ANS$
IF UCASE$(ANS$) = "N" THEN
LOCATE 13, 10
PRINT "THAT'S TOO BAD BECAUSE THAT'S THE ONLY WAY OUT OF THIS PROGRAM.";
INPUT "", DUMMY$
ELSE
END IF
RETURN
'*************************** SELF DESTRUCT MODE ******************************
SELFDESTRUCT:
IMAGE = 219  'ASCII CODE CHARECTER
TL = 1      'less than BL and less than 23 (TL = TOP LENGTH)
BL = 24      'not more than 24             (BL = BOTTOM LEGNTH)
LW = 1                                    '(LW = LEFT WIDTH)
RW = 80      'not more than 80            '(RW = RIGHT WIDTH)
L = TL
W = LW
CLS
DO UNTIL BL < 10
DO WHILE L <= BL
    IF L = TL OR L = BL THEN
    DO WHILE W <= RW
        LOCATE L, W
        PRINT CHR$(IMAGE)
        LET W = W + 1
    LOOP
    LET W = LW
    END IF
        LOCATE L, LW
        PRINT CHR$(IMAGE)
        LOCATE L, RW
        PRINT CHR$(IMAGE)
        LET L = L + 1
LOOP
LET TL = TL + 1
LET BL = BL - 1
LET LW = LW + 1
LET RW = RW - 1
LET L = TL
LET W = LW
LOOP
RETURN
PRINT STRING$(0, CHR$(7))
COLOR 16, 7
LOCATE 7, 31
PRINT "SELF DESTRUCT"
LOCATE 24, 1
PRINT "                                                                                 "
COLOR 0, 7
LOCATE 9, 24
PRINT "LEVEL 40 SECURITY ACCESSED"
LOCATE 11, 20
PRINT "YOU HAVE STARTED SELF-DESTRUCT MODE"
COLOR 16, 7
LOCATE 14, 28
PRINT "CLEAR THE BUILDING"
PRINT STRING$(0, CHR$(7))
WIDTH (40)
LOCATE 11, 11
PRINT "SELF DESTRUCT MODE"
LOCATE 24, 1
PRINT "                                                                               "
RETURN
'*************************** LANDSCAPE SECTION ****************************
LANDSCAPE:
DO WHILE AB$ = ""
    CLS
    SCREEN 8
  ' PAINT (0, 1), 1     PAINT STATEMENTS OBSELETE W/CLS AND WHITE PAINT
  ' PAINT (630, 20), 1
    lpp = 96                        'left pivot point
    rpp = 320                       'right pivot point
    ULW = 1                         'upper left width
    urw = 96                        'upper right width
    llw = 1                         'lower left width
    LRW = 96                        'lower right width
    LET CenW = 16                   'cirle horizontal cordinence
    LET CenH = 20                   'circle verticle coordinance
    LET R = 90                      'circle radius
    LET CenW2 = 320                 'circle 2 horizontal coordinance
    LET CenH2 = 96                  'circle 2 verticle coordinance
    LET R2 = 50                     'circle 2 radius
    DO WHILE ULW < 16614            'Loop terminater;sets program time
        ULW = ULW + 28              '    for landscape section.
        LINE (1, lpp)-(ULW, 1)
        urw = urw - 14
        LINE (rpp, lpp)-(urw, 1)
        llw = llw + 119
        LINE (321, 96)-(llw, 193)
        LRW = LRW - 2
        LINE (rpp, 96)-(LRW, 193)
        CIRCLE (CenW, CenH), R, 1
        LET CenW = CenW + 2.59
        LET CenH = CenH + 1
        LET R = R + 1.25
        '**********************************Pie Shapped Image
        CIRCLE (CenW2, CenH2), R2, 1, 3.14 / 3, -3.14
        LET CenW2 = CenW2 - 2
        LET CenH2 = CenH2 + 2
        LET R2 = R2 + 2
    LOOP
    CIRCLE (152, 70), 25, 0
    PAINT (122, 30), 0, 0
    LINE (350, 1)-(640, 68), 0, BF
'********************* pause momentarily to view landscape ******************
    LET PAUSE = 0
    DO UNTIL PAUSE = 4000
        LET PAUSE = PAUSE + 1
    LOOP
RETURN
'**************************** MOVING TUNNEL MODE ****************************
MOVINGTUNNEL:
    LET COUNT = 0
    PER1 = .19  'percentage
    per2 = .21  'percentage
    LET T = .5  'rate added to terminating variable
    LET S1 = 1  'switch to set color of box
    LET S2 = 0  'contra switch to set opposite color of every other box
    DO UNTIL COUNT >= 31   'Timer fo tunnel section
        ULW = 320       'upper left width
        ULH = 94        'upper left hidth
        LRW = 323       'lower right width
        LRH = 95        'lower righ hidth
        ULW2 = ULW - (ULW * PER1)
        ULH2 = ULH - (ULH * per2)
        LRW2 = LRW + (LRW * PER1)
        LRH2 = LRH + (LRH * per2)
        ULW3 = ULW - (ULW * PER1) * 2
        ULH3 = ULH - (ULH * per2) * 2
        LRW3 = LRW + (LRW * PER1) * 2
        LRH3 = LRH + (LRH * per2) * 2
        ULW4 = ULW - (ULW * PER1) * 3
        ULH4 = ULH - (ULH * per2) * 3
        LRW4 = LRW + (LRW * PER1) * 3
        LRH4 = LRH + (LRH * per2) * 3
        ULW5 = ULW - (ULW * PER1) * 4
        ULH5 = ULH - (ULH * per2) * 4
        LRW5 = LRW + (LRW * PER1) * 4
        LRH5 = LRH + (LRH * per2) * 4
        ULW6 = ULW - (ULW * PER1) * 5
        ULH6 = ULH - (ULH * per2) * 5
        LRW6 = LRW + (LRW * PER1) * 5
        LRH6 = LRH + (LRH * per2) * 5
        DO UNTIL ULW <= 300 'sets amount at which boxes expand
            ULW = ULW - T
            ULH = ULH - T          'BOX 1 (INNER BOX)
            LRW = LRW + T
            LRH = LRH + T
            LINE (ULW, ULH)-(LRW, LRH), S1, B
            ULW2 = ULW2 - T
            ULH2 = ULH2 - T
            LRW2 = LRW2 + T      '*** BOX 2 *****
            LRH2 = LRH2 + T
            LINE (ULW2, ULH2)-(LRW2, LRH2), S2, B
            ULW3 = ULW3 - T
            ULH3 = ULH3 - T
            LRW3 = LRW3 + T
            LRH3 = LRH3 + T       'BOX 3
            LINE (ULW3, ULH3)-(LRW3, LRH3), S1, B
            ULW4 = ULW4 - T
            ULH4 = ULH4 - T
            LRW4 = LRW4 + T         'BOX 4
            LRH4 = LRH4 + T
            LINE (ULW4, ULH4)-(LRW4, LRH4), S2, B
            ULW5 = ULW5 - T
            ULH5 = ULH5 - T
            LRW5 = LRW5 + T          'BOX5
            LRH5 = LRH5 + T
            LINE (ULW5, ULH5)-(LRW5, LRH5), S1, B
            ULW6 = ULW6 - T
            ULH6 = ULH6 - T
            LRW6 = LRW6 + T           'BOX 6
            LRH6 = LRH6 + T
            LINE (ULW6, ULH6)-(LRW6, LRH6), S2, B
            LINE (299, 74)-(320, 94), 0
            LINE (323, 94)-(344, 74), 0
            LINE (299, 115)-(320, 94), 0
            LINE (323, 94)-(344, 115), 0
            LINE (258, 74)-(238, 55), 0
            LINE (385, 74)-(405, 55), 0
            LINE (238, 134)-(258, 115), 0
            LINE (385, 115)-(405, 134), 0 'lines to connect boxes making 3D
            LINE (197, 55)-(176, 35), 0
            LINE (446, 55)-(467, 35), 0
            LINE (177, 155)-(198, 135), 0
            LINE (445, 135)-(466, 155), 0
            LINE (137, 34)-(117, 15), 0
            LINE (137, 155)-(117, 175), 0
            LINE (507, 35)-(528, 15), 0
            LINE (507, 155)-(528, 175), 0
            LINE (76, 15)-(58, 1), 0
            LINE (57, 194)-(76, 175), 0
            LINE (567, 15)-(585, 1), 0
            LINE (567, 175)-(589, 193), 0
            LINE (18, 193)-(1, 200), 0
            LINE (258, 115)-(299, 115), 0
            LINE (344, 115)-(385, 115), 0
            LINE (198, 135)-(238, 135), 0
            LINE (405, 134)-(446, 134), 0
            LINE (136, 155)-(176, 155), 0
            LINE (528, 175)-(567, 175), 0
            LINE (585, 193)-(625, 193), 0
            LINE (57, 193)-(18, 193), 0
            LINE (76, 175)-(115, 175), 0
            LINE (465, 155)-(507, 155), 0
        LOOP
        IF S1 = 1 THEN     'reverses switch
            LET S1 = 0
        ELSE S1 = 1
        END IF
        IF S2 = 0 THEN
            LET S2 = 1
        ELSE S2 = 0
        END IF
        LET COUNT = COUNT + 1
    LOOP
    triangle$ = "F75 L150 E75"
    DRAW "C2 X" + VARPTR$(triangle$)
    DRAW "BE0 P1,0 C3 M+0,+89"
    LET count5 = 0
    DO UNTIL count5 = 2500        'timer for triangle
        LET count5 = count5 + 1
    LOOP
RETURN
'************************** DECENDING CIRCLES MODE **************************
DECENDINGCIRCLES:
    LET R9 = 2    'radius of circle
    LET CIRH = 200 'circle horizontal coordinance (X)
    LET CIRV = 1   'circle virticle coordinance (Y)
    LET CIR2H = 400 'circle #2  horizontal coordinance
    LET CIR2V = 1   'circle #2 virticle coordinance
    LET R8 = 2 'circle #2 radius
    LET SLINEX = 320   'Starting Line (X) coordinance
    LET SLINEY = 1     'Starting Line (Y) coordinance
    LET ELINEX = 320   'Ending Line (X) coor.
    LET ELINEY = 200   'Ending Line (Y) coor.
    LET SX = 1.5
    LET SY = 1.9
    LET EX = 1.5
    LET EY = 1
    LET SLINEX2 = 640
    LET SLINEY2 = 1
    LET ELINEX2 = 1
    LET ELINEY2 = 2
    DO UNTIL R9 >= 230
        IF ELINEX >= 340 THEN
            LET EX = EX * -1
        ELSEIF ELINEX <= 0 THEN
            LET EX = EX * -1
        END IF
        IF SLINEX >= 640 THEN
            LET SX = SX * -1
        ELSEIF SLINEX <= 120 THEN
            LET SX = SX * -1
        END IF
            CIRCLE (CIRH, CIRV), R9, 1
            LET R9 = R9 + 1   'enlarge radius of circle
            LET CIRH = CIRH + 1 'change horizontal position of circle
            LET CIRV = CIRV + .5'change verticle position of circle
            CIRCLE (CIR2H, CIR2V), R8, 0
            LET R8 = R8 + 1
            LET CIR2H = CIR2H - 1
            LET CIR2V = CIR2V + .5
            LINE (SLINEX, SLINEY)-(ELINEX, ELINEY), 0, BF, 22 '***BF=Box Fill
            LET SLINEX = SLINEX + SX
            LET SLINEY = SLINEY + SY
            LET ELINEX = ELINEX + EX
            LET ELINEY = ELINEY + EY
            LINE (SLINEX2, SLINEY2)-(ELINEX2, ELINEY2)
            LET SLINEX2 = SLINEX2 + SX
            LET SLINEY2 = SLINEY2 + SY
            LET ELINEX2 = ELINEX2 + EX
            LET ELINEY2 = ELINEY2 + EY
    LOOP
RETURN
'************************* Diaganal 360 degree SWEEPING LINE *****************
LINESWEEP:
    VIEW (0, 0)-(639, 199), , 3
    WINDOW (0, 0)-(200, 200)
    PAINT (1, 1), 8, 12
    LET L3X1 = 0
    LET L3Y1 = 0
    LET L3X2 = 140
    LET L3Y2 = 36
    L3X1RATE = .25
    L3Y1RATE = .1
    L3X2RATE = .25
    L3Y2RATE = .1
    LET RATE1 = .25
    LET WX1 = 1
    LET WY1 = 1
    LET WX2 = 130
    LET WY2 = 36
    LET R5 = 5.5
    LET COUNT2 = 0
    '*** first 360degree sweep (white)
    DO UNTIL COUNT2 >= 300              'timer for sweep section
        IF SWITCH = 1 THEN  'switch to change VIEW and WINDOW
                VIEW (36, 1)-(615, 199)
                WINDOW (WX1, WY1)-(WX2, WY2)
            ELSE
                VIEW (0, 25)-(635, 190)
                WINDOW (0, 0)-(140, 36)
            END IF
        LINE (L3X1, L3Y1)-(L3X2, L3Y2), 5
           
            IF L3X2 >= 140 THEN
                DO UNTIL L3Y2 <= 0
                    LINE (L3X1, L3Y1)-(L3X2, L3Y2), 5
                    LET L3Y2 = L3Y2 - L3Y2RATE
                    LET L3Y1 = L3Y1 + L3Y1RATE
                LOOP
            END IF
        IF L3Y2 <= 0 THEN
            DO UNTIL L3X2 <= 0
                LINE (L3X1, L3Y1)-(L3X2, L3Y2), 3
                LET L3X2 = L3X2 - L3X2RATE
                LET L3X1 = L3X1 + L3X1RATE
            LOOP
        END IF
        IF L3X2 <= 0 THEN
            DO UNTIL L3Y2 >= 36
                LINE (L3X1, L3Y1)-(L3X2, L3Y2), 3
                LET L3Y2 = L3Y2 + L3Y2RATE
                LET L3Y1 = L3Y1 - L3Y1RATE
            LOOP
        END IF
        IF L3Y2 >= 36 THEN
            DO UNTIL L3X2 >= 140
                LINE (L3X1, L3Y1)-(L3X2, L3Y2), 9
                LET L3X2 = L3X2 + L3X2RATE
                LET L3X1 = L3X1 - L3X1RATE
            LOOP
        END IF
        LINE (L3X1, L3Y1)-(L3X2, L3Y2), 0
    '*** second 360 degree sweep (black)
        IF L3X2 >= 140 THEN
            DO UNTIL L3Y2 <= 0
                LINE (L3X1, L3Y1)-(L3X2, L3Y2), 0
                LET L3Y2 = L3Y2 - L3Y2RATE
                LET L3Y1 = L3Y1 + L3Y1RATE
            LOOP
        END IF
        IF L3Y2 <= 0 THEN
            DO UNTIL L3X2 <= 0
                LINE (L3X1, L3Y1)-(L3X2, L3Y2), 0
                LET L3X2 = L3X2 - L3X2RATE
                LET L3X1 = L3X1 + L3X1RATE
            LOOP
        END IF
        IF L3X2 <= 0 THEN
            DO UNTIL L3Y2 >= 36
                LINE (L3X1, L3Y1)-(L3X2, L3Y2), 0
                LET L3Y2 = L3Y2 + L3Y2RATE
                LET L3Y1 = L3Y1 - L3Y1RATE
            LOOP
        END IF
        IF L3Y2 >= 36 THEN
            DO UNTIL L3X2 >= 140
                LINE (L3X1, L3Y1)-(L3X2, L3Y2), 0
                LET L3X2 = L3X2 + L3X2RATE
                LET L3X1 = L3X1 - L3X1RATE
            LOOP
        END IF
    LET L3X1RATE = L3X1RATE + RATE1  'Equals rates so they can be modified
    LET L3Y1RATE = L3Y1RATE + RATE1  'w/one control and remain proportionately
    LET L3X2RATE = L3X2RATE + RATE1  'the same.
    LET L3Y2RATE = L3Y2RATE + RATE1

    LET WX1 = WX1 + R5   'Changing Window Coordinance  R5 = rate
    LET WY1 = WYI + R5
    LET WX2 = WX2 - R5 'WINDOW (X) coordinance = WX2 and WX1
    LET WT2 = WY2 - R5
    IF WX1 >= 200 OR WX1 <= 0 THEN
        LET R5 = R5 * -1
    END IF
        IF SWITCH = 1 THEN       'change switch to change color
            LET SWITCH = 0
        ELSE
            LET SWITCH = 1
        END IF
        LET COUNT2 = COUNT2 + 1
    LOOP
    VIEW   'reset view to normal (whole screen)
    WINDOW 'reset WINDOW to normal
RETURN
'**************************** ENDING MODE ***********************************
ENDING:
    PAINT (1, 1), 0
    LET R9 = 2
    LET CIRH = 200
    LET CIRV = 1
    LET CIR2H = 400
    LET CIR2V = 1
    LET R8 = 2
    LET SLINEX = 320
    LET SLINEY = 1
    LET ELINEX = 320
    LET ELINEY = 200
    LET SX = 21.5
    LET SY = 1.9
    LET EX = 51.5
    LET EY = 81
    LET SLINEX2 = 640
    LET SLINEY2 = 1
    LET ELINEX2 = 1
    LET ELINEY2 = 2
    DO UNTIL R9 >= 110
        PRINT TAB(34); " TRIPPIN' "
        PRINT
        IF ELINEX >= 340 THEN
            LET EX = EX * -1
        ELSEIF ELINEX <= 0 THEN
            LET EX = EX * -1
        END IF
        IF SLINEX >= 640 THEN
            LET SX = SX * -1
        ELSEIF SLINEX <= 120 THEN
            LET SX = SX * -1
        END IF
        CIRCLE (CIRH, CIRV), R9, 0
        LET R9 = R9 + 1
        LET CIRH = CIRH + 1
        LET CIRV = CIRV + .5
        CIRCLE (CIR2H, CIR2V), R8, 1
        LET R8 = R8 + 1
        LET CIR2H = CIR2H - 1
        LET CIR2V = CIR2V + .5
        LINE (SLINEX, SLINEY)-(ELINEX, ELINEY), 1, BF, 22
        LET SLINEX = SLINEX + SX
        LET SLINEY = SLINEY + SY
        LET ELINEX = ELINEX + EX
        LET ELINEY = ELINEY + EY
        LINE (SLINEX2, SLINEY2)-(ELINEX2, ELINEY2), 1
        LET SLINEX2 = SLINEX2 + SX
        LET SLINEY2 = SLINEY2 + SY
        LET ELINEX2 = ELINEX2 + EX
        LET ELINEY2 = ELINEY2 + EY
    LOOP
    PAINT (1, 1), 1
    LET SLINE8X = 302 'STARTING LINE #8 COORDINATE "X" (HORIZONTAL POSITION)
    LET SLINE8Y = 100 '    " "   " "      "  "     "Y" (VERTICLE POSITION)
    LET ELINE8X = 202  'ENDING LINE #8,COORDINATE "X"
    LET ELINE8Y = 199
    DO UNTIL ELINE8X >= 402
        LINE (SLINE8X, SLINE8Y)-(ELINE8X, ELINE8Y), 0
        LET ELINE8X = ELINE8X + .1
    LOOP
'****** my name in ascii code to deter people from inserting their own name
    PRINT TAB(31); CHR$(66); CHR$(89); CHR$(58); CHR$(32);
    PRINT CHR$(74); CHR$(79); CHR$(72); CHR$(78); CHR$(32);
    PRINT CHR$(72); CHR$(65); CHR$(82); CHR$(84); CHR$(77);
    PRINT CHR$(65); CHR$(78); "                                  "
    LET AB$ = INKEY$ 'program will loop until any key is pressed
    LET COUNT8 = 0
    DO UNTIL COUNT8 = 15000        'PAUSE BEFORE RESTARTING PROGRAM
        LET COUNT8 = COUNT8 + 1
    LOOP
LOOP
RETURN
'*************************** END OF TRIP *************************************

