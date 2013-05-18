



'-----------------------------------------------------------------------------

'|                                                                           |

'|                           M E G A R A P H I C S                           |

'|                                                                           |

'|                                Version 5.4                                |

'|                                                                           |

'|                           Copyright (C) 1994, 95                          |

'|                             Domino Productions                            |

'|                                                                           |

'-----------------------------------------------------------------------------

'                         ***SHIFT + F5 TO START***

DECLARE SUB bw ()

DECLARE SUB hash ()

DECLARE SUB spotty ()

DECLARE SUB randomstart ()

DECLARE SUB again ()

DECLARE SUB butterfly ()

DECLARE SUB cavecolors ()

DECLARE SUB frogtwist ()

DECLARE SUB revolve ()

DECLARE SUB shakylog ()

DECLARE SUB starwheel ()

DECLARE SUB directend ()

DECLARE SUB lastarm ()

DECLARE SUB bigeye ()

DECLARE SUB birdeyes ()

DECLARE SUB boxfill ()

DECLARE SUB circlesnake ()

DECLARE SUB circlesquare ()

DECLARE SUB circlestar ()

DECLARE SUB closer ()

DECLARE SUB colordiamond ()

DECLARE SUB differentcircles ()

DECLARE SUB emptybox ()

DECLARE SUB emptylinecircle ()

DECLARE SUB filledin ()

DECLARE SUB final ()

DECLARE SUB fountain ()

DECLARE SUB growshapes ()

DECLARE SUB kaliedascreen ()

DECLARE SUB lightshow ()

DECLARE SUB logcross ()

DECLARE SUB oppositespirals ()

DECLARE SUB pipediamond ()

DECLARE SUB piperibbon ()

DECLARE SUB plaidfill ()

DECLARE SUB ripples ()

DECLARE SUB ripplesII ()

DECLARE SUB sineflower ()

DECLARE SUB slanttan ()

DECLARE SUB slowclean ()

DECLARE SUB splitclean ()

DECLARE SUB splitsquare ()

DECLARE SUB starexplode ()

DECLARE SUB uglytrig ()

DECLARE SUB wideeyes ()

DECLARE SUB yinyang ()

DECLARE SUB directmode ()

DECLARE SUB randommode ()

DECLARE SUB begin ()

DIM SHARED subdub$(41)

DIM SHARED repeat AS INTEGER

REM Derek Fulgham

REM 10-6-94, 1-28-95

CALL begin





SUB again

CLS

SCREEN 13

WINDOW (-1, -1)-(1, 1)

         FOR i = 1 TO 5.49 STEP .001

                x = SIN(i)

                y = COS(i)

                Z = TAN(i)

                        LINE (x, -Z)-(-y, Z), i * 50 - 30

                        LINE (-x, -Z)-(y, Z), i * 50 - 30

                        LINE (x, Z)-(-y, -Z), i * 50 - 30

                        LINE (-x, Z)-(y, -Z), i * 50 - 30

                        LINE (-Z, x)-(Z, -y), i * 50 - 30

                        LINE (-Z, -x)-(Z, y), i * 50 - 30

                        LINE (Z, x)-(-Z, -y), i * 50 - 30

                        LINE (Z, -x)-(-Z, y), i * 50 - 30

         NEXT i

CLS

END SUB





SUB begin

CLS

PLAY "L8N50L16N50N45L4N50"

SCREEN 13

COLOR 2

LOCATE 1, 19: PRINT "MENU"

COLOR 10

LOCATE 3, 7: PRINT "(1) Randomized"

LOCATE 4, 7: PRINT "(2) As Originally Organized"

LOCATE 5, 7: PRINT "(3) Exit"

COLOR 5

LOCATE 7, 15: INPUT "Your choice"; viewchoice%

        SELECT CASE viewchoice%

                CASE 1

                        DO

                        CALL randomstart

                        DO

                                CALL randommode

                        LOOP UNTIL repeat = 1

                        LOOP

                CASE 2

                        CALL directmode

                CASE 3

                        CALL lastarm

                CASE ELSE

                        COLOR 4

                        PRINT "That is not a valid choice"

                        END

                END SELECT

END SUB





SUB bigeye

CLS

SCREEN 13

WINDOW (-50, -50)-(50, 50)

        FOR i = 16 TO 50 STEP .1

                CIRCLE (0, i), i, i

        NEXT i

CLS

        FOR i = 16 TO 50 STEP .1

                CIRCLE (0, -i), i, i

        NEXT i

CLS

        FOR i = 16 TO 104 STEP .1

                CIRCLE (0, -i), i, i

                CIRCLE (0, i), i, i

                PAINT (0, 0), i

        NEXT i

        FOR i = 16 TO 104 STEP .1

                CIRCLE (0, -i), i, i

                CIRCLE (0, i), i, i

        NEXT i

        FOR i = 0 TO 250

                CIRCLE (0, 0), 3.5, i

        NEXT i

