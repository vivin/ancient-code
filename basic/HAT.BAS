'3D-Hat
'Originally programmed August 1982 by Bourn & Fruhwald
'Converted to QBasic by Kaleb Brasee - Qpalzm@AOL.COM


Intialize:
SCREEN 13: COLOR 6: CLS
'End Init

P = 160: Q = 100
XP = 144: XR = 1.5 * 3.1415927#
YP = 56: YR = 1: ZP = 64
XF = XR / XP: YF = YP / YR: ZF = XR / ZP
61 FOR ZI = Q - 1 TO -Q STEP -2
70 IF ZI < -ZP OR ZI > ZP THEN GOTO 150
80 ZT = ZI * XP / ZP: ZZ = ZI
90 XL = CINT(SQR(XP * XP - ZT * ZT))
100 FOR XI = -XL TO XL STEP 1
110 XT = SQR(XI * XI + ZT * ZT) * XF: XX = XI
120 YY = (SIN(XT) + .4 * SIN(3 * XT)) * YF

130 GOSUB 170
NEXT XI
150 NEXT ZI
160 A$ = INKEY$: IF A$ = "" THEN 160 ELSE 999

170

        'scale and plot the point XX,YY
        X1 = XX + ZZ + P
        Y1 = -YY - ZZ + Q
        PSET (X1, Y1)
        IF Y1 = 0 THEN 220
        LINE (X1, Y1 + 1)-(X1, 199), 0

220 RETURN
LOCATE 1, 1: PRINT SPC(8); " ";

999
CLS
PRINT "Thank you for downloading..."
PRINT "3D-Hat!"