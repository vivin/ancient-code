DECLARE SUB colour (a%, b%, C%, d%)
DECLARE SUB PlayWav (wavefile$)
DECLARE SUB ValidWavHeader (FILE$, LenHeader%, dataLen&, nChannels%, nSamplesPerSec&, nAvgBytesPerSec&, ok%)
DECLARE SUB WriteToDSP (v%)
DECLARE SUB PlayBack (buffer$, size%, freq&, BytesPerSec&, chans%, num%)
DECLARE SUB delay (tdelay!)
DECLARE FUNCTION GetBlasterAddr% ()
DECLARE FUNCTION SBreset% ()
COMMON SHARED BlasterAddr%, dma%, repeats%
SHELL "pcx prod.pcx"
SHELL "pcx pack.pcx"
DEFINT A-Z
DIM melt(32767)
SCREEN 13
x = 0
PlayWav "c:\firstb~1\intro.wav"
FOR i = 0 TO 63 'Palette
  colour i, 64 - i, 64 - i, 32 - i
  colour 64 + i, i, 0, 32 - i
  colour i + 128, 63, i, 0
NEXT
r = 200
FOR i = 1 TO 191
CIRCLE (160, 100), r, i
PAINT (160, 100), i, i
r = r - 1
'FOR n = 1 TO 9999
'NEXT n
LOCATE 1, 1
NEXT i
DO
LOOP WHILE INKEY$ = ""
RANDOMIZE TIMER
FOR i = 1 TO 4000
  x = RND * 251
  y = RND * 130
  GET (x, y)-(x + 60, y + 60), melt
  PUT (x, y + 1), melt, PSET
NEXT i

FOR i = 1 TO 4000
  x = RND * 251
  y = RND * 130
  GET (x, y)-(x + 60, y + 60), melt
  PUT (x + 1, y), melt, PSET
NEXT i

FOR i = 1 TO 4000
  x = RND * 251
  y = RND * 130
  GET (x, y)-(x + 60, y + 60), melt
  PUT (x + 1, y + 1), melt, PSET
NEXT i

DO
LOOP WHILE INKEY$ = ""
CLS
INPUT "INTERVAL (from 0 to 10):", n
CLS
0 t = 0
DO
t$ = STR$(t)
t = VAL(t$)
PSET (160, 100), i
d2$ = "ta" + t$ + "u1"
d$ = "ta" + t$ + "u75r75d75l75"
DRAW d$
x = POINT(0)
y = POINT(1)
LOCATE 1, 1
t = t + n
i = i + 1
IF i > 191 THEN i = 1
IF t > 360 THEN GOTO 0
LOOP WHILE INKEY$ = ""
CLS

INPUT "Please enter increment of radius:", r
CLS
FOR i = 0 TO 63 'Palette
  colour i, 64 - i, 64 - i, 32 - i'grau
  colour 32 + i, i + 32, 0, 0'rot
  colour i + 32, 32, i, i'rot-orange
NEXT
RADIUS = 5: i = 1
70 CIRCLE (160, 100), RADIUS, i, , , 5
80 RADIUS = RADIUS + r: i = i + 1
90 IF i < 191 THEN 100 ELSE i = 1
100 IF RADIUS > 700 THEN 110 ELSE 70
110 RADIUS = 5: i = 1
120 CIRCLE (160, 100), RADIUS, i, , , -.9
130 IF i < 191 THEN 140 ELSE i = 1
140 RADIUS = RADIUS + r: i = i + 1
150 IF RADIUS > 700 THEN 160 ELSE 120
151 LOCATE 20, 1
160
DO
LOOP WHILE INKEY$ = ""
RANDOMIZE TIMER
FOR m = 1 TO 320 STEP 2
LINE (m, 0)-(m, 200), 0
FOR j = 1 TO 5000
NEXT j
NEXT m

FOR m = 1 TO 200 STEP 2
LINE (0, m)-(320, m), 0
FOR j = 1 TO 5000
NEXT j
NEXT m

FOR m = 0 TO 320 STEP 2
LINE (m, 0)-(m, 200), 0
FOR j = 1 TO 5000
NEXT j
NEXT m
mos:

FOR i = 0 TO 63 'Palette
  colour i, 64 - i, 64 - i, 64 - i'grau
  colour 32 + i, i + 32, 0, 0'rot
  colour i + 32, 32, i, i'rot-orange
NEXT

