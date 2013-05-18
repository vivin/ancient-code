

DECLARE SUB demo2 ()

DECLARE SUB demo3 ()

DECLARE SUB demo4 ()

DECLARE FUNCTION low.getstring$ ()

DECLARE FUNCTION low.movestring$ ()

DECLARE FUNCTION low.getsubarray$ ()

DECLARE FUNCTION low.setelement$ ()

DECLARE FUNCTION low.getelement$ ()

DECLARE FUNCTION COPYVID13$ ()

DECLARE FUNCTION low.movewords$ ()

DECLARE SUB demo ()

DECLARE FUNCTION low.free$ ()

DECLARE SUB low.dealloc (es%)

DECLARE SUB low.alloc (bx%)

DECLARE SUB demo1 (free%)

'This demoprogram will show some DOS memory uses that you can easily do





demo



                                      



END



SUB demo

CLS

demo1 free%



IF free% > 64000 \ 16 THEN demo2: demo3

IF free% > 10000 \ 16 THEN demo4

CLS

PRINT "This is the end of the DOS memory demo: if you want to move bigger "

PRINT "strings or array's at once you have to use the EMS or XMS move"

PRINT "functions in some later article i will adress those functions. "

PRINT

PRINT "Good bye"







END SUB



SUB demo1 (free%)

'------------

'initiating:

'------------

dosfree$ = low.free$



'Lets first get the free dosmemory after BASIC is done

'------------------------------------------------------

DEF SEG = VARSEG(dosfree$): codeoff% = SADD(dosfree$)

CALL absolute(bx%, codeoff%)

PRINT "DEMO 1 DOS FREE MEMORY AND ALLOCATING DEALLOCATING DOS MEM"

PRINT STRING$(80, "_")

IF bx% THEN PRINT "Low memory free in para's( bytes)       :"; bx%; "("; 16& * bx%; ")" ELSE PRINT "No free DOS memory to demonstrate ..exiting..": END

free% = bx%



'Second lets allocate and deallocate a bit

'-----------------------------------------

DIM dealloc%(3)

es% = &HFFF

low.alloc es%: dealloc%(0) = es%

es% = 1: low.alloc es%: dealloc%(1) = es%

es% = 1: low.alloc es%: dealloc%(2) = es%

FOR i% = 0 TO 2: es% = dealloc%(i%): low.dealloc es%: NEXT



PRINT

PRINT "Press a key for next demo": SLEEP: CLS











END SUB



SUB demo2

'Initiating:

'-----------

moveW$ = low.movewords$:



'DEMO 2 let us move an array

'---------------------------

LOCATE 10, 1: PRINT STRING$(80, "_")

LOCATE 11, 1: PRINT "DEMO 2: MOVING A 64 KB ARRAY TO DOS AND BACK AGAIN"

COLOR 0, 7: LOCATE 12, 1: PRINT "Initializing array in BASIC"

COLOR 7, 0: VIEW PRINT 15 TO 22

DIM datas%(32000): FOR i% = 0 TO 32000 - 1: datas%(i%) = i%: PRINT datas%(i%); : NEXT



basseg% = VARSEG(datas%(0)): basoff% = VARPTR(datas%(0))

es% = 64000 \ 16: VIEW PRINT

low.alloc es%: dosseg% = es%



LOCATE 12, 1: COLOR 0, 7: PRINT "Moved 64 KB array to DOS:  BASIC array is free!"

DEF SEG = VARSEG(moveW$): codeoff% = SADD(moveW$)

CALL absolute(basseg%, basoff%, es%, 0, 32000, codeoff%)



LOCATE 13, 1: PRINT "64 KB Array given other values in BASIC: "

COLOR 7, 0: VIEW PRINT 15 TO 22

FOR i% = 0 TO 32000 - 1: datas%(i%) = -1: PRINT datas%(i%); : NEXT

VIEW PRINT



COLOR 0, 7: LOCATE 12, 1: PRINT "64 KB Array back from DOS with old values     ": COLOR 7, 0

PRINT SPACE$(45)

codeoff% = SADD(moveW$)

CALL absolute(dosseg%, 0, basseg%, basoff%, 32000, codeoff%)

DEF SEG



