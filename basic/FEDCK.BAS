CLS
INPUT "Save Option (Y/N):", so$
sox$ = LCASE$(so$)
IF sox$ = "y" THEN GOTO Filez ELSE GOTO Nofilez

Filez:
CLS
INPUT "Enter filename:", filename$
IF LEN(filename$) > 8 THEN PRINT "Illegal name": GOTO Filez

File$ = filename$ + ".CUR"

INPUT "Do you wish to add to the file or start over (A/S):", op$
opx$ = LCASE$(op$)
IF opx$ = "a" THEN GOTO OpenAsAppend ELSE GOTO StartOver:

OpenAsAppend:
OPEN File$ FOR APPEND AS #1
GOTO Nofilez

StartOver:
OPEN File$ FOR OUTPUT AS #1

PRINT #1, "Curses!(TM) 1.1 Curse file by Vivin Suresh Paliath"
PRINT #1, "--------------------------------------------------"

Nofilez:
COLOR 3, 1
CLS
FOR i = 8 TO 16
FOR j = 19 TO 61
COLOR 1, 3
LOCATE i, j
PRINT " "
NEXT j
NEXT i

FOR i = 21 TO 62
LOCATE 17, i
COLOR 0, 0
PRINT " "
NEXT i

FOR j = 9 TO 16
LOCATE j, 62
COLOR 0, 0
PRINT " "
NEXT j

FOR k = 9 TO 17
LOCATE k, 63
COLOR 0, 0
PRINT " "
NEXT k

COLOR 1, 3
LOCATE 9, 28
PRINT "Superb Curses! Version 1.1"
LOCATE 11, 24
PRINT "Developed By Vivin Suresh Paliath"
LOCATE 13, 20
PRINT "Copyright (C) Vivin Corporations 1997 -->"
LOCATE 15, 31
PRINT "All rights Reserved"
DO WHILE INKEY$ = ""
LOOP

CLS

COLOR 7, 0, 0

CLS

adj1$ = "bloated"
adj2$ = "brainless"
adj3$ = "shrivelled"
adj4$ = "paralysed"
adj5$ = "blood-thirsty"
adj6$ = "blind"
adj7$ = "pot-bellied"
adj8$ = "lacerated"
adj9$ = "destructively distillated"
adj10$ = "mouldy"
adj11$ = "dessicated"
adj12$ = "dehydrated"
adj13$ = "starving"
adj14$ = "malnourished"
adj15$ = "psychotic"
adj16$ = "psychologically challenged"
adj17$ = "victimized"
adj18$ = "convicted"
adj19$ = "gigantic"
adj20$ = "murderous"
adj21$ = "rotten"
adj22$ = "black-listed"
adj23$ = "burnt"
adj24$ = "headless"
adj25$ = "bald"
adj26$ = "frightening"
adj27$ = "ghostly"
adj28$ = "stupid"
adj29$ = "wanted"
adj30$ = "violent"
adj31$ = "ghastly"
adj32$ = "horrifying"
adj33$ = "one-eyed"
adj34$ = "drunk"
adj35$ = "schizophrenic"
adj36$ = "demented"
adj37$ = "maniacal"
adj38$ = "worthless"
adj39$ = "no good"
adj40$ = "hunch-backed"
adj41$ = "nauseated"
adj42$ = "dizzy"
adj43$ = "crazy"
adj44$ = "roasted"
adj45$ = "cynical"
adj46$ = "pessimistic"
adj47$ = "boring"
adj48$ = "claustrophobic"
adj49$ = "tiny"
adj50$ = "screeching"
adj51$ = "roaring"
adj52$ = "squeaking"
adj53$ = "sticky"
adj54$ = "de-brained"
adj55$ = "dipsomaniacal"
adj56$ = "tagged"
adj57$ = "holographic"
adj58$ = "gross"
adj59$ = "banded"
adj60$ = "banished"
adj61$ = "scrawny"
adj62$ = "hypnotised"
adj63$ = "weak"
adj64$ = "fatigued"
adj65$ = "tired"
adj66$ = "blonde"
adj67$ = "scalped"
adj68$ = "savage"
adj69$ = "brainwashed"
adj70$ = "mentally insane"
adj71$ = "deranged"
adj72$ = "fidgety"
adj73$ = "regretful"
adj74$ = "finnicky"
adj75$ = "fevrish"
adj76$ = "frivilous"
adj77$ = "hospitalised"
adj78$ = "suspicious"
adj79$ = "tied up"
adj80$ = "blank"
adj81$ = "xenophobic"
adj82$ = "screaming"
adj83$ = "howling"
adj84$ = "blushing"
adj85$ = "broken"
adj86$ = "homeless"
adj87$ = "jobless"
adj88$ = "hateful"
adj89$ = "disabled"
adj90$ = "handicapped"
adj91$ = "baleful"
adj92$ = "medium rare"
adj93$ = "clumsy"
adj94$ = "sunburned"
adj95$ = "flexible"
adj96$ = "disproportionate"
adj97$ = "wacky"
adj98$ = "burnished"
adj99$ = "disabled"
adj100$ = "vengeful"

