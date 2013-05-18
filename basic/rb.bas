





'There have been a large number of basic games uploaded on

'the BB recently.  Tetris, Face Battles, Stick Fighter 2000,

'my own Minefield V2, and unless you've been living under a

'cyber rock, you know about Thomas' Minefield V3.  These a 

'just to name a few!  Whelp, here is another one for you.  

'Red Baron 2573 utilizes a lot of graphics techniques that 

'you may be interested in.  >>>more>>>                     

'Line, Circle, and Pset are used with masking techniques as

'well as page flipping for animation.  Just make sure you  

'grab all 23 notes!                                        

'     I've tested offline using Super-Pro to squish the few

'lines that had to go beyond 60 characters, and it seemed to

'put them back together just fine.  However, there's still no

'guarantee that'll work effectively for you.  So make sure 

'you make a back up copy of the game before you edit it!   

'-Adam                                                     

'P.S.  If you're a Private ASCII fan, type "a" at the main 

'menu.



'COPY to DISK as REDBARON.BAS                              

'Carefully remove the $P remarks.                          

'For best play performance, compile Red Baron into an .EXE!

'Reply with any comments or questions and enjoy the game!  

'Red Baron 2573.  Programmed by Adam Stanchos              

'On Prodigy:  TCMP46B    On AOL:  AdamS60982               

DECLARE SUB Sunset (rxpos%, rypos%)

DECLARE SUB ExtraShipCheck (Score%, Ships%, GainShip%)

DECLARE SUB EnMove (n%, ShipType%)

DECLARE SUB EnemyShipPicture (n%, ShipType%)

DECLARE SUB Statistics (Score%, Ships%)

DECLARE SUB ExplosiveSound ()

DECLARE SUB Explosion (X%, Y%)

DECLARE SUB UpRight (X%, Y%)

DECLARE SUB UpLeft (X%, Y%)

DECLARE SUB DownLeft (X%, Y%)

DECLARE SUB DownRight (X%, Y%)

DECLARE SUB MoveLeft (X%)

DECLARE SUB MoveUp (Y%)

DECLARE SUB MoveDown (Y%)

DECLARE SUB RedBaron ()

DECLARE SUB RedShip ()

DECLARE SUB RedShipMask ()

DECLARE SUB EFighter ()

DECLARE SUB EFighterMask ()

DECLARE SUB EElite ()

DECLARE SUB EEliteMask ()

DECLARE SUB ECommandShip ()

DECLARE SUB ECommandShipMask ()

DECLARE SUB PrivateASCII ()

DECLARE SUB MoveRight (X%)

DECLARE SUB stars ()

DECLARE SUB MainScreen (HScore%, ASCII%)

DECLARE SUB HelpScreen ()

DECLARE SUB Intro ()

DECLARE SUB Conclusion ()

DECLARE SUB Keypad ()

DECLARE SUB Title ()

DECLARE SUB WaveInfo (Wave%, NumberofShips%, Score%, Ships%)

DECLARE SUB YouLose (Score%, Ships%)

DEFINT A-Z

  SCREEN 7, 0, 2, 0

    DEF SEG = &HA000

    DIM SHARED RShip%(1 TO 500), RShipMask%(1 TO 500)



    DIM SHARED EFShip%(1 TO 500), EFShipMask%(1 TO 500)

    DIM SHARED EEShip%(1 TO 500), EEShipMask%(1 TO 500)

    DIM SHARED ECShip%(1 TO 1500), ECShipMask%(1 TO 1500)

    DIM SHARED ASCII%(1 TO 500)

      CALL RedShip: CALL RedShipMask

      CALL EFighter: CALL EFighterMask

      CALL EElite: CALL EEliteMask

      CALL ECommandShip: CALL ECommandShipMask

      CALL PrivateASCII

    DEF FNR (X) = INT(RND * X) + 1

    DIM SHARED SX(20), SY(20), ST(20)

'(continued)                                               



      FOR I = 1 TO 20  'sprinkle some stars                

        SX(I) = FNR(319): SY(I) = FNR(199)

        ST(I) = FNR(2)

      NEXT

    DIM SHARED EX(5), EY(5), Laser(5), Enemy(5), Eshot(5)

    HScore% = 0

    SCREEN 7, 0, 1, 0

LetsStart:                                                 

    CLS

    Score% = 0: Ships% = 3: X% = 150: Y% = 170: ASCII% = 0

    Defeated = 0: Wave = 1: ShipPoints% = 5: GainShip = 0

    CALL MainScreen(HScore%, ASCII%)

DetermineWave:                                             

    IF Ships% < 1 AND Score% > HScore% THEN

      HScore% = Score%

    END IF

    IF Ships% < 1 THEN

      CALL YouLose(Score%, Ships%): GOTO LetsStart

    END IF

    IF Wave > 25 THEN

      CALL Conclusion

      IF Score% > HScore% THEN HScore% = Score%

      GOTO LetsStart

    END IF

'------                                                    

    IF ASCII% = 1 THEN

      RangeLeft = 24: RangeRight = 25: ELXC = 23: ELYC = 16

      Wave = 0: ShipPoints% = 100: ShipType = 4: OutOf = 20

    END IF

    IF Wave = 1 THEN

      RangeLeft = 24: RangeRight = 25: ELXC = 23: ELYC = 16

      ShipPoints% = 5: ShipType = 1: OutOf = 20

    END IF

    IF Wave = 15 THEN

      RangeLeft = 24: RangeRight = 25: ELXC = 23: ELYC = 16

      ShipPoints% = 10: ShipType = 2: OutOf = 1

    END IF

    IF Wave = 16 THEN

      RangeLeft = 24: RangeRight = 25: ELXC = 23: ELYC = 16

      ShipPoints% = 5: ShipType = 1: OutOf = 20

    END IF

    IF Wave = 17 THEN

      RangeLeft = 24: RangeRight = 25: ELXC = 23: ELYC = 16

      ShipPoints% = 10: ShipType = 2: OutOf = 1



    END IF

    IF Wave = 20 THEN

      RangeLeft = 24: RangeRight = 25: ELXC = 23: ELYC = 16

      ShipPoints% = 5: ShipType = 1: OutOf = 20

    END IF

    IF Wave = 21 THEN

      RangeLeft = 24: RangeRight = 25: ELXC = 23: ELYC = 16

      ShipPoints% = 10: ShipType = 2: OutOf = 1

    END IF

    IF Wave = 25 THEN

      RangeLeft = 89: RangeRight = 90

'(continued)                                               



      ELXC = 88: ELYC = 43: HitC = 0: PLAY "mbo1l4dl16cl2f"

      ShipPoints% = 50: ShipType = 3: OutOf = 1

    END IF

    CALL WaveInfo(Wave, NumberofShips, Score%, Ships%)

      FOR n = 1 TO NumberofShips

        Laser(n) = -10: Enemy(n) = 1: EY(n) = 29

        Eshot(n) = 0

      NEXT

    EX(1) = 137: EX(2) = 90: EX(3) = 200: EX(4) = 40

    EX(5) = 250: X% = 140: Y% = 170: RANDOMIZE TIMER

    GOSUB Update

                                                            

KeyboardInput:                                             

  a$ = INKEY$

    IF a$ = CHR$(0) + CHR$(77) THEN

       CALL MoveRight(X%): GOSUB Update

       END IF

    IF a$ = CHR$(0) + CHR$(75) THEN

       CALL MoveLeft(X%): GOSUB Update

       END IF

    IF a$ = CHR$(0) + CHR$(72) THEN

       CALL MoveUp(Y%): GOSUB Update

       END IF

    IF a$ = CHR$(0) + CHR$(80) THEN

       CALL MoveDown(Y%): GOSUB Update

       END IF

    IF a$ = CHR$(0) + CHR$(73) THEN

       CALL UpRight(X%, Y%): GOSUB Update

       END IF

    IF a$ = CHR$(0) + CHR$(71) THEN

       CALL UpLeft(X%, Y%): GOSUB Update

       END IF

    IF a$ = CHR$(0) + CHR$(79) THEN

       CALL DownLeft(X%, Y%): GOSUB Update

       END IF

    IF a$ = CHR$(0) + CHR$(81) THEN

       CALL DownRight(X%, Y%): GOSUB Update

       END IF

    IF a$ = CHR$(32) THEN GOSUB Shoot

    IF a$ = "q" THEN Ships% = 0: GOTO DetermineWave

  GOSUB PlaceEShip

    IF Lostaship = 1 THEN

      Lostaship = 0: Defeated = 0: GOTO DetermineWave

      END IF



    IF Defeated = NumberofShips THEN

      Defeated = 0: Wave = Wave + 1: GOTO DetermineWave

      END IF

  GOTO KeyboardInput

                                                            

Update:                                                    

  SCREEN 7, 0, 2, 0: PCOPY 1, 2

  CALL stars

  PUT (X%, Y%), RShipMask%, AND

  PUT (X%, Y%), RShip%, XOR

    FOR n = 1 TO NumberofShips

