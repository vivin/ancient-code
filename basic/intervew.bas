rd: Story$ = ""
REM                Interview
REM    Written By Erik Benerdal and Pete Holiday
BEGIN: CLS
COLOR 10, 0
INPUT "Tape? [y/n] : ", tape$
IF tape$ = "y" THEN INPUT "Name: ", Name$
INPUT "Who do you want to interview? :", Person$
IF tape$ = "y" THEN INPUT "Enter a nickname (Max 6 letters!): ", Nick$
CLS
PRINT "OK you got "; Person$; " in you office!"
PRINT "Now you can ask him/her questions. Just don't be rude!"
PRINT
PRINT "HERES THE INSTRUCTIONS."
PRINT ""
PRINT ""
PRINT "1st, Ask "; Person$; " a question (Yes Or No please)"
PRINT "2nd, Read the answer he/she gave you!"
PRINT "    (hard huh!)"
OOP: x$ = INKEY$
IF x$ = "" THEN GOTO OOP
CLS
LOO:
GOSUB ANNOY:
GOTO quit

ANNOY:
GOSUB Zimbabalu:
GOTO quit

Zimbabalu:
COLOR 10, 0
PRINT "Ask "; Person$; " any yes or no question";
COLOR 7, 0
Story$ = Story$ + Name$ + ":"
INPUT ZIM$
IF ZIM$ = "End" THEN GOTO quit
Story$ = Story$ + ZIM$ + "? "
COLOR 14, 0
PRINT ""
PRINT ""
GOTO choices
again: COLOR 10, 0
PRINT "PLAY AGAIN";
INPUT AGN$
IF AGN$ = "NO" THEN GOTO quit
IF AGN$ = "N" THEN GOTO quit
IF AGN$ = "n" THEN GOTO quit
IF AGN$ = "no" THEN GOTO quit ELSE GOTO Zimbabalu
RETURN
GOTO quit: GOTO quit
GOTO quit

choices:
CLS
RANDOMIZE TIMER
YORN = INT(RND * 14 + 1)
PRINT Person$; " Replies..."
IF YORN = 1 THEN GOTO One
IF YORN = 2 THEN GOTO Two
IF YORN = 3 THEN GOTO Three
IF YORN = 4 THEN GOTO Four
IF YORN = 5 THEN GOTO Five
IF YORN = 6 THEN GOTO Six
IF YORN = 7 THEN GOTO Seven
IF YORN = 8 THEN GOTO Eight
IF YORN = 9 THEN GOTO Nine
IF YORN = 10 THEN GOTO Ten
IF YORN = 11 THEN GOTO Eleven
IF YORN = 12 THEN GOTO Twelve
IF YORN = 13 THEN GOTO Thirteen
IF YORN = 14 THEN GOTO Fourteen
RETURN
GOTO quit
One:
COLOR 15, 0
Story$ = Story$ + Nick$ + ":"
PRINT "Absoulutly!"
Story$ = Story$ + "Absolutly!  "
GOSUB again:
GOTO quit

Two:
COLOR 4, 0
Story$ = Story$ + Nick$ + ":"
PRINT "No Way!"
Story$ = Story$ + "No way!  "
GOSUB again:

Three:
COLOR 2, 0
Story$ = Story$ + Nick$ + ":"
PRINT "Maybe."
Story$ = Story$ + "Maybe.  "
GOSUB again:

Four:
COLOR 15, 0
Story$ = Story$ + Nick$ + ":"
PRINT "Probably so."
Story$ = Story$ + "Probably so.  "
GOSUB again:

Five:
COLOR 4, 0
Story$ = Story$ + Nick$ + ":"
PRINT "Probably Not."
Story$ = Story$ + "Probably Not.  "
GOSUB again:

Six:
COLOR 3, 0
Story$ = Story$ + Nick$ + ":"
PRINT "Ask Again."
Story$ = Story$ + "Ask Again  "
GOSUB Zimbabalu:

Seven:
COLOR 3, 0
Story$ = Story$ + Nick$ + ":"
PRINT "Good Bye"
Story$ = Story$ + "Good Bye  "
LOOP12: ABCD$ = INKEY$
IF ABCD$ = "" THEN GOTO LOOP12
GOTO quit

