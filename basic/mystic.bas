'****************************** Start of program ****************************

'*** Make all unsigned variables integers
	DEFINT A-Z

'*** Declare the subs
	DECLARE FUNCTION GenNumber% (MinNum%, MaxNum%)
	DECLARE FUNCTION NewSpeed! ()
	DECLARE SUB PalRotate (MinCol%, MaxCol%, PalRotatePal$)

'*** Clear the screen
	CLS

'*** Ask user if setup should be ran
	INPUT "Setup? ", Setup$

'*** If user wants to do setup, then let him
	IF UCASE$(LEFT$(Setup$, 1)) = "Y" THEN
		PRINT "When you're inside the program, press:"
		PRINT "O/o - increase/decrease objects"
		PRINT "T/t - increase/decrease trails"
		PRINT "P/p - increase/decrease positions"
		PRINT "+/- - increase/decrease delay (used to slow down program)"
		PRINT "S/s - show/hide status bar"
		PRINT
		INPUT "Objects [2]        - ", Objects%
		INPUT "Trails [5]         - ", Trails%
		INPUT "Positions [4]      - ", Positions%
		INPUT "Minimum color [0]  - ", MnColor%
		INPUT "Maximum color [63] - ", MxColor%
		INPUT "Color loops [4]    - ", CLoops%
		END IF

'*** Set up the random number generator
	RANDOMIZE TIMER

'*** If nothing was entered for these, then set them to defaults
	IF Objects% = 0 THEN Objects% = 2
	IF Trails% = 0 THEN Trails% = 5
	IF Positions% = 0 THEN Positions% = 4
	IF MxColor% < MnColor% THEN SWAP MnColor%, MxColor%
	IF MxColor% = 0 THEN MxColor% = 63
	IF CLoops% = 0 THEN CLoops% = 4
	IF UCASE$(LEFT$(Setup$, 1)) = "Y" THEN ShwSts% = 1

'*** Declare all the variables used in making the program
	DIM XCords#(Objects% * Trails% * Positions%)
	DIM YCords#(Objects% * Trails% * Positions%)
	DIM XSpeed#(Objects% * Trails% * Positions%)
	DIM YSpeed#(Objects% * Trails% * Positions%)
	DIM OldXCords#(Objects% * Trails% * Positions%)
	DIM OldYCords#(Objects% * Trails% * Positions%)
	DIM MaxColor%(Objects%)
	DIM MinColor%(Objects%)
	DIM RedChange%(Objects%)
	DIM GreenChange%(Objects%)
	DIM BlueChange%(Objects%)
	DIM RedCycle%(Objects%)
	DIM GreenCycle%(Objects%)
	DIM BlueCycle%(Objects%)

'****************************** Restart loop ********************************

'*** This is where the program goes if something is changed
Restart:

'*** Turn graphics mode on and clear the screen again
	SCREEN 12
	CLS

'*** Make sure some values are valid
	IF Objects% < 1 THEN Objects% = 1
	IF Trails% < 1 THEN Trails% = 1
	IF Positions% < 1 THEN Positions% = 1

'*** Declare all variables again in case something was changed
	REDIM XCords#(Objects% * Trails% * Positions%)
	REDIM YCords#(Objects% * Trails% * Positions%)
	REDIM XSpeed#(Objects% * Trails% * Positions%)
	REDIM YSpeed#(Objects% * Trails% * Positions%)
	REDIM OldXCords#(Objects% * Trails% * Positions%)
	REDIM OldYCords#(Objects% * Trails% * Positions%)
	REDIM MaxColor%(Objects%)
	REDIM MinColor%(Objects%)
	REDIM RedChange%(Objects%)
	REDIM GreenChange%(Objects%)
	REDIM BlueChange%(Objects%)
	REDIM RedCycle%(Objects%)
	REDIM GreenCycle%(Objects%)
	REDIM BlueCycle%(Objects%)

'*************************** Start of startup cycle *************************

'*** Reset the palette to all black
	Pal$ = STRING$(48, CHR$(0))

'*** Set the starting values for the points
	FOR A = 1 TO Objects%
		FOR B = 1 TO Trails%
			FOR C = 1 TO Positions%

				Temp% = (A - 1) * (Trails% * Positions%) + (B - 1) * Positions% + C
				Temp2% = (A - 1) * (Trails% * Positions%) + (B - 2) * Positions% + C

				IF B = 1 THEN
		XSpeed#(Temp%) = NewSpeed! * SGN(RND - .5)
		YSpeed#(Temp%) = NewSpeed! * SGN(RND - .5)
				ELSE
		XSpeed#(Temp%) = XSpeed#(Temp2%)
		YSpeed#(Temp%) = YSpeed#(Temp2%)
					END IF

				IF B = 1 THEN
		XCords#(Temp%) = RND * 640
		YCords#(Temp%) = RND * 480
				ELSE
		XCords#(Temp%) = XCords#(Temp2%) - XSpeed#(Temp%)
		YCords#(Temp%) = YCords#(Temp2%) - YSpeed#(Temp%)
					END IF
			NEXT C
		NEXT B
	NEXT A

