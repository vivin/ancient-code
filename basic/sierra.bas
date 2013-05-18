

'FROM:    JOHN DIAMOND(CSGP96D)
'SUBJECT: QB SIERRA ENGINE #1
 
'Well this product is from Paradise Software. If you need help with it
'I suggest you e-mail the author at the address above.



' Note -1                                         
'Well, I finally got the QB SIERRA GAME ENGINE to work...
'well, sort of. I have run into two minor problems:     
'1) The first time you pass up an object verticaly the  
'object will flash.                                     
'2) When the character is walking west, and he passes in
'front of the tree his body turns blue.                 
'If anyone can fix these problems please contact me!    
'                               ~J.d~                   
DECLARE SUB CONCLUDE ()
DECLARE SUB PERIMETER (X1!, Y1!, X2!, Y2!, RETRN%)
DECLARE SUB EFFECT ()
DECLARE SUB ANIMATE ()
DECLARE SUB background ()
DIM SHARED TREE(6000), ROCK(500)
DIM SHARED TREEMASK(6000), ROCKMASK(500)
DIM SHARED MOVE1(100), MOVE2(100), WALKDOWN1(100), WALKDOWN2(100)
DIM SHARED WALKUP1(100), WALKUP2(100), WALK1.2(100), WALK2.2(100)
DIM SHARED MOVE1MASK(100), MOVE2MASK(100), WALKDOWNMASK1(100), WALKDOWNMASK2(100)
DIM SHARED WALKUPMASK1(100), WALKUPMASK2(100), WALKMASK1.2(100), WALKMASK2.2(100)
DIM SHARED X, y
SCREEN 7, 0, 0, 0
PRINT "This is known as a 3d generation RPG"
PRINT "engine. This program will allow you to"
PRINT "make Sierra type games. This engine uses"
PRINT "3 screen pages to produce the animation,"
PRINT "thus allowing you to use this engine "
PRINT "WITH SCREEN 7, 8, and the VGA "
PRINT "animation library(MODEX)"
PRINT STRING$(40, 196)
PRINT "Please note.. None of the material"
PRINT "in this program has been copied from"
PRINT "Sierra On-line inc. This all came"
PRINT "from my head"
PRINT
PRINT "Sierra is a registered trademark(R)"
PRINT "of Sierra On-line inc."
WHILE INKEY$ = "": WEND
CLS
PRINT "Press enter after each drawing is done."
'
'PRODIGY(R) interactive personal service         03/22/95         0:29 AM

CIRCLE (5, 20), 5, 1: LINE (5, 25)-(5, 35), 4: LINE (4, 35)-(4, 40), 6: LINE (6, 35)-(6, 38), 6: LINE (5, 30)-(10, 25), 4
CIRCLE (16, 20), 5, 1: LINE (16, 25)-(16, 35), 4: LINE (15, 35)-(15, 38), 6: LINE (17, 35)-(17, 40), 6: LINE (16, 30)-(21, 25), 4
GET (0, 15)-(10, 40), MOVE1: GET (11, 15)-(21, 40), MOVE2
LOCATE 9, 1: PRINT "WALK1": PRINT "WALK2": WHILE INKEY$ = "_": WEND: LINE (0, 10)-(319, 199), 0, BF
CIRCLE (5, 20), 5, 1: LINE (5, 25)-(5, 35), 4: LINE (4, 35)-(4, 40), 6: LINE (6, 35)-(6, 38), 6: PSET (6, 30), 4: PSET (4, 30), 4: PSET (3, 19), 1: PSET (7, 19), 1: LINE (4, 22)-(6, 22), 1
CIRCLE (16, 20), 5, 1: LINE (16, 25)-(16, 35), 4: LINE (15, 35)-(15, 38), 6: LINE (17, 35)-(17, 40), 6: PSET (17, 30), 4: PSET (15, 30), 4: PSET (14, 19), 1: PSET (18, 19), 1:
LINE (15, 22)-(17, 22), 1
GET (0, 15)-(10, 40), WALKDOWN1: GET (11, 15)-(21, 40), WALKDOWN2
'(continued)                                            
'PRODIGY(R) interactive personal service         03/22/95         0:29 AM

'         COMPUTER BB
'TOPIC:   PROGRAMMING
'TIME:    03/18 10:42 PM
 
'TO:      ALL
'FROM:    JOHN DIAMOND   (CSGP96D)
'SUBJECT: QB SIERRA ENGINE #2
 