'(continued)                                               



      IF Enemy(n) = 0 THEN GOTO DoneWithIt

      CALL EnemyShipPicture(n, ShipType)

  IF Eshot(n) = 1 THEN GOSUB EShoot 'lasers be shown?      

DoneWithIt:                                                

    NEXT

    CALL Statistics(Score%, Ships%)

  SCREEN 7, 0, 0, 0: PCOPY 2, 0: PCOPY 1, 2

  RETURN

                                                            

PlaceEShip:                                                

  SCREEN 7, 0, 2, 0: PCOPY 1, 2

  CALL stars

    FOR n = 1 TO NumberofShips

      IF Enemy(n) = 0 THEN GOTO DoneWithShip2

    CALL EnMove(n, ShipType)

      CALL EnemyShipPicture(n, ShipType)

      IF Eshot(n) = 1 THEN

        Laser(n) = Laser(n) + 5: GOSUB EShoot

        END IF

    Doesitshoot = INT(RND * OutOf) + 1

      IF Doesitshoot = 1 AND Eshot(n) = 0 THEN

        Eshot(n) = 1: Laser(n) = EY(n) + ELYC

        PLAY "o4mbl64 a": GOSUB EShoot

        END IF

DoneWithShip2:                                             

    NEXT

  PUT (X, Y), RShipMask%, AND

  PUT (X, Y), RShip%, XOR

  CALL Statistics(Score%, Ships%)

      IF Lostaship = 1 THEN CALL Explosion(X%, Y%)

  SCREEN 7, 0, 0, 0: PCOPY 2, 0: PCOPY 1, 2

  RETURN

                                                            

Shoot:                                                     

  LINE (X + 7, Y + 5)-(X + 7, 8), 1

  LINE (X + 27, Y + 5)-(X + 27, 8), 1

  PLAY "o4mbl64 a b"

    FOR n = 1 TO NumberofShips



      IF X + 5 > EX(n) - 3 AND X + 5 < EX(n) + RangeLeft THEN

        FOR Grow = 1 TO 5

          CIRCLE (X + 7, EY(n) + 10), Grow, 14: NEXT

        CALL ExplosiveSound

        FOR Grow = 6 TO 8



          CIRCLE (X + 7, EY(n) + 10), Grow, 12: NEXT

        FOR Grow = 9 TO 10

          CIRCLE (X + 7, EY(n) + 10), Grow, 4: NEXT

            IF ShipType = 3 AND HitC > 100 THEN

              GOSUB YouKillMeBaby: RETURN

            END IF

            IF ShipType = 3 THEN

              HitC = HitC + 1: GOTO ShootPart2

            END IF

        GOSUB YouKillMeBaby

      END IF  '-Left laser cannon-                         

'(continued)                                               



ShootPart2:                                                



      IF X + 26 > EX(n) - 2 AND X + 26 < EX(n) + RangeRight THEN

        FOR Grow = 1 TO 5

          CIRCLE (X + 27, EY(n) + 10), Grow, 14: NEXT

        CALL ExplosiveSound

        FOR Grow = 6 TO 8

          CIRCLE (X + 27, EY(n) + 10), Grow, 12: NEXT

        FOR Grow = 9 TO 10

          CIRCLE (X + 27, EY(n) + 10), Grow, 4: NEXT

            IF ShipType = 3 AND HitC > 100 THEN

              GOSUB YouKillMeBaby: RETURN

            END IF

            IF ShipType = 3 THEN HitC = HitC + 1: RETURN

        GOSUB YouKillMeBaby

      END IF  '-Right laser cannon-                        

    NEXT

  RETURN

                                                            

YouKillMeBaby:                                             

  EX(n) = -10: EY(n) = -10: Enemy(n) = 0

  Score% = Score% + ShipPoints%

  Defeated = Defeated + 1

  CALL ExtraShipCheck(Score%, Ships%, GainShip%)

RETURN

                                                            

EShoot:                                                    

  LINE (EX(n) + 2, Laser(n))-(EX(n) + 2, Laser(n) + 5), 4



  LINE (EX(n) + ELXC, Laser(n))-(EX(n) + ELXC, Laser(n) + 5), 4



    IF Eshot(n) = 1 AND EX(n) + 2 > X - 1 AND EX(n) + 2 < X + 35 AND Laser(n) > Y - 1 AND Laser(n) < Y + 12 THEN

      Ships% = Ships% - 1: Lostaship = 1: RETURN

    END IF 'right laser cannon                             

                                                            





    IF Eshot(n) = 1 AND EX(n) + ELXC > X - 1 AND EX(n) + ELXC < X + 35 AND Laser(n) > Y - 1 AND Laser(n) < Y + 12 THEN

      Ships% = Ships% - 1: Lostaship = 1: RETURN

    END IF 'left laser cannon                              

    IF ShipType = 3 THEN GOSUB ExtraShoot

  IF Eshot(n) = 1 AND Laser(n) > 209 THEN Eshot(n) = 0

  RETURN

                                                            



ExtraShoot:                                                

  LINE (EX(n) + 17, Laser(n))-(EX(n) + 17, Laser(n) + 5), 1

  LINE (EX(n) + 73, Laser(n))-(EX(n) + 73, Laser(n) + 5), 1



    IF Eshot(n) = 1 AND EX(n) + 17 > X - 1 AND EX(n) + 2 < X + 35 AND Laser(n) > Y - 1 AND Laser(n) < Y + 12 THEN

      Ships% = Ships% - 1: Lostaship = 1: RETURN

    END IF 'right laser cannon                             

                                                            



    IF Eshot(n) = 1 AND EX(n) + 73 > X - 1 AND EX(n) + 73 < X + 35 AND Laser(n) > Y - 1 AND Laser(n) < Y + 12 THEN

      Ships% = Ships% - 1: Lostaship = 1: RETURN

'(continued)                                               



    END IF 'left laser cannon                              

  IF Eshot(n) = 1 AND Laser(n) > 209 THEN Eshot(n) = 0

RETURN

                                                            

'(continued)                                               

'(continued)                                               

                                                            

'End of file                                               



SUB Conclusion

  rxpos = 300: rypos = 80

Conc1:                                                     

  FOR pause = 1 TO 10000: NEXT

  SCREEN 7, 0, 2, 0

  CLS : CALL Sunset(rxpos, rypos)

  LOCATE 17, 1: COLOR 7

  PRINT "     Successfully destroying the evil"

  PRINT "Vordoxian fleet, you return to Earth."

  PRINT "Crowds cheer as they see your ship"

  PRINT "flying through the evening sky,"

  PRINT "realizing that the earth has been"

  PRINT "saved by the Red Baron!"

  SCREEN 7, 0, 0, 0: PCOPY 2, 0

   a$ = INKEY$

   IF a$ = CHR$(13) THEN GOTO ConclusionDone

   GOTO Conc1

ConclusionDone:                                            

END SUB



SUB DownLeft (X%, Y%)

  X% = X% - 5: Y% = Y% + 5

  IF X% < 20 THEN X% = 20

  IF Y% > 170 THEN Y% = 170

END SUB



SUB DownRight (X%, Y%)

  X% = X% + 5: Y% = Y% + 5

  IF X% > 250 THEN X% = 250

  IF Y% > 170 THEN Y% = 170

END SUB



SUB ECommandShip

  CLS

  LINE (50, 10)-(54, 50), 8, B: PAINT (51, 11), 7, 8

  LINE (52, 11)-(52, 49), 15

  PSET (52, 10), 7: PSET (52, 50), 7

  PSET (50, 10), 0: PSET (54, 10), 0

  LINE (55, 11)-(57, 11), 1: LINE (58, 12)-(78, 12), 1

  LINE (78, 12)-(78, 32), 1: LINE (78, 32)-(58, 32), 1



  LINE (58, 32)-(55, 35), 1: LINE (55, 35)-(55, 11), 1

  LINE (77, 12)-(77, 32), 1: PAINT (56, 12), 9, 1

  LINE (58, 31)-(76, 31), 11: PSET (57, 32), 11

  LINE (65, 15)-(70, 15), 4: LINE (65, 18)-(70, 18), 4

  LINE (65, 20)-(70, 20), 4: LINE (65, 20)-(70, 32), 4, BF

  LINE (65, 31)-(70, 31), 12: PSET (77, 31), 9

  LINE (80, 8)-(90, 10), 8, B: PAINT (81, 9), 7, 8

  LINE (100, 8)-(110, 10), 8, B: PAINT (101, 9), 7, 8

  LINE (80, 12)-(80, 37), 1: LINE (80, 37)-(83, 40), 1

  LINE (83, 12)-(83, 40), 1: LINE (80, 12)-(83, 12), 1

  LINE (82, 12)-(82, 39), 1: PAINT (81, 13), 9, 1

