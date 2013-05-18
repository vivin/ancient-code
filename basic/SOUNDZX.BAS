DECLARE SUB PlayWav (wavefile$)
DECLARE SUB ValidWavHeader (FILE$, LenHeader%, dataLen&, nChannels%, nSamplesPerSec&, nAvgBytesPerSec&, ok%)
DECLARE SUB WriteToDSP (v%)
DECLARE SUB PlayBack (buffer$, size%, freq&, BytesPerSec&, chans%, num%)
DECLARE SUB delay (tdelay!)
DECLARE FUNCTION GetBlasterAddr% ()
DECLARE FUNCTION SBreset% ()
COMMON SHARED BlasterAddr%, dma%, repeats%
CLS
PRINT "We have these song clips right now. Choose any"
PRINT
PRINT "1. Where do you go? - No Mercy"
PRINT "2. Mysterious girl - Peter Andr‚"
PRINT "3. Macarena - Los Del Rio"
PRINT "4. Words - Boyzone"
PRINT "5. Aicha - Khaled"
PRINT "6. 2 become 1 - Spice Girls"
PRINT "7. Everybody - Backstreet Boys"

CheckEvents:
y$ = INKEY$
IF y$ = "1" THEN PlayWav "where.wav"
IF y$ = "2" THEN PlayWav "myst.wav"
IF y$ = "3" THEN PlayWav "macarena.wav"
IF y$ = "4" THEN PlayWav "words.wav"
IF y$ = "5" THEN PlayWav "aicha.wav"
IF y$ = "6" THEN PlayWav "2b1.wav" ELSE GOTO CheckEvents

DEFINT A-Z
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
   OUT BlasterAddr% + &H4 + 1, 1
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

