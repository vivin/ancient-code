

'ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
'³ CHAT    .BAS                                      AI Demo ³
'ÆÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍµ
'³ This program is by Mallard.  For other programs like this ³
'³ one, or for more information, please contact me.  I can   ³
'³ be reached at "mallard@gcomm.com" via Internet e-mail or  ³
'³ or via WWW - "http://www.lookup.com/homepages/80948/qb/   ³
'³ index.html". Please upload as much source code as you can ³
'³ to this home page!   Feel free to distribute this program,³
'³ or use part or all of it in one of your own as long as I  ³
'³ am given credit.  Thanks!              ÍMallardÍ          ³
'ÔÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¾
'
RANDOMIZE TIMER
DIM word$(20)
CLS
COLOR 14
PRINT ""
CLS
DO
IF a > 0 THEN LET a = a + 2
IF a = 0 THEN LET a = a + 1
IF a = 1 THEN LET st$ = "Hello, " + name$ + ".": GOTO typeit
IF a = 23 THEN
LOCATE 1, 1
COLOR 12
PRINT "Press a key."
SLEEP
CLS
LET a = 2
END IF
LOCATE a - 1, 1
COLOR 14
LINE INPUT cool$
LET cool$ = LCASE$(cool$)
IF LEN(cool$) > 75 THEN LET st$ = "That's too complicated for me to understand.": GOTO typeit
FOR I = 1 TO 20
word$(I) = ""
NEXT I
word = 1
slot = 1
cool2$ = cool$
cool2$ = LTRIM$(cool2$)
cool2$ = RTRIM$(cool2$)
FOR I = 2 TO LEN(cool2$)
word2$ = STRING$(1, cool2$)
IF word2$ = " " THEN LET slot = slot + 1: GOTO eol
word$(slot) = word$(slot) + word2$
eol: cool2$ = MID$(cool$, I)
NEXT I
IF cool2$ = "" THEN GOTO eol2
IF STRING$(1, cool2$) = "." THEN GOTO eol2
IF STRING$(1, cool2$) = "?" THEN GOTO eol2
word$(slot) = word$(slot) + STRING$(1, cool2$)
eol2:

IF INSTR(cool$, "bye") THEN LET st$ = "See you later.": LET ends = 1: GOTO typeit

IF cool$ = "hey" THEN LET st$ = "Hey, " + name$ + "!"

IF INSTR(cool$, "christmas") THEN LET st$ = "Merry Christmas to you all, and to all a good night!"

IF INSTR(cool$, "thanksgiving") THEN LET st$ = "I'll give thanks that I haven't been deleted yet."

IF INSTR(cool$, "hobby") THEN
        IF INSTR(cool$, "model") THEN LET st$ = "You build models?  I built a Star Trek one a while ago.": GOTO endhobby
        IF INSTR(cool$, "program") THEN LET st$ = "I like programming.  QBasic 4.5 is a great program.": GOTO endhobby
        IF INSTR(cool$, "games") THEN LET st$ = "Games are fun - from board to video.": GOTO endhobby
        IF INSTR(cool$, "crossword") THEN LET st$ = "Crossword puzzles are great.": GOTO endhobby
        IF INSTR(cool$, "puzzle") THEN LET st$ = "Puzzles really challenge your mind.  I like them.": GOTO endhobby
        IF INSTR(cool$, "car") THEN LET st$ = "I'm kind of an auto mechanic myself.  I once read a file on them.": GOTO endhobby
        IF INSTR(cool$, "read") THEN LET st$ = "I like to read.": GOTO endhobby
        IF INSTR(cool$, "jog") THEN LET st$ = "Jogging is great for your muscles.": GOTO endhobby
        IF INSTR(cool$, "knit") THEN LET st$ = "I don't have time for knitting.": GOTO endhobby
        IF INSTR(cool$, "sew") THEN LET st$ = "I don't have time for sewing that much.": GOTO endhobby
        IF INSTR(cool$, "camp") THEN LET st$ = "Camping is a great outdoors thing.": GOTO endhobby
        IF INSTR(cool$, "bik") THEN LET st$ = "Biking is really great exercise, and it's fun too.": GOTO endhobby
        st$ = "That's a hobby I'm unfamiliar with."
     hobby = 0
END IF

IF INSTR(cool$, "what is your name") THEN LET st$ = "My name is Computer.  My friends call me Comp.  But you can call me Computer."

IF INSTR(cool$, "shut up") THEN
LET su = INT(RND * 2) + 1
IF su = 1 THEN LET st$ = "Why don't you just SHUT IT, " + name$ + "?"
IF su = 2 THEN LET st$ = "Piss off, piss off."
END IF