'(continued)                                               



  LINE (85, 11)-(85, 42), 1: LINE (85, 42)-(95, 52), 1

  LINE (85, 11)-(105, 11), 1: LINE (105, 11)-(105, 42), 1

  LINE (105, 42)-(95, 52), 1: PAINT (86, 12), 9, 1

  LINE (107, 12)-(107, 40), 1: LINE (108, 39)-(110, 37), 1

  LINE (110, 12)-(110, 36), 1: LINE (108, 12)-(110, 12), 1

  PAINT (109, 13), 9, 1: LINE (90, 12)-(90, 42), 1

  PSET (91, 43), 1: PSET (99, 43), 11

  LINE (92, 44)-(95, 44), 1: LINE (100, 12)-(100, 42), 11

  LINE (97, 44)-(98, 44), 11

  PSET (93, 41), 0: PSET (95, 41), 14

  PSET (94, 41), 6: PSET (96, 41), 15: PSET (97, 41), 0

  LINE (93, 40)-(97, 40), 0: LINE (94, 42)-(96, 42), 0

  LINE (112, 12)-(112, 32), 1: LINE (112, 12)-(132, 12), 1

  LINE (112, 32)-(132, 32), 1: LINE (133, 11)-(135, 11), 1

  LINE (135, 12)-(135, 35), 0: LINE (134, 11)-(134, 34), 1

  LINE (132, 32)-(135, 35), 1: PAINT (113, 13), 9, 1

  LINE (133, 11)-(133, 31), 1: LINE (114, 31)-(131, 31), 11

  LINE (120, 15)-(125, 15), 4: LINE (120, 18)-(125, 18), 4

  LINE (120, 20)-(125, 20), 4

  LINE (120, 20)-(125, 32), 4, BF

  LINE (120, 31)-(125, 31), 12

  LINE (136, 10)-(140, 50), 8, B

  PAINT (137, 11), 7, 8: LINE (138, 11)-(138, 49), 15

  PSET (138, 10), 7: PSET (138, 50), 7

  PSET (136, 10), 0: PSET (140, 10), 0

  LINE (65, 33)-(69, 50), 8, B: PAINT (66, 34), 7, 8

  LINE (67, 34)-(67, 49), 15

  PSET (67, 33), 7: PSET (67, 50), 7

  LINE (121, 33)-(125, 50), 8, B: PAINT (122, 34), 7, 8

  LINE (123, 34)-(123, 49), 15

  PSET (123, 33), 7: PSET (123, 50), 7

  GET (50, 8)-(140, 53), ECShip%

  CLS 'clean up screen                                     

END SUB



SUB ECommandShipMask

  CLS

  LINE (50, 8)-(79, 8), 15: LINE (50, 9)-(79, 9), 15

  LINE (54, 10)-(79, 10), 15: LINE (58, 11)-(79, 11), 15

  PSET (50, 10), 15: PSET (140, 10), 15

  LINE (91, 8)-(99, 10), 15, BF: LINE (111, 8)-(140, 8), 15

  LINE (111, 9)-(140, 9), 15: LINE (111, 10)-(136, 10), 15

  LINE (111, 11)-(132, 11), 15: LINE (50, 53)-(140, 53), 15

  LINE (50, 51)-(50, 52), 15: LINE (140, 51)-(140, 52), 15



  LINE (94, 52)-(80, 38), 15: LINE (79, 37)-(79, 33), 15

  LINE (78, 33)-(70, 33), 15: LINE (70, 33)-(70, 51), 15

  LINE (70, 51)-(64, 51), 15: LINE (64, 51)-(64, 33), 15

  LINE (64, 33)-(58, 33), 15: LINE (58, 33)-(55, 36), 15

  LINE (55, 36)-(55, 51), 15: LINE (55, 51)-(50, 51), 15

  PAINT (56, 52), 15, 15

  LINE (96, 52)-(110, 38), 15: LINE (111, 37)-(111, 33), 15

  LINE (112, 33)-(120, 33), 15

  LINE (120, 33)-(120, 51), 15

  LINE (120, 51)-(126, 51), 15

  LINE (126, 51)-(126, 33), 15

'(continued)                                               



  LINE (126, 33)-(132, 33), 15

  LINE (133, 34)-(135, 36), 15

  LINE (135, 37)-(135, 51), 15

  LINE (135, 51)-(140, 51), 15

  PAINT (100, 49), 15, 15

  GET (50, 8)-(140, 53), ECShipMask%

  CLS 'clean up screen                                     

END SUB



SUB EElite

  CLS

  LINE (140, 100)-(144, 115), 5, B

  LINE (165, 100)-(161, 115), 5, B

  LINE (145, 105)-(150, 100), 5

  LINE (145, 110)-(150, 115), 5

  LINE (160, 105)-(155, 100), 5

  LINE (160, 110)-(155, 115), 5

  LINE (150, 100)-(155, 100), 5

  LINE (150, 115)-(155, 115), 5

  PAINT (151, 101), 13, 5: PAINT (141, 101), 13, 5

  PAINT (162, 101), 13, 5

  LINE (142, 100)-(142, 115), 13

  LINE (142, 101)-(142, 114), 15

  LINE (163, 100)-(163, 115), 13

  LINE (163, 101)-(163, 114), 15

  LINE (150, 111)-(155, 111), 0

  LINE (150, 112)-(155, 112), 0

  LINE (151, 113)-(154, 113), 0

  LINE (151, 112)-(154, 112), 9

  PSET (151, 112), 1: PSET (153, 112), 11

  LINE (151, 103)-(154, 103), 5

  LINE (151, 105)-(154, 105), 5

  LINE (151, 107)-(154, 107), 5

  GET (140, 100)-(165, 115), EEShip%

  CLS 'clean up screen                                     

END SUB



SUB EEliteMask

  CLS

  LINE (145, 100)-(149, 100), 15

  LINE (145, 100)-(145, 104), 15

  LINE (145, 104)-(149, 100), 15: PAINT (146, 101), 15

  LINE (156, 100)-(160, 100), 15

  LINE (160, 100)-(160, 104), 15



  LINE (160, 104)-(156, 100), 15: PAINT (158, 101), 15

  LINE (145, 115)-(149, 115), 15

  LINE (145, 115)-(145, 111), 15

  LINE (145, 111)-(149, 115), 15: PAINT (146, 114), 15

  LINE (156, 115)-(160, 115), 15

  LINE (156, 115)-(160, 111), 15

  LINE (160, 111)-(160, 115), 15: PAINT (158, 114), 15

  GET (140, 100)-(165, 115), EEShipMask%

  CLS 'clean up screen                                     

END SUB



SUB EFighter

  CLS

  LINE (150, 100)-(155, 100), 8

  LINE (149, 101)-(149, 109), 8

  LINE (156, 101)-(156, 109), 8

  LINE (148, 110)-(147, 111), 8

  LINE (157, 110)-(158, 111), 8

  LINE (145, 111)-(146, 111), 8

  LINE (159, 111)-(160, 111), 8

  LINE (140, 100)-(144, 115), 8, B

  LINE (165, 100)-(161, 115), 8, B

  LINE (145, 113)-(150, 115), 8

  LINE (151, 115)-(156, 115), 8

  LINE (157, 114)-(158, 114), 8

  LINE (159, 114)-(160, 113), 8

  PAINT (151, 101), 7, 8: PAINT (141, 101), 7, 8

  PAINT (162, 101), 7, 8

  LINE (142, 100)-(142, 115), 7

  LINE (142, 101)-(142, 114), 15

  LINE (163, 100)-(163, 115), 7

  LINE (163, 101)-(163, 114), 15

  LINE (150, 111)-(155, 111), 0

  LINE (150, 112)-(155, 112), 0

  LINE (151, 113)-(154, 113), 0

  LINE (151, 112)-(154, 112), 9

  PSET (151, 112), 1: PSET (153, 112), 11

  LINE (151, 103)-(154, 103), 8

  LINE (151, 105)-(154, 105), 8

  LINE (151, 107)-(154, 107), 8

  GET (140, 100)-(165, 115), EFShip%

  CLS 'clean up screen                                     

END SUB



SUB EFighterMask

  CLS

  LINE (145, 100)-(147, 110), 15, BF

  LINE (148, 100)-(148, 109), 15

  LINE (158, 100)-(160, 110), 15, BF

  LINE (157, 100)-(157, 109), 15

  LINE (145, 115)-(148, 115), 15

  LINE (157, 115)-(160, 115), 15

  PSET (145, 114), 15: PSET (160, 114), 15

  PSET (149, 100), 15: PSET (156, 100), 15

  GET (140, 100)-(165, 115), EFShipMask%



  CLS 'clean up screen                                     

END SUB



