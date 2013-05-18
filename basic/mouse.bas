'MOUSE.BAS by Matt Bross
'Homepage - http://www.GeoCities.Com/SoHo/7067/
'Email    - oh_bother@GeoCities.Com
DEFINT A-Z
DECLARE SUB STARTMOUSE ()
DECLARE SUB SHOWMOUSE ()
DECLARE SUB GETMOUSECOORD (B%, X%, Y%)
DECLARE SUB MOUSEBOX (X1%, Y1%, X2%, Y2%)
DECLARE SUB HIDEMOUSE ()

SCREEN 13

STARTMOUSE
SHOWMOUSE
MOUSEBOX 0, 0, 320, 200

DO
GETMOUSECOORD B%, X%, Y%
LOCATE 1, 1: PRINT X%; Y%; B%
LOOP UNTIL B OR (INKEY$ <> "")

HIDEMOUSE

SUB GETMOUSECOORD (B%, X%, Y%)
ASM$ = ""                                         'GetMouseCoord:
ASM$ = ASM$ + CHR$(&H55)                          'push bp
ASM$ = ASM$ + CHR$(&H89) + CHR$(&HE5)             'mov bp,sp
ASM$ = ASM$ + CHR$(&HB8) + MKI$(3)                'mov ax,3
ASM$ = ASM$ + CHR$(&HCD) + CHR$(&H33)             'int 33h
ASM$ = ASM$ + CHR$(&H8B) + CHR$(&H46) + CHR$(&H6) 'mov ax,[bp+06]
ASM$ = ASM$ + CHR$(&H93)                          'xchg bx,ax
ASM$ = ASM$ + CHR$(&H89) + CHR$(&H7)              'mov [bx],ax
ASM$ = ASM$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H8) 'mov bx, [bp+08]
ASM$ = ASM$ + CHR$(&H89) + CHR$(&H17)             'mov [bx],dx
ASM$ = ASM$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&HA) 'mov bx,[bp+10]
ASM$ = ASM$ + CHR$(&H89) + CHR$(&HF)              'mov [bx],cx
ASM$ = ASM$ + CHR$(&H5D)                          'pop bp
ASM$ = ASM$ + CHR$(&HCA) + MKI$(6)                'retf 06

DEF SEG = VARSEG(ASM$)
  CALL absolute(X%, Y%, B%, SADD(ASM$))
DEF SEG

END SUB

SUB HIDEMOUSE
ASM$ = ""                                         'HideMouse:
ASM$ = ASM$ + CHR$(&HB8) + MKI$(2)                'mov ax,2
ASM$ = ASM$ + CHR$(&HCD) + CHR$(&H33)             'int 33h
ASM$ = ASM$ + CHR$(&HCB)                          'retf
DEF SEG = VARSEG(ASM$)
  CALL absolute(SADD(ASM$))
DEF SEG
END SUB

SUB MOUSEBOX (X1, Y1, X2, Y2)
ASM$ = ""                                         'MouseBox:
ASM$ = ASM$ + CHR$(&H55)                          'push bp
ASM$ = ASM$ + CHR$(&H89) + CHR$(&HE5)             'mov bp,sp
ASM$ = ASM$ + CHR$(&HB8) + MKI$(7)                'mov ax,7
ASM$ = ASM$ + CHR$(&H8B) + CHR$(&H4E) + CHR$(&H6) 'mov cx,[bp+06]
ASM$ = ASM$ + CHR$(&H8B) + CHR$(&H56) + CHR$(&H8) 'mov dx,[bp+08]
ASM$ = ASM$ + CHR$(&HCD) + CHR$(&H33)             'int 33h
ASM$ = ASM$ + CHR$(&H40)                          'inc ax
ASM$ = ASM$ + CHR$(&H8B) + CHR$(&H4E) + CHR$(&HA) 'mov cx,[bp+10]
ASM$ = ASM$ + CHR$(&H8B) + CHR$(&H56) + CHR$(&HC) 'mov dx,[bp+12]
ASM$ = ASM$ + CHR$(&HCD) + CHR$(&H33)             'int 33h
ASM$ = ASM$ + CHR$(&H5D)                          'pop bp
ASM$ = ASM$ + CHR$(&HCA) + MKI$(8)                'retf 08

DEF SEG = VARSEG(ASM$)
  CALL absolute(BYVAL Y2, BYVAL Y1, BYVAL X2, BYVAL X1, SADD(ASM$))
DEF SEG

END SUB

SUB SHOWMOUSE
ASM$ = ""                                         'ShowMouse:
ASM$ = ASM$ + CHR$(&HB8) + MKI$(1)                'mov ax,1
ASM$ = ASM$ + CHR$(&HCD) + CHR$(&H33)             'int 33h
ASM$ = ASM$ + CHR$(&HCB)                          'retf
DEF SEG = VARSEG(ASM$)
  CALL absolute(SADD(ASM$))
DEF SEG
END SUB

SUB STARTMOUSE
ASM$ = ""                                         'StartMouse:
ASM$ = ASM$ + CHR$(&H33) + CHR$(&HC0)             'xor ax,ax
ASM$ = ASM$ + CHR$(&HCD) + CHR$(&H33)             'int 33h
ASM$ = ASM$ + CHR$(&HCB)                          'retf
DEF SEG = VARSEG(ASM$)
  CALL absolute(SADD(ASM$))
DEF SEG
END SUB

