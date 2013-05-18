'***
'Fire!!  By Tony Lieuallen.  E-mail: marvin@mars.superlink.net
'This is a demo I made (Evolved slowly from the file in the PC Games
'Programmers Encyclopedia) in my free time.  In the rem's is what you
'would have to do to make it run in PB (originally written for QuickBasic).
'I like values of XMax=200 YMax=100 X and YStart=50.

DEFINT A-Z

SCREEN 13
' in PB make this:
'      (or is that ah?)
'! mov ax, &H13
'! int &H10

RANDOMIZE TIMER
IF COMMAND$ <> "" THEN
   T$ = COMMAND$
   XMax = VAL(LEFT$(T$, INSTR(T$, " ")))
   T$ = RIGHT$(T$, LEN(T$) - INSTR(T$, " "))
  
   YMax = VAL(LEFT$(T$, INSTR(T$, " ")))
   T$ = RIGHT$(T$, LEN(T$) - INSTR(T$, " "))
  
   XStart = VAL(LEFT$(T$, INSTR(T$, " ")))
   T$ = RIGHT$(T$, LEN(T$) - INSTR(T$, " "))
  
   YStart = VAL(T$)
ELSE
   INPUT "  XMax=", XMax
   INPUT "  YMax=", YMax
   INPUT "XStart=", XStart
   INPUT "YStart=", YStart
END IF
CLS

CMax = 150
Red = 0
Grn = 0
Blu = 0
CC = 1

FOR X = 1 TO CMax
   SELECT CASE CC
      CASE 1
         Red = Red + 1
         IF Red = 60 THEN CC = 2
      CASE 2
         Grn = Grn + 1
         IF Grn = 60 THEN CC = 3
      CASE 3
         Grn = Grn - 2
         Red = Red - 1
   END SELECT
   OUT &H3C8, X
   OUT &H3C9, Red
   OUT &H3C9, Grn
   OUT &H3C9, Blu
NEXT

DEF SEG = &HA000
DO
   IF INKEY$ <> "" THEN
      COLOR 180
      SYSTEM
   END IF
   FOR Count = 1 TO XMax \ 1.5
      Y& = (YMax - 1 + YStart)
      'In PB make all the "poke"s "pokeb"s
      POKE (320 * Y& + (INT(RND * XMax) + XStart)), INT(RND * CMax)
      POKE (320 * (Y& - 1) + (INT(RND * XMax) + XStart)), INT(RND * CMax)
   NEXT

   P = 0
   FOR Y1 = 2 TO YMax - 1
      FOR X1 = 2 TO XMax - 1
         X& = (X1 + XStart)
         Y& = (Y1 + YStart)
         P = PEEK(320 * Y& + (X& + 1))
         P = P + PEEK(320 * Y& + (X& - 1))
         P = P + PEEK(320 * (Y& + 1) + X&)
         P = P + PEEK(320 * (Y& - 1) + X&)
         P = P \ 4
         POKE (320 * (Y& - 1) + X&), P
      NEXT
   NEXT
LOOP

