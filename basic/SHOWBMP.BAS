DEFINT A-Z
DECLARE SUB BMPLoad (X%, Y%, file$)
SCREEN 13: CLS
INPUT file$
BMPLoad 0, 0, file$

SUB BMPLoad (X, Y, file$)
IF NOT INSTR(".", file$) THEN file$ = file$ + ".bmp"
BMP = FREEFILE: OPEN file$ FOR BINARY AS BMP

GET BMP, 11, PAL 'GET lenght of PALETTE info
GET BMP, 19, BMX 'GET BMP size X
GET BMP, 23, BMY 'GET BMP size Y
SEEK BMP, PAL 'skip the PALETTE

DEF SEG = &HA000
A$ = SPACE$((((BMX - 1) OR 7) + 1) \ 2): B = BMX \ 2
FOR Y2 = BMY TO 0 STEP -1
  GET BMP, , A$: A = LEN(A$)
    SELECT CASE B
      CASE IS < A: RunX = B
      CASE ELSE: RunX = A
    END SELECT
    FOR X2 = 1 TO RunX
      pixel% = ASC(MID$(A$, X2, 1))
      POKE (X + (X2 + X2 + 1) + (Y + Y2) * 320), pixel% AND 15
      POKE (X + (X2 + X2) + (Y + Y2) * 320), pixel% \ 16
    NEXT
NEXT
DEF SEG
CLOSE BMP
END SUB

