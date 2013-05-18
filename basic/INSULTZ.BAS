CLS
RANDOMIZE TIMER
1 INPUT "C:\>", stuff$
IF stuff$ = "I am a moron" THEN END
cp1$ = "Shut up stupid!"
cp2$ = "You are so dumb, you don't know a car from a cow!"
cp3$ = "Hey stupid, don't drool on my keyboard!"
cp4$ = "You are a moron!"
cp5$ = "Fatal Error: Dumb User at terminal!"
cp6$ = "Ahhhhhh!!!!! Don't punch the keyboard so hard!"
cp7$ = "Ahhhh!! Don't set your cat on my mouse!!!"
cp8$ = "Roses are Red, Violets are blue, Morons like you live in a zoo!"
cp9$ = "Life is a box of microchips..."
cp10$ = "I hate you yeah yeah yeah!"
cp11$ = "I'm goin' out with your love hahaha!!!"
ch = INT(RND * 11) + 1
IF ch = 1 THEN PRINT cp1$
IF ch = 2 THEN PRINT cp2$
IF ch = 3 THEN PRINT cp3$
IF ch = 4 THEN PRINT cp4$
IF ch = 5 THEN PRINT cp5$
IF ch = 6 THEN PRINT cp6$
IF ch = 7 THEN PRINT cp7$
IF ch = 8 THEN PRINT cp8$
IF ch = 9 THEN PRINT cp9$
IF ch = 10 THEN PRINT cp10$
IF ch = 11 THEN PRINT cp11$
GOTO 1

