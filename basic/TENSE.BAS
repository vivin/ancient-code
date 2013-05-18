DECLARE SUB calc ()
DECLARE SUB drawit ()
COMMON SHARED dif
SCREEN 12
DIM SHARED nf(4800), of(4800), pk(4800)
RANDOMIZE TIMER
FOR co = 1 TO 20
of(RND * 4000 + 400) = RND * 400
NEXT
FOR pal = 1 TO 15
PALETTE pal, pal * 3 + 18
NEXT
DO
calc
drawit
IF dif = 0 THEN SLEEP
LOOP

SUB calc
dif = 0
FOR y = 2 TO 58
FOR x = 2 TO 78
tot = 0
IF NOT pk(y * 80 + x) THEN
ps = y * 80 + x
tot = tot + of(ps - 80)
tot = tot + of(ps + 80)
tot = tot + of(ps - 1)
tot = tot + of(ps + 1)
tot = tot + of(ps - 79)
tot = tot + of(ps - 81)
tot = tot + of(ps + 79)
tot = tot + of(ps + 81)
END IF
IF tot AND pk(y * 80 + x) = 0 THEN
nf(y * 80 + x) = tot / 4
pk(y * 80 + x) = 1
dif = 1
END IF
PSET (639, (ps - 30) / 9.5), 15
NEXT: NEXT
FOR y = 2 TO 58
FOR x = 2 TO 78
of(y * 80 + x) = nf(y * 80 + x)
PSET (638, (y * 80 + x - 30) / 9.5), 15
NEXT: NEXT
IF INKEY$ <> "" THEN END
END SUB

SUB drawit
CLS
FOR y = 2 TO 58
FOR x = 2 TO 78
ps = y * 80 + x
COLOR of(ps) / 16 + 1
PSET (x * 8, y * 8 - 8 - of(ps - 80))
LINE -(x * 8 + 8, y * 8 - of(ps + 1))
LINE -(x * 8, y * 8 + 8 - of(ps + 80))
LINE -(x * 8 - 8, y * 8 - of(ps - 1))
LINE -(x * 8, y * 8 - 8 - of(ps - 80))
PSET (637, (ps - 30) / 9.5), 15
NEXT: NEXT
END SUB

