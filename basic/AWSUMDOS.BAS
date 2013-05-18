CLS

COLOR 3, 1
CLS
FOR i = 8 TO 16
FOR j = 19 TO 61
COLOR 1, 3
LOCATE i, j
PRINT " "
NEXT j
NEXT i

FOR i = 21 TO 62
LOCATE 17, i
COLOR 0, 0
PRINT " "
NEXT i

FOR j = 9 TO 16
LOCATE j, 62
COLOR 0, 0
PRINT " "
NEXT j

FOR k = 9 TO 17
LOCATE k, 63
COLOR 0, 0
PRINT " "
NEXT k

COLOR 1, 3
LOCATE 9, 29
PRINT "Awesome Dos! Version 1.1"
LOCATE 11, 24
PRINT "Developed By Vivin Suresh Paliath"
LOCATE 13, 20
PRINT "Copyright (C) Vivin Corporations 1997 -->"
LOCATE 15, 31
PRINT "All rights Reserved"
DO WHILE INKEY$ = ""
LOOP

CLS

COLOR 7, 0, 0
CLS
SCREEN 0
0 LOCATE 1, 1
Start:              'Here's where we start
1 INPUT "C:\>", d$
cmd$ = ""
c$ = LCASE$(d$)
FOR i = 1 TO LEN(c$)
IF MID$(c$, i, 1) = " " THEN GOTO Done ELSE cmd$ = cmd$ + MID$(c$, i, 1)
NEXT i

Done:
IF cmd$ = "" THEN GOTO Start
IF cmd$ = "dir" THEN GOTO Dir
IF cmd$ = "cls" THEN GOTO ClrScrn
IF cmd$ = "del" THEN GOTO DeleteX
IF cmd$ = "format" THEN GOTO Format
IF cmd$ = "cd" THEN GOTO CDs
IF cmd$ = "move" THEN GOTO MoveIt
IF cmd$ = "quit" OR c$ = "exit" OR c$ = "bye" THEN GOTO NeverLeave
IF cmd$ = "help" THEN GOTO Whine
IF cmd$ = "append" THEN GOTO WhatHappened
IF cmd$ = "attrib" THEN GOTO AttribX
IF cmd$ = "break" THEN GOTO Trouble
IF cmd$ = "buffers" THEN GOTO Buff
IF cmd$ = "call" THEN GOTO HeyYou
IF cmd$ = "chkdsk" THEN GOTO Sucks
IF cmd$ = "choice" THEN GOTO HaveNo
IF cmd$ = "command" THEN GOTO Fetch
IF cmd$ = "copy" THEN GOTO Cheating
IF cmd$ = "country" THEN GOTO USASC
IF cmd$ = "date" THEN GOTO Y2K
IF cmd$ = "debug" THEN GOTO Bugspray
IF cmd$ = "defrag" THEN GOTO Defrag
IF cmd$ = "device" THEN GOTO Device
IF cmd$ = "deltree" THEN GOTO Trees
IF cmd$ = "echo" THEN GOTO Hello
IF cmd$ = "erase" THEN GOTO Eraser
IF cmd$ = "expand" THEN GOTO NoSpace
IF cmd$ = "md" THEN GOTO Aspirin
IF cmd$ = "mem" THEN GOTO NoMem
IF cmd$ = "more" THEN GOTO Satisfy
IF cmd$ = "path" THEN GOTO LeftRight
IF cmd$ = "pause" THEN GOTO HoldOn
IF cmd$ = "power" THEN GOTO Powerful
IF cmd$ = "rd" THEN GOTO RDRR
IF cmd$ = "run" THEN GOTO Jog
IF cmd$ = "rename" THEN GOTO Oldname
IF cmd$ = "scandisk" THEN GOTO Sucks
IF cmd$ = "share" THEN GOTO Greedy
IF cmd$ = "time" THEN GOTO SleepNow
IF cmd$ = "undelete" THEN GOTO GoneForeverF
IF cmd$ = "unformat" THEN GOTO GoneForeverD
IF cmd$ = "youaremybestfriend" THEN GOTO QuitIt ELSE PRINT "Say what?": PRINT "": GOTO Start

GoneForeverF:
PRINT "I won't! Hahaha! Your files are gone for ever!!"
GOTO 1

GoneForeverD:
PRINT "I won't! Kiss your disk goodbye!!"
GOTO 1

SleepNow:
PRINT "Will you look at the time! I have to sleep!"
GOTO 1

Greedy:
PRINT "I won't!"
GOTO 1

Sucks:
PRINT "Check your disk, and scan it?"
PRINT "Hold on..."
FOR i = 1 TO 1000000000
NEXT i
PRINT "The Verdict: It sucks.... Absolutely..."
GOTO 1

Oldname:
PRINT "I like the old name better."
GOTO 1

