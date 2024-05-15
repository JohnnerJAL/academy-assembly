section .data
    msg db "Ingrese el primer número: ", 0
    msg2 db "Ingrese el segundo número: ", 0
    result_msg db "El resultado de la suma es: ", 0
    newline db 10, 0

section .bss
    number1 resb 255        ; Reserva espacio para almacenar el primer número ingresado (hasta 255 caracteres)
    number2 resb 255        ; Reserva espacio para almacenar el segundo número ingresado (hasta 255 caracteres)
    result resb 1           ; Reserva espacio para almacenar el resultado de la suma

section .text
    global _start

_start:
    ; Mostrar el mensaje para ingresar el primer número
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 27   ; Longitud del mensaje
    int 0x80

    ; Leer el primer número ingresado
    mov eax, 3
    mov ebx, 0
    mov ecx, number1
    mov edx, 255  ; Longitud máxima del número a leer
    int 0x80

    ; Mostrar el mensaje para ingresar el segundo número
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, 28   ; Longitud del mensaje
    int 0x80

    ; Leer el segundo número ingresado
    mov eax, 3
    mov ebx, 0
    mov ecx, number2
    mov edx, 255  ; Longitud máxima del número a leer
    int 0x80

    ; Convertir los números ingresados a valores enteros
    mov al, [number1]    ; Cargar el primer dígito en AL
    sub al, '0'          ; Convertir de ASCII a valor entero
    mov bl, [number2]    ; Cargar el segundo dígito en BL
    sub bl, '0'          ; Convertir de ASCII a valor entero
    add al, bl           ; Sumar los dos dígitos
    add al, '0'          ; Convertir el resultado a ASCII

    ; Guardar el resultado en el buffer result
    mov [result], al

    ; Mostrar el resultado de la suma
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 29   ; Longitud del mensaje incluyendo el carácter nulo
    int 0x80

    ; Escribir el resultado
    mov eax, 4
    mov ebx, 1
    mov ecx, result  ; Cargar la dirección del buffer que contiene el resultado
    mov edx, 1      ; Cargar la cantidad de bytes a escribir (1 byte para un solo carácter)
    int 0x80

    ; Imprimir nueva línea
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Salir del programa
    mov eax, 1
    xor ebx, ebx
    int 0x80