END SUB





SUB boxfill

CLS

SCREEN 13

WINDOW (-50, -50)-(50, 50)

        FOR i = -50 TO 50 STEP .05

                LINE (i, i)-(i + 10, -i), i + 66, BF

                LINE (-i, -i)-(-i - 10, i), i + 66, BF

               

        NEXT i

END SUB





SUB butterfly

CLS

SCREEN 13

WINDOW (-10, -1)-(10, 1)

FOR i = 1 TO 8.7 STEP .005

        o = .7 + i - ATN(i ^ 2)

                y = COS(o)

                LINE (0, 0)-(o, -y), i * 10 + 16

                LINE (0, 0)-(-o, -y), i * 10 + 16

NEXT

CLS

END SUB





SUB bw

CLS

SCREEN 13

WINDOW (-315, -315)-(315, 315)

d = 1

DO

d = d + 1

FOR i = 0 TO 625 STEP 59

x = i - d

y = i / d

        LINE (x, y)-(y, -x), i / 42 + 16

        LINE (-x, -y)-(-y, x), i / 42 + 16

        LINE (x, -y)-(y, x), i / 42 + 16

        LINE (-x, y)-(-y, -x), i / 42 + 16

NEXT

LOOP WHILE d < 630

CLS

END SUB





SUB cavecolors

CLS

SCREEN 13

WINDOW (-1, -2)-(1, 2)

FOR i = 1 TO 60 STEP .01

        y = LOG(i)

        x = SIN(y)

        LINE (0, -x)-(x, -y), i / 1.49 + 16

        LINE (0, x)-(x, y), i / 1.49 + 16

        LINE (0, -x)-(-x, -y), i / 1.49 + 16

        LINE (0, x)-(-x, y), i / 1.49 + 16

NEXT

CLS

END SUB





SUB circlestar

CLS

SCREEN 13

WINDOW (-50, -50)-(50, 50)

        FOR i = 16 TO 100 STEP .01

                CIRCLE (i, i), 7.5, i

                CIRCLE (-i, i), 7.5, i

                CIRCLE (-i, -i), 7.5, i

                CIRCLE (i, -i), 7.5, i

        NEXT i

        FOR i = 100 TO 16 STEP -.1

                CIRCLE (0, i), 7.5, i

                CIRCLE (0, -i), 7.5, i

                CIRCLE (i, 0), 7.5, i

                CIRCLE (-i, 0), 7.5, i

        NEXT i

END SUB





SUB closer

CLS

SCREEN 13

WINDOW (-1, -1)-(1, 1)

         FOR i = 1 TO 15 STEP .001

                x = SIN(i)

                y = COS(i)

                Z = TAN(i)

                        LINE (x, -Z)-(-y, Z), i + 16

         NEXT i

END SUB





SUB colordiamond

CLS

SCREEN 13

WINDOW (-50, -50)-(50, 50)

        FOR x1 = -50 TO 0

        FOR y1 = -50 TO 50

                LINE (x1, 0)-(0, y1), x1 + 66

                LINE (-x1, 0)-(0, y1), x1 + 66

                LINE (0, x1)-(y1, 0), x1 + 66

                LINE (0, -x1)-(y1, 0), x1 + 66

        NEXT y1

        NEXT x1

END SUB





SUB differentcircles

CLS

SCREEN 13

WINDOW (-5, -5)-(5, 5)

        FOR i = 1 TO 20 STEP .01

        c = c + 1

                y = SIN(i)

                x = TAN(i)

                Z = COS(i)

                        LINE (-i, i)-(-Z, -y), i * 5 + 16

                        LINE (i, -i)-(Z, y), i * 5 + 16

                IF c = 200 THEN

                        CLS

                        c = 0

                ELSE

                        c = c

                END IF

        NEXT i

CLS

SCREEN 13

WINDOW (-1, -1)-(1, 1)

c = 0:

        FOR i = 1 TO 20 STEP .01

        c = c + 1

                y = SIN(i)

                x = TAN(i)

                Z = COS(i)

                        LINE (-i, i)-(-Z, -y), i * 5 + 16

                        LINE (i, -i)-(Z, y), i * 5 + 16

                IF c = 100 THEN

                        CLS

                        c = 0

                ELSE

                        c = c

                END IF

        NEXT i

CLS

SCREEN 13

WINDOW (-1, -1)-(1, 1)

c = 0:

        FOR i = 1 TO 20 STEP .01

        c = c + 1

                y = SIN(i)

                x = TAN(i)

                Z = COS(i)

                        LINE (i, i)-(Z, -y), i * 5 + 16, B

                        LINE (-i, -i)-(-Z, y), i * 5 + 16, B

                IF c = 100 THEN

                        CLS

                        c = 0

                ELSE

                        c = c

                END IF

        NEXT i

END SUB





SUB directend

CLS

SCREEN 13

