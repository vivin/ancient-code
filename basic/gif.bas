'***
DECLARE SUB GifLoad (File$)

SUB GifLoad (File$)
DEFINT A-Z
DIM Prefix(4095), Suffix(4095), OutStack(4095), ShiftOut%(8)
DIM Ybase AS LONG, PowersOf2(11) AS LONG, WorkCode AS LONG

FOR A% = 0 TO 7
  ShiftOut%(8 - A%) = 2 ^ A%
NEXT A%

FOR A% = 0 TO 11
  PowersOf2(A%) = 2 ^ A%
NEXT A%

IF File$ = "" THEN
  INPUT "GIF file"; File$
  IF File$ = "" THEN END
  END IF

IF INSTR(File$, ".") = 0 THEN
  File$ = File$ + ".gif"
  END IF

OPEN File$ FOR BINARY AS #1

'*** Check to see if this is a GIF87a file
File$ = "      "
GET #1, , File$
IF File$ <> "GIF87a" THEN PRINT "Not a GIF87a file.": END


'*** Get the number of pixels along the X and Y axes
GET #1, , TotalX: GET #1, , TotalY

GOSUB GetByte
NumColors = 2 ^ ((A% AND 7) + 1)
NoPalette = (A% AND 128) = 0

GOSUB GetByte: Background = A%

GOSUB GetByte: IF A% <> 0 THEN PRINT "Bad screen descriptor.": END
IF NoPalette = 0 THEN P$ = SPACE$(NumColors * 3): GET #1, , P$

DO
  GOSUB GetByte
  IF A% = 44 THEN
    EXIT DO
  ELSEIF A% <> 33 THEN
    PRINT "Unknown extension type.": END
  END IF
  GOSUB GetByte
  DO
    GOSUB GetByte
    File$ = SPACE$(A%)
    GET #1, , File$
  LOOP UNTIL A% = 0
LOOP

GET #1, , XStart
GET #1, , YStart
GET #1, , XLength
GET #1, , YLength
XEnd = XStart + XLength
YEnd = YStart + YLength
GOSUB GetByte

IF A% AND 128 THEN PRINT "Can't handle local colormaps.": END
Interlaced = A% AND 64: PassNumber = 0: PassStep = 8
GOSUB GetByte
ClearCode = 2 ^ A%
EOSCode = ClearCode + 1
FirstCode = ClearCode + 2: NextCode = FirstCode
StartCodeSize = A% + 1: CodeSize = StartCodeSize
StartMaxCode = 2 ^ (A% + 1) - 1: MaxCode = StartMaxCode

BitsIn = 0: BlockSize = 0: BlockPointer = 1
X% = XStart: Y% = YStart: Ybase = Y% * 320&

SCREEN 13: DEF SEG = &HA000

IF NoPalette = 0 THEN
  OUT &H3C7, 0: OUT &H3C8, 0
  FOR A% = 1 TO NumColors * 3: OUT &H3C9, ASC(MID$(P$, A%, 1)) \ 4: NEXT A%
END IF
LINE (0, 0)-(319, 199), Background, BF
DO
  GOSUB GetCode
  IF Code <> EOSCode THEN
   
    IF Code = ClearCode THEN
      NextCode = FirstCode
      CodeSize = StartCodeSize
      MaxCode = StartMaxCode
      GOSUB GetCode
      CurCode = Code: LastCode = Code: LastPixel = Code
      IF X% < 320 THEN POKE X% + Ybase, LastPixel
      X% = X% + 1: IF X% = XEnd THEN GOSUB NextScanLine
   
    ELSE
      CurCode = Code: StackPointer = 0
      IF Code > NextCode THEN EXIT DO
      IF Code = NextCode THEN
        CurCode = LastCode
        OutStack(StackPointer) = LastPixel
        StackPointer = StackPointer + 1
      END IF

      DO WHILE CurCode >= FirstCode
        OutStack(StackPointer) = Suffix(CurCode)
        StackPointer = StackPointer + 1
        CurCode = Prefix(CurCode)
      LOOP

      LastPixel = CurCode
      IF X% < 320 THEN POKE X% + Ybase, LastPixel
      X% = X% + 1: IF X% = XEnd THEN GOSUB NextScanLine

      FOR A% = StackPointer - 1 TO 0 STEP -1
        IF X% < 320 THEN POKE X% + Ybase, OutStack(A%)
        X% = X% + 1: IF X% = XEnd THEN GOSUB NextScanLine
      NEXT A%

      IF NextCode < 4096 THEN
        Prefix(NextCode) = LastCode
        Suffix(NextCode) = LastPixel
        NextCode = NextCode + 1
        IF NextCode > MaxCode AND CodeSize < 12 THEN
          CodeSize = CodeSize + 1
          MaxCode = MaxCode * 2 + 1
        END IF
      END IF
      LastCode = Code
    END IF
  END IF
LOOP UNTIL DoneFlag OR Code = EOSCode
CLOSE #1
EXIT SUB

GetByte:
  File$ = " "
  GET #1, , File$
  A% = ASC(File$)
  RETURN

NextScanLine:
  IF Interlaced THEN
    Y% = Y% + PassStep
    IF Y% >= YEnd THEN
      PassNumber = PassNumber + 1
      SELECT CASE PassNumber
      CASE 1: Y% = 4: PassStep = 8
      CASE 2: Y% = 2: PassStep = 4
      CASE 3: Y% = 1: PassStep = 2
      END SELECT
    END IF
  ELSE
    Y% = Y% + 1
  END IF
  X% = XStart: Ybase = Y% * 320&: DoneFlag = Y% > 199
  RETURN

GetCode:
  IF BitsIn = 0 THEN GOSUB ReadBufferedByte: LastChar = A%: BitsIn = 8
  WorkCode = LastChar \ ShiftOut%(BitsIn)
  DO WHILE CodeSize > BitsIn
      GOSUB ReadBufferedByte: LastChar = A%
      WorkCode = WorkCode OR LastChar * PowersOf2(BitsIn)
      BitsIn = BitsIn + 8
  LOOP
  BitsIn = BitsIn - CodeSize
  Code = WorkCode AND MaxCode
  RETURN

ReadBufferedByte:
  IF BlockPointer > BlockSize THEN
      GOSUB GetByte: BlockSize = A%
      File$ = SPACE$(BlockSize): GET #1, , File$
      BlockPointer = 1
  END IF
  A% = ASC(MID$(File$, BlockPointer, 1)): BlockPointer = BlockPointer + 1
  RETURN

END SUB

