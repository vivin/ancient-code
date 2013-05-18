SCREEN 12
DIM x(20, 20), y(20, 20), z(20, 20)
RANDOMIZE TIMER
sx = FIX(RND * 18) + 1
sy = FIX(RND * 18) + 1
x(sx, sy) = RND * 1000 - 500
y(sx, sy) = RND * 1000 - 500
z(sx, sy) = RND * 1000 - 500
sx2 = FIX(RND * 18) + 1
sy2 = FIX(RND * 18) + 1
x(sx2, sy2) = RND * 1000 - 500
y(sx2, sy2) = RND * 1000 - 500
z(sx2, sy2) = RND * 1000 - 500
FOR pal = 1 TO 15
PALETTE pal, pal * 3 + 15
NEXT
IF y(sx2, sy2) > y(sx, sy) THEN
max = y(sx2, sy2)
max = max / 15
ELSE
max = y(sx, sy)
max = max / 15
END IF
DO
GOSUB calc
GOSUB drw
LOOP UNTIL INKEY$ <> ""
END

calc:
FOR i = 2 TO 19
FOR j = 2 TO 19
IF i <> sx2 AND i <> sx OR j <> sy2 AND j <> sy THEN
x(i, j) = (x(i + 1, j) + x(i - 1, j) + x(i, j + 1) + x(i, j - 1)) / 4
y(i, j) = (y(i + 1, j) + y(i - 1, j) + y(i, j + 1) + y(i, j - 1)) / 4
z(i, j) = (z(i + 1, j) + z(i - 1, j) + z(i, j + 1) + z(i, j - 1)) / 4
END IF
NEXT
NEXT
FOR i = 2 TO 19
x(20, i) = (x(19, i) + x(20, i - 1) + x(20, i + 1)) / 3
y(20, i) = (y(19, i) + y(20, i - 1) + y(20, i + 1)) / 3
z(20, i) = (z(19, i) + z(20, i - 1) + z(20, i + 1)) / 3
x(1, i) = (x(2, i) + x(1, i - 1) + x(1, i + 1)) / 3
y(1, i) = (y(2, i) + y(1, i - 1) + y(1, i + 1)) / 3
z(1, i) = (z(2, i) + z(1, i - 1) + z(1, i + 1)) / 3
x(i, 20) = (x(i, 19) + x(i - 1, 20) + x(i + 1, 20)) / 3
y(i, 20) = (y(i, 19) + y(i - 1, 20) + y(i + 1, 20)) / 3
z(i, 20) = (z(i, 19) + z(i - 1, 20) + z(i + 1, 20)) / 3
x(i, 1) = (x(i, 2) + x(i - 1, 1) + x(i + 1, 1)) / 3
y(i, 1) = (y(i, 2) + y(i - 1, 1) + y(i + 1, 1)) / 3
z(i, 1) = (z(i, 2) + z(i - 1, 1) + z(i + 1, 1)) / 3
NEXT
RETURN



drw:
CLS
FOR d = 1 TO 20
FOR n = 1 TO 19
LINE (10 * d + x(d, n) + 220, 10 * n + z(d, n) + y(d, n) + 100)-(10 * d + x(d, n + 1) + 220, 10 * n + 10 + z(d, n + 1) + y(d, n + 1) + 100), SQR(y(d, n) ^ 2) / max + 2
LINE (10 * n + x(n, d) + 220, 10 * d + y(n, d) + z(n, d) + 100)-(10 * n + 10 + x(n + 1, d) + 220, 10 * d + z(n + 1, d) + y(n + 1, d) + 100), SQR(y(n, d) ^ 2) / max + 2
NEXT
NEXT
RETURN