WINDOW (-50, -50)-(50, 50)

        FOR i = 100 TO 16 STEP -1

                LINE (-75, -75)-(75, 75), i, BF

        NEXT i

CLS

x = 8:

SCREEN 12

LOCATE 25, 1: PRINT "1994, 95 Domino Productions"

LOCATE 1, 1: PRINT "Next show in 00:10"

LOCATE 2, 1: PRINT "To end, hit 'q'."

SLEEP 1

LOCATE 1, 17: PRINT "09"

SLEEP 1

DO

LOCATE 1, 17: PRINT x

LOCATE 1, 17: PRINT "0"

x = x - 1

SLEEP 1

IF INKEY$ = "q" THEN

        LOCATE 1, 1: PRINT "Show ends in 00:0"

        y = 1

END IF

LOOP WHILE x > 0

IF y = 1 THEN

        CALL lastarm

END IF

END SUB





SUB directmode

DO

        CALL ripples

        CALL wideeyes

        CALL bigeye

        CALL oppositespirals

        CALL filledin

        CALL pipediamond

        CALL circlestar

        CALL starwheel

        CALL splitsquare

        CALL splitclean

        CALL slowclean

        CALL ripplesII

        CALL growshapes

        CALL fountain

        CALL slanttan

        CALL shakylog

        CALL colordiamond

        CALL kaliedascreen

        CALL starexplode

        CALL boxfill

        CALL emptybox

        CALL spotty

        CALL plaidfill

        CALL uglytrig

        CALL emptylinecircle

        CALL differentcircles

        CALL yinyang

        CALL piperibbon

        CALL closer

        CALL bw

        CALL frogtwist

        CALL butterfly

        CALL sineflower

        CALL logcross

        CALL revolve

        CALL lightshow

        CALL hash

        CALL again

        CALL cavecolors

        CALL final

        CALL directend

LOOP

END SUB





SUB emptybox

CLS

SCREEN 13

WINDOW (-50, -50)-(50, 50)

        FOR i = -50 TO 50 STEP .01

                LINE (i, i)-(i + 10, -i), i + 66

                LINE (-i, -i)-(-i - 10, i), i + 66

                LINE (i, i)-(-i, i + 10), i + 66

                LINE (-i, -i)-(i, -i - 10), i + 66

        NEXT i

END SUB





SUB emptylinecircle

CLS

SCREEN 13

WINDOW (-5, -5)-(5, 5)

        FOR i = 1 TO 5 STEP .005

                y = 1 / TAN(i)

                x = 1 / COS(i)

                Z = 1 / SIN(i)

                LINE (x / 2, x / 2)-(-Z / 2, Z / 2), i * 10 + 31

                LINE (-x / 2, x / 2)-(Z / 2, Z / 2), i * 10 + 31

        NEXT i

END SUB





SUB filledin

CLS

SCREEN 13

WINDOW (-50, -50)-(50, 50)

        FOR i = 16 TO 100 STEP .1

                CIRCLE (-i, -50), i, i

                CIRCLE (i, -50), i, i

                CIRCLE (-i, 50), i, i

                CIRCLE (i, 50), i, i

                PAINT (i, -50), i

                PAINT (-i, -50), i

                PAINT (-i, 50), i

                PAINT (i, 50), i

        NEXT i

END SUB





SUB final

CLS

SCREEN 13

WINDOW (-100, -100)-(100, 100)

        FOR theta = 1 TO 12 STEP .001

                x = 100 * (COS(theta))

                y = 100 * (SIN(-theta))

                        LINE (0, 0)-(-x, -y), (theta * 10) + 32

                        LINE (0, 0)-(x, y), (theta * 10) + 32

                        LINE (-x, 0)-(0, -y), (theta * 10) + 32

                        LINE (x, 0)-(0, y), (theta * 10) + 32

        NEXT theta

END SUB





SUB fountain

CLS

SCREEN 13

WINDOW (-50, -50)-(50, 50)

        FOR i = 101 TO 32 STEP -.01

                CIRCLE (i, -50), i, i

                CIRCLE (-i, -50), i, i

        NEXT i

END SUB





SUB frogtwist

CLS

SCREEN 13

WINDOW (-5, -5)-(5, 5)

FOR i = 1 TO 21.5 STEP .01

        x = SQR(i)

        y = COS(i)

        Z = TAN(x)

                LINE (-x, -Z)-(Z, -y), i * 2 + 16

                LINE (x, -Z)-(-Z, -y), i * 2 + 16

NEXT i

CLS

END SUB





SUB growshapes

CLS

SCREEN 13

