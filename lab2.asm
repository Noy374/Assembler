# Assembler
;a/b-1 |a<b
;25-a  |a=b
;(b-5)/a |a>b
org 100h

.data
a dw -8
b dw 2
res dw 0
.code
mov ax,a
mov bx,b
cmp ax,bx

jl l
jg h

;a = b
mov bx,ax
mov ax,25
sub ax,bx
jmp short exit

;a > b
l: 
cwd
idiv bx
sub ax,1
jmp short exit

;a < b
h:
mov ax,bx
sub ax,5
mov bx,a          
cwd
idiv bx
jmp short exit



exit:
mov res, ax
ret
