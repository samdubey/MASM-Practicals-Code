INCLUDE TYIO.LIB
CODE SEGMENT
ASSUME CS:CODE
START:  MOV BL,41H
    L1: MOV CX,000AH
    L2: CHROUT BL
        CHROUT 20H
        INC BL
        CMP BL,'Z'
        JA STOP
        LOOP L2
        CHROUT 0DH
        CHROUT 0AH
        LOOP L1
  STOP: MOV AH,4CH
        INT 21H
  CODE ENDS
  END START

