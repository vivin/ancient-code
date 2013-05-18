'[--------------- PRODUCT OF >>>>>>> MAVERICK PROGRAMMING ---------------]
' [.................... Sphere Fighter, Version 1.7 ....................]
'     [............... *NOT RECOMMENDED FOR WINDOWS* ...............]
'                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~
' Requirements:
'  1. 10k free memory (WOW, that's a lot!) ***SEE <FILE NOTES>  ***
'  2. VGA or MCGA adapter (SCREEN 13)
'  3. Mouse (one button only)
'  4. uses Sound Card for SFX and MUSIC!!
'  5. 386 PC or higher recommended
'     a. To adjust Computer's speed, use > (slow game down), or < (faster)
'  6. *WARNING*  This program pushes computer memory to the limit...
'
' -------------
' Controls: Number Pad/NUM LOCK OFF
'   PUNCH...8                   JUMP LEFT/RIGHT...7 / 9
'   KICK...2                    DUCK...1
'   SLIDE LEFT/RIGHT...4 / 6
'   THROW...ENTER When NOT right next to opponent (or you'll miss)
'   CHARGE...3, When a large distance between fighters (about 95 pixels)
'   PAUSE...P or p
'   UNPAUSE...X or x
'   ESC...End the game
' -------------
' Menus...
'  When Selecting Music, type 1-3 for music, 0 for no music.
'  Use mouse if it is shown; if not, use keyboard.
'
' File Notes....
'  This program makes...
'    Seven (7) instrument files each about 62 bytes each
'    Three (3) music files each averaging 700 bytes each
'  This program needs...
'    To be booted from same prompt as directory this file is in
'    The above files
'    Two files that contain fighter data...FIG1.DAT & FIG2.DAT
'  This program takes...
'    On my PC, almost 1 minute on the loading animation, etc... screen
'  This programmer...
'    Didn't feel like trying to work out a full code for if which fighter
'      was on which side <or making a title screen, or 2 player code...>
'    Needs PKZIP...if anyone wants to send me it...I would be grateful.
'   ** Can't stand black boxes around figures...DAM_!!!!!
'    Got real bored over his Christmas vacation...OK, so only four days of it.
'   ** HATES "out of memory" messages.
'    'Remarked' major portions of the CODE for better understanding
'
'-- MIKE HULME, MP...Questions, Comments, Problems, ERROR messages...RVFH11A
'
'  p.s. 1. DO NOT use code without ASKING FIRST...WE'LL TALK ABOUT IT THEN.
'       2. Tetris-type games only, huh?!?!?
'       3. Welcome to the future of 3d BASIC gaming.  How would you work
'          rotation into this!?!?!?!?  Any thoughts, EMAIL me.
'       4. ADVICE: When programming...DO NOT MIX ADVIL & COUGH SYRUP!!! WHOA!!
'
DECLARE SUB Font (a$, X%, Y%, stepX%, stepY%, CO%, Bkgd%, Shadow%)
DECLARE SUB Paus (PMS) : DECLARE SUB SBNextNote ()
DECLARE SUB SbVoiceFile (a$, B$, C$, D$)
DECLARE SUB LOADSBM (SONG$) : DECLARE SUB DELAY (sbDT!)
DECLARE SUB SbSendInfo (voice!, frequency!, octave!)
DECLARE SUB SbStopNote (voice%)
DECLARE SUB SBSTOP () : DECLARE SUB SBPLAYNOTE ()
DECLARE SUB SBSEQUENCE () : DECLARE SUB MAKESBM (sbmfl$, instd$)
DECLARE SUB SBPLAY (sbp$) : DECLARE SUB SbOutPort (port!, info%)
DECLARE SUB SBINIT () : DECLARE SUB SETINSTRUMENT (voice%, dat%())
DECLARE SUB MAKESBI (sbifl$, instrudata%()) : DECLARE SUB Bang2 ()
DECLARE SUB MouseRange (X1%, Y1%, X2%, Y2%)
DECLARE SUB Intro2 () : DECLARE SUB Credits ()
DECLARE SUB ZeroCol () : DECLARE SUB SoundOff ()
DECLARE SUB sounds () : DECLARE SUB Checksnd (ADLIB%)
DECLARE SUB Quiet () : DECLARE SUB Bang1 ()
DECLARE SUB Head2Off () : DECLARE SUB HeadOff ()
DECLARE SUB Intro () : DECLARE SUB MavPro ()
DECLARE SUB LodeFighters () : DECLARE SUB Arena ()
DECLARE SUB XolorInit () : DECLARE SUB MouseHide ()
DECLARE SUB MouseDriver (ax%, BX%, cx%, dx%)
DECLARE SUB MouseShow () : DECLARE FUNCTION MouseInit% ()
DECLARE SUB MouseStatus (Lb%, Rb%, xm%, ym%)
COMMON SHARED Insdat0%(), Insdat1%(), Insdat2%(), Insdat3%()
COMMON SHARED note()   AS INTEGER, sblasttime!
COMMON SHARED SONGLEN AS INTEGER, SONGPOS AS INTEGER, SONGDELAY AS SINGLE
COMMON SHARED snd(), oct(), NOTECODE() AS LONG, SETOCTAVE AS INTEGER
COMMON SHARED MUSICBACK AS INTEGER, MREPEAT AS INTEGER, SETLENGTH AS INTEGER, SETCHANNEL AS INTEGER
COMMON SHARED STEELDRUMS()   AS INTEGER
COMMON SHARED CHIMES()   AS INTEGER
COMMON SHARED ChurchBell()   AS INTEGER
COMMON SHARED FUNKBASS()   AS INTEGER
COMMON SHARED SNAREDRUM()   AS INTEGER
COMMON SHARED PERCUSSION()   AS INTEGER
COMMON SHARED BASSGUITAR()   AS INTEGER
COMMON SHARED SbNull()   AS INTEGER
DIM Insdat0%(12), Insdat1%(12), Insdat2%(12), Insdat3%(12)
DIM note(12) AS INTEGER
DIM snd(0 TO 3, 200), oct(0 TO 3, 200), NOTECODE(0 TO 3, 200) AS LONG
DIM STEELDRUMS(12) AS INTEGER     'Instrument #1
DIM CHIMES(12) AS INTEGER         'Instrument #2
DIM ChurchBell(12) AS INTEGER     'Instrument #3
DIM FUNKBASS(12) AS INTEGER       'Instrument #4
DIM SNAREDRUM(12) AS INTEGER      'Instrument #5
DIM PERCUSSION(12) AS INTEGER     'Instrument #6
DIM BASSGUITAR(12) AS INTEGER     'Instrument #7
DIM SbNull(12) AS INTEGER         'No Instrument
DIM SHARED A1%(2890), A2%(2890)   'stance pictures
DIM SHARED B1%(2890), B2%(2890)   'punch pictures
DIM SHARED C1%(2890), C2%(2890)   'kick pics.
DIM SHARED D1%(2890), D2%(2890)   'winner pics.
DIM SHARED E1%(1400), E2%(1400)   'roll frame #1 / duck pics.
DIM SHARED F1%(1400), F2%(1400)   'roll frame #2 pics.
DIM SHARED G1%(2890), G2%(2890)   'upper-cut pics.
DIM SHARED W1%(500), W2%(500)     'that thing that gets thrown pics.
DIM SHARED X, X2, Dmg, Dmg2, Cag, ComputerSpeed, Musc 'fighter positions/damage/Computer aggressiveness/speed, music?
DIM SHARED Xol1, Xol2, NN$, NN2$  'colors & names
DIM SHARED a$(15)                 'for SFX
DIM SHARED Mouse$                 'duh
DIM SHARED aa AS INTEGER          'for SFX
DIM A7 AS INTEGER                 'for SFX
DIM A11 AS INTEGER                'for SFX
DIM A9 AS INTEGER                 'for SFX
Mouse$ = SPACE$(57)               'Mouse junk....
FOR I% = 1 TO 57
  READ a$
  H$ = CHR$(VAL("&H" + a$))
  MID$(Mouse$, I%, 1) = H$
NEXT I%
DATA 55,89,E5,8B,5E,0C,8B,07,50,8B,5E,0A,8B,07,50,8B
DATA 5E,08,8B,0F,8B,5E,06,8B,17,5B,58,1E,07,CD,33,53
DATA 8B,5E,0C,89,07,58,8B,5E,0A,89,07,8B,5E,08,89,0F
DATA 8B,5E,06,89,17,5D,CA,08,00
MavPro                            'Maverick Intro
Intro                             'Intro Screen 1
ZeroCol                           'All colors turn Black
CLS
XolorInit                         'Init. colors for
Intro2                            '  Intro Screen 2
ZeroCol                           'All colors turn Black
COLOR 15
CLS : LOCATE 19, 1: PRINT "Loading Animation...": LodeFighters
LOCATE 20, 1: PRINT "Initializing Colors...": XolorInit
PRINT "Initializing Mouse..."    'it looks good, but this has already been done
PRINT "Looking For Sound Card..."
CALL Checksnd(ADLIB%): Quiet     'sound junk....
SBINIT                           '  Music Init
a$(1) = "C90A3106514071F39134A72094D1540074D09A87B733"    'SFX strings
a$(2) = "B11121F3411061128127A19824FE440064CF8479B13A"     'I only used about
a$(3) = "B0112000400060E48047A0982300430063408378B028"     ' 3 or 4 though...
a$(4) = "B7003106514071F39134A72134D1540074D0947FB72C"
a$(5) = "B21122EF421062F98225A2982518451065C08579B220"
a$(6) = "B21122CD421062F98227A2982516450065C28579B22B"
a$(7) = "B3112806480568F68837A3302B0F4B006BC48B6AB32C"
a$(8) = "B4112913490069E38947A4462C324C006C418C78B42C"
a$(9) = "B4022900490069E48947A4A02C004C006C408C78B428"
a$(10) = "B700311A51C071F99100A7593411540074C29400B724"
a$(11) = "B0002006404060F38034A02123D1430063D0837FB02C"
a$(12) = "B7003106514071F39134A72034D1540074D09487B730"
PRINT "Creating Instruments/Music..."
IF Musc > 0 THEN
MAKESBI "percus", PERCUSSION()     ' makes those 7 instrument files....
MAKESBI "stldrum", STEELDRUMS()
MAKESBI "chime", CHIMES()
MAKESBI "chbell", ChurchBell()
MAKESBI "fbass", FUNKBASS()
MAKESBI "snare", SNAREDRUM()
MAKESBI "bguit", BASSGUITAR()      ' and music....
SBPLAY "MRMBt.18v0o2P11C01A04G01F01G01B01A01F01D01F01D01C01F05P05;"
SBPLAY "v1o4C01D01P01P01C01P01C01D01P01P01C01P01C01D01P01P01C01P01C01D01P01P01C01P01C01D01P01P01C01P01C01D01P01P01C01P01;"
SBPLAY "v2o2P01P01D01C01P01D01P01P01D01C01P01D01P01P01D01C01P01D01P01P01D01C01P01D01P01P01D01C01P01D01P01P01D01C01P01D01;"
SBPLAY "v3o1D01P01D01P01D01P01D01P01E01P01E01P01E01P01E01P01D01P01D01P01D01P01D01P01E01P01E01P01E01P01E01P01D01P01D01P01;"
MAKESBM "Hulme1", "Fbass,Bguit,Bguit,Chime"   '<-- that's mine!!
SBPLAY "MC"
SBPLAY "MTMBT.1V0O3G+02P01G+01G02F02O4C01O3G01E01G01C02G+01A+01O4C02P01C01O3A+02G+02"
SBPLAY "O4D+01O3A+01G01A+01D+02F01G01G+01P01G+01P01G+01G01F02G01P01G01P01G01G+01G01E01F08C+01F01G+02D+01G01F01G01;"
SBPLAY "V1O1F08C08G+08D+08F08C08F08C+04D+04;"
SBPLAY "MRMBV2O3G+02P01G+01G02F02O4C01O3G01E01G01C02G+01A+01O4C02P01C01O3A+02G+02"
SBPLAY "O4D+01O3A+01G01A+01D+02F01G01G+01P01G+01P01G+01G01F02G01P01G01P01G01G+01G01E01F08C+01F01G+02D+01G01F01G01;"
SBPLAY "V3O3C08O2G08D+08A+08O3C08O2G08O3C08O2G+04A+04;"
MAKESBM "PMOORE", "BGUIT,PERCUS,SNARE,BGUIT"  '<-- that's not!
SBPLAY "MC"
SBPLAY "MTMBt.1v0o5l01fce-o4b-o5co4a-b-fo5e-o4b-o5co4a-b-fa-e-fce-o3b-o4co3a-b-fa-fe-fa-fe-f;"
SBPLAY "v1o2l08fa-b-o3c;v2o1l08fa-b-o2c;"
SBPLAY "v3o5l01fce-o4b-o5co4a-b-fo5e-o4b-o5co4a-b-fa-e-fce-o3b-o4co3a-b-fa-fe-fa-fe-f;"
MAKESBM "SKYVERSE", "STLDRUM,PERCUS,FBASS,SNARE"    '<-- nor that!
IF Musc = 1 THEN LOADSBM "PMOORE"                   'Load which music
IF Musc = 2 THEN LOADSBM "HULME1"                   ' was chosen
IF Musc = 3 THEN LOADSBM "SKYVERSE"                 ' in intro2.
END IF
MREPEAT = 1                                         'Music Repeat? ...yes
ComputerSpeed = 1: RD = 1                           'duh: Round = 1
CLS
DO
CLS : Arena: COLOR 15                               ' Draw Arena
Dmg = 0: Dmg2 = 0
LINE (0 + Dmg + 1, 0)-(115, 6), 4, BF: LINE (319 - Dmg2 - 1, 0)-(204, 6), 4, BF
LINE (0, 0)-(Dmg, 6), 12, BF: LINE (319, 0)-(319 - Dmg2, 6), 12, BF
COLOR 11: LOCATE 4, 17: PRINT "ROUND"; RD
Paus 55
LOCATE 4, 17: PRINT "FIGHT!!"
Paus 30
LOCATE 4, 17: PRINT "         "
X = 0: X2 = 243
1 DO                                                'MAIN LOOP~~~~~~
SBNextNote                                          ' play next note of music
RANDOMIZE TIMER
IF Wpn1 = 1 THEN PUT (W1, 70), W1%, PSET: W1 = W1 + 5: IF W1 > X2 - 8 AND W1 < X2 + 8 AND B2 = 0 THEN Wpn1 = 0: Dmg2 = Dmg2 + 12: LINE (W1, 70)-(W1 + 57, 86), 0, BF: PUT (X2, 50), A2%, PSET: CALL Bang1
IF W1 >= 265 AND Wpn1 = 1 THEN LINE (W1, 70)-(W1 + 57, 86), 0, BF: Wpn1 = 0
IF Wpn2 = 1 THEN PUT (W2, 70), W2%, PSET: W2 = W2 - 5: IF W2 - 30 > X - 8 AND W2 - 30 < X + 8 AND B = 0 THEN Wpn2 = 0: Dmg = Dmg + 12: LINE (W2, 70)-(W2 + 57, 86), 0, BF: PUT (X, 50), A1%, PSET: CALL Bang2
IF W2 <= 1 AND Wpn2 = 1 THEN LINE (W2, 70)-(W2 + 57, 86), 0, BF: Wpn2 = 0
IF B = 1 THEN LINE (X, 50)-(X + 75, 125), 0, BF: PUT (X, 93), E1%, PSET
IF B = 0 THEN PUT (X, 50), A1%, PSET
IF B2 = 1 THEN LINE (X2, 50)-(X2 + 75, 125), 0, BF: PUT (X2, 93), E2%, PSET
IF B2 = 0 THEN PUT (X2, 50), A2%, PSET
COO = COO + 1
IF COO >= 6 - Cag THEN 'Computer gets ticked and decides to fight back...SORTA
COO = 0: Cmp1 = INT(RND * 5): Cmp2 = INT(RND * 5) + 1: CompMove = Cmp1 + Cmp2
 IF CompMove = 1 AND X2 - X < 75 THEN CompMove = 3
 IF X > X2 THEN IF X2 < 180 THEN CompMove = 8 ELSE CompMove = 6
 IF X2 - X > 50 AND X2 - X < 60 THEN CompMove = 4
 IF Wpn1 = 1 THEN                 'he's still thinking....
  Cmp1 = INT(RND * 3)
  IF Cmp1 = 0 THEN CompMove = 3
  IF Cmp1 = 1 THEN CompMove = 7
  IF Cmp1 = 2 THEN CompMove = 2
 END IF