COLOR 7, 0: VIEW PRINT 15 TO 22

FOR i% = 0 TO 32000 - 1: PRINT datas%(i%); : NEXT

VIEW PRINT: LOCATE 2, 1



low.dealloc dosseg%





PRINT : PRINT "Press a key for next demo": SLEEP: CLS





END SUB



SUB demo3



'Initializing:

'---------------

moveW$ = low.movewords$: setelement$ = low.setelement$:

getelement$ = low.getelement$: subarray$ = low.getsubarray$:





'DEMO 3 Let us access array elements in DOS

'------------------------------------------

LOCATE 10, 1: PRINT STRING$(80, "_")

LOCATE 11, 1: PRINT "DEMO 3: MOVING A 64 KB ARRAY TO DOS AND GETTING ELEMENTS\ SETTING ELEMENTS"

COLOR 0, 7: LOCATE 12, 1: PRINT "Initializing array in BASIC"

COLOR 7, 0: VIEW PRINT 15 TO 22

DIM datas%(32000): FOR i% = 0 TO 32000 - 1: datas%(i%) = i%: PRINT datas%(i%); : NEXT



basseg% = VARSEG(datas%(0)): basoff% = VARPTR(datas%(0))

es% = 64000 \ 16

VIEW PRINT

low.alloc es%: dosseg% = es%

LOCATE 12, 1: COLOR 0, 7: PRINT "Moved 64 KB array to DOS:  BASIC array is free!"

COLOR 7, 0

DEF SEG = VARSEG(moveW$): codeoff% = SADD(moveW$)

CALL absolute(basseg%, basoff%, es%, 0, 32000, codeoff%)



offcode% = SADD(getelement$)

nr% = 456  'lets get this number

CALL absolute(dosseg%, 0, bas%, nr%, offcode%)

VIEW PRINT: LOCATE 2, 1: PRINT "The element "; : COLOR 0, 7: PRINT nr%; :

COLOR 7, 0: PRINT " has the value of      : "; : COLOR 0, 7: PRINT bas%

COLOR 7, 0



'Let us change this element oke ?

offcode% = SADD(setelement$): chgbas% = -1: bas% = chgbas%'let us give it -1

CALL absolute(dosseg%, 0, bas%, nr%, offcode%)

PRINT "The element "; : COLOR 0, 7: PRINT nr%; :

COLOR 7, 0: PRINT " changing to value     : "; : COLOR 0, 7: PRINT chgbas%

COLOR 7, 0



offcode% = SADD(getelement$)

nr% = 456  'lets get this number

CALL absolute(dosseg%, 0, bas%, nr%, offcode%)

PRINT "The element "; : COLOR 0, 7: PRINT nr%; :

COLOR 7, 0: PRINT " has now the value of  : "; : COLOR 0, 7: PRINT bas%

COLOR 7, 0



'Is looking good so far, not ?

'---------------------------------------------------------------------

'Let us move on with defining a subarray in BASIC with values from DOS

'---------------------------------------------------------------------

PRINT "Getting BASIC subarray "; : COLOR 0, 7: PRINT "[0..9]"; :

COLOR 7, 0: PRINT " from DOSarray "; : COLOR 0, 7: PRINT "[455.. 464]"

codeoff% = SADD(subarray$): dosoff% = (456 * 2) - 2  'let us get 10 elements offset 456

CALL absolute(dosseg%, dosoff%, basseg%, basoff%, 10, codeoff%)

COLOR 7, 0: PRINT "The subarray "; : COLOR 0, 7: PRINT "0.. 10"; :

COLOR 7, 0: PRINT " has now the values :":

COLOR 0, 7: FOR i% = 0 TO 10: PRINT datas%(i%); : NEXT

COLOR 7, 0: PRINT :



low.dealloc dosseg%



LOCATE 24, 1: PRINT "Press a key for next demo": SLEEP: CLS



END SUB



SUB demo4



'Initializing:

'--------------

movestring$ = low.movestring$: getstring$ = low.getstring$:

'--------------------------------------------

'DEMO 4 Let us access string elements in DOS

'--------------------------------------------

LOCATE 10, 1: PRINT STRING$(80, "_")

