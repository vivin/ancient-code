DECLARE FUNCTION MakeAngle% (SlopeY#, SlopeX#)

RANDOMIZE TIMER
CLS
SCREEN 12

Newest:
  PALETTE 10, 256 * 63
  PALETTE 11, 256 * 51
  PALETTE 12, 256 * 38
  PALETTE 13, 256 * 26
  PALETTE 14, 256 * 12
  PALETTE 15, 256 * 0

  TYPE TypeB
    XCatch AS INTEGER
    YCatch AS INTEGER
    OldX AS INTEGER
    OldY AS INTEGER
    X AS SINGLE
    Y AS SINGLE
    Angle AS INTEGER
    Power AS DOUBLE
    Strength AS DOUBLE
    MovingX AS DOUBLE
    MovingY AS DOUBLE
    END TYPE

  Stay! = 1
  Blips% = 10
  Trail! = 3
  Steps! = Trail!
  Shows! = 1

  DIM Bliping(1 TO Blips%) AS TypeB
  FOR I = 1 TO Blips%
    Bliping(I).Angle = INT(RND * 360)
    Bliping(I).Power = (RND ^ 2) * -1 + 1
    Bliping(I).X = (SIN(Bliping(I).Angle * 3.141593 / 180) * 238) * Bliping(I).Power + 319
    Bliping(I).Y = (COS(Bliping(I).Angle * 3.141593 / 180) * 238) * Bliping(I).Power + 239
    Temp# = INT(RND * 360)
    Temp2# = RND / 2000 + .0005
    Bliping(I).MovingX = (SIN(Temp# * 3.141593 / 180) * 238) * Temp2#
    Bliping(I).MovingY = (COS(Temp# * 3.141593 / 180) * 238) * Temp2#
  NEXT I

  CIRCLE (319, 239), 239 / 6 * 6, 10
 
  DO
    FOR I% = 0 TO 360 STEP Steps!
   
      LINE (319, 239)-(SIN(I% * 3.141593 / 180) * 238 + 319, COS(I% * 3.141593 / 180) * 238 + 239), 10
      LINE (319, 239)-(SIN((I% - Trail! * Shows!) * 3.141593 / 180) * 238 + 319, COS((I% - Trail! * Shows!) * 3.141593 / 180) * 238 + 239), 0
 
      FOR X% = 1 TO Blips%
        Bliping(X%).X = Bliping(X%).X + Bliping(X%).MovingX
        Bliping(X%).Y = Bliping(X%).Y + Bliping(X%).MovingY
        Bliping(X%).Angle = MakeAngle%((Bliping(X%).Y - 239), (Bliping(X%).X - 319))

        MakeNew% = 0
       
        IF Bliping(X%).Angle <= 135 AND Bliping(X%).Angle >= 45 THEN
          IF (Bliping(X%).X - 319) > (SIN(Bliping(X%).Angle * 3.14159 / 180) * 237) THEN MakeNew% = 1
          END IF
        IF Bliping(X%).Angle <= 315 AND Bliping(X%).Angle >= 225 THEN
          IF (Bliping(X%).X - 319) < (SIN(Bliping(X%).Angle * 3.14159 / 180) * 237) THEN MakeNew% = 1
          END IF
        IF Bliping(X%).Angle <= 225 AND Bliping(X%).Angle >= 135 THEN
          IF (Bliping(X%).Y - 238) < (COS(Bliping(X%).Angle * 3.14159 / 180) * 237) THEN MakeNew% = 1
          END IF
        IF Bliping(X%).Angle <= 45 OR Bliping(X%).Angle >= 315 THEN
          IF (Bliping(X%).Y - 238) > (COS(Bliping(X%).Angle * 3.14159 / 180) * 237) THEN MakeNew% = 1
          END IF
         
        IF MakeNew% = 1 THEN
          Bliping(X%).Angle = INT(RND * 360)
          Bliping(X%).Power = (RND ^ 2) * -1 + 1
          Bliping(X%).X = (SIN(Bliping(X%).Angle * 3.141593 / 180) * 238) * Bliping(X%).Power + 319
          Bliping(X%).Y = (COS(Bliping(X%).Angle * 3.141593 / 180) * 238) * Bliping(X%).Power + 239
          Temp# = INT(RND * 360)
          Temp2# = RND / 1000 + .001
          Bliping(X%).MovingX = (SIN(Temp# * 3.141593 / 180) * 238) * Temp2#
          Bliping(X%).MovingY = (COS(Temp# * 3.141593 / 180) * 238) * Temp2#
          END IF

        IF Bliping(X%).Strength > 0 THEN Bliping(X%).Strength = Bliping(X%).Strength - Stay!
       
        IF I% + Steps! > Bliping(X%).Angle AND I% <= Bliping(X%).Angle THEN
          Bliping(X%).Strength = 100
          Bliping(X%).XCatch = Bliping(X%).X
          Bliping(X%).YCatch = Bliping(X%).Y
          END IF
       
        PSET (Bliping(X%).XCatch, Bliping(X%).YCatch), (INT(Bliping(X%).Strength / 16.666) * -1 + 16)
      NEXT X%
    NEXT I%
  LOOP
  RETURN

FUNCTION MakeAngle% (SlopeY#, SlopeX#)
  IF SlopeY# <> 0 THEN
    IF SlopeX# / SlopeY# < 0 THEN
      IF SlopeX# < 0 THEN SlopeX# = ABS(SlopeX#): Temp2% = 1
      IF SlopeY# < 0 THEN SlopeY# = ABS(SlopeY#): Temp2% = 2
      END IF
    SELECT CASE SlopeX# / SlopeY#
      CASE 0 TO .0087
        Temp% = 0
      CASE .0087 TO .0261
        Temp% = 1
      CASE .0261 TO .0436
        Temp% = 2
      CASE .0436 TO .0611
        Temp% = 3
      CASE .0611 TO .0787
        Temp% = 4
      CASE .0787 TO .0962
        Temp% = 5
      CASE .0962 TO .1139
        Temp% = 6
      CASE .1139 TO .1316
        Temp% = 7
      CASE .1316 TO .1494
        Temp% = 8
      CASE .1494 TO .1673
        Temp% = 9
      CASE .1673 TO .1853
        Temp% = 10
      CASE .1853 TO .2034
        Temp% = 11
      CASE .2034 TO .2216
        Temp% = 12
      CASE .2216 TO .24
        Temp% = 13
      CASE .24 TO .2586
        Temp% = 14
      CASE .2586 TO .2773
        Temp% = 15
      CASE .2773 TO .2962
        Temp% = 16
      CASE .2962 TO .3152
        Temp% = 17
      CASE .3152 TO .3345
        Temp% = 18
      CASE .3345 TO .3541
        Temp% = 19
      CASE .3541 TO .3738
        Temp% = 20
      CASE .3738 TO .3939
        Temp% = 21
      CASE .3939 TO .4142
        Temp% = 22
      CASE .4142 TO .4348
        Temp% = 23
      CASE .4348 TO .4557
        Temp% = 24
      CASE .4557 TO .4769
        Temp% = 25
      CASE .4769 TO .4985
        Temp% = 26
      CASE .4985 TO .5205
        Temp% = 27
      CASE .5205 TO .5429
        Temp% = 28
      CASE .5429 TO .5657
        Temp% = 29
      CASE .5657 TO .589
        Temp% = 30
      CASE .589 TO .6128
        Temp% = 31
      CASE .6128 TO .637
        Temp% = 32
      CASE .637 TO .6618
        Temp% = 33
      CASE .6618 TO .6872
        Temp% = 34
      CASE .6872 TO .7132
        Temp% = 35
      CASE .7132 TO .7399
        Temp% = 36
      CASE .7399 TO .7673
        Temp% = 37
      CASE .7673 TO .7954
        Temp% = 38
      CASE .7954 TO .8243
        Temp% = 39
      CASE .8243 TO .854
        Temp% = 40
      CASE .854 TO .8847
        Temp% = 41
      CASE .8847 TO .9163
        Temp% = 42
      CASE .9163 TO .9489
        Temp% = 43
      CASE .9489 TO .9826
        Temp% = 44
      CASE .9826 TO 1.017
        Temp% = 45
      CASE 1.017 TO 1.053
        Temp% = 46
      CASE 1.053 TO 1.091
        Temp% = 47
      CASE 1.091 TO 1.13
        Temp% = 48
      CASE 1.13 TO 1.17
        Temp% = 49
      CASE 1.17 TO 1.213
        Temp% = 50
      CASE 1.213 TO 1.257
        Temp% = 51
      CASE 1.257 TO 1.303
        Temp% = 52
      CASE 1.303 TO 1.351
        Temp% = 53
      CASE 1.351 TO 1.401
        Temp% = 54
      CASE 1.401 TO 1.455
        Temp% = 55
      CASE 1.455 TO 1.51
        Temp% = 56
      CASE 1.51 TO 1.569
        Temp% = 57
      CASE 1.569 TO 1.631
        Temp% = 58
      CASE 1.631 TO 1.697
        Temp% = 59
      CASE 1.697 TO 1.767
        Temp% = 60
      CASE 1.767 TO 1.841
        Temp% = 61
      CASE 1.841 TO 1.92
        Temp% = 62
      CASE 1.92 TO 2.005
        Temp% = 63
      CASE 2.005 TO 2.096
        Temp% = 64
      CASE 2.096 TO 2.194
        Temp% = 65
      CASE 2.194 TO 2.299
        Temp% = 66
      CASE 2.299 TO 2.414
        Temp% = 67
      CASE 2.414 TO 2.538
        Temp% = 68
      CASE 2.538 TO 2.674
        Temp% = 69
      CASE 2.674 TO 2.823
        Temp% = 70
      CASE 2.823 TO 2.988
        Temp% = 71
      CASE 2.988 TO 3.171
        Temp% = 72
      CASE 3.171 TO 3.375
        Temp% = 73
      CASE 3.375 TO 3.605
        Temp% = 74
      CASE 3.605 TO 3.866
        Temp% = 75
      CASE 3.866 TO 4.165
        Temp% = 76
      CASE 4.165 TO 4.51
        Temp% = 77
      CASE 4.51 TO 4.915
        Temp% = 78
      CASE 4.915 TO 5.395
        Temp% = 79
      CASE 5.395 TO 5.975
        Temp% = 80
      CASE 5.975 TO 6.691
        Temp% = 81
      CASE 6.691 TO 7.595
        Temp% = 82
      CASE 7.595 TO 8.776
        Temp% = 83
      CASE 8.776 TO 10.38
        Temp% = 84
      CASE 10.38 TO 12.7
        Temp% = 85
      CASE 12.7 TO 16.34
        Temp% = 86
      CASE 16.34 TO 22.9
        Temp% = 87
      CASE 22.9 TO 38.18
        Temp% = 88
      CASE 38.18 TO 114.5
        Temp% = 89
      CASE IS > 114.5
        Temp% = 90
      END SELECT
  ELSE
    Temp% = 90
    END IF
  IF Temp2% = 1 THEN Temp% = (Temp% * -1 + 90) + 270
  IF Temp2% = 2 THEN Temp% = (Temp% * -1 + 90) + 90
  IF SlopeX# < 0 AND SlopeY# < 0 THEN Temp% = Temp% + 180
  MakeAngle% = Temp%
END FUNCTION