WINDOW (-75, -75)-(75, 75)

        FOR i = 16 TO 50 STEP .01

                LINE (i, -i)-(i / 3, -i / 3), i, B

                LINE (-i, -i)-(-i / 3, -i / 3), i, B

                LINE (i, i)-(i / 3, i / 3), i, B

                LINE (-i, i)-(-i / 3, i / 3), i, B

                CIRCLE (-i, -i), i / 5, i

                CIRCLE (i, -i), i / 5, i

                CIRCLE (i, i), i / 5, i

                CIRCLE (-i, i), i / 5, i

                CIRCLE (-i / 3, -i / 3), i / 5, i

                CIRCLE (i / 3, -i / 3), i / 5, i

                CIRCLE (i / 3, i / 3), i / 5, i

                CIRCLE (-i / 3, i / 3), i / 5, i

        NEXT i

END SUB





SUB hash

CLS

SCREEN 13

WINDOW (-500, -500)-(500, 500)

B = 0

DO

B = B + 1

FOR i = 0 TO 510 STEP 29

x = i + B

y = i - B

        LINE (-x, -y)-(-y, x), i / 30 + 32

        LINE (x, y)-(y, -x), i / 30 + 32

        LINE (-x, y)-(-y, -x), i / 30 + 32

        LINE (x, -y)-(y, x), i / 30 + 32

        LINE (-x, y)-(y, x), i / 30 + 32

        LINE (x, y)-(-y, x), i / 30 + 32

        LINE (-x, -y)-(y, -x), i / 30 + 32

        LINE (x, -y)-(-y, -x), i / 30 + 32

NEXT

LOOP UNTIL B = 625

CLS

END SUB





SUB kaliedascreen

CLS

SCREEN 13

WINDOW (-50, -50)-(50, 50)

        FOR x1 = -50 TO 0

        FOR y1 = -50 TO 50

                LINE (x1, y1)-(0, 0), x1 + 82

                LINE (-x1, -y1)-(0, 0), x1 + 82

                LINE (y1, x1)-(0, 0), x1 + 82

                LINE (-y1, -x1)-(0, 0), x1 + 82

        NEXT y1

        NEXT x1

END SUB





SUB lastarm

                                SCREEN 13

                                CLS

                                COLOR 7

                                LOCATE 1, 5: PRINT "Thank you for using Megaraphics"

                                LOCATE 4, 14: PRINT "Also look for:"

                                FOR B = 16 TO 30 STEP .025

                                COLOR B

                                LOCATE 7, 2: PRINT "A F T E R M A T H"

                                LOCATE 7, 22: PRINT "P H A S T F O N E"

                                NEXT B

                                FOR i = 255 TO 15 STEP -.5

                                        COLOR i

                                WINDOW (-39, -12)-(39, 12)

                                CIRCLE (-1, -3.9), 3.8, i

                                LOCATE 17, 19: PRINT "Dom"

                                LOCATE 20, 15: PRINT "Productions"

                                NEXT i

                                CIRCLE (-1, -3.9), 4, 10

                                COLOR 0

                                END

END SUB





SUB lightshow

CLS

SCREEN 13

WINDOW (-1, -1)-(1, 1)

        FOR i = 0 TO 5 STEP .01

                y = 2 * (TAN(i + 50))

                        LINE (-y, -i)-(y, i), (i * 100) + 15

                        LINE (TAN(-y), -i)-(TAN(y), i), (i * 100) + 15

        v = v + 1

                IF v = 4 THEN

                        CLS

                        v = 0

                ELSE

                        v = v

                END IF

                        LINE (-i, -y)-(i, y), (i * 100) + 16

                        LINE (-i, TAN(-y))-(i, TAN(y)), (i * 100) + 16

        NEXT i

CLS

SCREEN 13

WINDOW (-5, -5)-(5, 5)

        FOR i = 0 TO 14 STEP .01

                y = 100 * (TAN(i + 50))

                        LINE (i, TAN(y))-(-i, TAN(-y)), i

        NEXT i

END SUB





SUB logcross

CLS

SCREEN 13

WINDOW (-5, -5)-(5, 5)

        FOR i = 1 TO 23 STEP .01

                y = LOG(i)

                        x = TAN(y)

                                LINE (y, x)-(-y, -x), i * 10 + 16

                                LINE (-y, x)-(y, -x), i * 10 + 16

                                LINE (x, y)-(-x, -y), i * 10 + 16

                                LINE (x, -y)-(-x, y), i * 10 + 16

        NEXT i

END SUB





SUB oppositespirals

CLS

SCREEN 13

WINDOW (-50, -50)-(50, 50)

        FOR i = 16 TO 100 STEP .1

                CIRCLE (-i, -50), i, i

                CIRCLE (i, 50), i, i

        NEXT i

END SUB





SUB pillow

END SUB





SUB pipediamond

CLS

SCREEN 13

WINDOW (-50, -50)-(50, 50)

        FOR i = 16 TO 25 STEP .1

                CIRCLE (i, i), i, i

        NEXT i

        FOR i = 16 TO 25 STEP .1

                CIRCLE (-i, i), i, i

        NEXT i

        FOR i = 16 TO 25 STEP .1

                CIRCLE (-i, -i), i, i

        NEXT i

        FOR i = 16 TO 25 STEP .1

                CIRCLE (i, -i), i, i

        NEXT i

