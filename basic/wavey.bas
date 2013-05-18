

'From: The QBasic Page
'http://qbasic.com

SCREEN 9
DIM PI AS DOUBLE
PI = 4 * ATN(1)
text$ = "Wavey Scroll"
DIM TeXtMaTriX(LEN(text$) * 8, 16) AS INTEGER
PRINT text$
FOR y% = 1 TO 16
  FOR i% = 1 TO (LEN(text$) * 8)
   TeXtMaTriX(i%, y%) = POINT(i%, y%)
  NEXT i%
NEXT y%
CLS
cc% = -LEN(text$) * 8
InC% = 8
XRaDiuS% = 50
DO
 SCREEN 9, 0, 1, 0
 CLS
 IF cc% > 640 THEN cc% = -(LEN(text$) * 8)
 cc% = cc% + InC%
 FOR y% = 1 TO 16
   FOR X% = cc% TO cc% + LEN(text$) * 8
     X2% = (SIN((X% * (PI / 180))) * (XRaDiuS%)) + 270
     LINE (X%, (X2% + y%) - 100)-(X%, (X2% + y%) - 100), TeXtMaTriX(X% - cc%, y%), BF
   NEXT X%
 NEXT y%
 SCREEN 9, 0, 0, 0
 PCOPY 1, 0
LOOP UNTIL INKEY$ <> ""


