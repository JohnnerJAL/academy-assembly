section .data
    name db "Johnner Gambacica", 0
    id db "1*********", 0
    breakLine db 10, 0

section .text
    global _start

_start:
    ; Mostrar el nombre
    mov eax, 4         ; syscall número 4: write (escribir en la consola)
    mov ebx, 1         ; descriptor de archivo: stdout (salida estándar)
    mov ecx, name      ; dirección de la cadena a escribir (nombre)
    mov edx, 17        ; longitud de la cadena
    int 0x80           ; realizar la llamada al sistema

    ; Mostrar un salto de línea
    mov eax, 4         ; syscall número 4: write
    mov ebx, 1         ; descriptor de archivo: stdout
    mov ecx, breakLine   ; dirección de la cadena de salto de línea
    mov edx, 2         ; longitud de la cadena (1 byte)
    int 0x80           ; realizar la llamada al sistema

    ; Mostrar el número de identificación
    mov eax, 4         ; syscall número 4: write
    mov ebx, 1         ; descriptor de archivo: stdout
    mov ecx, id        ; dirección de la cadena a escribir (identificación)
    mov edx, 12        ; longitud de la cadena
    int 0x80           ; realizar la llamada al sistema

    ; Salir del programa
    mov eax, 1         ; syscall número 1: exit (salir del programa)
    xor ebx, ebx       ; código de salida 0
    int 0x80           ; realizar la llamada al sistema
