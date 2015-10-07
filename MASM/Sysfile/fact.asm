;ENTER SINGLE DIGIT HEX N AND FIND MIN OF IT
INCLUDE TYIO.LIB

DATA SEGMENT
        NUM EQU 5
        MESS1 DB 'Factorial of is $'
        ASCRES DB 4 DUP(?),'H','$'
        RES DW ?
        HEXCODE DB '0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F'
DATA ENDS
LIFO SEGMENT
     DW 32 DUP(0)
LIFO ENDS
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA,SS:LIFO
  HEX2ASCII PROC
        MOV SI,OFFSET HEXCODE
        MOV AH,00
        MOV BX,00
        MOV DL,10H
        DIV DL
        MOV BL,AL
        MOV DH,[SI][BX]
        MOV BL,AL
        MOV DL,[SI][BX]
        RET
        HEX2ASCII ENDP

  FACT PROC
        CMP AX,01
        JE EXIT
        PUSH AX
        DEC AX
        CALL FACT
        POP AX
        MUL RES
        RET
 EXIT: MOV RES,01
        RET
 START: MOV AX,DATA
        MOV DS,AX
        MOV AX,NUM
        CALL FACT
        MOV AX,RES+1
        CALL HEX2ASCII
        MOV ASCRES+1,DH
        MOV ASCRES+1,DL
        MOV AX,RES
        CALL HEX2ASCII
        MOV ASCRES+2,DH
        MOV ASCRES+3,DL
        MOV AH,09
        MOV DX,OFFSET MESS1      
        CHROUT DL
        MOV AH,4CH
        INT 21H
CODE ENDS
END START
