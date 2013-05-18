0 CLS
INPUT "Enter sound limit:", sl
IF sl < 39 GOTO 0
DO
snd = INT(RND * sl) + 1
snd = snd + 39
SOUND snd, .07
LOOP WHILE INKEY$ = ""