noun1$ = "pigeon"
noun2$ = "tomato"
noun3$ = "dinosaur"
noun4$ = "policeman"
noun5$ = "receptionist"
noun6$ = "worm"
noun7$ = "washerwoman"
noun8$ = "monkey"
noun9$ = "platypus"
noun10$ = "computer programmer"
noun11$ = "bear"
noun12$ = "nurse"
noun13$ = "doctor"
noun14$ = "surgeon"
noun15$ = "beetle"
noun16$ = "elephant"
noun17$ = "mechanic"
noun18$ = "toad"
noun19$ = "octopus"
noun20$ = "snail"
noun21$ = "flea"
noun22$ = "scientist"
ng5n23$ =hÌˆ6´ „œR$ð+4hH?%
òK¥¢à¬ü(!Ã|>àB‚‚áäÓ@©õ
NSLƒQ[0×TVO£605¸²     Í´f[}¾°ß§7°GÓ€/ÿßFFÿ†€°L¹’±>¼àý ‡<k­ƒ
noun35$ = "pirate"
noun36$ = "cook"
noun37$ = "test pilot"
noun38$ = "banshee"
noun39$ = "criminal"
noun40$ = "demon"
noun41$ = "camel"
noun42$ = "boar"
noun43$ = "grub"
noun44$ = "caterpillar"
noun45$ = "butterfly"
noun46$ = "scuba diver"
noun47$ = "mercenary"
noun48$ = "shark"
noun49$ = "lobster"
noun50$ = "scorpion"
noun51$ = "turtle"
noun52$ = "bee"
noun53$ = "fly"
noun54$ = "tortoise"
noun55$ = "crocodile"
noun56$ = "alligator"
noun57$ = "shrew"
noun58$ = "dentist"
noun59$ = "moose"
noun60$ = "ornithologist"
noun61$ = "hypnotist"
noun62$ = "witch"
noun63$ = "astrophysicist"
noun64$ = "wizard"
noun65$ = "philanthropist"
noun66$ = "paleontologist"
noun67$ = "chemist"
noun68$ = "barber"
noun69$ = "hairdresser"
noun70$ = "biologist"
noun71$ = "executioner"
noun72$ = "clerk"
noun73$ = "secretary"
noun74$ = "raccoon"
noun75$ = "beaver"
noun76$ = "soldier"
noun77$ = "taxi driver"
noun78$ = "rat"
noun79$ = "hippopotamus"
noun80$ = "giraffe"
noun81$ = "badger"
noun82$ = "squirrel"
noun83$ = "chipmunk"
noun84$ = "potato"
noun85$ = "brinjal"
noun86$ = "pumpkin"
noun87$ = "little Hitler"
noun88$ = "jelly-fish"
noun89$ = "sea-urchin"
noun90$ = "eel"
noun91$ = "tarantula"
noun92$ = "centipede"
noun93$ = "millipede"
noun94$ = "iguana"
noun95$ = "tick"
noun96$ = "army ant"
noun97$ = "taxi driver"
noun98$ = "martian"
noun99$ = "group of green men"
noun100$ = "group of tax collectors"

verb1$ = "gnaw on"
verb2$ = "run over"
verb3$ = "gobble up"
verb4$ = "incapacitate"
verb5$ = "wring"
verb6$ = "terrorize"
verb7$ = "tear up"
verb8$ = "brainwash"
verb9$ = "dance on"
verb10$ = "slice up"
verb11$ = "ostracise"
verb12$ = "victimize"
verb13$ = "burn"
verb14$ = "assasinate"
verb15$ = "operate on"
verb16$ = "beat up"
verb17$ = "murder"
verb18$ = "repossess"
verb19$ = "torture"
verb20$ = "bludgeon"
verb21$ = "incinerate"
verb22$ = "dynamite"
verb23$ = "electrocute"
verb24$ = "feast on"
verb25$ = "hide in"
verb26$ = "crush"
verb27$ = "bury"
verb28$ = "chew on"
verb29$ = "assault"
verb30$ = "harass"
verb31$ = "decapitate"
verb32$ = "do the moonwalk on"
verb33$ = "squeeze"
verb34$ = "stretch"
verb35$ = "boil"
verb36$ = "spit on"
verb37$ = "freeze"
verb38$ = "infiltrate"
verb39$ = "bite"
verb40$ = "throw up on"
verb41$ = "aggravate"
verb42$ = "squash"
verb43$ = "inflate"
verb44$ = "defy"
verb45$ = "destroy"
verb46$ = "vaporize"
verb47$ = "pull out"
verb48$ = "deflate"
verb49$ = "irritate"
verb50$ = "roast"
verb51$ = "bore into"
verb52$ = "eat into"
verb53$ = "drill into"
verb54$ = "shrink"
verb55$ = "enlarge"
verb56$ = "twist"
verb57$ = "poke"
verb58$ = "pierce"
verb59$ = "split"
verb60$ = "stamp on"
verb61$ = "take a bite out of"
verb62$ = "hypnotize"
verb63$ = "pour acid on"
verb64$ = "dunk"
verb65$ = "play football with"
verb66$ = "box"
verb67$ = "kick"
verb68$ = "punch"
verb69$ = "rip off"
verb70$ = "twirl"
verb71$ = "condemn"
verb72$ = "convict"
verb73$ = "gouge out"
verb74$ = "erode"
verb75$ = "do harm to"
verb76$ = "fall in love with"
verb77$ = "frustrate"
verb78$ = "imprison"
verb79$ = "hide"
verb80$ = "ignite"
verb81$ = "emulsify"
verb82$ = "blend"
verb83$ = "digest"
verb84$ = "decompose"
verb85$ = "biodegrade"
verb86$ = "stick a spear into"
verb87$ = "flood"
verb88$ = "sink"
verb89$ = "make a hole in"
verb90$ = "mince"
verb91$ = "bake"
verb92$ = "jump on"
verb93$ = "claw at"
verb94$ = "dissect"
verb95$ = "stuff cyanide into"
verb96$ = "saw into"
verb97$ = "inject mouthwash into"
verb98$ = "trap"
verb99$ = "fish out"
verb100$ = "disconnect"

thing1$ = "house"
thing2$ = "computer"
thing3$ = "head"
thing4$ = "desk"
thing5$ = "mouth-organ"
thing6$ = "dustbin"
thing7$ = "air-plane"
thing8$ = "car"
thing9$ = "garage"
thing10$ = "cupboard"
thing11$ = "hard-disk"
thing12$ = "printer"
thing13$ = "jeans"
thing14$ = "T-shirt"
thing15$ = "bermudas"
thing16$ = "mouse"
thing17$ = "cat"
thing18$ = "lizard"
thing19$ = "rocketship"
thing20$ = "mouth"
thing21$ = "stomach"
thing22$ = "hands"
thing23$ = "legs"
thing24$ = "liver"
thing25$ = "teacher"
thing26$ = "friend"
thing27$ = "eyes"
thing28$ = "hair"
thing29$ = "brain"
thing30$ = "heart"
thing31$ = "spleen"
thing32$ = "arteries"
thing33$ = "veins"
thing34$ = "spinal cord"
thing35$ = "skin"
thing36$ = "keyboard"
thing37$ = "screen"
thing38$ = "watch"
thing39$ = "couch"
thing40$ = "bed"
thing41$ = "nose"
thing42$ = "ears"
thing43$ = "ear"
thing44$ = "school"
thing45$ = "bones"
thing46$ = "food"
thing47$ = "scalp"
thing48$ = "skin"
thing49$ = "toe-nails"
thing50$ = "finger-nails"
thing51$ = "tongue"
thing52$ = "teeth"
thing53$ = "lips"
thing54$ = "gums"
thing55$ = "ribcage"
thing56$ = "fingers"
thing57$ = "feet"
thing58$ = "lawnmower"
thing59$ = "sprinkler"
thing60$ = "tennis racket"
thing61$ = "VCR"
thing62$ = "television"
thing63$ = "music system"
thing64$ = "CD player"
thing65$ = "tape recorder"
thing66$ = "washing machine"
thing67$ = "dish washer"
thing68$ = "cooking range"
thing69$ = "boss"
thing70$ = "colleagues"
thing71$ = "lampshade"
thing72$ = "table"
thing73$ = "garden"
thing74$ = "roses"
thing75$ = "petunias"
thing76$ = "parrot"
thing77$ = "parakeet"
thing78$ = "basket ball"
thing79$ = "cricket bat"
thing80$ = "favourite actor"
thing81$ = "favourite actress"
thing82$ = "favourite musician"
thing83$ = "favourite sportsman"
thing84$ = "favourite sportswoman"
thing85$ = "favourite person"
thing86$ = "red blood cells"
thing87$ = "white blood cells"
thing88$ = "lungs"
thing89$ = "vocal chords"
thing90$ = "skull"
thing91$ = "pelvis"
thing92$ = "fibula"
thing93$ = "tibia"
thing94$ = "eye balls"
thing95$ = "ear drums"
thing96$ = "epidermis"
thing97$ = "dermis"
thing98$ = "golf clubs"
thing99$ = "shoes"
thing100$ = "intestines"

RANDOMIZE TIMER
1 adjno = INT(RND * 100) + 1
nounno = INT(RND * 100) + 1
verbno = INT(RND * 100) + 1
thingno = INT(RND * 100) + 1

IF adjno = 1 THEN adj$ = adj1$
IF adjno = 2 THEN adj$ = adj2$
IF adjno = 3 THEN adj$ = adj3$
IF adjno = 4 THEN adj$ = adj4$
IF adjno = 5 THEN adj$ = adj5$
IF adjno = 6 THEN adj$ = adj6$
IF adjno = 7 THEN adj$ = adj7$
IF adjno = 8 THEN adj$ = adj8$
IF adjno = 9 THEN adj$ = adj9$
IF adjno = 10 THEN adj$ = adj10$
IF adjno = 11 THEN adj$ = adj11$
IF adjno = 12 THEN adj$ = adj12$
IF adjno = 13 THEN adj$ = adj13$
IF adjno = 14 THEN adj$ = adj14$
IF adjno = 15 THEN adj$ = adj15$
IF adjno = 16 THEN adj$ = adj16$
IF adjno = 17 THEN adj$ = adj17$
IF adjno = 18 THEN adj$ = adj18$
IF adjno = 19 THEN adj$ = adj19$
IF adjno = 20 THEN adj$ = adj20$
IF adjno = 21 THEN adj$ = adj21$
IF adjno = 22 THEN adj$ = adj22$
IF adjno = 23 THEN adj$ = adj23$
IF adjno = 24 THEN adj$ = adj24$
IF adjno = 25 THEN adj$ = adj25$
IF adjno = 26 THEN adj$ = adj26$
IF adjno = 27 THEN adj$ = adj27$
IF adjno = 28 THEN adj$ = adj28$
IF adjno = 29 THEN adj$ = adj29$
IF adjno = 30 THEN adj$ = adj30$
IF adjno = 31 THEN adj$ = adj31$
IF adjno = 32 THEN adj$ = adj32$
IF adjno = 33 THEN adj$ = adj33$
IF adjno = 34 THEN adj$ = adj34$
IF adjno = 35 THEN adj$ = adj35$
IF adjno = 36 THEN adj$ = adj36$
IF adjno = 37 THEN adj$ = adj37$
IF adjno = 38 THEN adj$ = adj38$
IF adjno = 39 THEN adj$ = adj39$
IF adjno = 40 THEN adj$ = adj40$
IF adjno = 41 THEN adj$ = adj41$
IF adjno = 42 THEN adj$ = adj42$
IF adjno = 43 THEN adj$ = adj43$
IF adjno = 44 THEN adj$ = adj44$
IF adjno = 45 THEN adj$ = adj45$
IF adjno = 46 THEN adj$ = adj46$
IF adjno = 47 THEN adj$ = adj47$
IF adjno = 48 THEN adj$ = adj48$
IF adjno = 49 THEN adj$ = adj49$
IF adjno = 50 THEN adj$ = adj50$
IF adjno = 51 THEN adj$ = adj51$
IF adjno = 52 THEN adj$ = adj52$
IF adjno = 53 THEN adj$ = adj53$
IF adjno = 54 THEN adj$ = adj54$
IF adjno = 55 THEN adj$ = adj55$
IF adjno = 56 THEN adj$ = adj56$
IF adjno = 57 THEN adj$ = adj57$
IF adjno = 58 THEN adj$ = adj58$
IF adjno = 59 THEN adj$ = adj59$
IF adjno = 60 THEN adj$ = adj60$
IF adjno = 61 THEN adj$ = adj61$
IF adjno = 62 THEN adj$ = adj62$
IF adjno = 63 THEN adj$ = adj63$
IF adjno = 64 THEN adj$ = adj64$
IF adjno = 65 THEN adj$ = adj65$
IF adjno = 66 THEN adj$ = adj66$
IF adjno = 67 THEN adj$ = adj67$
IF adjno = 68 THEN adj$ = adj68$
IF adjno = 69 THEN adj$ = adj69$
IF adjno = 70 THEN adj$ = adj70$
IF adjno = 71 THEN adj$ = adj71$
IF adjno = 72 THEN adj$ = adj72$
IF adjno = 73 THEN adj$ = adj73$
IF adjno = 74 THEN adj$ = adj74$
IF adjno = 75 THEN adj$ = adj75$
IF adjno = 76 THEN adj$ = adj76$
IF adjno = 77 THEN adj$ = adj77$
IF adjno = 78 THEN adj$ = adj78$
IF adjno = 79 THEN adj$ = adj79$
IF adjno = 80 THEN adj$ = adj80$
IF adjno = 81 THEN adj$ = adj81$
IF adjno = 82 THEN adj$ = adj82$
IF adjno = 83 THEN adj$ = adj83$
IF adjno = 84 THEN adj$ = adj84$
IF adjno = 85 THEN adj$ = adj85$
IF adjno = 86 THEN adj$ = adj86$
IF adjno = 87 THEN adj$ = adj87$
IF adjno = 88 THEN adj$ = adj88$
IF adjno = 89 THEN adj$ = adj89$
IF adjno = 90 THEN adj$ = adj90$
IF adjno = 91 THEN adj$ = adj91$
IF adjno = 92 THEN adj$ = adj92$
IF adjno = 93 THEN adj$ = adj93$
IF adjno = 94 THEN adj$ = adj94$
IF adjno = 95 THEN adj$ = adj95$
IF adjno = 96 THEN adj$ = adj96$
IF adjno = 97 THEN adj$ = adj97$
IF adjno = 98 THEN adj$ = adj98$
IF adjno = 99 THEN adj$ = adj99$
IF adjno = 100 THEN adj$ = adj100$

IF nounno = 1 THEN noun$ = noun1$
IF nounno = 2 THEN noun$ = noun2$
IF nounno = 3 THEN noun$ = noun3$
IF nounno = 4 THEN noun$ = noun4$
IF nounno = 5 THEN noun$ = noun5$
IF nounno = 6 THEN noun$ = noun6$
IF nounno = 7 THEN noun$ = noun7$
IF nounno = 8 THEN noun$ = noun8$
IF nounno = 9 THEN noun$ = noun9$
IF nounno = 10 THEN noun$ = noun10$
IF nounno = 11 THEN noun$ = noun11$
IF nounno = 12 THEN noun$ = noun12$
IF nounno = 13 THEN noun$ = noun13$
IF nounno = 14 THEN noun$ = noun14$
IF nounno = 15 THEN noun$ = noun15$
IF nounno = 16 THEN noun$ = noun16$
IF nounno = 17 THEN noun$ = noun17$
IF nounno = 18 THEN noun$ = noun18$
IF nounno = 19 THEN noun$ = noun19$
IF nounno = 20 THEN noun$ = noun20$
IF nounno = 21 THEN noun$ = noun21$
IF nounno = 22 THEN noun$ = noun22$
IF nounno = 23 THEN noun$ = noun23$
IF nounno = 24 THEN noun$ = noun24$
IF nounno = 25 THEN noun$ = noun25$
IF nounno = 26 THEN noun$ = noun26$
IF nounno = 27 THEN noun$ = noun27$
IF nounno = 28 THEN noun$ = noun28$
IF nounno = 29 THEN noun$ = noun29$
IF nounno = 30 THEN noun$ = noun30$
IF nounno = 31 THEN noun$ = noun31$
IF nounno = 32 THEN noun$ = noun32$
IF nounno = 33 THEN noun$ = noun33$
IF nounno = 34 THEN noun$ = noun34$
IF nounno = 35 THEN noun$ = noun35$
IF nounno = 36 THEN noun$ = noun36$
IF nounno = 37 THEN noun$ = noun37$
IF nounno = 38 THEN noun$ = noun38$
IF nounno = 39 THEN noun$ = noun39$
IF nounno = 40 THEN noun$ = noun40$
IF nounno = 41 THEN noun$ = noun41$
IF nounno = 42 THEN noun$ = noun42$
IF nounno = 43 THEN noun$ = noun43$
IF nounno = 44 THEN noun$ = noun44$
IF nounno = 45 THEN noun$ = noun45$
IF nounno = 46 THEN noun$ = noun46$
IF nounno = 47 THEN noun$ = noun47$
IF nounno = 48 THEN noun$ = noun48$
IF nounno = 49 THEN noun$ = noun49$
IF nounno = 50 THEN noun$ = noun50$
IF nounno = 51 THEN noun$ = noun51$
IF nounno = 52 THEN noun$ = noun52$
IF nounno = 53 THEN noun$ = noun53$
IF nounno = 54 THEN noun$ = noun54$
IF nounno = 55 THEN noun$ = noun55$
IF nounno = 56 THEN noun$ = noun56$
IF nounno = 57 THEN noun$ = noun57$
IF nounno = 58 THEN noun$ = noun58$
IF nounno = 59 THEN noun$ = noun59$
IF nounno = 60 THEN noun$ = noun60$
IF nounno = 61 THEN noun$ = noun61$
IF nounno = 62 THEN noun$ = noun62$
IF nounno = 63 THEN noun$ = noun63$
IF nounno = 64 THEN noun$ = noun64$
IF nounno = 65 THEN noun$ = noun65$
IF nounno = 66 THEN noun$ = noun66$
IF nounno = 67 THEN noun$ = noun67$
IF nounno = 68 THEN noun$ = noun68$
IF nounno = 69 THEN noun$ = noun69$
IF nounno = 70 THEN noun$ = noun70$
IF nounno = 71 THEN noun$ = noun71$
IF nounno = 72 THEN noun$ = noun72$
IF nounno = 73 THEN noun$ = noun73$
IF nounno = 74 THEN noun$ = noun74$
IF nounno = 75 THEN noun$ = noun75$
IF nounno = 76 THEN noun$ = noun76$
IF nounno = 77 THEN noun$ = noun77$
IF nounno = 78 THEN noun$ = noun78$
IF nounno = 79 THEN noun$ = noun79$
IF nounno = 80 THEN noun$ = noun80$
IF nounno = 81 THEN noun$ = noun81$
IF nounno = 82 THEN noun$ = noun82$
IF nounno = 83 THEN noun$ = noun83$
IF nounno = 84 THEN noun$ = noun84$
IF nounno = 85 THEN noun$ = noun85$
IF nounno = 86 THEN noun$ = noun86$
IF nounno = 87 THEN noun$ = noun87$
IF nounno = 88 THEN noun$ = noun88$
IF nounno = 89 THEN noun$ = noun89$
IF nounno = 90 THEN noun$ = noun90$
IF nounno = 91 THEN noun$ = noun91$
IF nounno = 92 THEN noun$ = noun92$
IF nounno = 93 THEN noun$ = noun93$
IF nounno = 94 THEN noun$ = noun94$
IF nounno = 95 THEN noun$ = noun95$
IF nounno = 96 THEN noun$ = noun96$
IF nounno = 97 THEN noun$ = noun97$
IF nounno = 98 THEN noun$ = noun98$
IF nounno = 99 THEN noun$ = noun99$
IF nounno = 100 THEN noun$ = noun100$

IF verbno = 1 THEN verb$ = verb1$
IF verbno = 2 THEN verb$ = verb2$
IF verbno = 3 THEN verb$ = verb3$
IF verbno = 4 THEN verb$ = verb4$
IF verbno = 5 THEN verb$ = verb5$
IF verbno = 6 THEN verb$ = verb6$
IF verbno = 7 THEN verb$ = verb7$
IF verbno = 8 THEN verb$ = verb8$
IF verbno = 9 THEN verb$ = verb9$
IF verbno = 10 THEN verb$ = verb10$
IF verbno = 11 THEN verb$ = verb11$
IF verbno = 12 THEN verb$ = verb12$
IF verbno = 13 THEN verb$ = verb13$
IF verbno = 14 THEN verb$ = verb14$
IF verbno = 15 THEN verb$ = verb15$
IF verbno = 16 THEN verb$ = verb16$
IF verbno = 17 THEN verb$ = verb17$
IF verbno = 18 THEN verb$ = verb18$
IF verbno = 19 THEN verb$ = verb19$
IF verbno = 20 THEN verb$ = verb20$
IF verbno = 21 THEN verb$ = verb21$
IF verbno = 22 THEN verb$ = verb22$
IF verbno = 23 THEN verb$ = verb23$
IF verbno = 24 THEN verb$ = verb24$
IF verbno = 25 THEN verb$ = verb25$
IF verbno = 26 THEN verb$ = verb26$
IF verbno = 27 THEN verb$ = verb27$
IF verbno = 28 THEN verb$ = verb28$
IF verbno = 29 THEN verb$ = verb29$
IF verbno = 30 THEN verb$ = verb30$
IF verbno = 31 THEN verb$ = verb31$
IF verbno = 32 THEN verb$ = verb32$
IF verbno = 33 THEN verb$ = verb33$
IF verbno = 34 THEN verb$ = verb34$
IF verbno = 35 THEN verb$ = verb35$
IF verbno = 36 THEN verb$ = verb36$
IF verbno = 37 THEN verb$ = verb37$
IF verbno = 38 THEN verb$ = verb38$
IF verbno = 39 THEN verb$ = verb39$
IF verbno = 40 THEN verb$ = verb40$
IF verbno = 41 THEN verb$ = verb41$
IF verbno = 42 THEN verb$ = verb42$
IF verbno = 43 THEN verb$ = verb43$
IF verbno = 44 THEN verb$ = verb44$
IF verbno = 45 THEN verb$ = verb45$
IF verbno = 46 THEN verb$ = verb46$
IF verbno = 47 THEN verb$ = verb47$
IF verbno = 48 THEN verb$ = verb48$
IF verbno = 49 THEN verb$ = verb49$
IF verbno = 50 THEN verb$ = verb50$
IF verbno = 51 THEN verb$ = verb51$
IF verbno = 52 THEN verb$ = verb52$
IF verbno = 53 THEN verb$ = verb53$
IF verbno = 54 THEN verb$ = verb54$
IF verbno = 55 THEN verb$ = verb55$
IF verbno = 56 THEN verb$ = verb56$
IF verbno = 57 THEN verb$ = verb57$
IF verbno = 58 THEN verb$ = verb58$
IF verbno = 59 THEN verb$ = verb59$
IF verbno = 60 THEN verb$ = verb60$
IF verbno = 61 THEN verb$ = verb61$
IF verbno = 62 THEN verb$ = verb62$
IF verbno = 63 THEN verb$ = verb63$
IF verbno = 64 THEN verb$ = verb64$
IF verbno = 65 THEN verb$ = verb65$
IF verbno = 66 THEN verb$ = verb66$
IF verbno = 67 THEN verb$ = verb67$
IF verbno = 68 THEN verb$ = verb68$
IF verbno = 69 THEN verb$ = verb69$
IF verbno = 70 THEN verb$ = verb70$
IF verbno = 71 THEN verb$ = verb71$
IF verbno = 72 THEN verb$ = verb72$
IF verbno = 73 THEN verb$ = verb73$
IF verbno = 74 THEN verb$ = verb74$
IF verbno = 75 THEN verb$ = verb75$
IF verbno = 76 THEN verb$ = verb76$
IF verbno = 77 THEN verb$ = verb77$
IF verbno = 78 THEN verb$ = verb78$
IF verbno = 79 THEN verb$ = verb79$
IF verbno = 80 THEN verb$ = verb80$
IF verbno = 81 THEN verb$ = verb81$
IF verbno = 82 THEN verb$ = verb82$
IF verbno = 83 THEN verb$ = verb83$
IF verbno = 84 THEN verb$ = verb84$
IF verbno = 85 THEN verb$ = verb85$
IF verbno = 86 THEN verb$ = verb86$
IF verbno = 87 THEN verb$ = verb87$
IF verbno = 88 THEN verb$ = verb88$
IF verbno = 89 THEN verb$ = verb89$
IF verbno = 90 THEN verb$ = verb90$
IF verbno = 91 THEN verb$ = verb91$
IF verbno = 92 THEN verb$ = verb92$
IF verbno = 93 THEN verb$ = verb93$
IF verbno = 94 THEN verb$ = verb94$
IF verbno = 95 THEN verb$ = verb95$
IF verbno = 96 THEN verb$ = verb96$
IF verbno = 97 THEN verb$ = verb97$
IF verbno = 98 THEN verb$ = verb98$
IF verbno = 99 THEN verb$ = verb99$
IF verbno = 100 THEN verb$ = verb100$

IF thingno = 1 THEN thing$ = thing1$
IF thingno = 2 THEN thing$ = thing2$
IF thingno = 3 THEN thing$ = thing3$
IF thingno = 4 THEN thing$ = thing4$
IF thingno = 5 THEN thing$ = thing5$
IF thingno = 6 THEN thing$ = thing6$
IF thingno = 7 THEN thing$ = thing7$
IF thingno = 8 THEN thing$ = thing8$
IF thingno = 9 THEN thing$ = thing9$
IF thingno = 10 THEN thing$ = thing10$
IF thingno = 11 THEN thing$ = thing11$
IF thingno = 12 THEN thing$ = thing12$
IF thingno = 13 THEN thing$ = thing13$
IF thingno = 14 THEN thing$ = thing14$
IF thingno = 15 THEN thing$ = thing15$
IF thingno = 16 THEN thing$ = thing16$
IF thingno = 17 THEN thing$ = thing17$
IF thingno = 18 THEN thing$ = thing18$
IF thingno = 19 THEN thing$ = thing19$
IF thingno = 20 THEN thing$ = thing20$
IF thingno = 21 THEN thing$ = thing21$
IF thingno = 22 THEN thing$ = thing22$
IF thingno = 23 THEN thing$ = thing23$
IF thingno = 24 THEN thing$ = thing24$
IF thingno = 25 THEN thing$ = thing25$
IF thingno = 26 THEN thing$ = thing26$
IF thingno = 27 THEN thing$ = thing27$
IF thingno = 28 THEN thing$ = thing28$
IF thingno = 29 THEN thing$ = thing29$
IF thingno = 30 THEN thing$ = thing30$
IF thingno = 31 THEN thing$ = thing31$
IF thingno = 32 THEN thing$ = thing32$
IF thingno = 33 THEN thing$ = thing33$
IF thingno = 34 THEN thing$ = thing34$
IF thingno = 35 D“˜ÁÈ[™’`ðDŒ!s¸´mä–„%L%0rA–'‘u 4LV(,€JÐS˜`Éð
IF thingno = 42 THEN thing$ = thing42$
IF thingno = 43 THEN thing$ = thing43$
IF thingno = 44 THEN thing$ = thing44$
IF thingno = 45 THEN thing$ = thing45$
IF thingno = 46 THEN thing$ = thing46$
IF thingno = 47 THEN thing$ = thing47$
IF thingno = 48 THEN thing$ = thing48$
IF thingno = 49 THEN thing$ = thing49$
IF thingno = 50 THEN thing$ = thing50$
IF thingno = 51 THEN thing$ = thing51$
IF thingno = 52 THEN thing$ = thing52$
IF thingno = 53 THEN thing$ = thing53$
IF thingno = 54 THEN thing$ = thing54$
IF thingno = 55 THEN thing$ = thing55$
IF thingno = 56 THEN thing$ = thing56$
IF thingno = 57 THEN thing$ = thing57$
IF thingno = 58 THEN thing$ = thing58$
IF thingno = 59 THEN thing$ = thing59$
IF thingno = 60 THEN thing$ = thing60$
IF thingno = 61 THEN thing$ = thing61$
IF thingno = 62 THEN thing$ = thing62$
IF thingno = 63 THEN thing$ = thing63$
IF thingno = 64 THEN thing$ = thing64$
IF thingno = 65 THEN thing$ = thing65$
IF thingno = 66 THEN thing$ = thing66$
IF thingno = 67 THEN thing$ = thing67$
IF thingno = 68 THEN thing$ = thing68$
IF thingno = 69 THEN thing$ = thing69$
IF thingno = 70 THEN thing$ = thing70$
IF thingno = 71 THEN thing$ = thing71$
IF thingno = 72 THEN thing$ = thing72$
IF thingno = 73 THEN thing$ = thing73$
IF thingno = 74 THEN thing$ = thing74$
IF thingno = 75 THEN thing$ = thing75$
IF thingno = 76 THEN thing$ = thing76$
IF thingno = 77 THEN thing$ = thing77$
IF thingno = 78 THEN thing$ = thing78$
IF thingno = 79 THEN thing$ = thing79$
IF thingno = 80 THEN thing$ = thing80$
IF thingno = 81 THEN thing$ = thing81$
IF thingno = 82 THEN thing$ = thing82$
IF thingno = 83 THEN thing$ = thing83$
IF thingno = 84 THEN thing$ = thing84$
IF thingno = 85 THEN thing$ = thing85$
IF thingno = 86 THEN thing$ = thing86$
IF thingno = 87 THEN thing$ = thing87$
IF thingno = 88 THEN thing$ = thing88$
IF thingno = 89 THEN thing$ = thing89$
IF thingno = 90 THEN thing$ = thing90$
IF thingno = 91 THEN thing$ = thing91$
IF thingno = 92 THEN thing$ = thing92$
IF thingno = 93 THEN thing$ = thing93$
IF thingno = 94 THEN thing$ = thing94$
IF thingno = 95 THEN thing$ = thing95$
IF thingno = 96 THEN thing$ = thing96$
IF thingno = 97 THEN thing$ = thing97$
IF thingno = 98 THEN thing$ = thing98$
IF thingno = 99 THEN thing$ = thing99$
IF thingno = 100 THEN thing$ = thing100$

INPUT "C:\>", prompt$
IF prompt$ = "I am a dummy" THEN GOTO Finished
PRINT "May a " + adj$ + " " + noun$ + " " + verb$ + " " + "your" + " " + thing$ + "!"
curse$ = "May a " + adj$ + " " + noun$ + " " + verb$ + " " + "your" + " " + thing$ + "!"

PRINT #1, ""
PRINT #1, curse$
PRINT ""
GOTO 1

Finished:
CLOSE

