'***
SCREEN 12

L = TIMER
DO
    M = M + 2
LOOP WHILE TIMER - L < .4

ZJ = 17

DO
    FOR T = 0 TO 79

        FOR L = 1 TO 6
           
            JT = JT + ZJ * 2
            AJ = JT * ZJ * .0407835
            R = JT / 3 / ZJ
            CJ = CJ + 1
               
                IF CJ = 16 THEN CJ = 0
                    I$ = INKEY$
                        IF I$ <> "" THEN
                            T = 79
                            L = 6
                            EX = 1
                        END IF

                CIRCLE (300 - R / 1.5 * SIN(AJ), 225 - COS(AJ) * R / 1.5 * .8), R / ZJ + R / 5, CJ

            FOR D = 1 TO M / 100
            NEXT

        NEXT
    NEXT

        JT = 0
        ZJ = .1 / (RND + .0001) + 19 * RND
                IF EX <> 0 THEN EXIT DO

    CLS

LOOP





