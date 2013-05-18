DECLARE SUB DrawBorder (text$, StartLocr%, StartLocc%, BorderColour%, TextColour%)
MainMenu:
CLS
SCREEN 0
COLOR 15, 1
CLS
OPEN "Diary.cfg" FOR INPUT AS #1
     'ON ERROR GOTO CreateNew
     INPUT #1, name$
CLOSE #1

x$ = "Personal Journal Of " + name$
n% = LEN(x$) / 2
IF n% > 39 THEN BEEP: PRINT "Hey! Your name's longer than 39 chars! Reenter it please.": GOTO CreateNew
StartPt = 40 - n%
LOCATE 2, StartPt + 1
COLOR 7

DrawBorder x$, 2, StartPt + 1, 7, 15

DrawBorder "User's Main Menu", 5, 32, 12, 10


LOCATE 9, 21
COLOR 7
PRINT "1. Make a new entry"
LOCATE 10, 21
PRINT "2. Review old entries"
LOCATE 12, 21
PRINT "3. Change settings"
LOCATE 14, 21
PRINT "4. Exit to main menu"
KeepGoing:
n$ = INKEY$
IF INKEY$ = "1" THEN GOTO NewEntry
IF INKEY$ = "2" THEN GOTO Review
IF INKEY$ = "3" THEN GOTO ChangeSet
IF INKEY$ = "4" THEN GOTO MainMenu ELSE GOTO KeepGoing
NewEntry:
Review:
ChangeSet:
CreateNew:

DEFINT A-Z
'
SUB DrawBorder (text$, StartLocr%, StartLocc%, BorderColour%, TextColour%)

TextLen = LEN(text$)
TopLeftEdger = StartLocr - 1
TopLeftEdgec = StartLocc - 1
BottomLeftEdger = StartLocr + 1
BottomLeftEdgec = TopLeftEdgec
TopRightEdger = TopLeftEdger
TopRightEdgec = StartLocc + TextLen
BottomRightEdger = BottomLeftEdger
BottomRightEdgec = TopRightEdgec

COLOR TextColour
LOCATE StartLocr, StartLocc
PRINT text$

COLOR BorderColour
LOCATE TopLeftEdger, TopLeftEdgec
PRINT CHR$(201)
LOCATE BottomLeftEdger, BottomLeftEdgec
PRINT CHR$(200)
LOCATE TopRightEdger, TopRightEdgec
PRINT CHR$(187)
LOCATE BottomRightEdger, BottomRightEdgec
PRINT CHR$(188)

FOR i = StartLocc TO (StartLocc + TextLen) - 1
LOCATE TopLeftEdger, i
PRINT CHR$(205)
LOCATE BottomLeftEdger, i
PRINT CHR$(205)
NEXT i

LOCATE StartLocr, StartLocc - 1
PRINT CHR$(186)
LOCATE StartLocr, StartLocc + TextLen
PRINT CHR$(186)
END SUB

