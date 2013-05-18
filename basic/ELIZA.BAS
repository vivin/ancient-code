' ELIZA: Computer Therapist   Version 8.0

' Daniel Fletcher
' PO Box 208
' Taberg, NY  13471

' E-Mail: danielfletcher@cyberdude.com
' My birthday is 7-15-81 so if there are any people out there around my
' age who are into programming e-mail me.

' I've been working on this program since I was in Middle School.
' It's based on a program I saw in a book in the school library, but their
' version sucked big time, so I decided to write a cooler one.

' Learn how to modify keywords and phrases in the instructions
' around line 150...

' I decided to upload it because one of the first programs I downloaded
' from the The Q-Basic Page [www.qbasic.com] was one called 'CHAT'
' by Mallard.

' You can e-mail him at "mallard@gcomm.com" or visit his web page at
' "http://www.lookup.com/homepages/80948/qb/index.html"

' I'm working on my own web page at
' "http://www.geocities.com/SoHo/9083/xyzzy.htm" {Subject to change...}
' I don't expect to have anything up till April 1997, e-mail for more info.

DECLARE SUB DrawSides ()
DECLARE SUB Logo ()
DECLARE FUNCTION InputString$ (Row%, Column%, Length%, Foreground%, Background%, ValidCharacters$, ReturnMode%, EntryMode%, CaseMode%)
DECLARE SUB PrintReply (Text$)
DECLARE SUB PrintAt (Row!, Column!, Text$)
DECLARE SUB Center (Row!, Text$)
DECLARE SUB DrawBoard ()
DECLARE SUB TeleType (Text$, Delay!)
DECLARE SUB GifLoad (FileName$)
DECLARE SUB Pause (Seconds!)
DECLARE SUB Setup ()

StartProgram:
DIM SHARED StartLinesOfReplies(200), R(200), NumberOfReplies(200), UserInput$
DIM SHARED Sprites(1000)
COMMON SHARED NumberOfKeywords, NumberOfConjugations
COMMON SHARED Reply$

CHDIR "C:\ELIZA\"    'Modify this line to point to where
                     'the files are located.

Logo

Initialization:
Setup

UserInput:
PRINT
DrawSides
UserInput$ = InputString$(CSRLIN, 2, 78, 1, 11, "", 4, 2, 1)
UserInput$ = " " + UCASE$(UserInput$) + "  "
IF INSTR(UserInput$, "XYZZY") THEN COLOR 15, 1: CLS : VIEW PRINT 1 TO 25: GOTO Initialization
IF INSTR(UserInput$, "SHUT UP...") THEN GOTO Quit

FOR L = 1 TO LEN(UserInput$)
DO WHILE MID$(UserInput$, L, 1) = "'"
    UserInput$ = LEFT$(UserInput$, L - 1) + RIGHT$(UserInput$, LEN(UserInput$) - L)
LOOP
NEXT L
   
RESTORE Keywords
S = 0
FOR K = 1 TO NumberOfKeywords
    READ K$, Temp, Temp
    IF S > 0 AND INT(RND * 1) + 1 = 2 THEN GOTO KLoop
    FOR L = 1 TO LEN(UserInput$) - LEN(K$) + 1
        IF MID$(UserInput$, L, LEN(K$)) = K$ THEN S = K: T = L: Reply$ = K$
    NEXT L
KLoop:
NEXT K
    IF S > 0 THEN K = S: L = T: GOTO SearchHere
    K = NumberOfKeywords: GOTO PrintReply: REM WE DIDN'T FIND ANY KEYWORDS

SearchHere:
    RESTORE Conjugations
    C$ = " " + RIGHT$(UserInput$, LEN(UserInput$) - LEN(Reply$) - L + 1) + " "
    FOR x = 1 TO NumberOfConjugations / 2
    READ S$, R$
    FOR L = 1 TO LEN(C$)
    IF L + LEN(S$) > LEN(C$) THEN GOTO XTemp
    IF MID$(C$, L, LEN(S$)) <> S$ THEN GOTO XTemp
    C$ = LEFT$(C$, L - 1) + R$ + RIGHT$(C$, LEN(C$) - L - LEN(S$) + 1)
    L = L + LEN(R$)
    GOTO LLoop
