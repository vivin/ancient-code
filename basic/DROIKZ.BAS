CLS
SCREEN 13
RANDOMIZE TIMER
1 r = 15
x = INT(RND * 320) + 1
y = INT(RND * 200) + 1
FOR c = 17 TO 31
CIRCLE (x, y), r, c
PAINT (x, y), c
r = r - 1
NEXT c
FOR t = 1 TO 1000
NEXT t
GOTO 1

