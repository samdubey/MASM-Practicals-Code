;LOWER TO UPPER 
INCLUDE TYIO.LIB
DATA SEGMENT
             ENTER DW 32 DUP(' ')
             MESS1 DB 'ENTER STRING $'
             MESS2 DB 'CHANGED $'
DATA ENDS
LIFO SEGMENT  STACK
             DW 32 DUP(0)
             LIFO ENDS
             CODE SEGMENT
             ASSUME CS: CODE, DS:DATA, SS:LIFO
      START: MOV AX, DATA
             MOV DS,AX
             SCREENCLR
             CURSET 0600H
             DISPLAY MESS1
             INPSTRING ENTER
             CURSET 0700H
             DISPLAY MESS2
             LEA BX,[BX]
             ADD BX,2
      AGAIN: MOV DL,[BX]
             CMP DL,0DH
             JE STOP
             CMP DL,'a'
             JB SCR
             CMP DL,'z'
             JA SCR
    SCR:     SUB DL,20H
             CHROUT DL
             INC BX
             JNZ AGAIN
      STOP:  MOV AH,4CH
             INT 21H
CODE ENDS
END START
------------------------------------
ENTER STRING tybsc
CHANGED TYBSC
