'***
'BY: Steve Skrla (Ripple)
SCREEN 13
RANDOMIZE TIMER
DIM COLER(255, 3)
DIM ColCon(400)
DIM DROP(400)
FOR COL = 1 TO 200
  OUT &H3C7, COL
  FOR valu = 1 TO 3
    COLER(COL, valu) = INP(&H3C9)
  NEXT
NEXT
FOR COL = 1 TO 255
  ColCon(COL) = COL
NEXT

DO UNTIL INKEY$ <> ""
COL = RND * 30
X = RND * 300
Y = RND * 200
RAD = RND * 25
FOR Til! = .85 TO 0 STEP -.04
  COL = COL + 1
  CIRCLE (X, Y), RAD, COL, 3.14, 0, Til!
  T! = TIMER + .004
  WHILE T! > TIMER: WEND
  GOSUB UPDATCOL
NEXT
FOR Til! = 0 TO .85 STEP .04
  COL = COL + 1
  CIRCLE (X, Y), RAD, COL, 0, 3.14, Til!
  T! = TIMER + .004
  WHILE T! > TIMER: WEND
  GOSUB UPDATCOL
NEXT
LOOP
LogoENder:
END
UPDATCOL:
FOR cole = 1 TO 255
  OUT &H3C8, cole
  OUT &H3C9, COLER(ColCon(cole), 1)
  OUT &H3C9, COLER(ColCon(cole), 2)
  OUT &H3C9, COLER(ColCon(cole), 3)
  ColCon(cole) = ColCon(cole) - 1
  IF ColCon(cole) < 1 THEN ColCon(cole) = 255
NEXT
RETURN

PRINT COL

