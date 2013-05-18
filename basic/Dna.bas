

CLS

SCREEN 12

pi = 3.14159 / 2

FOR rot = 0 TO 3.14159 * 20 STEP .1



ax = 320 + 60 * COS(1 * rot)

ay = 400 + 30 * SIN(1 * rot)







CIRCLE (ax + 80 * COS(rot), ay + 20 * SIN(rot)), 8, 1

CIRCLE (ax + 70 * COS(rot), ay + 18 * SIN(rot)), 7, 2

CIRCLE (ax + 60 * COS(rot), ay + 16 * SIN(rot)), 6, 3

CIRCLE (ax + 50 * COS(rot), ay + 14 * SIN(rot)), 5, 4

CIRCLE (ax + 40 * COS(rot), ay + 12 * SIN(rot)), 4, 5

CIRCLE (ax + 30 * COS(rot), ay + 10 * SIN(rot)), 3, 6

CIRCLE (ax + 20 * COS(rot), ay + 8 * SIN(rot)), 2, 7

CIRCLE (ax + 10 * COS(rot), ay + 6 * SIN(rot)), 1, 8

LINE (ax, ay)-(ax + 80 * COS(rot), ay + 20 * SIN(rot)), 9





CIRCLE (ax + -80 * COS(rot + (pi)), ay + -20 * SIN(rot + (pi))), 8, 1

CIRCLE (ax + -70 * COS(rot + (pi)), ay + -18 * SIN(rot + (pi))), 7, 2

CIRCLE (ax + -60 * COS(rot + (pi)), ay + -16 * SIN(rot + (pi))), 6, 3

CIRCLE (ax + -50 * COS(rot + (pi)), ay + -14 * SIN(rot + (pi))), 5, 4

CIRCLE (ax + -40 * COS(rot + (pi)), ay + -12 * SIN(rot + (pi))), 4, 5

CIRCLE (ax + -30 * COS(rot + (pi)), ay + -10 * SIN(rot + (pi))), 3, 6

CIRCLE (ax + -20 * COS(rot + (pi)), ay + -8 * SIN(rot + (pi))), 2, 7

CIRCLE (ax + -10 * COS(rot + (pi)), ay + -6 * SIN(rot + (pi))), 1, 8

LINE (ax, ay)-(ax - 80 * COS(rot + pi), ay + -20 * SIN(rot + pi)), 9





LINE (ax + 80 * COS(rot), ay + 20 * SIN(rot))-(ax - 80 * COS(rot + pi), ay + -20 * SIN(rot + pi)), 9







PRINT ""

NEXT rot