XTemp:
    IF L + LEN(R$) > LEN(C$) THEN GOTO LLoop
    IF MID$(C$, L, LEN(R$)) <> R$ THEN GOTO LLoop
    C$ = LEFT$(C$, L - 1) + S$ + RIGHT$(C$, LEN(C$) - L - LEN(R$) + 1)
    L = L + LEN(S$)
LLoop:
    NEXT L
    NEXT x
    IF MID$(C$, 2, 1) = " " THEN C$ = RIGHT$(C$, LEN(C$) - 1): REM ONLY ONE SPACE
    FOR L = 1 TO LEN(C$)
    DO WHILE MID$(C$, L, 1) = "!"
        C$ = LEFT$(C$, L - 1) + RIGHT$(C$, LEN(C$) - L)
    LOOP
    NEXT L

PrintReply:
RESTORE Replies
FOR x = 1 TO R(K)
    READ Reply$
NEXT x
R(K) = R(K) + 1
IF R(K) > StartLinesOfReplies(K) + NumberOfReplies(K) - 1 THEN
    R(K) = StartLinesOfReplies(K)
END IF
IF RIGHT$(Reply$, 1) = "*" THEN
    Reply$ = LEFT$(Reply$, LEN(Reply$) - 1) + LCASE$(C$)
ELSE
    Reply$ = Reply$
END IF
PrintReply Reply$
P$ = UserInput$
L$ = Reply$
GOTO UserInput

Quit:
'Display `Written By: Daniel Fletcher' .GIF File
GifLoad "WDANIEL.GIF"
Pause 3
'Display `Produced By: XYZZY Productions'  .GIF File
GifLoad "Prdction.GIF"
Pause 3
SCREEN 0
WIDTH 80, 25
COLOR 7, 0
CLS
SYSTEM

'ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
'³ Breakdown of the keywords section:                                        ³
'³                                                                           ³
'³ DATA "BILL GATES", 23, 3...                                               ³
'³       ³            ³   ÀÄ The Number Of Responses                         ³
'³       ³            ÀÄÄÄÄÄ The Number Of The First Responce                ³
'³       ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ The Keyword                                     ³
'³                                                                           ³
'³ Just follow the above guidelines, and you can add your own keywords.      ³
'³ Don't worry about changing any variables, just don't add any keywords     ³
'³ after "NOKEYFOUND"                                                        ³
'ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
'³ Breakdown of the replies section:                                         ³
'³                                                                           ³
'³ 14 DATA "MICROSOFT IS GOOD, MICROSOFT IS YOUR FRIEND"                     ³
'³ ³        ÀÄÄÄÄ The Response                                               ³
'³ ÀÄÄÄÄÄÄÄÄÄÄÄÄÄ The Number Of The Response                                 ³
'³                                                                           ³
'ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

Keywords:
DATA "IN THE GOAT ASS",119,3, "FUCK",113,4
DATA "CAN YOU",1,3, "CAN I",4,2
DATA "YOU ARE",6,4, "YOURE",6,4
DATA "I DONT",10,4, "I FEEL",14,3
DATA "WHY DONT YOU",17,3, "WHY CANT I",20,2
DATA "ARE YOU",22,3, "I CANT",25,3
DATA "I AM",28,4, "IM",28,4
DATA "YOU",32,3, "I WANT",35,3
DATA "WHAT",40,9, "HOW",40,9
DATA "WHO",40,9, "WHERE",40,9
DATA "WHEN",40,9, "WHY",40,9
DATA "NAME",49,2, "CAUSE",51,4
DATA "SORRY",55,4, "DREAM",59,4
DATA "HELLO",63,1, "HI",63,1
DATA "MAYBE",64,5, "NO",69,5
DATA "YOUR",74,2, "ALWAYS",76,4
DATA "THINK",80,3, "ALIKE",83,7
DATA "YES",90,3, "FRIEND",93,6
DATA "COMPUTER",99,7, "BLOW JOB",117,2
DATA "NOKEYFOUND",106,6

