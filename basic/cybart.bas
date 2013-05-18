

     'Years In the Makeing!! No Cast of characters$!! Random Art!!

			'or CYBART if you will?

			       'CYBART.BAS

		    'Random Computer Generated ART

			   'Wizard Productions

			      'John Rodgers

			     'Too Cool Fool

			   'coolfool@flinet.com

		     'www.flinet.com/~coolfool/wiz/

				  '1996

DECLARE SUB box ()

DECLARE SUB boxcir ()

DECLARE SUB circ ()

DECLARE SUB club ()

DECLARE SUB delay (Seconds!)

DECLARE SUB drkcir ()

DECLARE SUB eye (xp%, yp%)

DECLARE SUB hole ()

DECLARE SUB lc ()

DECLARE SUB oval ()

DECLARE SUB lin ()

DECLARE SUB linboxes ()

DECLARE SUB paints ()

DECLARE SUB paintsT ()

DECLARE SUB pxset ()

DECLARE SUB pxsett ()

DECLARE SUB tri ()

DECLARE SUB xb ()

DECLARE SUB xc ()

COMMON SHARED c%                   'color variable

COMMON SHARED out$                 'exit variable

ON ERROR GOTO eror:

CLS

 

 SCREEN 12

out$ = INKEY$

DO

 

RANDOMIZE TIMER                       'initiate random numbers

 

row% = INT(RND * 640)                 'positions

col% = INT(RND * 480)

event% = INT(RND * 40)                'event% steers the program

rad% = INT(RND * 40)                  'for radius

c% = INT(RND * 16)                    'for color

shade% = INT(RND * 8)                 'for alternate color

xPos% = INT(RND * 640)                'alternate positions

yPos% = INT(RND * 480)



COLOR c%, shade%

IF LEN(out$) THEN SYSTEM



 SELECT CASE event%                  'find and execute next event%

	CASE 1

		xc

	CASE 2

		lc

	CASE 3

		 tri

	CASE 4

		club

	CASE 5

		linboxes

	CASE 6

		boxcir

	CASE 7

		oval

	CASE 8

		drkcir

	CASE 9

		circ

	CASE 10

		lin

	CASE 11

		box

	CASE 12

		pxset

	CASE 13

		pxsett

	CASE 14

		 delay .9

	CASE 15

		VIEW (row%, col%)-(xPos%, yPos%), 0

	CASE 16

		delay 1

	CASE 17

		VIEW (row%, col%)-(xPos%, yPos%), c%

	CASE 18

		xb

	CASE 19

		r = r + 1

	     IF r >= 9 THEN

		paints        'call this every ninth time CASE 19 comes up

		r = 0

	     END IF

	CASE 20

		trn = trn + 1

	     IF trn >= 9 THEN

		paintsT       'call this every ninth time CASE 20 comes up

		trn = 0

	     END IF

	CASE 21

		VIEW

	CASE 22

		VIEW

	CASE 23

		 tri

	CASE 24

		 tri

	CASE 25

		rn = rn + 1

	     IF rn >= 9 THEN      'add some modesty to my logo

		eye row%, col%

		rn = 0

	     END IF

	CASE 26

	     hole

 END SELECT

IF LEN(out$) THEN SYSTEM

LOOP UNTIL LEN(out$)               'end

COLOR 7, 0

CLS

END

eror:                                'simple error trap

 

RESUME NEXT



SUB box              'box draws a random box either filled or hollow

event% = INT(RND * 40)

c% = INT(RND * 16)



COLOR c%, 0

	shade% = INT(RND * 16)

	x1pos% = INT(RND(1) * 640)                  'initiate random numbers

	y1pos% = INT(RND(1) * 480)

	x2pos% = INT(RND(1) * 640)

	y2pos% = INT(RND(1) * 480)

    

     IF event% > 5 THEN

	LINE (x1pos%, y1pos%)-(x2pos%, y2pos%), shade%, BF    'lines

     ELSE

	 LINE (x1pos%, y1pos%)-(x2pos%, y2pos%), shade%, B    'lines

     END IF

    

	shade% = INT(RND * 16)

	x1pos% = INT(RND(1) * 640)                  'initiate random numbers

	y1pos% = INT(RND(1) * 480)

	x2pos% = INT(RND(1) * 640)

	y2pos% = INT(RND(1) * 480)

	LINE (x1pos%, y1pos%)-(x2pos%, y2pos%), shade%, B    'lines





delay .9

IF LEN(out$) THEN SYSTEM

END SUB



