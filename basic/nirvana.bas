

'Nirvana: all apologies



'by Mallard (mallard@gcomm.com)



'



'This program is also an example of error trapping to create continuous



'background music.



'It also does some stupid graphics-type stuff.



'



'Taken from:  The QBasic Page.  The best source for QB stuff on the 'net!



'http://www.wp.com/80948/qb/



'



SCREEN 13







PLAY "mb"







'defines music notes



'to change the music, switch the commented strings w/ the uncommented ones



'music1$ = "o2 f8 f8 f+8 f8 g+8 g+8 f+8 f4 f8 f+8 f8 o3 c#8 c#8 o2 b8 a#8"



'music2$ = "o2 f8 f8 f+8 f8 g+8 g+8 f+8 f4 f8 f+8 f8 o3 f8 f8 d#8 c#8"







PLAY "t255"



music1$ = "o2 c1 d4 f4 e4 d4 g2 g2 g4 a4 e4 f4 d2 d2 d4 f4 e4 d4 c4 o3 c4 o2 b4 a4 g4 f4 e4 d4 c1"



music2$ = "d4 f4 e4 d4 g2 g2 g4 a4 e4 f4 d2 d2 d4 f4 e4 d4 c4 g4 d4 e4 c2 p2"







'flag for which string of notes to play



mflag = 2



'flag for graphics



flag = 1



PLAY "mb"                                 'play music in background



PLAY music1$                              'begin music



PLAY ON                                   'enable PLAY error trapping











DO



ON PLAY(1) GOSUB playmusic                'if there's one note in the



                                          'music buffer, add the next notes



                                          IF flag = 4 THEN flag = 1:                'sets flag



                                          'graphics statements:



                                          IF flag = 1 THEN LINE (INT(RND * 319) + 1, INT(RND * 200) + 1)-(INT(RND * 319) + 1, INT(RND * 200) + 1), PLAY(1), BF



                                          IF flag = 2 THEN CIRCLE (INT(RND * 319) + 1, INT(RND * 200) + 1), PLAY(1), INT(RND * 15) + 1



                                          IF flag = 3 THEN LINE (INT(RND * 319) + 1, INT(RND * 200) + 1)-(INT(RND * 319) + 1, INT(RND * 200) + 1), PLAY(1), B



                                          LOOP







                                          'SUB for music playing



                                          'each plays its string, inverts the music flag, and increases the graphics



                                          'flag.  Then they RETURN.



playmusic:



IF mflag = 1 THEN PLAY music1$: mflag = 2: CLS : flag = flag + 1: RETURN



IF mflag = 2 THEN PLAY music2$: mflag = 1: CLS : flag = flag + 1: RETURN











'End of program.  For more help on PLAY error trapping, write me at



'mallard@gcomm.com.



