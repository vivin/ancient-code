CLS
INPUT "Enter name1:", name1$
INPUT "Enter name2:", name2$
INPUT "Enter name3:", name3$
INPUT "Enter name4:", name4$
INPUT "Enter name5:", name5$
INPUT "Enter name6:", name6$
INPUT "Enter verb1:", verb1$
INPUT "Enter verb2:", verb2$
INPUT "Enter verb3:", verb3$
INPUT "Enter verb4:", verb4$
INPUT "Enter verb5:", verb5$
INPUT "Enter verb6:", verb6$
INPUT "Enter adjective1:", adj1$
INPUT "Enter adjective2:", adj2$
INPUT "Enter adjective3:", adj3$
INPUT "Enter adjective4:", adj4$
INPUT "Enter adjective5:", adj5$
INPUT "Enter adjective6:", adj6$
1 nno = INT(RND * 6) + 1
n2no = INT(RND * 6) + 1
vno = INT(RND * 6) + 1
ano = INT(RND * 6) + 1
IF nno = 1 THEN name$ = name1$
IF nno = 2 THEN name$ = name2$
IF nno = 3 THEN name$ = name3$
IF nno = 4 THEN name$ = name4$
IF nno = 5 THEN name$ = name5$
IF nno = 6 THEN name$ = name6$

IF vno = 1 THEN verb$ = verb1$
IF vno = 2 THEN verb$ = verb2$
IF vno = 3 THEN verb$ = verb3$
IF vno = 4 THEN verb$ = verb4$
IF vno = 5 THEN verb$ = verb5$
IF vno = 6 THEN verb$ = verb6$

IF ano = 1 THEN adj$ = adj1$
IF ano = 2 THEN adj$ = adj2$
IF ano = 3 THEN adj$ = adj3$
IF ano = 4 THEN adj$ = adj4$
IF ano = 5 THEN adj$ = adj5$
IF ano = 6 THEN adj$ = adj6$

IF n2no = 1 THEN nameX$ = name1$
IF n2no = 2 THEN nameX$ = name2$
IF n2no = 3 THEN nameX$ = name3$
IF n2no = 4 THEN nameX$ = name4$
IF n2no = 5 THEN nameX$ = name5$
IF n2no = 6 THEN nameX$ = name6$

PRINT name$, verb$, adj$, nameX$
PLAY "p7"
GOTO 1







