;print the complete character set
include tyio.lib
data segment
 db 20 dup(0)
 mess db 'the complent charset is $'
data ends
lifo segment stack
 dw 32 dup(0)
 lifo ends
code segment
 assume cs:code,ds:data,ss:lifo
start: mov ax,data
       mov ds,ax
       clrscr
       curset 0d00h
       display mess
       nextln
       mov bl,21h


