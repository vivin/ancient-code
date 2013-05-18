

DEFINT A-Z

DECLARE SUB movepoint ()

COMMON SHARED x, y, c



SCREEN 13: CLS

RANDOMIZE TIMER

DIM Red(63), Green(63), Blue(63)

DIM RedChange(63), GreenChange(63), BlueChange(63)



ChangeRate = 100

start:

x = INT(RND * 320): y = INT(RND * 200)

RedChangeStart = INT(RND * 10) - 5

BlueChangeStart = INT(RND * 10) - 5

GreenChangeStart = INT(RND * 10) - 5



FOR n = 0 TO 63

  RedChange(n) = RedChangeStart

  GreenChange(n) = GreenChangeStart

  BlueChange(n) = BlueChangeStart

    StartRedPalette = n + RedChangeStart

    StartGreenPalette = n + GreenChangeStart

    StartBluePalette = n + BlueChangeStart

  IF StartRedPalette > 63 THEN StartRedPalette = StartRedPalette - 63

  IF StartGreenPalette > 63 THEN StartGreenPalette = StartGreenPalette - 63

  IF StartBluePalette > 63 THEN StartBluePalette = StartBluePalette - 63

    Red(n) = StartRedPalette

    Green(n) = StartGreenPalette

    Blue(n) = StartBluePalette

NEXT



DO

Counter = Counter + 1

IF Counter > ChangeRate THEN Counter = 0

movepoint



IF Counter = 0 THEN

 FOR i = 1 TO 63

  Red(i) = Red(i) + RedChange(i)

  Green(i) = Green(i) + GreenChange(i)

  Blue(i) = Blue(i) + BlueChange(i)

   IF Red(i) > 63 THEN Red(i) = 63: RedChange(i) = -RedChange(i)

   IF Green(i) > 63 THEN Green(i) = 63: GreenChange(i) = -GreenChange(i)

   IF Blue(i) > 63 THEN Blue(i) = 63: BlueChange(i) = -BlueChange(i)

  IF Red(i) < 0 THEN Red(i) = 0: RedChange(i) = -RedChange(i)

  IF Green(i) < 0 THEN Green(i) = 0: GreenChange(i) = -GreenChange(i)

  IF Blue(i) < 0 THEN Blue(i) = 0: BlueChange(i) = -BlueChange(i)

   OUT &H3C8, i

   OUT &H3C9, Red(i)

   OUT &H3C9, Green(i)

   OUT &H3C9, Blue(i)

 NEXT

END IF

k$ = INKEY$

IF UCASE$(k$) = "Q" THEN END

IF k$ <> "" THEN GOTO start

LOOP



SUB movepoint

Direction = INT(RND * 4)

SELECT CASE Direction

 CASE 0

  y = y - 1

  IF y < 0 THEN y = 0

 CASE 1

  x = x - 1

  IF x < 0 THEN x = 0

 CASE 2

  y = y + 1

  IF y > 200 THEN y = 200

 CASE 3

  x = x + 1

  IF x > 320 THEN x = 320

END SELECT

Colour = POINT(x, y) + 1

IF Colour > 63 THEN Colour = 63

DEF SEG = &HA000

POKE y * 320& + x, Colour

DEF SEG

END SUB