LOCATE 11, 1: PRINT "DEMO 4: MOVING AN 10 KB STRING TO DOS AND GETTING\ SETTING PARTS OF IT"

COLOR 0, 7: LOCATE 12, 1: PRINT "Initializing string in BASIC"

COLOR 7, 0: VIEW PRINT 15 TO 22



'Let us initialize the string

STATIC a$: FOR i% = 0 TO 10: a$ = a$ + STRING$(1000, CHR$(65 + i%)): NEXT

basseg% = VARSEG(a$): basoff% = SADD(a$)



VIEW PRINT 15 TO 22: PRINT LEFT$(a$, 100):



es% = 10000 / 16: VIEW PRINT: low.alloc es%: dosseg% = es%

LOCATE 12, 1: COLOR 0, 7: PRINT "Moved 10 KB string to DOS:  BASIC string is free!"

COLOR 7, 0



'Let us move the string to DOS

DEF SEG = VARSEG(movestring$): codeoff% = SADD(movestring$): es% = dosseg%

CALL absolute(basseg%, basoff%, es%, 0, 10000, codeoff%)



'Let us move a part back to BASIC

LOCATE 12, 1: COLOR 0, 7:

PRINT "Get the part of the string from 1995 to 2005:"; : COLOR 7, 0: PRINT SPACE$(10)

b$ = SPACE$(10): codeoff% = SADD(getstring$)    'get chars 1995 to 2005

VIEW PRINT 15 TO 22

CALL absolute(es%, 1995, VARSEG(b$), SADD(b$), 10, codeoff%)

CLS 2: LOCATE 15, 1: PRINT b$





VIEW PRINT: LOCATE 23, 1: PRINT "Press a key to change the last ten bytes of the DOSstring to ";

COLOR 0, 7: PRINT b$: COLOR 7, 0

PRINT "and get the whole string back in BASIC": SLEEP

'Let us set some stringbytes

codeoff% = SADD(movestring$): es% = dosseg%

CALL absolute(VARSEG(b$), SADD(b$), es%, 9990, 10, codeoff%)



VIEW PRINT: COLOR 0, 7: LOCATE 12, 1: PRINT "Get the whole string back to BASIC";

COLOR 7, 0: PRINT SPACE$(11)

a$ = SPACE$(10000): codeoff% = SADD(getstring$)

CALL absolute(es%, 0, VARSEG(a$), SADD(a$), 10000, codeoff%)

VIEW PRINT 15 TO 22: CLS 2: LOCATE 15, 1: PRINT a$

PRINT "Last character at byte "; LEN(a$); " is a character : "; RIGHT$(a$, 1)

DEF SEG

'Is looking good so far, not ?

VIEW PRINT: LOCATE 2, 1

low.dealloc dosseg%

VIEW PRINT 23 TO 24: CLS 2

LOCATE 24, 1: PRINT "Press a key" + SPACE$(50): VIEW PRINT: SLEEP: CLS



END SUB



SUB low.alloc (bx%)

'-------------------------------------------------------------------

'This function allocates lower memory

'STACK PASSING :AX%,BX%

'

'IN            :BX%= number of para's to allocate

'

'OUT           :AX%= startsegment or error

'              :BX%= if error=8 then available memory

'              :QBASIC: AX%=0 then success, else  errorcode

'                       BX%=startsegment or number of segments available

nralloc$ = HEX$(bx%)

'---------------------------------------------------------------------

asm$ = asm$ + CHR$(&H55)                                    'push bp

asm$ = asm$ + CHR$(&H89) + CHR$(&HE5)                       'mov bp,sp

asm$ = asm$ + CHR$(&H50)                                    'push ax

asm$ = asm$ + CHR$(&H53)                                    'push bx



asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H6)           'mov bx,[bp+06]

asm$ = asm$ + CHR$(&H8B) + CHR$(&H1F)                       'mov bx,[bx]

asm$ = asm$ + CHR$(&HB4) + CHR$(&H48)                       'mov ah,48

asm$ = asm$ + CHR$(&HCD) + CHR$(&H21)                       'int 21



asm$ = asm$ + CHR$(&H72) + CHR$(&H2)                        'jc +2

asm$ = asm$ + CHR$(&H31) + CHR$(&HDB)                       'XOR bX,bX if no error