'*** Set the old coords to the new coords
	FOR I = 1 TO Objects% * Trails% * Positions%
		OldXCords#(I) = XCords#(I)
		OldYCords#(I) = YCords#(I)
	NEXT I

'*** Set the color arrays
	FOR I% = 1 TO Objects%
		MaxColor%(I%) = MxColor%
		MinColor%(I%) = MnColor%
	NEXT I%

'*** Set the colors
	FOR I% = 1 TO Objects%
		DO
			RedCycle%(I%) = GenNumber%(MinColor%(I%), MaxColor%(I%))
			GreenCycle%(I%) = GenNumber%(MinColor%(I%), MaxColor%(I%))
			BlueCycle%(I%) = GenNumber%(MinColor%(I%), MaxColor%(I%))
		 
			Temp1% = SGN(RND - .5)
			Temp2% = SGN(RND - .5)
			Temp3% = SGN(RND - .5)
		 
			IF Temp1% <> Temp2% AND Temp2% <> Temp3% THEN
				RedChange%(I%) = Temp1%
				GreenChange%(I%) = Temp2%
				BlueChange%(I%) = Temp3%
				EXIT DO
				END IF
		LOOP
	NEXT I%
'************************* End of startup cycle *****************************
'************************** Start of main loop ******************************
	DO

	'*** Erase the status bar if it was changed to off
		IF ShwSts% = 0 AND Old2% = 1 THEN
			LINE (2, 422)-(639, 477), 0, BF
			Old2% = 0
			END IF

	'*** Show status bar if it is on
		IF ShwSts% = 1 THEN
			IF Old1& > DelayTime& THEN LINE (2, 467)-(639, 477), 0, BF
			Old1& = DelayTime&
			FOR I% = 1 TO Objects%
				LINE (I% * 5 - 3, 422)-(I% * 5, 432), 1, BF
			NEXT I%
			FOR I% = 1 TO Trails%
				LINE (I% * 5 - 3, 437)-(I% * 5, 447), 1, BF
			NEXT I%
			FOR I% = 1 TO Positions%
				LINE (I% * 5 - 3, 452)-(I% * 5, 462), 1, BF
			NEXT I%
			FOR I% = 1 TO DelayTime& / 500
				LINE (I% * 2, 467)-(I% * 2, 477), 1
			NEXT I%
			Old2% = 1
			END IF
	 
	'*** Run a delay to slow down the program
		FOR I& = 1 TO DelayTime&: NEXT I&
	 
	'*** Make old copies of these to check if they have been changed
		Temp1% = Objects%
		Temp2% = Trails%
		Temp3% = Positions%
	 
	'*** Gets the last key pressed
		Hi$ = ""
		DO
			Temp$ = INKEY$
			IF Temp$ > "" THEN Hi$ = Temp$
		LOOP UNTIL Temp$ = ""

	'*** If a key was pressed, then change the corresponding value
		IF Hi$ = "O" THEN Objects% = Objects% + 1
		IF Hi$ = "o" THEN Objects% = Objects% - 1
		IF Hi$ = "T" THEN Trails% = Trails% + 1
		IF Hi$ = "t" THEN Trails% = Trails% - 1
		IF Hi$ = "P" THEN Positions% = Positions% + 1
		IF Hi$ = "p" THEN Positions% = Positions% - 1
		IF Hi$ = "+" THEN DelayTime& = DelayTime& + 500
		IF Hi$ = "-" THEN DelayTime& = DelayTime& - 500
		IF Hi$ = "S" THEN ShwSts% = 1
		IF Hi$ = "s" THEN ShwSts% = 0
		IF DelayTime& < 0 THEN DelayTime& = 0
	 
	'*** If a major attribute was changed, then restart
		IF Temp1% <> Objects% OR Temp2% <> Trails% OR Temp3% <> Positions% THEN GOTO Restart
	 
	'*** This is the movement loop
		FOR A = 1 TO Objects%
			FOR B = 1 TO Trails%
				FOR C = 1 TO Positions%
					Temp% = (A - 1) * (Trails% * Positions%) + (B - 1) * Positions% + C
					Temp2% = (A - 1) * (Trails% * Positions%) + (B - 1) * Positions% + C + 1: IF C = Positions% THEN Temp2% = Temp2% - Positions%
					Temp3% = A
					IF B = Trails% THEN LINE (OldXCords#(Temp%), OldYCords#(Temp%))-(OldXCords#(Temp2%), OldYCords#(Temp2%)), 0
					LINE (XCords#(Temp%), YCords#(Temp%))-(XCords#(Temp2%), YCords#(Temp2%)), Temp3%
				NEXT C
			NEXT B
		NEXT A

	'*** Sets old coords to new coords
		FOR A = 1 TO Objects%
			FOR B = 1 TO Trails%
				FOR C = 1 TO Positions%
					Temp% = (A - 1) * (Trails% * Positions%) + (B - 1) * Positions% + C
					OldXCords#(Temp%) = XCords#(Temp%)
					OldYCords#(Temp%) = YCords#(Temp%)
				NEXT C
			NEXT B
		NEXT A

		FOR A = 1 TO Objects%
			FOR B = 1 TO Trails%
				FOR C = 1 TO Positions%
					Temp% = (A - 1) * (Trails% * Positions%) + (B - 1) * Positions% + C
					Temp2% = (A - 1) * (Trails% * Positions%) + (B - 2) * Positions% + C

					IF XCords#(Temp%) + XSpeed#(Temp%) > 639 THEN
						IF B = 1 THEN XSpeed#(Temp%) = NewSpeed! * -1 ELSE XSpeed#(Temp%) = XSpeed#(Temp2%)
						END IF
					IF YCords#(Temp%) + YSpeed#(Temp%) > 479 THEN
						IF B = 1 THEN YSpeed#(Temp%) = NewSpeed! * -1 ELSE YSpeed#(Temp%) = YSpeed#(Temp2%)
						END IF
					IF XCords#(Temp%) + XSpeed#(Temp%) < 0 THEN
						IF B = 1 THEN XSpeed#(Temp%) = NewSpeed! ELSE XSpeed#(Temp%) = XSpeed#(Temp2%)
						END IF
					IF YCords#(Temp%) + YSpeed#(Temp%) < 0 THEN
						IF B = 1 THEN YSpeed#(Temp%) = NewSpeed! ELSE YSpeed#(Temp%) = YSpeed#(Temp2%)
						END IF

					XCords#(Temp%) = XCords#(Temp%) + XSpeed#(Temp%)
					YCords#(Temp%) = YCords#(Temp%) + YSpeed#(Temp%)
				NEXT C
			NEXT B
		NEXT A

	'*** Start of color changing loop

		Time% = Time% + 1

		FOR I% = 1 TO Objects%
			IF Time% = CLoops% THEN
				IF I% = Objects% THEN Time% = 0
				RedCycle%(I%) = RedCycle%(I%) + RedChange%(I%)
				GreenCycle%(I%) = GreenCycle%(I%) + GreenChange%(I%)
				BlueCycle%(I%) = BlueCycle%(I%) + BlueChange%(I%)
			 
				IF RedCycle%(I%) < MinColor(I%) THEN RedCycle%(I%) = MinColor%(I%)
				IF GreenCycle%(I%) < MinColor(I%) THEN GreenCycle%(I%) = MinColor%(I%)
				IF BlueCycle%(I%) < MinColor(I%) THEN BlueCycle%(I%) = MinColor%(I%)
			 
				IF RedCycle%(I%) > MaxColor(I%) THEN RedCycle%(I%) = MaxColor%(I%)
				IF GreenCycle%(I%) > MaxColor(I%) THEN GreenCycle%(I%) = MaxColor%(I%)
				IF BlueCycle%(I%) > MaxColor(I%) THEN BlueCycle%(I%) = MaxColor%(I%)
				END IF
			IF RedCycle%(I%) = MinColor%(I%) OR RedCycle%(I%) = MaxColor%(I%) THEN
				IF GreenCycle%(I%) = MinColor%(I%) OR GreenCycle%(I%) = MaxColor%(I%) THEN
					IF BlueCycle%(I%) = MinColor%(I%) OR BlueCycle%(I%) = MaxColor%(I%) THEN
						DO
							Done% = 1
							IF RedCycle%(I%) = MinColor%(I%) THEN Temp1% = -1 ELSE Temp1% = 0
							IF GreenCycle%(I%) = MinColor%(I%) THEN Temp2% = -1 ELSE Temp2% = 0
							IF BlueCycle%(I%) = MinColor%(I%) THEN Temp3% = -1 ELSE Temp3% = 0
							
							Temp1% = SGN(INT(RND * 2 - 1) - Temp1%)
							Temp2% = SGN(INT(RND * 2 - 1) - Temp2%)
							Temp3% = SGN(INT(RND * 2 - 1) - Temp3%)
							IF Temp1% <> Temp2% AND Temp2% <> Temp3% THEN Done% = 0
							RedChange%(I%) = Temp1%
							GreenChange%(I%) = Temp2%
							BlueChange%(I%) = Temp3%
							IF RedCycle%(I%) = MinColor%(I%) THEN Tem1% = 1 ELSE Tem1% = 0
							IF GreenCycle%(I%) = MinColor%(I%) THEN Tem2% = 1 ELSE Tem2% = 0
							IF BlueCycle%(I%) = MinColor%(I%) THEN Tem3% = 1 ELSE Tem3% = 0
						 
		'*** Check to make sure next color won't be black
							IF Tem1% = 0 AND Tem2% = 0 AND Tem3% = 0 THEN Done% = 0
							IF Tem1% = 0 AND Tem2% = 0 AND Tem3% = 1 AND Temp1% = -1 AND Temp2% = -1 AND Temp3% = 0 THEN Done% = 0
							IF Tem1% = 0 AND Tem2% = 1 AND Tem3% = 0 AND Temp1% = -1 AND Temp2% = 0 AND Temp3% = -1 THEN Done% = 0
							IF Tem1% = 0 AND Tem2% = 1 AND Tem3% = 1 AND Temp1% = -1 AND Temp2% = 0 AND Temp3% = 0 THEN Done% = 0
							IF Tem1% = 1 AND Tem2% = 0 AND Tem3% = 0 AND Temp1% = 0 AND Temp2% = -1 AND Temp3% = -1 THEN Done% = 0
							IF Tem1% = 1 AND Tem2% = 0 AND Tem3% = 1 AND Temp1% = 0 AND Temp2% = -1 AND Temp3% = 0 THEN Done% = 0
							IF Tem1% = 1 AND Tem2% = 1 AND Tem3% = 0 AND Temp1% = 0 AND Temp2% = 0 AND Temp3% = -1 THEN Done% = 0
	 
		'*** Check to make sure next color won't be white
							IF Tem1% = 1 AND Tem2% = 1 AND Tem3% = 1 THEN Done% = 0
							IF Tem1% = 0 AND Tem2% = 0 AND Tem3% = 1 AND Temp1% = 0 AND Temp2% = 0 AND Temp3% = 1 THEN Done% = 0
							IF Tem1% = 0 AND Tem2% = 1 AND Tem3% = 0 AND Temp1% = 0 AND Temp2% = 1 AND Temp3% = 0 THEN Done% = 0
							IF Tem1% = 0 AND Tem2% = 1 AND Tem3% = 1 AND Temp1% = 0 AND Temp2% = 1 AND Temp3% = 1 THEN Done% = 0
							IF Tem1% = 1 AND Tem2% = 0 AND Tem3% = 0 AND Temp1% = 1 AND Temp2% = 0 AND Temp3% = 0 THEN Done% = 0
							IF Tem1% = 1 AND Tem2% = 0 AND Tem3% = 1 AND Temp1% = 1 AND Temp2% = 0 AND Temp3% = 1 THEN Done% = 0
							IF Tem1% = 1 AND Tem2% = 1 AND Tem3% = 0 AND Temp1% = 1 AND Temp2% = 1 AND Temp3% = 0 THEN Done% = 0
					 
						LOOP UNTIL Done% = 1
						END IF
					END IF
				END IF

		NEXT I%

	'*** Make the new palette
		FOR I% = 1 TO Objects%
			MID$(Pal$, I% * 3 + 1) = CHR$(RedCycle%(I%)) + CHR$(GreenCycle%(I%)) + CHR$(BlueCycle%(I%))
		NEXT I%

	'*** Change the palette on the screen to the new palette if changed
		IF OldPal$ <> Pal$ THEN
			CALL PalRotate(1, Objects%, Pal$)
			OldPal$ = Pal$
			END IF

'*** Exit loop if Esc key was pressed
	LOOP UNTIL Hi$ = CHR$(27)

'*** End the program
	END

FUNCTION GenNumber% (MinNum%, MaxNum%)
 
	GenNumber% = INT(RND * (MaxNum% - MinNum% + 1)) + MinNum%

END FUNCTION

FUNCTION NewSpeed!

	NewSpeed! = RND * 3 + 4

END FUNCTION

SUB PalRotate (MinCol%, MaxCol%, PalRotatePal$)

	DEF SEG = &HA000

	Temp$ = LEFT$(PalRotatePal$, MinCol% * 3)

	Temp2$ = MID$(PalRotatePal$, MinCol% * 3 + 1, (MaxCol% - MinCol% + 1) * 3)
	Temp2$ = RIGHT$(Temp2$, Shift% * 3) + LEFT$(Temp2$, ((MaxCol% - MinCol% + 1) * 3) - (Shift% * 3))

	Temp3$ = RIGHT$(PalRotatePal$, (15 - MaxCol%) * 3)
	PalRotatePal$ = Temp$ + Temp2$ + Temp3$
	OUT &H3C7, 0: OUT &H3C8, 0
	FOR I = 1 TO 48: OUT &H3C9, ASC(MID$(PalRotatePal$, I, 1)): NEXT I

END SUB