Eight:
COLOR 14, 4
Story$ = Story$ + Nick$ + ":"
PRINT "How Rude To Ask Me That!"
Story$ = Story$ + "How Rude To Ask Me That!  "
GOSUB again:

Nine:
COLOR 5, 0
Story$ = Story$ + Nick$ + ":"
PRINT "How Should I Know?"
Story$ = Story$ + "How Should I Know?  "
GOSUB again:

Ten:
COLOR 5, 0
Story$ = Story$ + Nick$ + ":"
PRINT "Go ask your mom (Or Legal guardian)"
Story$ = Story$ + "Go ask your mom (Or Legal guardian)  "
GOSUB again:

Eleven:
COLOR 15, 0
Story$ = Story$ + Nick$ + ":"
PRINT "Yes."
Story$ = Story$ + "Yes  "
GOSUB again:

Twelve:
COLOR 4, 0
Story$ = Story$ + Nick$ + ":"
PRINT "No."
Story$ = Story$ + "No  "
GOSUB again:

Thirteen:
COLOR 3, 0
Story$ = Story$ + Nick$ + ":"
PRINT "Ask Later."
Story$ = Story$ + "Ask Later.  "
GOSUB again:

Fourteen:
COLOR 14, 4
Story$ = Story$ + Nick$ + ":"
PRINT "I HAVE NO TIME TO ANSWER YOUR MEASLY QUESTIONS!"
Story$ = Story$ + "I HAVE NO TIME TO ANSWER YOUR MEASKY QUESTIONS!  "
Loop99: ASD$ = INKEY$
IF ASD$ = "" THEN GOTO Loop99
GOSUB again:

PROGREQ:
CLS
COLOR 9, 0
PRINT "Here's How It Works:"
PRINT "1st. You Send Me your request. (Be Very Specific) at the address below"
PRINT "2nd. I make your program. (As Close to your Idea as possible)"
PRINT "3rd. I send you the program. (Will only work for a 37 day trial period)"
PRINT "     Along with the Program You will Recieve a Bill."
PRINT "4th. After your trial period expires you have a choice:"
PRINT "        Pay For it and Recieve the Version that works (Without a limit"
PRINT "            of time for useage) and a warranty (I will decide) of no"
PRINT "            less than One Year"
COLOR 4, 0
PRINT "                            OR"
COLOR 9, 0
PRINT "        Dont Pay for it and Refile a new order with more specifics"
PRINT ""
PRINT ""
COLOR 10, 0
PRINT "Address Below:"
PRINT "407 N. Elm"
PRINT "Lexington, IL 61753"
COLOR 4, 0
PRINT "    OR"
COLOR 10, 0
PRINT "E-Mail"
PRINT "71604,254"

GOSUB Zimbabalu:

quit:
COLOR 10!
IF tape$ = "y" THEN
INPUT "Play up tape? [y/n] :", playtape$
IF playtape$ = "n" THEN END
speed:
PRINT "Speed:"
PRINT "1. Slow"
PRINT "2. Normal"
PRINT "3. Fast"
INPUT "", sp
IF sp < 1 OR sp > 3 THEN GOTO speed
CLS
COLOR 14!
PRINT "PLAYING     ";
COLOR 30!
PRINT ""
COLOR 10!
PRINT "Interview Between "; Name$; " and "; Person$
Start$ = "Interview Between " + Name$ + " and " + Person$
FOR i = 1 TO LEN(Story$)
PRINT MID$(Story$, i, 1);
IF sp = 1 THEN PLAY "p15"
IF sp = 2 THEN PLAY "p30"
IF sp = 3 THEN PLAY "p60"
NEXT i
PRINT "'klick'"
END IF
IF tape$ = "y" THEN
INPUT "Save Tape?  [Y/N]:", v$
    IF v$ = "Y" OR v$ = "y" THEN
    INPUT "Tapes Name (Max 8 letters!) :", fil$
    fil$ = fil$ + ".tap"
    OPEN fil$ FOR OUTPUT AS #1
        WRITE #1, Story$, Start$
        CLOSE #1
PRINT "Tape Saved!"
INPUT "", x$
    END IF
END IF
INPUT "Run Tape recorder? ", s$
IF s$ = "y" OR s$ = "Y" THEN CHAIN "tapeplay"
END