SUB boxcir         'boxcir draws a random boxes and circles joined

       

	shade% = INT(RND(1) * 200) + 1

	x1pos% = INT(RND(1) * 640)                  'initiate random numbers

	y1pos% = INT(RND(1) * 480)

	x2pos% = INT(RND(1) * 640)

	y2pos% = INT(RND(1) * 480)

 

IF x1pos% <= 0 THEN x1pos% = 1

IF y1pos% <= 0 THEN y1pos% = 1

IF x2pos% <= 0 THEN x2pos% = 1

IF y2pos% <= 0 THEN y2pos% = 1

       

 

	CIRCLE (x2pos%, y1pos%), x1pos% + 2, shade% - 2     'circles

	CIRCLE (x1pos%, y2pos%), x2pos% + 2, shade% - 2

	LINE (x1pos%, y1pos%)-(x2pos%, y2pos%), shade%, B     'boxes

	LINE (x2pos%, y2pos%)-(x1pos%, y1pos%), shade% - 1, B

delay .9

IF LEN(out$) THEN SYSTEM

END SUB



SUB circ   'circ draws random circles with part of the arc a different color

delay .9

 

xPos% = INT(RND * 640)

yPos% = INT(RND * 480)                        'initiate random numbers

l% = INT(RND * 10)

h% = INT(RND * 10)

 

row% = INT(RND * 640)

col% = INT(RND * 480)                          'initiate random numbers

event% = INT(RND * 35)

rad% = INT(RND * 40) + 1



 CIRCLE (row%, col%), rad%, c%                  'circles

 CIRCLE (row%, col%), rad%, c% + 1, , l% / h%   'different color arc



delay .9

IF LEN(out$) THEN SYSTEM

END SUB



SUB club               'this sub used to draw a club (clover)

			'now with random numbers

			'it doesn't

row% = INT(RND * 600)

col% = INT(RND * 480)                   'initiate random numbers

event% = INT(RND * 400)

rad% = INT(RND * 20)

c% = INT(RND * 16)

	x1pos% = INT(RND * 639) + 1        'initiate random numbers

	y1pos% = INT(RND * 479) + 1

	x2pos% = INT(RND * 639) + 1

	y2pos% = INT(RND * 479) + 1

 

 CIRCLE (row%, col%), rad%, c%              'three circles

  PAINT STEP(0, 0), c%, 0

row% = INT(RND * 600)

col% = INT(RND * 480)                   'initiate random numbers

event% = INT(RND * 400)

rad% = INT(RND * 20)

c% = INT(RND * 16)

IF LEN(out$) THEN SYSTEM

CIRCLE STEP(20, -25), rad%, c%

row% = INT(RND * 600)

col% = INT(RND * 480)                   'initiate random numbers

event% = INT(RND * 400)

rad% = INT(RND * 20)

c% = INT(RND * 16)

 

CIRCLE STEP(20, 25), rad%, c%

LINE (row%, row% + 30)-(row% + 40, row% + 30)    'a triangle base

FOR i% = 130 TO 170



LINE (i%, row% + 30)-(row% + 20, row%), c%



NEXT i%

delay .9

IF LEN(out$) THEN SYSTEM

END SUB



SUB delay (Seconds!) STATIC



   Begin! = TIMER

   DO UNTIL (TIMER - Begin! > Seconds!) OR (TIMER - Begin! < 0)

    IF LEN(INKEY$) THEN SYSTEM

   LOOP



END SUB



SUB drkcir           'drkcir draws a random circle

delay .8



row% = INT(RND * 640)

col% = INT(RND * 480)                   'initiate random numbers

ra% = INT(RND * 30) + 1

c% = INT(RND * 16)

CIRCLE (row%, col%), ra%, c%

delay .8

 IF LEN(out$) THEN SYSTEM

END SUB



SUB eye (xp%, yp%)            'my logo graphic

			      'The Wizard Eye

			      'randomly of course

 IF LEN(out$) THEN SYSTEM

CIRCLE (xp%, yp%), 42, 14, , , 2 / 9

PAINT STEP(0, 0), 14

CIRCLE STEP(0, -1), 11, 0

PAINT STEP(0, 0), 0, 0

CIRCLE STEP(3, 2), 1, 12

END SUB



SUB hole                'hole draws a black hole

delay .9



xPos% = INT(RND * 640)

yPos% = INT(RND * 480)                   'initiate random numbers

l% = INT(RND * 10)

h% = INT(RND * 10)



row% = INT(RND * 640)

col% = INT(RND * 480)                   'initiate random numbers

event% = INT(RND * 35)

rad% = INT(RND * 40) + 1

FOR m% = 1 TO col%

