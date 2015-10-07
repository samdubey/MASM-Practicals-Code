       ;PROGRAM TO WRITE A TO Z ON ONE LINE WITH ONE SPACE

INCLUDE TYIO.LIB

         DATA SEGMENT
         DB 20 DUP(0)
         DATA ENDS
         LIFO SEGMENT STACK
         DW 32 DUP(0)
         LIFO ENDS
         CODE SEGMENT
         ASSUME CS:CODE,DS:DATA,SS:LIFO
START:   MOV AX,DATA
         MOV DS,AX
         SCREENCLR
         CURSET 0D00H
         MOV BL,'A'
L2:      MOV CX,000AH
L1:      MOV DL,BL
         CHROUT DL
         INC BL
         CMP BL,'Z'
         JG EXIT
         MOV DL, 20H
         CHROUT DL
         LOOP L1
         MOV DL,0DH
         CHROUT DL
         MOV DL,0AH
         CHROUT DL
         JLE L2
EXIT:    INT 21H
CODE ENDS
END START
---------------------------------------------------

A B C D E F G H I J
K L M N O P Q R S T
U V W X Y Z                  
