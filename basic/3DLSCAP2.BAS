DEFINT A-Z
DIM of(40 * 80)
SCREEN 12
FOR pal = 1 TO 15
PALETTE pal, pal * 4 * 65536 + pal * 4 * 256 + pal * 4
NEXT
PALETTE 1, 65536 * 63
waterlevel = 7
s = FIX(40 / waterlevel)
FOR l = 1 TO waterlevel
PALETTE l, (20 + s * l) * 65536
NEXT
s = FIX(30 / (12 - waterlevel))
FOR l = waterlevel + 1 TO 12
PALETTE l, (30 + s * (l - (waterlevel + 1))) * 256
NEXT

RANDOMIZE TIMER
dx = 1: x = 1
FOR y = 1 TO 80: FOR q = 1 TO 40
u = POINT(x, y - 1): l = POINT(x - dx, y): IF u > l THEN max = u: min = l ELSE max = l: min = u
IF u AND l THEN
DO: col = RND * 14 + 1: LOOP UNTIL col >= min - 1 AND col <= max + 1
PSET (x, y), col
GOTO edpix
END IF
PSET (x, y), RND * 14 + 1
edpix:
of((y - 1) * 40 + (x - 1)) = col * 4
x = x + dx
NEXT: dx = -dx: NEXT
CLS
FOR y = 2 TO 68
FOR x = 2 TO 38
ps = (y - 1) * 40 + (x - 1)
PSET (x * 16, y * 8 - 8 - of(ps - 40)), 15
LINE -(x * 16 + 16, y * 8 - of(ps + 1)), 15
LINE -(x * 16, y * 8 + 8 - of(ps + 40)), 15
LINE -(x * 16 - 16, y * 8 - of(ps - 1)), 15
LINE -(x * 16, y * 8 - 8 - of(ps - 40)), 15
IF of(ps - 40) + 7 > of(ps + 40) THEN
PAINT (x * 16, y * 8 - of(ps - 40) + 1), 0, 15
PAINT (x * 16, y * 8 - of(ps - 40) + 1), of(ps) / 4, 15
END IF
PSET (x * 16, y * 8 - 8 - of(ps - 40)), of(ps) / 4
LINE -(x * 16 + 16, y * 8 - of(ps + 1)), of(ps) / 4
LINE -(x * 16, y * 8 + 8 - of(ps + 40)), of(ps) / 4
LINE -(x * 16 - 16, y * 8 - of(ps - 1)), of(ps) / 4
LINE -(x * 16, y * 8 - 8 - of(ps - 40)), of(ps) / 4

IF of(ps) / 4 <= waterlevel THEN
PSET (x * 16, y * 8 - 8 - waterlevel * 4), 15
LINE -(x * 16 + 16, y * 8 - waterlevel * 4), 15
LINE -(x * 16, y * 8 + 8 - waterlevel * 4), 15
LINE -(x * 16 - 16, y * 8 - waterlevel * 4), 15
LINE -(x * 16, y * 8 - 8 - waterlevel * 4), 15
PAINT (x * 16, y * 8 - waterlevel * 4), 0, 15
PAINT (x * 16, y * 8 - waterlevel * 4), of(ps) / 4, 15
PSET (x * 16, y * 8 - 8 - waterlevel * 4)
LINE -(x * 16 + 16, y * 8 - waterlevel * 4), of(ps) / 4
LINE -(x * 16, y * 8 + 8 - waterlevel * 4), of(ps) / 4
LINE -(x * 16 - 16, y * 8 - waterlevel * 4), of(ps) / 4
LINE -(x * 16, y * 8 - 8 - waterlevel * 4), of(ps) / 4
END IF
NEXT: NEXT