IF LEN(out$) THEN SYSTEM

CIRCLE (row%, col%), m%, 0, , , l% / h%

NEXT m%

delay .9

 



END SUB



SUB lc                     'lc draws random circles

delay .8

 

row% = INT(RND * 580) + 90

col% = INT(RND * 260)                  'initiate random numbers

 

rad% = INT(RND * 40)

c% = INT(RND * 16)

n% = INT(RND * 20)

xn% = INT(RND * 1)

				       '50 50 chance it will happen

IF xn% = 0 THEN



FOR l% = 1 TO n%

    IF LEN(out$) THEN SYSTEM

    CIRCLE (row% + 1, col% + 1), rad%, c%

   CIRCLE (row% + 1, col% + 1), rad%, 0

   NEXT l%

ELSE

   FOR l% = n% TO 1 STEP -1

    IF LEN(out$) THEN SYSTEM

     CIRCLE (row% + 1, col% + 1), rad%, c%

    CIRCLE (row% + 1, col% + 1), rad%, 0

   NEXT l%

END IF

delay .8

 



		   'paint the same spot everytime with a different color

PAINT STEP(44, 17), c%, 0

END SUB



SUB lin               'lin draws random lines

event% = INT(RND * 5)

FOR t% = 1 TO event%

delay 1

row% = INT(RND * 640)

col% = INT(RND * 480)                   'initiate random numbers



rad% = INT(RND * 40)

c% = INT(RND * 16)

COLOR c%, 0

IF LEN(out$) THEN SYSTEM

	shade% = INT(RND * 16)

	x1pos% = INT(RND(1) * 639) + 1                'initiate random numbers

	y1pos% = INT(RND(1) * 479) + 1

	x2pos% = INT(RND(1) * 639) + 1

	y2pos% = INT(RND(1) * 479) + 1

 

	LINE (x1pos%, y1pos%)-(x2pos%, y2pos%), shade%     'lines

 

	shade% = INT(RND * 16)

	x1pos% = INT(RND(1) * 640)                  'initiate random numbers

	y1pos% = INT(RND(1) * 480)

	x2pos% = INT(RND(1) * 640)

	y2pos% = INT(RND(1) * 480)

IF x1pos% <= 0 THEN x1pos% = 1

IF y1pos% <= 0 THEN y1pos% = 1

IF x2pos% <= 0 THEN x2pos% = 1

IF y2pos% <= 0 THEN y2pos% = 1



	LINE (x1pos%, y1pos%)-(x2pos%, y2pos%), shade%     'lines

NEXT

delay .8

 

END SUB



SUB linboxes             'linboxes draws random lines and boxes

 delay .8

  

 lop% = lop% + 1

	shade% = INT(RND(1) * 16) + 1

	x1pos% = INT(RND(1) * 600)           'initiate random numbers

	y1pos% = INT(RND(1) * 400)

	x2pos% = INT(RND(1) * 600)

	y2pos% = INT(RND(2) * 400)

					  

	 LINE (x1pos%, y1pos%)-(x2pos%, y2pos%), shade%, B   'boxes

 PAINT STEP(-1, -1), shade%, 0

delay .8

IF LEN(out$) THEN SYSTEM

END SUB



SUB oval              'oval draws random ovals

delay .8

 

RANDOMIZE TIMER

x% = INT(RND * 640) + 1

Y% = INT(RND * 480) + 1                  'initiate random numbers

event% = INT(RND * 91) + 1

rad% = INT(RND * 240) + 1

c% = INT(RND * 16)

 

 IF c% <= 0 THEN c% = 1

  

  CIRCLE (x%, Y%), rad%, 0, , , 2 / c%

	

delay .8

IF LEN(out$) THEN SYSTEM

END SUB



SUB paints    'paints  paints all non-black pixels a random color

			'starting at a random point

row% = INT(RND * 640)

col% = INT(RND * 480)                   'initiate random numbers

	PAINT (row%, col%), c%, 0

IF LEN(out$) THEN SYSTEM

END SUB



SUB paintsT

	       'paintsT  paintsT all non-cs% pixels a random color

			'starting at a random point

			    'upto 5 times

q% = INT(RND * 5) + 1

FOR t = 1 TO q%

 cs% = INT(RND * 15) + 1

 c% = INT(RND * 15) + 1

 row% = INT(RND * 640)

 col% = INT(RND * 480)                   'initiate random numbers

       

	PAINT (row%, col%), c%, cs%

	 

NEXT

delay .7

IF LEN(out$) THEN SYSTEM

END SUB



SUB pxset           'pxset sprinkles the screen with random color dots