SELECT CASE CompMove                  'WHAT will the computer do????
CASE 1  'THROW
SBNextNote
IF B2 = 0 AND Wpn2 = 0 AND X2 > X - 70 AND X2 > 61 THEN Wpn2 = 1: W2 = FIX(X2) - 40: PUT (X2, 50), B2%, PSET: FOR I = 1 TO 1000 * ComputerSpeed: NEXT I: aa = 12: CALL sounds
CASE 9  'JUMP FWD.
SBNextNote
IF Wpn2 = 0 THEN
 IF X2 >= 62 THEN
  FOR XX = 3.14 TO 0 STEP -.1
  SBNextNote
  Y = SIN(-XX) * 10 + 25
  PUT ((XX * 20) + X2 - 62, (Y * 2)), A2%, PSET
  NEXT XX
  X2 = FIX(X2 - (20 * 3.14))
 END IF
END IF
CASE 3  'KICK
SBNextNote
IF B2 = 0 THEN
 IF X2 > 5 THEN X2 = X2 - 1
 PUT (X2, 50), C2%, PSET
 IF X2 > X AND (X2 - X) < 50 AND B = 0 THEN
  Dmg = Dmg + 5: Dmg2 = Dmg2 + .2
  CALL Bang2
  IF X > 10 THEN X = X - 5
  ELSE
  Paus 10
 END IF
 IF X2 > X AND (X2 - X) < 50 AND B = 1 THEN
  Dmg = Dmg + .6
  CALL Bang2
  IF X > 10 THEN X = X + 5
  ELSE
  Paus 10
 END IF
END IF
CASE 4  'PUNCH
SBNextNote
IF B2 = 0 THEN
 IF X2 > 8 THEN X2 = X2 - 3
 PUT (X2, 50), B2%, PSET
 IF X2 > X AND (X2 - X) < 50 AND B = 0 THEN
  Dmg = Dmg + 4: Dmg2 = Dmg2 + .1
  CALL Bang2
  IF X > 10 AND Wpn2 = 0 THEN X = X - 5
  ELSE
  Paus 10
 END IF
 IF X2 > X AND (X2 - X) < 50 AND B = 1 THEN
  Dmg = Dmg + .5
  CALL Bang2
  IF X > 10 AND Wpn2 = 0 THEN X = X - 5
  ELSE
  Paus 10
 END IF
END IF
CASE 5  'FORWARD
SBNextNote
IF X2 >= 5 AND Wpn2 = 0 AND B2 = 0 THEN X2 = X2 - 5
CASE 6  'RIGHT
IF X2 < 238 AND Wpn2 = 0 AND B2 = 0 THEN X2 = X2 + 5
CASE 7  'CHARGE
SBNextNote
IF Wpn2 = 0 AND X2 - X > 75 - (Cag * 6) THEN
 LINE (X2, 50)-(X2 + 75, 125), 0, BF
 IF X2 > 10 THEN
  FOR XX = X2 TO X + 35 STEP -1
  IF a = 1 THEN a = 0 ELSE a = 1
  IF a = 0 THEN PUT (XX, 93), F2%, PSET
  IF a = 1 THEN PUT (XX, 93), E2%, PSET
  SBNextNote
  NEXT XX
 END IF
 X2 = FIX(XX)
 SBNextNote
 IF X2 > 10 THEN X2 = X2 - 3
 PUT (X2, 50), G2%, PSET
 IF X2 > X AND (X2 - X) < 50 AND B = 0 THEN
  Dmg = Dmg + 10: Dmg2 = Dmg2 + .1
  CALL Bang2
  IF X > 10 AND Wpn2 = 0 THEN X = X - 5
  ELSE
  Paus 10
 END IF
END IF
CASE 2  'DUCK
SBNextNote
IF B2 = 0 THEN B2 = 1 ELSE B2 = 0
CASE 8  'JUMP BCK.
SBNextNote
IF Wpn2 = 0 THEN
 IF X2 <= 181 THEN
  FOR XX = 0 TO 3.14 STEP .1
  SBNextNote
  Y = SIN(-XX) * 10 + 25
  PUT ((XX * 20) + X2, (Y * 2)), A2%, PSET
  NEXT XX
  X2 = FIX(X2 + (20 * 3.14))
 END IF
END IF
END SELECT
END IF
SBNextNote
IF B = 1 THEN LINE (X, 50)-(X + 75, 125), 0, BF: PUT (X, 93), E1%, PSET
IF B = 0 THEN PUT (X, 50), A1%, PSET
IF B2 = 1 THEN LINE (X2, 50)-(X2 + 75, 125), 0, BF: PUT (X2, 93), E2%, PSET
IF B2 = 0 THEN PUT (X2, 50), A2%, PSET
IF Dmg > 115 THEN Dmg = 115: GOTO 20
IF Dmg2 > 115 THEN Dmg2 = 115: GOTO 20
SELECT CASE INKEY$              'What will you do????
CASE "P", "p"
 DO
 CALL Font("PAUSED!!", 128, 51, 8, 0, 15, 0, 0)
 LOOP UNTIL INKEY$ = "x" OR INKEY$ = "X"
 CALL Font("PAUSED!!", 128, 51, 8, 0, 0, 0, 0)
CASE ">": ComputerSpeed = ComputerSpeed + 1
CASE "<": IF ComputerSpeed > 0 THEN ComputerSpeed = ComputerSpeed - 1
CASE CHR$(0) + CHR$(75): IF X >= 5 AND Wpn1 = 0 AND B = 0 THEN X = X - 5
SBNextNote
CASE CHR$(0) + CHR$(77): IF X < 238 AND Wpn1 = 0 AND B = 0 THEN X = X + 5
SBNextNote
CASE CHR$(0) + CHR$(80)
SBNextNote
IF B = 0 THEN
 IF X < 238 THEN X = X + 1
 PUT (X, 50), C1%, PSET
 IF X2 > X AND (X2 - X) < 50 AND B2 = 0 THEN
  Dmg2 = Dmg2 + 5: Dmg = Dmg + .2
  CALL Bang1
  IF X2 < 238 THEN X2 = X2 + 5
  ELSE
  Paus 10
 END IF
 IF X2 > X AND (X2 - X) < 50 AND B2 = 1 THEN
  Dmg2 = Dmg2 + .6
  CALL Bang1
  IF X2 < 238 THEN X2 = X2 + 5
  ELSE
  Paus 10
 END IF
END IF
CASE CHR$(0) + CHR$(72)
SBNextNote
IF B = 0 THEN
 IF X < 238 THEN X = X + 3
 PUT (X, 50), B1%, PSET
 IF X2 > X AND (X2 - X) < 50 AND B2 = 0 THEN
  Dmg2 = Dmg2 + 4: Dmg = Dmg + .1
  CALL Bang1
  IF X2 < 238 AND Wpn1 = 0 THEN X2 = X2 + 5
  ELSE
  Paus 10
 END IF
 IF X2 > X AND (X2 - X) < 50 AND B2 = 1 THEN
  Dmg2 = Dmg2 + .5
  CALL Bang1
  IF X2 < 238 AND Wpn1 = 0 THEN X2 = X2 + 5
  ELSE
  Paus 10
 END IF
END IF
CASE CHR$(0) + CHR$(73)
SBNextNote
IF Wpn1 = 0 THEN
 IF X <= 181 THEN
  FOR XX = 0 TO 3.14 STEP .1
  SBNextNote
  Y = SIN(-XX) * 10 + 25
  PUT ((XX * 20) + X, (Y * 2)), A1%, PSET
  NEXT XX
  X = FIX(X + (20 * 3.14))
 END IF
END IF
CASE CHR$(0) + CHR$(71)
SBNextNote
IF Wpn1 = 0 THEN
 IF X >= 62 THEN
  FOR XX = 3.14 TO 0 STEP -.1
  SBNextNote
  Y = SIN(-XX) * 10 + 25
  PUT ((XX * 20) + X - 62, (Y * 2)), A1%, PSET
  NEXT XX
  X = FIX(X - (20 * 3.14))
 END IF
END IF
CASE CHR$(0) + CHR$(79)
  SBNextNote
  IF B = 0 THEN B = 1 ELSE B = 0
