Regsave         macro
                Push ax
                Push bx
                Push cx
                Push dx
                Push si
                Push di
Endm

Regrestore      macro
                Pop di
                Pop si
                Pop dx
                Pop cx
                Pop bx
                Pop ax
Endm

Screenclr       macro
                Regsave
                Mov     ax,0600H
                Mov     dx,184fh
                Mov     cx,0000
                Mov     bh,07
                Int     10h
                Regrestore
Endm                

Curset          macro   rc
                Regsave
                Mov dx,rc
                Mov ah,02h
                Int 10h
                Regrestore
Endm

Chrout  macro   chr
                Regsave
                Mov ah,02h
                Mov dl,chr
                Int 21h
                Regrestore
Endm

Display macro   mess
                Regsave
                mov dx,offset mess
                mov ah,09h
                Int 21h
                Regrestore
Endm

Chrin macro    chr
               mov ah,01h
               Int 21h
               mov chr,al
Endm

Stringin macro buffer
               Regsave
               mov ah,0ah
               mov dx,offset buffer
               Int 21h
               Regrestore
Endm

Nextln  macro
                CHROUT 0ah
                CHROUT 0dh
Endm

