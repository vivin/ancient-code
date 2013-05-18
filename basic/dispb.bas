

' Author: Carl Hultay
'
' Note: I use these subroutines with most of my programs since they are quite
'       handy for spiffing up your software. Usage notes are contained in all
'       routines.

DECLARE SUB Delay (A AS SINGLE)
DECLARE SUB DisplayBox (X AS INTEGER, Y AS INTEGER, FrameColourA AS INTEGER, FrameColourB AS INTEGER, TextColourA AS INTEGER, TextColourB AS INTEGER, FrameColour AS INTEGER, FrameLabel AS STRING, Text AS STRING, Size AS INTEGER, Speed AS SINGLE,  _
WaitKey AS INTEGER)
DECLARE SUB CloseBox (X AS INTEGER, Y AS INTEGER, Size AS INTEGER, Lines AS INTEGER, Speed AS SINGLE)

DIM SHARED OnScreen(25, 80) AS INTEGER
DIM SHARED OnColour(25, 80) AS INTEGER
DIM SHARED Lines AS INTEGER

CLS
COLOR 7, 0
FOR A = 1 TO 25
    FOR B = 1 TO 80
        PRINT "Ы";
    NEXT B
NEXT A

' Demonstration of DisplayBox
'
' Display Header, Text, Delay, No Wait
CALL DisplayBox(1, 1, 9, 1, 7, 1, 15, "This is the Frame Header", "This is sample text.. Ni! NI NI NI!!!! Ging ging ging ging!!!", 39, .05, 0)
' Display Text, Delay, Wait
CALL DisplayBox(4, 25, 7, 0, 3, 0, 0, "", "This is a text box that waits for a key...", 24, .05, 1)
CALL CloseBox(4, 25, 24, Lines, .05)
' Display Text, Delay, No Wait
CALL DisplayBox(4, 25, 7, 0, 3, 0, 0, "", "And rolls up!", 14, .05, 0)
' Display Text, Delay, No Wait
CALL DisplayBox(10, 15, 15, 7, 14, 7, 0, "", "Word wrap!", 6, .05, 0)
' Display Text, No Delay, No Wait
CALL DisplayBox(12, 40, 9, 1, 15, 1, 0, "", "You dont have to have a delay, which eliminates sound", 31, 0, 0)

SUB CloseBox (X AS INTEGER, Y AS INTEGER, Size AS INTEGER, Lines AS INTEGER, Speed AS SINGLE) STATIC

' WARNING: X and Y positions MUST be the same as well as the size!
'          if different values are passed, the box will not be cleared or
'          an error will occur.

' *** Command Syntax ***

' CALL CloseBox(X, Y, Size, Lines, Speed)
' X/Y = X/Y Exactly that of the Box Drawn!
' Size = Size Exactly that of the Box Drawn!
' Lines = You dont need to touch this!
' Speed = The speed to close

Size = Size + 10

IF Speed > 0 THEN
    ' Descending Soud
    FOR I = 1500 TO 500 STEP -(35 - (Lines * 5))
        SOUND I, I / 20000
    NEXT
END IF

' A is stated to signify the X position... while B is stated to
' signify columns... Purpose: Select the line X and draw all
'                             text of that line (Y to Length)
FOR A = (Lines + X) TO (X - 1) STEP -1
    ' Delay between line draws
    CALL Delay(Speed)
    LOCATE A + 2, Y
    FOR E = Y TO (Y + Size - 4)
        COLOR 8, 0
        IF A = X - 1 THEN
            ' Redraw top line which would not be redrawn
            ' normally because of my crappy programming.
            Foreground = OnColour(A + 2, E) AND 15
            Background = OnColour(A + 2, E) \ 16
            COLOR Foreground, Background
            PRINT CHR$(OnScreen(A + 2, E));
        ELSE
            ' Draw dimmed bottom line to create moving
            ' shade effect
            COLOR 8, 0
            LOCATE ((A - 1) + Lines), E
            PRINT CHR$(OnScreen(((A - 1) + Lines), E));
            ' Fix first two Y co-ordinates after dimming
            LOCATE (A - 1 + Lines), Y
            FOR F = Y TO Y + 1
                Foreground = OnColour(A + 1, F) AND 15
                Background = OnColour(A + 1, F) \ 16
                COLOR Foreground, Background
                PRINT CHR$(OnScreen(A + 1, F));
            NEXT F
            ' Draw Full Coloured Pulled Line
            LOCATE A + 2, E
            Foreground = OnColour(A + 2, E) AND 15
            Background = OnColour(A + 2, E) \ 16
            COLOR Foreground, Background
            PRINT CHR$(OnScreen(A + 2, E));
        END IF
    NEXT E
NEXT A

' Clean up very top line of Box Frame
LOCATE X, Y
FOR F = Y TO (Y + Size - 4)
    ' Draw Full Coloured Pulled Line
    Foreground = OnColour(X, F) AND 15
    Background = OnColour(X, F) \ 16
    COLOR Foreground, Background
    PRINT CHR$(OnScreen(X, F));
NEXT F

' Re-Initialize these values! VERY VERY IMPORTANT!
ERASE OnColour
ERASE OnScreen
Lines = 0

END SUB

SUB Delay (A AS SINGLE) STATIC

