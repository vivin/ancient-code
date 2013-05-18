

SCREEN 13

'

PRINT "DCSAGCDSKNaVDGshbCXVKBM"

PRINT



PRINT

PRINT

PRINT

PRINT

PRINT

'the scrible signifys only your own text or image

PRINT "DSGAKVABCHVGSAHVCDKHVCDHFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"

  DIM melt%(3000)

  FOR RR = 1 TO 3000

    RANDOMIZE TIMER

    XX = INT(RND * 271)

    RANDOMIZE TIMER

    YX = INT(RND * 150)

    GET (XX, YX)-(XX + 48, YX + 48), melt%

    PUT (XX, YX + 1), melt%, PSET

    IF INKEY$ = CHR$(27) THEN END

  NEXT RR





