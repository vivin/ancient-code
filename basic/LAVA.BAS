'                                LAVA.BAS
'                              John Rodgers
'                           Wizard Productions
'                             Too Cool Fool
'                            coolfool@flinet.com
'                           john@compconn.com
'
'LAVA.BAS was written to take advantage of an effect I had seen in my earlier
'screen savers. When you issue a PAINT statement on a graphic that is linked
'by small lines, the color crawls along the lines until the edges are reached
'or all the pixels have changed to the new color. This program draws a screen
'full of circles and colored pixels and issues random PAINT statements to
'random points on the screen. Occasionally these points are linked to large
'areas and the color "crawls" across the screen. Like a lava lamp it takes
'awhile it to warm up (for the screen to fill with circles).
'As a screen saver it may not be ideal as some of the PAINT statements take
'awhile to complete before the program surrenders control.


DECLARE SUB drawCircles ()
DECLARE SUB pxsett ()
 
ON ERROR GOTO eror:

SCREEN 9

CLS
RANDOMIZE TIMER
DO

pxsett
drawCircles
 
c% = INT(RND * 16)
xpos% = INT(RND * 640)
ypos% = INT(RND * 480)                 'initiate random numbers

PAINT (xpos%, ypos%), c%, 0            'the following statements are to
                                        'partialy clear the screen occasionaly

IF xpos% = 50 THEN PAINT (xpos%, ypos%), 0, 0    'on these numbers paint black
IF xpos% = 150 THEN PAINT (xpos%, ypos%), 0, 0
IF xpos% = 250 THEN PAINT (xpos%, ypos%), 0, 0
IF xpos% = 450 THEN PAINT (xpos%, ypos%), 0, 0
IF xpos% = 550 THEN PAINT (xpos%, ypos%), 0, 0
IF xpos% = 55 THEN PAINT (xpos%, ypos%), 0, 0
IF xpos% = 155 THEN PAINT (xpos%, ypos%), 0, 0
IF xpos% = 255 THEN PAINT (xpos%, ypos%), 0, 0
IF xpos% = 355 THEN PAINT (xpos%, ypos%), 0, 0
IF xpos% = 455 THEN PAINT (xpos%, ypos%), 0, 0
IF xpos% = 555 THEN PAINT (xpos%, ypos%), 0, 0
IF xpos% = 51 THEN PAINT (xpos%, ypos%), 0, 0
IF xpos% = 151 THEN PAINT (xpos%, ypos%), 0, 0
IF xpos% = 251 THEN PAINT (xpos%, ypos%), 0, 0
IF xpos% = 351 THEN PAINT (xpos%, ypos%), 0, 0
IF xpos% = 451 THEN PAINT (xpos%, ypos%), 0, 0
IF xpos% = 551 THEN PAINT (xpos%, ypos%), 0, 0
IF xpos% = 52 THEN PAINT (xpos%, ypos%), 0, 0
IF xpos% = 152 THEN PAINT (xpos%, ypos%), 0, 0
IF xpos% = 252 THEN PAINT (xpos%, ypos%), 0, 0
IF xpos% = 352 THEN PAINT (xpos%, ypos%), 0, 0
IF xpos% = 452 THEN PAINT (xpos%, ypos%), 0, 0
IF xpos% = 552 THEN PAINT (xpos%, ypos%), 0, 0
 
LOOP UNTIL LEN(INKEY$)

SYSTEM

eror:                                     'simple error trap

SELECT CASE ERR

CASE 5                                 'runtime error 5-Illegal Function Call
 SCREEN 0                               ' SCREEN ERROR
 CLS
 COLOR 15
 LOCATE 2, 22
 PRINT "ERROR!! ILLEAGLE FUNCTION CALL"
 COLOR 7
 LOCATE 3, 5
 PRINT "LAVA.BAS works best in screen modes 8, 9 and 12.";
 PRINT "The effect is somewhat "
 PRINT "noticable in screen modes 7 and 13."
 PRINT "    The effect is lost in other modes, however SCREEN 10 offers some"
 PRINT " interesting effects if you are bored."
 LOCATE 8, 1
 PRINT "PAX,"
 PRINT "TCF"
 PRINT
 INPUT "Press ENTER to return to DOS", d$
 SYSTEM
CASE ELSE
 RESUME NEXT
END SELECT
 RESUME

SUB drawCircles
 FOR k = 1 TO 110
row% = INT(RND * 640)
col% = INT(RND * 480)                   'initiate random numbers
arow% = INT(RND * 640)
acol% = INT(RND * 480)

ra% = INT(RND * 5)
s = INT(RND * 900)
IF s <= 600 THEN c% = 8                 'get c% (color)
IF s > 600 AND s <= 790 THEN c% = 4
IF s > 790 AND s <= 800 THEN c% = 14
IF s > 800 AND s <= 825 THEN c% = 9
IF s > 825 AND s <= 875 THEN c% = 3
IF s > 875 AND s <= 900 THEN c% = 6

CIRCLE (row%, col%), ra%, c%           'draw circle
NEXT k

END SUB

SUB pxsett
DO                           'pxsett helps make and break circle
c% = 1                        'connections for the paint statements to
                              ' have greater effect   

xpos% = INT(RND * 640)
ypos% = INT(RND * 480)
row% = INT(RND * 640)
col% = INT(RND * 480)                   'initiate random numbers


PSET (xpos%, col%), 4
PSET (row%, ypos%), 0                  'paint random pixels 3 colors
PSET (xpos%, ypos%), 4
PSET (row%, col%), 1
lop% = lop% + 1

LOOP UNTIL lop% >= 20

END SUB