CASE CHR$(0) + CHR$(81)
SBNextNote
IF Wpn1 = 0 AND B = 0 AND X2 - X > 90 THEN
 LINE (X, 50)-(X + 75, 125), 0, BF
 IF X < 238 THEN
  FOR XX = X TO X2 - 45
  IF a = 1 THEN a = 0 ELSE a = 1
  IF a = 0 THEN PUT (XX, 93), F1%, PSET
  IF a = 1 THEN PUT (XX, 93), E1%, PSET
  SBNextNote
  NEXT XX
 END IF
 X = FIX(XX)
 SBNextNote
 IF X < 238 THEN X = X + 3
 PUT (X, 50), G1%, PSET
 IF X2 > X AND (X2 - X) < 50 AND B2 = 0 THEN
  Dmg2 = Dmg2 + 10: Dmg = Dmg + .1
  CALL Bang1
  IF X2 < 238 AND Wpn1 = 0 THEN X2 = X2 + 5
  ELSE
  Paus 10
 END IF
END IF
CASE CHR$(27): Dmg2 = 115: Dmg = 115: RD = 4
SBNextNote
CASE CHR$(13)
 SBNextNote
 IF B = 0 AND Wpn1 = 0 AND X2 > X - 70 THEN Wpn1 = 1: W1 = FIX(X) + 60: PUT (X, 50), B1%, PSET: FOR I = 1 TO 1000 * ComputerSpeed: NEXT I: aa = 12: CALL sounds
END SELECT
20 SBNextNote
X = FIX(X): X2 = FIX(X2)
IF X >= 244 THEN X = 243
IF Dmg > 115 THEN Dmg = 115
IF Dmg2 > 115 THEN Dmg2 = 115
LINE (0 + Dmg + 1, 0)-(115, 6), 4, BF: LINE (319 - Dmg2 - 1, 0)-(204, 6), 4, BF
LINE (0, 0)-(Dmg, 6), 12, BF: LINE (319, 0)-(319 - Dmg2, 6), 12, BF
IF Dmg2 >= 114 THEN CALL Head2Off
IF Dmg >= 114 THEN CALL HeadOff
SBNextNote
Paus 1
LOOP UNTIL Dmg2 >= 115 OR Dmg >= 115
IF Dmg < Dmg2 THEN PUT (X, 50), D1%, PSET: WN1 = WN1 + 1: NN$ = NN$ + "*"
IF Dmg2 < Dmg THEN PUT (X2, 50), D2%, PSET: WN2 = WN2 + 1: NN2$ = NN2$ + "*"
SLEEP 3: RD = RD + 1
Wpn1 = 0: Wpn2 = 0
LOOP UNTIL RD >= 4 OR WN1 = 2 OR WN2 = 2
LINE (0, 0)-(319, 50), 0, BF
CALL Font("THE  END", 128, 51, 8, 0, 15, 0, 0)
FOR RR = 1 TO 3000
  XX = INT(RND(1) * 271)
  YX = INT(RND(1) * 100) + 50
  GET (XX, YX)-(XX + 48, YX + 48), B2%
  PUT (XX, YX + 1), B2%, PSET
IF INKEY$ = CHR$(27) THEN GOTO 10
NEXT RR
10 CLS
SCREEN 13
Credits

' HOPE you enjoy this game....
'
'  I vow, however, that there will be fewer, if any, black boxes
'   in the sequel!!!!  Sphere Fighter 2 is already 50% done,
'   since I am using this code.
'
' Who knows...maybe SF3 will have rotation as well...a true 3D game.
'
 MAVERICK 95 - 96    ....remark this line


SUB Arena

RANDOMIZE TIMER
FOR R = 1 TO 80
X = INT(RND * 319) + 1
Y = INT(RND * 25) + 1
C = INT(RND * 16) + 176
PSET (X, Y), C
NEXT R
LINE (0, 130)-(319, 130), 15
a = 9: XOL = INT(RND * 14) * 16: XOL3 = INT(RND * 14) * 16
XOL = XOL + 20: XOL3 = XOL3 + 20: C = XOL: CC = XOL3: E = 122
FOR X = 0 TO 7 * 3.14 STEP .1
X2 = (6 * 3.14) - X + 1: Y = SIN(X) * 10 + (a * 2.3)
Y2 = SIN(-X2) * 10 + (a * 2.3) + 1
FOR D = a TO 1 STEP -1
CIRCLE ((X * 20), (Y * 2) + E), D, XOL
CIRCLE ((X2 * 20), (Y2 * 2) + E), D, XOL3
XOL = XOL + 1: XOL3 = XOL3 + 1
NEXT D
XOL = C: XOL3 = CC
NEXT X
CALL Font(NN$, 10, 10, 8, 0, Xol1 + 10, 0, 0)
CALL Font(NN2$, 214, 10, 8, 0, Xol2 + 10, 0, 0)
END SUB

SUB Bang1
  MM1 = 20: MM2 = 10: MM3 = 5
  REDIM SBX(MM1), SBY(MM1), SBX2(MM1), SBY2(MM1)
  REDIM BNG%(MM1)
  aa = 8
  CALL sounds
  FOR J = 1 TO MM1
  SBNextNote
  SBX(J) = (RND * 5) - 2.5
  SBY(J) = (RND * 5) - 2.5
  MM21 = MM2 + ((RND * 4) - 2)
  SBX2(J) = (RND * MM21) - (MM21 / 2)
  SBY2(J) = (RND * MM21) - (MM21 / 2)
  IF SBX2(J) = 0 THEN SBX2(J) = (RND * 4) - 2
  IF SBY2(J) = 0 THEN SBY2(J) = (RND * 4) - 2
  NEXT J
  Count = 0: C = Xol2 + 15: BX = X2 + 30: BY = 80
  DO
  Count = Count + 1
  FOR J = 1 TO MM1
  SBNextNote
  PSET (BX + SBX(J), BY + SBY(J)), BNG%(J)
  BX1 = (BX + SBX(J))
  BY1 = (BY + SBY(J))
  SBX(J) = SBX(J) + SBX2(J)
  SBY(J) = SBY(J) + SBY2(J)
  BNG%(J) = POINT(BX + SBX(J), BY + SBY(J))
  PSET (BX + SBX(J), BY + SBY(J)), C
  NEXT J
  LOOP UNTIL Count > MM3
  FOR J = 1 TO MM1
  SBNextNote
  PSET (BX + SBX(J), BY + SBY(J)), BNG%(J)
  NEXT J
END SUB

SUB Bang2
  MM1 = 20: MM2 = 10: MM3 = 5
  REDIM SBX(MM1), SBY(MM1), SBX2(MM1), SBY2(MM1)
  REDIM BNG%(MM1)
  aa = 8
  CALL sounds
  FOR J = 1 TO MM1
  SBNextNote
  SBX(J) = (RND * 5) - 2.5
  SBY(J) = (RND * 5) - 2.5
  MM21 = MM2 + ((RND * 4) - 2)
  SBX2(J) = (RND * MM21) - (MM21 / 2)
  SBY2(J) = (RND * MM21) - (MM21 / 2)
  IF SBX2(J) = 0 THEN SBX2(J) = (RND * 4) - 2
  IF SBY2(J) = 0 THEN SBY2(J) = (RND * 4) - 2
  NEXT J
  Count = 0: C = Xol1 + 15: BX = X + 30: BY = 80
  DO
  Count = Count + 1
  FOR J = 1 TO MM1
  SBNextNote
  PSET (BX + SBX(J), BY + SBY(J)), BNG%(J)
  BX1 = (BX + SBX(J))
  BY1 = (BY + SBY(J))
  SBX(J) = SBX(J) + SBX2(J)
  SBY(J) = SBY(J) + SBY2(J)
  BNG%(J) = POINT(BX + SBX(J), BY + SBY(J))
  PSET (BX + SBX(J), BY + SBY(J)), C
  NEXT J
  LOOP UNTIL Count > MM3
  FOR J = 1 TO MM1
  SBNextNote
  PSET (BX + SBX(J), BY + SBY(J)), BNG%(J)
  NEXT J
END SUB

DEFINT A-B
SUB Checksnd (ADLIB%)
OUT &H388, &H4: FOR A7 = 1 TO 6: A11 = INP(&H388): NEXT
OUT &H389, &H60: FOR A7 = 1 TO 35: A11 = INP(&H388): NEXT
OUT &H388, &H4: FOR A7 = 1 TO 6: A11 = INP(&H388): NEXT
OUT &H389, &H80: FOR A7 = 1 TO 35: A11 = INP(&H388): NEXT
Astat1 = INP(&H388)
OUT &H388, &H2: FOR A7 = 1 TO 6: A11 = INP(&H388): NEXT
OUT &H389, &HFF: FOR A7 = 1 TO 35: A11 = INP(&H388): NEXT
OUT &H388, &H4: FOR A7 = 1 TO 6: A11 = INP(&H388): NEXT
OUT &H389, &H21: FOR A7 = 1 TO 35: A11 = INP(&H388): NEXT
SLEEP 1
Astat2 = INP(&H388)
OUT &H388, &H4: FOR A7 = 1 TO 6: A11 = INP(&H388): NEXT
OUT &H389, &H60: FOR A7 = 1 TO 35: A11 = INP(&H388): NEXT
OUT &H388, &H4: FOR A7 = 1 TO 6: A11 = INP(&H388): NEXT
OUT &H389, &H80: FOR A7 = 1 TO 35: A11 = INP(&H388): NEXT
Ares1 = Astat1 AND &HE0: Ares2 = Astat2 AND &HE0
ADLIB% = 0: IF Ares1 = 0 AND Ares2 = 192 THEN ADLIB% = 1
END SUB

DEFSNG A-B
SUB Credits
PUT (0, 12), A1%, PSET: PUT (75, 12), B1%, PSET
PUT (150, 12), C1%, PSET: PUT (230, 12), D1%, PSET
PUT (0, 112), E1%, PSET: PUT (75, 112), F1%, PSET
PUT (150, 112), G1%, PSET: PUT (230, 132), W1%, PSET
CALL Font("Game Coded by...MAVERICK (Mike Hulme)", 5, 10, 8, 0, 16, 0, 0)
CALL Font("Game Idea...Mike Hulme", 5, 20, 8, 0, 17, 0, 0)
CALL Font("Fighter Designs...Mike Hulme", 5, 30, 8, 0, 18, 0, 0)
CALL Font("Animation...Mike Hulme", 5, 40, 8, 0, 19, 0, 0)
CALL Font("*Created w/ Balldraw.bas by Maverick", 15, 50, 8, 0, 20, 0, 0)
CALL Font("Palettes...Mike Hulme", 5, 60, 8, 0, 21, 0, 0)
CALL Font("Melting Effect...Jason Plackey", 5, 70, 8, 0, 22, 0, 0)
CALL Font("Bang Effect based on routine by ~ERIC~", 5, 80, 8, 0, 23, 0, 0)
CALL Font("Fonts...~DAVE~ Gentry", 5, 90, 8, 0, 24, 0, 0)
CALL Font("SFX routines...~DAVE~ & John Dondzila", 5, 100, 8, 0, 25, 0, 0)
CALL Font("MUSIC routines...~THOMAS~ & Peter Moore", 5, 110, 8, 0, 26, 0, 0)
CALL Font("Music #1...converted by Peter Moore", 15, 120, 8, 0, 27, 0, 0)
CALL Font("Music #2...composed by Michael Hulme", 15, 130, 8, 0, 28, 0, 0)
CALL Font("Music #3...composed by W. Lipschultz", 15, 140, 8, 0, 29, 0, 0)
CALL Font("and edited by...Mike Hulme", 20, 150, 8, 0, 29, 0, 0)
CALL Font("Better than IMK?????  You Betcha.", 10, 160, 8, 0, 30, 0, 0)
CALL Font("No routines were derived from IMK.", 10, 170, 8, 0, 31, 0, 0)
CALL Font("MAVERICK 95-96", 10, 190, 8, 0, 31, 0, 0)
Quiet'!!!!!!
SLEEP
SYSTEM
END SUB

SUB DELAY (sbDT!)
IF sbDT! = 0! THEN EXIT SUB
sbstart! = TIMER
IF (sbstart! + sbDT!) > 86400 THEN
  sbFinish! = ((sbstart! + sbDT!) - 86400)
  DO WHILE TIMER >= sbstart! OR TIMER <= sbFinish!: LOOP
ELSE
  DO WHILE TIMER <= (sbstart! + sbDT!): LOOP
END IF
END SUB