asm$ = asm$ + CHR$(&H50)                                    'push ax  preserve

asm$ = asm$ + CHR$(&H89) + CHR$(&HD8)                       'mov ax,bx

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H8)           'mov bx,[bp+08]

asm$ = asm$ + CHR$(&H89) + CHR$(&H7)                        'mov [bx],ax 0=no error

asm$ = asm$ + CHR$(&H58)                                    'pop ax

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H6)           'mov bx,[bp+06]

asm$ = asm$ + CHR$(&H89) + CHR$(&H7)                        'mov [bx],ax seg or error



asm$ = asm$ + CHR$(&H5B)                                    'pop bx

asm$ = asm$ + CHR$(&H58)                                    'pop ax

asm$ = asm$ + CHR$(&H5D)                                    'pop bp

asm$ = asm$ + CHR$(&HCA) + CHR$(&H4) + CHR$(&H0)            'retf 4

'________________________________________

codeoff% = SADD(asm$)

DEF SEG = VARSEG(asm$)

CALL absolute(ax%, bx%, codeoff%)

'________________________________________

DEF SEG

IF ax% THEN

PRINT "Error allocating memory "; bx%; " Available memory (para's) "; HEX$(ax%)

ELSE

PRINT "Allocated "; STRING$(4 - LEN(nralloc$), "0") + nralloc$; " para's at segment(hex)   : "; HEX$(bx%)

END IF





END SUB



SUB low.dealloc (es%)

'-------------------------------------------------------------------

'This function de allocates lower memory

'STACK PASSING :ES%

'

'IN            :ES%= segment of block to de_allocate

'

'OUT           :AX%= errorcode

'              :QBASIC: ES%=errorcode

segm% = es%

'---------------------------------------------------------------------

asm$ = asm$ + CHR$(&H55)                                    'push bp

asm$ = asm$ + CHR$(&H89) + CHR$(&HE5)                       'mov bp,sp

asm$ = asm$ + CHR$(&H50)                                    'push ax

asm$ = asm$ + CHR$(&H6)                                     'push es



asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H6)           'mov bx,[bp+06]

asm$ = asm$ + CHR$(&H8E) + CHR$(&H7)                        'mov es,[bx]

asm$ = asm$ + CHR$(&HB4) + CHR$(&H49)                       'mov ah,49

asm$ = asm$ + CHR$(&HCD) + CHR$(&H21)                       'int 21

asm$ = asm$ + CHR$(&H72) + CHR$(&H2)                        'jb +2

asm$ = asm$ + CHR$(&H31) + CHR$(&HC0)                       'XOR aX,aX if no error

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H6)           'mov bx,[bp+08]

asm$ = asm$ + CHR$(&H89) + CHR$(&H7)                        'mov [bx],ax 0=no error





asm$ = asm$ + CHR$(&H7)                                     'pop es

asm$ = asm$ + CHR$(&H58)                                    'pop ax

asm$ = asm$ + CHR$(&H5D)                                    'pop bp

asm$ = asm$ + CHR$(&HCA) + CHR$(&H2) + CHR$(&H0)            'retf 2

'________________________________________

codeoff% = SADD(asm$)

DEF SEG = VARSEG(asm$)

CALL absolute(es%, codeoff%)

'________________________________________

DEF SEG

IF es% THEN PRINT "Error deallocating memory "; es% ELSE PRINT "Sucses deallocating memory from segment : "; HEX$(segm%)





END SUB



FUNCTION low.free$

'-------------------------------------------------------------------

'This function allocates lower memory

'STACK PASSING :BX%

'

'IN            :BX%= FFFF whole MB requested<g>

'

'OUT           :BX%= 0 or available memory



'---------------------------------------------------------------------

asm$ = ""

asm$ = asm$ + CHR$(&H55)                                    'push bp

asm$ = asm$ + CHR$(&H89) + CHR$(&HE5)                       'mov bp,sp

asm$ = asm$ + CHR$(&H50)                                    'push ax

asm$ = asm$ + CHR$(&H53)                                    'push bx



asm$ = asm$ + CHR$(&HBB) + CHR$(&HFF) + CHR$(&HFF)          'mov bx,ffff the whole MB

