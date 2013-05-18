'***
DECLARE SUB NewColor ()
COMMON SHARED Color1, Color2, Color3, Color4, Color5, Color6, Color7, Color8
DECLARE SUB Pal (PN!, I!, C1!, C2!)
DECLARE SUB MakePal ()
DECLARE SUB Ropal ()
SCREEN 13
RANDOMIZE TIMER
NewColor
DIM SHARED P(224, 7)
FOR X = 1 TO 320 STEP 1
FOR Y = 1 TO 200 STEP 1
IF INT(RND * 5) + 1 = 1 THEN PSET (X, Y), INT(RND * 224) + 1
NEXT Y
NEXT X
FOR Sx = 4 TO 1 STEP -1
Z = INT(Sx / 2)
FOR X = 1 TO 320 STEP Sx
FOR Y = 1 TO 200 STEP Sx
Redo:
D1 = POINT(X - Sx, Y - Sx) + INT(RND * 2) + 1
D2 = POINT(X - Sx, Y) + INT(RND * 2) + 1
D3 = POINT(X + Sx, Y) + INT(RND * 2) + 1
D4 = POINT(X, Y - Sx) + INT(RND * 2) + 1
D5 = POINT(X + Sx, Y - Sx) + INT(RND * 2) + 1
D6 = POINT(X - Sx, Y - Sx) + INT(RND * 2) + 1
D7 = POINT(X - Sx, Y + Sx) + INT(RND * 2) + 1
D8 = POINT(X + Sx, Y + Sx) + INT(RND * 2) + 1
C = (D1 + D2 + D3 + D4 + D5 + D6 + D7 + D8) / 8
IF C < 1 THEN GOTO Redo
LINE (X - Z, Y - Z)-(X + Z, Y + Z), C, BF
NEXT Y
NEXT X
NEXT Sx
Skip:
DO
IF INKEY$ = CHR$(13) THEN NewColor
IF INKEY$ = CHR$(27) THEN EXIT DO
Ropal
LOOP

SUB MakePal STATIC
FOR X = 1 TO 28
Pal X, X * 2, Color2, Color1
P(X, 1) = INT(X * 2.25)
P(X, 2) = Color2
P(X, 3) = Color1
NEXT X

FOR X = 29 TO 56
Pal X, (X - 28) * 2, Color3, Color2
P(X, 1) = INT((X - 28) * 2.25)
P(X, 2) = Color3
P(X, 3) = Color2
NEXT X

FOR X = 57 TO 84
Pal X, (X - 56) * 2, Color4, Color3
P(X, 1) = INT((X - 56) * 2.25)
P(X, 2) = Color4
P(X, 3) = Color3
NEXT X

FOR X = 85 TO 112
Pal X, (X - 84) * 2, Color5, Color4
P(X, 1) = INT((X - 84) * 2.25)
P(X, 2) = Color5
P(X, 3) = Color4
NEXT X

FOR X = 113 TO 140
Pal X, (X - 112) * 2, Color6, Color5
P(X, 1) = INT((X - 112) * 2.25)
P(X, 2) = Color6
P(X, 3) = Color5
NEXT X

FOR X = 141 TO 168
Pal X, (X - 140) * 2, Color7, Color6
P(X, 1) = INT((X - 140) * 2.25)
P(X, 2) = Color7
P(X, 3) = Color6
NEXT X

FOR X = 169 TO 196
Pal X, (X - 168) * 2, Color8, Color7
P(X, 1) = INT((X - 168) * 2.25)
P(X, 2) = Color8
P(X, 3) = Color7
NEXT X

FOR X = 197 TO 224
Pal X, (X - 196) * 2, Color1, Color8
P(X, 1) = INT((X - 196) * 2.25)
P(X, 2) = Color1
P(X, 3) = Color8
NEXT X

'28,56,84,112,140,168,196,224,252
END SUB

SUB NewColor STATIC
Color1 = INT(RND * 8) + 1
Color2 = INT(RND * 8) + 1
Color3 = INT(RND * 8) + 1
Color4 = INT(RND * 8) + 1
Color5 = INT(RND * 8) + 1
Color6 = INT(RND * 8) + 1
Color7 = INT(RND * 8) + 1
Color8 = INT(RND * 8) + 1
MakePal
END SUB

SUB Pal (PN, I, C1, C2) STATIC
Ri = 0
Gi = 0
Bi = 0
IF C1 = 1 THEN Bi = Bi + I
IF C1 = 2 THEN Gi = Gi + I
IF C1 = 3 THEN Bi = Bi + I: Gi = Gi + I
IF C1 = 4 THEN Ri = Ri + I
IF C1 = 5 THEN Bi = Bi + I: Ri = Ri + I
IF C1 = 6 THEN Ri = Ri + I: Gi = Gi + I
IF C1 = 7 THEN Ri = Ri + I: Gi = Gi + I: Bi = Bi + I
IF C2 = 1 THEN Bi = Bi + 63 - I
IF C2 = 2 THEN Gi = Gi + 63 - I
IF C2 = 3 THEN Bi = Bi + 63 - I: Gi = Gi + 63 - I
IF C2 = 4 THEN Ri = Ri + 63 - I
IF C2 = 5 THEN Bi = Bi + 63 - I: Ri = Ri + 63 - I
IF C2 = 6 THEN Ri = Ri + 63 - I: Gi = Gi + 63 - I
IF C2 = 7 THEN Ri = Ri + 63 - I: Gi = Gi + 63 - I: Bi = Bi + 63 - I
IF Ri > 63 THEN Ri = 63
IF Gi > 63 THEN Gi = 63
IF Gi > 63 THEN Bi = 63
OUT 968, PN
OUT 969, Ri
OUT 969, Gi
OUT 969, Bi
END SUB

SUB Ropal STATIC
D1 = P(1, 1)
D2 = P(1, 2)
D3 = P(1, 3)

FOR A = 2 TO 224
SWAP P(A, 1), P(A - 1, 1)
SWAP P(A, 2), P(A - 1, 2)
SWAP P(A, 3), P(A - 1, 3)
NEXT A

P(224, 1) = D1
P(224, 2) = D2
P(224, 3) = D3

FOR A = 1 TO 224
Pal A, P(A, 1), P(A, 2), P(A, 3)
NEXT A



END SUB

SUB TestPal STATIC
FOR X = 1 TO 224
FOR Y = 1 TO 200
PSET (X, Y), X
NEXT Y
NEXT X




END SUB

