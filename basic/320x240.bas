DECLARE SUB GetPixel (X%, Y%, Culler%, Page%)
'***
'Greetings, everyone. Here is code to put a VGA card into 320x240 mode
'with 256 colors and 3 pages. This should be a good layout for high
'quality graphics and animation. It has a 4:3 aspect ratio, so the pixels
'are square, and it has 20% more pixels than SCREEN 13 and multiple
'pages. All with 256 colors. Please try it out and send me your
'comments and bug reports. Thanks.

 DECLARE SUB XCLS (Page%)
 DECLARE SUB ShowPage (Page%)
 DECLARE SUB Set320x240mode ()
 DECLARE SUB XPRINT (X%, Y%, Text$, Culler%, Page%)
 DECLARE SUB PutPixel (X%, Y%, Culler%, Page%)
 DEFINT A-Z
 '$INCLUDE: 'QB.BI'

 DIM BitMask%(7)
 FOR Bit% = 0 TO 7: BitMask%(Bit%) = 2 ^ Bit%: NEXT
 Test$ = "The quick brown fox jumps over lazy dogs"
 CALL XPRINT(0, 0, "", 0, 0)   'initialize the print routine

 CALL Set320x240mode: SLEEP 1
 HMax% = 320: VMax% = 240: Pg% = 0
 FOR X% = 0 TO HMax% - 1
	 CALL PutPixel(X%, 0, 2, Pg%)
	 CALL PutPixel(X%, VMax% - 1, 2, Pg%)
 NEXT
 FOR Y% = 0 TO VMax% - 1
	 CALL PutPixel(0, Y%, 2, P%)
	 CALL PutPixel(HMax% - 1, Y%, 2, Pg%)
 NEXT
 CALL XPRINT(0, 0, "This is 320x240x256 mode, 3 pages", 15, P%)
 FOR Y% = 1 TO 14
	 CALL XPRINT(0, Y% * 16, Test$, Y%, Pg%)
 NEXT
 BEEP: A$ = INPUT$(1)
 CALL XCLS(0)
 CALL XPRINT(0, 0, "This is page 0", 1, 0)
 CALL XPRINT(0, 64, "Press 0, 1, or 2 to see the pages", 1, 0)
 CALL XPRINT(0, 80, "Press ESC to exit", 1, 0)
 CALL XPRINT(0, 16, "This is page 1", 2, 1)
 CALL XPRINT(0, 64, "Press 0, 1, or 2 to see the pages", 2, 1)
 CALL XPRINT(0, 80, "Press ESC to exit", 2, 1)
 CALL XPRINT(0, 32, "This is page 2", 4, 2)
 CALL XPRINT(0, 64, "Press 0, 1, or 2 to see the pages", 4, 2)
 CALL XPRINT(0, 80, "Press ESC to exit", 4, 2)
 A$ = "0"
 DO
 A$ = INPUT$(1)
 SELECT CASE A$
	 CASE "0": CALL ShowPage(0)
	 CASE "1": CALL ShowPage(1)
	 CASE "2": CALL ShowPage(2)
	 CASE CHR$(27): EXIT DO
	 CASE ELSE: BEEP
 END SELECT
 LOOP
 SCREEN 13: SCREEN 0: WIDTH 80
 END

 SUB GetPixel (X%, Y%, Culler%, Page%)
 SELECT CASE Page%
	 CASE 0: VidSegment% = &HA000
	 CASE 1: VidSegment% = &HA4F0
	 CASE 2: VidSegment% = &HA9E0
	 CASE ELSE: ERROR 5
 END SELECT
 OUT &H3CE, 4: OUT &H3CF, X% AND 3
 DEF SEG = VidSegment%
 Culler% = PEEK((Y% * 80) + (X% \ 4))
 END SUB

 SUB PutPixel (X%, Y%, Culler%, Page%)
 SHARED BitMask%()
 SELECT CASE Page%
	 CASE 0: VidSegment% = &HA000
	 CASE 1: VidSegment% = &HA4F0
	 CASE 2: VidSegment% = &HA9E0
	 CASE ELSE: ERROR 5
 END SELECT
 OUT &H3C4, 2: OUT &H3C5, BitMask%(X% AND 3)
 DEF SEG = VidSegment%
 POKE (Y% * 80) + (X% \ 4), Culler%
 END SUB

 SUB Set320x240mode
 'begin with standard 320x200x256 mode
 SCREEN 13
 'disable "chain4" mode
 OUT &H3C4, &H4: OUT &H3C5, &H6
 'enable writes to all four planes
 OUT &H3C4, &H2: OUT &H3C5, &HF
 'clear video memory
 CLS
 'synchronous reset while switching clocks
 OUT &H3C4, 0: OUT &H3C5, &H1
 'select 25 Mhz dot clock and 60 hz scanning rate
 OUT &H3C2, &HE3
 'restart the sequencer
 OUT &H3C4, 0: OUT &H3C5, &H3
 'to reprogram the CRT controller,
 'remove write protect from the registers
 OUT &H3D4, &H11: OUT &H3D5, INP(&H3D5) AND &H7F
 OUT &H3D4, &H6: OUT &H3D5, &HD     'total vertical pixels
 OUT &H3D4, &H7: OUT &H3D5, &H3E    'overflow
 OUT &H3D4, &H9: OUT &H3D5, &H41    'turn off double double-scan
 OUT &H3D4, &H10: OUT &H3D5, &HEA   'vertical sync start
 OUT &H3D4, &H11: OUT &H3D5, &HAC   'vertical sync end, reprotect registers
 OUT &H3D4, &H12: OUT &H3D5, &HDF   'vertical pixels displayed
 OUT &H3D4, &H14: OUT &H3D5, 0      'turn off dword mode
 OUT &H3D4, &H15: OUT &H3D5, &HE7   'vertical blank start
 OUT &H3D4, &H16: OUT &H3D5, &H6    'vertical blank end
 OUT &H3D4, &H17: OUT &H3D5, &HE3   'turn on byte mode
 END SUB

 SUB ShowPage (Page%)
 SELECT CASE Page%
	 CASE 0: OUT &H3D4, &HC: OUT &H3D5, 0
	 CASE 1: OUT &H3D4, &HC: OUT &H3D5, &H4F
	 CASE 2: OUT &H3D4, &HC: OUT &H3D5, &H9E
	 CASE ELSE: ERROR 5          'illegal function call
 END SELECT
 END SUB

 SUB XCLS (Page%)
 SELECT CASE Page%
	 CASE 0: VidSegment% = &HA000
	 CASE 1: VidSegment% = &HA4F0
	 CASE 2: VidSegment% = &HA9E0
	 CASE ELSE: ERROR 5
 END SELECT
 OUT &H3C4, &H2: OUT &H3C5, &HF
 DEF SEG = VidSegment%
 FOR Address% = 0 TO 19199: POKE Address%, 0: NEXT
 END SUB

 SUB XPRINT (X%, Y%, Text$, Culler%, Page%)
 STATIC HiNibble%(), LoNibble%()
 IF LEN(Text$) GOTO StartXPRINT
 REDIM HiNibble%(255, 15), LoNibble%(255, 15)
 REDIM BitMask%(15)
 BitMask%(0) = 0:  BitMask%(1) = 8:   BitMask%(2) = 4
 BitMask%(3) = 12: BitMask%(4) = 2:   BitMask%(5) = 10
 BitMask%(6) = 6:  BitMask%(7) = 14:  BitMask%(8) = 1
 BitMask%(9) = 9:  BitMask%(10) = 5:  BitMask%(11) = 13
 BitMask%(12) = 3: BitMask%(13) = 11: BitMask%(14) = 7
 BitMask%(15) = 15
 DIM Regs AS RegTypeX
 Regs.AX = &H1130
 Regs.BX = &H600
 CALL InterruptX(&H10, Regs, Regs)
 CharSegment% = Regs.ES: CharOffset% = Regs.BP
 DEF SEG = CharSegment%
 FOR Char% = 0 TO 255
	 FOR Ln% = 0 TO 15
		 BitPattern% = PEEK(CharOffset%)
		 HiNibble%(Char%, Ln%) = BitMask%(BitPattern% \ 16)
		 LoNibble%(Char%, Ln%) = BitMask%(BitPattern% AND 15)
		 CharOffset% = CharOffset% + 1
	 NEXT
 NEXT
 ERASE BitMask%

StartXPRINT:
 SELECT CASE Page%
	 CASE 0: VidSegment% = &HA000
	 CASE 1: VidSegment% = &HA4F0
	 CASE 2: VidSegment% = &HA9E0
	 CASE ELSE: ERROR 5
 END SELECT
 OUT &H3C4, 2
 DEF SEG = VidSegment%
 VidPtr% = (Y% * 80) + (X% \ 4)
 FOR Ptr% = 1 TO LEN(Text$)
	 Char% = ASC(MID$(Text$, Ptr%, 1))
	 VidOffset% = VidPtr%
	 FOR Ln% = 0 TO 15
		 OUT &H3C5, HiNibble%(Char%, Ln%)
		 POKE VidOffset%, Culler%
		 OUT &H3C5, LoNibble%(Char%, Ln%)
		 POKE VidOffset% + 1, Culler%
		 VidOffset% = VidOffset% + 80
	 NEXT
	 VidPtr% = VidPtr% + 2
 NEXT
 END SUB