asm$ = asm$ + CHR$(&HB4) + CHR$(&H48)                       'mov ah,48

asm$ = asm$ + CHR$(&HCD) + CHR$(&H21)                       'int 21



asm$ = asm$ + CHR$(&H72) + CHR$(&H2)                        'jc +2

asm$ = asm$ + CHR$(&H31) + CHR$(&HDB)                       'XOR bX,bX if no error

asm$ = asm$ + CHR$(&H89) + CHR$(&HD8)                       'mov ax,bx

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H6)           'mov bx,[bp+06]

asm$ = asm$ + CHR$(&H89) + CHR$(&H7)                        'mov [bx],ax 0=no error



asm$ = asm$ + CHR$(&H5B)                                    'pop bx

asm$ = asm$ + CHR$(&H58)                                    'pop ax

asm$ = asm$ + CHR$(&H5D)                                    'pop bp

asm$ = asm$ + CHR$(&HCA) + CHR$(&H2) + CHR$(&H0)            'retf 2

low.free$ = asm$



END FUNCTION



FUNCTION low.getelement$

'-------------------------------------------------------

'This function gets an element of an DOSarray.



'STACKPASSING :DS%,SI%,BAS%,AX%



'IN           :DS[SI] = source    DOSarray

'              BAS    = destiny   BASvar

'              AX     = elementnumber



'OUT          :



'-------------------------------------------------------



'PUSHA

asm$ = ""

asm$ = asm$ + CHR$(&H55)                         'PUSH BP

asm$ = asm$ + CHR$(&H89) + CHR$(&HE5)            'MOV BP,SP

asm$ = asm$ + CHR$(&H56)                         'PUSH si

asm$ = asm$ + CHR$(&H1E)                         'PUSH ds

'number of bytes

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H6)'MOV BX,[BP+06]

asm$ = asm$ + CHR$(&H8B) + CHR$(&H7)             'MOV ax,[BX]

asm$ = asm$ + CHR$(&HD1) + CHR$(&HE0)            'SHL AX,1 element relative adress

'source

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&HA)'MOV BX,[BP+0a]

asm$ = asm$ + CHR$(&H8B) + CHR$(&H37)            'MOV si,[BX]

asm$ = asm$ + CHR$(&H1) + CHR$(&HC6)             'ADD si,ax si=offset+nradress

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&HC)'MOV BX,[BP+0c]

asm$ = asm$ + CHR$(&H8E) + CHR$(&H1F)            'MOV dS,[BX]

'alons y

asm$ = asm$ + CHR$(&HFC)                         'CLD

asm$ = asm$ + CHR$(&HAD)                         'LODSW

asm$ = asm$ + CHR$(&H1F)                         'pop ds

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H8)'MOV BX,[BP+08]

asm$ = asm$ + CHR$(&H89) + CHR$(&H7)             'MOV [BX],ax



'POPA

asm$ = asm$ + CHR$(&H5E)                         'POP si

asm$ = asm$ + CHR$(&H5D)                         'pop bp

'RETF

asm$ = asm$ + CHR$(&HCA) + CHR$(&H8) + CHR$(&H0) 'retf 8



low.getelement$ = asm$







END FUNCTION



FUNCTION low.getstring$

'-------------------------------------------------------

'This function returns a substring from DOS to BASIC.



'STACKPASSING :DS%,SI%,ES%,DI%,CX%



'IN           :DS[SI] = source SI points to first byte to get( 0 based)

'              ES[DI] = destiny BASIC

'              CX     = number of bytes to get (1 based)



'OUT          :



'-------------------------------------------------------



'PUSHA

asm$ = ""

asm$ = asm$ + CHR$(&H55)                         'PUSH BP

asm$ = asm$ + CHR$(&H89) + CHR$(&HE5)            'MOV BP,SP

asm$ = asm$ + CHR$(&H1E)                         'PUSH ds

asm$ = asm$ + CHR$(&H6)                          'PUSH es

asm$ = asm$ + CHR$(&H56)                         'PUSH si

asm$ = asm$ + CHR$(&H57)                         'PUSH di

'number of bytes

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H6)'MOV BX,[BP+06]

