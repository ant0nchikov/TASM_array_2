;Найти количество неотрицательных элементов массива.
dseg segment para public 'data'
    mas db 10 dup (?)
	n dw ?
	count db ?
	mes1 db 'mas[$'
	mes2 db ']=$'
	mes3 db ' $'
	mes5 db 'The number of positive elements of the array = $'
	mes6 db 'Enter the dimension of the array: $'
	mes7 db 10,13,'$'
	mes8 db 'Enter Vector Elements$'
	mes9 db 10,13,'$'
	mes10 db ' $'
	mes11 db 'No positive elements!$'
dseg ends
sseg segment para stack 'stack'
    db 30 dup (0)
sseg ends
extrn vvod:near,disp:near
cseg segment para public 'code'
    osn proc near
	assume cs:cseg,ds:dseg,ss:sseg
	mov ax,dseg
	mov ds,ax
	mov ax,0002h
	int 10h
	lea dx,mes6
	mov ax,0900h
	int 21h
	call vvod
	lea dx,mes8
	mov ax,0900h
	int 21h
	lea dx,mes9 
	mov ax,0900h
	int 21h
	mov n,bx ;n
    mov cx,n
	mov si,0
	mov di,1
cikl1:
    lea dx,mes1 
	mov ax,0900h
	int 21h
	mov ax,di
	call disp
	lea dx,mes2 
	mov ax,0900h
	int 21h
	call vvod 
	mov mas[si],bl
	inc si
	inc di
    loop cikl1
	
	mov cx,n
	mov bl,0
	mov di,0
start:
	mov al,mas[di]
    cmp al,0
    jl met
	add bl,1
met:inc di
	loop start
    mov count,bl
	mov cx,n
	mov si,0
	
	cikld:
	mov al,mas[si]
	cbw
	call disp
	lea dx,mes10
	mov ax,0900h
	int 21h
	inc si
	loop cikld
	
	lea dx,mes9 
	mov ax,0900h
	int 21h
	cmp count,0
	je m1
	lea dx,mes5
    mov ax,0900h
	int 21h
	mov al,count
	cbw
	call disp
	jmp exit
m1: lea dx,mes11
    mov ax,0900h
	int 21h
exit:
	lea dx,mes7
	mov ax,0900h
	int 21h
	mov ax,4c00h
	int 21h
	osn endp
cseg ends
end osn  
