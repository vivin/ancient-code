INPUT "Enter Filename:"; N$
OPEN N$ + "SCR" FOR OUTPUT AS #1
INPUT "ENTER TEXT"; TXT$
PRINT #1, TXT$
CLOSE
OPEN N$ + "SCR" FOR INPUT AS #1
INPUT #1, A$
PRINT "Read from file:"; A$
CLOSE










