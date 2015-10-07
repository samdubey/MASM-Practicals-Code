code segment
assume cs:code
start:
       mov cx,0026
       mov bl,41h
   l1: chrout bl
       chrout 20h
       inc    bl
       loop   l1
       chrout 0dh
       chrout 0ah
       mov    bl,30h
       mov    cx,0ah
   l2: chrout bl
       inc    bl
       chrout 20h
       loop   l2
code ends
end  start