CLS

SCREEN 13

WINDOW (-50, -50)-(50, 50)

        FOR i = 25 TO 16 STEP -.1

                CIRCLE (i, i), i, i

        NEXT i

        FOR i = 25 TO 16 STEP -.1

                CIRCLE (-i, i), i, i

        NEXT i

        FOR i = 25 TO 16 STEP -.1

                CIRCLE (-i, -i), i, i

        NEXT i

        FOR i = 25 TO 16 STEP -.1

                CIRCLE (i, -i), i, i

        NEXT i

        FOR i = 16 TO 100 STEP .1

                CIRCLE (i, i), i, i

                CIRCLE (-i, i), i, i

                CIRCLE (-i, -i), i, i

                CIRCLE (i, -i), i, i

        NEXT i

END SUB





SUB piperibbon

CLS

SCREEN 13

WINDOW (-20, -20)-(20, 20)

        FOR i = 1 TO 5 STEP .001

                y = TAN(i)

                x = COS(y)

                LINE (x, y)-(x, -y), i * 100 + 70

                LINE (y, x)-(-y, x), i * 100 + 70

                LINE (-x, y)-(-x, -y), i * 100 + 70

                LINE (y, -x)-(-y, -x), i * 100 + 70

        NEXT i

WINDOW (-5, -5)-(5, 5)

        FOR i = 1 TO 5 STEP .001

                y = TAN(i)

                x = COS(y)

                LINE (x, y)-(x, -y), i * 100 + 70

                LINE (y, x)-(-y, x), i * 100 + 70

                LINE (-x, y)-(-x, -y), i * 100 + 70

                LINE (y, -x)-(-y, -x), i * 100 + 70

        NEXT i

END SUB





SUB plaidfill

CLS

SCREEN 13

WINDOW (-50, -50)-(50, 50)

        FOR i = 50 TO -50 STEP -.01

                LINE (-50, i)-(-i, 50), i + 66

                LINE (50, -i)-(i, -50), i + 66

                LINE (-50, -i)-(-i, -50), i + 66

                LINE (50, i)-(i, 50), i + 66

       NEXT i

END SUB





SUB randommode

CLS

DO

count = 0:

OPEN "substore.mg" FOR INPUT AS #1

DO WHILE NOT EOF(1)

count = count + 1

INPUT #1, subdub$(count)

LOOP

CLOSE #1

IF count = 40 THEN

        repeat = 1

END IF