z = 0
q = 0
i = 1
1 PSET (z, q), i
DRAW "u50d100u50l50r100"
z = z + 1
q = q + 1
i = i + 1
IF i > 191 THEN i = 1
FOR k = 1 TO 6000
NEXT k
IF z > 300 THEN GOTO lox:
GOTO 1

lox:

z = 320
q = 0
i = 1
5 PSET (z, q), i
DRAW "u50d100u50l50r100"
z = z - 1
q = q + 1
i = i + 1
IF i > 191 THEN i = 1
FOR k = 1 TO 6000
NEXT k
IF z < 0 THEN GOTO xlox:
GOTO 5
xlox:

z = 160
q = 0
i = 1
6 CIRCLE (z, q), 10, i
'z = z + 1
q = q + 1
i = i + 1
IF i > 191 THEN i = 1
FOR k = 1 TO 6000
NEXT k
IF q > 210 THEN GOTO nlox:
GOTO 6
nlox:

7 CIRCLE (z, q), r, i
PAINT (z, q), r, r
i = i + 1
IF i > 191 THEN i = 1
FOR k = 1 TO 6000
NEXT k
r = r - 1
IF r < 0 THEN GOTO mlox:
GOTO 7
mlox:

SUB colour (a, b, C, d)
OUT &H3C8, a
OUT &H3C9, b
OUT &H3C9, C
OUT &H3C9, d
END SUB

'------------------------------------------------------------------------------
SUB delay (tdelay!)
time1! = TIMER
DO
LOOP WHILE (TIMER - time1! < tdelay!) OR (time1! > TIMER)
END SUB

'------------------------------------------------------------------------------
FUNCTION GetBlasterAddr%
'Get Blaster Address and DMA channel from Environment Variable
tmp% = 0  'No Environment Variable Set...default
blast$ = UCASE$(ENVIRON$("BLASTER"))
IF LEN(blast$) THEN
   tmp% = INSTR(blast$, "A")
   tmp1$ = MID$(blast$, tmp% + 1, 3)
   tmp% = VAL("&H" + tmp1$)
   IF tmp% = 203 THEN tmp% = -1    'If there is no value assigned
   IF tmp% > 0 THEN
      tmp2% = INSTR(blast$, "D")
      dma% = VAL(MID$(blast$, tmp2% + 1))        'dma% is a global variable
      IF dma% < 0 OR dma% > 7 THEN tmp% = -2
   END IF
END IF
GetBlasterAddr% = tmp%
END FUNCTION

'------------------------------------------------------------------------------
SUB PlayBack (buffer$, size%, freq&, BytesPerSec&, chans%, num%)
size% = size% - 1
segment& = VARSEG(buffer$)
offset& = SADD(buffer$)
IF segment& < 0 THEN segment& = segment& + 65536
IF offset& < 0 THEN offset& = offset& + 65536
baseaddr& = segment& * 16 + offset&
look1% = VARPTR(baseaddr&)
look2% = VARPTR(size%)
SELECT CASE dma%
   CASE 0
      dmapage% = &H87   '135 decimal
      dmaaddr% = 0
      dmalen% = 1
   CASE 1
      dmapage% = &H83   '131 decimal
      dmaaddr% = 2
      dmalen% = 3
   CASE 2
      dmapage% = &H81
      dmaaddr% = 4
      dmalen% = 5
   CASE 3
      dmapage% = &H82
      dmaaddr% = 6
      dmalen% = 7
   CASE 4
      dmapage% = &H8F
      dmaaddr% = &HC0
      dmalen% = &HC2
   CASE 5
      dmapage% = &H8B
      dmaaddr% = &HC4
      dmalen% = &HC6
   CASE 6
      dmapage% = &H89
      dmaaddr% = &HC8
      dmalen% = &HCA
   CASE 7
      dmapage% = &H8A
      dmaaddr% = &HCC
      dmalen% = &HCE
END SELECT
SELECT CASE dma%
   CASE 0 TO 3
      dmamask% = &HA
      dmamode% = &HB
      dmaclear% = &HC
      dmastatus% = &H8
   CASE 4 TO 7
      dmamask% = &HD4
      dmamode% = &HD6
      dmaclear% = &HD8
      dmastatus% = &HD0
END SELECT
SELECT CASE dma%
   CASE 0, 4
      dmaterminal% = 1   'bit 0 of status register (&H08 or &HD0)
   CASE 1, 5
      dmaterminal% = 2   'bit 1
   CASE 2, 6
      dmaterminal% = 4   'bit 2
   CASE 3, 7
      dmaterminal% = 8   'bit 3