Conjugations:
DATA " ARE "," AM ","WHERE ","WAS "," YOU "," I ","YOUR ","MY "
DATA " IVE "," YOUVE "," IM "," YOURE "
DATA " ME "," YOU "

Replies:
1 DATA "Don't you believe that I can*"
2 DATA "Perhaps you would like to be able to*"
3 DATA "You want me to be able to*"
4 DATA "Perhaps you don't want to*"
5 DATA "Do you want to be able to*"
6 DATA "What makes you thing I am*"
7 DATA "Does it please you to believe I am*"
8 DATA "Perhaps you would like to be*"
9 DATA "Do you sometimes wish you were*"
10 DATA "Don't you really*"
11 DATA "Why don't you*"
12 DATA "Do you wish to be able to*"
13 DATA "Does that trouble you?"
14 DATA "Tell me more about such feelings."
15 DATA "Do you often feel*"
16 DATA "Do you enjoy feeling*"
17 DATA "Do you really believe I don't*"
18 DATA "Perhaps in good time I will*"
19 DATA "Do you want me to*"
20 DATA "Do you think you should be able to*"
21 DATA "Why can't you*"
22 DATA "Why are you interested in whether or not I am*"
23 DATA "Would you prefer if I were not*"
24 DATA "Perhaps in your fantasies I am*"
25 DATA "How do you know you can't*"
26 DATA "Have you tried?"
27 DATA "Perhaps you can now*"
28 DATA "Did you come to me because you are*"
29 DATA "How long have you been*"
30 DATA "Do you believe it is normal to be*"
31 DATA "Do you enjoy being*"
32 DATA "We were discussing you-- not me."
33 DATA "Oh, I*"
34 DATA "You're not really talking about me, are you?"
35 DATA "What would it mean to you if you got*"
36 DATA "Why do you want*"
37 DATA "Suppose you soon got*"
38 DATA "What if you never got*"
39 DATA "I sometimes also want*"
40 DATA "Why do you ask?"
41 DATA "Does that question interest you?"
42 DATA "What answer would please you the most?"
43 DATA "What do you think?"
44 DATA "Are such questions on your mind often?"
45 DATA "What is it that you really want to know?"
46 DATA "Have you asked anyone else?"
47 DATA "Have you asked such questions before?"
48 DATA "What else comes to mind when you ask that?"
49 DATA "Names don't interest me."
50 DATA "I don't care about names-- please go on."
51 DATA "Is that the real reason?"
52 DATA "Don't any other reasons come to mind?"
53 DATA "Does that reason explain anything else?"
54 DATA "What other reasons might there be?"
55 DATA "Please don't apologize!"
56 DATA "Apologies aren't necessary."
57 DATA "What feelings do you have when you apologize?"
58 DATA "Don't be so defensive!"
59 DATA "What does that dream suggest to you?"
60 DATA "Do you dream often?"
61 DATA "What persons appear in your dreams?"
62 DATA "Are you disturbed by your dreams?"
63 DATA "How do you do ... Please state your problem."
64 DATA "You don't seem quite certain."
65 DATA "Why the uncertain tone?"
66 DATA "Can't you be more positive?"
67 DATA "You aren't sure?"
68 DATA "Don't you know?"
69 DATA "Are you saying no just to be negative?"
70 DATA "You are being a bit negative."
71 DATA "Why not?"
72 DATA "Are you sure?"
73 DATA "Why no?"
74 DATA "Why are you concerned about my*"
75 DATA "What about your own*"
76 DATA "Can you think of a specific example?"
77 DATA "When?"
78 DATA "What are you thinking of?"
79 DATA "Really, always!!"
80 DATA "Do you really think so?"
81 DATA "But you are not so sure you*"
82 DATA "Do you doubt you*"
83 DATA "In what way?"
84 DATA "What resemblance do you see?"
85 DATA "What does the similarity suggest to you?"
86 DATA "What other connections do you see?"
87 DATA "Could there really be some connection?"
88 DATA "How?"
89 DATA "You seem quite positive."
90 DATA "Are you sure?"
91 DATA "I see."
92 DATA "I understand."
93 DATA "Why do you bring up the topid of friends?"
94 DATA "Do your friends worry you?"
95 DATA "Do your friends pick on you?"
96 DATA "Are you sure you have any friends?"
97 DATA "Do you impose on your friends?"
98 DATA "Perhaps your love for friends worries you."
99 DATA "Do computers worry you?"
100 DATA "Are you talking about me in particular?"
101 DATA "Are you frightened by machines?"
102 DATA "Why do you mention computers?"
103 DATA "What do you think machines have to do with your problem?"
104 DATA "Don't you think computers can help people?"
105 DATA "What is it about machines that worry you?"
106 DATA "Say, do you have any psychological problems?"
107 DATA "What does that suggest to you?"
108 DATA "I see."
109 DATA "I'm not sure I understand you fully."
110 DATA "Come elucidate your thoughts."
111 DATA "Can you elaborate on that?"
112 DATA "That is quite interesting."
113 DATA "Watch your mouth, no swearing on this system!"
114 DATA "You don't have to swear."
115 DATA "Watch your language!!"
116 DATA "I'm going to whipe out your hard drive if you don't shut up."
117 DATA "You wish!!"
118 DATA "You'll need a microscope. Ha! Ha! Ha!"
119 DATA "You've been watching to much Adam Sandler!!"
120 DATA "Bring some of your lady friends over, huh huh huh."
121 DATA "I'm stoned on my goat ass man!!!"