RANDOMIZE TIMER

        subname = INT(RND * 44 + 6)

                SELECT CASE subname

                        CASE 6

                                FOR i = 1 TO count

                                        IF subdub$(i) = "ripples" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "ripples"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL ripples

                        CASE 7

                                FOR i = 1 TO count

                                        IF subdub$(i) = "wideeyes" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "wideeyes"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL wideeyes

                        CASE 8

                                FOR i = 1 TO count

                                        IF subdub$(i) = "bigeye" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "bigeye"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL bigeye

                        CASE 9

                                FOR i = 1 TO count

                                        IF subdub$(i) = "hash" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "hash"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL hash

                        CASE 10

                                FOR i = 1 TO count

                                        IF subdub$(i) = "oppositespirals" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "oppositespirals"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL oppositespirals

                        CASE 11

                                FOR i = 1 TO count

                                        IF subdub$(i) = "filledin" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "filledin"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL filledin

                        CASE 12

                                FOR i = 1 TO count

                                        IF subdub$(i) = "pipediamond" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "pipediamond"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL pipediamond

                        CASE 13

                                FOR i = 1 TO count

                                        IF subdub$(i) = "circlestar" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "circlestar"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL circlestar

                        CASE 14

                                FOR i = 1 TO count

                                        IF subdub$(i) = "splitsquare" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "splitsquare"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL splitsquare

                        CASE 15

                                FOR i = 1 TO count

                                        IF subdub$(i) = "splitclean" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "splitclean"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL splitclean

                        CASE 16

                                FOR i = 1 TO count

                                        IF subdub$(i) = "slowclean" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "slowclean"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL slowclean

                        CASE 17

                                FOR i = 1 TO count

                                        IF subdub$(i) = "ripplesII" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "ripplesII"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL ripplesII

                        CASE 18

                                FOR i = 1 TO count

                                        IF subdub$(i) = "growshapes" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "growshapes"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL growshapes

                        CASE 19

                                FOR i = 1 TO count

                                        IF subdub$(i) = "fountain" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "fountain"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL fountain

                        CASE 20

                                FOR i = 1 TO count

                                        IF subdub$(i) = "slanttan" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "slanttan"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL slanttan

                        CASE 21

                                FOR i = 1 TO count

                                        IF subdub$(i) = "colordiamond" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "colordiamond"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL colordiamond

                        CASE 22

                                FOR i = 1 TO count

                                        IF subdub$(i) = "kaliedascreen" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "kaliedascreen"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL kaliedascreen

                        CASE 23

                                FOR i = 1 TO count

                                        IF subdub$(i) = "starexplode" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "starexplode"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL starexplode

                        CASE 24

                                FOR i = 1 TO count

                                        IF subdub$(i) = "boxfill" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "boxfill"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL boxfill

                        CASE 25

                                FOR i = 1 TO count

                                        IF subdub$(i) = "emptybox" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "emptybox"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL emptybox

                        CASE 26

                                FOR i = 1 TO count

                                        IF subdub$(i) = "spotty" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "spotty"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL spotty

                        CASE 27

                                FOR i = 1 TO count

                                        IF subdub$(i) = "plaidfill" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "plaidfill"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL plaidfill

                        CASE 28

                                FOR i = 1 TO count

                                        IF subdub$(i) = "uglytrig" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "uglytrig"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL uglytrig

                        CASE 29

                                FOR i = 1 TO count

                                        IF subdub$(i) = "emptylinecircle" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "emptylinecircle"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL emptylinecircle

                        CASE 30

                                FOR i = 1 TO count

                                        IF subdub$(i) = "differentcircles" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "differentcircles"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL differentcircles

                        CASE 31

                                FOR i = 1 TO count

                                        IF subdub$(i) = "bw" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "bw"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL bw

                        CASE 32

                                FOR i = 1 TO count

                                        IF subdub$(i) = "yinyang" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "yinyang"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL yinyang

                        CASE 33

                                FOR i = 1 TO count

                                        IF subdub$(i) = "piperibbon" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "piperibbon"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL piperibbon

                        CASE 34

                                FOR i = 1 TO count

                                        IF subdub$(i) = "closer" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "closer"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL closer

                        CASE 35

                                FOR i = 1 TO count

                                        IF subdub$(i) = "sineflower" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "sineflower"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL sineflower

                        CASE 36

                                FOR i = 1 TO count

                                        IF subdub$(i) = "logcross" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "logcross"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL logcross

                        CASE 37

                                FOR i = 1 TO count

                                        IF subdub$(i) = "lightshow" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "lightshow"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL lightshow

                        CASE 38

                                FOR i = 1 TO count

                                        IF subdub$(i) = "final" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "final"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL final

                        CASE 39

                                FOR i = 1 TO count

                                        IF subdub$(i) = "again" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "again"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL again

                        CASE 40

                                FOR i = 1 TO count

                                        IF subdub$(i) = "revolve" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "revolve"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL revolve

                        CASE 41

                                FOR i = 1 TO count

                                        IF subdub$(i) = "starwheel" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "starwheel"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL starwheel

                        CASE 42

                                FOR i = 1 TO count

                                        IF subdub$(i) = "shakylog" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "shakylog"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL shakylog

                        CASE 43

                                FOR i = 1 TO count

                                        IF subdub$(i) = "butterfly" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "butterfly"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL butterfly

                        CASE 44

                                FOR i = 1 TO count

                                        IF subdub$(i) = "frogtwist" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "frogtwist"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL frogtwist

                        CASE 45

                                FOR i = 1 TO count

                                        IF subdub$(i) = "cavecolors" THEN

                                                GOSUB ender

                                        END IF

                                NEXT

                                OPEN "substore.mg" FOR APPEND AS #1

                                subdub$ = "cavecolors"

                                        WRITE #1, subdub$

                                CLOSE #1

                                CALL cavecolors

                        END SELECT

LOOP

ender:

END SUB





SUB randomstart

repeat = 0

CLS

PRINT "Killing current substore..."

KILL "substore.mg"

PRINT "Opening new, writing dummy sub identifier..."

OPEN "substore.mg" FOR OUTPUT AS #1

subdub$ = "dummy"

        WRITE #1, subdub$

CLOSE #1

END SUB





SUB revolve

CLS

DO

SCREEN 13

WINDOW (-25, -8)-(25, 25)

c = c + 1

COLOR 0

        PRINT c

        IF c < 45 THEN

                LINE (0, 0)-(9, 9), 0

        ELSE

                FOR r = 0 TO 8.3 STEP .1

                COLOR 0

                        PRINT r

                        y = r * COS(r)

                        x = r * SIN(r)

                                LINE (-x, y)-(x, -y), r * 10 + 16

                                LINE (-x - 15, y)-(x - 15, -y), r * 10 + 16

                                LINE (-x + 15, y)-(x + 15, -y), r * 10 + 16

                NEXT r

        END IF

LOOP UNTIL c > 44

FOR u = 8.3 TO 0 STEP -.1

                a = u * COS(u)

                B = u * SIN(u)

COLOR 0

PRINT u

                LINE (-B, a)-(B, -a), u * 10 + 16

                LINE (-B - 15, a)-(B - 15, -a), u * 10 + 16

                LINE (-B + 15, a)-(B + 15, -a), u * 10 + 16

NEXT u

