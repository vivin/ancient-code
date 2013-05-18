SCREEN 12
F3: LOCATE 1: PRINT "  3 Waves";
    FOR X = -80 TO 70 STEP 4: X2 = X * X
        FOR Y = -100 TO 100
           GOSUB L3
           NY = Y - X * .5 + 150: NZ = Z + X * .7 + 120
           LINE (NY, NZ)-(NY, 199), 0
           IF Y = -100 THEN
           PSET (NY, NZ)
           ELSE
           LINE (PY, PZ)-(NY, NZ)
           END IF
           PY = NY: PZ = NZ
     NEXT Y
 NEXT X
END

L3: 'Function Z(X,Y) for the figure WAVES
     D = SQR(X2 + Y * Y)
     IF D = 0 THEN Z = -60 ELSE Z = -300 * SIN(D / 5) / (D)
     RETURN