SUB Font (a$, X%, Y%, stepX%, stepY%, CO%, Bkgd%, Shadow%)
extX% = stepX%: extY% = stepY%
DEF SEG = &HFFA6
 FOR I% = 1 TO LEN(a$)
   addr% = 8 * ASC(MID$(a$, I%)) + 14
IF Background% THEN
IF Background% = 256 THEN BG% = FALSE ELSE BG% = Bkgd%
IF I% = LEN(a$) THEN extX% = FALSE: extY% = FALSE
LINE (X%, Y%)-(X% + 7 + extX%, Y% + 7 + extY%), BG%, BF
END IF
FOR J% = 0 TO 7: mask% = PEEK(addr% + J%) * 128
IF Shadow% THEN
LINE (X% + 9, Y% + J% + 2)-(X% + 2, Y% + J% + 2), 0, , mask%
END IF
LINE (X% + 7, Y% + J%)-(X%, Y% + J%), CO%, , mask%
NEXT: X% = X% + extX%: Y% = Y% + extY%: NEXT: DEF SEG
END SUB

SUB Head2Off
Z = 9: HC = Xol2
aa = 4
CALL sounds
IF X <= 75 AND X2 - X <= 75 THEN X2 = X + 75
IF X >= 180 AND X2 - X <= 75 THEN X = X2 - 75
PUT (X2, 50), A2%, PSET: PUT (X, 50), A1%, PSET
  MM1 = 40: MM2 = 9: MM3 = 5
  REDIM SBX(MM1), SBY(MM1), SBX2(MM1), SBY2(MM1)
  REDIM BNG%(MM1)
  FOR J = 1 TO MM1
  SBX(J) = (RND * 5) - 2.5
  SBY(J) = (RND * 5) - 2.5
  MM21 = MM2 + ((RND * 4) - 2)
  SBX2(J) = (RND * MM21) - (MM21 / 2)
  SBY2(J) = (RND * MM21)
  IF SBX2(J) = 0 THEN SBX2(J) = (RND * 4) - 2
  IF SBY2(J) = 0 THEN SBY2(J) = (RND * 4) - 2
  NEXT J
  Count = 0: C = Xol2 + 15: BX = X2 + 37: BY = 72
  DO
  Count = Count + 1
  FOR J = 1 TO MM1
  PSET (BX + SBX(J), BY + SBY(J)), BNG%(J)
  BX1 = (BX + SBX(J))
  BY1 = (BY + SBY(J))
  SBX(J) = SBX(J) + SBX2(J)
  SBY(J) = SBY(J) + SBY2(J)
  BNG%(J) = POINT(BX + SBX(J), BY + SBY(J))
  PSET (BX + SBX(J), BY + SBY(J)), C
  NEXT J
  LOOP UNTIL Count > MM3
  FOR J = 1 TO MM1
  PSET (BX + SBX!(J), BY + SBY!(J)), BNG%(J)
  NEXT J
FOR HY = 67 TO -10 STEP -1
 FOR Diameter = 9 TO 1 STEP -1
 CIRCLE (37 + X2 + o, HY - o), Diameter, HC
 HC = HC + 1: o = o + .1
 NEXT Diameter
 CIRCLE (37 + X2, HY), 10, 0
 HC = Xol2: o = 0
NEXT HY
LINE (0 + Dmg + 1, 0)-(115, 6), 4, BF: LINE (319 - Dmg2 - 1, 0)-(204, 6), 4, BF
LINE (0, 0)-(Dmg, 6), 12, BF: LINE (319, 0)-(319 - Dmg2, 6), 12, BF
RANDOMIZE TIMER
FOR RR = 1 TO 600
  XX = INT(RND(1) * 52) + X2
  YX = INT(RND(1) * 52) + 50
  GET (XX, YX)-(XX + 24, YX + 24), B2%
  PUT (XX, YX + 1), B2%, PSET
NEXT RR
Dmg2 = 115
END SUB

SUB HeadOff
Z = 9: HC = Xol1
aa = 4
CALL sounds
IF X <= 75 AND X2 - X <= 75 THEN X2 = X + 75
IF X >= 180 AND X2 - X <= 75 THEN X = X2 - 75
PUT (X2, 50), A2%, PSET: PUT (X, 50), A1%, PSET
  MM1 = 40: MM2 = 9: MM3 = 5
  REDIM SBX(MM1), SBY(MM1), SBX2(MM1), SBY2(MM1)
  REDIM BNG%(MM1)
  FOR J = 1 TO MM1
  SBX(J) = (RND * 5) - 2.5
  SBY(J) = (RND * 5) - 2.5
  MM21 = MM2 + ((RND * 4) - 2)
  SBX2(J) = (RND * MM21) - (MM21 / 2)
  SBY2(J) = (RND * MM21) '- (MM21 / 2)
  IF SBX2(J) = 0 THEN SBX2(J) = (RND * 4) - 2
  IF SBY2(J) = 0 THEN SBY2(J) = (RND * 4) - 2
  NEXT J
  Count = 0: C = Xol1 + 15: BX = X + 37: BY = 72
  DO
  Count = Count + 1
  FOR J = 1 TO MM1
  PSET (BX + SBX(J), BY + SBY(J)), BNG%(J)
  BX1 = (BX + SBX(J))
  BY1 = (BY + SBY(J))
  SBX(J) = SBX(J) + SBX2(J)
  SBY(J) = SBY(J) + SBY2(J)
  BNG%(J) = POINT(BX + SBX(J), BY + SBY(J))
  PSET (BX + SBX(J), BY + SBY(J)), C
  NEXT J
  LOOP UNTIL Count > MM3
  FOR J = 1 TO MM1
  PSET (BX + SBX!(J), BY + SBY!(J)), BNG%(J)
  NEXT J
FOR HY = 67 TO -10 STEP -1
 FOR Diameter = 9 TO 1 STEP -1
 CIRCLE (37 + X + o, HY - o), Diameter, HC
 HC = HC + 1: o = o + .1
 NEXT Diameter
 CIRCLE (37 + X, HY), 10, 0
 HC = Xol1: o = 0
NEXT HY
LINE (0 + Dmg + 1, 0)-(115, 6), 4, BF: LINE (319 - Dmg2 - 1, 0)-(204, 6), 4, BF
LINE (0, 0)-(Dmg, 6), 12, BF: LINE (319, 0)-(319 - Dmg2, 6), 12, BF
RANDOMIZE TIMER
FOR RR = 1 TO 600
  XX = INT(RND(1) * 52) + X
  YX = INT(RND(1) * 52) + 50
  GET (XX, YX)-(XX + 24, YX + 24), B2%
  PUT (XX, YX + 1), B2%, PSET
NEXT RR
Dmg = 115
END SUB

SUB Intro
SCREEN 13: CLS
C = 16
FOR a = 16 TO 61 STEP 3: PALETTE C, (256 ^ 2 * a) + (256 * 0) + 0: C = C + 1: NEXT a
C = 48
FOR a = 16 TO 61 STEP 3: PALETTE C, (256 ^ 2 * 0) + (256 * 0) + a: C = C + 1: NEXT a
a = 16: B = a: C = 16: CC = 48: D = 0
XOL = 16: XOL3 = 48: X = 0: Y = 0: R = -1: XX = 320
DO
R = R + 1
DO
FOR D = a TO 1 STEP -1
CIRCLE (X, Y), D, XOL: PAINT (X, Y), XOL
CIRCLE (XX, Y), D, CC: PAINT (XX, Y), CC
XOL = XOL + 1: CC = CC + 1
NEXT D
XOL = C: a = a - 1: X = X + 3: Y = Y + 2: XX = XX - 3: CC = XOL3
IF a = 4 THEN EXIT DO
LOOP
DO
FOR D = a TO 1 STEP -1
CIRCLE (X, Y), D, XOL: PAINT (X, Y), XOL
CIRCLE (XX, Y), D, CC: PAINT (XX, Y), CC
XOL = XOL + 1: CC = CC + 1
NEXT D
XOL = C: a = a + 1: X = X + 3: Y = Y + 2: XX = XX - 3: CC = XOL3
IF a = 16 THEN EXIT DO
LOOP
LOOP UNTIL R = 4
COLOR 28
CALL Font("Player 1 name...", 95, 17, 8, 0, 28, 0, 0)
LOCATE 2, 14: INPUT "", NN$
CALL Font("Input computer name...", 75, 184, 8, 0, 28, 0, 0)
LOCATE 23, 12: INPUT "", NN2$
COLOR 15
CALL Font("Loading Game...", 100, 97, 8, 0, 15, 0, 0)
Xol1 = 112: Xol2 = 160
DO
RANDOMIZE TIMER
Xol1 = INT(RND * 14) * 16: Xol2 = INT(RND * 14) * 16
Xol1 = Xol1 + 16: Xol2 = Xol2 + 16
LOOP UNTIL Xol1 <> Xol2
END SUB

SUB Intro2
C = 9
FOR Y = 1 TO 197 STEP 14
C = C + 16
LINE (155, Y)-(165, Y + 13), C, BF
NEXT Y
CALL Font(NN$, 10, 10, 8, 0, 28, 0, 0)
CALL Font(NN2$, 10, 100, 8, 0, 28, 0, 0)
CALL Font("Choose Color...", 15, 20, 8, 0, 28, 0, 0)
C = 0
DO
MouseStatus Lb%, Rb%, xm%, ym%: MouseShow
MouseRange 310, 2, 330, 196
IF Lb% = -1 THEN
 MouseHide
 C = POINT(xm% / 2, ym%) - 9
 END IF
LOOP UNTIL C > 0
Xol1 = C
CALL Font("Choose Color...", 15, 20, 8, 0, 0, 0, 0)
C2 = 0
FOR X = 10 TO 115 STEP 7
C = Xol1 + C2
LINE (X, 20)-(X + 8, 35), C, BF
C2 = C2 + 1
NEXT X
CALL Font("Choosing...", 15, 110, 8, 0, 28, 0, 0)
SLEEP 2
DO
RANDOMIZE TIMER
Xol2 = INT(RND * 14) * 16
Xol2 = Xol2 + 16
LOOP UNTIL Xol1 <> Xol2
CALL Font("Choosing...", 15, 110, 8, 0, 0, 0, 0)
C2 = 0
FOR X = 10 TO 115 STEP 7
C = Xol2 + C2
LINE (X, 110)-(X + 8, 125), C, BF
C2 = C2 + 1
NEXT X
CALL Font("Computer", 170, 15, 8, 0, 28, 0, 0)
CALL Font("Aggressiveness?", 172, 25, 8, 0, 28, 0, 0)
CALL Font("NO", 188, 35, 8, 0, 28, 0, 0)
CALL Font("LITTLE", 188, 45, 8, 0, 28, 0, 0)
CALL Font("A LITTLE MORE", 188, 55, 8, 0, 28, 0, 0)
CALL Font("MUCH MORE", 188, 65, 8, 0, 28, 0, 0)
CALL Font("REALITY", 188, 75, 8, 0, 28, 0, 0)

FOR Y = 35 TO 75 STEP 10
LINE (175, Y)-(185, Y + 6), 15, B
NEXT Y
DO
MouseStatus Lb%, Rb%, xm%, ym%: MouseShow
MouseRange 350, 36, 370, 80
IF Lb% = -1 AND ym% > 35 AND ym% < 41 THEN MouseHide: Cag = 1: PAINT (xm% / 2, ym%), 7, 15: EXIT DO
IF Lb% = -1 AND ym% > 45 AND ym% < 51 THEN MouseHide: Cag = 2: PAINT (xm% / 2, ym%), 7, 15: EXIT DO
IF Lb% = -1 AND ym% > 55 AND ym% < 61 THEN MouseHide: Cag = 3: PAINT (xm% / 2, ym%), 7, 15: EXIT DO
IF Lb% = -1 AND ym% > 65 AND ym% < 71 THEN MouseHide: Cag = 4: PAINT (xm% / 2, ym%), 7, 15: EXIT DO
IF Lb% = -1 AND ym% > 75 AND ym% < 81 THEN MouseHide: Cag = 5: PAINT (xm% / 2, ym%), 7, 15: EXIT DO
LOOP
CALL Font("Select Music: ", 170, 95, 8, 0, 28, 0, 0)
CALL Font("0) none", 175, 105, 8, 0, 29, 0, 0)
CALL Font("1) Fairlight", 175, 115, 8, 0, 29, 0, 0)
CALL Font("2) KickIt!", 175, 125, 8, 0, 29, 0, 0)
CALL Font("3) SkyVerse", 175, 135, 8, 0, 29, 0, 0)
Musc = 4
DO
SELECT CASE INKEY$
CASE "0"
 Musc = 0
