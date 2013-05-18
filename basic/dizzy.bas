'       This program was used as a screen saver for me for a while
'       (Before WIN95) - now I just watch it now and then.
'       Change the TLEN variable (below) and the tails can get much
'       longer without slowing down the program.  Neat.
'                                       -BJS
'                                        CakeStick@writeme.com

SCREEN 12
CLS
TLEN = 570                              'roughly the number of boxes
REDIM XS(TLEN)                          'x coordinate (array)
REDIM YS(TLEN)                          'y coordinate (array)
T = 1                                   'a counter
COUNTCOUNT = 1                          'a counter for spin type
CHANGECOUNT = 1500                      'time to change spin
XMULT = 100                             'expansion/contraction
YMULT = 80                              'expansion/contraction
XPLUS = .1                              'expansion/contraction
YPLUS = .1                              'expansion/contraction
XOFFSET = 300                           'center of screen
YOFFSET = 200                           'center of screen
CCOUNT = 1                              'counter for color
COLCHANGE = 500                         'when to change color
MAXX = 300                              'limits of expansion
MAXY = 150                              'limits of expansion
COL = 15                                'beginning color
XSTEP = 1.31                            'rate for counter
BOXSIZE = 8                             'how big are the boxes

TOP:
M = SIN(T): N = COS(T)
X = M * XMULT: Y = N * YMULT
X = X + XOFFSET
Y = Y + YOFFSET
GOSUB ARRAY
GOSUB GOOPY
T = T + XSTEP
GOTO TOP

ARRAY:
CT = CT + 1
IF CT >= TLEN THEN CT = 1
XS(CT) = X: YS(CT) = Y
LINE (X - BOXSIZE, Y - BOXSIZE)-(X, Y), COL, B
'                                            ^change B to BF
'                                             for solid boxes
R = CT + 1
IF R >= TLEN THEN R = 1
LINE (XS(R) - BOXSIZE, YS(R) - BOXSIZE)-(XS(R), YS(R)), 0, B
'                                                          ^change B to BF
'                                                           for solid boxes
CCOUNT = CCOUNT + 1
IF CCOUNT >= COLCHANGE THEN
	CCOUNT = 1
	COL = COL + 1
	IF COL = 16 THEN COL = 1
END IF
''''''''''''''''''''''''''''''''''''''''''''
A$ = INKEY$: IF A$ <> "" THEN END               'wait for keyboard input
RETURN
''''''''''''''''''''''''''''''''''''''''''''
GOOPY:
IF XMULT > MAXX THEN XPLUS = ((INT(RND * 20) + 1) / 70) * -1: MINX = INT(RND * 300) + 1: MINX = MINX * -1
IF XMULT < MINX THEN XPLUS = (INT(RND * 20) + 1) / 70: MAXX = INT(RND * 300) + 1
XMULT = XMULT + XPLUS
IF YMULT > MAXY THEN YPLUS = ((INT(RND * 20) + 1) / 70) * -1: MINY = INT(RND * 150) + 1: MINY = MINY * -1
IF YMULT < -130 THEN YPLUS = (INT(RND * 20) + 1) / 70: MAXY = INT(RND * 150) + 1
YMULT = YMULT + YPLUS
COUNTCOUNT = COUNTCOUNT + 1
IF COUNTCOUNT >= CHANGECOUNT THEN
	COUNTCOUNT = 1
	CHANGECOUNT = INT(RND * 50) + 1
	CHANGECOUNT = CHANGECOUNT * 100
	XSTEP = VAL(RIGHT$(TIME$, 2))
	XSTEP = XSTEP / 100: XSTEP = XSTEP + .001
END IF
IF XSTEP > 5000 THEN XSTEP = 1
RETURN

