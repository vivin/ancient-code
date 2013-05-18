DEFINT A-Z
SCREEN 12
FOR pal = 1 TO 15
PALETTE pal, pal * 4 * 65536 + pal * 4 * 256 + pal * 4
NEXT
FOR y = 1 TO 199: FOR x = 1 TO 319
u = POINT(x, y - 1): l = POINT(x - 1, y): IF u > l THEN max = u: min = l ELSE max = l: min = u
IF u AND l THEN
DO: col = RND * 14 + 1: LOOP UNTIL col >= min - 1 AND col <= max + 1
PSET (x, y), col
GOTO edpix
END IF
PSET (x, y), RND * 14 + 1
edpix:
LINE (x * 2, y + 240)-(x * 2 + 1, y + 240 - col), col, B

NEXT: NEXT