CASE "1"
 Musc = 1
CASE "2"
 Musc = 2
CASE "3"
 Musc = 3
END SELECT
LOOP UNTIL Musc < 4
END SUB

SUB LOADSBM (SONG$) STATIC
SONGPOS = 1
OPEN SONG$ + ".SBM" FOR INPUT AS #19
INPUT #19, a$: INPUT #19, B$: INPUT #19, C$: INPUT #19, D$: INPUT #19, SONGDELAY
SbVoiceFile a$, B$, C$, D$
FOR v% = 0 TO 3: ct = 0
NOTES1:
INPUT #19, D: IF D = -1 THEN GOTO NOTES2
oc% = INT(D / 10000)
sd% = INT((D - INT(D / 10000) * 10000) / 100)
dr1% = INT(D - INT(D / 10000) * 10000)
dr% = dr1% - (INT(dr1% / 100) * 100)
FOR Z% = 1 TO dr%: ct = ct + 1
snd(v%, ct) = note(sd%)
oct(v%, ct) = oc%
NEXT Z%: GOTO NOTES1
NOTES2:
SONGLEN = ct
ct = ct + 1
NOTECODE(v%, ct) = INT(D)
FOR abxs% = ct TO 200
snd(v%, abxs%) = 0: oct(v%, abxs%) = 0
NEXT
NEXT v%
CLOSE #19
END SUB

SUB LodeFighters
OPEN "c:\FIG1.DAT" FOR INPUT AS #2
 XOL = Xol1
 FOR I = 1 TO 170
 INPUT #2, X, Y, Z
 FOR Diameter = Z TO 1 STEP -1
 IF I > 97 AND I < 138 THEN
 CIRCLE (X + 2 + o, Y - 42 - o), Diameter, XOL: PAINT (X + 2 + o, Y - 42 - o), XOL
 ELSE
 CIRCLE (X + 2 + o, Y - o), Diameter, XOL: PAINT (X + 2 + o, Y - o), XOL
 END IF
 XOL = XOL + 1
 o = o + .1
 NEXT Diameter
 IF I = 25 THEN GET (0, 0)-(75, 75), A1%: LINE (0, 0)-(75, 75), 0, BF
 IF I = 43 THEN GET (0, 0)-(75, 75), B1%: LINE (0, 0)-(75, 75), 0, BF
 IF I = 72 THEN GET (0, 0)-(75, 75), C1%: LINE (0, 0)-(75, 75), 0, BF
 IF I = 97 THEN GET (0, 0)-(75, 75), D1%: LINE (0, 0)-(75, 75), 0, BF
 IF I = 117 THEN GET (0, 0)-(75, 34), E1%: LINE (0, 0)-(75, 75), 0, BF
 IF I = 137 THEN GET (0, 0)-(75, 34), F1%: LINE (0, 0)-(75, 75), 0, BF
 IF I = 170 THEN GET (0, 0)-(75, 75), G1%: LINE (0, 0)-(75, 75), 0, BF
 XOL = Xol1: o = 0
 NEXT I
 CLOSE #2
OPEN "c:\FIG2.DAT" FOR INPUT AS #2
 XOL = Xol2
 FOR I = 1 TO 170
 INPUT #2, X, Y, Z
 FOR Diameter = Z TO 1 STEP -1
 IF I > 97 AND I < 138 THEN
 CIRCLE (X + 2 + o, Y - 42 - o), Diameter, XOL: PAINT (X + 2 + o, Y - 42 - o), XOL
 ELSE
 CIRCLE (X - 2 + o, Y - o), Diameter, XOL: PAINT (X - 2 + o, Y - o), XOL
 END IF
 XOL = XOL + 1
 o = o + .1
 NEXT Diameter
 IF I = 25 THEN GET (0, 0)-(75, 75), A2%: LINE (0, 0)-(75, 75), 0, BF
 IF I = 43 THEN GET (0, 0)-(75, 75), B2%: LINE (0, 0)-(75, 75), 0, BF
 IF I = 72 THEN GET (0, 0)-(75, 75), C2%: LINE (0, 0)-(75, 75), 0, BF
 IF I = 97 THEN GET (0, 0)-(75, 75), D2%: LINE (0, 0)-(75, 75), 0, BF
 IF I = 117 THEN GET (0, 0)-(75, 34), E2%: LINE (0, 0)-(75, 75), 0, BF
 IF I = 137 THEN GET (0, 0)-(75, 34), F2%: LINE (0, 0)-(75, 75), 0, BF
 IF I = 170 THEN GET (0, 0)-(75, 75), G2%: LINE (0, 0)-(75, 75), 0, BF
 XOL = Xol2: o = 0
 NEXT I
 CLOSE #2
Xolour = Xol1 + 4: D = 2: Y = 8: X = 8
FOR RR = 1 TO 8
o = 0: Xolour = Xol1 + 4
FOR Diameter = D TO 1 STEP -1
CIRCLE (X + o, Y - o), Diameter, Xolour: PAINT (X + o, Y - o), Xolour
Xolour = Xolour + 1
o = o + .25
NEXT Diameter
X = X + 5
D = D + 1
NEXT RR
GET (0, 0)-(55, 16), W1%
LINE (0, 0)-(100, 100), 0, BF
Xolour = Xol2 + 4: D = 2: Y = 8: X = 45
FOR RR = 1 TO 8
o = 0: Xolour = Xol2 + 4
FOR Diameter = D TO 1 STEP -1
CIRCLE (X + o, Y - o), Diameter, Xolour: PAINT (X + o, Y - o), Xolour
Xolour = Xolour + 1
o = o + .25
NEXT Diameter
X = X - 5
D = D + 1
NEXT RR
GET (0, 0)-(55, 16), W2%
LINE (0, 0)-(100, 100), 0, BF

END SUB

SUB MAKESBI (sbifl$, instrudata%()) STATIC
OPEN sbifl$ + ".SBI" FOR OUTPUT AS #19
PRINT #19, instrudata%(1); ","; instrudata%(2); ","; instrudata%(3); ",";
PRINT #19, instrudata%(4)
PRINT #19, instrudata%(5); ","; instrudata%(6); ","; instrudata%(7); ",";
PRINT #19, instrudata%(8)
PRINT #19, instrudata%(9); ","; instrudata%(10); ","; instrudata%(11); ",";
PRINT #19, instrudata%(12)
CLOSE #19
END SUB

SUB MAKESBM (sbmfl$, instd$) STATIC
OPEN sbmfl$ + ".SBM" FOR OUTPUT AS #19
PRINT #19, instd$; ","; SONGDELAY
sbtottotln% = 0
FOR sba2% = 0 TO 3
sbngnd% = 0
sbtotln% = 0
FOR sbab% = 1 TO 200
IF NOTECODE(sba2%, sbab%) = -1 THEN sbngnd% = sbab%
IF sbngnd% = 0 THEN sbtotln% = sbtotln% + VAL(RIGHT$(STR$(NOTECODE(sba2%, sbab%)), 2))
NEXT
IF sbtotln% = 200 THEN sbtotln% = 0
IF sbtotln% > 0 THEN sbtotln% = sbtotln% + 1
IF sbtotln% > sbtottotln% THEN sbtottotln% = sbtotln%
IF sbngnd% = 0 THEN sbngnd% = sbtottotln%
FOR sbab% = 1 TO sbngnd% - 1
PRINT #19, STR$(NOTECODE(sba2%, sbab%));
IF sbab% / 8 = sbab% \ 8 THEN PRINT #19, "" ELSE PRINT #19, ",";
NEXT
PRINT #19, "-1"
NEXT
CLOSE #19
END SUB

SUB MavPro
SCREEN 13: CLS
DIM M1(50): DIM A1(50): DIM V1(50): DIM E1(50): DIM R1(50)
DIM I1(50): DIM C1(50): DIM k1(50): DIM BL(50): DIM D(8, 8)
DIM AAA%(50), BB%(50), CC%(50), DD%(50)
COLOR 4: GET (0, 0)-(7, 7), DD%: LOCATE 1, 1: PRINT "1"
GET (0, 0)-(7, 7), AAA%: LOCATE 1, 1: PRINT "9"
GET (0, 0)-(7, 7), BB%: LOCATE 1, 1: PRINT "6"
GET (0, 0)-(7, 7), CC%
COLOR 4: LOCATE 2, 2: PRINT "M": GET (6, 6)-(18, 18), M1
COLOR 1: LOCATE 2, 2: PRINT "A": GET (6, 6)-(18, 18), A1
COLOR 2: LOCATE 2, 2: PRINT "V": GET (6, 6)-(15, 16), V1
COLOR 14: LOCATE 2, 2: PRINT "E": GET (6, 6)-(17, 17), E1
COLOR 1: LOCATE 2, 2: PRINT "R": GET (6, 6)-(17, 17), R1
COLOR 4: LOCATE 2, 2: PRINT "I": GET (6, 6)-(17, 17), I1
COLOR 2: LOCATE 2, 2: PRINT "C": GET (6, 6)-(17, 17), C1
COLOR 14: LOCATE 2, 2: PRINT "K": GET (6, 6)-(17, 17), k1
COLOR 8: LOCATE 1, 1: PRINT ""
FOR X = 0 TO 6: FOR Y = 0 TO 8
C = POINT(X, Y): IF C > 0 THEN C = 1 ELSE C = 0
D(X, Y) = C
NEXT Y, X

CLS : a = 160: GET (0, 0)-(10, 10), BL
PALETTE 8, 0: CL = 2: PALETTE 6, 0: RR = 0
FOR X = 0 TO 8: FOR Y = 0 TO 8
IF D(X, Y) = 1 THEN LINE (X * 3 + 90, Y * 3 + 83)-(X * 3 + 2 + 90, Y * 3 + 2 + 83), 8, BF: LINE (X * 3 + 225, Y * 3 + 83)-(X * 3 + 2 + 225, Y * 3 + 2 + 83), 8, BF
NEXT Y, X

DO
FOR N = 0 TO 3.14 STEP .05
K = 3.14 - N: M = SIN(N) * 10: J = SIN(-K) * 10
E = SIN(M) * 10: F = COS(-K) * J
PUT ((M * 3.5) + a - 5, (N * 30) + 48), C1, PSET
PUT ((J * 3.5) + a + 13, (K * 30) + 47), A1, PSET
PUT ((E * 3.5) + a + 10, (N * 30) + 46), V1, PSET
PUT ((F * 3.5) + a + 10, (K * 30) + 50), R1, PSET
PUT ((M * 3.5) + a + 5, (N * 30) + 44), k1, PSET
PUT ((J * 3.5) + a + 2, (K * 30) + 45), M1, PSET
PUT ((-E * 3.5) + a, (N * 30) + 43), I1, PSET
PUT ((F * 3.5) + a, (K * 30) + 42), E1, PSET
FOR I = 1 TO 300: NEXT I
PUT ((E * 3.5) + a + 10, (N * 30) + 46), BL, PSET
PUT ((-E * 3.5) + a, (N * 30) + 43), BL, PSET
IF Q = 0 THEN CL = CL + 2 ELSE CL = CL - 2
IF CL = 62 THEN Q = 1
IF CL = 2 THEN Q = 0
PALETTE 8, (256 ^ 2 * CL) + (256 * CL) + CL
IF RR = 0 AND N > 1.5 THEN EXIT DO
SELECT CASE INKEY$
CASE IS > ""
 EXIT DO
END SELECT
NEXT N
RR = RR + 1
LOOP
PUT ((E * 3.5) + a + 10, (N * 30) + 46), V1, PSET
PUT ((-E * 3.5) + a, (N * 30) + 43), I1, PSET
COLOR 6: Q = 0: CL2 = 10
Z = 63: Z2 = Z: Z3 = Z
DO
PALETTE 8, (256 ^ 2 * Z) + (256 * Z2) + Z3
IF Z > 0 THEN Z = Z - 1
IF Z = 0 AND Z2 > 0 THEN Z2 = Z2 - 1
IF Z2 = 0 THEN Z3 = Z3 - 1
FOR I = 1 TO 50: NEXT I
LOOP UNTIL Z3 = 1

