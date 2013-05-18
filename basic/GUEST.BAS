DECLARE SUB colour (a%, b%, c%, d%)
CLS
SCREEN 13
DEFINT A-Z
FOR i = 0 TO 63 'Palette
  colour i, 64 - i, 64 - i, 64 - i
  colour 64 + i, i, 0, 64 - i
  colour i + 128, 63, i, 0
NEXT
r = 1
c = 1
i = 65
s$ = "Please enter comments and your name here"
FOR k = 1 TO LEN(s$)
LOCATE r, c
COLOR i
PRINT MID$(s$, k, 1)
PLAY "p64"
i = i + 1
c = c + 1
NEXT k

r = 3
c = 5
s$ = "I would appreciate it very much."
FOR k = 1 TO LEN(s$)
LOCATE r, c
COLOR i
PRINT MID$(s$, k, 1)
PLAY "p64"
i = i + 1
c = c + 1
NEXT k

FOR i = 64 TO 191 STEP 1
LINE (x, 35)-(x, 45), i
x = x + 1
NEXT i
FOR i = 64 TO 191 STEP 1
LINE (x, 35)-(x, 45), i
x = x + 1
NEXT i
FOR i = 64 TO 191 STEP 1
LINE (x, 35)-(x, 45), i
x = x + 1
NEXT i

'FOR i = 0 TO 63 'Palette
'  colour i, 64 - i, 64 - i, 64 - i'grau
'  colour 64 + i, i + 64, 0, 0'rot
'  colour i + 128, 63, i, i'rot-orange
'NEXT

r = 10
c = 1
n$ = "One  word of  caution though. Qbasic forsome   obscure  reason  doesn't   acceptcommas in your text. If  you  use   themit gives an error. I   haven't   figuredhow to get around it....I'm thinking....Anyway, I hope you enjoyed  my  programsand found them entertaining. Thank   youVery Much - Vivin"
i = 65
FOR k = 1 TO LEN(n$)
LOCATE r, c
COLOR i
PRINT MID$(n$, k, 1)
PLAY "p64"
IF reverse = 1 THEN i = i - 1 ELSE i = i + 1
c = c + 1
IF i > 114 THEN reverse = 1
IF i < 66 THEN reverse = 0
IF c > 40 THEN r = r + 1: c = 1
NEXT k

DO
LOOP WHILE INKEY$ = ""
CLS
SCREEN 9
SCREEN 0
INPUT "Comments:", c$
INPUT "Enter your name:", n$
d = 0
FOR z = 1 TO LEN(n$)
x$ = x$ + MID$(n$, z, 1)
IF x$ = " " THEN GOTO 23
d = d + 1
IF d = 8 THEN GOTO 23
NEXT z
23 '
OPEN x$ FOR OUTPUT AS #1
PRINT #1, n$
PRINT #1, c$
CheckEvent:
a$ = INKEY$

IF a$ = "r" OR a$ = "R" THEN GOTO ReadCommentz
IF a$ = "x" OR a$ = "X" THEN GOTO Quit ELSE GOTO CheckEvent
Quit:
CLOSE
CHAIN "projload.bas"
ReadCommentz:
SHELL "dir *. /p/w/od"
CLOSE
INPUT "Enter file name:", filen$
IF filen$ = "x" OR filen$ = "X" THEN GOTO EndIt
OPEN filen$ FOR INPUT AS #1
INPUT #1, name$
INPUT #1, comment$
CLS
PRINT name$; " has written:"
PRINT comment$
CLOSE
CheckEventz:
a$ = INKEY$

IF a$ = "r" OR a$ = "R" THEN GOTO ReadCommentz
IF a$ = "x" OR a$ = "X" THEN GOTO EndIt ELSE GOTO CheckEventz

DO
LOOP WHILE INKEY$ = ""
EndIt:
CHAIN "projload.bas"

SUB colour (a, b, c, d)
OUT &H3C8, a
OUT &H3C9, b
OUT &H3C9, c
OUT &H3C9, d
END SUB