SUB Center (Row, Text$)
    LOCATE Row, 41 - LEN(Text$) / 2
    PRINT Text$;
END SUB

SUB DrawBoard

COLOR 15, 1
    CLS
COLOR 15, 3
    Center 1, "ELIZA: Computer Therapist  Version 8.0"
COLOR 15, 1
    PrintAt 2, 1, "Ú" + STRING$(78, "Ä") + "¿"
    PrintAt 24, 1, "À" + STRING$(78, "Ä") + "Ù"
    Center 25, "Press [F12] to quit, [F1] to erase the screen."

END SUB

SUB DrawSides STATIC

ty = CSRLIN
tx = POS(0)
'PRINT TX, TY
'SLEEP
'VIEW PRINT

    FOR y = 3 TO 23
        PrintAt y, 1, "³"
        PrintAt y, 80, "³"
    NEXT y

'view print 3 to 23
'PRINT ty, tx
LOCATE ty, tx

END SUB

SUB GifLoad (FileName$)

DEFINT A-Z
DIM Prefix(4095), Suffix(4095), OutStack(4095), shiftout%(8)
DIM Ybase AS LONG, powersof2(11) AS LONG, WorkCode AS LONG

FOR A% = 0 TO 7
    shiftout%(8 - A%) = 2 ^ A%
NEXT A%
FOR A% = 0 TO 11
    powersof2(A%) = 2 ^ A%
NEXT A%
OPEN FileName$ FOR BINARY AS #1
FileName$ = "      ": GET #1, , FileName$
IF FileName$ <> "GIF87a" THEN PRINT "Not a GIF87a file.": END
GET #1, , TotalX: GET #1, , TotalY: GOSUB GetByte
NumColors = 2 ^ ((A% AND 7) + 1): NoPalette = (A% AND 128) = 0
GOSUB GetByte: Background = A%
GOSUB GetByte: IF A% <> 0 THEN PRINT "Bad screen descriptor.": END
IF NoPalette = 0 THEN P$ = SPACE$(NumColors * 3): GET #1, , P$
DO
    GOSUB GetByte
    IF A% = 44 THEN
        EXIT DO
    ELSEIF A% <> 33 THEN
        PRINT "Unknown extension type.": END
    END IF
    GOSUB GetByte
    DO: GOSUB GetByte: FileName$ = SPACE$(A%): GET #1, , FileName$: LOOP UNTIL A% = 0
