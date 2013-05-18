'***

'         Molnar \ Kucalaba Productions' "Ultimate Font v1.1"
'            written by Luke Molnar in not very much time.

' Remember, "Gratuitous advertising is ok for non-profit organizations!" =)
       
' Questions, Comments, and all that other crap is very welcome!  EMail:
'           blood225@aol.com, AOL Screen Name : Blood 225

' -- New in version 1.1 --
' * Incredible speed increase!
' * Italic font added!
' * Very fast loading


' This is a simple font demonstration.  Feel free to use the routines, but
' you'll have to understand how they work before you can copy them, or at
' least put forth a little effort into understanding them.  Or else odds
' are they probably won't do what you want them to.  This font doesn't
' include the extended characters (129-255) because we think it's a waste
' of disk space for trivial use of certain characters.  If, however, you
' want to change that, you can easily edit the MakeFont routine.  Also, if
' you think about it, the basefont data file is WAY too big (the 64 bytes
' we use for one letter can be reduced to 8) but it works and it would
' be too big of a headache to change it.  Oh yeah, using these routines
' and claiming them to be your own is strictly forbidden!

' This font routine features the following :
'  * Uses up to 63 colors per letter
'  * Evenly shades each letter
'  * Scalability (is that even a word?)
'  * Extremely fast for QBasic (Well, except for italics)
'  * More styles can be easily added
'  * The routine itself is pretty small, because it's not a whole bunch
'    of DRAW strings or LINEs

DECLARE SUB GetPress ()
DECLARE SUB Border ()
DECLARE SUB Font (text$, XStart%, ystart%, xscale%, Yscale%, Style%, Clr%)
DECLARE SUB SetPal ()
DECLARE SUB MakeFont ()
DECLARE SUB FindFont ()

' Instead of *slowly* reading each byte from the font file each time
' anything is drawn, we'll dump it into a buffer.
DIM SHARED FontBuf(0) AS STRING * 10368

CLS
SCREEN 13

' If you want to use this routine......
' Don't pay attention to this stuff, it's just all the page stuff.  The
' only things you need to know are the Font routine and optionally the SetPal
' routine.  And the FindFont routine isn't of any importance either. (Well,
' it's very important to this particular program!)


FindFont
CLS
SCREEN 13
LOCATE 10, 5
COLOR 15
PRINT "Hi.  This is boring text, huh?"
GetPress
CLS
SetPal  ' Sets up the colors quickly
Border ' Draws the really fancy border



Font "Molnar \ Kucalaba Productions", 20, 15, 1, 1, 2, 126
Font "on the Internet - Visit Today!", 20, 30, 1, 1, 2, 126
Font "M \ K", 15, 40, 5, 7, 4, 0
Font "FTP", 80, 100, 6, 3, 3, 190
Font "ftp://users.aol.com/blood225/", 30, 125, 1, 2, 1, 63
Font "WWW", 80, 145, 6, 3, 3, 190
Font "http://members.aol.com/mkwebsite/", 8, 170, 1, 2, 1, 63


GetPress
LINE (8, 10)-(304, 190), 0, BF ' Clear the non-border graphics

Font "There you will find...", 11, 15, 1, 3, 3, 126
Font "Over a meg of the highest quality", 9, 55, 1, 2, 3, 190
Font "QBASIC programs available,", 35, 80, 1, 2, 3, 190
Font "including", 49, 105, 1, 2, 3, 190
Font "GAMES,", 149, 105, 2, 2, 3, 64
Font "GRAPHICS DEMOS,", 28, 130, 2, 2, 3, 0
Font "and", 40, 155, 1, 2, 3, 190
Font "EXAMPLES!!!", 78, 155, 2, 2, 3, 126

GetPress
LINE (8, 10)-(304, 190), 0, BF ' Clear the non-border graphics

Font "VISIT", 38, 15, 6, 6, 3, 126
Font "US", 108, 68, 6, 6, 3, 126
Font "TODAY!", 9, 128, 6, 6, 3, 126

GetPress
LINE (8, 10)-(309, 190), 0, BF ' Clear the non-border graphics

