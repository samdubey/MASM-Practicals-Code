;name: PROGRAM TO FIND LARGEST NUMBER
INCLUDE TYIO.LIB
DATA SEGMENT
             MESS1 DB 'ENTER THE FIRST NUMBER $'
             MESS2 DB 'ENTER THE SECOND NUMBER $'
             MESS3 DB 'LARGEST NUMBER IS  $'
DATA ENDS
LIFO SEGMENT
             DW 32 DUP(0)
LIFO ENDS
CODE SEGMENT
             ASSUME CS:CODE, DS:DATA, SS:LIFO
        START: MOV AX, DATA
               MOV DS,AX
               SCREENCLR
               CURSET 0000H
               DISPLAY MESS1
           L1: INPCHR BL
               CURSET 0100H
               DISPLAY MESS2
               INPCHR BH
               CMP BL,0DH
               JL L1
               CMP BL,'O'
               JL L1
               CMP BL,'9'
               JLE TEST
               CMP BL,'A'
               JL L1
               CMP BL,'F'
               JLE TEST
               JLE L1
               CURSET 0200H
               DISPLAY MESS2
        TEST:  CMP BH,BL
               JG L1
               MOV BH,BL
               JLE L1
               JG L1
       RESULT: CHROUT BL
               MOV AH,4CH
               INT 21H
CODE ENDS
END START