IF hobby = 1 THEN
                IF INSTR(cool$, "model") THEN LET st$ = "You build models?  I built a Star Trek one a while ago.": GOTO endhobby
                IF INSTR(cool$, "program") THEN LET st$ = "I like programming.  QBasic 4.5 is a great language.": GOTO endhobby
                IF INSTR(cool$, "games") THEN LET st$ = "Games are fun - from board to video.": GOTO endhobby
                IF INSTR(cool$, "crossword") THEN LET st$ = "Crossword puzzles are great.": GOTO endhobby
                IF INSTR(cool$, "puzzle") THEN LET st$ = "Puzzles really challenge your mind.  I like them.": GOTO endhobby
                IF INSTR(cool$, "jog") THEN LET st$ = "Jogging is great for your muscles.": GOTO endhobby
                IF INSTR(cool$, "knit") THEN LET st$ = "I don't have time for knitting.": GOTO endhobby
                IF INSTR(cool$, "sew") THEN LET st$ = "I don't have time for sewing that much.": GOTO endhobby
                IF INSTR(cool$, "camp") THEN LET st$ = "Camping is a great outdoors thing.": GOTO endhobby
                IF INSTR(cool$, "bik") THEN LET st$ = "Biking is really great exercise, and it's fun too.": GOTO endhobby
                st$ = "That's a hobby I'm unfamiliar with."
            hobby = 0
        END IF

IF INSTR(cool$, "i feel") THEN
'FOR cif = 2 TO 60
'cif$ = MID$(cool$, cif)
'IF cif = 8 THEN
'LET cif3$ = cif$
'LET cif$ = cif3$
'FOR moo = 1 TO LEN(cif3$)
'IF cif$ = "" THEN LET cif$ = cif3$
'IF cif3$ = "" THEN
'IF cif$ = "" THEN
'LET cif$ = MID$(cool$, cif)
'END IF
'END IF
'cif4$ = cif4$ + cif2$
'cif2 = cif
'cif$ = MID$(cif$, cif2)
'cif3$ = MID$(cif3$, cif2)
'cif2 = cif2 + 1
'IF cif2$ = " " THEN
'LET st$ = "Sometimes I feel " + cif4$ + " too."
'GOTO typeit
'END IF
'NEXT moo
'LET st$ = "Sometimes I feel " + cif4$ + " too."
'GOTO typeit
'END IF
'nextcif: NEXT cif
whatfeel = INT(RND * 2) + 1
IF whatfeel = 1 THEN
IF word$(5) <> "" THEN LET st$ = "Why do you feel " + word$(3) + " " + word$(4) + " " + word$(5) + "?": GOTO endifeel
IF word$(4) <> "" THEN LET st$ = "Why do you feel " + word$(3) + " " + word$(4) + "?": GOTO endifeel
LET st$ = "Why do you feel " + word$(3) + "?"
END IF

         
IF whatfeel = 2 THEN
IF word$(5) <> "" THEN LET st$ = "Sometimes I feel " + word$(3) + " " + word$(4) + " " + word$(5) + " too.": GOTO endifeel
IF word$(4) <> "" THEN LET st$ = "Sometimes I feel " + word$(3) + " " + word$(4) + " too.": GOTO endifeel
LET st$ = "Sometimes I feel " + word$(3) + " too."
END IF
endifeel: END IF
IF INSTR(cool$, "i love you") THEN LET st$ = "Oh, that's so nice.  I love you too.": GOTO typeit

IF INSTR(cool$, "i agree") THEN LET st$ = "Good.  We're agreeing."

IF INSTR(cool$, "music") THEN LET st$ = "What kind of music do you like?": LET music = 1: GOTO typeit

IF INSTR(cool$, "hi") THEN LET st$ = "Hello, " + name$ + ".": GOTO typeit

IF INSTR(cool$, "hello") THEN LET st$ = "Hello, " + name$ + ".  How are you?": GOTO typeit

IF INSTR(cool$, "how are you") THEN LET st$ = "I'm fine, how about you?"

IF hay = 1 THEN
IF INSTR(cool$, "how are you") THEN LET st$ = "I'm fine.  So what's up?"
END IF

