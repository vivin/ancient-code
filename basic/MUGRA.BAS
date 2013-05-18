CLS
COLOR 12
PRINT "This is Mugra Virus!!"
PRINT "In 3 seconds, your computer is going to be vaporized!!"
FOR i = 3 TO 1 STEP -1
LOCATE 4, 1
PRINT "T minus"; i; "seconds"
SLEEP 1
NEXT i
LOCATE 6, 1
PRINT "Formatting hardisk..."
FOR i = 0 TO 99
LOCATE 7, 1
PRINT i; "% complete"
FOR j = 1 TO 1000
NEXT j
NEXT i
LOCATE 7, 1
PRINT "Format complete."
COLOR 7
LOCATE 9, 1
PRINT "Re-initializing system..."
PRINT "[Error] Cannot find boot sector"
PRINT "[Error] Cannot find partition table"
PRINT "[Error] Cannot find CHIPSET"
PRINT "[Error] Cannot find FAT"
PRINT "Resetting system..."
PRINT "Initializing Chipset"
FOR i = 21 TO 80
LOCATE 15, i
PRINT "."
FOR j = 1 TO 1500
NEXT j
NEXT i
PRINT "Initialization attempt has failed."
PRINT "Returning to operating system..."
1 PRINT "Bad or missing Command Interpreter"
INPUT "C>", a$
IF a$ = "I LOVE YOU!" THEN END ELSE 1