n% = INT(RND * 1400)

DO

 xPos% = INT(RND * 640)

yPos% = INT(RND * 480)                   'initiate random numbers

 

row% = INT(RND * 640)

col% = INT(RND * 480)                   'initiate random numbers

c% = INT(RND * 16)



IF LEN(out$) THEN SYSTEM

PSET (xPos%, col%), c%

PSET (row%, yPos%), c%

PSET (xPos%, yPos%), c%

PSET (row%, col%), c%

lop% = lop% + 1

LOOP UNTIL lop% >= n%

IF LEN(out$) THEN SYSTEM

END SUB



SUB pxsett      'pxsett sprinkles the screen with random black dots

 n% = INT(RND * 1400)

DO

 xPos% = INT(RND * 640)

yPos% = INT(RND * 480)                   'initiate random numbers

 IF LEN(out$) THEN SYSTEM

row% = INT(RND * 640)

col% = INT(RND * 480)                   'initiate random numbers

 



PSET (xPos%, col%), 0

PSET (row%, yPos%), 0

PSET (xPos%, yPos%), 0

PSET (row%, col%), 0

lop% = lop% + 1

LOOP UNTIL lop% >= n%

 IF LEN(out$) THEN SYSTEM

END SUB



SUB tri                      'tri draws enough triangles one after

			'the other decreasing all points until the edge

		       'of the top or the left side of the screen is reached

delay 1

IF LEN(out$) THEN SYSTEM

row% = INT(RND * 640)

col% = INT(RND * 480)                   'initiate random numbers

event% = INT(RND * 100)

rad% = INT(RND * 40)

c% = INT(RND * 16)

COLOR c%, 0

	shade% = INT(RND * 16)

	x1pos% = INT(RND(1) * 639)      'initiate random numbers

	y1pos% = INT(RND(1) * 479)

	x2pos% = INT(RND(1) * 639)

	y2pos% = INT(RND(1) * 479)

	x3pos% = INT(RND(1) * 639)

	y3pos% = INT(RND(1) * 479)



 

	LINE (x1pos%, y1pos%)-(x2pos%, y2pos%), c%     'lines

	LINE (x2pos%, y2pos%)-(x3pos%, y3pos%), c%

	LINE (x3pos%, y3pos%)-(x1pos%, y1pos%), c%

DO

IF LEN(out$) THEN SYSTEM

	x1pos% = x1pos% - 1

	y1pos% = y1pos% - 1

	x2pos% = x2pos% - 1

	y2pos% = y2pos% - 1

	x3pos% = x3pos% - 1

	y3pos% = y3pos% - 1





IF x1pos% <= 0 THEN x1pos% = 1: EXIT DO

IF y1pos% <= 0 THEN y1pos% = 1: EXIT DO

IF x2pos% <= 0 THEN x2pos% = 1: EXIT DO

IF y2pos% <= 0 THEN y2pos% = 1: EXIT DO



	LINE (x1pos%, y1pos%)-(x2pos%, y2pos%), c%           'lines

	LINE (x2pos%, y2pos%)-(x3pos%, y3pos%), c%

	LINE (x3pos%, y3pos%)-(x1pos%, y1pos%), c%

LOOP

m% = INT(RND * 3) + 1

		 'issue three differnt PAINT statments randomly

SELECT CASE m%

CASE 1

PAINT STEP(-1, -1), shade%, c%

CASE 2

PAINT STEP(-1, -1), shade%, 0

CASE 3

PAINT STEP(-1, -1), 0, c%

END SELECT



delay 1



IF LEN(out$) THEN SYSTEM

END SUB



SUB xb                     'xb draws random black boxes

n% = INT(RND * 10)

 

FOR x% = 1 TO n%

row% = INT(RND * 640)

col% = INT(RND * 480)                   'initiate random numbers

arow% = INT(RND * 640)

acol% = INT(RND * 480)                   'initiate random numbers



	

LINE (row%, col%)-(arow%, acol%), 0, B

IF LEN(out$) THEN SYSTEM

NEXT x%

delay .9

IF LEN(out$) THEN SYSTEM

paints

END SUB



SUB xc                 'xc draws random black circles

n% = INT(RND * 20)

dia% = INT(RND * 100)

FOR x% = 1 TO n%

row% = INT(RND * 640)

col% = INT(RND * 480)                   'initiate random numbers

IF LEN(out$) THEN SYSTEM

 dia% = INT(RND * 640)

CIRCLE (row%, col%), dia%, 0

 

NEXT x%

 

delay .9

IF LEN(out$) THEN SYSTEM

END SUB



