SCREEN 12
FOR I% = 1 TO 200
  LINE (INT(RND * 640), INT(RND * 480))-(INT(RND * 640), INT(RND * 480)), INT(RND * 15) + 1
NEXT I%

DIM a1%(0 TO 5000)
DIM b1%(0 TO 5000)

DO
w% = INT(RND * 13) * 45
x% = INT(RND * 9) * 45
GET (w%, x%)-(w% + 45, x% + 45), a1%(0)
y% = INT(RND * 13) * 45
z% = INT(RND * 9) * 45
GET (y%, z%)-(y% + 45, z% + 45), b1%(0)
PUT (w%, x%), b1%(0), PSET
PUT (y%, z%), a1%(0), PSET
LOOP WHILE INKEY$ = ""