SUB EnemyShipPicture (n, ShipType)

  IF ShipType = 1 THEN

    PUT (EX(n), EY(n)), EFShipMask%, AND

    PUT (EX(n), EY(n)), EFShip%, XOR

  END IF

  IF ShipType = 2 THEN

    PUT (EX(n), EY(n)), EEShipMask%, AND

    PUT (EX(n), EY(n)), EEShip%, XOR

'(continued)                                               



  END IF

  IF ShipType = 3 THEN

    PUT (EX(n), EY(n)), ECShipMask%, AND

    PUT (EX(n), EY(n)), ECShip%, XOR

  END IF

  IF ShipType = 4 THEN

    PUT (EX(n), EY(n)), ASCII%, PSET

  END IF

END SUB



SUB EnMove (n, ShipType)

  Direction = INT(RND * 8) + 1

  IF Direction = 1 THEN EY(n) = EY(n) - 5

  IF Direction = 2 THEN EX(n) = EX(n) + 5: EY(n) = EY(n) - 5

  IF Direction = 3 THEN EX(n) = EX(n) + 5

  IF Direction = 4 THEN EX(n) = EX(n) + 5: EY(n) = EY(n) + 5

  IF Direction = 5 THEN EY(n) = EY(n) - 5

  IF Direction = 6 THEN EX(n) = EX(n) - 5: EY(n) = EY(n) + 5

  IF Direction = 7 THEN EX(n) = EX(n) - 5

  IF Direction = 8 THEN EX(n) = EX(n) - 5: EY(n) = EY(n) - 5

    IF EX(n) < 20 THEN EX(n) = 20

    IF EX(n) > 250 THEN EX(n) = 250

      IF ShipType = 3 AND EX(n) > 200 THEN EX(n) = 200

    IF EY(n) < 15 THEN EY(n) = 15

    IF EY(n) > 100 THEN EY(n) = 100

END SUB



SUB Explosion (X%, Y%)

  FOR Grow = 1 TO 5

    CIRCLE (X + 17, Y + 6), Grow, 14: NEXT

    CALL ExplosiveSound

  FOR Grow = 6 TO 8

    CIRCLE (X + 17, Y + 6), Grow, 12: NEXT

  FOR Grow = 9 TO 10

    CIRCLE (X + 17, Y + 6), Grow, 4: NEXT

END SUB



SUB ExplosiveSound

  FOR s = 850 TO 810 STEP -1

  SOUND (RND * 100 + s / 10 + 30), .1

  NEXT

END SUB



SUB ExtraShipCheck (Score%, Ships%, GainShip%)



    IF Score% >= 100 AND GainShip = 0 THEN

      Ships% = Ships% + 1: GainShip = 1

      GOSUB Toon: GOTO OutCheck

    END IF

    IF Score% >= 200 AND GainShip = 1 THEN

      Ships% = Ships% + 1: GainShip = 2

      GOSUB Toon: GOTO OutCheck

    END IF

    IF Score% >= 300 AND GainShip = 2 THEN

      Ships% = Ships% + 1: GainShip = 3

      GOSUB Toon: GOTO OutCheck

'(continued)                                               



    END IF

    IF Score% >= 400 AND GainShip = 3 THEN

      Ships% = Ships% + 1: GainShip = 4

      GOSUB Toon: GOTO OutCheck

    END IF

    IF Score% >= 500 AND GainShip = 4 THEN

      Ships% = Ships% + 1: GainShip = 5

      GOSUB Toon: GOTO OutCheck

    END IF

    GOTO OutCheck

Toon:                                                      

  PLAY "mbo2l16ddeeffgg": RETURN

OutCheck:                                                  

END SUB



SUB HelpScreen

HelpPart1:                                                 

  SCREEN 7, 0, 2, 0

  CLS : LOCATE 25, 1: COLOR 5

    PRINT "Press     to exit or     for next page."

  LOCATE 25, 7: COLOR 11: PRINT "ESC"

  LOCATE 1, 1: COLOR 12: PRINT "Instructions"

  LOCATE 1, 30: COLOR 15: PRINT "Page 1 of 3"

  LINE (0, 9)-(319, 9), 4

  LOCATE 3, 1: COLOR 15

  PRINT "Blast your way through twentyfive waves"

  LOCATE 4, 1: PRINT "of Vordoxian scum to save the earth!"

    PUT (10, 48), RShip%, PSET

    PUT (15, 121), EFShip%, PSET

  LOCATE 8, 24: COLOR 14: PRINT "The Red Baron"

  LOCATE 10, 1: COLOR 7

    PRINT "Your fighter.  Armed with the latest in"

    PRINT "laser technology, the Red Baron's dual"

    PRINT "laser cannons will cut through an enemy"

    PRINT "fighter craft like a chainsaw through"

    PRINT "a teenager!  Or so I've heard..."

  LOCATE 17, 20: COLOR 14: PRINT "Vordoxian Fighter"

  LOCATE 19, 1: COLOR 7

    PRINT "The most common type of space craft"

    PRINT "employed by the enemy.  These ships"

    PRINT "are armed with two laser cannons,"

    PRINT "although not nearly as powerful as"

    PRINT "the Red Baron's."

  LOCATE 23, 19: COLOR 3: PRINT "(5 points)"



  LINE (173, 188)-(183, 198), 4, B

  PAINT (174, 189), 12, 4: LINE (178, 190)-(178, 196), 0

  LINE (177, 195)-(179, 195), 0

  LINE (176, 194)-(180, 194), 0

  PSET (182, 189), 15

  SCREEN 7, 0, 0, 0: PCOPY 2, 0

UserInput2:                                                

   a$ = INKEY$

   IF a$ = CHR$(0) + CHR$(80) THEN GOTO HelpPart2

   IF a$ = CHR$(27) THEN GOTO HelpDone

   GOTO UserInput2

'(continued)                                               



HelpPart2:                                                 

  SCREEN 7, 0, 2, 0

  CLS : LOCATE 25, 3: COLOR 5

    PRINT "Press     to exit or     or     ."

  LOCATE 25, 9: COLOR 11: PRINT "ESC"

  LOCATE 1, 1: COLOR 12: PRINT "Instructions"

  LOCATE 1, 30: COLOR 15: PRINT "Page 2 of 3"

  LINE (0, 9)-(319, 9), 4

  PUT (15, 13), EEShip%, PSET

  LOCATE 3, 14: COLOR 14: PRINT "Vordoxian Elite Fighter"

  LOCATE 5, 1: COLOR 7

    PRINT "The pilots of these ships are a little"

    PRINT "more trigger happy than the norm."

    PRINT "Always joined by fellow Elite ships,"

    PRINT "they will often fire in sync."

  LOCATE 9, 1: COLOR 3: PRINT "(10 points)"

  LOCATE 12, 4: COLOR 9: PRINT "?"

  LOCATE 12, 13: COLOR 14: PRINT "Vordoxian Command Vessel"

  LOCATE 14, 1: COLOR 7

    PRINT "Chances are, the command ship leading"

    PRINT "the Vordoxian fighters is pretty"

    PRINT "powerful."

  LOCATE 16, 12: COLOR 3: PRINT "(50 points)"

  LINE (188, 188)-(198, 198), 4, B

  PAINT (189, 189), 12, 4: LINE (193, 190)-(193, 196), 0

  LINE (192, 191)-(194, 191), 0

  LINE (191, 192)-(195, 192), 0

  PSET (197, 189), 15

  LINE (248, 188)-(258, 198), 4, B

  PAINT (249, 189), 12, 4: LINE (253, 190)-(253, 196), 0

  LINE (252, 194)-(254, 194), 0

  LINE (251, 193)-(255, 193), 0

  PSET (257, 189), 15

  SCREEN 7, 0, 0, 0: PCOPY 2, 0

UserInput3:                                                

   a$ = INKEY$

   IF a$ = CHR$(0) + CHR$(80) THEN GOTO HelpPart3

   IF a$ = CHR$(0) + CHR$(72) THEN GOTO HelpPart1

   IF a$ = CHR$(27) THEN GOTO HelpDone

   GOTO UserInput3

HelpPart3:                                                 

  SCREEN 7, 0, 2, 0

  CLS : LOCATE 25, 1: COLOR 5

    PRINT "Press     to exit or     for prev page."



  LOCATE 25, 7: COLOR 11: PRINT "ESC"

  LOCATE 1, 1: COLOR 12: PRINT "Instructions"

  LOCATE 1, 30: COLOR 15: PRINT "Page 3 of 3"

  LINE (0, 9)-(319, 9), 4

  CALL Keypad

  LOCATE 5, 10: COLOR 7

  PRINT "Although you can use the"

  LOCATE 6, 10: PRINT "separate arrow keys, it's"

  LOCATE 7, 10: PRINT "recommended that you use"

  LOCATE 8, 10: PRINT "the keypad, as this will"

  LOCATE 9, 10: PRINT "allow you to move in all"