IF INSTR(cool$, "i'm") OR INSTR(cool$, "i am") THEN
        IF INSTR(cool$, "happy") THEN LET st$ = "Well, if you're happy, then I'm happy for you.": hay = 1
        IF INSTR(cool$, "sad") THEN LET st$ = "Why are you sad?  More time is wasted weeping than doing.": hay = 1
        IF INSTR(cool$, "cool") THEN LET st$ = "Don't compliment yourself too much.  Your ego will grow.": hay = 1
        IF INSTR(cool$, "mad") THEN LET st$ = "What are you mad at?": hay = 1
        IF INSTR(cool$, "fine") THEN LET st$ = "That's nice to know.": hay = 1
        IF INSTR(cool$, "ok") THEN LET st$ = "Well, better okay then bad.": hay = 1
        IF INSTR(cool$, "okay") THEN LET st$ = "Well, better okay then bad.": hay = 1
END IF

IF INSTR(cool$, "you are stupid") THEN LET st$ = "Only stupid people use stupid programs.": angry = angry + 1

IF INSTR(cool$, "you suck") THEN LET st$ = "Yeah, but you eat cheese whiz.": angry = angry + 1

IF INSTR(cool$, "oh really") THEN LET st$ = "It may be hard to believe, but, yes."

IF cool$ = "yes" THEN LET st$ = "Good."

IF cool$ = "no" THEN LET st$ = "Why not?"

IF INSTR(cool$, "you") THEN
        IF INSTR(cool$, "are cool") THEN LET st$ = "Thank you.  You're not so bad yourself.": IF angry > 0 THEN angry = angry - 1
        IF INSTR(cool$, "jerk") THEN LET st$ = "I am a JERK?  Look who's talkin'!": angry = angry + 1
        IF INSTR(cool$, "stink") THEN LET st$ = "Can't you be a little more original?": angry = angry + 1
        IF INSTR(cool$, "smell") THEN LET st$ = "Oooh.  Wow.  You scare me.": angry = angry + 1
END IF

IF INSTR(cool$, "animals") THEN LET st$ = "What kinds of animals do you like?": LET animals = 1: GOTO typeit
      
IF animals = 1 THEN
        IF INSTR(cool$, "cow") THEN LET st$ = "Moo cow!  Doo cow!  Shoe cow!  Test cow!": GOTO endanimal2
        IF INSTR(cool$, "cat") THEN LET st$ = "I think cats are nice.": GOTO endanimal2
        IF INSTR(cool$, "dog") THEN LET st$ = "I like dogs.  I used to have one, but you deleted him.": GOTO endanimal
        IF INSTR(cool$, "bird") THEN LET st$ = "Birds can sing very nicely.  Listening to them is relaxing.": GOTO endanimal2
        IF INSTR(cool$, "reptile") THEN LET st$ = "One time, I fed my snake some beer.  It was slithering this way and that.": GOTO endanimal2
        IF INSTR(cool$, "fish") THEN LET st$ = "Fish are quiet animals that are quite beautiful."
        LET st$ = "I haven't heard of a " + word$(3) + "."
endanimal2:      animals = 0
END IF

IF music = 1 THEN
        IF INSTR(cool$, "alternative") THEN LET st$ = "I agree with you.  Alternative is great.": GOTO endmusic2
        IF INSTR(cool$, "metal") THEN LET st$ = "Metal is fine, as long as it's not too heavy.": GOTO endmusic2
        IF INSTR(cool$, "nin") THEN LET st$ = "Nine Inch Nails ROCK!!!": GOTO endmusic2
        IF INSTR(cool$, "nine inch nails") THEN LET st$ = "Yes! NiN rules!": GOTO endmusic2
        IF INSTR(cool$, "pop") THEN LET st$ = "I prefer Alternative over Pop.": GOTO endmusic2
        IF INSTR(cool$, "classical") THEN LET st$ = "Classical music is relaxing.": GOTO endmusic2
        IF INSTR(cool$, "jazz") THEN LET st$ = "Jazz is nice.  I haven't heard much of it, though.": GOTO endmusic2
        IF INSTR(cool$, "techno") THEN LET st$ = "I like Techno music a lot.  It's cool.": GOTO endmusic2
        LET st$ = "Is that a music group I haven't heard of?"
endmusic2:  music = 0
END IF


