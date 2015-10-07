;ENTER SINGLE DIGIT HEX N AND FIND MIN OF IT
INCLUDE TYIO.LIB
DATA SEGMENT
MESS1 DB 'ENTER THE NO 0 TO 9 AND A TO F $'
MESS2 DB 'MIN NO IS $ '
DATA ENDS
  LIFO SEGMENT
     DW 32 DUP(0)
  LIFO ENDS
      CODE SEGMENT
        ASSUME CS:CODE,DS:DATA,SS:LIFO
     START: MOV AX,DATA
            MOV DS,AX
            DISPLAY MESS1
            MOV AX,0FFH
     L1:    PUSH AX
            MOV AH,08H
            INT 21H
            MOV BL,AL
            POP AX
            CMP BL,0DH
            JZ L2
            CMP BL,'0'
            JL L1
            CMP BL,'9'
            JLE TEST
            CMP BL,'A'
            JL L1
            CMP BL,'F'
            JG L1
      TEST: CHROUT BL
            CMP AL,BL
            JL L1
            MOV AL,BL
            ;JG L1
            ;JLE L1
            JMP L1
       L2:  NEXTLN
            DISPLAY MESS2
            CHROUT AL
            MOV AH,4CH
            INT 21H
       CODE ENDS
       END START