Font "Coming Soon", 9, 10, 3, 3, 3, 190
Font "1) Sub Quest", 19, 45, 2, 2, 3, 0
Font "2) Pieces 2", 19, 65, 2, 2, 3, 126
Font "3) Fury!!!", 19, 85, 2, 2, 3, 0
Font "4) Ambush III", 19, 105, 2, 2, 3, 126
Font "5) Stick Boy", 19, 125, 2, 2, 3, 0

GetPress
LINE (8, 10)-(309, 190), 0, BF ' Clear the non-border graphics
Font "Fury v1.0", 25, 10, 3, 3, 4, 126
Font "* Digitized 256 color graphics!", 8, 50, 1, 1, 2, 190
Font "* Sound Blaster music & FX", 8, 65, 1, 1, 2, 190
Font "* Completely mouse-driven", 8, 80, 1, 1, 2, 190
Font "* 3 levels of mayhem", 8, 95, 1, 1, 2, 190
Font "* Two different enemies each level", 8, 110, 1, 1, 2, 190
Font "* Unique soundtrack for each level", 8, 125, 1, 1, 2, 190
Font "* Numerous Bells & Whistles", 8, 140, 1, 1, 2, 190
Font "Download a test version today!", 20, 160, 1, 2, 3, 64


GetPress
LINE (8, 10)-(309, 190), 0, BF ' Clear the non-border graphics
Font "Bye!", 60, 20, 6, 7, 3, 63
Font "=)", 98, 100, 7, 7, 3, 190

GetPress

CLS
SCREEN 0: WIDTH 80

COLOR 0
SYSTEM



' For those interested, here is how the Font routine works:

' Font Text$, xstart, ystart, xscale, yscale, style, color

' For color, 0 is red, 63 is green, 126 is blue, 190 is purple
' Of course, that is dependant on how your palette is set up.

' 4 styles....
'
' 1 = standard.  Best with 1 scale factor for x and y.  Like normal text, but
' with a calculated blend of 63 shades of a color.

' 2 = circular.  Looks bubbly, kind of hard to read but still better than
' boring text.  Drawn with Circles, play around with the aspect for cool
' fonts.  The bigger it gets the worse it looks

' 3 = revised 1.  Filled 1 style, slower but better with big letters.  Notice
' how this font always uses the maximum amount of colors for better appearance,
' there's absolutely no "blockiness" at all!  Also has kind of a "3D" appearance.

' 4 = Italic 3.  Pretty impressive

SUB Border
FOR x% = 0 TO 32
 Font "$", x% * 10, 0, 1, 1, 1, 0
 Font "$", x% * 10, 190, 1, 1, 1, 0
NEXT
FOR x% = 1 TO 19
 Font "$", 0, x% * 10, 1, 1, 1, 0
 Font "$", 310, x% * 10, 1, 1, 1, 0
NEXT
END SUB

SUB FindFont
OPEN "basefont.dat" FOR BINARY AS #1
 IF LOF(1) < 2 THEN
  NoFile% = 1
 END IF
 ' If the file is there, load all the crap into the buffer
 IF NoFile% <> 1 THEN GET #1, , FontBuf(0)
CLOSE #1
IF NoFile% THEN
 KILL "basefont.dat"
 CLS
 SCREEN 0
 WIDTH 80
 PRINT "We couldn't find the font data file!!"
 PRINT "Luckily for you, we can make one if you want"
 PRINT "to see the demo (hint : it's worth it!)"
 PRINT
 PRINT "So, should we make the font data file?"
 PRINT "1) Yes"
 PRINT "2) No"
 INPUT Choice%
 IF Choice% <> 1 THEN
  PRINT "Fine, be that way!"
  GetPress
  SYSTEM
 ELSE
  PRINT "Hit a key to make the file...it shouldn't take too long."
  PRINT "Oh yeah, don't go ballistic when you hear a beep, that's just"
  PRINT "the seventh character of 128!"
  GetPress
  MakeFont
 END IF
END IF
END SUB

SUB Font (text$, XStart%, ystart%, xscale%, Yscale%, Style%, Clr%)

px% = XStart%  ' physical x and physical y
py% = ystart%

