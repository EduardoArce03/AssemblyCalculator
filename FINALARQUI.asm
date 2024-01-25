.model tiny
.data
    input db 10,13, "Por favor, ingresar un numero: $"
    mensaje2 db 10,13, "Por favor, ingresar otro numero: $"
    resultadosuma db 10,13, "El resultado para suma es de: $"
    resultadoresta db 10,13, "El resultado para multiplicacion es de: $"
    resultadodivision db 10,13, "El resultado para la division es de: $"
    resultadomultiplicacion db 10,13, "El resultado para la resta es de: $"
    extra db 10,13, "y algo mas.... $"
    n1 db ?
    n2 db ?
    nr1 db ?
    nr2 db ?
    nr3 db ?
    nr4 db ?
    rm1 db ?
    rm2 db ?
    rm3 db ?
    rm4 db ?
    na db ?
    nb db ?
    aux db ?
    aux2 db ?
    aux3 db ?
    aux4 db ?
    aux5 db ?
    aux6 db ?
    residuo db ?
    residuo2 db ?
    m1 db ?
    m2 db ?
    m db ?
    x db ?
  
.code

    mov dx,OFFSET input
    mov ah,09h
    int 21h
    
    ;PRIMER NUMERO
    
    mov ah,01h
    int 21h
    sub al, 30h
    mov bl,al
    mov nr1, bl
    
    mov ah,01h
    int 21h
    sub al,30h
    mov cl,al
    mov nr2,cl
    
    ;SEGUNDO NUMERO
    
    mov dx,OFFSET input
    mov ah,09h
    int 21h
    
    mov ah,01h
    int 21h
    sub al,30h
    mov nr3, al
    add bl,al
    
    mov ah,01h
    int 21h
    sub al,30h
    mov nr4, al
    add cl,al
    
    ;Suma
    
    mov dx, OFFSET resultadosuma
    mov ah,09h
    int 21h
    
    mov ch,00h
    mov ax,cx
    aam
    
    mov x,al
    mov cl,ah
    mov ax,0
    
    mov al,nr1
    add al,nr3
    aaa
    add al,cl
    mov n1,ah
    mov n2,al
    
    mov ah,02h
    mov dl,n1
    add dl,30h
    int 21h
    
    mov ah,02h
    mov dl,n2
    add dl,30h
    int 21h
    
    mov ah,02h
    mov dl,x
    add dl,30h
    int 21h
    
    ;int 20h
    
    
    ;RESTA
    mov dx,OFFSET resultadomultiplicacion
    mov ah,09h
    int 21h
    
    mov cx,0
    mov ax,cx
    mov bx,ax
    mov dx,bx
    
    
    mov al,nr1
    mov bl,10
    mul bl
    mov bl,nr2
    add al,bl
    mov na,al
    
    mov al,nr3
    mov bl,10
    mul bl
    mov bl,nr4
    add al,bl
    mov nb,al
    
    mov al,na
    sub al,nb
    mov bl,10
    div bl
    mov m1,ah
    mov m2,al

    
    
    mov ah,02h
    mov dl,m2
    add dl,30h
    int 21h
    
    mov ah,02h
    mov dl,m1
    add dl,30h
    int 21h
    
    
    ;MULTIPLICACION     
    
    
    mov dx, OFFSET resultadoresta
    mov ah,09h
    int 21h
    
    mov ch,00h
    mov ax,cx
    mov bx,ax
    
    mov al, nr2
    mul nr4
    aam
    
    mov cx,ax
    mov rm1, cl
    mov residuo,ah 
    
    mov ax,00h
    mov al, nr1
    mul nr4
    aam
    
    add al, residuo
    mov aux,al
    mov aux2,ah
   
    mov ax,00h
    
    mov al, nr3
    mul nr2
    aam
    
    mov aux3, al
    mov residuo2,ah
    mov cx,00h
    mov ax,00h
    
    
    
    mov ah,00h
    mov al,nr1
    mul nr3
    aam
    mov aux5,ah
    
    mov aux4,al
    mov cl,residuo2
    
    add cl,al
    mov aux4,cl
    
    mov cx,00h
    mov ax,cx
    mov bx,ax
    
    mov al,aux
    add al,aux3
    aaa
    mov rm2,al
    mov residuo2,0
    mov residuo2,ah
    mov ax,0
    
    mov al,aux2
    add al,aux4
    
    aaa
    add al,residuo2
    mov rm3,al
    mov residuo2,ah
    mov cl,aux5
    add cl,residuo2
    mov rm4,cl
    
    mov ah,02h
    mov dl, rm4
    add dl,30h
    int 21h
    mov ah,02h
    mov dl, rm3
    add dl,30h
    int 21h
    mov ah,02h
    mov dl, rm2
    add dl,30h
    int 21h
    mov ah,02h
    mov dl, rm1
    add dl,30h
    int 21h
    
    ;DIVISION
    
   mov dx,OFFSET resultadodivision
    mov ah,09h
    int 21h
    
    mov cx,0
    mov ax,cx
    mov bx,ax
    mov dx,bx
    
    
    mov al,nr1
    mov bl,10
    mul bl
    mov bl,nr2
    add al,bl
    mov na,al
    
    mov al,nr3
    mov bl,10
    mul bl
    mov bl,nr4
    add al,bl
    mov nb,al
    
    mov al,na
    div nb
    mov ah,0
    mov bl,10
    div bl
    mov m1,ah
    mov m2,al
     
    
    mov ah,02h
    mov dl,m2
    add dl,30h
    int 21h
    mov ah,02h
    mov dl,m1
    add dl,30h
    int 21h