' Note -2                                               
LOCATE 9, 1: PRINT "WALKDOWN1": PRINT "WALKDOWN2": WHILE INKEY$ = "": WEND: LINE (0, 10)-(320, 200), 0, BF
CIRCLE (5, 20), 5, 1: LINE (5, 25)-(5, 35), 4: LINE (4, 35)-(4, 40), 6: LINE (6, 35)-(6, 38), 6: PSET (6, 30), 4: PSET (4, 30), 4:                                          
CIRCLE (16, 20), 5, 1: LINE (16, 25)-(16, 35), 4: LINE (15, 35)-(15, 38), 6: LINE (17, 35)-(17, 40), 6: PSET (17, 30), 4: PSET (15, 30), 4
GET (0, 15)-(10, 40), WALKUP1: GET (11, 15)-(21, 40), WALKUP2
LOCATE 9, 1: PRINT "WALKUP1": PRINT "WALKUP2": WHILE INKEY$ = "": WEND: LINE (0, 10)-(320, 200), 0, BF
CIRCLE (5, 20), 5, 1: LINE (5, 25)-(5, 35), 4: LINE (4, 35)-(4, 40), 6: LINE (6, 35)-(6, 38), 6: LINE (5, 30)-(0, 25)
4                                                      
CIRCLE (16, 20), 5, 1: LINE (16, 25)-(16, 35), 4: LINE (15, 35)-(15, 38), 6: LINE (17, 35)-(17, 40), 6: LINE (16, 30)-(11, 25), 4
GET (0, 15)-(10, 40), WALK1.2: GET (11, 15)-(21, 40), WALK2.2
LOCATE 9, 1: PRINT "WALK1.2": PRINT "WALK2.2": WHILE INKEY$ = "": WEND:                                            
COLOR 14
PRINT "The arrays you just saw WALK1,"
PRINT "WALKDOWN1, ect. ARE needed for the "
PRINT "engine. Though there graphic may by"
PRINT "changed, there size & ARRAY name may"
PRINT "not!"
WHILE INKEY$ = "": WEND
CLS
LINE (0, 15)-(10, 40), 15, BF: LINE (10, 15)-(21, 40), 15, BF
CIRCLE (5, 20), 5, 0: LINE (5, 25)-(5, 35), 0: LINE (4, 35)-(4, 40), 0: LINE (6, 35)-(6, 38), 0: LINE (5, 30)-(10, 25)
0                                                       
CIRCLE (16, 20), 5, 0: LINE (16, 25)-(16, 35), 0: LINE (15, 35)-(15, 38), 0: LINE (17, 35)-(17, 40), 0: LINE (16, 30)-(21, 25), 0
GET (0, 15)-(10, 40), MOVE1MASK: GET (11, 15)-(21, 40), MOVE2MASK
LINE (0, 15)-(10, 40), 15, BF: LINE (10, 15)-(21, 40), 15, BF
CIRCLE (5, 20), 5, 1: LINE (5, 25)-(5, 35), 4: LINE (4, 35)-(4, 40), 6: LINE (6, 35)-(6, 38), 6: PSET (6, 30), 4: PSET (4, 30), 4: PSET (3, 19), 1: PSET (7, 19), 1: LINE (4, 22)-(6, 22), 1
CIRCLE (16, 20), 5, 1: LINE (16, 25)-(16, 35), 4: LINE (15, 35)-(15, 38), 6: LINE (17, 35)-(17, 40), 6: PSET (17, 30), 4: PSET (15, 30), 4: PSET (14, 19), 1: PSET (18, 19), 1:
LINE (15, 22)-(17, 22), 1
GET (0, 15)-(10, 40), WALKDOWNMASK1: GET (11, 15)-(21, 40), WALKDOWNMASK2
LINE (0, 15)-(10, 40), 15, BF: LINE (10, 15)-(21, 40), 15, BF
CIRCLE (5, 20), 5, 1: LINE (5, 25)-(5, 35), 4: LINE (4, 35)-(4, 40), 6: LINE (6, 35)-(6, 38), 6: PSET (6, 30), 4: PSET (4, 30), 4:                                          
CIRCLE (16, 20), 5, 1: LINE (16, 25)-(16, 35), 4: LINE (15, 35)-(15, 38), 6: LINE (17, 35)-(17, 40), 6: PSET (17, 30), 4: PSET (15, 30), 4
GET (0, 15)-(10, 40), WALKUPMASK1: GET (11, 15)-(21, 40), WALKUPMASK2
LINE (0, 15)-(10, 40), 15, BF: LINE (10, 15)-(21, 40), 15, BF
CIRCLE (5, 20), 5, 1: LINE (5, 25)-(5, 35), 4: LINE (4, 35)-(4, 40), 6: LINE (6, 35)-(6, 38), 6: LINE (5, 30)-(0, 25), 4
CIRCLE (16, 20), 5, 1: LINE (16, 25)-(16, 35), 4: LINE (15, 35)-(15, 38), 6: LINE (17, 35)-(17, 40), 6: LINE (16, 30)-(11, 25), 4
'(continued)                                            
'PRODIGY(R) interactive personal service         03/22/95         0:29 AM

