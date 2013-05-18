0 CLS
RANDOMIZE TIMER
INPUT "Enter duration (2-0.05):", durat
IF durat < .05 OR durat > 3 THEN 0
INPUT "Enter range(39-32726)", range
DO
snd = INT(RND * range) + 40
SOUND snd, durat
LOOP WHILE INKEY$ = ""