'(continued)                                               



  LOCATE 10, 10: PRINT "eight directions."

  LOCATE 15, 1: PRINT "Press the"

  LOCATE 15, 11: COLOR 15: PRINT "SPACE BAR"

  LOCATE 15, 21: COLOR 7: PRINT "to fire."

  COLOR 3

  LOCATE 11, 10: PRINT "(Number Lock must be off.)"

  LOCATE 17, 1: COLOR 7

  PRINT "For every 100 points, up to 500, you"

  PRINT "will receive an extra ship."

  LOCATE 20, 1: COLOR 7

  PRINT "If you wish to end the game while"

  PRINT "playing, just press `"

  LOCATE 21, 22: COLOR 15: PRINT "q"

  LOCATE 21, 23: COLOR 7: PRINT "' to quit."

  SCREEN 7, 0, 0, 0: PCOPY 2, 0

  LINE (173, 188)-(183, 198), 4, B

  PAINT (174, 189), 12, 4: LINE (178, 190)-(178, 196), 0

  LINE (177, 191)-(179, 191), 0

  LINE (176, 192)-(180, 192), 0

  PSET (182, 189), 15

UserInput4:                                                

   a$ = INKEY$

   IF a$ = CHR$(0) + CHR$(72) THEN GOTO HelpPart2

   IF a$ = CHR$(27) THEN GOTO HelpDone

   GOTO UserInput4

HelpDone:                                                  

END SUB



SUB Intro

Intro1:                                                    

  SCREEN 7, 0, 2, 0

  CLS : CALL RedBaron: LOCATE 17, 1: COLOR 7

  PRINT "     The Red Baron.  That is what the"

  PRINT "media has called it.  The vigilante"

  PRINT "space craft has been known to appear"

  PRINT "in distant areas of space, aiding small"

  PRINT "colonies in defense from pirates and"

  PRINT "scavengers."

  SCREEN 7, 0, 0, 0: PCOPY 2, 0

   a$ = INKEY$

   IF a$ = CHR$(13) THEN GOTO Intro2

   GOTO Intro1

Intro2:                                                    

  SCREEN 7, 0, 2, 0



  CLS : CALL RedBaron: LOCATE 17, 1: COLOR 7

  PRINT "     No one knows who the pilot is."

  PRINT "A He?  She?  It?  The authorities have"

  PRINT "been desparate to catch the pilot."

  PRINT "Even more so now than before due to"

  PRINT "the recent events..."

  SCREEN 7, 0, 0, 0: PCOPY 2, 0

   a$ = INKEY$

   IF a$ = CHR$(13) THEN GOTO Intro3

   GOTO Intro2

Intro3:                                                    

'(continued)                                               



  SCREEN 7, 0, 2, 0

  CLS : CALL RedBaron: LOCATE 17, 1: COLOR 7

  PRINT "     An alien race, known as the"

  PRINT "Vordoxians, has declared war on mankind."

  PRINT "Their first attack was swift and deadly."

  PRINT "Capturing a distant communications"

  PRINT "outpost, the Vordoxians released the"

  PRINT "most powerful computer virus ever known"

  PRINT "to man."

  SCREEN 7, 0, 0, 0: PCOPY 2, 0

   a$ = INKEY$

   IF a$ = CHR$(13) THEN GOTO Intro4

   GOTO Intro3

Intro4:                                                    

  SCREEN 7, 0, 2, 0

  CLS : CALL RedBaron: LOCATE 17, 1: COLOR 7

  PRINT "     The virus infected everything."

  PRINT "No matter how well secure the system,"

  PRINT "the computer virus was able to penetrate"

  PRINT "its defenses.  After only twentyfour"

  PRINT "hours, virtually everything electronic"

  PRINT "was rendered useless."

  SCREEN 7, 0, 0, 0: PCOPY 2, 0

   a$ = INKEY$

   IF a$ = CHR$(13) THEN GOTO Intro5

   GOTO Intro4

Intro5:                                                    

  SCREEN 7, 0, 2, 0

  CLS : CALL RedBaron: LOCATE 17, 1: COLOR 7

  PRINT "     Astronomers, using nothing more"

  PRINT "than simple telescopes, then discovered"

  PRINT "the second part in this evil attack."

  PRINT "Hordes of Vordoxian fighters had been"

  PRINT "sighted entering Earth's solar system!"

  PRINT "Without a solid defense after the virus"

  PRINT "the end of the Human race was eminent."

  SCREEN 7, 0, 0, 0: PCOPY 2, 0

   a$ = INKEY$

   IF a$ = CHR$(13) THEN GOTO Intro6

   GOTO Intro5

Intro6:                                                    

  SCREEN 7, 0, 2, 0

  CLS : CALL RedBaron: LOCATE 17, 1: COLOR 7

  PRINT "     Then miraculously, the Red Baron"



  PRINT "was sighted!  Somehow escaping the"

  PRINT "clutches of the Vordoxian computer"

  PRINT "virus, the red ship was seen heading"

  PRINT "on an intercept course for the enemy."

  PRINT "Now the Red Baron was the last hope"

  PRINT "for the Human race..."

  SCREEN 7, 0, 0, 0: PCOPY 2, 0

   a$ = INKEY$

   IF a$ = CHR$(13) THEN GOTO IntroDone

   GOTO Intro6

IntroDone:                                                 

'(continued)                                               



END SUB



SUB Keypad

  LINE (10, 35)-(20, 45), 8, B: PAINT (11, 36), 7, 8

  LINE (22, 35)-(32, 45), 8, B: PAINT (23, 36), 7, 8

  LINE (34, 35)-(44, 45), 8, B: PAINT (35, 36), 7, 8

  LINE (46, 35)-(56, 45), 8, B: PAINT (47, 36), 7, 8

  LINE (46, 47)-(56, 69), 8, B: PAINT (47, 48), 7, 8

  LINE (46, 71)-(56, 93), 8, B: PAINT (47, 73), 7, 8

  LINE (10, 83)-(32, 93), 8, B: PAINT (11, 84), 7, 8

  LINE (34, 83)-(44, 93), 8, B: PAINT (35, 84), 7, 8

  LINE (10, 47)-(20, 57), 7, B: PAINT (11, 48), 15, 7

  LINE (22, 47)-(32, 57), 7, B: PAINT (23, 48), 15, 7

  LINE (34, 47)-(44, 57), 7, B: PAINT (35, 48), 15, 7

  LINE (10, 59)-(20, 69), 7, B: PAINT (11, 60), 15, 7

  LINE (22, 59)-(32, 69), 7, B: PAINT (23, 60), 15, 7

  LINE (34, 59)-(44, 69), 7, B: PAINT (35, 60), 15, 7

  LINE (10, 71)-(20, 81), 7, B: PAINT (11, 72), 15, 7

  LINE (22, 71)-(32, 81), 7, B: PAINT (23, 72), 15, 7

  LINE (34, 71)-(44, 81), 7, B: PAINT (35, 72), 15, 7

  LINE (13, 50)-(17, 54), 0

  LINE (13, 51)-(14, 50), 0: LINE (13, 52)-(15, 50), 0

  LINE (27, 50)-(27, 54), 0

  LINE (26, 51)-(28, 51), 0: LINE (25, 52)-(29, 52), 0

  LINE (37, 54)-(41, 50), 0

  LINE (40, 50)-(41, 51), 0: LINE (39, 50)-(41, 52), 0

  LINE (13, 64)-(17, 64), 0

  LINE (14, 63)-(14, 65), 0: LINE (15, 62)-(15, 66), 0

  LINE (37, 64)-(41, 64), 0

  LINE (40, 63)-(40, 65), 0: LINE (39, 62)-(39, 66), 0

  LINE (13, 78)-(17, 74), 0

  LINE (13, 77)-(14, 78), 0: LINE (13, 76)-(15, 78), 0

  LINE (27, 74)-(27, 78), 0

  LINE (26, 77)-(28, 77), 0: LINE (25, 76)-(29, 76), 0

  LINE (37, 74)-(41, 78), 0

  LINE (40, 78)-(41, 77), 0: LINE (39, 78)-(41, 76), 0

END SUB



SUB MainScreen (HScore%, ASCII%)

Start:                                                     

  SCREEN 7, 0, 2, 0

  CLS : CALL Title

  LOCATE 12, 16: COLOR 9: PRINT "High Score:"

  LOCATE 13, 15: COLOR 11: PRINT HScore%



  LINE (99, 120)-(220, 183), 4, B

  LINE (100, 121)-(219, 182), 12, B

  LINE (101, 122)-(218, 181), 4, B

  COLOR 11: LOCATE 17, 18: PRINT "Select:"

  C1 = 15: C2 = 4: C3 = 4: C4 = 4

  highlight = 1

  SCREEN 7, 0, 0, 0: PCOPY 2, 0

DisplayText1:                                              

  COLOR C1: LOCATE 19, 15: PRINT "Introduction"

  COLOR C2: LOCATE 20, 16: PRINT "Play Game"

  COLOR C3: LOCATE 21, 19: PRINT "Help"

