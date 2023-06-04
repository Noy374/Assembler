# Assembler
;1 byte
;nayti skolko polozhitelnix ,otritsatelnix 
;i nulevix elementov v massive
;uslovie:  c<=a[i]<=d
     
.model small
.stack 100h

.data

array db 5, 7, -9, 10, -3, 30,-2,7,0,0,12    
msg1 db 10,13,"Positive(c<=a[i]<=d): $"       
msg2 db 10,13,"Negative(c<=a[i]<=d): $"
msg3 db 10,13,"Zero(c<=a[i]<=d): $"    
c db -8
d db 8
size dw 11

positive dw 0
negative dw 0
zero dw 0

.code
start:
  mov ax, @data
  mov ds, ax

  mov si, 0
  mov di, 0
  mov cx, size

  cicle:
    mov al, array[di]
    cmp al, c
    jl next
    cmp d, al
    jl next
    cmp al, 0 
    je zero_check
    jg positive_check
    jmp negative_check

  zero_check:
    inc zero
    jmp next

  positive_check:
    inc positive
    jmp next

  negative_check:
    inc negative
    jmp next
    
  next:
    inc di
    inc si
    loop cicle
  
  
  lea dx,msg1 
    mov ah,09h 
    int 21h
    
  mov ax,positive
  aam 
    add ax,3030h 
    mov dl,ah 
    mov dh,al 
    mov ah,02 
    int 21h 
    mov dl,dh 
    int 21h  
  
  mov dx,0x0A  
    int 21h
  
  lea dx,msg2 
    mov ah,09h 
    int 21h
        
    mov ax,negative
  aam 
    add ax,3030h 
    mov dl,ah 
    mov dh,al 
    mov ah,02 
    int 21h 
    mov dl,dh 
    int 21h 
    
    
    mov dx,0x0A  
    int 21h 
    
    lea dx,msg3 
    mov ah,09h 
    int 21h 
    
    mov ax,zero
  aam 
    add ax,3030h 
    mov dl,ah 
    mov dh,al 
    mov ah,02 
    int 21h 
    mov dl,dh 
    int 21h   
    
    
  mov ax, 4c00h
  int 21h

end start