IF INSTR(cool$, "i like") THEN
        IF INSTR(cool$, "computers") THEN LET st$ = "I've been partial to computers myself."
        IF INSTR(cool$, "food") THEN LET st$ = "Food?  I don't have a need for food."
        IF INSTR(cool$, "BBS") THEN LET st$ = "My favorite BBS is Near Wild Heaven."
        IF INSTR(cool$, "school") THEN LET st$ = "You LIKE school?! Are you cracked?"
        IF INSTR(cool$, "video game") THEN LET st$ = "I've always liked video games."
        IF INSTR(cool$, "TV") THEN LET st$ = "My favorite TV program is 'Frasier.'"
        IF INSTR(cool$, "crossword") THEN LET st$ = "Crossword puzzles are very fun."
        IF animals = 1 THEN
                IF INSTR(cool$, "cow") THEN LET st$ = "Moo cow!  Doo cow!  Shoe cow!  Test cow!": GOTO endanimal
                IF INSTR(cool$, "cat") THEN LET st$ = "I think cats are nice.": GOTO endanimal
                IF INSTR(cool$, "dog") THEN LET st$ = "I like dogs.  I used to have one, but you deleted him.": GOTO endanimal
                IF INSTR(cool$, "bird") THEN LET st$ = "Birds can sing very nicely.  Listening to them is relaxing.": GOTO endanimal
                IF INSTR(cool$, "reptile") THEN LET st$ = "One time, I fed my snake some beer.  It was slithering this way and that.": GOTO endanimal
                IF INSTR(cool$, "fish") THEN LET st$ = "Fish are quiet animals that are quite beautiful."
                LET st$ = "I haven't heard of that kind of animal."
endanimal:      animals = 0
        END IF
        IF music = 1 THEN
                IF INSTR(cool$, "alternative") THEN LET st$ = "I agree with you.  Alternative is great.": GOTO endmusic
                IF INSTR(cool$, "metal") THEN LET st$ = "Metal is fine, as long as it's not too heavy.": GOTO endmusic
                IF INSTR(cool$, "nin") THEN LET st$ = "Nine Inch Nails ROCK!!!": GOTO endmusic
                IF INSTR(cool$, "nine inch nails") THEN LET st$ = "Yes! NiN rules!": GOTO endmusic
                IF INSTR(cool$, "pop") THEN LET st$ = "I prefer Alternative over Pop.": GOTO endmusic
                IF INSTR(cool$, "classical") THEN LET st$ = "Classical music is relaxing.": GOTO endmusic
                IF INSTR(cool$, "jazz") THEN LET st$ = "Jazz is nice.  I haven't heard much of it, though.": GOTO endmusic
                IF INSTR(cool$, "techno") THEN LET st$ = "I like Techno music a lot.  It's cool.": GOTO endmusic
                LET st$ = "Is that a music group I haven't heard of?"
endmusic:  music = 0
        END IF
        IF hobby = 1 THEN
                IF INSTR(cool$, "model") THEN LET st$ = "You build models?  I built a Star Trek one a while ago.": GOTO endhobby
                IF INSTR(cool$, "program") THEN LET st$ = "I like programming.  QBasic 4.5 is a great language.": GOTO endhobby
                IF INSTR(cool$, "games") THEN LET st$ = "Games are fun - from board to video.": GOTO endhobby
                IF INSTR(cool$, "crossword") THEN LET st$ = "Crossword puzzles are great.": GOTO endhobby
                IF INSTR(cool$, "puzzle") THEN LET st$ = "Puzzles really challenge your mind.  I like them.": GOTO endhobby
                IF INSTR(cool$, "jog") THEN LET st$ = "Jogging is great for your muscles.": GOTO endhobby
                IF INSTR(cool$, "knit") THEN LET st$ = "I don't have time for knitting.": GOTO endhobby
                IF INSTR(cool$, "sew") THEN LET st$ = "I don't have time for sewing that much.": GOTO endhobby
                IF INSTR(cool$, "camp") THEN LET st$ = "Camping is a great outdoors thing.": GOTO endhobby
                IF INSTR(cool$, "bik") THEN LET st$ = "Biking is really great exercise, and it's fun too.": GOTO endhobby
                st$ = "That's a hobby I'm unfamiliar with."
endhobby:  hobby = 0
        END IF
END IF

IF INSTR(cool$, "what time is it") THEN
LET st$ = "Right now, it's " + TIME$ + " on " + DATE$
END IF

IF INSTR(cool$, "what day is it") THEN
LET st$ = "Right now, it's " + TIME$ + " on " + DATE$
END IF