'(continued)                                               



  COLOR C4: LOCATE 22, 19: PRINT "Quit"

                                                            

UserInput1:                                                

   a$ = INKEY$

   IF a$ = CHR$(0) + CHR$(72) THEN

      highlight = highlight - 1: GOTO HightOfMyLight1

   END IF

   IF a$ = CHR$(0) + CHR$(80) THEN

      highlight = highlight + 1: GOTO HightOfMyLight1

   END IF

   IF a$ = CHR$(13) THEN GOTO DetermineSelection1

   IF a$ = "a" OR a$ = "A" THEN ASCII% = 1

   GOTO UserInput1

                                                            

HightOfMyLight1:                                           

   IF highlight > 4 THEN highlight = 1

   IF highlight < 1 THEN highlight = 4

   IF highlight = 1 THEN C1 = 15: C2 = 4: C3 = 4: C4 = 4

   IF highlight = 2 THEN C2 = 15: C1 = 4: C3 = 4: C4 = 4

   IF highlight = 3 THEN C3 = 15: C1 = 4: C2 = 4: C4 = 4

   IF highlight = 4 THEN C4 = 15: C1 = 4: C2 = 4: C3 = 4

   GOTO DisplayText1

                                                            

DetermineSelection1:                                       

  IF highlight = 1 THEN CALL Intro: GOTO Start

  IF highlight = 2 THEN GOTO Done1

  IF highlight = 3 THEN CALL HelpScreen: GOTO Start

  IF highlight = 4 THEN CLS : SYSTEM

  GOTO DisplayText1

Done1:                                                     

END SUB



SUB MoveDown (Y%)

  Y% = Y% + 5

  IF Y% > 170 THEN Y% = 170

END SUB



SUB MoveLeft (X%)

  X% = X% - 5

  IF X% < 20 THEN X% = 20

END SUB



SUB MoveRight (X%)

  X% = X% + 5



  IF X% > 250 THEN X% = 250

END SUB



SUB MoveUp (Y%)

  Y% = Y% - 5

  IF Y% < 100 THEN Y% = 100

END SUB



SUB PrivateASCII

  CLS : LOCATE 1, 3: COLOR 12: PRINT "O"

  LOCATE 2, 2: PRINT "/"

'(continued)                                               



  LOCATE 2, 3: COLOR 10: PRINT "|"

  LOCATE 2, 4: COLOR 12: PRINT "\"

  LOCATE 3, 2: COLOR 9: PRINT "/ \"

  GET (8, 0)-(30, 22), ASCII%

  CLS

END SUB



SUB RedBaron

  RDirect = INT(RND * 4) + 1

  IF RDirect = 1 THEN ry = -5

  IF RDirect = 2 THEN rx = 5

  IF RDirect = 3 THEN ry = 5

  IF RDirect = 4 THEN rx = -5

  CIRCLE (125 + rx, 80 + ry), 11, 4

  PAINT (130 + rx, 85 + ry), 4, 4

  CIRCLE (125 + rx, 80 + ry), 8, 0

  CIRCLE (125 + rx, 80 + ry), 2, 0

  PAINT (125 + rx, 80 + ry), 0, 0

  LINE (90 + rx, 60 + ry)-(115 + rx, 85 + ry), 4

  LINE (100 + rx, 50 + ry)-(135 + rx, 75 + ry), 4

  LINE (100 + rx, 50 + ry)-(97 + rx, 49 + ry), 4

  LINE (97 + rx, 49 + ry)-(90 + rx, 50 + ry), 4

  LINE (89 + rx, 51 + ry)-(88 + rx, 52 + ry), 4

  LINE (88 + rx, 52 + ry)-(88 + rx, 56 + ry), 4

  LINE (88 + rx, 57 + ry)-(89 + rx, 59 + ry), 4

  PAINT (92 + rx, 60 + ry), 12, 4

  LINE (95 + rx, 50 + ry)-(122 + rx, 70 + ry), 15

  CIRCLE (225 + rx, 80 + ry), 11, 4

  PAINT (230 + rx, 85 + ry), 4, 4

  CIRCLE (225 + rx, 80 + ry), 8, 0

  CIRCLE (225 + rx, 80 + ry), 2, 0

  PAINT (225 + rx, 80 + ry), 0, 0

  LINE (180 + rx, 60 + ry)-(215 + rx, 85 + ry), 4

  LINE (190 + rx, 50 + ry)-(234 + rx, 74 + ry), 4

  LINE (190 + rx, 50 + ry)-(187 + rx, 49 + ry), 4

  LINE (187 + rx, 49 + ry)-(180 + rx, 50 + ry), 4

  LINE (179 + rx, 51 + ry)-(178 + rx, 52 + ry), 4

  LINE (178 + rx, 52 + ry)-(178 + rx, 56 + ry), 4

  LINE (178 + rx, 57 + ry)-(179 + rx, 59 + ry), 4

  PAINT (192 + rx, 60 + ry), 12, 4

  LINE (185 + rx, 50 + ry)-(221 + rx, 70 + ry), 15

  LINE (118 + rx, 55 + ry)-(165 + rx, 55 + ry), 4

  LINE (118 + rx, 55 + ry)-(113 + rx, 58 + ry), 4

  LINE (166 + rx, 55 + ry)-(184 + rx, 58 + ry), 4



  LINE (185 + rx, 59 + ry)-(205 + rx, 71 + ry), 4

  LINE (205 + rx, 71 + ry)-(185 + rx, 71 + ry), 4

  LINE (192 + rx, 71 + ry)-(205 + rx, 75 + ry), 4, BF

  LINE (130 + rx, 71 + ry)-(145 + rx, 71 + ry), 4

  LINE (135 + rx, 75 + ry)-(145 + rx, 75 + ry), 4

  LINE (145 + rx, 71 + ry)-(145 + rx, 75 + ry), 4

  LINE (145 + rx, 71 + ry)-(180 + rx, 96 + ry), 4

  LINE (155 + rx, 82 + ry)-(180 + rx, 100 + ry), 4

  LINE (140 + rx, 75 + ry)-(150 + rx, 82 + ry), 4

  LINE (150 + rx, 82 + ry)-(155 + rx, 82 + ry), 4

  LINE (147 + rx, 74 + ry)-(147 + rx, 76 + ry), 4

'(continued)                                               



  LINE (147 + rx, 76 + ry)-(145 + rx, 78 + ry), 4

  LINE (185 + rx, 71 + ry)-(220 + rx, 96 + ry), 4

  PAINT (190 + rx, 72 + ry), 4, 4

  LINE (180 + rx, 96 + ry)-(191 + rx, 102 + ry), 4

  LINE (180 + rx, 100 + ry)-(190 + rx, 103 + ry), 4

  LINE (220 + rx, 96 + ry)-(221 + rx, 100 + ry), 4

  LINE (220 + rx, 101 + ry)-(215 + rx, 103 + ry), 4

  LINE (214 + rx, 103 + ry)-(205 + rx, 104 + ry), 4

  LINE (204 + rx, 104 + ry)-(195 + rx, 103 + ry), 4

  LINE (195 + rx, 103 + ry)-(189 + rx, 103 + ry), 4

  PAINT (170 + rx, 90 + ry), 4, 4

  PAINT (188 + rx, 102 + ry), 4, 4

  PAINT (180 + rx, 70 + ry), 12, 4

  PAINT (140 + rx, 72 + ry), 4, 4

  LINE (179 + rx, 59 + ry)-(194 + rx, 70 + ry), 12

  PSET (120 + rx, 62 + ry), 4: PSET (125 + rx, 65 + ry), 4

  PSET (179 + rx, 100 + ry), 0

  PSET (181 + rx, 101 + ry), 0

  LINE (184 + rx, 90 + ry)-(205 + rx, 90 + ry), 0

  LINE (184 + rx, 90 + ry)-(190 + rx, 95 + ry), 0

  LINE (191 + rx, 95 + ry)-(197 + rx, 96 + ry), 0

  LINE (205 + rx, 90 + ry)-(210 + rx, 93 + ry), 0

  LINE (211 + rx, 94 + ry)-(207 + rx, 96 + ry), 0

  LINE (207 + rx, 96 + ry)-(198 + rx, 96 + ry), 0

  PAINT (200 + rx, 91 + ry), 14, 0

  CIRCLE (193 + rx, 93 + ry), 1, 15

  LINE (191 + rx, 93 + ry)-(195 + rx, 93 + ry), 15

  LINE (200 + rx, 95 + ry)-(206 + rx, 95 + ry), 6

  LINE (207 + rx, 94 + ry)-(208 + rx, 94 + ry), 6

  PSET (194 + rx, 95 + ry), 6

  PSET (205 + rx, 91 + ry), 6

  LINE (207 + rx, 92 + ry)-(208 + rx, 93 + ry), 6

  LINE (70 + rx, 73 + ry)-(106 + rx, 73 + ry), 4

  LINE (106 + rx, 73 + ry)-(98 + rx, 65 + ry), 4

  LINE (102 + rx, 72 + ry)-(96 + rx, 66 + ry), 12

  LINE (70 + rx, 73 + ry)-(98 + rx, 65 + ry), 4

  PAINT (75 + rx, 72 + ry), 12, 4

  LINE (234 + rx, 73 + ry)-(245 + rx, 73 + ry), 4

  LINE (245 + rx, 73 + ry)-(220 + rx, 66 + ry), 4

  PAINT (238 + rx, 72 + ry), 12, 4

  PSET (224 + rx, 68 + ry), 12

  PSET (114 + rx, 83 + ry), 12

  LINE (160 + rx, 75 + ry)-(175 + rx, 85 + ry), 4

  LINE (183 + rx, 75 + ry)-(198 + rx, 85 + ry), 4



  LINE (150 + rx, 59 + ry)-(145 + rx, 64 + ry), 15

  LINE (146 + rx, 65 + ry)-(168 + rx, 70 + ry), 4

  LINE (151 + rx, 59 + ry)-(168 + rx, 62 + ry), 4

  LINE (168 + rx, 63 + ry)-(169 + rx, 70 + ry), 4

  LINE (129 + rx, 71 + ry)-(130 + rx, 71 + ry), 0

  LINE (131 + rx, 72 + ry)-(132 + rx, 72 + ry), 0

  LINE (132 + rx, 72 + ry)-(135 + rx, 75 + ry), 0

  LDirect = INT(RND * 5) + 1

  IF LDirect = 1 THEN

    LINE (125 + rx, 80 + ry)-(165 + rx, 110 + ry), 1

    LINE (225 + rx, 80 + ry)-(275 + rx, 110 + ry), 1

