

'OsCiLlOsCoPe with spiffy bg

'1996 RSSoft

'devilboy@cyberhall.com

'Written on a P166+ w/GoldStar GCDR-540B x4 cdrom drive, sbawe32 card

'

'I didn't think qbasic was capable of the speed required to do this.

'Then I ran across the asm code to do it, ported it to qb, and whaddya know,

'it is fast enough.  There's not much to it, only a tenny bit of code.

'Just peeking, poking and port inputs...That's it.

'NEW Jupiter Looking Background thing, courtesy of \Hack\ on #qbasic



DIM lin(0 TO 319) AS DOUBLE

DIM saved(0 TO 319) AS DOUBLE

COMMON SHARED dat AS INTEGER, j AS LONG



StartUp:

DEF SEG = &HA000

RANDOMIZE TIMER

SCREEN 13

FOR i = 0 TO 255                'set the palette to black while

        OUT &H3C9, 0            'the screen draws

        OUT &H3C9, 0

        OUT &H3C9, 0

NEXT i

j = 0



DrawBG:

c = 1: p = 1: x = 160: y = 100: s = 100

DO

        c = c + 1: p = p + 1

        IF c = 245 THEN c = 1

        IF p = 64 THEN p = 1

        CIRCLE (x, y), s, c

        PAINT (x, y), c, c

        x = x + 1: y = y - 1: s = s - 2

        IF s < 0 THEN EXIT DO

LOOP



FOR i& = 63999 TO 0 STEP -1     'plot random stars, the fast way...

        IF PEEK(i&) <> 0 THEN GOTO blah

        IF PEEK(i&) = INT(RND * 255) THEN POKE i&, RND * 255

blah: NEXT i&



Main:

DO WHILE r$ = ""                'main loop

OUT &H3C8, 0                    'set palette register to 0

FOR i = 0 TO 255                'set palette to red

        OUT &H3C9, i

        OUT &H3C9, 0

        OUT &H3C9, 0

NEXT i

OUT &H3C8, 0                    'set palette register to 0

FOR i = 0 TO 255                'set palette to green

        OUT &H3C9, 0

        OUT &H3C9, i

        OUT &H3C9, 0

NEXT i

OUT &H3C8, 0                    'set palette register to 0

FOR i = 0 TO 255                'set palette to blue

        OUT &H3C9, 0

        OUT &H3C9, 0

        OUT &H3C9, i

NEXT i

FOR i = 0 TO 319                                'oscilloscope loop

        OUT &H22C, &H20                         'tell SB you want a byte

l1: IF INP(&H22E) = 127 THEN GOTO l1            'if byte null, wait till not null

        dat = ((INP(&H22A) * 1) MOD 50) + 50    'get byte, scale

        lin(i) = PEEK((dat * 320) + i)          'get old pixel

        saved(i) = dat                          'save old pixel to array

        POKE (dat * 320) + i, 250               'poke byte

        IF i <> 319 THEN POKE (saved(i + 1) * 320) + i + 1, lin(i + 1) 'restore old pixel

NEXT i

r$ = INKEY$

LOOP

SCREEN 0

WIDTH 80, 25

