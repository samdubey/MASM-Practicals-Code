;MULTIPLY BY 8 WITHOUT USING 'MUL' INSTRUCTION & SEE THE RESULT IN DEBUG

INCLUDE TYIO.LIB

CODE SEGMENT
ASSUME CS:CODE
START:     SCREENCLR
   L1:     MOV AH,08H
           INT 21H
           CMP AL,0DH
           CMP AL,'0'
           JL L1
           CMP AL,'9'
           JLE NEXT
           CMP AL,'A'
           JL L1
           CMP AL,'F'
           JL L1
   NEXT:   CHROUT AL
           SUB AL,'0'
           CMP AL,9H
           JLE NEXT1
           SUB AL,7H
   NEXT1:  ADD AL,AL
           ADD AL,AL
           ADD AL,AL
           INT 3H
CODE ENDS
END START
