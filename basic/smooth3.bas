SCREEN 12
RANDOMIZE TIMER
DEFINT A, C-F, H-Q, S-Z
smooth% = 3     'times map is smoothed
rows% = 100     'number of rows%
columns% = 100  'number of columns%
height% = 5     'maximum hieght
fill% = 2       '1=solid  2=lines ELSE=dotted
puddles% = 25   'number of puddles%
maxsize% = 14   'max size of puddles%
minsize% = 5    'min size of puddles%
tilt = 2        'tilt of 3-D map
scale = 5       'scale of 3-D map to flat map
flat = 2        '1=flat top  ELSE=rough
mode = 1        'how puddles are made (1 or 2)

'sets up the palette
r1 = 0: r2 = 63 '\
g1 = 0: g2 = 63 ' }starting and ending rgb values for background
b1 = 0: b2 = 0  '/


'palette ideas:
'r=0 \          r=63\
'g=0  }black    g=63 }white
'b=0 /          b=63/

'r=63\          r=0 \
'g=0  }red      g=63 }cyan
'b=0 /          b=63/

'r=0 \          r=63\
'g=63 }green    g=0  }purple
'b=0 /          b=63/

'r=0 \          r=63\
'g=0  }blue     g=63 }yellow
'b=63/          b=0 /
'by using numbers like 31, you can create blends


rstep1 = (r2 - r1) / 16
gstep1 = (g2 - g1) / 16
bstep1 = (b2 - b1) / 16
FOR a = 0 TO 15
        r1 = r1 + rstep1
        g1 = g1 + gstep1
        b1 = b1 + bstep1
        PALETTE a, (INT(r1)) + (INT(g1) * 256) + (INT(b1) * 65536)
NEXT

IF flat = 1 THEN
        LINE (1, 1)-(rows%, columns%), 15, BF
ELSE
        FOR b = 1 TO rows%
                FOR c = 1 TO columns%
                        f = INT(15 * RND) + 2
                        IF b + d <= rows% AND c + e <= columns% THEN PSET (b + d, c + e), f
                NEXT
        NEXT
END IF

'there are two ways to make to water
'the first one has a lot more water and more rounded shoreline

IF mode = 1 THEN
        c = 1
        FOR a = maxsize% TO minsize% STEP -1
                FOR b = 1 TO c
                        DO
                                d = INT(RND * rows%)
                                e = INT(RND * columns%)
                        LOOP UNTIL POINT(d, e) <> 1
                        f = RND + .5
                        CIRCLE (d, e), a, 1, , , f
                        PAINT (d, e), 1
                NEXT
                c = 1.3 * c
        NEXT
END IF
IF mode = 2 THEN
        FOR b = 1 TO puddles%
                DO
                        c = INT(RND * rows%)
                        d = INT(RND * columns%)
                LOOP UNTIL POINT(c, d) <> 1
                e = INT(RND * maxsize%)
                f = RND + .5
                CIRCLE (c, d), e, 1, , , f
                PAINT (c, d), 1
        NEXT
END IF

LINE (rows% + 1, 0)-(rows% + maxsize% + 1, columns% + maxsize% + 1), 0, BF
LINE (0, columns% + 1)-(rows% + maxsize% + 1, columns% + maxsize% + 1), 0, BF

FOR d = 1 TO smooth%
        FOR X = 1 TO rows%
                FOR Y = 1 TO columns%
                        col = 0
                        FOR X1 = X - 1 TO X + 1
                                FOR Y1 = Y - 1 TO Y + 1
                                        X2 = X1
                                        Y2 = Y1
                                        'IF X1 > rows% THEN X2 = X2 - rows%
                                        'IF X1 < 1 THEN X2 = X2 + rows%
                                        'IF Y1 > columns% THEN Y2 = Y2 - columns%
                                        'IF Y1 < 1 THEN Y2 = Y2 + columns%
                                        col = col + POINT(X2, Y2)
                                NEXT
                        NEXT
                        IF INKEY$ <> "" THEN END
                        col = col / 9
                        PSET (X, Y), col
                NEXT
        NEXT
NEXT

FOR b = 1 TO rows% - 1
        FOR a = 1 TO columns% - 1
                PSET (b, a + columns% + 1), smooth% * (POINT(b, a) - POINT(b + 1, a)) + 8
                PSET (b, a + 2 * columns% + 1), smooth% * (POINT(b, a) - POINT(b - 1, a)) + 8
                PSET (b, a + 3 * columns% + 1), smooth% * (POINT(b, a) - POINT(b, a - 1)) + 8
                PSET (b, a + 4 * columns% + 1), smooth% * (POINT(b, a) - POINT(b, a + 1)) + 8
                c = scale * a + rows% + tilt * b                                'this is sort of what one tile would be like
                d = scale * b - height% * POINT(a, b) + columns%                '(c,d)          (e,f)
                e = scale * (a + 1) + rows% + tilt * b                          '  _____________
                f = scale * b - height% * POINT(a + 1, b) + columns%            '   \           \
                g = scale * a + rows% + tilt * (b + 1)                          '    \           \
                h = scale * (b + 1) - height% * POINT(a, b + 1) + columns%      '     \___________\
                i = scale * (a + 1) + rows% + tilt * (b + 1)                    ' (g,h)            (i,j)
                j = scale * (b + 1) - height% * POINT(a + 1, b + 1) + columns%  '
                k = POINT(a, b)
                IF fill% = 1 THEN
                        slope1 = (g - c) / scale
                        slope2 = (h - d) / scale
                        slope3 = (i - e) / scale
                        slope4 = (j - f) / scale
                        FOR a2 = 0 TO scale STEP 1 / (2 * height%)
                                LINE (c + a2 * slope1, d + a2 * slope2)-(e + a2 * slope3, f + a2 * slope4), k
                        NEXT
                END IF
                IF fill% = 2 THEN
                        LINE (c, d)-(e, f), k
                        LINE (c, d)-(g, h), k
                        LINE (i, j)-(g, h), k
                        LINE (i, j)-(e, f), k
                ELSE
                        PSET (c, d), k
                END IF
                IF INKEY$ <> "" THEN END
        NEXT a
NEXT b

