       ;PRGRAM TO WRITE A TO Z ON ONE SPACE
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
         MOV AH,4CH
         INT 21H
CODE ENDS
   END START
---------------------------------------------------
A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
