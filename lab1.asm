# Assembler
;   (2*c/a-d*d)/(d+a-1)
     
org 100h
     
.Data
a dw -2
c dw -1
d dw -4
res dw 0
.Code

mov ax,c
mov bx,2
imul bx
mov bx,a
cwd
idiv bx  
mov cx, ax   
mov ax,d
mov bx,d   
imul bx 
mov bx,ax
mov ax,cx
sub ax,bx   
mov bx,d
add bx,a
sub bx,1
cwd
idiv bx
mov res,ax 
ret
