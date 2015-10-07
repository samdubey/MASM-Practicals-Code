include tyio.lib
data segment
    mess1 db 'Enter string1:  $'
    mess2 db 'Enter string2:  $'
    mess3 db 'String are equal  $'
    mess4 db 'Strings are not equal  $'
   string1 db 100 dup(' ')
   string2 db 100 dup(' ')
data ends
lifo segment stack
        dw 32 dup(0)
lifo ends

code segment
    assume es:data,cs:code,ds:data,ss:lifo
start:  mov ax,data
        mov ds,ax
        mov es,ax
        screenclr
        curset 00dh
        display mess1
        inpstring string1
        curset 010dh
        display mess2
        inpstring string2
        mov si,offset string1
        mov di,offset string2
        cld
        inc si
        inc di
        mov cl,[si]
        mov ch,00h
        repe cmpsb
        jnz next
        curset 020dh
        display mess3
        mov ah,4ch
        int 21h
next:   curset 020dh
        display mess4
        mov ah,4ch
        int 21h
code ends
end start

             Enter string1:  TYBSC
             Enter string2:  tybsc
             Strings are not equal
