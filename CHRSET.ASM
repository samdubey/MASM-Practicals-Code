;PRINT THE COMPLETE CHARACTER SET

INCLUDE TYIO.LIB

DATA SEGMENT
         DB 20 DUP(0)
         MESS DB 'THE COMPLETE CHARACTER SET IS $'
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
         DISPLAY MESS
         NEXTLN
         MOV BL,21H
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
EXIT:   NEXTLN
        MOV AH,4CH
        INT 21H
CODE ENDS
END START
--------------------------------
THE COMPLETE CHARACTER SET IS
! " # $ % & ' ( ) *
+ , - . / 0 1 2 3 4
5 6 7 8 9 : ; < = >
? @ A B C D E F G H
I J K L M N O P Q R
S T U V W X Y Z