DO
FOR Y = 0 TO 3.14 STEP .1
X = SIN(Y) * 20
Y2 = Y - 0!: X2 = SIN(Y2) * 25
Y3 = Y - 0!: X3 = SIN(Y2) * 30
Y4 = Y - 0!: X4 = SIN(Y2) * 35
PUT ((X * 4) + 160, (Y * 50) + 25), AAA%, PSET
PUT ((X2 * 4) + 160, (Y2 * 50) + 25), BB%, PSET
PUT ((X3 * 4) + 160, (Y3 * 50) + 25), BB%, PSET
PUT ((X4 * 4) + 160, (Y4 * 50) + 25), CC%, PSET
FOR I = 1 TO 400: NEXT I
PUT ((X * 4) + 160, (Y * 50) + 25), DD%, PSET
PUT ((X2 * 4) + 160, (Y2 * 50) + 25), DD%, PSET
PUT ((X3 * 4) + 160, (Y3 * 50) + 25), DD%, PSET
PUT ((X4 * 4) + 160, (Y4 * 50) + 25), DD%, PSET
SELECT CASE INKEY$
CASE IS > ""
 EXIT DO
END SELECT
NEXT Y
RR = RR + 1
FOR Y = 3.14 TO 0 STEP -.1
X = SIN(-Y) * 20
Y2 = Y + 0!: X2 = SIN(-Y2) * 25
Y3 = Y + 0!: X3 = SIN(-Y2) * 30
Y4 = Y + 0!: X4 = SIN(-Y2) * 35
PUT ((X * 4) + 160, (Y * 50) + 25), AAA%, PSET
PUT ((X2 * 4) + 160, (Y2 * 50) + 25), BB%, PSET
PUT ((X3 * 4) + 160, (Y3 * 50) + 25), BB%, PSET
PUT ((X4 * 4) + 160, (Y4 * 50) + 25), CC%, PSET
FOR I = 1 TO 400: NEXT I
PUT ((X * 4) + 160, (Y * 50) + 25), DD%, PSET
PUT ((X2 * 4) + 160, (Y2 * 50) + 25), DD%, PSET
PUT ((X3 * 4) + 160, (Y3 * 50) + 25), DD%, PSET
PUT ((X4 * 4) + 160, (Y4 * 50) + 25), DD%, PSET
SELECT CASE INKEY$
CASE IS > ""
 EXIT DO
END SELECT
NEXT Y
RR = RR + 1
LOOP UNTIL INKEY$ > "" OR RR = 2
Z = 63: Z2 = Z: Z3 = Z

DO
PALETTE 1, (256 ^ 2 * Z) + (256 * Z) + Z
PALETTE 2, (256 ^ 2 * Z2) + (256 * Z) + Z
PALETTE 4, (256 ^ 2 * Z) + (256 * Z2) + Z3
PALETTE 14, (256 ^ 2 * Z3) + (256 * Z2) + Z
IF Z > 0 THEN Z = Z - 1
IF Z = 0 AND Z2 > 0 THEN Z2 = Z2 - 1
IF Z2 = 0 THEN Z3 = Z3 - 1
LOOP UNTIL Z3 = 0

SCREEN 7: SCREEN 13
COLOR 15

END SUB

SUB MouseDriver (ax%, BX%, cx%, dx%)
  DEF SEG = VARSEG(Mouse$)
  Mouse% = SADD(Mouse$)
  CALL Absolute(ax%, BX%, cx%, dx%, Mouse%)
END SUB

SUB MouseHide
 ax% = 2
 MouseDriver ax%, 0, 0, 0
END SUB

FUNCTION MouseInit%
  ax% = 0
  MouseDriver ax%, 0, 0, 0
  MouseInit% = ax%
END FUNCTION

SUB MousePut (X%, Y%)
  ax% = 4
  cx% = X%
  dx% = Y%
  MouseDriver ax%, 0, cx%, dx%
END SUB

SUB MouseRange (X1%, Y1%, X2%, Y2%)
  ax% = 7
  cx% = X1%
  dx% = X2%
  MouseDriver ax%, 0, cx%, dx%
  ax% = 8
  cx% = Y1%
  dx% = Y2%
  MouseDriver ax%, 0, cx%, dx%
END SUB

SUB MouseShow
  ax% = 1
  MouseDriver ax%, 0, 0, 0
END SUB

SUB MouseStatus (Lb%, Rb%, xm%, ym%)
  ax% = 3
  MouseDriver ax%, BX%, cx%, dx%
  Lb% = ((BX% AND 1) <> 0)
  Rb% = ((BX% AND 2) <> 0)
  xm% = cx%
  ym% = dx%
END SUB

SUB Paus (PMS)
FOR I = 0 TO 10 * ComputerSpeed * PMS: SBNextNote: NEXT I
END SUB

DEFINT A-B
SUB Quiet
FOR A9 = 0 TO 244: OUT &H388, A9
FOR A7 = 1 TO 6: A11 = INP(&H388): NEXT
OUT &H389, 0
FOR A7 = 1 TO 35: A11 = INP(&H388): NEXT: NEXT
END SUB

DEFSNG A-B
SUB SBINIT STATIC
BASSGUITAR(1) = 1
BASSGUITAR(2) = 51
BASSGUITAR(3) = 138
BASSGUITAR(4) = 72
BASSGUITAR(5) = 241
BASSGUITAR(6) = 241
BASSGUITAR(7) = 17
BASSGUITAR(8) = 179
BASSGUITAR(9) = 0
BASSGUITAR(10) = 0
BASSGUITAR(11) = 6
BASSGUITAR(12) = 0
PERCUSSION(1) = 1
PERCUSSION(2) = 51
PERCUSSION(3) = 138
PERCUSSION(4) = 67
PERCUSSION(5) = 135
PERCUSSION(6) = 101
PERCUSSION(7) = 67
PERCUSSION(8) = 33
PERCUSSION(9) = 18
PERCUSSION(10) = 52
PERCUSSION(11) = 86
PERCUSSION(12) = 120
SNAREDRUM(1) = 16
SNAREDRUM(2) = 0
SNAREDRUM(3) = 133
SNAREDRUM(4) = 0
SNAREDRUM(5) = 255
SNAREDRUM(6) = 16
SNAREDRUM(7) = 4
SNAREDRUM(8) = 177
SNAREDRUM(9) = 0
SNAREDRUM(10) = 0
SNAREDRUM(11) = 15
SNAREDRUM(12) = 255
FUNKBASS(1) = 17
FUNKBASS(2) = 17
FUNKBASS(3) = 129
FUNKBASS(4) = 0
FUNKBASS(5) = 17
FUNKBASS(6) = 18
FUNKBASS(7) = 17
FUNKBASS(8) = 179
FUNKBASS(9) = 0
FUNKBASS(10) = 0
FUNKBASS(11) = 6
FUNKBASS(12) = 0
ChurchBell(1) = 37
ChurchBell(2) = 51
ChurchBell(3) = 138
ChurchBell(4) = 0
ChurchBell(5) = 241
ChurchBell(6) = 241
ChurchBell(7) = 17
ChurchBell(8) = 179
ChurchBell(9) = 0
ChurchBell(10) = 0
ChurchBell(11) = 6
ChurchBell(12) = 0
CHIMES(1) = 4
CHIMES(2) = 51
CHIMES(3) = 138
CHIMES(4) = 0
CHIMES(5) = 241
CHIMES(6) = 241
CHIMES(7) = 32
CHIMES(8) = 179
CHIMES(9) = 0
CHIMES(10) = 162
CHIMES(11) = 170
CHIMES(12) = 0
STEELDRUMS(1) = 213
STEELDRUMS(2) = 82
STEELDRUMS(3) = 0
STEELDRUMS(4) = 5
STEELDRUMS(5) = 240
STEELDRUMS(6) = 164
STEELDRUMS(7) = 28
STEELDRUMS(8) = 181
STEELDRUMS(9) = 5
STEELDRUMS(10) = 181
STEELDRUMS(11) = 0
STEELDRUMS(12) = 5
MUSICBACK = 0: MREPEAT = 0: SETOCTAVE = 3: SONGPOS = 1: SONGLEN = 199
SETLENGTH = 1: SETCHANNEL = 0: SONGDELAY = .1: sblasttime! = TIMER
FOR sbn% = 1 TO 12
SbNull(sbn%) = 0
NEXT
FOR X = &H0 TO &HF5
OUT &H388, X: OUT &H389, 0
NEXT X
note(1) = &H16B: note(2) = &H181: note(3) = &H198: note(4) = &H1B0: note(5) = &H1CA: note(6) = &H1E5
note(7) = &H202: note(8) = &H220: note(9) = &H241: note(10) = &H263: note(11) = &H287: note(12) = &H2AE
FOR mclr% = 0 TO 3: FOR mcl2% = 1 TO 200
NOTECODE(mclr%, mcl2%) = 1: NEXT: NEXT
SETINSTRUMENT 0, CHIMES()
SETINSTRUMENT 1, CHIMES()
SETINSTRUMENT 2, CHIMES()
SETINSTRUMENT 3, CHIMES()
END SUB

SUB SBNextNote STATIC
IF MREPEAT = 0 AND SONGPOS = SONGLEN + 1 THEN EXIT SUB
sbstart! = TIMER
IF (sblasttime! + SONGDELAY) > 86400 THEN
sbFinish! = ((sblasttime! + SONGDELAY) - 86400)
ELSE
sbFinish! = sblasttime! + SONGDELAY
END IF
IF sbstart! >= sbFinish! THEN
FOR X% = 1 TO 4
IF snd(X% - 1, SONGPOS) <> snd(X% - 1, SONGPOS - 1) THEN SbStopNote X% - 1
NEXT X%
FOR X% = 1 TO 4
SbSendInfo X% - 1, snd(X% - 1, SONGPOS), oct(X% - 1, SONGPOS)
NEXT X%
SONGPOS = SONGPOS + 1
IF SONGPOS = SONGLEN + 1 AND MREPEAT = 1 THEN SONGPOS = 1
sblasttime! = TIMER
END IF
END SUB

SUB SbOutPort (port, info%)
OUT &H388, port
OUT &H389, info%
END SUB