END SELECT

OUT dmamask%, dma% + 4   'mask the dma channel
OUT dmaclear%, &H0       '(clear the internal DMA flip/flop)
OUT dmamode%, 72 + dma%  '  72=010010XX where XX=dmachannel%
OUT dmaaddr%, PEEK(look1%)      'bits 0-7 of  the 20bit address
OUT dmaaddr%, PEEK(look1% + 1)  'bits 8-15 of the 20bit address
OUT dmapage%, PEEK(look1% + 2)  'bits 16-19 of the 20 bit address
OUT dmalen%, PEEK(look2%)       'bits 0-7 of size%
OUT dmalen%, PEEK(look2% + 1)   'bits 8-15  of size%
OUT dmamask%, dma%              'enable channel

IF num% = 1 THEN  'only need to Write out time constant once
   timeconst% = 256 - 1000000 / (freq& * chans%)
   CALL WriteToDSP(&H40)
   CALL WriteToDSP(timeconst%)
   'Reset Mixer    DSPmixeraddress = Blasteraddr% + &H4
   OUT BlasterAddr% + &H4, &H0
   OUT BlasterAddr% + &H4 + 1, 0
   'Set Volume to Maximum...255
   OUT BlasterAddr% + &H4, &H22
   OUT BlasterAddr% + &H4 + 1, 255
   IF chans% = 2 THEN
      'Set mixer to Stereo Output
      OUT BlasterAddr% + &H4, &HE
      OUT BlasterAddr% + &H4 + 1, 34      '34=2^5+2^1
   END IF
END IF
IF BytesPerSec& > 22000 THEN
   CALL WriteToDSP(&H48)   'Set Block Size
ELSE
   CALL WriteToDSP(&H14)   'DMA Mode 8-bit DAC
END IF
CALL WriteToDSP(PEEK(look2%))      'Lo byte of address
CALL WriteToDSP(PEEK(look2% + 1))  'High byte of address
IF BytesPerSec& > 22000 THEN CALL WriteToDSP(&H91)  'High Speed DMA mode 8-bit
dummy% = INP(dmastatus%)    'Read status byte once to make sure DMA is going.
WAIT dmastatus%, dmaterminal%   'Loop until terminal count bit set in DMA status register
 'DMA Transfer is Now Complete
'Acknowledge the DSP interrupt by reading the DATA AVAILABLE port once
dummy% = INP(BlasterAddr% + &HE)    'DSP Available address
END SUB

DEFSNG A-Z
SUB PlayWav (wavefile$)


repeats% = 1
BlasterAddr% = GetBlasterAddr%
SELECT CASE BlasterAddr%
   CASE -2
      PRINT "Bad DMA Channel specified!"
      END
   CASE -1
      PRINT "No Port Base Address Given!"
      END
   CASE 0
      PRINT "No BLASTER Environment Variable Set!"
      END
   CASE ELSE
      'Assume a valid Address Exists
'      PRINT "Blaster Address = "; HEX$(BlasterAddr%)
END SELECT
IF NOT SBreset% THEN
   PRINT "SoundBlaster Card Would Not Reset!"
   END
END IF

sp% = INSTR(Spec$, " ")
IF sp% THEN
   wavefile$ = LEFT$(Spec$, sp% - 1)
   repeats% = VAL(RIGHT$(Spec$, LEN(Spec$) - sp%))
   IF repeats% = 0 THEN repeats% = 1
ELSE
   IF LEN(Spec$) THEN
      wavefile$ = Spec$
      repeats% = 1
   END IF
END IF

IF LEN(wavefile$) = 0 THEN
END IF
'wavefile$ = "C:\QBASIC\THEME.WAV"
CALL ValidWavHeader(wavefile$, LenHeader%, WavLen&, Channels%, Sampling&, bytes&, ok%)

IF NOT ok% THEN
   PRINT "Bad Wave File Format"
   END
END IF

MaxBuffer% = 7053