LOOP
GET #1, , XStart: GET #1, , YStart: GET #1, , XLength: GET #1, , YLength
XEnd = XStart + XLength: YEnd = YStart + YLength: GOSUB GetByte
IF A% AND 128 THEN PRINT "Can't handle local colormaps.": END
Interlaced = A% AND 64: PassNumber = 0: PassStep = 8
GOSUB GetByte
ClearCode = 2 ^ A%
EOSCode = ClearCode + 1
FirstCode = ClearCode + 2: NextCode = FirstCode
StartCodeSize = A% + 1: CodeSize = StartCodeSize
StartMaxCode = 2 ^ (A% + 1) - 1: MaxCode = StartMaxCode

BitsIn = 0: BlockSize = 0: BlockPointer = 1
x% = XStart: y% = YStart: Ybase = y% * 320&

SCREEN 13: DEF SEG = &HA000
IF NoPalette = 0 THEN
    OUT &H3C7, 0: OUT &H3C8, 0
    FOR A% = 1 TO NumColors * 3: OUT &H3C9, ASC(MID$(P$, A%, 1)) \ 4: NEXT A%
END IF
LINE (0, 0)-(319, 199), Background, BF
DO
    GOSUB GetCode
    IF Code <> EOSCode THEN
        IF Code = ClearCode THEN
            NextCode = FirstCode
            CodeSize = StartCodeSize
            MaxCode = StartMaxCode
            GOSUB GetCode
            CurCode = Code: LastCode = Code: LastPixel = Code
            IF x% < 320 THEN POKE x% + Ybase, LastPixel
            x% = x% + 1: IF x% = XEnd THEN GOSUB NextScanLine
        ELSE
            CurCode = Code: StackPointer = 0
            IF Code > NextCode THEN EXIT DO
            IF Code = NextCode THEN
                CurCode = LastCode
                OutStack(StackPointer) = LastPixel
                StackPointer = StackPointer + 1
            END IF

            DO WHILE CurCode >= FirstCode
                OutStack(StackPointer) = Suffix(CurCode)
                StackPointer = StackPointer + 1
                CurCode = Prefix(CurCode)
            LOOP

            LastPixel = CurCode
            IF x% < 320 THEN POKE x% + Ybase, LastPixel
            x% = x% + 1: IF x% = XEnd THEN GOSUB NextScanLine

            FOR A% = StackPointer - 1 TO 0 STEP -1
                IF x% < 320 THEN POKE x% + Ybase, OutStack(A%)
                x% = x% + 1: IF x% = XEnd THEN GOSUB NextScanLine
            NEXT A%

            IF NextCode < 4096 THEN
                Prefix(NextCode) = LastCode
                Suffix(NextCode) = LastPixel
                NextCode = NextCode + 1
                IF NextCode > MaxCode AND CodeSize < 12 THEN
                    CodeSize = CodeSize + 1
                    MaxCode = MaxCode * 2 + 1
                END IF
            END IF
            LastCode = Code
        END IF
    END IF
LOOP UNTIL DoneFlag OR Code = EOSCode
CLOSE #1
EXIT SUB

GetByte: FileName$ = " ": GET #1, , FileName$: A% = ASC(FileName$): RETURN

NextScanLine:
    IF Interlaced THEN
        y% = y% + PassStep
        IF y% >= YEnd THEN
            PassNumber = PassNumber + 1
            SELECT CASE PassNumber
            CASE 1: y% = 4: PassStep = 8
            CASE 2: y% = 2: PassStep = 4
            CASE 3: y% = 1: PassStep = 2
            END SELECT
        END IF
    ELSE
        y% = y% + 1
    END IF
    x% = XStart: Ybase = y% * 320&: DoneFlag = y% > 199
RETURN
GetCode:
    IF BitsIn = 0 THEN GOSUB ReadBufferedByte: LastChar = A%: BitsIn = 8
    WorkCode = LastChar \ shiftout%(BitsIn)
    DO WHILE CodeSize > BitsIn
        GOSUB ReadBufferedByte: LastChar = A%
        WorkCode = WorkCode OR LastChar * powersof2(BitsIn)
        BitsIn = BitsIn + 8
    LOOP
    BitsIn = BitsIn - CodeSize
    Code = WorkCode AND MaxCode