LHeight% = Yscale% * 8
Optimize% = 63 \ LHeight% ' Any constant math operations done multipe times
                          ' in the main loop should, well, not be done
                          ' in the main loop.


' Instead of wasting our time with all this MID$ garbage to access bytes in
' font buffer, we'll just take a PEEK directly at them.
DEF SEG = VARSEG(FontBuf(0))

 FOR h% = 1 TO LEN(text$)
  FPtr% = 81 * (ASC(MID$(text$, h%, 1)) - 1) - 1
  FOR x% = 0 TO 8
   FOR y% = 0 TO 8
 
    Col% = PEEK(VARPTR(FontBuf(0)) + FPtr%)
    FPtr% = FPtr% + 1
    IF Col% THEN
     SELECT CASE Style%
      ' If you desire a y scale factor greater than 8, you
      ' must change the division to higher precision...very slow.
      ' Or, you could find a way around it.
      CASE 1: PSET (px%, py%), Optimize% * (py% - ystart%) + Clr%
              LINE (px%, py%)-(px%, py% + Yscale%), Optimize% * (py% - ystart%) + Clr%
      ' Notice how this style only uses 54 colors, so you can see the top
      ' of the letters where they would normally be black
      CASE 2: CIRCLE (px%, py%), Yscale%, (54 \ LHeight%) * (py% - ystart%) + Clr% + 9, , , 4
      CASE 3:  FOR sty% = px% TO px% + xscale%
                FOR sty2% = py% TO py% + Yscale%
                 PSET (sty%, sty2%), Optimize% * (sty2% - ystart%) + Clr%
                 IF POINT(sty% - 1, sty2%) = 0 THEN PSET (sty% - 1, sty2%), 63 + Clr% - 1
                 IF POINT(sty%, sty2% - 1) = 0 THEN PSET (sty%, sty2% - 1), 63 + Clr% - 1
                NEXT
               NEXT
       CASE 4: FOR sty% = px% TO px% + xscale%
                FOR sty2% = py% TO py% + Yscale%
                 PSET (sty% + .4 * sty2%, sty2%), Optimize% * (sty2% - ystart%) + Clr%
                 IF POINT((sty% - 1) + .4 * sty2%, sty2%) = 0 THEN PSET ((sty% - 1) + .4 * sty2%, sty2%), 63 + Clr% - 1
                NEXT
               NEXT

     END SELECT
    END IF
    py% = py% + Yscale%
   NEXT
  px% = px% + xscale%
  py% = ystart%
  NEXT
 NEXT h%
DEF SEG
END SUB

SUB GetPress
DO
aa$ = INKEY$
LOOP UNTIL aa$ <> ""
END SUB

SUB MakeFont
OPEN "basefont.dat" FOR BINARY AS #1
' Hey, change 128 to 255 for the full font.
CLS
SCREEN 13
COLOR 16
FOR ascii% = 1 TO 128
 CLS
 PRINT CHR$(ascii%)
 FOR x = 0 TO 8
  FOR y = 0 TO 8
   pnt$ = CHR$(POINT(x, y))
   PUT #1, , pnt$
   pnt$ = ""
  NEXT
 NEXT
NEXT
CLOSE
OPEN "basefont.dat" FOR BINARY AS #1
 GET #1, , FontBuf(0)
CLOSE #1
END SUB

SUB SetPal
FOR x% = 1 TO 63
 OUT &H3C8, x%
 OUT &H3C9, x%
 OUT &H3C9, 0
 OUT &H3C9, 0
NEXT
FOR x% = 64 TO 126
 OUT &H3C8, x%
 OUT &H3C9, 0
 OUT &H3C9, x%
 OUT &H3C9, 0
NEXT
FOR x% = 127 TO 189
 OUT &H3C8, x%
 OUT &H3C9, 0
 OUT &H3C9, 0
 OUT &H3C9, x%
NEXT
FOR x% = 190 TO 252
 OUT &H3C8, x%
 OUT &H3C9, x%
 OUT &H3C9, 0
 OUT &H3C9, x%
NEXT
FOR x% = 253 TO 255
 OUT &H3C8, x%
 OUT &H3C9, x%
 OUT &H3C9, x%
 OUT &H3C9, x%
NEXT

END SUB

