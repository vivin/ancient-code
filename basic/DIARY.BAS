DECLARE SUB DrawBorder (text$, StartLocr%, StartLocc%, BorderColour%, TextColour%)
DECLARE SUB DrawBox (TopLeftPtR%, TopLeftPtC%, BottomRightPtR%, BottomRightPtC%, BoxColour%)
MainMenu:
UserSubMenu:
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

DrawBorder x$, 2, StartPt + 1, 7, 15
DrawBorder "User's Main Menu", 5, 32, 12, 10
DrawBox 8, 28, 16, 51, 13
DrawBorder "Diary (TM) Copyright (C) Sigma Software 1998-->", 19, 17, 12, 15
DrawBorder "Programmed By Vivin Suresh Paliath", 22, 23, 10, 15

LOCATE 9, 30
COLOR 15
PRINT "1. Make a new entry"
LOCATE 11, 30
PRINT "2. Review old entries"
LOCATE 13, 30
PRINT "3. Change settings"
LOCATE 15, 30
PRINT "4. Exit to main menu"
KeepGoing:
n$ = INKEY$
IF n$ = "1" THEN GOTO NewEntry
IF n$ = "2" THEN GOTO Review
IF n$ = "3" THEN GOTO ChangeSet
IF n$ = "4" THEN GOTO MainMenu ELSE GOTO KeepGoing
NewEntry:
CLS
dud:
y$ = INKEY$
DrawBorder "Do you want to continue (Y/N)?", 12, 27, 13, 15
IF LCASE$(y$) = "y" THEN GOTO GoOn
IF LCASE$(y$) = "n" THEN GOTO UserSubMenu ELSE GOTO dud
GoOn:
CLS
COLOR 10
LOCATE 1, 1
INPUT "Enter day (in words):", day$
INPUT "Enter month (in words):", month$
INPUT "Enter date (number):", dt
INPUT "Enter year (number):", year
INPUT "Enter Entry Number:", enum
CLS
DrawBorder x$, 2, StartPt + 1, 7, 15
DrawBorder "New Entry", 5, 36, 4, 15
DrawBorder "Diary (TM) Copyright (C) Sigma Software 1998-->", 19, 17, 12, 15
DrawBorder "Programmed By Vivin Suresh Paliath", 22, 23, 10, 15
DrawBox 7, 1, 8, 80, 14
LOCATE 9, 1
COLOR 15
PRINT ">"
LOCATE 9, 2
COLOR 13
LINE INPUT "", a$
END
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

SUB DrawBox (TopLeftPtR%, TopLeftPtC%, BottomRightPtR%, BottomRightPtC%, BoxColour%)

COLOR BoxColour

LOCATE TopLeftPtR, TopLeftPtC
PRINT CHR$(201)
LOCATE BottomRightPtR, BottomRightPtC
PRINT CHR$(188)
LOCATE TopLeftPtR, BottomRightPtC
PRINT CHR$(187)
LOCATE BottomRightPtR, TopLeftPtC
PRINT CHR$(200)

FOR i = TopLeftPtC + 1 TO BottomRightPtC - 1
LOCATE TopLeftPtR, i
PRINT CHR$(205)
LOCATE BottomRightPtR, i
PRINT CHR$(205)
NEXT i

FOR i = TopLeftPtR + 1 TO BottomRightPtR - 1
LOCATE i, TopLeftPtC
PRINT CHR$(186)
LOCATE i, BottomRightPtC
PRINT CHR$(186)
NEXT i

END SUB