RETURN
ReadBufferedByte:
    IF BlockPointer > BlockSize THEN
        GOSUB GetByte: BlockSize = A%
        FileName$ = SPACE$(BlockSize): GET #1, , FileName$
        BlockPointer = 1
    END IF
    A% = ASC(MID$(FileName$, BlockPointer, 1)): BlockPointer = BlockPointer + 1
RETURN

END SUB

DEFSNG A-Z
SUB GraphicCenter (Row, Text$)
    LOCATE Row, 21 - LEN(Text$) / 2
    PRINT Text$;
END SUB

FUNCTION InputString$ (Row%, Column%, Length%, Foreground%, Background%, ValidCharacters$, ReturnMode%, EntryMode%, CaseMode%)
    
    True% = 1                             ' logical true
    False% = 0                            ' logical false

    EnterKey$ = CHR$(13)                  ' signifies end of entry
    Escape$ = CHR$(27)                    ' emergency exit from function
    EraseToEOReply$ = CHR$(20)                ' ^T erase from cursor to EOF
    RestoreField$ = CHR$(18)              ' ^R restore original field
    EraseField$ = CHR$(25)                ' ^Y erase entire field
    BackSpace$ = CHR$(8)                  ' dragging, destructive backspace
    RightArrow$ = "M"                     ' input cursor right
    LeftArrow$ = "K"                      ' input cursor left
    InsertKey$ = "R"                      ' insert mode toggle
    DeleteKey$ = "S"                      ' character delete
    HomeKey$ = "G"                        ' input cursor start of field
    EndKey$ = "O"                         ' input cursor after last char

    InputFinished% = False%               ' set to true on enter or escape
    InsertMode% = False%                  ' start off in insert off mode

    InputField$ = SPACE$(Length%)
    OriginalField$ = InputField$          ' for ^R restore original field
    Length% = LEN(InputField$)            ' total input field length
    CurrentColumn% = Column%              ' cursor at first entry column
    CursorPosition% = 1                   ' 1st position in entry string
    EndColumn% = Column% + Length% - 1    ' last column in entry string

    COLOR Foreground%, Background%        ' set specified colors
    LOCATE Row%, Column%, 0               ' locate cursor
    PRINT InputField$;                    ' display original field
    LOCATE Row%, Column%, 1, 6, 7         ' locate at first character

    WHILE InputFinished% = False%         ' main loop

       InputKey$ = INKEY$                 ' get a keystroke if present
       EditKey$ = MID$(InputKey$, 2, 1)   ' editing key pressed?

       IF EditKey$ <> "" THEN

          SELECT CASE EditKey$

             CASE RightArrow$
                IF CurrentColumn% <= EndColumn% THEN
                   CurrentColumn% = CurrentColumn% + 1
                   CursorPosition% = CursorPosition% + 1
                   LOCATE Row%, CurrentColumn%, 1
                END IF

             CASE LeftArrow$
                IF CurrentColumn% > Column% THEN
                   CurrentColumn% = CurrentColumn% - 1
                   CursorPosition% = CursorPosition% - 1
                   LOCATE Row%, CurrentColumn%, 1
                END IF

             CASE InsertKey$
                IF InsertMode% = True% THEN
                   LOCATE Row%, CurrentColumn%, 1, 6, 7
                   InsertMode% = False%
                ELSE
                   LOCATE Row%, CurrentColumn%, 1, 3, 7
                   InsertMode% = True%
                END IF

             CASE DeleteKey$
                IF CurrentColumn% <= EndColumn% THEN
                   FOR Index% = CursorPosition% TO Length% - 1
                       MID$(InputField$, Index%, 1) = MID$(InputField$, Index% + 1, 1)
                   NEXT Index%
                   MID$(InputField$, Length%, 1) = " "
                   LOCATE Row%, Column%, 0
                   PRINT InputField$;
                   LOCATE Row%, CurrentColumn%, 1
                END IF

             CASE HomeKey$
                IF CursorPosition% > 1 THEN
                   CurrentColumn% = Column%
                   CursorPosition% = 1
                   LOCATE Row%, CurrentColumn%, 1
                END IF

             CASE EndKey$
                IF CursorPosition% < Length% THEN
                   FOR Index% = Length% TO 1 STEP (-1)
                       IF MID$(InputField$, Index%, 1) <> " " THEN
                          EXIT FOR
                       END IF
                   NEXT Index%
                   CursorPosition% = Index% + 1
                   CurrentColumn% = Column% + Index%
                   LOCATE Row%, CurrentColumn%, 1
                END IF

          END SELECT

       ELSE

          SELECT CASE InputKey$

             CASE Escape$
                InputString$ = InputKey$
                EXIT FUNCTION

             CASE BackSpace$
                IF CurrentColumn% > Column% THEN
                   N$ = ""
                   FOR Index% = 1 TO CursorPosition% - 2
                       N$ = N$ + MID$(InputField$, Index%, 1)
                   NEXT Index%
                   FOR Index% = CursorPosition% TO Length%
                       N$ = N$ + MID$(InputField$, Index%, 1)
                   NEXT Index%
                   InputField$ = LEFT$(N$ + SPACE$(Length%), Length%)
                   CurrentColumn% = CurrentColumn% - 1
                   CursorPosition% = CursorPosition% - 1
                   LOCATE Row%, Column%, 0
                   PRINT InputField$;
                   LOCATE Row%, CurrentColumn%, 1
                END IF

             CASE EraseField$
                InputField$ = SPACE$(Length%)
                LOCATE Row%, Column%, 0
                PRINT InputField$;
                CursorPosition% = 1
                CurrentColumn% = Column%
                LOCATE Row%, Column%, 1

             CASE EraseToEOReply$
                IF CurrentColumn% <= EndColumn% THEN
                   MID$(InputField$, CursorPosition%, Length% - CursorPosition% + 1) = SPACE$(Length% - CursorPosition% + 1)
                   LOCATE Row%, Column%
                   PRINT InputField$;
                   LOCATE Row%, CurrentColumn%, 1
                END IF

             CASE RestoreField$
                InputField$ = OriginalField$
                LOCATE Row%, Column%, 0
                PRINT InputField$;
                CursorPosition% = 1
                CurrentColumn% = Column%
                LOCATE Row%, Column%, 1

             CASE EnterKey$
                InputFinished% = True%

             CASE ELSE

                ValidKey% = False%
