  ;PROGRAM TO WRITE A TO Z ON ONE LINE AND 0 TO 9 ON NEXT LINE

INCLUDE TYIO.LIB

DATA SEGMENT
         DB 20 DUP(0)
DATA ENDS

LIFO SEGMENT STACK
         DW 32 DUP(0)
LIFO ENDS

CODE SEGMENT
         ASSUME CS:CODE,DS:DATA,SS:LIFO
START: MOV AX,DATA
         MOV DS,AX
         SCREENCLR
         CURSET 0D00H
         MOV CX,4
         MOV BL,41H
AGAIN: CHROUT BL
         INC BL
         DEC CX
         CHROUT 20H
         CMP CX,0
         CMP BL,'Z'
         JLE AGAIN
         MOV BL,30H
         NEXTLN
NAGAIN: CHROUT BL
         CHROUT 20H
         INC BL
         CMP BL,39H
         JLE NAGAIN
         MOV AH,4CH
         INT 21H
CODE ENDS
END START
---------------------------------------------------