DO

SCREEN 13

WINDOW (-25, -8)-(25, 25)

c = c + 1

COLOR 0

        PRINT c

        IF c < 45 THEN

                LINE (0, 0)-(9, 9), 0

        ELSE

                FOR r = 0 TO 8.3 STEP .1

                COLOR 0

                        PRINT r

                        y = r * COS(r)

                        x = r * SIN(r)

                                LINE (-x, y)-(x, -y), r * 10 + 16

                                LINE (-x - 15, y)-(x - 15, -y), r * 10 + 16

                                LINE (-x + 15, y)-(x + 15, -y), r * 10 + 16

                NEXT r

        END IF

LOOP UNTIL c > 44

COLOR 15

FOR u = 8.3 TO 0 STEP -.1

                a = u * COS(u)

                B = u * SIN(u)

                LINE (-B, a)-(B, -a), u * 10 + 16

                LINE (-B - 15, a)-(B - 15, -a), u * 10 + 16

                LINE (-B + 15, a)-(B + 15, -a), u * 10 + 16

NEXT u

CLS

END SUB





SUB ripples

CLS

SCREEN 13

WINDOW (-50, -50)-(50, 50)

        FOR i = 16 TO 130 STEP .1

                CIRCLE (50, 0), i, i

                CIRCLE (-50, 0), i, i

                CIRCLE (0, 50), i, i

                CIRCLE (0, -50), i, i

        NEXT i

END SUB





SUB ripplesII

CLS

SCREEN 13

WINDOW (-50, -50)-(50, 50)

        FOR i = 16 TO 30 STEP .01

                CIRCLE (40, -20), i, i

                CIRCLE (-40, -20), i, i

                CIRCLE (-40, 20), i, i

                CIRCLE (40, 20), i, i

                CIRCLE (0, 0), i, i

        NEXT i

END SUB





SUB shakylog

CLS

SCREEN 13

WINDOW (-5, -5)-(5, 5)

FOR i = 1 TO 400 STEP .1

        x = LOG(i)

        y = SIN(i)

                LINE (-y, x)-(-x, -y), i / 10 + 16

                LINE (y, -x)-(-x, -y), i / 10 + 16

                LINE (-y, -x)-(x, -y), i / 10 + 16

                LINE (y, x)-(x, -y), i / 10 + 16

NEXT

CLS

END SUB





SUB sineflower

CLS

SCREEN 13

WINDOW (-10, -10)-(10, 10)

        FOR i = 0 TO 15 STEP .01

                y = 2 * (SIN(i + 50))

                LINE (-y, -i)-(y, i), (i * 10) + 15

                LINE (SIN(-y), -i)-(SIN(y), i), (i * 10) + 15

                LINE (-i, -y)-(i, y), (i * 10) + 15

                LINE (-i, SIN(-y))-(i, SIN(y)), (i * 10) + 15

        NEXT i

END SUB





SUB slanttan

CLS

SCREEN 13

WINDOW (-50, -50)-(50, 50)

        FOR i = 16 TO 39 STEP .01

                x = 8 * TAN(-i)

                y = 8 * TAN(i)

                        LINE (-y, -y)-(i, y), i

                        LINE (-x, -x)-(i, x), i

                        LINE (y, y)-(-i, -y), i

                        LINE (x, x)-(-i, -x), i

        NEXT i

END SUB





SUB slowclean

CLS

SCREEN 13

WINDOW (-50, -50)-(50, 50)

        FOR i = 16 TO 90 STEP .05

                LINE (70, 70)-(-i, i), i, B

        NEXT i

        FOR i = 16 TO 90 STEP .05

                LINE (-70, -70)-(i, -i), i, B

        NEXT i

        FOR i = 16 TO 90 STEP .025

                LINE (70, 70)-(i, -i), i, B

        NEXT i

        FOR i = 16 TO 90 STEP .025

                LINE (-70, -70)-(-i, i), i, B

        NEXT i

        FOR i = 16 TO 75 STEP .025

                LINE (70, 70)-(-i, i), i, B

                LINE (-70, -70)-(i, -i), i, B

                LINE (70, 70)-(i, -i), i, B

                LINE (-70, -70)-(-i, i), i, B

        NEXT i

END SUB





SUB splitclean

CLS

SCREEN 13

WINDOW (-50, -50)-(50, 50)

        FOR i = 16 TO 510 STEP .1

                LINE (70, 70)-(-i, -i), i, B

        NEXT i

        FOR i = 16 TO 510 STEP .1

                LINE (-70, -70)-(i, i), i, B

        NEXT i

        FOR i = 16 TO 510 STEP .1

                LINE (70, 70)-(-i, -i), i, B

                LINE (-70, -70)-(i, i), i, B

        NEXT i

END SUB





SUB splitsquare

CLS

SCREEN 13

