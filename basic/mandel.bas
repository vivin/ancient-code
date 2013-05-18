DEFINT A-Z
DECLARE SUB text ()
scale$ = "ccaacc"
PLAY "L32"
FOR i% = 0 TO 6
PLAY "O" + STR$(i%)
PLAY "X" + VARPTR$(scale$)
NEXT i%
LOCATE 13, 20
COLOR 4
PRINT "The Mandelbroth Set"
LOCATE 14, 20
COLOR 5
PRINT "By Brent Bernstein"
LOCATE 15, 20
COLOR 6
PRINT "Copyright 1997"
LOCATE 16, 20
COLOR 2
PRINT "Version 9.64"
LOCATE 20, 20
COLOR 9
PRINT "Press Any Key To Continue"
SLEEP 5
CALL text
a$ = INPUT$(1)
IF INKEY$ = CHR$(27) THEN GOTO 10
10 DEFSNG A-Z
20 SCREEN 12: KEY OFF
30 INPUT "colors"; numcolors
40 INPUT "height"; numcols
50 INPUT "length"; numrows
60 xoffest = 1
70 yoffset = 1
80 INPUT "real part"; acorner
90 INPUT "imag. part"; bcorner
100 INPUT "side"; side
110 INPUT "maxdwell"; maxdwell
120 CLS
130 COLOR 1
scale$ = "ccaacc"
PLAY "L32"
FOR i% = 0 TO 6
PLAY "O" + STR$(i%)
PLAY "X" + VARPTR$(scale$)
NEXT i%
140 LINE (0, 0)-(numcols + xoffset, 0)
150 LINE (numcols + xoffset, 0)-(numcols + xoffset, numrows + yoffset)
160 LINE (numcols + xoffset, numrows + yoffset)-(0, numrows + yoffset)
170 LINE (0, numrows + yoffset)-(0, 0)
180 LOCATE 17, 1
190 PRINT "done -->"
200 PRINT "dwell for last pixel = 0"
210 PRINT "largest dwell = 0"
220 PRINT "real part = "; acorner
230 PRINT "Imaginary part = "; bcorner
240 PRINT "side ="; side
245 PRINT "height"; numcols
246 PRINT "length"; numrows
247 LOCATE 19, 34
248 PRINT "Press Escape to Stop"
250 highdwell = 0
260 gap = side / numrows
270 ac = acorner
280 FOR X = xoffset TO numrows - 1 + xoffset
290 ac = ac + gap
300 bc = bcorner
310 FOR y = yoffset TO numcols - 1 + xoffset
320 bc = bc + gap
330 az = 0
340 bz = 0
350 COUNT% = 0
360 SIZE = 0
370 WHILE (SIZE < 4) AND (COUNT% < maxdwell)
380 temp = az * az - bz * bz + ac
390 bz = 2 * az * bz + bc
400 az = temp
410 SIZE = az * az + bz * bz
420 COUNT% = COUNT% + 1
430 WEND
440 COLOR 1
450 LOCATE 18, 23
460 PRINT COUNT%; "";
465 IF INKEY$ <> "" THEN END
470 IF (COUNT% > highdwell) THEN highdwell = COUNT%:
LOCATE 19, 16: PRINT highdwell
480 IF COUNT% = maxdwell THEN PSET (X, numrows - y + 1), 0
PSET (X, numrows - y + 1), COUNT% MOD (numcolors - 1) + 1
490 NEXT y
500 LOCATE 17, 22
510 PRINT 100 * X / numcols; "";
520 NEXT X
scale$ = "dddaaaccc"
PLAY "L32"
FOR i% = 0 TO 6
PLAY "O" + STR$(i%)
PLAY "X" + VARPTR$(scale$)
NEXT i%
530
540 a$ = INPUT$(1)
550 IF INKEY$ = CHR$(27) THEN STOP
560 IF INKEY$ >= CHR$(27) THEN GOTO 550

SUB text
CLS
COLOR 7
PRINT "This program shows the famous Mandelbroth Set. The coordinates to see the"
PRINT "entire Set are -2,-2,4 and the standard window is 200 X 200. The MaxDwell"
PRINT "is how long the computer takes figuring out whether a pixel is or is not"
PRINT "in the Set. You should not use coordinates that are outside -2 and 2 for"
PRINT "the windows and more that 4 for the length of the side"
PRINT ""
PRINT "Standard settings are:"
PRINT "Colors: 16"
PRINT "Length & Width: 200"
PRINT "Maxdwell: 150 for fast, 500 for very detailed"
PRINT ""
PRINT "A fractal is a geometric pattern that is repeated forever on all scales."
PRINT "This results in the effect of a fractal continuing on forever, or no matter"
PRINT "how much you zoom in, there will always be some sort of complexity. In this"
PRINT "program, blue is within the set, for 16 color mode, and brown is within the"
PRINT "set for 4 color mode."
PRINT ""
PRINT "Press Enter to Continue"
SLEEP
END SUB

