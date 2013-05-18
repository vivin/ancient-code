

'Here's a file that allows you to see the transition of two chosen
'colors. I'd have to say it's kinda cool. I made the whole thing myself.
'I'm thinking of coming out with Gradient 2.1, with more options. Maybe
'even one with SVGA graphics(First I need a SVGA Monitor!) Oh well,
'enjoy!
'Kunal arya
'arya@apc.net
' Gradient.bas
' version 1.1
' by: Kunal Arya
DECLARE SUB ClearPal (t1!, t2!)
DECLARE SUB MakeGrad (c!, r!, curr!, steps!, rr1!, gg1!, bb1!, rr2!, gg2!, bb2!, stay)
DECLARE SUB GetType ()
DECLARE SUB GetPal (ix!, place)
DECLARE SUB MakePal (spot, r!, g!, b!)
COMMON SHARED current
'ON ERROR GOTO endprog
DIM SHARED r1, g1, b1, r2, g2, b2, typ
DIM Gradi(960)

CLS
SCREEN 13

MakePal 253, 0, 0, 0
                      
COLOR 253
PRINT "Gradient.bas"
ClearPal 100, 170
FOR coloritc = 0 TO 43
 FOR coloritr = 0 TO 10
  IF POINT(coloritc, coloritr) THEN PSET (coloritc, coloritr), coloritc + 117
 NEXT
NEXT
MakePal 252, 0, 25, 63
colorit = 163
FOR coloritc = 43 TO 95
 colorit = colorit - 1
 FOR coloritr = 0 TO 10
  IF POINT(coloritc, coloritr) THEN PSET (coloritc, coloritr), colorit
 NEXT
NEXT
MakeGrad 1, 210, 100, 1, 0, 0, 63, 63, 63, 63, 0
GET (0, 0)-(95, 10), Gradi
COLOR 252
PRINT
PRINT "Please Pick the First Color:"
PRINT
GetPal 1, 253
COLOR 252
LOCATE 3, 1: PRINT "Please Pick the Second Color:"
LINE (130, 50)-(190, 170), 0, BF
GetPal 2, 253
CLS
PUT (0, 0), Gradi
LOCATE 3, 1
COLOR 252
PRINT "Please choose the type:"
PRINT
PRINT "1) Left to Right"
PRINT "2) Top to Bottom"
PRINT "3) Circular"
PRINT "4) Rectangular"
PRINT
PRINT "Enter a number: ";
COLOR 251
PRINT "_"
j = 1
DO
IF j = 1 THEN BF = BF + 2
IF j = 2 THEN BF = BF - 2
IF BF >= 60 THEN j = 2
IF BF <= 3 THEN j = 1
MakePal 251, 0, 0, BF
I$ = INKEY$
IF VAL(I$) > 0 AND VAL(I$) < 5 THEN typ = VAL(I$): EXIT DO
LOOP
CLS
MakeGrad 1, 1, 16, 1, r1, g1, b1, r2, g2, b2, 0


current = current - 16
CLS
PutPal = 16
IF typ = 1 THEN
 FOR Putpalsc = 1 TO 320 STEP (320 / current)
  LINE (Putpalsc, 1)-(Putpalsc + (320 / current), 200), PutPal, BF
  PutPal = PutPal + 1
 NEXT
ELSEIF typ = 2 THEN
 FOR Putpalsc = 1 TO 200 STEP (200 / current)
  LINE (1, Putpalsc)-(320, Putpalsc + (320 / current)), PutPal, BF
  PutPal = PutPal + 1
 NEXT
ELSEIF typ = 3 THEN
 Putpalsc = 200
  DO WHILE Putpalsc > 2
   CIRCLE (160, 100), Putpalsc, PutPal
   PAINT (160, 100), PutPal
   PutPal = PutPal + 1
   Putpalsc = Putpalsc - (200 / current)
  LOOP
ELSEIF typ = 4 THEN
   PutR1 = 1
   PutR2 = 200
   PutC1 = 1
   PutC2 = 320
   DO WHILE PutPal <> current + 16
   cpix = (320 / current / 2)
   rpix = (200 / current / 2)
   PutC1 = PutC1 + cpix: PutC2 = PutC2 - cpix
   PutR1 = PutR1 + rpix: PutR2 = PutR2 - rpix
   LINE (PutC1, PutR1)-(PutC2, PutR2), PutPal, BF
   PutPal = PutPal + 1
   LOOP
END IF

j$ = INPUT$(1)

CLS
SCREEN 0
WIDTH 80
COLOR 15, 0
PRINT "This program was wholey made by me, Kunal Arya. Use freely. Please put"
PRINT "my name in whatever you use. Thank you! :ù)"

END
endprog:
MakePal 15, 63, 63, 63
COLOR 15
PRINT "Overload of data!"
END

SUB ClearPal (t1, t2)
FOR ClrP = t1 TO t2
 MakePal ClrP, 0, 0, 0
NEXT
END SUB