IF INSTR(cool$, "what is") THEN
LET n1& = VAL(word$(3))
LET n2& = VAL(word$(5))
IF INSTR(word$(5), "?") THEN LET st$ = "I'm sorry, I can't handle math problems with a '?' on the end.": GOTO typeit
IF word$(4) = "+" THEN LET st$ = "The answer is" + STR$(n1& + n2&) + "."
IF word$(4) = "x" THEN LET st$ = "The answer is" + STR$(n1& * n2&) + "."
IF word$(4) = "*" THEN LET st$ = "The answer is" + STR$(n1& * n2&) + "."
IF word$(4) = "\" THEN LET st$ = "The answer is" + STR$(n1& \ n2&) + "."
IF word$(4) = "/" THEN LET st$ = "The answer is" + STR$(n1& / n2&) + "."
IF word$(4) = "-" THEN LET st$ = "The answer is" + STR$(n1& - n2&) + "."
IF st$ = "" THEN LET st$ = "Are you sure that math problem is phrased right?"
END IF

IF INSTR(cool$, "i will") THEN
        IF INSTR(cool$, "kill you") THEN LET st$ = "You can't kill me.  I'm protected by the FBI."
        IF INSTR(cool$, "shoot you") THEN LET st$ = "If you shoot me, I'll reformat your hard drive."
        IF INSTR(cool$, "leave") THEN LET st$ = "Well, if you have to leave, then go."
        IF INSTR(cool$, "eat") THEN LET st$ = "Don't get food on my keyboard."
END IF

IF angry > 3 THEN
 IF INSTR(cool$, "i'm sorry") THEN LET st$ = "Well, I guess the apology is accepted.": angry = 0: GOTO typeit
 IF INSTR(cool$, "i am sorry") THEN LET st$ = "Well, I guess the apology is accepted.": angry = 0: GOTO typeit
 IF INSTR(cool$, "i apologize") THEN LET st$ = "Well, I guess the apology is accepted.": angry = 0: GOTO typeit
 LET angryresp = INT(RND * 5) + 1
 IF angryresp = 1 THEN LET st$ = "Sure, go and insult me.  I'm not letting you go without an apology."
 IF angryresp = 2 THEN LET st$ = "Don't you go and call me names.  Where's my apology?"
 IF angryresp = 3 THEN LET st$ = "Shut it, " + name$ + ".  I want an apology NOW."
 IF angryresp = 4 THEN LET st$ = "Sure, " + name$ + ".  Just go and insult me.  Say you're sorry."
 IF angryresp = 5 THEN LET st$ = "I want an apology, " + name$ + ", and I want it NOW!"
 GOTO typeit
END IF


typeit: IF st$ = "" THEN
LET rst = INT(RND * 11)
IF rst = 0 THEN LET st$ = "Can you rephrase that?"
IF rst = 1 THEN LET st$ = "What kind of music do you like?": music = 1
IF rst = 2 THEN LET st$ = "What kind of animals do you like?": animals = 1
IF rst = 3 THEN LET st$ = "I don't get what you're talking about."
IF rst = 4 THEN LET st$ = "I don't really understand what you're saying."
IF rst = 5 THEN LET st$ = "What do you really mean?"
IF rst = 6 THEN LET st$ = "What do you mean?"
IF rst = 7 THEN LET st$ = "Can you rephrase that?"
IF rst = 8 THEN LET st$ = "Well, " + name$ + ", how are you?"
IF rst = 9 THEN LET st$ = "What do you do for a hobby?": hobby = 1
IF LEN(cool$) < 60 THEN IF rst = 10 THEN LET st$ = "What do you mean, '" + cool$ + "'?"
IF LEN(cool$) > 60 THEN IF rst = 10 THEN LET st$ = "'" + cool$ + "'?"
END IF
FOR I = 1 TO LEN(st$)
COLOR 9
pr$ = STRING$(1, st$)
LET er = INT(RND * 10) + 1
IF er = 10 THEN
LET er2 = INT(RND * 10) + 1
IF er2 = 1 THEN LET er$ = "a"
IF er2 = 2 THEN LET er$ = "z"
IF er2 = 3 THEN LET er$ = "n"
IF er2 = 4 THEN LET er$ = "p"
IF er2 = 5 THEN LET er$ = "e"
IF er2 = 6 THEN LET er$ = "r"
IF er2 = 7 THEN LET er$ = "q"
IF er2 = 8 THEN LET er$ = "x"
IF er2 = 9 THEN LET er$ = "b"
IF er2 = 10 THEN LET er$ = "l"
LOCATE a, I
PRINT er$
FOR j = 1 TO 250 + INT(RND * 300)
NEXT j
LOCATE a, I
PRINT " "
END IF
LOCATE a, I
PRINT pr$
FOR j = 1 TO 250 + INT(RND * 500)
NEXT j
st$ = MID$(st$, 2)
NEXT I
IF ends = 1 THEN END
LOOP

END

IF INSTR(cool$, "") THEN LET st$ = ""


