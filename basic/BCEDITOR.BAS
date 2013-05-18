CLS
OPEN "CONFIG.BCC" FOR INPUT AS #1
INPUT #1, pathtosave$
INPUT #1, pathcompiler$
CLOSE #1
1 CLS
SCREEN 0
LOCATE 1, 18
PRINT "Borland C++ 5.0 Compiler and Source File Editor"
LOCATE 2, 18
PRINT "-----------------------------------------------"
LOCATE 6, 22
PRINT "[a] Enter/Edit source code"
LOCATE 8, 22
PRINT "[b] Compile and Link source code to .EXE file"
LOCATE 10, 22
PRINT "[c] Run"
LOCATE 12, 22
PRINT "[d] Configure"
LOCATE 14, 22
PRINT "[e] Exit"
2 y$ = INKEY$
m$ = LCASE$(y$)
IF m$ = "a" THEN GOTO EditSource
IF m$ = "b" THEN GOTO CompileSource
IF m$ = "c" THEN GOTO Runprog
IF m$ = "d" THEN GOTO Configure
IF m$ = "e" THEN GOTO EndIt ELSE GOTO 2

EditSource:
LOCATE 16, 5
COLOR 28
PRINT "Enter filename only. If you wish to modify the default path use configure."
COLOR 7
LOCATE 19, 1
PRINT "Do you wish to continue(Y/N):"
3 x$ = INKEY$
y$ = LCASE$(x$)
IF y$ = "y" THEN GOTO AcceptSource
IF y$ = "n" THEN GOTO 1 ELSE GOTO 3

AcceptSource:
4 CLS
INPUT "Enter name of source file:", sfn$
IF LEN(sfn$) > 8 THEN BEEP: GOTO 4
source$ = "edit" + " " + CHR$(34) + pathtosave$ + sfn$ + ".cpp" + CHR$(34)
SHELL source$
GOTO 1

CompileSource:
LOCATE 16, 5
COLOR 28
PRINT "Enter filename only. If you wish to modify the default path use configure."
COLOR 7
LOCATE 19, 1
PRINT "Do you wish to continue(Y/N):"
5 x$ = INKEY$
y$ = LCASE$(x$)
IF y$ = "y" THEN GOTO AcceptCompile
IF y$ = "n" THEN GOTO 1 ELSE GOTO 5

AcceptCompile:
6 CLS
INPUT "Enter name of source file:", sfn$
IF LEN(sfn$) > 8 THEN BEEP: GOTO 4
compile$ = pathcompiler$ + "bcc" + " " + CHR$(34) + pathtosave$ + sfn$ + ".cpp" + CHR$(34)
SHELL compile$
movetosave$ = "move" + " " + sfn$ + ".*" + " " + pathtosave$
DO
LOOP WHILE INKEY$ = ""
SHELL movetosave$
RUN

Runprog:
LOCATE 16, 5
COLOR 28
PRINT "Enter filename only. If you wish to modify the default path use configure."
PRINT "          Type Exit after running program as you are in a program shell."
COLOR 7
LOCATE 19, 1
PRINT "Do you wish to continue(Y/N):"
7 x$ = INKEY$
y$ = LCASE$(x$)
IF y$ = "y" THEN GOTO AcceptRunFile
IF y$ = "n" THEN GOTO 1 ELSE GOTO 7
                                  
AcceptRunFile:
8 CLS
INPUT "Enter name of .EXE file:", sfn$
IF LEN(sfn$) > 8 THEN BEEP: GOTO 8
Runfile$ = pathtosave$ + sfn$
SHELL Runfile$
DO
LOOP WHILE INKEY$ = ""
RUN

Configure:
CLS
COLOR 4
PRINT "This  is the utility  to edit  the configuration  file for  the  location of thecompiler and the path to which you wish to save your files."
PRINT ""
PRINT "!!WARNING!! If you don't know what you  are  doing I suggest you Exit. Tamperingwith this may result  in you  not being  able  to compile your programs and yourfiles may not be saved properly."
PRINT ""
PRINT "The configuration file, and the editor must be in the same directory."
PRINT "If the configuration file doesn't exist, a default one will be created."

9 m$ = INKEY$
x$ = LCASE$(m$)
COLOR 7
LOCATE 11, 1
PRINT "Do you wish to continue(Y/N):", x$
IF x$ = "y" THEN GOTO AcceptConfigure
IF x$ = "n" THEN GOTO 1 ELSE GOTO 9
AcceptConfigure:
INPUT "Enter the path of the Borland C++ compiler (eg C:\bc5\bin\):", pathc$
INPUT "Enter the location to which you wish to save the files (eg C:\bc5\myfiles\:", pathfs$
OPEN "CONFIG.BCC" FOR OUTPUT AS #1
PRINT #1, pathfs$
PRINT #1, pathc$
CLOSE #1
RUN

EndIt:
END