CALL WriteToDSP(&HD1)  'Speaker ON
FOR repeat% = 1 TO repeats%    'This can loop to play the file ii% times]
filenum% = FREEFILE
   OPEN wavefile$ FOR BINARY AS filenum%
      num% = 0
      SEEK filenum%, LenHeader% + 1
      Remaining& = WavLen&
      DO
         num% = num% + 1
         IF Remaining& > MaxBuffer% THEN
            BufferLen% = MaxBuffer%
         ELSE
            BufferLen% = Remaining&
         END IF
         Remaining& = Remaining& - BufferLen%
         buffer$ = SPACE$(BufferLen%)
         GET filenum%, , buffer$
         CALL PlayBack(buffer$, BufferLen%, Sampling&, bytes&, Channels%, num%)
      LOOP WHILE Remaining& > 0
      OUT &H20, &H20   'Reset Normal Interrupt Service
   CLOSE filenum%
NEXT repeat%
CALL WriteToDSP(&HD3)  'Speaker OFF

END SUB

DEFINT A-Z
'------------------------------------------------------------------------------
FUNCTION SBreset%
'DSPreset% = address% + &H6
'DSPread% = address% + &HA
'DSPwrite% = address% + &HC
'DSPavail% = address% + &HE
'DSPmixer% = address% + &H4
OUT BlasterAddr% + &H6, 1   'Reset address
delay .1
OUT BlasterAddr% + &H6, 0
time1! = TIMER: noreset% = 0
DO
   'Read Data Available port until bit 7 is set
   'This should take about 100 micro seconds...give it 1 full second
   IF TIMER - time1! > 1! THEN noreset% = -1
LOOP UNTIL ((INP(BlasterAddr% + &HE) AND 128) = 128) OR noreset%
IF NOT noreset% THEN
   IF INP(BlasterAddr% + &HA) = &HAA THEN
      SBreset% = -1
   ELSE
      SBreset% = 0
   END IF
ELSE
   SBreset% = 0
END IF
END FUNCTION

'------------------------------------------------------------------------------
SUB ValidWavHeader (FILE$, LenHeader%, dataLen&, nChannels%, nSamplesPerSec&, nAvgBytesPerSec&, ok%)
rID$ = SPACE$(4)
wID$ = SPACE$(4)
fID$ = SPACE$(4)
dat$ = SPACE$(4)
dummy$ = SPACE$(1)

filenum% = FREEFILE
OPEN FILE$ FOR BINARY AS filenum%
  GET filenum%, , rID$
  GET filenum%, , rLen&
  GET filenum%, , wID$
  GET filenum%, , fID$
  GET filenum%, , fLen&
  GET filenum%, , wFormatTag%       '2 bytes
  GET filenum%, , nChannels%        '2 bytes
  GET filenum%, , nSamplesPerSec&   '4 bytes
  GET filenum%, , nAvgBytesPerSec&  '4 bytes
  GET filenum%, , nBlockAlign%      '2 bytes
  GET filenum%, , FormatSpecific%   '2 bytes
  'Read bytes until have read fLen& total bytes.
  'I have no idea what these next bytes are used for (if they even exist).
  FOR i% = 1 TO fLen& - 16          '16 bytes is what we have read in so far
     GET filenum%, , dummy$         'read in 1 byte at a time
  NEXT i%
  GET filenum%, , dat$
  IF UCASE$(dat$) = "FACT" THEN
     'funny format...
     GET filenum%, , dummy&
     GET filenum%, , dummy&
     GET filenum%, , dat$
  END IF
  GET filenum%, , dataLen&
  LenHeader% = LOC(1)
CLOSE filenum%
'  PRINT rID$;
'  PRINT rLen&;
'  PRINT wID$;
'  PRINT fID$;
'  PRINT fLen&;
'  PRINT wFormatTag%;       '2 bytes
'  PRINT nChannels%;        '2 bytes
'  PRINT nSamplesPerSec&;   '4 bytes
'  PRINT nAvgBytesPerSec&;  '4 bytes
'  PRINT nBlockAlign%;      '2 bytes
'  PRINT FormatSpecific%;   '2 bytes
'  PRINT dat$;
'  PRINT dataLen&;
'  PRINT LenHeader%
IF UCASE$(rID$) = "RIFF" THEN
   IF UCASE$(wID$) = "WAVE" THEN
      IF UCASE$(dat$) = "DATA" THEN
         IF UCASE$(fID$) = "FMT " THEN
           IF FormatSpecific% = 8 THEN ok% = -1
         END IF
      END IF
   END IF
END IF
END SUB

'------------------------------------------------------------------------------
SUB WriteToDSP (v%)
DO
LOOP UNTIL (INP(BlasterAddr% + &HC) AND 128) = 0
OUT BlasterAddr% + &HC, v%
END SUB