'         COMPUTER BB
'TOPIC:   PROGRAMMING
'TIME:    03/19 12:32 AM
 
'TO:      ALL
'FROM:    JOHN DIAMOND   (CSGP96D)
'SUBJECT: QB SIERRA ENGINE #3
 
' Note -3                                               
GET (0, 15)-(10, 40), WALKMASK1.2: GET (11, 15)-(21, 40), WALKMASK2.2
                                                            
CLS : COLOR 15
PRINT "These are the scene layout items, i.e"
PRINT "rocks, tress, bushes, ect."
LINE (20, 40)-(40, 80), 8, BF: CIRCLE (120, 40), 20, 10: PAINT (120, 40), 10
LINE (115, 58)-(125, 100), 6, BF
GET (20, 40)-(40, 80), ROCK
COLOR 15
GET (100, 20)-(140, 100), TREE
LOCATE 15, 5: PRINT "WALL": LOCATE 15, 20: PRINT "TREE"
PRINT : PRINT "  Unlike the characters these": PRINT "arrays do not require to be"
PRINT "the same size & name. "
CIRCLE (10, 10), 10, 15: PAINT (10, 10), 15
WHILE INKEY$ = "": WEND
CLS : PAINT (0, 0), 15
LINE (20, 40)-(40, 80), 0, BF: CIRCLE (120, 40), 20, 0: PAINT (120, 40), 0
GET (20, 40)-(40, 80), ROCKMASK
LINE (115, 58)-(125, 100), 0, BF
GET (100, 20)-(140, 100), TREEMASK
LOCATE 15, 5: PRINT "WallMASK": LOCATE 15, 20: PRINT "TreeM"; ASK; "                                                        "
WHILE INKEY$ = "": WEND: CLS
COLOR 9: PRINT "Now that we have GOT the ARRAYs"
PRINT "We will use them in this simple demo.."
PRINT "To end simply walk off the screen"
COLOR 14
PRINT "Keys:"
PRINT "         " + CHR$(24)
PRINT : PRINT
PRINT "     " + CHR$(17) + "   5   " + CHR$(16)
PRINT : PRINT
PRINT "         " + CHR$(25)
WHILE INKEY$ = "": WEND
background
ANIMATE
CONCLUDE
                                                            
'
'PRODIGY(R) interactive personal service         03/22/95         0:31 AM
                                                            
'End of file                                            
'IMPORTed by Super Duper PRO, 1994 Gamers' Paradise     
'Software(tm) Written by: John Diamond, & ThOmAs        
'Lipschultz                                             
'sierra.bas was posted by: ~J.d~                        
'and is avialible for comments at: CSGP96D              
'MJ is back!!! Die New York, Die!!!!!!!!               

SUB ANIMATE
'
'PRODIGY(R) interactive personal service         03/22/95         0:29 AM

'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'This variables set the starting coordinates, and character_direction.
a = 2
y = 110
X = 5
FLAG = 1
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'##########################################################
'This is the simple key loop. I have found the using GOTO i_n a key loop works                                   
'faster than DO...LOOP, and WHILE....WEND               
in:                                                     
'(continued)                                            
'PRODIGY(R) interactive personal service         03/22/95         0:30 AM

'         COMPUTER BB
'TOPIC:   PROGRAMMING
'TIME:    03/18 10:48 PM
 
'TO:      ALL
'FROM:    JOHN DIAMOND   (CSGP96D)
'SUBJECT: QB SIERRA ENGIN #4
 