asm$ = asm$ + CHR$(&H8B) + CHR$(&HF)             'MOV cx,[BX]

asm$ = asm$ + CHR$(&H89) + CHR$(&HCA)            'MOV dx,cx 'need a copy of cx

asm$ = asm$ + CHR$(&HD1) + CHR$(&HE9)            'SHR cx,1 'divide by 2

'destiny: DOS memory                                

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H8)'MOV BX,[BP+08]

asm$ = asm$ + CHR$(&H8B) + CHR$(&H3F)            'MOV di,[BX]

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&HA)'MOV BX,[BP+0a]

asm$ = asm$ + CHR$(&H8E) + CHR$(&H7)             'MOV ES,[BX]

'source : BASIC memory

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&HC)'MOV BX,[BP+0c]

asm$ = asm$ + CHR$(&H8B) + CHR$(&H37)            'MOV si,[BX]

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&HE)'MOV BX,[BP+0e]

asm$ = asm$ + CHR$(&H8E) + CHR$(&H1F)            'MOV dS,[BX]

'alons y

asm$ = asm$ + CHR$(&HFC)                         'CLD

asm$ = asm$ + CHR$(&HF2) + CHR$(&HA5)            'REPNZ MOVSW 'moves cx words from DS[SI] to ES[DI]

asm$ = asm$ + CHR$(&HF6) + CHR$(&HC2) + CHR$(&H1)'TEST DL,1 is there a last byte ?

asm$ = asm$ + CHR$(&H74) + CHR$(&H1)             'No ? Jmp over JZ 1

asm$ = asm$ + CHR$(&HA4)                         'MOVSB 'last byte



'POPA

asm$ = asm$ + CHR$(&H5F)                         'POP di

asm$ = asm$ + CHR$(&H5E)                         'pop si

asm$ = asm$ + CHR$(&H7)                          'pop es

asm$ = asm$ + CHR$(&H1F)                         'pop ds

asm$ = asm$ + CHR$(&H5D)                         'pop bp

'RETF

asm$ = asm$ + CHR$(&HCA) + CHR$(&HA) + CHR$(&H0) 'retf a



low.getstring$ = asm$



END FUNCTION



FUNCTION low.getsubarray$

'-------------------------------------------------------

'This function moves a subarray from DOS to BASIC.

'It will move an even number of bytes around.



'STACKPASSING :DS%,SI%,ES%,DI%,CX%



'IN           :DS[SI] = source SI points to first element to get

'              ES[DI] = destiny BASIC

'              CX     = number of elements to get



'OUT          :



'-------------------------------------------------------



'PUSHA

asm$ = ""

asm$ = asm$ + CHR$(&H55)                         'PUSH BP

asm$ = asm$ + CHR$(&H89) + CHR$(&HE5)            'MOV BP,SP

asm$ = asm$ + CHR$(&H1E)                         'PUSH ds

asm$ = asm$ + CHR$(&H6)                          'PUSH es

asm$ = asm$ + CHR$(&H56)                         'PUSH si

asm$ = asm$ + CHR$(&H57)                         'PUSH di

'number of bytes

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H6)'MOV BX,[BP+06]

asm$ = asm$ + CHR$(&H8B) + CHR$(&HF)             'MOV cx,[BX]

asm$ = asm$ + CHR$(&HD1) + CHR$(&HE1)            'SHL CX,1 element relative adress

'destiny: DOS memory                                  

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H8)'MOV BX,[BP+08]

asm$ = asm$ + CHR$(&H8B) + CHR$(&H3F)            'MOV di,[BX]

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&HA)'MOV BX,[BP+0a]

asm$ = asm$ + CHR$(&H8E) + CHR$(&H7)             'MOV ES,[BX]

'source : BASIC memory

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&HC)'MOV BX,[BP+0c]

asm$ = asm$ + CHR$(&H8B) + CHR$(&H37)            'MOV si,[BX]

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&HE)'MOV BX,[BP+0e]

asm$ = asm$ + CHR$(&H8E) + CHR$(&H1F)            'MOV dS,[BX]

'alons y

asm$ = asm$ + CHR$(&HFC)                         'CLD

