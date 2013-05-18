

DEFINT A-Z

DECLARE SUB Scale (sx%, sy%, srx%, sry%, ScaleX%, ScaleY%, LocX%, LocY%)

DECLARE SUB Pal (c%, r%, g%, b%)

SCREEN 13: RANDOMIZE TIMER



NumPoints = 100       'number of points

gx = 320: gy = 50     'size of scan grid (x by y)[max gx * gy = 16383]

Savepoints = gx * gy  'sizes array to save points



ON ERROR GOTO ErrHand 'error handlered



DIM sp(Savepoints, 1) 'dim array to save points



FOR c = 0 TO 63       'set gray palette

  Pal c, c, c, c

NEXT



COLOR 63

PRINT "Smooth by"

PRINT "Matt Bross"

Scale 0, 0, 80, 16, 3, 3, 50, 70

LINE (0, 0)-(80, 16), 0, BF



'PSET randomly

FOR t = 0 TO NumPoints

  x = INT(RND * 320): y = INT(RND * 200)

  IF POINT(x, y) = 0 THEN PSET (x, y), INT(RND * 63)

NEXT

'END

DO

'setup scan grid

z = 0: ex = sx + gx: ey = sy + gy

IF ex > 320 THEN ex = 320

IF ey > 200 THEN ey = 200



'scan grid

FOR y = sy TO ey

FOR x = sx TO ex

  IF POINT(x, y) <> 0 THEN sp(z, 0) = x: sp(z, 1) = y: z = z + 1

NEXT: NEXT



'PSET around points

FOR w = 0 TO z

  x = sp(w, 0): y = sp(w, 1): cc = 1

    c1 = POINT(x, y) + cc: IF c1 > 63 THEN c1 = 63

  PSET (x, y), c1

    c2 = POINT(x, y + 1)   'get point value

    c3 = (c1 + c2) / 2     'average it

  PSET (x, y + 1), c3

    c2 = POINT(x - 1, y)   'same as last comment

    c3 = (c1 + c2) / 2

  PSET (x - 1, y), c3

    c2 = POINT(x + 1, y)   'same as last comment

    c3 = (c1 + c2) / 2

  PSET (x + 1, y), c3

    c2 = POINT(x, y - 1)   'same as last comment

    c3 = (c1 + c2) / 2

  PSET (x, y - 1), c3

NEXT



'setup scan grid

sx = sx + gx

IF ey >= 200 AND ex >= 320 THEN sx = 0: sy = -gy + 2

IF ex >= 320 THEN sy = sy + gy: sx = 0



LOOP UNTIL INKEY$ <> ""

END



ErrHand:

z = Savepoints

RESUME NEXT

SUB Pal (c, r, g, b)

OUT &H3C8, c

OUT &H3C9, r

OUT &H3C9, g

OUT &H3C9, b

END SUB

SUB Scale (sx, sy, srx, sry, ScaleX, ScaleY, LocX, LocY)

REDIM array(sx TO sx + srx, sy TO sy + sry)



FOR y3 = sy TO sy + sry

FOR x3 = sx TO sx + srx

  array(x3, y3) = POINT(x3, y3)

NEXT: NEXT



FOR y3 = sy TO sy + sry

FOR x3 = sx TO sx + srx

    x1 = (x3 * ScaleX) + LocX

    y1 = (y3 * ScaleY) + LocY

    x2 = (x3 * ScaleX) + ScaleX + LocX

    y2 = (y3 * ScaleY) + ScaleY + LocY

      LINE (x1, y1)-(x2, y2), array(x3, y3), BF

NEXT: NEXT

ERASE array

END SUB

