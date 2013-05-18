' Starfield simulation, done by Steve Bigras (stbigras@hotmail.com)
' simulates a starfield through space, can be very good for a space game,
' use the UP/DOWN arrow for the direction, +- for the speed, the Depth
' variable can be changed for kool effects, variable Direction valued=1
' for forward, valued=0 for backwards.


DECLARE SUB FPal (C%, R%, G%, B%)
DECLARE SUB ShowStars ()
DECLARE SUB SetupStars ()
DEFINT A-Z
TYPE StarField
  Ray AS INTEGER
  Ax AS INTEGER
  xx AS INTEGER
  yy AS INTEGER
END TYPE

DIM SHARED V, K, Total, Direction, Speed, Depth
REDIM SHARED Stars(255) AS StarField, AxSin(320)

Direction = 0
Speed = 4
Depth = 3    ' range is 3-32000

SCREEN 13

SetupStars
FPal 64, 63, 63, 63
COLOR 64

DO
A$ = INKEY$
IF A$ = CHR$(27) THEN END
IF A$ = CHR$(0) + CHR$(80) THEN Direction = 1
IF A$ = CHR$(0) + CHR$(72) THEN Direction = 2
IF A$ = "=" OR A$ = "+" THEN IF Speed <> 15 THEN Speed = Speed + 1
IF A$ = "-" AND Speed <> 1 THEN Speed = Speed - 1
ShowStars
LOOP

'Events
DATA

SUB FPal (C, R, G, B)
OUT &H3C8, C
OUT &H3C9, R
OUT &H3C9, G
OUT &H3C9, B
END SUB

SUB SetupStars
Pi! = 3.14159

FOR T = 0 TO 319
  AxSin(T) = SIN(T / 256 * Pi! * 2) * 256
NEXT T

FOR C = 0 TO 63
 FPal C + 1, C / 2, C / 2, C
NEXT

FOR T = 0 TO 255
  Stars(T).Ax = (RND * 255)
  Stars(T).Ray = (RND * 255)
  NEXT T
END SUB

SUB ShowStars
Z1 = 160
Z2 = 120

IF Direction = 1 THEN V = (V - Speed) AND 255 ELSE V = (V + Speed) AND 255
FOR T = 0 TO 255
 K = (T + V) AND 255: C = 63 - K \ 4: K = K + K + Depth
 IF POINT(Stars(T).xx, Stars(T).yy) < 64 THEN PSET (Stars(T).xx, Stars(T).yy), 0
 Stars(T).Ax = (Stars(T).Ax - 1) AND 255
 Stars(T).xx = Z1 + AxSin(Stars(T).Ax) * (Stars(T).Ray + 0&) \ K
 Stars(T).yy = Z2 + AxSin(Stars(T).Ax + 64) * (Stars(T).Ray + 0&) \ K
 IF POINT(Stars(T).xx, Stars(T).yy) < 64 THEN PSET (Stars(T).xx, Stars(T).yy), C
NEXT T

WAIT &H3DA, 8, 1
END SUB