SUB SBPLAY (sbp$) STATIC
FOR tpos% = 1 TO LEN(sbp$)
IF SONGPOS = 200 THEN SONGPOS = 199
IF tpos% < LEN(sbp$) THEN xpos% = tpos% + 1 ELSE xpos% = tpos%
chk$ = UCASE$(MID$(sbp$, tpos%, 1))
IF chk$ = ";" THEN
NOTECODE(SETCHANNEL, SONGPOS) = -1
oklen% = 0
FOR getsp% = 1 TO SONGPOS - 1
oklen% = oklen% + VAL(RIGHT$(STR$(NOTECODE(SETCHANNEL, getsp%)), 2))
NEXT
SONGLEN = oklen%
SONGPOS = 1
END IF
IF chk$ = "O" THEN
SETOCTAVE = VAL(MID$(sbp$, xpos%, 1))
IF SETOCTAVE > 6 THEN SETOCTAVE = 6
IF SETOCTAVE < 0 THEN SETOCTAVE = 0
tpos% = tpos% + 1
END IF
IF chk$ = "M" THEN
ch2$ = UCASE$(MID$(sbp$, xpos%, 1))
SELECT CASE ch2$
CASE "B"
MUSICBACK = 1
CASE "F"
MUSICBACK = 0
CASE "R"
MREPEAT = 1
CASE "T"
MREPEAT = 0
CASE "C"
FOR mclr% = 0 TO 3: FOR mcl2% = 1 TO 200
NOTECODE(mclr%, mcl2%) = 1: NEXT: NEXT
SONGPOS = 1: SETCHANNEL = 0: SETLENGTH = 1
CASE "0"
FOR mcl2% = 1 TO 200
NOTECODE(0, mcl2%) = 1: NEXT
CASE "1"
FOR mcl2% = 1 TO 200
NOTECODE(1, mcl2%) = 1: NEXT
CASE "2"
FOR mcl2% = 1 TO 200
NOTECODE(2, mcl2%) = 1: NEXT
CASE "3"
FOR mcl2% = 1 TO 200
NOTECODE(3, mcl2%) = 1: NEXT
END SELECT
tpos% = tpos% + 1
END IF
IF chk$ = "T" THEN
sbaddmeup% = 0
FOR mslr% = tpos% + 1 TO LEN(sbp$)
ch2$ = MID$(sbp$, mslr%, 1)
IF ch2$ < "0" AND ch2$ <> "." OR ch2$ > "9" AND ch2$ <> "." THEN
ch3$ = MID$(sbp$, tpos% + 1, sbaddmeup%)
IF ch3$ = "." THEN ch3$ = ".1"
SONGDELAY = VAL(ch3$)
tpos% = mslr% - 1
GOTO EndIfPart2InThisSBBG3SUB
END IF
sbaddmeup% = sbaddmeup% + 1
NEXT
EndIfPart2InThisSBBG3SUB:
END IF
IF chk$ = "L" THEN
SETLENGTH = VAL(MID$(sbp$, xpos%, 2))
IF SETLENGTH > 16 THEN SETLENGTH = 16
IF SETLENGTH < 1 THEN SETLENGTH = 1
tpos% = tpos% + 2
END IF
IF chk$ = "V" THEN
SETCHANNEL = VAL(MID$(sbp$, xpos%, 1))
IF SETCHANNEL < 0 THEN SETCHANNEL = 0
IF SETCHANNEL > 3 THEN SETCHANNEL = 3
SONGPOS = 1
tpos% = tpos% + 1
END IF
IF chk$ = ">" THEN
SETOCTAVE = SETOCTAVE + 1
IF SETOCTAVE > 6 THEN SETOCTAVE = 6
END IF
IF chk$ = "<" THEN
SETOCTAVE = SETOCTAVE - 1
IF SETOCTAVE < 1 THEN SETOCTAVE = 1
END IF
IF chk$ = "P" THEN
ahahaha% = VAL(MID$(sbp$, xpos%, 2))
IF ahahaha% > 16 THEN ahahaha% = 16
IF ahahaha% < 1 THEN ahahaha% = 1
NOTECODE(SETCHANNEL, SONGPOS) = ahahaha%
SONGPOS = SONGPOS + 1
tpos% = tpos% + 2
END IF
IF chk$ = "C" THEN
thislength% = 0
addamount% = 0
gimmenote$ = MID$(sbp$, xpos%, 1)
IF gimmenote$ = "0" OR gimmenote$ = "1" THEN
thislength% = VAL(MID$(sbp$, xpos%, 2))
IF thislength% > 16 THEN thislength% = 16
IF thislength% < 1 THEN thislength% = 1
tpos% = tpos% + 2
END IF
IF gimmenote$ = "+" OR gimmenote$ = "#" THEN
addamount% = 1
tpos% = tpos% + 1
ch2$ = MID$(sbp$, xpos% + 1, 2)
IF LEFT$(ch2$, 1) = "1" OR LEFT$(ch2$, 1) = "0" THEN
tpos% = tpos% + 2
thislength% = VAL(ch2$)
IF thislength% > 16 THEN thislength% = 16
IF thislength% < 1 THEN thislength% = 1
END IF
END IF
IF gimmenote$ = "-" THEN
addamount% = 0
tpos% = tpos% + 1
ch2$ = MID$(sbp$, xpos% + 1, 2)
IF LEFT$(ch2$, 1) = "1" OR LEFT$(ch2$, 1) = "0" THEN
tpos% = tpos% + 2
thislength% = VAL(ch2$)
IF thislength% > 16 THEN thislength% = 16
IF thislength% < 1 THEN thislength% = 1
END IF
END IF
IF thislength% = 0 THEN thislength% = SETLENGTH
NOTECODE(SETCHANNEL, SONGPOS) = SETOCTAVE * 5000
NOTECODE(SETCHANNEL, SONGPOS) = NOTECODE(SETCHANNEL, SONGPOS) * 2 + (1 + addamount%) * 100 + thislength%
SONGPOS = SONGPOS + 1
addamount% = 0: thislength% = 0
END IF
IF chk$ = "D" THEN
thislength% = 0
addamount% = 0
gimmenote$ = MID$(sbp$, xpos%, 1)
IF gimmenote$ = "0" OR gimmenote$ = "1" THEN
thislength% = VAL(MID$(sbp$, xpos%, 2))
IF thislength% > 16 THEN thislength% = 16
IF thislength% < 1 THEN thislength% = 1
tpos% = tpos% + 2
END IF
IF gimmenote$ = "+" OR gimmenote$ = "#" THEN
addamount% = 1
tpos% = tpos% + 1
ch2$ = MID$(sbp$, xpos% + 1, 2)
IF LEFT$(ch2$, 1) = "1" OR LEFT$(ch2$, 1) = "0" THEN
tpos% = tpos% + 2
thislength% = VAL(ch2$)
IF thislength% > 16 THEN thislength% = 16
IF thislength% < 1 THEN thislength% = 1
END IF
END IF
IF gimmenote$ = "-" THEN
addamount% = -1
tpos% = tpos% + 1
ch2$ = MID$(sbp$, xpos% + 1, 2)
IF LEFT$(ch2$, 1) = "1" OR LEFT$(ch2$, 1) = "0" THEN
tpos% = tpos% + 2
thislength% = VAL(ch2$)
IF thislength% > 16 THEN thislength% = 16
IF thislength% < 1 THEN thislength% = 1
END IF
END IF
IF thislength% = 0 THEN thislength% = SETLENGTH
NOTECODE(SETCHANNEL, SONGPOS) = SETOCTAVE * 5000
NOTECODE(SETCHANNEL, SONGPOS) = NOTECODE(SETCHANNEL, SONGPOS) * 2 + (3 + addamount%) * 100 + thislength%
SONGPOS = SONGPOS + 1
addamount% = 0: thislength% = 0
END IF
IF chk$ = "E" THEN
thislength% = 0
addamount% = 0
gimmenote$ = MID$(sbp$, xpos%, 1)
IF gimmenote$ = "0" OR gimmenote$ = "1" THEN
thislength% = VAL(MID$(sbp$, xpos%, 2))
IF thislength% > 16 THEN thislength% = 16
IF thislength% < 1 THEN thislength% = 1
tpos% = tpos% + 2
END IF
IF gimmenote$ = "+" OR gimmenote$ = "#" THEN
addamount% = 0
tpos% = tpos% + 1
ch2$ = MID$(sbp$, xpos% + 1, 2)
IF LEFT$(ch2$, 1) = "1" OR LEFT$(ch2$, 1) = "0" THEN
tpos% = tpos% + 2
thislength% = VAL(ch2$)
IF thislength% > 16 THEN thislength% = 16
IF thislength% < 1 THEN thislength% = 1
END IF
END IF
IF gimmenote$ = "-" THEN
addamount% = -1
tpos% = tpos% + 1
ch2$ = MID$(sbp$, xpos% + 1, 2)
IF LEFT$(ch2$, 1) = "1" OR LEFT$(ch2$, 1) = "0" THEN
tpos% = tpos% + 2
thislength% = VAL(ch2$)
IF thislength% > 16 THEN thislength% = 16
IF thislength% < 1 THEN thislength% = 1
END IF
END IF
IF thislength% = 0 THEN thislength% = SETLENGTH
NOTECODE(SETCHANNEL, SONGPOS) = SETOCTAVE * 5000
NOTECODE(SETCHANNEL, SONGPOS) = NOTECODE(SETCHANNEL, SONGPOS) * 2 + (5 + addamount%) * 100 + thislength%
SONGPOS = SONGPOS + 1
addamount% = 0: thislength% = 0
END IF

IF chk$ = "F" THEN
thislength% = 0
addamount% = 0
gimmenote$ = MID$(sbp$, xpos%, 1)
IF gimmenote$ = "0" OR gimmenote$ = "1" THEN
thislength% = VAL(MID$(sbp$, xpos%, 2))
IF thislength% > 16 THEN thislength% = 16
IF thislength% < 1 THEN thislength% = 1
tpos% = tpos% + 2
END IF
IF gimmenote$ = "+" OR gimmenote$ = "#" THEN
addamount% = 1
tpos% = tpos% + 1
ch2$ = MID$(sbp$, xpos% + 1, 2)
IF LEFT$(ch2$, 1) = "1" OR LEFT$(ch2$, 1) = "0" THEN
tpos% = tpos% + 2
thislength% = VAL(ch2$)
IF thislength% > 16 THEN thislength% = 16
IF thislength% < 1 THEN thislength% = 1
END IF
END IF
IF gimmenote$ = "-" THEN
addamount% = 0
tpos% = tpos% + 1
ch2$ = MID$(sbp$, xpos% + 1, 2)
IF LEFT$(ch2$, 1) = "1" OR LEFT$(ch2$, 1) = "0" THEN
tpos% = tpos% + 2
thislength% = VAL(ch2$)
IF thislength% > 16 THEN thislength% = 16
IF thislength% < 1 THEN thislength% = 1
END IF
END IF
IF thislength% = 0 THEN thislength% = SETLENGTH
NOTECODE(SETCHANNEL, SONGPOS) = SETOCTAVE * 5000
NOTECODE(SETCHANNEL, SONGPOS) = NOTECODE(SETCHANNEL, SONGPOS) * 2 + (6 + addamount%) * 100 + thislength%
SONGPOS = SONGPOS + 1
addamount% = 0: thislength% = 0
END IF

IF chk$ = "G" THEN
thislength% = 0
addamount% = 0
gimmenote$ = MID$(sbp$, xpos%, 1)
IF gimmenote$ = "0" OR gimmenote$ = "1" THEN
thislength% = VAL(MID$(sbp$, xpos%, 2))
IF thislength% > 16 THEN thislength% = 16
IF thislength% < 1 THEN thislength% = 1
tpos% = tpos% + 2
END IF
IF gimmenote$ = "+" OR gimmenote$ = "#" THEN
addamount% = 1
tpos% = tpos% + 1
ch2$ = MID$(sbp$, xpos% + 1, 2)
IF LEFT$(ch2$, 1) = "1" OR LEFT$(ch2$, 1) = "0" THEN
tpos% = tpos% + 2
thislength% = VAL(ch2$)
IF thislength% > 16 THEN thislength% = 16
IF thislength% < 1 THEN thislength% = 1
END IF
END IF
IF gimmenote$ = "-" THEN
addamount% = -1
tpos% = tpos% + 1
ch2$ = MID$(sbp$, xpos% + 1, 2)
IF LEFT$(ch2$, 1) = "1" OR LEFT$(ch2$, 1) = "0" THEN
tpos% = tpos% + 2
thislength% = VAL(ch2$)
IF thislength% > 16 THEN thislength% = 16
IF thislength% < 1 THEN thislength% = 1
END IF
END IF
IF thislength% = 0 THEN thislength% = SETLENGTH
NOTECODE(SETCHANNEL, SONGPOS) = SETOCTAVE * 5000
NOTECODE(SETCHANNEL, SONGPOS) = NOTECODE(SETCHANNEL, SONGPOS) * 2 + (8 + addamount%) * 100 + thislength%
SONGPOS = SONGPOS + 1
addamount% = 0: thislength% = 0
END IF

IF chk$ = "A" THEN
thislength% = 0
addamount% = 0
gimmenote$ = MID$(sbp$, xpos%, 1)
IF gimmenote$ = "0" OR gimmenote$ = "1" THEN
thislength% = VAL(MID$(sbp$, xpos%, 2))
IF thislength% > 16 THEN thislength% = 16
IF thislength% < 1 THEN thislength% = 1
tpos% = tpos% + 2
END IF
IF gimmenote$ = "+" OR gimmenote$ = "#" THEN
addamount% = 1
tpos% = tpos% + 1
ch2$ = MID$(sbp$, xpos% + 1, 2)
IF LEFT$(ch2$, 1) = "1" OR LEFT$(ch2$, 1) = "0" THEN
tpos% = tpos% + 2
thislength% = VAL(ch2$)
IF thislength% > 16 THEN thislength% = 16
IF thislength% < 1 THEN thislength% = 1
END IF
END IF
IF gimmenote$ = "-" THEN
addamount% = -1
tpos% = tpos% + 1
ch2$ = MID$(sbp$, xpos% + 1, 2)
IF LEFT$(ch2$, 1) = "1" OR LEFT$(ch2$, 1) = "0" THEN
tpos% = tpos% + 2
thislength% = VAL(ch2$)
IF thislength% > 16 THEN thislength% = 16
IF thislength% < 1 THEN thislength% = 1
END IF
END IF
IF thislength% = 0 THEN thislength% = SETLENGTH
NOTECODE(SETCHANNEL, SONGPOS) = SETOCTAVE * 5000
NOTECODE(SETCHANNEL, SONGPOS) = NOTECODE(SETCHANNEL, SONGPOS) * 2 + (10 + addamount%) * 100 + thislength%
SONGPOS = SONGPOS + 1
addamount% = 0: thislength% = 0
END IF

