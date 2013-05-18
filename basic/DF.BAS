DEFINT A-Z
DECLARE SUB colour (cno%, r%, g%, b%)
SCREEN 13
rc = 0
gc = 0
bc = 0
y:
y$ = INKEY$
u$ = LCASE$(y$)

IF u$ = "r" THEN rc = rc + 1: colour 1, rc, gc, bc: CIRCLE (100, 100), 20, 1: PAINT (100, 100), 1, 1
IF u$ = "g" THEN gc = gc + 1: colour 1, rc, gc, bc: CIRCLE (100, 100), 20, 1: PAINT (100, 100), 1, 1
IF u$ = "b" THEN bc = bc + 1: colour 1, rc, gc, bc: CIRCLE (100, 100), 20, 1: PAINT (100, 100), 1, 1 ELSE GOTO y



SUB colour (cno, r, g, b)
OUT &H3C8, cno
OUT &H3C9, r
OUT &H3C9, g
OUT &H3C9, b
END SUB

