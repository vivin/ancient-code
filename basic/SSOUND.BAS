RANDOMIZE TIMER
CLS
PRINT "Stupid Sounds Copyright (c) Dark Angels Inc. 1997"
PRINT "Programmed by - Valentino"
INPUT "For how long (0 - not long at all, 1000000 - pretty long):", l
FOR i = 1 TO l
frq = (RND * 2000) + 1
frq = frq + 39
del = INT(RND * 3) + 1
SOUND frq, del
NEXT i
END