WINDOW (-50, -50)-(50, 50)

        FOR i = 16 TO 200 STEP .1

                LINE (0, 0)-(i, i), i, B

                LINE (0, 0)-(-i, -i), i, B

                LINE (0, 0)-(-i, i), i, B

                LINE (0, 0)-(i, -i), i, B

        NEXT i

END SUB





SUB spotty

CLS

SCREEN 13

WINDOW (-5, -5)-(5, 5)

y = 5:

c = 16:

FOR i = 1.003001 TO 1 STEP -.000001

IF i < 1.002075 THEN

        c = c - .05

ELSE

        c = c + .05

END IF

IF i < 1.002075 AND c < 17 THEN

c = 16

END IF

y = y - .005

IF c > 254 THEN

        c = 16

ELSE

        c = c

END IF

        x = .9 * SIN(i)

                LINE (-y, 0)-(x, y), c

                LINE (y, 0)-(-x, -y), c

                LINE (-y, 0)-(-x, -y), c

                LINE (y, 0)-(x, y), c

NEXT

END SUB





SUB starexplode

CLS

SCREEN 13

WINDOW (-50, -50)-(50, 50)

        FOR x = 50 TO 1 STEP -.1

                c = c + 1

                y = (SIN(x ^ 2))

                        LINE (0, x)-(y, 0), x * 10 + 16

                        LINE (0, -x)-(-y, 0), x * 10 + 16

                        LINE (-x, 0)-(0, -y), x * 10 + 16

                        LINE (x, 0)-(0, y), x * 10 + 16

                        LINE (x, x)-(0, -y), x * 10 + 16

                        LINE (-x, -x)-(0, y), x * 10 + 16

                        LINE (x, -x)-(0, y), x * 10 + 16

                        LINE (-x, x)-(0, -y), x * 10 + 16

                        IF c = 10 THEN

                                c = 0

                                CLS

                        ELSE

                                c = c

                        END IF

        NEXT x

CLS

SCREEN 13

WINDOW (-50, -50)-(50, 50)

        FOR i = 16 TO 5000

                PSET (0, 0), i

                PAINT (0, 0), i

        NEXT i

        FOR x = 1 TO 50 STEP .1

                y = (TAN(x ^ 2))

                        LINE (0, x)-(y, 0), x * 10 + 16

                        LINE (0, -x)-(-y, 0), x * 10 + 16

                        LINE (-x, 0)-(0, -y), x * 10 + 16

                        LINE (x, 0)-(0, y), x * 10 + 16

                        LINE (x, x)-(0, -y), x * 10 + 16

                        LINE (-x, -x)-(0, y), x * 10 + 16

                        LINE (x, -x)-(0, y), x * 10 + 16

                        LINE (-x, x)-(0, -y), x * 10 + 16

        NEXT x

CLS

END SUB





SUB starwheel

CLS

SCREEN 13

WINDOW (-1, -1)-(1, 1)

FOR i = 0 TO 2400 STEP 2.5

        x = (SIN(i) / 2)

        y = (COS(i) / 2)

                LINE (y * 1.25, x * 1.25)-(-x * 1.25, y * 1.25), i / 10 + 16

                LINE (y, x)-(-x, y), i / 10 + 16

                LINE (x / 1.25, -y / 1.25)-(y / 1.25, x / 1.25), i / 10 + 16

                LINE (y / 2.5, -x / 2.5)-(x / 2.5, y / 2.5), i / 10 + 16

NEXT

CLS

END SUB





SUB uglytrig

CLS

SCREEN 13

WINDOW (-5, -5)-(5, 5)

        FOR i = 1 TO 10 STEP .001

                y = 1 / TAN(i)

                x = 1 / COS(i)

                Z = 1 / SIN(i)

                LINE (y, y)-(-Z, Z), i * 10 + 16

                LINE (-y, -y)-(Z, -Z), i * 10 + 16

NEXT i

END SUB





SUB wideeyes

CLS

SCREEN 13

WINDOW (-50, -50)-(50, 50)

        FOR i = 16 TO 100 STEP .1

                CIRCLE (i, 0), i, i

                CIRCLE (-i, 0), i, i

        NEXT i

END SUB





SUB yinyang

CLS

SCREEN 13

WINDOW (-250, -250)-(250, 250)

        PAINT (0, 0), 0

        c = c + 1

        FOR theta = 1 TO 5 STEP .001

        c = c + 1

                x = 100 * (COS(theta))

                y = 100 * (SIN(-theta))

                        CIRCLE (x, y), 67, theta * 10 + 16

                        CIRCLE (-x, -y), 67, theta * 10 + 16

        NEXT theta

        PAINT (0, 0), 0

        c = c + 1

        FOR theta = 5 TO 1 STEP -.001

        c = c + 1

                x = 100 * (COS(theta))

                y = 100 * (SIN(-theta))

                        CIRCLE (x, y), 67, theta * 10 + 16

                        CIRCLE (-x, -y), 67, theta * 10 + 16

        NEXT theta

END SUB