' Note -4                                               
K$ = INKEY$
IF K$ = CHR$(0) + "M" THEN FLAG = 1: FLG = 0
IF K$ = CHR$(0) + "K" THEN FLAG = 2: FLG = 0
IF K$ = CHR$(0) + "H" THEN FLAG = 3: FLG = 0
IF K$ = CHR$(0) + "P" THEN FLAG = 4: FLG = 0
IF K$ = "5" THEN FLG = 5
'##########################################################
PCOPY 1, 2
'/-\/-\/-\/-\/-\/-\/-\/-\/-\/-\/-\/-\/-\/-\/-\/-\/-\/-\/-\/
'This take the FLAGs set in the key loop and decides which _character
'array to put on the screen.                            
IF FLAG = 1 THEN SCREEN 7, 0, 2, 0: PUT (X, y), MOVE1MASK, AND: PUT (X, y), MOVE1, XOR
IF FLAG = 2 THEN SCREEN 7, 0, 2, 0: PUT (X, y), WALKMASK1.2, AND: PUT (X, y), WALK1.2, XOR
IF FLAG = 3 THEN SCREEN 7, 0, 2, 0: PUT (X, y), WALKUPMASK1, AND: PUT (X, y), WALKUP1, XOR
IF FLAG = 4 THEN SCREEN 7, 0, 2, 0: PUT (X, y), WALKDOWNMASK1, AND: PUT (X, y), WALKDOWN1, XOR
'\-/\-/\-/\-/\-/\-/\-/\-/\-/\-/\-/\-/\-/\-/\-/\-/\-/\-/\-/\
EFFECT
PCOPY 2, 0
PCOPY 1, 2
'/-\/-\/-\/-\/-\/-\/-\/-\/-\/-\/-\/-\/-\/-\/-\/-\/-\/-\/-\/
'This take the FLAGs set in the key loop and decides which _character
'array to put on the screen.                            
IF FLAG = 1 THEN SCREEN 7, 0, 2, 0: PUT (X, y), MOVE2MASK, AND: PUT (X, y), MOVE2, XOR
IF FLAG = 2 THEN SCREEN 7, 0, 2, 0: PUT (X, y), WALKMASK2.2, AND: PUT (X, y), WALK2.2, XOR
IF FLAG = 3 THEN SCREEN 7, 0, 2, 0: PUT (X, y), WALKUPMASK2, AND: PUT (X, y), WALKUP2, XOR
IF FLAG = 4 THEN SCREEN 7, 0, 2, 0: PUT (X, y), WALKDOWNMASK2, AND: PUT (X, y), WALKDOWN2, XOR
'\-/\-/\-/\-/\-/\-/\-/\-/\-/\-/\-/\-/\-/\-/\-/\-/\-/\-/\-/\
EFFECT
PCOPY 2, 0
'-==--==--==--==--==--==--==--==--==--=                 
'These IF statements are used to detect the base of an obje_ct. To detect an                                     
'object we use 2 IF statements. Then first will detect 1 pi_xel in front of                                  
'an object and stop the character from going forth. The sec_ond IF will detect                                    
'1 pixel behind an object and stop the character from going_forth.
IF X > 90 AND X < 121 AND y = 135 THEN y = y + 1
IF X > 90 AND X < 121 AND y = 134 THEN y = y - 1
IF X > 206 AND X < 226 AND y = 116 THEN y = y + 1
IF X > 206 AND X < 226 AND y = 113 THEN y = y - 1
'-==--==--==--==--==--==--==--==--==--=                 
'<><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
'This takes the FLAGs set in the key loop and determines wh_at to do with them.                                  
'(continued)                                            
'PRODIGY(R) interactive personal service         03/22/95         0:30 AM

'         COMPUTER BB
'TOPIC:   PROGRAMMING
'TIME:    03/18 10:48 PM
'
'TO:      ALL
'FROM:    JOHN DIAMOND   (CSGP96D)
'SUBJECT: QB SIERRA ENGIN #5RP
 
