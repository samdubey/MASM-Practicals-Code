;TO SORT THE GIVEN NO (BUBBLE SORT)

include tyio.lib

data segment
        mess1 db 'Enter length   $'
        mess2 db 'Enter string   $'
        mess3 db 'Sorted string  $'
        length db (?)
        string db 100 dup (?)
data ends

code segment
        assume cs: code, ds:data
start:  mov ax, data
        mov ds,ax
        display mess1
        call hexno
        mov [length],al
        nextln
        display mess2
        mov bl,[length]
        mov si, offset STRING
l2:     call hexno
        chrout 20h
        mov [si],al
        inc si
        dec bl
        jnz l2
        nextln
        display mess3
        mov bl,[length]
        mov bh,00
        dec bx
outlup: mov cx, bx
        mov si, offset string
inloop: mov al, [si]
        inc si
        cmp al, [si]
        jb goon
        xchg al, [si]
        mov [si-1], al
goon:   loop inloop
        dec bx
        jnz outlup
        mov si, offset string
        mov bl, [LENGTH]
l31:    call hexdisplay
        chrout 20h
        inc si
        dec bl
        jnz l31
        int 3

hexno proc near
        call ascin
        mov cl,04
        ror al,cl
        mov bh,al
        call ascin
        or al,bh
        mov cl,04
        ror al,cl
        ret
hexno endp

ascin proc near
l44:    mov ah, 08h
        int 21h
        cmp al,'0'
        jl l44
        cmp al,'9'
        jle next
        cmp al,'A'
        jb l44
        cmp al,'F'
        jg l44
next:   chrout al
        sub al,'0'
        cmp al,9
        jle l22
        sub al,7
l22:    mov cl,04h
        ror al,cl
	ret
ascin endp

hexdisplay proc near
        mov dl,[si]
        and dl,0f0h
        mov cl,04h
        ror dl,cl
        cmp dl,0ah
        jb l4
        add dl,07h
l4:     add dl,30h
        chrout dl
        mov dl,[si]
        and dl,0fh
        cmp dl,0ah
        jb l5
        add dl,07h
l5:     add dl,30h
        chrout dl
        ret
hexdisplay endp

int 3

code ends
end start
-----------------------------------------------
Enter length  07
Enter string  40 15 3 2 1 4 26 
Sorted string 1 2 3 4 15 26 40  