'(continued)                                               



  END IF

  PSET (10, 40), 9: PSET (280, 50), 9

  PSET (40, 90), 9: PSET (110, 35), 1

  PSET (30, 100), 1: PSET (150, 90), 9

  PSET (250, 70), 9: PSET (100, 100), 1

  PSET (200, 45), 9: PSET (290, 105), 1

END SUB



SUB RedShip

  CLS

  LINE (140, 150)-(144, 160), 4, B

  PAINT (141, 151), 12, 4

  LINE (142, 150)-(142, 160), 12

  LINE (142, 151)-(142, 159), 15

  PSET (140, 160), 0: PSET (144, 160), 0

  LINE (145, 158)-(148, 160), 4

  LINE (149, 160)-(156, 160), 4

  LINE (159, 158)-(157, 160), 4

  LINE (145, 153)-(148, 153), 4

  LINE (159, 153)-(156, 153), 4

  LINE (148, 153)-(148, 145), 4

  LINE (156, 153)-(156, 145), 4

  LINE (149, 144)-(153, 143), 4

  LINE (154, 143)-(156, 145), 4

  LINE (160, 150)-(164, 160), 4, B

  PAINT (150, 150), 12, 4

  LINE (151, 154)-(149, 156), 4

  LINE (149, 156)-(151, 158), 4

  LINE (153, 154)-(155, 156), 15

  LINE (153, 158)-(154, 157), 15

  PSET (152, 154), 4: PSET (152, 158), 15

  LINE (150, 147)-(154, 147), 0

  PSET (150, 146), 0: PSET (154, 146), 0

  LINE (151, 145)-(153, 145), 0

  LINE (151, 146)-(153, 146), 6

  PSET (152, 146), 14: PSET (153, 146), 15

  PAINT (161, 151), 12, 4

  LINE (162, 150)-(162, 160), 12

  LINE (162, 151)-(162, 159), 15

  PSET (160, 160), 0: PSET (164, 160), 0

  LINE (135, 153)-(139, 153), 4

  LINE (135, 153)-(139, 155), 4

  LINE (165, 153)-(169, 153), 4

  LINE (165, 155)-(166, 155), 4



  LINE (167, 154)-(168, 154), 4

  LINE (138, 154)-(139, 154), 12

  LINE (165, 154)-(166, 154), 12

  LINE (150, 149)-(150, 152), 4

  LINE (154, 149)-(154, 152), 4

  GET (135, 143)-(169, 160), RShip%

END SUB



SUB RedShipMask

  CLS

  LINE (140, 143)-(149, 143), 15

'(continued)                                               



  LINE (155, 143)-(164, 143), 15

  LINE (140, 144)-(148, 144), 15

  LINE (156, 144)-(164, 144), 15

  LINE (140, 145)-(147, 149), 15, BF

  LINE (135, 143)-(139, 152), 15, BF

  LINE (165, 143)-(169, 152), 15, BF

  LINE (145, 150)-(147, 150), 15

  LINE (145, 151)-(147, 151), 15

  LINE (145, 152)-(147, 152), 15

  LINE (157, 145)-(164, 149), 15, BF

  LINE (157, 150)-(159, 150), 15

  LINE (157, 151)-(159, 151), 15

  LINE (157, 152)-(159, 152), 15

  PSET (145, 159), 15

  LINE (144, 160)-(146, 160), 15

  PSET (159, 159), 15

  LINE (158, 160)-(160, 160), 15

  LINE (135, 156)-(139, 160), 15, BF

  LINE (165, 156)-(169, 160), 15, BF

  PSET (140, 160), 15: PSET (164, 160), 15

  LINE (135, 155)-(137, 155), 15

  LINE (167, 155)-(169, 155), 15

  PSET (135, 154), 15: PSET (169, 154), 15

  GET (135, 143)-(169, 160), RShipMask%

END SUB



SUB stars

    FOR I = 1 TO 20

      IF ST(I) = 1 THEN C = 1 ELSE C = 9

      PSET (SX(I), SY(I)), C

      SY(I) = SY(I) + ST(I) + 1

      IF SY(I) > 199 THEN

        SY(I) = 0: SY(I) = FNR(1)

        ST(I) = FNR(2)

      END IF

    NEXT

END SUB



SUB Statistics (Score%, Ships%)

  LINE (7, 0)-(13, 7), 7, BF: LINE (13, 1)-(13, 7), 15

  LINE (7, 0)-(12, 0), 8: LINE (7, 1)-(7, 6), 8

  LINE (8, 7)-(13, 7), 15: LINE (304, 0)-(310, 7), 7, BF

  LINE (310, 1)-(310, 7), 15: LINE (304, 0)-(309, 0), 8

  LINE (304, 0)-(304, 6), 8: LINE (305, 7)-(310, 7), 15



  LINE (106, 0)-(215, 7), 7, BF: LINE (106, 0)-(106, 6), 8

  LINE (106, 0)-(214, 0), 8: LINE (215, 1)-(215, 7), 15

  LINE (107, 7)-(214, 7), 15

  LOCATE 1, 3: COLOR 4: PRINT "Score:"

  LOCATE 1, 9: COLOR 11: PRINT Score%

  LOCATE 1, 29: COLOR 10: PRINT "Ships:"

  LOCATE 1, 35: COLOR 11: PRINT Ships%

END SUB



SUB Sunset (rxpos, rypos)

  LINE (19, 40)-(300, 55), 4, BF

'(continued)                                               



  LINE (19, 55)-(300, 70), 12, BF

  LINE (19, 70)-(300, 90), 14, BF

  LINE (19, 30)-(300, 30), 4

  LINE (19, 38)-(300, 38), 4: LINE (19, 35)-(300, 35), 4

  LINE (19, 45)-(300, 45), 12

  LINE (19, 50)-(300, 50), 12: LINE (19, 53)-(300, 53), 12

  LINE (19, 60)-(300, 60), 14

  LINE (19, 68)-(300, 68), 14: LINE (19, 65)-(300, 65), 14

  CIRCLE (155, 90), 20, 15

  PAINT (155, 90), 15, 15

  LINE (0, 91)-(319, 110), 0, BF

  LINE (19, 55)-(25, 60), 0: LINE (25, 60)-(35, 65), 0

  LINE (35, 65)-(44, 80), 0: LINE (44, 80)-(60, 90), 0

  PAINT (21, 60), 0, 0

  LINE (250, 90)-(270, 80), 0: LINE (270, 80)-(275, 75), 0

  LINE (276, 75)-(290, 90), 0: PAINT (260, 88), 0, 0

  PSET (100, 20), 1: PSET (250, 25), 8: PSET (50, 28), 8

  PSET (70, 36), 1: PSET (200, 33), 1: PSET (210, 10), 1

  PSET (20, 20), 9: PSET (55, 10), 9: PSET (170, 15), 9

  PSET (150, 13), 9: PSET (149, 13), 1: PSET (151, 13), 1

  PSET (150, 12), 1: PSET (150, 14), 1: PSET (280, 20), 1

  IF rxpos < 1 THEN rxpos = 300: rypos = 80

  rxpos = rxpos - 5: rypos = rypos - 1

  LINE (rxpos, rypos)-(rxpos + 3, rypos), 0, BF'ship       

