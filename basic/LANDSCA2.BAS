DEFINT A-Z
SCREEN 12
FOR pal = 1 TO 15
PALETTE pal, pal * 4 * 65536 + pal * 4 * 256 + pal * 4
NEXT
PRINT "Alternate palette?"
DO: K$ = UCASE$(INKEY$): LOOP UNTIL K$ <> ""
IF K$ <> "Y" THEN GOTO no
waterlevel = 7
s = FIX(40 / waterlevel)
FOR l = 1 TO waterlevel
PALETTE l, (20 + s * l) * 65536
NEXT
s = FIX(30 / (12 - waterlevel))
FOR l = waterlevel + 1 TO 12
PALETTE l, (30 + s * (l - (waterlevel + 1))) * 256
NEXT
no:
PRINT "(F)ixed or (U)nfixed?"
DO: K$ = UCASE$(INKEY$): LOOP UNTIL K$ <> ""
IF K$ = "F" THEN GOTO fixed
FOR y = 1 TO 478: FOR x = 1 TO 638
u = POINT(x, y - 1): l = POINT(x - 1, y): IF u > l THEN max = u: min = l ELSE max = l: min = u
IF u AND l THEN
DO: col = RND * 14 + 1: LOOP UNTIL col >= min - 1 AND col <= max + 1
PSET (x, y), col
GOTO edpix
END IF
PSET (x, y), RND * 14 + 1
edpix:
NEXT: NEXT



fixed:
x = 1: dx = 1
SCREEN 12
FOR y = 1 TO 478: FOR q = 1 TO 638
u = POINT(x, y - 1): l = POINT(x - dx, y): IF u > l THEN max = u: min = l ELSE max = l: min = u
IF u AND l THEN
DO: col = RND * 14 + 1: LOOP UNTIL col >= min - 1 AND col <= max + 1
PSET (x, y), col
GOTO edp
END IF
PSET (x, y), RND * 14 + 1
edp:
x = x + dx
NEXT: dx = -dx: NEXT





