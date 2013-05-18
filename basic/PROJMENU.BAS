1 SCREEN 9
SCREEN 0
CLS
LOCATE 1, 1
COLOR 31
PRINT "[Don't get bored by the poor menu graphix.... wait till you see what's ahead...]"
LOCATE 3, 33
COLOR 28
PRINT "Press X to Exit"

LOCATE 4, 36
COLOR 9
PRINT "The Menu"
LOCATE 5, 36
PRINT "--------"
COLOR 2
LOCATE 7, 10
PRINT "1. Overview  <sound capability unavailable... probably on saturday>"
LOCATE 9, 10
PRINT "2. Qbasic's Graphic Capabilities"
LOCATE 11, 10
PRINT "3. Qbasic's Sound Capabilities [Thru SOUND BLASTER!!!]"
LOCATE 13, 10
PRINT "4. Curses! - A practical joke program"
LOCATE 15, 10
PRINT "5. Awesome Dos - Another cool practical joke program"
LOCATE 17, 10
PRINT "6. TC Install (Fake Installation) - A great practical joker aren't I?"
LOCATE 19, 10
PRINT "7. Las Vegas Slot Machine - A game"
LOCATE 21, 10
PRINT "8. Shooting Gallery - Another game"
LOCATE 23, 10
PRINT "9. The Swami - A fortune telling program"
CheckEvents:
Y$ = INKEY$
IF Y$ = "1" THEN CHAIN "overview.bas": GOTO 1
IF Y$ = "2" THEN CHAIN "graphix.bas": GOTO 1
IF Y$ = "3" THEN CHAIN "soundz.bas": GOTO 1
IF Y$ = "4" THEN SHELL "curses!.exe": GOTO 1
IF Y$ = "5" THEN SHELL "awsumdos.exe": GOTO 1
IF Y$ = "6" THEN SHELL "tcinstal.exe": GOTO 1
IF Y$ = "7" THEN CHAIN "lasvegas.bas": GOTO 1
IF Y$ = "8" THEN CHAIN "shoot.bas": GOTO 1
IF Y$ = "9" THEN CHAIN "swami.bas": GOTO 1
IF Y$ = "X" OR Y$ = "x" THEN CHAIN "guest.bas" ELSE GOTO CheckEvents




