SunsetDone:                                                

END SUB



SUB Title

  'r                                                       

  LINE (35, 10)-(75, 10), 4: LINE (35, 10)-(40, 15), 4

  LINE (40, 15)-(40, 30), 4: LINE (40, 30)-(35, 35), 4

  LINE (35, 35)-(55, 35), 4: LINE (55, 35)-(50, 30), 4

  LINE (50, 30)-(50, 15), 4: LINE (50, 15)-(65, 15), 4

  LINE (65, 15)-(85, 35), 4: LINE (75, 10)-(85, 20), 4

  LINE (55, 20)-(85, 20), 4: LINE (55, 20)-(65, 30), 4

  LINE (65, 30)-(60, 35), 4: LINE (60, 35)-(85, 35), 4

  'e                                                       

  LINE (85, 10)-(90, 15), 4: LINE (85, 10)-(135, 10), 4

  LINE (135, 10)-(130, 15), 4: LINE (130, 15)-(100, 15), 4

  LINE (90, 15)-(90, 30), 4: LINE (90, 30)-(85, 35), 4

  LINE (85, 35)-(135, 35), 4: LINE (135, 35)-(130, 30), 4

  LINE (130, 30)-(100, 30), 4: LINE (100, 15)-(100, 20), 4

  LINE (100, 30)-(100, 25), 4: LINE (100, 20)-(120, 20), 4

  LINE (100, 25)-(120, 25), 4: LINE (120, 20)-(120, 25), 4



  'd                                                       

  LINE (135, 10)-(175, 10), 4: LINE (135, 10)-(140, 15), 4

  LINE (140, 15)-(140, 30), 4: LINE (140, 30)-(135, 35), 4

  LINE (135, 35)-(175, 35), 4: LINE (150, 15)-(150, 30), 4

  LINE (150, 15)-(170, 15), 4: LINE (150, 30)-(170, 30), 4

  LINE (175, 10)-(185, 20), 4: LINE (175, 35)-(185, 25), 4

  LINE (185, 20)-(185, 25), 4: LINE (170, 15)-(175, 20), 4

  LINE (170, 30)-(175, 25), 4: LINE (175, 20)-(175, 25), 4

  'b                                                       

  LINE (35, 40)-(75, 40), 4: LINE (35, 40)-(40, 45), 4

  LINE (40, 45)-(40, 60), 4: LINE (40, 60)-(35, 65), 4

'(continued)                                               



  LINE (35, 65)-(75, 65), 4: LINE (75, 40)-(85, 50), 4

  LINE (75, 65)-(85, 55), 4: LINE (85, 50)-(83, 52), 4

  LINE (85, 55)-(83, 53), 4: LINE (50, 45)-(70, 45), 4

  LINE (70, 45)-(75, 50), 4: LINE (75, 50)-(50, 50), 4

  LINE (50, 45)-(50, 50), 4: LINE (50, 60)-(70, 60), 4

  LINE (70, 60)-(75, 55), 4: LINE (75, 55)-(50, 55), 4

  LINE (50, 55)-(50, 60), 4

  'a                                                       

  LINE (110, 40)-(85, 65), 4: LINE (110, 40)-(135, 65), 4

  LINE (85, 65)-(105, 65), 4: LINE (105, 65)-(100, 60), 4

  LINE (100, 60)-(105, 55), 4: LINE (105, 55)-(115, 55), 4

  LINE (135, 65)-(115, 65), 4: LINE (115, 65)-(120, 60), 4

  LINE (120, 60)-(115, 55), 4

  'r                                                       

  LINE (135, 40)-(175, 40), 4: LINE (135, 40)-(140, 45), 4

  LINE (140, 45)-(140, 60), 4: LINE (140, 60)-(135, 65), 4

  LINE (135, 65)-(155, 65), 4: LINE (155, 65)-(150, 60), 4

  LINE (150, 60)-(150, 45), 4: LINE (150, 45)-(165, 45), 4

  LINE (165, 45)-(185, 65), 4: LINE (175, 40)-(185, 50), 4

  LINE (155, 50)-(185, 50), 4: LINE (155, 50)-(165, 60), 4

  LINE (165, 60)-(160, 65), 4: LINE (160, 65)-(185, 65), 4

  'o                                                       

  LINE (195, 40)-(225, 40), 4: LINE (195, 40)-(190, 45), 4

  LINE (225, 40)-(230, 45), 4: LINE (190, 45)-(190, 60), 4

  LINE (230, 45)-(230, 60), 4: LINE (190, 60)-(195, 65), 4

  LINE (230, 60)-(225, 65), 4: LINE (195, 65)-(225, 65), 4

  LINE (200, 45)-(220, 60), 4, B

  'n                                                       

  LINE (235, 40)-(240, 45), 4: LINE (240, 45)-(240, 60), 4

  LINE (240, 60)-(235, 65), 4: LINE (235, 40)-(250, 40), 4

  LINE (250, 40)-(265, 55), 4: LINE (235, 65)-(255, 65), 4

  LINE (255, 65)-(250, 60), 4: LINE (250, 60)-(250, 50), 4

  LINE (250, 50)-(265, 65), 4: LINE (265, 55)-(265, 40), 4

  LINE (265, 40)-(280, 40), 4: LINE (280, 40)-(275, 45), 4

  LINE (275, 45)-(275, 65), 4: LINE (275, 65)-(265, 65), 4

  PAINT (37, 11), 12, 4: PAINT (62, 34), 12, 4

  PAINT (87, 11), 12, 4: PAINT (137, 11), 12, 4

  PAINT (37, 41), 12, 4: PAINT (110, 41), 12, 4

  PAINT (137, 41), 12, 4: PAINT (162, 64), 12, 4

  PAINT (195, 41), 12, 4: PAINT (237, 41), 12, 4

  LINE (216, 25)-(245, 25), 12

  LOCATE 3, 28: COLOR 4: PRINT "2573"

END SUB



SUB UpLeft (X%, Y%)

  X% = X% - 5: Y% = Y% - 5

  IF X% < 20 THEN X% = 20

  IF Y% < 100 THEN Y% = 100

END SUB



SUB UpRight (X%, Y%)

  X% = X% + 5: Y% = Y% - 5

  IF X% > 250 THEN X% = 250

  IF Y% < 100 THEN Y% = 100

END SUB



SUB WaveInfo (Wave, NumberofShips, Score%, Ships%)

    IF Wave = 0 THEN NumberofShips = 5

    IF Wave = 1 THEN NumberofShips = 1

    IF Wave = 2 THEN NumberofShips = 2

    IF Wave = 3 THEN NumberofShips = 2

    IF Wave = 4 THEN NumberofShips = 3

    IF Wave = 5 THEN NumberofShips = 3

    IF Wave = 6 THEN NumberofShips = 3

    IF Wave = 7 THEN NumberofShips = 4

    IF Wave = 8 THEN NumberofShips = 4

    IF Wave = 9 THEN NumberofShips = 4

    IF Wave = 10 THEN NumberofShips = 4

    IF Wave = 11 THEN NumberofShips = 5

    IF Wave = 12 THEN NumberofShips = 5

    IF Wave = 13 THEN NumberofShips = 5

    IF Wave = 14 THEN NumberofShips = 5

    IF Wave = 15 THEN NumberofShips = 2

    IF Wave = 16 THEN NumberofShips = 5

    IF Wave = 17 THEN NumberofShips = 3

    IF Wave = 18 THEN NumberofShips = 4

    IF Wave = 19 THEN NumberofShips = 5

    IF Wave = 20 THEN NumberofShips = 5

    IF Wave = 21 THEN NumberofShips = 5

    IF Wave = 22 THEN NumberofShips = 5

    IF Wave = 23 THEN NumberofShips = 5

    IF Wave = 24 THEN NumberofShips = 5

    IF Wave = 25 THEN NumberofShips = 1

    FOR times = 1 TO 50

      SCREEN 7, 0, 2, 0: PCOPY 1, 2

      CALL stars

      LOCATE 13, 18: COLOR 12: PRINT "Wave"; Wave

        IF Wave = 0 THEN

          LOCATE 14, 12: COLOR 15

          PRINT "ASCIIs in Space!!!"

        END IF

      CALL Statistics(Score%, Ships%)

      SCREEN 7, 0, 0, 0: PCOPY 2, 0: PCOPY 1, 2

    NEXT

END SUB



SUB YouLose (Score%, Ships%)

  FOR times = 1 TO 50

    SCREEN 7, 0, 2, 0: PCOPY 1, 2



    CALL stars: CALL Statistics(Score%, Ships%)

    LOCATE 13, 17: COLOR 12: PRINT "Game Over"

    SCREEN 7, 0, 0, 0: PCOPY 2, 0: PCOPY 1, 2

  NEXT

END SUB



