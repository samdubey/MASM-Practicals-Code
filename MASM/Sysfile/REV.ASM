;PROGRAME TO REVERSE THE STRING

include tyio.lib

data segment
   mess1 db'ENTER STRING $'
   mess2 db'REVERSE OF STRING $'
data ends
lifo segment stack
     dw 32 dup(0)
     lifo ends
code segment
    assume cs:code,ds:data,ss:lifo
    start: mov ax,data
           mov ds,ax
           screenclr
           curset 0600h
           display mess1
           mov bl,20h
           mov cx,0000
    l1:    inc cx
           push bx
           inpchr bl
           cmp bl,0dh
           jne l1
    rev:   curset 0700h
           nextln
           display mess2
    l2:    pop bx
           chrout bl
           loop l2
           mov ah,4ch
           int 21h
code ends
end start
----------------------------------------
ENTER STRING CSBYT
REVERSE OF STRING TYBSC