' Note -5                                               
'i.e IF FLAG = 1 THEN X = X + 1 = if last key was the -> ke_y then move the                                      
'character to the right.                                
IF FLG = 5 THEN GOTO SKIP 'This flag is for the STOP key, w_hich will halt the                                   
'characters movement                                    
IF FLAG = 1 THEN X = X + 1
IF FLAG = 2 THEN X = X - 1
IF FLAG = 3 THEN y = y - 1
IF FLAG = 4 THEN y = y + 1
SKIP:                                                   
'<><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
'********************************************           
PERIMETER 0, 40, 309, 175, RETRN%          '*           
'This sub is uesed to specify the perimeter *           
'of the current scene. In multi-scene games *           
'you will need to add an IF before it(i.e:  *           
'IF SCENE = 1 THEN PERIMETER 0,40,209,175,retrn%)*      
'Here's how to use the sub:                 *           
'PERIMETER X1,Y1,X2,Y2, RETRN%              *           
'RETRN% will return either a 1 or a 0. If   *           
'it's a 1 then the character passed the     *           
'scene's perimeter.                         *           
'********************************************           
IF RETRN% <> 1 THEN GOTO in
                                                            
END SUB

SUB background
' Just the background                                   
SCREEN 7, 0, 1, 0: LINE (0, 50)-(319, 50), 9: LINE (0, 51)-(319, 51), 2
PAINT (0, 0), 9: PAINT (0, 52), 2
'For some strange reason when I put these PRINT statements _in, and                                              
'your character walks into the horizon his head comes of!!!
COLOR 15, 9: LOCATE 2, 8: PRINT "The QB Sierra Game Engine"
LOCATE 3, 12: PRINT "By: John Diamond"
END SUB

SUB CONCLUDE
'Just my little paragraph at the end                    
SCREEN 0, 0, 0, 0: WIDTH 80
'
'PRODIGY(R) interactive personal service         03/22/95         0:31 AM

CLS
COLOR 15, 0: PRINT "      Well now that you have seen the d_emo, what do ya think?"
PRINT "To find out how to use the engine just scroll throug_h the SUB routines"
PRINT "and read the " + CHR$(34) + "'" + CHR$(34) + " comme_nts, or you can contact me at CSGP96D! Enjoy!"
PRINT
PRINT "                                 ~J.d~"
END SUB

SUB EFFECT
'       This SUB is where the magic takes place. This will
'(continued)                                            
'PRODIGY(R) interactive personal service         03/22/95         0:31 AM

'         COMPUTER BB
'TOPIC:   PROGRAMMING
'TIME:    03/18 10:48 PM
 
'TO:      ALL
'FROM:    JOHN DIAMOND   (CSGP96D)
'SUBJECT: QB SIERRA ENGIN #6
 
' Note -6                                               
'take the current coordinates of the character a determin w_ether
'he's to walk in-front-of the object or behind it, then it _will
'creat the illusion using AND & XOR.                    
'                                                       
'       You don't realy have to know the technical side to _this... To be honest                                 
'I doubt I can explain it, but here's what you do need to k_
now:                                                    
'                                                       
'      This is the graphic array for the objects MASK-+ 
'                                                     | 
'  This is the graphic array for the object-----------|----------------------------+                          
'                                                     |    _
'                        |                             
'IF Y > 135 THEN SCREEN 7, 0, 1, 0: PUT (100, 120), ROCKMAS_K, AND: PUT (100, 120), ROCK, XOR                    
'IF Y < 135 THEN SCREEN 7, 0, 2, 0: PUT (100, 120), ROCKMAS_K, AND: PUT (100, 120), ROCK, XOR                     
'       |                                |+----------------_-----+-------------+|                                
'       +These should be the bottom coordinates of the obje_ct   |                                               
'                                                          _|                                               
'These are the coordinates for the graphic/mask array------_-----+                                               
                                                            
'::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
'Here's the actual code:                                
IF y > 135 THEN SCREEN 7, 0, 1, 0: PUT (100, 120), ROCKMASK, AND: PUT (100, 120), ROCK, XOR
IF y < 135 THEN SCREEN 7, 0, 2, 0: PUT (100, 120), ROCKMASK, AND: PUT (100, 120), ROCK, XOR
IF y > 114 THEN SCREEN 7, 0, 1, 0: PUT (200, 60), TREEMASK, AND: PUT (200, 60), TREE, XOR
IF y < 114 THEN SCREEN 7, 0, 2, 0: PUT (200, 60), TREEMASK, AND: PUT (200, 60), TREE, XOR
'::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
END SUB

SUB PERIMETER (X1, Y1, X2, Y2, RETRN%)
RETRN% = 0
IF X = X1 THEN RETRN% = 1
IF y = Y1 THEN RETRN% = 1
IF X = X2 THEN RETRN% = 1
IF y = Y2 THEN RETRN% = 1
END SUB

