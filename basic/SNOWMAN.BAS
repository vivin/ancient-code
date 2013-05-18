

DECLARE SUB SetRGB (Nr%, r%, g%, b%)
DECLARE SUB RenderCircle (x%, y%, r%, colstart%, a!)
' SUMMER.BAS - FREEWARE by Robert Seidel rseidel@ifk.uni-jena.de

'  ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ
' Ы                                                     Ы
' Ы This file was found at Robert's HomePage !          Ы
' Ы                                                     Ы
' Ы Come and visit me if you are interested in:         Ы
' Ы                                                     Ы
' Ы  PowerBASIC, QBASIC, POVRAY, POVLAB,                Ы
' Ы    FREE 3D Studio IPAS, PICTURES,                   Ы
' Ы      FREEWARE, GAME Levels                          Ы
' Ы        AND A LOT OF LINKS !                         Ы
' Ы                                                     Ы
' Ы  http://www.uni-jena.de/~p6sepa/rshp.html  ___      Ы
' Ы                                           (o o)     Ы
' Ы                                       oOo ( O ) oOo Ы
'  ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ


DEFINT A-Z
DIM melt(2400)

SCREEN 13
RANDOMIZE TIMER

FOR i = 0 TO 63 'Palette
  SetRGB i, 64 - i, 64 - i, 64 - i 'grau
  SetRGB i + 64, i, 0, 0 'rot
  SetRGB i + 128, 63, i, 0 'rot-orange
NEXT

FOR i = 1 TO 50 'Schnee
  LINE (0, i + 150)-(320, i + 150), i
NEXT

RenderCircle 160, 158, 50, 1, .8 'Schneemannk”rper
RenderCircle 160, 95, 35, 1, .8
RenderCircle 160, 50, 25, 1, .8
RenderCircle 149, 45, 3, 58, 1.2 'Augen
RenderCircle 169, 46, 3, 58, 1.2
FOR i = 85 TO 205 STEP 25 'Kn”pfe
  RenderCircle 155 + RND * 2, i, 2, 50 + RND * 4, 1
NEXT
CIRCLE (160, 93), 40, 0, 1.2, 1.8 'Mund
CIRCLE (160, 94), 40, 0, 1.2, 1.8
FOR i = 147 TO 177
  LINE (i, 9)-(i - 2, 32), i - 130 'Hut
NEXT
LINE (135, 32)-(184, 34), 30
FOR x = 16 TO 1 STEP -1 'Nase
  RenderCircle 142 + x, 59 - x / 2.5, x \ 4, 128 - x * 2, 1
NEXT

SLEEP 'Pause

'SCHMELZEFFEKT:
FOR i = 1 TO 4000
  x = RND * 271
  y = RND * 150
  GET (x, y)-(x + 48, y + 48), melt
  PUT (x, y + 1), melt, PSET
NEXT i

RenderCircle 160, 100, 60, 128, 1 'Sonne
RenderCircle 140, 80, 7, 55, 1 'Augen
RenderCircle 180, 80, 7, 55, 1
CIRCLE (160, 80), 50, 60, 4, 5.5 'Mund
CIRCLE (160, 88), 50, 60, 3.6, 5.8, 1.3

SLEEP 'Pause

SUB RenderCircle (x, y, r, colstart, a!)
  FOR i = r TO 0 STEP -1
    CIRCLE (x, y), i, (colstart + i), , , a!
    PAINT (x, y), (colstart + i)
  NEXT
END SUB

SUB SetRGB (Nr, r, g, b)
  OUT &H3C8, Nr
  OUT &H3C9, r
  OUT &H3C9, g
  OUT &H3C9, b
END SUB