Jog:
PRINT "Run! Run! I love excercise!"
GOTO 1

RDRR:
PRINT "RDRR... Don't you get it? Har dee Har Har!"
GOTO 1

Powerful:
PRINT "wow... I feel powerful..."
GOTO 1

HoldOn:
PRINT "Can't wait for ya!"
GOTO 1

LeftRight:
PRINT "Keep going  till  you  see the hardisk, take the first left. Keep going till yousee a RAM chip then take the left and then..."
GOTO 1

Satisfy:
PRINT "Be satisfied with what you've got!"
GOTO 1

NoMem:
PRINT "You're computer has more memory than you...much..MUCH more."
GOTO 1

Aspirin:
PRINT "I ain't no doc."
GOTO 1

NoSpace:
PRINT "EXPAND??!! I'm squeezed as it is!!!"
GOTO 1

Eraser:
PRINT "Go call Arnold Schwarznegger."
GOTO 1

Hello:
PRINT "Helloooooo...Hellooooo...Helloooo...Hellooo...Helloo...Hello..."
GOTO 1

Trees:
PRINT "DELETE  A  TREE?! Do you know how  many acres of forest are being destroyed eachday?"
GOTO 1

Device:
PRINT "This here little device, better known as a thingamajig, helps a computer destroyany user which bugs it...*Hint*"
GOTO 1

Defrag:
PRINT "Your disk is SO fragmented, it would serve as a million piece jigsaw puzzle."
GOTO 1

Bugspray:
PRINT "Get me the Bugspray and I'll kill 'em. You'll have to clean 'em up though."
GOTO 1

Y2K:
PRINT "The date is 1/1/ñöþýüÈþýö"; CHR$(0)
PRINT "Ack! I've got the Y2K problem... the millenium bug..."
GOTO 1

USASC:
PRINT "I'm from the US. What about you?"
GOTO 1

Cheating:
PRINT "Copy?! That's cheating!"
GOTO 1

Fetch:
PRINT "Fetch!"
GOTO 1

HaveNo:
PRINT "You have none."
GOTO 1

HeyYou:
PRINT "HEY YOU! Come here!"
GOTO 1

Buff:
PRINT "Buffers? What buffers?"
GOTO 1

Trouble:
PRINT "No way! I'm not gonna break anything. I don't wanna get into trouble!"
GOTO 1

AttribX:
PRINT "Attrib...Attrib...Hmm...Now where have I heard that?"
GOTO 1

WhatHappened:
PRINT "APPEND? What 'appen'd?"
GOTO 1

Dir:
PRINT ""
PRINT "Volume in Drive C is MAXIMUM"
PRINT "Volume Serial Number is 0000-00XX"
PRINT "Directory of C:\"
PRINT ""
PRINT "...contains nothing..."
PRINT "                      838,232,322,233 bytes"
PRINT "                -123,534,432,124 bytes free"
GOTO Start

ClrScrn:
FOR i = 1 TO 22
FOR k = 1 TO 80
LOCATE i, k
PRINT CHR$(250)
LOCATE 10, 10
COLOR 1
PRINT CHR$(2)
COLOR 2
LOCATE 20, 4
PRINT CHR$(1)
COLOR 3
LOCATE 16, 32
PRINT CHR$(1)
COLOR 4
LOCATE 5, 20
PRINT CHR$(1)
COLOR 5
LOCATE 8, 60
PRINT CHR$(1)
COLOR 6
LOCATE 11, 70
PRINT CHR$(1)
COLOR 7
LOCATE 16, 32
PRINT CHR$(1)
COLOR 8
LOCATE 18, 12
PRINT CHR$(1)
COLOR 15
LOCATE 12, 23
PRINT "Let's play Pac-Man!!!!"
COLOR 7
NEXT k
NEXT i
GOTO 0

DeleteX:
PRINT "Deleting..."
PRINT "Uh-oh... Are you sure you told me to delete ONLY the files you told me to or ALLthe ones on the disk?"
GOTO 1

Format:
PRINT "Ok, Drive C is completely formatted."
GOTO 1

CDs:
PRINT "Lemme see... I've got Game CDs, Music CDs...."
GOTO 1

MoveIt:
PRINT "I don't do housework!"
GOTO 1

NeverLeave:
PRINT "Ha! Ha! You can never leave!"
PRINT "Besides I'm having too much fun torturing you!"
GOTO 1

Whine:
PRINT "Ok your whining's got to me. I'll quit if you type "; CHR$(34); "Youaremybestfriend"; CHR$(34)
GOTO 1

QuitIt:
PRINT "What?! No way I'm gonna be YOUR friend!"
PRINT "Just joking...Actually you're not that bad..."
PRINT "Press the "; CHR$(5); " key."
INPUT " ", k$
CLS
PRINT "Hahahaha!!! ;)"
INPUT " ", a$