SUB GetPal (ix, place)
   rr = 1: gg = 1: bb = 1
   MakePal place, rr, gg, bb
   sele = 1
   arrow$ = "c15g4e4d10u10f4"
   DO
      LINE (150, 50)-(170, 60), 15, B
      LINE (151, 51)-(169, 59), place, BF
      LINE (140, 70)-(141, 132), 12, BF
      LINE (160, 70)-(161, 132), 10, BF
      LINE (180, 70)-(181, 132), 9, BF
      LINE (142, 70 + (63 - rr))-(144, 70 + (63 - rr)), 15
      LINE (162, 70 + (63 - gg))-(164, 70 + (63 - gg)), 15
      LINE (182, 70 + (63 - bb))-(184, 70 + (63 - bb)), 15
      IF sele = 1 THEN PSET (141, 140), 15: DRAW arrow$
      IF sele = 2 THEN PSET (161, 140), 15: DRAW arrow$
      IF sele = 3 THEN PSET (181, 140), 15: DRAW arrow$
      I$ = INKEY$
      SELECT CASE I$
      CASE CHR$(27): END
      CASE CHR$(0) + "M"
         IF sele = 1 THEN LINE (130, 139)-(145, 155), 0, BF
         IF sele = 2 THEN LINE (150, 139)-(165, 155), 0, BF
         IF sele = 3 THEN LINE (170, 139)-(185, 155), 0, BF
         sele = sele + 1
         IF sele > 3 THEN sele = 1
      CASE CHR$(0) + "K"
         IF sele = 1 THEN LINE (130, 139)-(145, 155), 0, BF
         IF sele = 2 THEN LINE (150, 139)-(165, 155), 0, BF
         IF sele = 3 THEN LINE (170, 139)-(185, 155), 0, BF
         sele = sele - 1
         IF sele < 1 THEN sele = 3
      CASE CHR$(0) + "H"
         GOSUB Cll
         IF sele = 1 THEN rr = rr + 1: IF rr > 63 THEN rr = 63
         IF sele = 2 THEN gg = gg + 1: IF gg > 63 THEN gg = 63
         IF sele = 3 THEN bb = bb + 1: IF bb > 63 THEN bb = 63
         MakePal place, rr, gg, bb
      CASE CHR$(0) + "P"
         GOSUB Cll
         IF sele = 1 THEN rr = rr - 1: IF rr < 1 THEN rr = 1
         IF sele = 2 THEN gg = gg - 1: IF gg < 1 THEN gg = 1
         IF sele = 3 THEN bb = bb - 1: IF bb < 1 THEN bb = 1
         MakePal place, rr, gg, bb
      CASE CHR$(13), CHR$(32)
         EXIT DO
      END SELECT
   LOOP
   IF ix = 1 THEN
      r1 = rr: g1 = gg: b1 = bb
   END IF
   IF ix = 2 THEN
      r2 = rr: g2 = gg: b2 = bb
   END IF
   EXIT SUB
Cll:
   IF sele = 1 THEN LINE (142, 70 + (63 - rr))-(144, 70 + (63 - rr)), 0
   IF sele = 2 THEN LINE (162, 70 + (63 - gg))-(164, 70 + (63 - gg)), 0
   IF sele = 3 THEN LINE (182, 70 + (63 - bb))-(184, 70 + (63 - bb)), 0
   RETURN
END SUB

SUB MakeGrad (c, r, curr, steps, rr1, gg1, bb1, rr2, gg2, bb2, stay)

current = curr

FOR clearit = 16 TO 75
MakePal clearit, 0, 0, 0
NEXT

rt = rr1: b = bb1: g = gg1

diff = ABS(rr1 - rr2) + ABS(bb1 - bb2) + ABS(gg1 - gg2)

MakePal current, rr1, gg1, bb1

DO
'LINE (1, 1)-(40, 40), current, BF
LINE (c, r)-(c + 100, r + 10), 15, B
LINE (c + 1, r + 1)-(c + 1 + ((100 / diff) * current), r + 9), 15, BF
IF rr1 > rr2 THEN
   rt = rt - steps: IF rt < 0 THEN rt = 0
END IF
IF rr1 < rr2 THEN
   rt = rt + steps: IF rt > 63 THEN rt = 63
END IF

IF gg1 > gg2 THEN
   g = g - steps: IF g < 0 THEN g = 0
END IF
IF gg1 < gg2 THEN
   g = g + steps: IF g > 63 THEN g = 63
END IF

IF bb1 > bb2 THEN
   b = b - steps: IF b < 0 THEN b = 0
END IF
IF bb1 < bb2 THEN
   b = b + steps: IF b > 63 THEN b = 63
END IF

IF rt = rr2 AND b = bb2 AND g = gg2 THEN EXIT DO

IF stay = 0 THEN current = current + 1

MakePal current, rt, g, b

IF current - curr > 63 + curr THEN EXIT DO

LOOP


END SUB

SUB MakePal (spot, r, g, b)
PALETTE spot, 65536 * b + 256 * g + r
END SUB