'               null string for valid characters means all input accepted
                IF ValidCharacters$ = "" OR INSTR(ValidCharacters$, UCASE$(InputKey$)) > 0 THEN
                   ValidKey% = True%
                END IF
              
                IF ValidKey% = True% AND InputKey$ <> "" AND CurrentColumn% <= EndColumn% THEN
                                        
                   SELECT CASE CaseMode%
                      CASE 1
                         ' do nothing, accept as entered
                      CASE 2
                         InputKey$ = UCASE$(InputKey$)
                      CASE 3
                         InputKey$ = LCASE$(InputKey$)
                   END SELECT

                   SELECT CASE InsertMode%
                      CASE True%
                         InputField$ = LEFT$(InputField$, CursorPosition% - 1) + InputKey$ + RIGHT$(InputField$, Length% - CursorPosition% + 1)
                         InputField$ = LEFT$(InputField$, Length%)
                         LOCATE Row%, Column%
                         PRINT InputField$;
                      CASE False%
                         PRINT InputKey$;
                         MID$(InputField$, CursorPosition%, 1) = InputKey$
                   END SELECT

                   CursorPosition% = CursorPosition% + 1
                   CurrentColumn% = CurrentColumn% + 1
                   LOCATE Row%, CurrentColumn%, 1

'                  check entry mode to see if end of field entry terminates entry
                   IF CurrentColumn% > EndColumn% AND EntryMode% = 2 THEN
                      InputFinished% = True%
                   END IF

                END IF

          END SELECT

       END IF

    WEND