asm$ = asm$ + CHR$(&HF2) + CHR$(&HA5)            'REPNZ MOVSW 'moves cx words from DS[SI] to ES[DI]



'POPA

asm$ = asm$ + CHR$(&H5F)                         'POP di

asm$ = asm$ + CHR$(&H5E)                         'pop si

asm$ = asm$ + CHR$(&H7)                          'pop es

asm$ = asm$ + CHR$(&H1F)                         'pop ds

asm$ = asm$ + CHR$(&H5D)                         'pop bp

'RETF

asm$ = asm$ + CHR$(&HCA) + CHR$(&HA) + CHR$(&H0) 'retf a



low.getsubarray$ = asm$



END FUNCTION



FUNCTION low.movestring$

'-------------------------------------------------------

'This function moves stringblocks around in lowmemory.

'It can be used to move a block from BASIC to DOS and

'back. It moves bytes (for strings, string and byte types)



'STACKPASSING :DS%,SI%,ES%,DI%,CX%



'IN           :DS[SI] = source

'              ES[DI] = destiny

'              CX     = number of bytes to move



'OUT          :

'-------------------------------------------------------

'PUSHA

asm$ = ""

asm$ = asm$ + CHR$(&H55)                         'PUSH BP

asm$ = asm$ + CHR$(&H89) + CHR$(&HE5)            'MOV BP,SP

asm$ = asm$ + CHR$(&H1E)                         'PUSH ds

asm$ = asm$ + CHR$(&H6)                          'PUSH es

asm$ = asm$ + CHR$(&H56)                         'PUSH si

asm$ = asm$ + CHR$(&H57)                         'PUSH di

'number of words

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H6)'MOV BX,[BP+06]

asm$ = asm$ + CHR$(&H8B) + CHR$(&HF)             'MOV cx,[BX]

asm$ = asm$ + CHR$(&H89) + CHR$(&HCA)            'MOV dx,cx 'need a copy of cx

asm$ = asm$ + CHR$(&HD1) + CHR$(&HE9)            'SHR cx,1 'divide by 2

'destiny                                      

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H8)'MOV BX,[BP+08]

asm$ = asm$ + CHR$(&H8B) + CHR$(&H3F)            'MOV di,[BX]

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&HA)'MOV BX,[BP+0a]

asm$ = asm$ + CHR$(&H8E) + CHR$(&H7)             'MOV ES,[BX]

'source

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&HC)'MOV BX,[BP+0c]

asm$ = asm$ + CHR$(&H8B) + CHR$(&H37)            'MOV si,[BX]

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&HE)'MOV BX,[BP+0e]

asm$ = asm$ + CHR$(&H8E) + CHR$(&H1F)            'MOV dS,[BX]

'alons y

asm$ = asm$ + CHR$(&HFC)                         'CLD

asm$ = asm$ + CHR$(&HF2) + CHR$(&HA5)            'REPNZ MOVSW

asm$ = asm$ + CHR$(&HF6) + CHR$(&HC2) + CHR$(&H1)'TEST DL,1 is there a last byte ?

asm$ = asm$ + CHR$(&H74) + CHR$(&H1)             'No ? Jmp over JZ 1

asm$ = asm$ + CHR$(&HA4)                         'MOVSB 'last byte



'POPA

asm$ = asm$ + CHR$(&H5F)                         'POP di

asm$ = asm$ + CHR$(&H5E)                         'pop si

asm$ = asm$ + CHR$(&H7)                          'pop es

asm$ = asm$ + CHR$(&H1F)                         'pop ds

asm$ = asm$ + CHR$(&H5D)                         'pop bp

'RETF

asm$ = asm$ + CHR$(&HCA) + CHR$(&HA) + CHR$(&H0) 'retf a



low.movestring$ = asm$



END FUNCTION



FUNCTION low.movewords$

'-------------------------------------------------------

'This function moves memoryblocks around in lowmemory.

'It can be used to move a block from BASIC to DOS and

'back. It moves words( for integers and arrays,integer types)



'STACKPASSING :DS%,SI%,ES%,DI%,CX%



'IN           :DS[SI] = source

'              ES[DI] = destiny

'              CX     = number of words to move



'OUT          :



'-------------------------------------------------------



'PUSHA