Start! = TIMER
DO
LOOP UNTIL TIMER - Start! >= A

END SUB

SUB DisplayBox (X AS INTEGER, Y AS INTEGER, FrameColourA AS INTEGER, FrameColourB AS INTEGER, TextColourA AS INTEGER, TextColourB AS INTEGER, FrameColour AS INTEGER, FrameLabel AS STRING, Text AS STRING, Size AS INTEGER, Speed AS SINGLE, WaitKey AS  _
INTEGER) STATIC

' Warning: DO NOT specify Size > 74 or < a Word in the String!!!

' *** Command Syntax ***

' CALL DisplayBox(X,Y,FrameColourA,FrameColourB,TextColourA,TextColourB,FrameColour, "FrameLabel","Text",Max Columns, Speed of Roll, Pause Toggle)

' X/Y Position - Draw Box at Location (Row, Column)
' FrameColourA/B - Colour of Frame (Foreground, Background)
' TextColourA/B - Colour of Text (Foreground, Background)
' FrameColour - Foreground Colour of Frame Header
' FrameLabel - The Frame Header
' "" - Your Text to Display Here
' Size - Maximum Display Columns
' Delay - Delay of Roll Up/Down
' WaitKey - 0 = No Pause, 1 = Pause

' Initialize all variables
CharProg = 1
OrgX = X
NewX = X
Lines = LEN(Text) / Size
Lines = INT(Lines + .5)

' Determine if Sound is on... if so: Ascending Sound
IF WaitKey = 1 OR Speed > 0 THEN
FOR I = 500 TO 1500 STEP (35 - Lines * 5)
   SOUND I, I / 20000
NEXT
END IF

' Capture Text to be Over-Written by Box and Shadow
FOR A = Y TO (Y + Size + 6)
    FOR B = X TO (X + Lines + 2)
        OnScreen(B, A) = SCREEN(B, A)
        OnColour(B, A) = SCREEN(B, A, 1)
    NEXT B
NEXT A

' Draw Box
LOCATE NewX, Y: COLOR FrameColourA, FrameColourB: PRINT " зд";

' Display Frame Header
IF LEN(FrameLabel) < Size THEN
    COLOR FrameColour
    PRINT FrameLabel;
    COLOR FrameColourA, FrameColourB
    FOR A = 1 TO (Size - LEN(FrameLabel) - 1)
        PRINT "д";
    NEXT A
ELSE

' Draw Top Text Border
FOR A = 1 TO Size - 1
    PRINT "д";
NEXT A
END IF

PRINT "д© "

FOR A = 1 TO Lines
    NewX = NewX + 1
    COLOR FrameColourA, FrameColourB
    LOCATE NewX, Y
    PRINT " юд";
    FOR C = 1 TO Size - 1
        PRINT "д";
    NEXT C
    PRINT "ды "

    COLOR 8, 0
    ' Draw dimmed bottom
    FOR B = Y TO (Y + Size + 6)
        LOCATE ((NewX - 1) + Lines), B
        PRINT CHR$(OnScreen(((NewX - 1) + Lines), B));
    NEXT B

    CALL Delay(Speed / 2)

    COLOR FrameColourA, FrameColourB
    LOCATE NewX, Y
    PRINT " Ё ";
    COLOR TextColourA, TextColourB
    PRINT SPACE$(Size - 1);
    COLOR FrameColourA, FrameColourB
    PRINT " Ё ";

    ' Draw dimmed edges
    COLOR 8, 0:
    FOR B = (Y + Size + 5) TO (Y + Size + 6)
        PRINT CHR$(OnScreen(NewX, B));
    NEXT B
NEXT A

NewX = NewX + 1
COLOR FrameColourA, FrameColourB
LOCATE NewX, Y
PRINT " юд";
FOR C = 1 TO Size - 1
        PRINT "д";
NEXT C
PRINT "ды ";

' Draw final dimmed edge
COLOR 8, 0
FOR B = (Y + Size + 5) TO (Y + Size + 6)
    PRINT CHR$(OnScreen(NewX, B));
NEXT B

' Draw dimmed bottom
FOR B = Y + 2 TO (Y + Size + 6)
    LOCATE (X + Lines + 2), B
    PRINT CHR$(OnScreen((X + Lines + 2), B));
NEXT B

' Display Text
FOR D = 1 TO Lines
    COLOR TextColourA, TextColourB
    DO
        Temp$ = MID$(Text, CharProg, Size)
        IF LEN(Text) - CharProg <= Size THEN
            X = X + 1
            LOCATE X, Y + 3
            PRINT MID$(Text, CharProg, Size)
            CharProg = CharProg + LEN(Temp$)
        ELSE
            X = X + 1
            LOCATE X, Y + 3
            FOR Ccnt = LEN(Temp$) TO 1 STEP -1
                IF MID$(Temp$, Ccnt, 1) = " " THEN EXIT FOR
            NEXT Ccnt
            PRINT LEFT$(Temp$, Ccnt)
            CharProg = CharProg + Ccnt
        END IF
    LOOP UNTIL CharProg >= LEN(Text)
NEXT D

IF WaitKey = 1 THEN
    DO WHILE INKEY$ = ""
    LOOP
END IF

END SUB