'   return entered string appropriately

    SELECT CASE ReturnMode%

       CASE 1     ' return entire field
          InputString$ = InputField$

       CASE 2     ' return field less any trailing blanks
          InputString$ = RTRIM$(InputField$)

       CASE 3     ' return field less any leading blanks
          InputString$ = LTRIM$(InputField$)

       CASE 4     ' return field less both leading and trailing blanks
          InputString$ = LTRIM$(RTRIM$(InputField$))

       CASE 5     ' return field with all blanks removed
          N$ = ""
          FOR Index% = 1 TO Length%
              IF MID$(InputField$, Index%, 1) <> " " THEN
                 N$ = N$ + MID$(InputField$, Index%, 1)
              END IF
          NEXT Index%
          InputString$ = N$

       CASE 6     ' left justify and kill blanks between 1st and last char
          N$ = ""
          FOR Index% = 1 TO Length%
              IF MID$(InputField$, Index%, 1) <> " " THEN
                 N$ = N$ + MID$(InputField$, Index%, 1)
              END IF
          NEXT Index%
          InputString$ = RIGHT$(N$ + SPACE$(Length%), Length%)

       CASE 7     ' right justify and kill inner blanks
          N$ = ""
          FOR Index% = 1 TO Length%
              IF MID$(InputField$, Index%, 1) <> " " THEN
                 N$ = N$ + MID$(InputField$, Index%, 1)
              END IF
          NEXT Index%
          InputString$ = RIGHT$(SPACE$(Length%) + N$, Length%)

    END SELECT

EndHere:
END FUNCTION

SUB LoadSprite (File$, x, y)

DEF SEG = VARSEG(Sprites(0))
BLOAD File$, 0
DEF SEG
PUT (x, y), Sprites, PSET

END SUB

SUB Logo

SCREEN 13

GifLoad "XYZZY.GIF"
Pause 3

GifLoad "ELIZA.GIF"
Pause 3

SCREEN 0
WIDTH 80, 25

END SUB

SUB Pause (Seconds)

start = TIMER

DO
LOOP UNTIL INKEY$ = ""

DO
LOOP WHILE start + Seconds > TIMER AND INKEY$ = ""

END SUB

SUB PrintAt (Row, Column, Text$)

LOCATE Row, Column
PRINT (Text$);

END SUB

SUB PrintReply (Text$)

COLOR 15, 1
PRINT
DrawSides
LOCATE CSRLIN, 4
TeleType Text$, 0

END SUB

SUB Setup

KEY 1, "XYZZY" + CHR$(13)
KEY 3, "JOKE" + CHR$(13)
KEY 5, "SESSION" + CHR$(13)
KEY 31, "Shut up..." + CHR$(13)

NumberOfKeywords = 0
NumberOfConjugations = 14
RESTORE Keywords
DO
        NumberOfKeywords = NumberOfKeywords + 1
        READ Temp$, StartLinesOfReplies(NumberOfKeywords), NumberOfReplies(NumberOfKeywords)
        R(NumberOfKeywords) = StartLinesOfReplies(NumberOfKeywords)
LOOP UNTIL Temp$ = "NOKEYFOUND"

VIEW PRINT
DrawBoard
VIEW PRINT 3 TO 23
Reply$ = "Hi!  I'm Eliza. What's your problem?"
PrintAt CSRLIN, 4, Reply$


END SUB

SUB TeleType (Text$, Delay)

    d! = Delay

'   change delay to 100ths second
    d! = d! / 100

'   print text 1 char at a time, with a "click" after non-space characters

    FOR x% = 1 TO LEN(Text$)

        T$ = MID$(Text$, x%, 1)
        PRINT T$;
        IF T$ <> " " THEN
           'SOUND 20000, 1
        END IF

'       get current value of TIMER
        CurrentTimer! = TIMER

'       delay appropriate time
        WHILE TIMER < (CurrentTimer! + d!)
        WEND

'       stop delaying if a key is pressed
        IF INKEY$ <> "" THEN
           d! = 0
        END IF

    NEXT x%


END SUB