asm$ = ""

asm$ = asm$ + CHR$(&H55)                         'PUSH BP

asm$ = asm$ + CHR$(&H89) + CHR$(&HE5)            'MOV BP,SP

asm$ = asm$ + CHR$(&H1E)                         'PUSH ds

asm$ = asm$ + CHR$(&H6)                          'PUSH es

asm$ = asm$ + CHR$(&H56)                         'PUSH si

asm$ = asm$ + CHR$(&H57)                         'PUSH di

'number of words

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H6) 'MOV BX,[BP+06]

asm$ = asm$ + CHR$(&H8B) + CHR$(&HF)              'MOV cx,[BX]

'destiny                                          

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H8)'MOV BX,[BP+08]

asm$ = asm$ + CHR$(&H8B) + CHR$(&H3F)            'MOV di,[BX]

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&HA)'MOV BX,[BP+0a]

asm$ = asm$ + CHR$(&H8E) + CHR$(&H7)             'MOV ES,[BX]

'source

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&HC)'MOV BX,[BP+0c]

asm$ = asm$ + CHR$(&H8B) + CHR$(&H37)            'MOV si,[BX]

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&HE)'MOV BX,[BP+0e]

asm$ = asm$ + CHR$(&H8E) + CHR$(&H1F)            'MOV dS,[BX]

'alons y

asm$ = asm$ + CHR$(&HFC)                         'CLD

asm$ = asm$ + CHR$(&HF2) + CHR$(&HA5)            'REPNZ MOVSW



'POPA

asm$ = asm$ + CHR$(&H5F)                         'POP di

asm$ = asm$ + CHR$(&H5E)                         'pop si

asm$ = asm$ + CHR$(&H7)                          'pop es

asm$ = asm$ + CHR$(&H1F)                         'pop ds

asm$ = asm$ + CHR$(&H5D)                         'pop bp

'RETF

asm$ = asm$ + CHR$(&HCA) + CHR$(&HA) + CHR$(&H0) 'retf a



low.movewords$ = asm$





END FUNCTION



FUNCTION low.setelement$

'-------------------------------------------------------

'This function sets an element of a DOSarray.



'STACKPASSING :ES%,DI%,BAS%,AX%



'IN           :ES[DI] = destiny   DOSarray

'              BAS    = source    BASvar

'              AX     = elementnumber



'OUT          :



'-------------------------------------------------------



'PUSHA

asm$ = ""

asm$ = asm$ + CHR$(&H55)                         'PUSH BP

asm$ = asm$ + CHR$(&H89) + CHR$(&HE5)            'MOV BP,SP

asm$ = asm$ + CHR$(&H6)                          'PUSH es

asm$ = asm$ + CHR$(&H57)                         'PUSH di

'Relative offset in array

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H6)'MOV BX,[BP+06]

asm$ = asm$ + CHR$(&H8B) + CHR$(&H7)             'MOV ax,[BX]

asm$ = asm$ + CHR$(&HD1) + CHR$(&HE0)            'SHL AX,1 element relative adress

'Destiny

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&HA)'MOV BX,[BP+0a]

asm$ = asm$ + CHR$(&H8B) + CHR$(&H3F)            'MOV di,[BX]

asm$ = asm$ + CHR$(&H1) + CHR$(&HC7)             'ADD di,ax si=offset+nradress

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&HC)'MOV BX,[BP+0c]

asm$ = asm$ + CHR$(&H8E) + CHR$(&H7)             'MOV eS,[BX]

'Source

asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H8)'MOV BX,[BP+08]

asm$ = asm$ + CHR$(&H8B) + CHR$(&H7)             'MOV ax,[bx]

'Alons y

asm$ = asm$ + CHR$(&HFC)                         'CLD

asm$ = asm$ + CHR$(&HAB)                         'STOSW



'POPA

asm$ = asm$ + CHR$(&H5F)                         'POP di

asm$ = asm$ + CHR$(&H7)                          'pop es

asm$ = asm$ + CHR$(&H5D)                         'pop bp

'RETF

asm$ = asm$ + CHR$(&HCA) + CHR$(&H8) + CHR$(&H0) 'retf 8



low.setelement$ = asm$





END FUNCTION