IF chk$ = "B" THEN
thislength% = 0
addamount% = 0
gimmenote$ = MID$(sbp$, xpos%, 1)
IF gimmenote$ = "0" OR gimmenote$ = "1" THEN
thislength% = VAL(MID$(sbp$, xpos%, 2))
IF thislength% > 16 THEN thislength% = 16
IF thislength% < 1 THEN thislength% = 1
tpos% = tpos% + 2
END IF
IF gimmenote$ = "+" OR gimmenote$ = "#" THEN
addamount% = 0
tpos% = tpos% + 1
ch2$ = MID$(sbp$, xpos% + 1, 2)
IF LEFT$(ch2$, 1) = "1" OR LEFT$(ch2$, 1) = "0" THEN
tpos% = tpos% + 2
thislength% = VAL(ch2$)
IF thislength% > 16 THEN thislength% = 16
IF thislength% < 1 THEN thislength% = 1
END IF
END IF
IF gimmenote$ = "-" THEN
addamount% = -1
tpos% = tpos% + 1
ch2$ = MID$(sbp$, xpos% + 1, 2)
IF LEFT$(ch2$, 1) = "1" OR LEFT$(ch2$, 1) = "0" THEN
tpos% = tpos% + 2
thislength% = VAL(ch2$)
IF thislength% > 16 THEN thislength% = 16
IF thislength% < 1 THEN thislength% = 1
END IF
END IF
IF thislength% = 0 THEN thislength% = SETLENGTH
NOTECODE(SETCHANNEL, SONGPOS) = SETOCTAVE * 5000
NOTECODE(SETCHANNEL, SONGPOS) = NOTECODE(SETCHANNEL, SONGPOS) * 2 + (12 + addamount%) * 100 + thislength%
SONGPOS = SONGPOS + 1
addamount% = 0: thislength% = 0
END IF
NEXT
GOSUB EndOfSUBSBPLAY
IF MUSICBACK = 0 THEN SBSEQUENCE
EXIT SUB
EndOfSUBSBPLAY:
FOR v% = 0 TO 3: ct% = 0: countsbm% = 1
NOTES11:
IF countsbm% < 201 THEN
D! = NOTECODE(v%, countsbm%)
ELSE
D! = -1
END IF
countsbm% = countsbm% + 1
IF D! = -1 THEN GOTO NOTES22
oc% = INT(D! / 10000)
sd% = INT((D! - INT(D! / 10000) * 10000) / 100)
dr1% = INT(D! - INT(D! / 10000) * 10000)
dr% = dr1% - (INT(dr1% / 100) * 100)
FOR Z% = 1 TO dr%: ct% = ct% + 1
IF ct% > 200 THEN GOTO NOTES11
snd(v%, ct%) = note(sd%)
oct(v%, ct%) = oc%
NEXT Z%: GOTO NOTES11
NOTES22:
ct% = ct% + 1
NEXT v%
RETURN
END SUB

SUB SBPLAYNOTE STATIC
IF MREPEAT = 0 AND SONGPOS = SONGLEN + 1 THEN EXIT SUB
FOR X% = 1 TO 4
IF snd(X% - 1, SONGPOS) <> snd(X% - 1, SONGPOS - 1) THEN SbStopNote X% - 1
NEXT X%
FOR X% = 1 TO 4
SbSendInfo X% - 1, snd(X% - 1, SONGPOS), oct(X% - 1, SONGPOS)
NEXT X%
SONGPOS = SONGPOS + 1
IF SONGPOS = SONGLEN + 1 AND MREPEAT = 1 THEN SONGPOS = 1
DELAY SONGDELAY
END SUB

SUB SbSendInfo (voice, frequency, octave)
SbOutPort &HA0 + voice, frequency AND &HFF
SbOutPort &HB0 + voice, INT(frequency / 256) OR 32 OR (octave * 4)
END SUB

SUB SBSEQUENCE STATIC
IF MREPEAT = 1 THEN
DO
SBPLAYNOTE
LOOP UNTIL INKEY$ = CHR$(27)
SBSTOP
ELSE
DO
SBPLAYNOTE
LOOP UNTIL SONGPOS = SONGLEN + 1
SONGPOS = 1
SBSTOP
END IF
END SUB

SUB SBSTOP STATIC
FOR X% = 0 TO 4: SbStopNote X%: NEXT X%
SONGPOS = 1: sblasttime! = 0
END SUB

SUB SbStopNote (voice%)
SbOutPort &HB0 + voice%, 0
END SUB

SUB SbVoiceFile (a$, B$, C$, D$) STATIC
OPEN a$ + ".SBI" FOR INPUT AS #20
FOR I = 1 TO 12: INPUT #20, Insdat0%(I): NEXT I
CLOSE #20
OPEN B$ + ".SBI" FOR INPUT AS #20
FOR I = 1 TO 12: INPUT #20, Insdat1%(I): NEXT I
CLOSE #20
OPEN C$ + ".SBI" FOR INPUT AS #20
FOR I = 1 TO 12: INPUT #20, Insdat2%(I): NEXT I
CLOSE #20
OPEN D$ + ".SBI" FOR INPUT AS #20
FOR I = 1 TO 12: INPUT #20, Insdat3%(I): NEXT I
CLOSE #20
SETINSTRUMENT 0, Insdat0%(): SETINSTRUMENT 1, Insdat1%()
SETINSTRUMENT 2, Insdat2%(): SETINSTRUMENT 3, Insdat3%()
END SUB

SUB SETINSTRUMENT (voice%, dat%())
     IF voice% < 3 THEN avoice% = voice%
     IF voice% = 3 THEN avoice% = 8
     IF voice% = 4 THEN avoice% = 9
     IF voice% = 5 THEN avoice% = 10
     IF voice% = 6 THEN avoice% = 16
     IF voice% = 7 THEN avoice% = 17
     IF voice% = 8 THEN avoice% = 18
     SbOutPort &H20 + avoice%, dat%(1)
     SbOutPort &H23 + avoice%, dat%(2)
     SbOutPort &H40 + avoice%, dat%(3)
     SbOutPort &H43 + avoice%, dat%(4)
     SbOutPort &H60 + avoice%, dat%(5)
     SbOutPort &H63 + avoice%, dat%(6)
     SbOutPort &H80 + avoice%, dat%(7)
     SbOutPort &H83 + avoice%, dat%(8)
     SbOutPort &HE0 + avoice%, dat%(9)
     SbOutPort &HE3 + avoice%, dat%(10)
     SbOutPort &HC0 + voice%, dat%(11)
     sbsbstat% = 0
     FOR sbabc% = 1 TO 12
     sbsbstat% = sbsbstat% + dat%(sbabc%)
     NEXT
     FOR sbabc% = 1 TO 12
     IF voice% = 0 AND sbsbstat% > 0 THEN Insdat0%(sbabc%) = dat%(sbabc%)
     IF voice% = 1 AND sbsbstat% > 0 THEN Insdat1%(sbabc%) = dat%(sbabc%)
     IF voice% = 2 AND sbsbstat% > 0 THEN Insdat2%(sbabc%) = dat%(sbabc%)
     IF voice% >= 3 AND sbsbstat% > 0 THEN Insdat3%(sbabc%) = dat%(sbabc%)
     NEXT
END SUB

SUB SoundOff
OUT &H388, &HB0: FOR A7 = 1 TO 6: A11 = INP(&H388): NEXT
OUT &H389, 0: FOR A7 = 1 TO 35: A11 = INP(&H388): NEXT
OUT &H388, &HB1: FOR A7 = 1 TO 6: A11 = INP(&H388): NEXT
OUT &H389, 0: FOR A7 = 1 TO 35: A11 = INP(&H388): NEXT
OUT &H388, &HB2: FOR A7 = 1 TO 6: A11 = INP(&H388): NEXT
OUT &H389, 0: FOR A7 = 1 TO 35: A11 = INP(&H388): NEXT
OUT &H388, &HB3: FOR A7 = 1 TO 6: A11 = INP(&H388): NEXT
OUT &H389, 0: FOR A7 = 1 TO 35: A11 = INP(&H388): NEXT
OUT &H388, &HB4: FOR A7 = 1 TO 6: A11 = INP(&H388): NEXT
OUT &H389, 0: FOR A7 = 1 TO 35: A11 = INP(&H388): NEXT
OUT &H388, &HB5: FOR A7 = 1 TO 6: A11 = INP(&H388): NEXT
OUT &H389, 0: FOR A7 = 1 TO 35: A11 = INP(&H388): NEXT
OUT &H388, &HB6: FOR A7 = 1 TO 6: A11 = INP(&H388): NEXT
OUT &H389, 0: FOR A7 = 1 TO 35: A11 = INP(&H388): NEXT
OUT &H388, &HB7: FOR A7 = 1 TO 6: A11 = INP(&H388): NEXT
OUT &H389, 0: FOR A7 = 1 TO 35: A11 = INP(&H388): NEXT
OUT &H388, &HB8: FOR A7 = 1 TO 6: A11 = INP(&H388): NEXT
OUT &H389, 0: FOR A7 = 1 TO 35: A11 = INP(&H388): NEXT
OUT &H388, &HB9: FOR A7 = 1 TO 6: A11 = INP(&H388): NEXT
OUT &H389, 0: FOR A7 = 1 TO 35: A11 = INP(&H388): NEXT
END SUB

DEFINT A-B
SUB sounds
voice$ = a$(aa)
FOR A9 = 1 TO 44 STEP 4
A3$ = MID$(voice$, A9, 2): A5$ = "&H" + A3$
A4$ = MID$(voice$, A9 + 2, 2): A6$ = "&H" + A4$
OUT &H388, VAL(A5$)
FOR A7 = 1 TO 6: A11 = INP(&H388): NEXT
OUT &H389, VAL(A6$)
FOR A7 = 1 TO 35: A11 = INP(&H389): NEXT: NEXT A9
END SUB

DEFSNG A-B
SUB XolorInit
C = 16
FOR a = 16 TO 61 STEP 3: PALETTE C, (256 ^ 2 * a) + (256 * 0) + 0: C = C + 1: NEXT a
C = 32
FOR a = 16 TO 61 STEP 3: PALETTE C, (256 ^ 2 * 0) + (256 * a) + 0: C = C + 1: NEXT a
C = 48
FOR a = 16 TO 61 STEP 3: PALETTE C, (256 ^ 2 * 0) + (256 * 0) + a: C = C + 1: NEXT a
C = 64
FOR a = 16 TO 61 STEP 3: PALETTE C, (256 ^ 2 * a) + (256 * a) + 0: C = C + 1: NEXT a
C = 80
FOR a = 16 TO 61 STEP 3: PALETTE C, (256 ^ 2 * a) + (256 * 0) + a: C = C + 1: NEXT a
C = 96
FOR a = 16 TO 61 STEP 3: PALETTE C, (256 ^ 2 * 0) + (256 * a) + a: C = C + 1: NEXT a
C = 112: B = 0
FOR a = 16 TO 61 STEP 3: PALETTE C, (256 ^ 2 * a) + (256 * B) + 0: B = B + 3: C = C + 1: NEXT a
C = 128: B = 0
FOR a = 16 TO 61 STEP 3: PALETTE C, (256 ^ 2 * B) + (256 * 0) + a: B = B + 3: C = C + 1: NEXT a
C = 144: B = 0
FOR a = 16 TO 61 STEP 3: PALETTE C, (256 ^ 2 * B) + (256 * a) + 0: B = B + 3: C = C + 1: NEXT a
C = 160: B = 0
FOR a = 16 TO 61 STEP 3: PALETTE C, (256 ^ 2 * B) + (256 * a) + a: B = B + 3: C = C + 1: NEXT a
C = 176: B = 0
FOR a = 16 TO 61 STEP 3: PALETTE C, (256 ^ 2 * a) + (256 * a) + a: C = C + 1: NEXT a
C = 192: B = 12: aa = 0
FOR a = 30 TO 62 STEP 2: PALETTE C, (256 ^ 2 * B) + (256 * aa) + a: B = B + 2: C = C + 1: NEXT a
C = 208: B = 12: aa = 0
FOR a = 30 TO 62 STEP 2: PALETTE C, (256 ^ 2 * B) + (256 * B) + a: B = B + 2: C = C + 1: NEXT a
C = 224: B = 12: aa = 0
FOR a = 30 TO 62 STEP 2: PALETTE C, (256 ^ 2 * aa) + (256 * B) + a: B = B + 2: C = C + 1: NEXT a
END SUB

SUB ZeroCol
FOR U = 16 TO 245
PALETTE U, (256 ^ 2 * 0) + (256 * 0) + 0
NEXT U
END SUB

